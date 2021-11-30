Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50674634AE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 13:40:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235107.407940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms2QJ-0001LV-9v; Tue, 30 Nov 2021 12:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235107.407940; Tue, 30 Nov 2021 12:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms2QJ-0001JG-6p; Tue, 30 Nov 2021 12:39:51 +0000
Received: by outflank-mailman (input) for mailman id 235107;
 Tue, 30 Nov 2021 12:39:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms2QI-0001JA-I6
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 12:39:50 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a50c3ea-51da-11ec-b941-1df2895da90e;
 Tue, 30 Nov 2021 13:39:48 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:39990)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms2QF-000yF8-nS (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 12:39:47 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 21A711FC17;
 Tue, 30 Nov 2021 12:39:47 +0000 (GMT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9a50c3ea-51da-11ec-b941-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <c86cf903-7627-0f8f-78ba-de97fa05c5d4@srcf.net>
Date: Tue, 30 Nov 2021 12:39:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/8] x86/boot: Drop incorrect mapping at l2_xenmap[0]
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-2-andrew.cooper3@citrix.com>
 <5b4dcbae-4100-ad3c-cbc4-51f2b2bbedaa@suse.com>
 <625fdf21-8024-7a79-5c64-b8ed959c54aa@srcf.net>
 <0b38fd69-c484-fdd4-9816-5d2a00b0a7b8@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <0b38fd69-c484-fdd4-9816-5d2a00b0a7b8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 11:22, Jan Beulich wrote:
> On 30.11.2021 12:14, Andrew Cooper wrote:
>> On 30/11/2021 10:33, Jan Beulich wrote:
>>> On 30.11.2021 11:04, Andrew Cooper wrote:
>>>> It has been 4 years since the default load address changed from 1M to 2M, and
>>>> _stext ceased residing in l2_xenmap[0].  We should not be inserting an unused
>>>> mapping.
>>>>
>>>> To ensure we don't create mappings accidentally, loop from 0 and obey
>>>> _PAGE_PRESENT on all entries.
>>>>
>>>> Fixes: 7ed93f3a0dff ("x86: change default load address from 1 MiB to 2 MiB")
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> I guess this may be worth backporting despite not having any immediate
>>> adverse effect.
>> I'd say so, yes.  I too can't see an adverse effect right now, but I'm
>> definitely wary of stray executable mappings lying around.
>>
>>
>> In principle, it would be nice to reclaim the 2M of space (which only
>> exists for the MB1 path IIRC), but then we're getting into a position
>> where xen_phys_start isn't really that any more.
> Well, xen_phys_base might be slightly more accurate, but apart from that
> I do think that we reclaim that space (as much as we did reclaim the 1Mb
> before the change of the default load address):
>
>     if ( efi_boot_mem_unused(&eb_start, &eb_end) )
>     {
>         reserve_e820_ram(&boot_e820, __pa(_stext), __pa(eb_start));
>         reserve_e820_ram(&boot_e820, __pa(eb_end), __pa(__2M_rwdata_end));
>     }
>     else
>         reserve_e820_ram(&boot_e820, __pa(_stext), __pa(__2M_rwdata_end));

That means there are zero safety barriers between a bad function pointer
and executing arbitrary guest memory, doesn't it...

My "adverse effect" comment was under the impression that we just left
the range unused.

~Andrew

