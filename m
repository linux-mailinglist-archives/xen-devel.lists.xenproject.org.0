Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C759F67BF6C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 22:59:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484601.751252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnn9-0006vC-NS; Wed, 25 Jan 2023 21:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484601.751252; Wed, 25 Jan 2023 21:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKnn9-0006sB-KC; Wed, 25 Jan 2023 21:58:51 +0000
Received: by outflank-mailman (input) for mailman id 484601;
 Wed, 25 Jan 2023 21:58:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKnn8-0006rz-Az
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 21:58:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71899ab7-9cfb-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 22:58:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0EBA8616A1;
 Wed, 25 Jan 2023 21:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CE73C433EF;
 Wed, 25 Jan 2023 21:58:45 +0000 (UTC)
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
X-Inumbo-ID: 71899ab7-9cfb-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674683926;
	bh=CctgY9rPc7Uype53cxREDxzCw01bCr9SqjFOC+BRSIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=WXjMkSoanXUQhAi3Rbv8aMAGAH1jFgCe/RYw7tGNwreaW4z8zAEE0dUk3cdV/8FBj
	 2o580OUMHmemvJOj24TkcvLwbBOIEpGiX77v3Hv9bXxVWf22p5sIVu6Em950pZ9CI9
	 QQmpVcQodzkO/45cEBt7bLxrV13tUDS0y8SBwmR1iXT4qvuxQFUsODOQOU4vqzyP/M
	 ZaHLFQ46DmZJtFoHoe1bxd3MfoZiJ/oolV55BzO1s9bd//XGqk76GZ+a0kQXiNNJke
	 ZLnP2qx/XrvQklmrqWWldW+AVjf9+BJmlzCAKYqUtYIyL5QKy0DrM3Z9GO8GiFX07F
	 9k6VlhIN+x6yg==
Date: Wed, 25 Jan 2023 13:58:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org, 
    stefano.stabellini@amd.com, alex.bennee@linaro.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: Re: [QEMU][PATCH v4 05/10] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
In-Reply-To: <20230125085407.7144-6-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251357590.1978264@ubuntu-linux-20-04-desktop>
References: <20230125085407.7144-1-vikram.garhwal@amd.com> <20230125085407.7144-6-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Vikram Garhwal wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> This is done to prepare for enabling xenpv support for ARM architecture.
> On ARM it is possible to have a functioning xenpv machine with only the
> PV backends and no IOREQ server. If the IOREQ server creation fails,
> continue to the PV backends initialization.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

I know I am co-author of the patch but just for record-keeping to
remember that I also reviewed this patch:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/hw/xen/xen_common.h | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> index 9a13a756ae..9ec69582b3 100644
> --- a/include/hw/xen/xen_common.h
> +++ b/include/hw/xen/xen_common.h
> @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
>  {
>  }
>  
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>  {
> +    return 0;
>  }
>  
>  static inline void xen_destroy_ioreq_server(domid_t dom,
> @@ -600,8 +601,8 @@ static inline void xen_unmap_pcidev(domid_t dom,
>                                                    PCI_FUNC(pci_dev->devfn));
>  }
>  
> -static inline void xen_create_ioreq_server(domid_t dom,
> -                                           ioservid_t *ioservid)
> +static inline int xen_create_ioreq_server(domid_t dom,
> +                                          ioservid_t *ioservid)
>  {
>      int rc = xendevicemodel_create_ioreq_server(xen_dmod, dom,
>                                                  HVM_IOREQSRV_BUFIOREQ_ATOMIC,
> @@ -609,12 +610,14 @@ static inline void xen_create_ioreq_server(domid_t dom,
>  
>      if (rc == 0) {
>          trace_xen_ioreq_server_create(*ioservid);
> -        return;
> +        return rc;
>      }
>  
>      *ioservid = 0;
>      use_default_ioreq_server = true;
>      trace_xen_default_ioreq_server();
> +
> +    return rc;
>  }
>  
>  static inline void xen_destroy_ioreq_server(domid_t dom,
> -- 
> 2.17.0
> 
> 

