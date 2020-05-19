Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6C61D99AF
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 16:30:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb3Fa-0002v0-6F; Tue, 19 May 2020 14:29:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGb=7B=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jb3FY-0002uv-IR
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 14:29:44 +0000
X-Inumbo-ID: 2e0f95e3-99dd-11ea-a91e-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e0f95e3-99dd-11ea-a91e-12813bfff9fa;
 Tue, 19 May 2020 14:29:43 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 3RkqjoLPiMHHbHmwCUBf41A60PsfdwCEGc/9nLgMy404z1QdU0P1qliTWRymrGvDUXQIXU2TNC
 Z5ars5gBElsJjJ2tOAcGPxIXWakORoc6ZWI4llidUrlenJwjIH+Iz+B4Z+RU+4DxFYlt0zeaH6
 QGmeleueh4VwSBwq1hfbBMZxNCWTt2m1Dm/FaS2JjEmunWNJ/lE/0tqGUwNRjYDt8JH0p99+uG
 IJ8nYIiQWkZdHjed2EquMzh1u/20CCRGHsMmc7tFcrQ3FQ5ivKYxVmwWutOjSbUDfCSA9mvOpa
 jHg=
X-SBRS: 2.7
X-MesageID: 18151436
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,410,1583211600"; d="scan'208";a="18151436"
Subject: Re: [PATCH] x86/traps: Rework #PF[Rsvd] bit handling
To: Jan Beulich <jbeulich@suse.com>
References: <20200518153820.18170-1-andrew.cooper3@citrix.com>
 <bf0d9e00-cb42-34b1-26ee-93628eea094c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d925943b-cad8-07c3-c21c-322ffc4a75da@citrix.com>
Date: Tue, 19 May 2020 15:29:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <bf0d9e00-cb42-34b1-26ee-93628eea094c@suse.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 19/05/2020 09:14, Jan Beulich wrote:
> On 18.05.2020 17:38, Andrew Cooper wrote:
>> The reserved_bit_page_fault() paths effectively turn reserved bit faults into
>> a warning, but in the light of L1TF, the real impact is far more serious.
>>
>> Xen does not have any reserved bits set in its pagetables, nor do we permit PV
>> guests to write any.  An HVM shadow guest may have reserved bits via the MMIO
>> fastpath, but those faults are handled in the VMExit #PF intercept, rather
>> than Xen's #PF handler.
>>
>> There is no need to disable interrupts (in spurious_page_fault()) for
>> __page_fault_type() to look at the rsvd bit, nor should extable fixup be
>> tolerated.
> I'm afraid I don't understand the connection of the first half of this
> to the patch - you don't alter spurious_page_fault() in this regard (at
> all, actually).

The disabling interrupts is in spurious_page_fault().  But the point is
that there is no need to enter this logic at all for a reserved page fault.

>
> As to extable fixup, I'm not sure: If a reserved bit ends up slipping
> into the non-Xen parts of the page tables, and if guest accessors then
> become able to trip a corresponding #PF, the bug will need an XSA with
> the proposed change, while - afaict - it won't if the exception gets
> recovered from. (There may then still be log spam issue, I admit.)

We need to issue an XSA anyway because such a construct would be an L1TF
gadget.

What this change does is make it substantially more obvious, and turns
an information leak into a DoS.

>> @@ -1439,6 +1418,18 @@ void do_page_fault(struct cpu_user_regs *regs)
>>      if ( unlikely(fixup_page_fault(addr, regs) != 0) )
>>          return;
>>  
>> +    /*
>> +     * Xen have reserved bits in its pagetables, nor do we permit PV guests to
>> +     * write any.  Such entries would be vulnerable to the L1TF sidechannel.
>> +     *
>> +     * The only logic which intentionally sets reserved bits is the shadow
>> +     * MMIO fastpath (SH_L1E_MMIO_*), which is careful not to be
>> +     * L1TF-vulnerable, and handled via the VMExit #PF intercept path, rather
>> +     * than here.
>> +     */
>> +    if ( error_code & PFEC_reserved_bit )
>> +        goto fatal;
> Judging from the description, wouldn't this then better go even further
> up, ahead of the fixup_page_fault() invocation? In fact the function
> has two PFEC_reserved_bit checks to _avoid_ taking action, which look
> like they could then be dropped.

Only for certain Xen-only fixup.  The path into paging_fault() is not
guarded.

Depending on whether GNP is actually used for PV guests, this is where
it would be fixed up.

~Andrew

