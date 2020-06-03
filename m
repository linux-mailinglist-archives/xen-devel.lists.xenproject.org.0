Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52421ECCF7
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 11:51:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgQ2q-0007Fy-0p; Wed, 03 Jun 2020 09:50:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n250=7Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgQ2n-0007Ft-Vp
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 09:50:46 +0000
X-Inumbo-ID: b15eb524-a57f-11ea-acd3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b15eb524-a57f-11ea-acd3-12813bfff9fa;
 Wed, 03 Jun 2020 09:50:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D0502ACB1;
 Wed,  3 Jun 2020 09:50:46 +0000 (UTC)
Subject: Re: Re [PATCH] x86/CET: Fix build following c/s 43b98e7190
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <1eeb47f4-b9b9-c4d8-a5c9-58d78f0e0aeb@suse.com>
 <fa2a6ce5-7a15-6ac7-defd-ded1c229d642@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cf5bca49-ca3a-b130-5d68-a92870416620@suse.com>
Date: Wed, 3 Jun 2020 11:50:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <fa2a6ce5-7a15-6ac7-defd-ded1c229d642@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.06.2020 19:15, Andrew Cooper wrote:
> On 02/06/2020 15:21, Jan Beulich wrote:
>>> OSSTest reports:
>>>
>>>   x86_64.S: Assembler messages:
>>>   x86_64.S:57: Error: no such instruction: `setssbsy'
>>>   /home/osstest/build.150510.build-amd64/xen/xen/Rules.mk:183: recipe for target 'head.o' failed
>>>   make[4]: Leaving directory '/home/osstest/build.150510.build-amd64/xen/xen/arch/x86/boot'
>>>   make[4]: *** [head.o] Error 1
>>>
>>> All use of CET instructions, even those inside alternative blocks, needs to be
>>> behind CONFIG_XEN_SHSTK, as it indicates suitable toolchain support.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> That's quite a bit of #ifdef-ary here. Simple (operand-less) insns
>> like SETSSBSY could easily be made available via .byte directives.
>> Would you be amenable to to ack-ing a patch to replace some of the
>> #ifdef-s (at least the ones at the lstar, cstar, and sysenter
>> entry points), after 4.14?
> 
> Yeah - that was a bit of a mess in the end.  (But given the
> circumstances, and that I've got past form typo'ing the SETSSBSY opcode,
> it probably was the right move even in hindsight).
> 
> Reducing it to .byte should be fine so long as some form of /* setssbsy
> */ comment appears.

Sure.

> One other option would be to introduce a SETSSBSY macro, but that hides
> the alternative so is something I'd prefer to avoid.

With this you mean you'd rather not see us go the CLAC/STAC route?
I was instead thinking of a pure assembly macro named "setssbsy".
In fact we could switch the CLAC/STAC ugliness to some such, if we
end up being happy with the model.

Jan

