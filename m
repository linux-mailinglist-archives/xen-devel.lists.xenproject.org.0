Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6651E7C7D
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 14:00:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jedg6-0006pe-Gx; Fri, 29 May 2020 11:59:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jedg5-0006pZ-Dp
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 11:59:57 +0000
X-Inumbo-ID: e9962128-a1a3-11ea-81bc-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9962128-a1a3-11ea-81bc-bc764e2007e4;
 Fri, 29 May 2020 11:59:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2868EABBD;
 Fri, 29 May 2020 11:59:55 +0000 (UTC)
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
Date: Fri, 29 May 2020 13:59:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.05.2020 20:10, Andrew Cooper wrote:
> On 28/05/2020 11:25, Jan Beulich wrote:
>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/Kconfig
>>> +++ b/xen/arch/x86/Kconfig
>>> @@ -34,6 +34,10 @@ config ARCH_DEFCONFIG
>>>  config INDIRECT_THUNK
>>>  	def_bool $(cc-option,-mindirect-branch-register)
>>>  
>>> +config HAS_AS_CET
>>> +	# binutils >= 2.29 and LLVM >= 7
>>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
>> So you put me in a really awkward position: I'd really like to see
>> this series go in for 4.14, yet I've previously indicated I want the
>> underlying concept to first be agreed upon, before any uses get
>> introduced.
> 
> There are already users.  One of them is even in context.

Hmm, indeed. I clearly didn't notice this aspect when reviewing
Anthony's series.

> I don't see that there is anything open for dispute in the first place. 
> Being able to do exactly this was a one key driving factor to a newer
> Kconfig, because it is superior mechanism to the ad-hoc mess we had
> previously (not to mention, a vast detriment to build time).

This "key driving factor" was presumably from your perspective.
Could you point me to a discussion (and resulting decision) that
this is an explicit goal of that work? I don't recall any, and
hence I also don't recall having been given a chance in influence
the direction, decision, and overall outcome.

In the interest of getting this series in for 4.14, and on the
assumption that you're willing to have a discussion on the
direction wrt storing tool chain capabilities in .config before
any further uses get added (and with the potential need to undo
the ones we have / gain here)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

The comment at the very end may point at an issue that wants
sorting, the others below are merely replies to some of the
points you've made.

>> A fundamental problem with this, at least as long as (a) more of
>> Anthony's series hasn't been committed and (b) we re-build Xen upon
>> installing (as root), even if it was fully built (as non-root) and
>> is ready without any re-building.
> 
> How is any any of this relevant to Anthony's recent changes?

Command line options not getting written to .*.cmd and read back
and compare upon rebuild is the issue here. Albeit thinking
about it again for anything that's stored in .config that's
for now compensated for by a change to .config triggering a
global rebuild.

The specific issue I had run into was with XEN_BUILD_EFI changing
without xen.lds getting re-generated.

> You've always been asking for trouble if your `make` before `make
> install` has as different toolchain, even in regular autotools/userspace
> software.  The newer Kconfig logic might make this trouble far more
> obvious, but doesn't introduce the problem.

I disagree. There should be no dependency on the tool chain at
all at install time, with a fully built tree. It ought to be
fine to not even have a tool chain accessible to root, even
less so the precise one that was used for building the tree.

>>> --- a/xen/scripts/Kconfig.include
>>> +++ b/xen/scripts/Kconfig.include
>>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>>>  # Return y if the linker supports <flag>, n otherwise
>>>  ld-option = $(success,$(LD) -v $(1))
>>>  
>>> +# $(as-instr,<instr>)
>>> +# Return y if the assembler supports <instr>, n otherwise
>>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>> Is this actually checking the right thing in the clang case?
> 
> Appears to work correctly for me.  (Again, its either fine, or need
> bugfixing anyway for 4.14, and raising with Linux as this is unmodified
> upstream code like the rest of Kconfig.include).

This answer made me try it out: On a system with clang 5 and
binutils 2.32 "incsspd	%eax" translates fine with
-no-integrated-as but doesn't without. The previously mentioned
odd use of CLANG_FLAGS, perhaps together with the disconnect
from where we establish whether to use -no-integrated-as in the
first place (arch.mk; I have no idea whether the CFLAGS
determined would be usable by the kconfig invocation, nor how
to solve the chicken-and-egg problem there if this is meant to
work that way), may be the reason for this. Cc-ing Anthony once
again ...

As an aside - this being taken from Linux doesn't mean it's
suitable for our use. For example, Linux'es way to use (or not)
-no-integrated-as is entirely different from ours (via LLVM_IAS
setting, used in the top level Makefile). I don't think I can
see whether the check above, for the case at hand, would work
correctly there, both with and without that variable set.

Jan

