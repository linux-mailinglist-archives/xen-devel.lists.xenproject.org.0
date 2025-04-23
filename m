Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E946A99AD1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 23:36:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965524.1356063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hlv-0001nW-FE; Wed, 23 Apr 2025 21:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965524.1356063; Wed, 23 Apr 2025 21:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7hlv-0001m4-BY; Wed, 23 Apr 2025 21:36:47 +0000
Received: by outflank-mailman (input) for mailman id 965524;
 Wed, 23 Apr 2025 21:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Ler=XJ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7hls-0001lw-Cg
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 21:36:45 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bd509e8-208b-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 23:36:42 +0200 (CEST)
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
X-Inumbo-ID: 0bd509e8-208b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745444201; x=1745703401;
	bh=hJBKv8pfFZGikcLGHeTs42/auIRExJLSdBWoF0STFhE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Iqnlw0yAddWegPLdfntNeNJcVVvekSuDRZmwbdzHVedZvU36NetNs6P92WFzMK8E+
	 leN2+n6e+kaw+3NvWQb7zUhyu6WrXtJFsV0954BM7AmTzvt/AtyfU1xi/2Kppn6nju
	 IRcheQzIlxyUtG/UhrphEf7P3OdUtxc5bZYv9yfa8TOgTwI9p33jvndgdAkQzqXXSZ
	 2frsbAFBqvxe7A2Iu0rSUg/tFzcxl46cOS3OjiwUQaTsMGGFMCi3iuCnh9fa3noFN5
	 2TWCRpmesitQ/Z232nQiG0MVY74R/aMrt0dnxYcjbYL/aZOF4uTq8LjXXIM3w9MTq+
	 AKu+At5msrKtg==
Date: Wed, 23 Apr 2025 21:36:35 +0000
To: Jason Andryuk <jason.andryuk@amd.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/vpci: Fix msix existing mapping printk
Message-ID: <aAldXz0zFDc9md0p@kraken>
In-Reply-To: <20250423212229.32721-1-jason.andryuk@amd.com>
References: <20250423212229.32721-1-jason.andryuk@amd.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cbce616423299beeb8aa9522d74a25f0b09b7419
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 05:22:29PM -0400, Jason Andryuk wrote:
> The format string lacks a space, so mfn and type run together:
> (XEN) d0v0 0000:06:00.7: existing mapping (mfn: 753037type: 0) at 0x1 clo=
bbers MSIX MMIO area
>=20
> Add a space.
>=20
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>

Reviewed-by: Denis Mukhin <dmukhin@ford.com>

> ---
>  xen/drivers/vpci/msix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index f3804ce047..499810b238 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -666,7 +666,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
>                  put_gfn(d, start);
>                  gprintk(XENLOG_WARNING,
>                          "%pp: existing mapping (mfn: %" PRI_mfn
> -                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> +                        " type: %d) at %#lx clobbers MSIX MMIO area\n",
>                          &pdev->sbdf, mfn_x(mfn), t, start);
>                  return -EEXIST;
>              }
> --
> 2.49.0
>=20
>=20


