Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9861B464E6F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 14:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236028.409394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msPFO-0005Px-Ur; Wed, 01 Dec 2021 13:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236028.409394; Wed, 01 Dec 2021 13:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msPFO-0005NX-RT; Wed, 01 Dec 2021 13:02:06 +0000
Received: by outflank-mailman (input) for mailman id 236028;
 Wed, 01 Dec 2021 13:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msPFN-0005NR-Jo
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 13:02:05 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1b86530-52a6-11ec-b945-1df2895da90e;
 Wed, 01 Dec 2021 14:02:04 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40184)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msPFL-000ywR-ob (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 13:02:03 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 14E3F1FDDA;
 Wed,  1 Dec 2021 13:02:03 +0000 (GMT)
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
X-Inumbo-ID: e1b86530-52a6-11ec-b945-1df2895da90e
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <a6489b9f-6f93-94d9-549f-07fc761a4830@srcf.net>
Date: Wed, 1 Dec 2021 13:02:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <8a8dd03a-5447-bc45-1554-50fb5b6c075c@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 3/4] VT-d: replace flush_all_cache()
In-Reply-To: <8a8dd03a-5447-bc45-1554-50fb5b6c075c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2021 09:41, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -591,7 +591,8 @@ static int __must_check iommu_flush_all(
>      bool_t flush_dev_iotlb;
>      int rc = 0;
>  
> -    flush_all_cache();
> +    flush_local(FLUSH_CACHE);

While I agree that the conversion is an improvement, the logic still
looks totally bogus.

I can believe that it might have been a stopgap to fix problems before
we identified the need for sync_cache() for non-coherent IOMMUs, but
there's no need I can spot for any WBINVDs on any of these paths.

I'm fairly sure this should just be dropped, and Xen will get faster as
a result.

~Andrew

