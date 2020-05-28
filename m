Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9321E6914
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 20:10:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeMyo-0001FX-54; Thu, 28 May 2020 18:10:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gT1p=7K=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jeMym-0001FS-PN
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 18:10:08 +0000
X-Inumbo-ID: 7615f470-a10e-11ea-a820-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7615f470-a10e-11ea-a820-12813bfff9fa;
 Thu, 28 May 2020 18:10:07 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:55224
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeMyi-000DnK-KH (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 28 May 2020 19:10:04 +0100
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
Date: Thu, 28 May 2020 19:10:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28/05/2020 11:25, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> Introduce CONFIG_HAS_AS_CET to determine whether CET instructions are
>> supported in the assembler, and CONFIG_XEN_SHSTK as the main build option.
>>
>> Introduce cet={no-,}shstk to for a user to select whether or not to use shadow
>> stacks at runtime, and X86_FEATURE_XEN_SHSTK to determine Xen's overall
>> enablement of shadow stacks.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> LLVM 6 supports CET-SS instructions while only LLVM 7 supports CET-IBT
>> instructions.  We'd need to split HAS_AS_CET into two if we want to support
>> supervisor shadow stacks with LLVM 6.  (This demonstrates exactly why picking
>> a handful of instructions to test is the right approach.)
> In this case I agree with splitting; I wasn't aware clang implemented
> the respective insns piecemeal.

I only became aware when trying Clang for v2.  I'll turn it into
HAS_AS_CET_SS, because the more I think about IBT, the more I think that
will need to be tied to the compiler, rather than the assembler.

>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -270,6 +270,23 @@ and not running softirqs. Reduce this if softirqs are not being run frequently
>>  enough. Setting this to a high value may cause boot failure, particularly if
>>  the NMI watchdog is also enabled.
>>  
>> +### cet
>> +    = List of [ shstk=<bool> ]
>> +
>> +    Applicability: x86
>> +
>> +Controls for the use of Control-flow Enforcement Technology.  CET is group of
> Nit: "... is a group of ..."

Oops.

>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -34,6 +34,10 @@ config ARCH_DEFCONFIG
>>  config INDIRECT_THUNK
>>  	def_bool $(cc-option,-mindirect-branch-register)
>>  
>> +config HAS_AS_CET
>> +	# binutils >= 2.29 and LLVM >= 7
>> +	def_bool $(as-instr,wrssq %rax$(comma)0;setssbsy;endbr64)
> So you put me in a really awkward position: I'd really like to see
> this series go in for 4.14, yet I've previously indicated I want the
> underlying concept to first be agreed upon, before any uses get
> introduced.

There are already users.  One of them is even in context.

I don't see that there is anything open for dispute in the first place. 
Being able to do exactly this was a one key driving factor to a newer
Kconfig, because it is superior mechanism to the ad-hoc mess we had
previously (not to mention, a vast detriment to build time).

> A fundamental problem with this, at least as long as (a) more of
> Anthony's series hasn't been committed and (b) we re-build Xen upon
> installing (as root), even if it was fully built (as non-root) and
> is ready without any re-building.

How is any any of this relevant to Anthony's recent changes?

You've always been asking for trouble if your `make` before `make
install` has as different toolchain, even in regular autotools/userspace
software.  The newer Kconfig logic might make this trouble far more
obvious, but doesn't introduce the problem.

> Each of these aspects means that
> what you've configured and built may not be what gets installed, by
> virtue of the tool chains differing. (a) in addition may lead to
> the install-time rebuild to actually go wrong, due to there being
> dependency tracking issues on at least {xen,efi}.lds (which I've
> noticed in a different context yesterday).

Again - how is any of this related to the recent changes?

Fundamentally, it is either no regression from 4.13, or already needs
bugfixing due to the existing users in 4.14.

Neither of these options affects this patch.

>> --- a/xen/scripts/Kconfig.include
>> +++ b/xen/scripts/Kconfig.include
>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>>  # Return y if the linker supports <flag>, n otherwise
>>  ld-option = $(success,$(LD) -v $(1))
>>  
>> +# $(as-instr,<instr>)
>> +# Return y if the assembler supports <instr>, n otherwise
>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
> Is this actually checking the right thing in the clang case?

Appears to work correctly for me.  (Again, its either fine, or need
bugfixing anyway for 4.14, and raising with Linux as this is unmodified
upstream code like the rest of Kconfig.include).

~Andrew

