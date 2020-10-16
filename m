Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7C2908EF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 17:55:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8166.21730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTS42-0004QJ-Mq; Fri, 16 Oct 2020 15:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8166.21730; Fri, 16 Oct 2020 15:54:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTS42-0004Pu-JE; Fri, 16 Oct 2020 15:54:42 +0000
Received: by outflank-mailman (input) for mailman id 8166;
 Fri, 16 Oct 2020 15:54:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTS40-0004Pp-Uy
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:54:41 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 19cb9d07-f151-47b6-bec3-d962d5356c0a;
 Fri, 16 Oct 2020 15:54:40 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTS3v-0008Lx-9a; Fri, 16 Oct 2020 15:54:35 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTS3u-0005Em-TU; Fri, 16 Oct 2020 15:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTS40-0004Pp-Uy
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 15:54:41 +0000
X-Inumbo-ID: 19cb9d07-f151-47b6-bec3-d962d5356c0a
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 19cb9d07-f151-47b6-bec3-d962d5356c0a;
	Fri, 16 Oct 2020 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7P1fPlrFQRURct1iDp9Hf9pmMYk3Sx4P11s9/9aJEI0=; b=B2lco4lhWzAkyWG1alWOZYmbvj
	0NSligQ+U98dxrigxn/z1popTjnwmj9ODQlCh+lVxwvtVrFRERiqbRSS7pN+SY2fwZ9+EiNyyrxvJ
	6nXB6vFBWbx1H8X6FRvrwEhQbhW4Epz0NKk6hRWv3IJ2x9RKM6p8mGG7dCPioe8K51kQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTS3v-0008Lx-9a; Fri, 16 Oct 2020 15:54:35 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTS3u-0005Em-TU; Fri, 16 Oct 2020 15:54:35 +0000
Subject: Re: [PATCH 3/5] libxl / iommu / domctl: introduce
 XEN_DOMCTL_IOMMU_SET_ALLOCATION...
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-4-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <471c9800-2ff0-d180-0840-e29dee4d3b4f@xen.org>
Date: Fri, 16 Oct 2020 16:54:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201005094905.2929-4-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 05/10/2020 10:49, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... sub-operation of XEN_DOMCTL_iommu_ctl.
> 
> This patch adds a new sub-operation into the domctl. The code in iommu_ctl()
> is extended to call a new arch-specific iommu_set_allocation() function which
> will be called with the IOMMU page-table overhead (in 4k pages) in response

Why 4KB? Wouldn't it be better to use the hypervisor page size instead?

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 75e855625a..6402678838 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1138,8 +1138,16 @@ struct xen_domctl_vuart_op {
>   
>   #define XEN_DOMCTL_IOMMU_INVALID 0
>   
> +#define XEN_DOMCTL_IOMMU_SET_ALLOCATION 1
> +struct xen_domctl_iommu_set_allocation {
> +    uint32_t nr_pages;

Shouldn't this be a 64-bit value?

Cheers,

-- 
Julien Grall

