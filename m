Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328731B12ED
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2020 19:26:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jQaBX-0006F1-Vi; Mon, 20 Apr 2020 17:26:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JPG3=6E=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jQaBW-0006Ew-JZ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2020 17:26:18 +0000
X-Inumbo-ID: 0b025aa2-832c-11ea-9086-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b025aa2-832c-11ea-9086-12813bfff9fa;
 Mon, 20 Apr 2020 17:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SF892JNXVZng8dYTDOBMQ2wLtlLLlDuMWiz/y4bkUH8=; b=UBhOHLilJYznRKNudtY3VYgwBu
 a/oJepqHG7naCLTojnC02V+qlOYbHDRhemnrUBxq4FlzZTak/3ucww6CP7LoddwB5i5bmEA6JYa3L
 42bxX1lPmBBM9auYBvlcngbEM2bJB5RSMs30VhM7Wr9U/j9C5iOH2W6KFLGxY+B2L4VE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQaBP-0002EH-Nn; Mon, 20 Apr 2020 17:26:11 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jQaBP-0003ob-GX; Mon, 20 Apr 2020 17:26:11 +0000
Subject: Re: [PATCH v2 2/5] xen/common/domctl: introduce
 XEN_DOMCTL_get/setdomaincontext
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20200407173847.1595-1-paul@xen.org>
 <20200407173847.1595-3-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <f4aa5e9f-4a1c-c02a-1cee-a43591492556@xen.org>
Date: Mon, 20 Apr 2020 18:26:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407173847.1595-3-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

On 07/04/2020 18:38, Paul Durrant wrote:
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 1ad34c35eb..8ab39acf0c 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>   #include "hvm/save.h"
>   #include "memory.h"
>   
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000012
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000013
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> @@ -1129,6 +1129,44 @@ struct xen_domctl_vuart_op {
>                                    */
>   };
>   
> +/*
> + * Get/Set domain PV context. The same struct xen_domctl_domaincontext

I think you want to update the comments to match the split.

> + * is used for both commands but with slightly different field semantics
> + * as follows:

Reviewed-by: Julien Grall <jgrall@amazon.com>


Cheers,


-- 
Julien Grall

