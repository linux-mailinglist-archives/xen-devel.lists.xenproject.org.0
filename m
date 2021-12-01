Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5129F465130
	for <lists+xen-devel@lfdr.de>; Wed,  1 Dec 2021 16:14:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236070.409447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msRJ0-0004Ag-MZ; Wed, 01 Dec 2021 15:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236070.409447; Wed, 01 Dec 2021 15:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msRJ0-00048s-IT; Wed, 01 Dec 2021 15:13:58 +0000
Received: by outflank-mailman (input) for mailman id 236070;
 Wed, 01 Dec 2021 15:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fqf2=QS=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msRIz-00048G-9x
 for xen-devel@lists.xenproject.org; Wed, 01 Dec 2021 15:13:57 +0000
Received: from ppsw-43.csi.cam.ac.uk (ppsw-43.csi.cam.ac.uk [131.111.8.143])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d368db7-52b9-11ec-976b-d102b41d0961;
 Wed, 01 Dec 2021 16:13:56 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:40220)
 by ppsw-43.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.139]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msRIx-00058Y-oY (Exim 4.95) (return-path <amc96@srcf.net>);
 Wed, 01 Dec 2021 15:13:55 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 6A4E81FD7A;
 Wed,  1 Dec 2021 15:13:55 +0000 (GMT)
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
X-Inumbo-ID: 4d368db7-52b9-11ec-976b-d102b41d0961
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <3dbcb5ed-c776-84d8-92a7-b9d265ef7d7b@srcf.net>
Date: Wed, 1 Dec 2021 15:13:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <5d72c629-fabf-3d40-aa19-d177826fdde5@suse.com>
 <f7a7ce32-f921-ced7-4699-26f907392eb4@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH 1/4] IOMMU/x86: switch to alternatives-call patching in
 further instances
In-Reply-To: <f7a7ce32-f921-ced7-4699-26f907392eb4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/12/2021 09:39, Jan Beulich wrote:
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1457,24 +1462,24 @@ static int iommu_get_device_group(
>      if ( !is_iommu_enabled(d) || !ops->get_device_group_id )
>          return 0;
>  
> -    group_id = ops->get_device_group_id(seg, bus, devfn);
> +    group_id = iommu_call(ops, get_device_group_id, seg, bus, devfn);

So I was going to suggest adjusting this to use more pci_sbdf_t, but the
Intel implementation can fail and return -1.

However, given the observations in patch 4, I'd instead recommend
dropping all of this.

Everything unrelated to get_device_group() looks fine.

~Andrew

