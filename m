Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E796E46D7AA
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 17:02:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242445.419365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzOg-0004XU-1Q; Wed, 08 Dec 2021 16:02:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242445.419365; Wed, 08 Dec 2021 16:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muzOf-0004Ve-Uc; Wed, 08 Dec 2021 16:02:21 +0000
Received: by outflank-mailman (input) for mailman id 242445;
 Wed, 08 Dec 2021 16:02:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cpXy=QZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muzOe-0004VY-Ff
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 16:02:20 +0000
Received: from ppsw-33.csi.cam.ac.uk (ppsw-33.csi.cam.ac.uk [131.111.8.133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37c6499c-5840-11ec-9d12-4777fae47e2b;
 Wed, 08 Dec 2021 17:02:19 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:51670)
 by ppsw-33.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.137]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muzOb-00041E-i0 (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 08 Dec 2021 16:02:17 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 426971FED3;
 Wed,  8 Dec 2021 16:02:17 +0000 (GMT)
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
X-Inumbo-ID: 37c6499c-5840-11ec-9d12-4777fae47e2b
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <4d48cc2f-bea4-c1f4-95ec-4efa6d56b661@srcf.net>
Date: Wed, 8 Dec 2021 16:02:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 2/2] tools: set event channel HVM parameters in
 libxenguest
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211208084745.31082-1-jgross@suse.com>
 <20211208084745.31082-3-jgross@suse.com>
 <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
 <ad570954-98f6-f345-d965-f664f28a6e7d@suse.com>
 <18497abb-7f3f-1479-636d-edc35b2861ad@srcf.net>
 <efaa6395-f52e-193f-dec7-fc2114e760a5@suse.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <efaa6395-f52e-193f-dec7-fc2114e760a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/12/2021 15:57, Juergen Gross wrote:
> On 08.12.21 16:54, Andrew Cooper wrote:
>> On 08/12/2021 14:22, Juergen Gross wrote:
>>> On 08.12.21 14:43, Andrew Cooper wrote:
>>>> On 08/12/2021 08:47, Juergen Gross wrote:
>>>>> The HVM parameters for pre-allocated event channels should be set in
>>>>> libxenguest, like it is done for PV guests and for the pre-allocated
>>>>> ring pages.
>>>>>
>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>
>>>> I'm not sure that we have the concept of pre-allocated ring pages.
>>>>
>>>> For PV, we have:
>>>>
>>>>       dom->console_pfn = xc_dom_alloc_page(dom, "console");
>>>>       if ( dom->console_pfn == INVALID_PFN )
>>>>           return -1;
>>>>       xc_clear_domain_page(dom->xch, dom->guest_domid,
>>>>                            xc_dom_p2m(dom, dom->console_pfn));
>>>>
>>>> and for HVM, we have:
>>>>
>>>>       dom->console_pfn = special_pfn(SPECIALPAGE_CONSOLE);
>>>>       xc_clear_domain_page(dom->xch, dom->guest_domid,
>>>> dom->console_pfn);
>>>
>>> Isn't that a pre-allocation? The PFNs are fixed at boot time of the
>>> guest.
>>
>> Yeah, but "allocated in the library call we're making" is not the same
>> as "caller has to allocate and pass details in".
>>
>> I would not class the frames as "pre-allocated" in this context.
>> "allocated" sure, so perhaps "just like it is done for PV guests, and
>> the ring pages that libxenguest allocates" ?
>
> Fine with me.
>
> Should I send another round, or can this be changed when committing?

Fixed on commit.  No need to resend just for this.

Question is whether Anthony has any view, or whether my R-by is good enough?

~Andrew

