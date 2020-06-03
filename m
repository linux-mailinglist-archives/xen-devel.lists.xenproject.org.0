Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCCE91ECEC6
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:45:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRp2-0002Fd-QE; Wed, 03 Jun 2020 11:44:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EnF2=7Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgRp1-0002FX-5I
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:44:39 +0000
X-Inumbo-ID: 9a4a56d0-a58f-11ea-8993-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a4a56d0-a58f-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 11:44:38 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: IZTmpl3bIBHHpNBltS3GaBREVzm7EROitnIadLmDc9/nwLtsOAhbbcXCXJRHkYx+zMRfdgBwqz
 NY5bnZ+L04Ha7xEenfUNCbQwBC0yNVuRTXdgqDRIqtdm0dHIMDqszkFpGVXKWS1yLaOw1znWd0
 M3I3HKVW8c1eObfptRBINhiDrN7Sp9X6aXqD9/2cTLHPhYV5KvQUQeef5UFz37v2AH9uqS2T9q
 ccEyMexJbE1mAn9OLZJHb9FW5Uta8Jjj8ywG0U+xzfv9F1eILGY2LRWlc1F8kAOLrW7iCPsRcJ
 mo8=
X-SBRS: 2.7
X-MesageID: 19856069
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,467,1583211600"; d="scan'208";a="19856069"
Subject: Re: Re [PATCH] x86/CET: Fix build following c/s 43b98e7190
To: Jan Beulich <jbeulich@suse.com>
References: <1eeb47f4-b9b9-c4d8-a5c9-58d78f0e0aeb@suse.com>
 <fa2a6ce5-7a15-6ac7-defd-ded1c229d642@citrix.com>
 <cf5bca49-ca3a-b130-5d68-a92870416620@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1c507672-bc8e-bc7e-df45-a652fb4c21f2@citrix.com>
Date: Wed, 3 Jun 2020 12:44:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <cf5bca49-ca3a-b130-5d68-a92870416620@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 03/06/2020 10:50, Jan Beulich wrote:
> On 02.06.2020 19:15, Andrew Cooper wrote:
>> On 02/06/2020 15:21, Jan Beulich wrote:
>>>> OSSTest reports:
>>>>
>>>>   x86_64.S: Assembler messages:
>>>>   x86_64.S:57: Error: no such instruction: `setssbsy'
>>>>   /home/osstest/build.150510.build-amd64/xen/xen/Rules.mk:183: recipe for target 'head.o' failed
>>>>   make[4]: Leaving directory '/home/osstest/build.150510.build-amd64/xen/xen/arch/x86/boot'
>>>>   make[4]: *** [head.o] Error 1
>>>>
>>>> All use of CET instructions, even those inside alternative blocks, needs to be
>>>> behind CONFIG_XEN_SHSTK, as it indicates suitable toolchain support.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> That's quite a bit of #ifdef-ary here. Simple (operand-less) insns
>>> like SETSSBSY could easily be made available via .byte directives.
>>> Would you be amenable to to ack-ing a patch to replace some of the
>>> #ifdef-s (at least the ones at the lstar, cstar, and sysenter
>>> entry points), after 4.14?
>> Yeah - that was a bit of a mess in the end.  (But given the
>> circumstances, and that I've got past form typo'ing the SETSSBSY opcode,
>> it probably was the right move even in hindsight).
>>
>> Reducing it to .byte should be fine so long as some form of /* setssbsy
>> */ comment appears.
> Sure.
>
>> One other option would be to introduce a SETSSBSY macro, but that hides
>> the alternative so is something I'd prefer to avoid.
> With this you mean you'd rather not see us go the CLAC/STAC route?
> I was instead thinking of a pure assembly macro named "setssbsy".
> In fact we could switch the CLAC/STAC ugliness to some such, if we
> end up being happy with the model.

The thing about the current STAC / CLAC is that, as written, they give
the impression of being unconditional.  This is poor in terms of code
clarity.

Furthermore, making them indistinguishable from the plain instructions
is definitely a no-go, because then we've got assembly source (again,
which appears unconditional) which doesn't match its disassembly (the
backing nops) - at least with the macros in upper case, it is obvious
that something is up, even if you have to searching for why.

If we went for pure assembly macros with an alt_ or maybe_ prefix, then
that would be reasonable.  It looks as close to regular instruction as
possible, but also makes it explicitly clear that it is conditional.

~Andrew

