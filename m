Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35C746D492
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 14:44:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242255.419037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxDx-0002MW-FE; Wed, 08 Dec 2021 13:43:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242255.419037; Wed, 08 Dec 2021 13:43:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muxDx-0002Kj-Bb; Wed, 08 Dec 2021 13:43:09 +0000
Received: by outflank-mailman (input) for mailman id 242255;
 Wed, 08 Dec 2021 13:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cpXy=QZ=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muxDw-0002Kd-GW
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 13:43:08 +0000
Received: from ppsw-32.csi.cam.ac.uk (ppsw-32.csi.cam.ac.uk [131.111.8.132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c51c6a8d-582c-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 14:43:05 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:44972)
 by ppsw-32.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.136]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muxDs-000n2o-2L (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 08 Dec 2021 13:43:04 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6FB7B1FB51;
 Wed,  8 Dec 2021 13:43:04 +0000 (GMT)
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
X-Inumbo-ID: c51c6a8d-582c-11ec-a831-37629979565c
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <83920ef7-ae82-01ad-e011-58f39a3b3e12@srcf.net>
Date: Wed, 8 Dec 2021 13:43:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211208084745.31082-1-jgross@suse.com>
 <20211208084745.31082-3-jgross@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v3 2/2] tools: set event channel HVM parameters in
 libxenguest
In-Reply-To: <20211208084745.31082-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/12/2021 08:47, Juergen Gross wrote:
> The HVM parameters for pre-allocated event channels should be set in
> libxenguest, like it is done for PV guests and for the pre-allocated
> ring pages.
>
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>

I'm not sure that we have the concept of pre-allocated ring pages.

For PV, we have:

    dom->console_pfn = xc_dom_alloc_page(dom, "console");
    if ( dom->console_pfn == INVALID_PFN )
        return -1;
    xc_clear_domain_page(dom->xch, dom->guest_domid,
                         xc_dom_p2m(dom, dom->console_pfn));

and for HVM, we have:

    dom->console_pfn = special_pfn(SPECIALPAGE_CONSOLE);
    xc_clear_domain_page(dom->xch, dom->guest_domid, dom->console_pfn);

With a suitable tweak to the commit message (probably just deleting the
final clause), Reivewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

That said...

> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index fe9f760f71..c9c24666cd 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -723,9 +723,8 @@ out:
>  
>  static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
>                                  libxl_domain_build_info *info,
> -                                int store_evtchn, unsigned long *store_mfn,
> -                                int console_evtchn, unsigned long *console_mfn,
> -                                domid_t store_domid, domid_t console_domid)
> +                                unsigned long *store_mfn,
> +                                unsigned long *console_mfn)
>  {
>      struct hvm_info_table *va_hvm;
>      uint8_t *va_map, sum;
> @@ -752,8 +751,6 @@ static int hvm_build_set_params(xc_interface *handle, uint32_t domid,
>  
>      xc_hvm_param_get(handle, domid, HVM_PARAM_STORE_PFN, &str_mfn);
>      xc_hvm_param_get(handle, domid, HVM_PARAM_CONSOLE_PFN, &cons_mfn);

... these are junk too.  I'm dismayed at how much of the toolstack tries
passing function parameters via HVM_PARAMS.

libxl's HVM path ought to mirror the PV path and, after
libxl__build_dom() is called, just read the values back out:

state->console_mfn = dom->console_pfn;
state->store_mfn = dom->xenstore_pfn;


That then leaves hvm_build_set_params() doing nothing but adjusting the
HVM info table for real HVM guests.  dom->max_vcpus is already present
which covers 2 of the 3 fields, leaving only the ACPI boolean left to pass.

So by passing the ACPI boolean down, we get rid of
hvm_build_set_params() entirely, which seems like a very good move.

~Andrew

