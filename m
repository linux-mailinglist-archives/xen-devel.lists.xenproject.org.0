Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A1463853
	for <lists+xen-devel@lfdr.de>; Tue, 30 Nov 2021 15:56:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.235227.408156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Ye-00014X-Fl; Tue, 30 Nov 2021 14:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 235227.408156; Tue, 30 Nov 2021 14:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ms4Ye-00012k-Ce; Tue, 30 Nov 2021 14:56:36 +0000
Received: by outflank-mailman (input) for mailman id 235227;
 Tue, 30 Nov 2021 14:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ICIV=QR=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1ms4Yd-00012e-20
 for xen-devel@lists.xenproject.org; Tue, 30 Nov 2021 14:56:35 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b43b5bd8-51ed-11ec-976b-d102b41d0961;
 Tue, 30 Nov 2021 15:56:32 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:34590)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1ms4YZ-000uyL-7P (Exim 4.95) (return-path <amc96@srcf.net>);
 Tue, 30 Nov 2021 14:56:31 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 25CCA1FC54;
 Tue, 30 Nov 2021 14:56:31 +0000 (GMT)
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
X-Inumbo-ID: b43b5bd8-51ed-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4cc50987-62e2-20b2-b391-786fea4bdbd2@srcf.net>
Date: Tue, 30 Nov 2021 14:56:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 4/8] x86/mm: Drop bogus cacheability logic in
 update_xen_mappings()
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20211130100445.31156-1-andrew.cooper3@citrix.com>
 <20211130100445.31156-5-andrew.cooper3@citrix.com>
 <0e4ce9d7-d13b-7709-c983-d61995153883@srcf.net>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <0e4ce9d7-d13b-7709-c983-d61995153883@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/11/2021 13:11, Andrew Cooper wrote:
> On 30/11/2021 10:04, Andrew Cooper wrote:
>> There is no circumstance under which any part of the Xen image in memory wants
>> to have any cacheability other than Write Back.
>>
>> Furthermore, unmapping random pieces of Xen like that comes with a non-trivial
>> risk of a Triple Fault, or other fatal condition.  Even if it appears to work,
>> an NMI or interrupt as a far wider reach into Xen mappings than calling
>> map_pages_to_xen() thrice.
>>
>> Simplfy the safety checking to a BUG_ON().  It is substantially more correct
>> and robust than following either of the unlikely(alias) paths.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>>
>> I'm half tempted to drop the check entirely, but in that case it would be
>> better to inline the result into the two callers.
>> ---
>>  xen/arch/x86/mm.c | 21 +++++++++------------
>>  1 file changed, 9 insertions(+), 12 deletions(-)
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 4d799032dc82..9bd4e5cc1d2f 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -785,24 +785,21 @@ bool is_iomem_page(mfn_t mfn)
>>  
>>  static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
>>  {
>> -    int err = 0;
>>      bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
>>           mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>> -    unsigned long xen_va =
>> -        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
>> +
>> +    /*
>> +     * Something is catastrophically broken if someone is trying to change the
>> +     * cacheability of Xen in memory...
>> +     */
>> +    BUG_ON(alias);
>>  
>>      if ( boot_cpu_has(X86_FEATURE_XEN_SELFSNOOP) )
>>          return 0;
>>  
>> -    if ( unlikely(alias) && cacheattr )
>> -        err = map_pages_to_xen(xen_va, _mfn(mfn), 1, 0);
>> -    if ( !err )
>> -        err = map_pages_to_xen((unsigned long)mfn_to_virt(mfn), _mfn(mfn), 1,
>> -                     PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
>> -    if ( unlikely(alias) && !cacheattr && !err )
>> -        err = map_pages_to_xen(xen_va, _mfn(mfn), 1, PAGE_HYPERVISOR);
>> -
>> -    return err;
>> +    return map_pages_to_xen(
>> +        (unsigned long)mfn_to_virt(mfn), _mfn(mfn), 1,
>> +        PAGE_HYPERVISOR | cacheattr_to_pte_flags(cacheattr));
> In light of the discussion on patch 1, this is no longer safe.  The
> alias calculation includes 2M of arbitrary guest memory, and in
> principle there are legitimate reasons for a guest to want to map RAM as
> WC (e.g. GPU pagetables) or in the future, WP (in place RAM
> encryption/decryption).
>
> The gross hack fix would be "mfn >= PFN_DOWN(xen_phys_start + MB(2))",
> but but this is screaming for a helper.  xen_in_range() is part-way
> there, but is an O(n) loop over the regions.

Further problems.  There is also the init section in the middle of Xen
which contains arbitrary guest memory.  The old algorithm was worse for
that, because it would reinstate the nuked init mappings.

~Andrew

