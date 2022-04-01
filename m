Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86BC4EF219
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297473.506776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIbJ-0002Uu-FL; Fri, 01 Apr 2022 14:50:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297473.506776; Fri, 01 Apr 2022 14:50:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naIbJ-0002T5-CC; Fri, 01 Apr 2022 14:50:09 +0000
Received: by outflank-mailman (input) for mailman id 297473;
 Fri, 01 Apr 2022 14:50:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tDTg=UL=citrix.com=prvs=083321efb=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1naIbH-0002Oa-OS
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:50:07 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04115178-b1cb-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 16:50:06 +0200 (CEST)
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
X-Inumbo-ID: 04115178-b1cb-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648824606;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=eVuprM1HycjDsQgxnHjHvP/Xp4/+myD54orpOgIcw2Q=;
  b=AS1K+0u2ncKyCjLX/hGFRFN859srsjZASt6VgO20WcWzw8hPXcu3tBB2
   XX23bYe5Hew0HmP5A6NNbiaakvbsxHEuQzNuOZb0IX6dkCES2vYW3fUBo
   VFpxwlli422GfPC7EOpSKAYF3ePe1tHuCrmjwg9WgoMCyILJm75WX66re
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 67771780
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ha+W4qN5gQbi1yXvrR3Nl8FynXyQoLVcMsEvi/4bfWQNrUp0hmYPy
 2FMUGyAM6qOa2r3LdEkPoW18RgH7JGDn9FqSwto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZl2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zk
 f8RjKS+cAQTOaz0qsJFeTgJUCxGMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQqmBP
 pVJMVKDajzOOy8eNU88Wahmt+2whVj2SyFA+RWK8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQG9IJuzXSld9rHWByAkljclD9NGNdoHLhvgO2S8Zb87wGcD2kCazdObt06qcM7LQAXO
 k+1c8DBXmI27uDMIZ6J3vLN9G7pZ3BJRYMXTXVcJTbp9eUPt23aYvjnat94WJC4gdTucd0b6
 2Db9XNu71n/YCNi6klawbwlq2/0znQqZlRsjukyYo5DxlkmDGJCT9b0gWU3Fd4acO6koqCp5
 RDoYfS24uEUFo2qnyeQWugLF7zBz6/bbG2D3AQ1R8hwqmnFF5ufkWZ4um4WyKBBaJtsRNMUS
 BWL5VM5CGF7YhNGkpObk6ruUp93nMAM5PzuV+zOb8omX3SCXFTvwc2aXmbJhzqFuBF1yckXY
 M7HGe7xXSdyIfk2l1KeGrZCuYLHMwhjnAs/s7iglE/5uVdfDVbIIYo43KymNb5htvre8FSIq
 76y9aKikn1ibQE3WQGPmaZ7ELzABSFT6UzewyCPStO+Hw==
IronPort-HdrOrdr: A9a23:Wonlcq3KjnyIhynrAwPBQQqjBRxyeYIsimQD101hICG9Lfb2qy
 n+ppgmPEHP5Qr5AEtQ5OxpOMG7MBbhHQYc2/hfAV7QZnibhILOFvAt0WKC+UytJ8SazIBgPM
 hbAtFD4bHLfDtHZIPBkXOF+rUbsZi6GcKT9J/jJh5WJGkAAcAB0+46MHfhLqQffngcOXNTLu
 v52iMznUvHRZ1hVLXdOpBqZZmgm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerV8bMpiA2XkAgwbzYtBOe
 twrhKkX9A8N2KwoA3to9fPTB1kjUyyvD4rlvMSlWVWVc8EZKZWtpF3xjIfLH4sJlOy1GkcKp
 gnMCgc3ocjTXqKK3TC+mV/yt2lWXo+Wh+AX0gZo8SQlzxbhmpwwUcUzNEW2i5ozuNxd7BUo+
 Dfdqh4nrBHScEbKap7GecaWMOyTmjAWwjFPm6eKUnuUKsHJ3XOoZjq56hd3pDhRLUYiJ8p3J
 jRWlJRsmA/P0roFM2VxZVOtgvARW2sNA6dvP22J6IJzYEUaICbQxFrEmpe4PdIi89vd/HmZw
 ==
X-IronPort-AV: E=Sophos;i="5.90,227,1643691600"; 
   d="scan'208";a="67771780"
Date: Fri, 1 Apr 2022 15:50:00 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] tools/firmware: fix setting of fcf-protection=none
Message-ID: <YkcRGIy7l48BkZQz@perard.uk.xensource.com>
References: <20220401143720.23160-1-roger.pau@citrix.com>
 <20220401143720.23160-2-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220401143720.23160-2-roger.pau@citrix.com>

On Fri, Apr 01, 2022 at 04:37:18PM +0200, Roger Pau Monne wrote:
> Setting the fcf-protection=none option in EMBEDDED_EXTRA_CFLAGS in the
> Makefile doesn't get it propagated to the subdirectories, so instead
> set the flag in firmware/Rules.mk, like it's done for other compiler
> flags.
> 
> Fixes: 3667f7f8f7 ('x86: Introduce support for CET-IBT')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  tools/firmware/Makefile | 2 --
>  tools/firmware/Rules.mk | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
> index 53ed4f161e..345037b93b 100644
> --- a/tools/firmware/Makefile
> +++ b/tools/firmware/Makefile
> @@ -6,8 +6,6 @@ TARGET      := hvmloader/hvmloader
>  INST_DIR := $(DESTDIR)$(XENFIRMWAREDIR)
>  DEBG_DIR := $(DESTDIR)$(DEBUG_DIR)$(XENFIRMWAREDIR)
>  
> -EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
> -
>  SUBDIRS-y :=
>  SUBDIRS-$(CONFIG_OVMF) += ovmf-dir
>  SUBDIRS-$(CONFIG_SEABIOS) += seabios-dir
> diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
> index 9f78a7dec9..efbbc73a45 100644
> --- a/tools/firmware/Rules.mk
> +++ b/tools/firmware/Rules.mk
> @@ -13,6 +13,8 @@ endif
>  
>  CFLAGS += -Werror
>  
> +EMBEDDED_EXTRA_CFLAGS += -fcf-protection=none
> +

I think making modification to $(EMBEDDED_EXTRA_CFLAGS) outside of
"Config.mk" is confusing and would be better be avoided.

Could you instead call $(cc-option-add ) just for that extra CFLAGS?

>  $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  # Extra CFLAGS suitable for an embedded type of environment.

Thanks,

-- 
Anthony PERARD

