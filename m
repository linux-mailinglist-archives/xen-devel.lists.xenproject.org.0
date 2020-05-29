Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4A11E86D8
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 20:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jejuW-0002pk-Px; Fri, 29 May 2020 18:39:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jejuV-0002pf-MW
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 18:39:15 +0000
X-Inumbo-ID: b2188af0-a1db-11ea-a904-12813bfff9fa
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2188af0-a1db-11ea-a904-12813bfff9fa;
 Fri, 29 May 2020 18:39:15 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40100
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jejuS-0001W5-MV (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 19:39:14 +0100
Subject: Re: [PATCH v2 03/14] x86/shstk: Introduce Supervisor Shadow Stack
 support
To: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-4-andrew.cooper3@citrix.com>
 <4f535d4c-b3b3-fe5b-8b57-af736dc0a360@suse.com>
 <ad95944a-bd21-2ba8-6214-49d86050e816@citrix.com>
 <c3c3aea0-806f-4058-c1aa-cdc0f75007e2@suse.com>
 <20200529155118.GL2105@perard.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4c759ccc-b256-c074-0bd8-fe2d5c728715@citrix.com>
Date: Fri, 29 May 2020 19:39:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529155118.GL2105@perard.uk.xensource.com>
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

On 29/05/2020 16:51, Anthony PERARD wrote:
> On Fri, May 29, 2020 at 01:59:55PM +0200, Jan Beulich wrote:
>> On 28.05.2020 20:10, Andrew Cooper wrote:
>>> On 28/05/2020 11:25, Jan Beulich wrote:
>>>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>>>> --- a/xen/scripts/Kconfig.include
>>>>> +++ b/xen/scripts/Kconfig.include
>>>>> @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
>>>>>  # Return y if the linker supports <flag>, n otherwise
>>>>>  ld-option = $(success,$(LD) -v $(1))
>>>>>  
>>>>> +# $(as-instr,<instr>)
>>>>> +# Return y if the assembler supports <instr>, n otherwise
>>>>> +as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>>>> Is this actually checking the right thing in the clang case?
>>> Appears to work correctly for me.  (Again, its either fine, or need
>>> bugfixing anyway for 4.14, and raising with Linux as this is unmodified
>>> upstream code like the rest of Kconfig.include).
>> This answer made me try it out: On a system with clang 5 and
>> binutils 2.32 "incsspd	%eax" translates fine with
>> -no-integrated-as but doesn't without. The previously mentioned
>> odd use of CLANG_FLAGS, perhaps together with the disconnect
>> from where we establish whether to use -no-integrated-as in the
>> first place (arch.mk; I have no idea whether the CFLAGS
>> determined would be usable by the kconfig invocation, nor how
>> to solve the chicken-and-egg problem there if this is meant to
>> work that way), may be the reason for this. Cc-ing Anthony once
>> again ...
> I've just prepare/sent a patch which should fix this CLANG_FLAGS issue
> and allows to tests the assembler in Kconfig.
>
> See: [XEN PATCH] xen/build: introduce CLANG_FLAGS for testing other CFLAGS

Thanks.  I've checked carefully, and this is an improvement from before.

Therefore I have acked and included the patch.

However, I think there is a further problem.  When -no-integrated-as
does get passed down, I don't see Clang falling back to using the Gnu
assember, so I suspect we have a further plumbing problem.  (It only
affects Clang 5.0 and earlier, so obsolete toolchains these days).

~Andrew

