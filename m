Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE6BFCF52
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 17:45:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1148381.1480456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBb0Z-0006p1-Sp; Wed, 22 Oct 2025 15:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1148381.1480456; Wed, 22 Oct 2025 15:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBb0Z-0006mC-Q5; Wed, 22 Oct 2025 15:44:15 +0000
Received: by outflank-mailman (input) for mailman id 1148381;
 Wed, 22 Oct 2025 15:44:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1vBb0Y-0006m6-Q7
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 15:44:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBb0Y-00EMVE-0j;
 Wed, 22 Oct 2025 15:44:14 +0000
Received: from [2a01:cb15:80df:da00:94d0:641e:16e6:ca4b] (helo=l14)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <anthony@xenproject.org>) id 1vBb0Y-008zwF-0R;
 Wed, 22 Oct 2025 15:44:14 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date;
	bh=kslds1OBdnCvK/T0brqthIDAdAGOYeZMymJennuqMqM=; b=VunTvxZlDPWI/8iyu6sxC4me2W
	4J1jEsYM3Zq6Px1jVThkLgYLB9Lu7CCHkbfpoEEDGV/ZREWzjQRFd64Es1UMV1kji/EuHcSdqpp8E
	R0s4glrBiEXo4Js2+YCy/pbkPesaUlUGsD88PdrsWoSIvDp72tMx300bwhrnLn4qJjiY=;
Date: Wed, 22 Oct 2025 17:44:12 +0200
From: Anthony PERARD <anthony@xenproject.org>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, Huang Rui <ray.huang@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/1] tools/libs/light: fix BAR memory address
 truncation
Message-ID: <aPj7zIQ0b0wYFQ6w@l14>
References: <20251013074533.67478-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013074533.67478-1-Jiqian.Chen@amd.com>

On Mon, Oct 13, 2025 at 03:45:33PM +0800, Jiqian Chen wrote:
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 2ea2caeb6624..ae416a162360 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -2040,7 +2041,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                   size, 0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_ioport_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,
>                            start,
>                            size);
>              } else {
> @@ -2050,7 +2051,7 @@ static void pci_remove_detached(libxl__egc *egc,
>                                                  0);
>                  if (rc < 0)
>                      LOGED(ERROR, domid,
> -                          "xc_domain_iomem_permission error 0x%x/0x%x",
> +                          "xc_domain_ioport_permission error %#"PRIx64"/%#"PRIx64,

Why does this message refer to "xc_domain_ioport_permission" now instead
of "xc_domain_iomem_permission" ? (I'm guessing overzealous copy/past
;-) from the previous error message)

Cheers,

-- 
Anthony PERARD

