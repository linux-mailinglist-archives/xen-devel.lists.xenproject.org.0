Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97014073DD
	for <lists+xen-devel@lfdr.de>; Sat, 11 Sep 2021 01:27:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184870.333663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpva-0000jv-Ui; Fri, 10 Sep 2021 23:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184870.333663; Fri, 10 Sep 2021 23:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOpva-0000i7-Re; Fri, 10 Sep 2021 23:27:26 +0000
Received: by outflank-mailman (input) for mailman id 184870;
 Fri, 10 Sep 2021 23:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGUI=OA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mOpvZ-0000hz-Fc
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 23:27:25 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce488288-3aa8-4297-82cb-7c0932692689;
 Fri, 10 Sep 2021 23:27:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07A4E61211;
 Fri, 10 Sep 2021 23:27:24 +0000 (UTC)
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
X-Inumbo-ID: ce488288-3aa8-4297-82cb-7c0932692689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631316444;
	bh=MTpyGMzRwzcZckX1Knm3eAP7QqVukVmqh2sPwyO9Yu0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DyyDq8G4s5uAzUcahf9t9rQB8ahLVLLBpkqerShVx5NmalJXs5fAu1lbV6IZ+WhzX
	 XAcn58BFCMUD2sKtlYkoaWIFkckUj1/UG44RorEAw795xzQkBz7zwR6wSEi05NuOOs
	 N16VJ43Qr8cCd19Vqqc3v2WDMYtOFsUcEZ1Ea2rRi8kfMBUKc/QPPhBlKfvfLiWffH
	 2FtDXArYULt2YKZB6w9frMgxvgQzdr+CxoTPUThOoEMb5/xCBMOVbPt/RYXZb8oCc4
	 qhMZQ+fhiFMz1tqxpuv4aIaj00F7cRdYcTEnPOVI0O+73zBaN39eFLqp6qoZuep4Yw
	 XKCUYsZ6HSUEA==
Date: Fri, 10 Sep 2021 16:27:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Juergen Gross <jgross@suse.com>, 
    Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    lkml <linux-kernel@vger.kernel.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 09/12] swiotlb-xen: drop DEFAULT_NSLABS
In-Reply-To: <15259326-209a-1d11-338c-5018dc38abe8@suse.com>
Message-ID: <alpine.DEB.2.21.2109101627170.10523@sstabellini-ThinkPad-T480s>
References: <588b3e6d-2682-160c-468e-44ca4867a570@suse.com> <15259326-209a-1d11-338c-5018dc38abe8@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 7 Sep 2021, Jan Beulich wrote:
> It was introduced by 4035b43da6da ("xen-swiotlb: remove xen_set_nslabs")
> and then not removed by 2d29960af0be ("swiotlb: dynamically allocate
> io_tlb_default_mem").
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -152,8 +152,6 @@ static const char *xen_swiotlb_error(enu
>  	return "";
>  }
>  
> -#define DEFAULT_NSLABS		ALIGN(SZ_64M >> IO_TLB_SHIFT, IO_TLB_SEGSIZE)
> -
>  int xen_swiotlb_init(void)
>  {
>  	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
> 

