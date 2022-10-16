Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743860028A
	for <lists+xen-devel@lfdr.de>; Sun, 16 Oct 2022 19:53:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.423900.670980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7p9-00023e-3Q; Sun, 16 Oct 2022 17:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 423900.670980; Sun, 16 Oct 2022 17:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ok7p9-000212-0t; Sun, 16 Oct 2022 17:53:19 +0000
Received: by outflank-mailman (input) for mailman id 423900;
 Sun, 16 Oct 2022 17:53:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ok7p7-00020w-IJ
 for xen-devel@lists.xenproject.org; Sun, 16 Oct 2022 17:53:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7p3-0003Px-Rp; Sun, 16 Oct 2022 17:53:13 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.141])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ok7p3-00030k-Ky; Sun, 16 Oct 2022 17:53:13 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=UDBmlnzgtdCje0DtWepmdbJUxUQTxMSyPzW8sUlZpIU=; b=KkiiteRmmJp0iKe7sVImkRwXxS
	jiPYGq9v0/po9gtZsFiWhhtk3Pb8bmJFrwRx96Jdj6/USdVkfGbcxXONm1MAhp//Oos4GvolPnxN4
	F9AqTqXWM9+rfzVPNdXbg4N2uTGUfh9ptzBnNPRfEv46EOgQcLcV9e8l6D9VXjepSLz4=;
Message-ID: <78881214-c8a1-0156-e279-6c2598348a87@xen.org>
Date: Sun, 16 Oct 2022 18:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH v1 07/12] include/hw/xen/xen_common: return error from
 xen_create_ioreq_server
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: stefano.stabellini@amd.com, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
References: <20221015050750.4185-1-vikram.garhwal@amd.com>
 <20221015050750.4185-8-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221015050750.4185-8-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vikram,

On 15/10/2022 06:07, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   include/hw/xen/xen_common.h | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 77ce17d8a4..c2d2f36bde 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,8 +467,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>   {
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>   {

I think there is a return missing here.

>   }
>   
> @@ -600,8 +600,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>                                                     PCI_FUNC(pci_dev->devfn));
>   }
>   
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>   {
>       int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
>                                                   HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> @@ -609,12 +609,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
>   
>       if (rc == 0) {
>           trace_xen_ioreq_server_create(*ioservid);
> -        return;
> +        return rc;
>       }
>   
>       *ioservid = 0;
>       use_default_ioreq_server = true;
>       trace_xen_default_ioreq_server();
> +
> +    return rc;
>   }
>   
>   static inline void xen_destroy_ioreq_server(domid_t dom,

Cheers,

-- 
Julien Grall

