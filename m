Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8B11E6216
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 15:23:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeIUx-0008Px-Sz; Thu, 28 May 2020 13:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gT1p=7K=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1jeIUv-0008Pr-Sr
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 13:23:01 +0000
X-Inumbo-ID: 5a1a40fa-a0e6-11ea-8993-bc764e2007e4
Received: from ppsw-31.csi.cam.ac.uk (unknown [131.111.8.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a1a40fa-a0e6-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 13:23:00 +0000 (UTC)
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://help.uis.cam.ac.uk/email-scanner-virus
Received: from 88-109-182-220.dynamic.dsl.as9105.com ([88.109.182.220]:46080
 helo=[192.168.1.219])
 by ppsw-31.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.157]:465)
 with esmtpsa (PLAIN:amc96) (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 id 1jeIUr-000IXV-L0 (Exim 4.92.3)
 (return-path <amc96@hermes.cam.ac.uk>); Thu, 28 May 2020 14:22:57 +0100
Subject: Re: [PATCH v2 04/14] x86/traps: Implement #CP handler and extend #PF
 for shadow stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
 <20200527191847.17207-5-andrew.cooper3@citrix.com>
 <424dc7f2-d999-19e1-42ad-226cf22783eb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a5fa915b-b0ce-8247-09bb-dac3d149c6b5@citrix.com>
Date: Thu, 28 May 2020 14:22:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <424dc7f2-d999-19e1-42ad-226cf22783eb@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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

On 28/05/2020 13:03, Jan Beulich wrote:
> On 27.05.2020 21:18, Andrew Cooper wrote:
>> For now, any #CP exception or shadow stack #PF indicate a bug in Xen, but
>> attempt to recover from #CP if taken in guest context.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one more question and a suggestion:
>
>> @@ -1445,8 +1447,10 @@ void do_page_fault(struct cpu_user_regs *regs)
>>       *
>>       * Anything remaining is an error, constituting corruption of the
>>       * pagetables and probably an L1TF vulnerable gadget.
>> +     *
>> +     * Any shadow stack access fault is a bug in Xen.
>>       */
>> -    if ( error_code & PFEC_reserved_bit )
>> +    if ( error_code & (PFEC_reserved_bit | PFEC_shstk) )
>>          goto fatal;
> Wouldn't you saying "any" imply putting this new check higher up, in
> particular ahead of the call to fixup_page_fault()?

Can do.

>
>> @@ -940,7 +944,8 @@ autogen_stubs: /* Automatically generated stubs. */
>>          entrypoint 1b
>>  
>>          /* Reserved exceptions, heading towards do_reserved_trap(). */
>> -        .elseif vec == TRAP_copro_seg || vec == TRAP_spurious_int || (vec > TRAP_simd_error && vec < TRAP_nr)
>> +        .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
>> +                vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
> Adding yet another || here adds to the fragility of the entire
> construct. Wouldn't it be better to implement do_entry_VE at
> this occasion, even its handling continues to end up in
> do_reserved_trap()? This would have the benefit of avoiding the
> pointless checking of %spl first thing in its handling. Feel
> free to keep the R-b if you decide to go this route.

I actually have a different plan, which deletes this entire clause, and
simplifies our autogen sanity checking somewhat.

For vectors which Xen has no implementation of (for whatever reason),
use DPL0, non-present descriptors, and redirect #NP[IDT] into
do_reserved_trap().

No need for any entry logic for the trivially fatal paths, or safety
against being uncertain about error codes.

However, its a little too close to 4.14 to clean this up now.

~Andrew

