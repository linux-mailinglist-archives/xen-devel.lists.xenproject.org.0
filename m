Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7460B1E86F7
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 20:51:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jek5o-0004cl-Qu; Fri, 29 May 2020 18:50:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mY44=7L=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jek5o-0004cg-68
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 18:50:56 +0000
X-Inumbo-ID: 5395c93c-a1dd-11ea-9dbe-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5395c93c-a1dd-11ea-9dbe-bc764e2007e4;
 Fri, 29 May 2020 18:50:55 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:40568
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jek5l-0008Uz-Kn (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Fri, 29 May 2020 19:50:53 +0100
Subject: Re: [PATCH v2 04/14] x86/traps: Implement #CP handler and extend #PF
 for shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-5-andrew.cooper3@citrix.com>
 <424dc7f2-d999-19e1-42ad-226cf22783eb@suse.com>
 <a5fa915b-b0ce-8247-09bb-dac3d149c6b5@citrix.com>
 <21cfcf09-930d-c0cd-6860-92523732a594@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5282b2f4-35b7-4942-5240-e9305a64d938@citrix.com>
Date: Fri, 29 May 2020 19:50:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <21cfcf09-930d-c0cd-6860-92523732a594@suse.com>
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

On 28/05/2020 14:31, Jan Beulich wrote:
> On 28.05.2020 15:22, Andrew Cooper wrote:
>> On 28/05/2020 13:03, Jan Beulich wrote:
>>> On 27.05.2020 21:18, Andrew Cooper wrote:
>>>> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>>>          entrypoint 1b
>>>>  
>>>>          /* Reserved exceptions, heading towards do_reserved_trap(). */
>>>> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
>>>> +        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
>>>> +                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
>>> Adding yet another || here adds to the fragility of the entire
>>> construct. Wouldn't it be better to implement do_entry_VE at
>>> this occasion, even its handling continues to end up in
>>> do_reserved_trap()? This would have the benefit of avoiding the
>>> pointless checking of %spl first thing in its handling. Feel
>>> free to keep the R-b if you decide to go this route.
>> I actually have a different plan, which deletes this entire clause, and
>> simplifies our autogen sanity checking somewhat.
>>
>> For vectors which Xen has no implementation of (for whatever reason),
>> use DPL0, non-present descriptors, and redirect #NP[IDT] into
>> do_reserved_trap().
> Except that #NP itself being a contributory exception, if the such
> covered exception is also contributory (e.g. #CP) or of page fault
> class (e.g. #VE), we'd get #DF instead of #NP afaict.

Hmm.  Good point.

I also had some other cleanup plans.  (In due course,) I'll see what I
can do to make the status quo better.

~Andrew

