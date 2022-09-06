Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FE15AF6ED
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400062.641635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFr-0000dl-GW; Tue, 06 Sep 2022 21:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400062.641635; Tue, 06 Sep 2022 21:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFr-0000XB-9c; Tue, 06 Sep 2022 21:37:11 +0000
Received: by outflank-mailman (input) for mailman id 400062;
 Tue, 06 Sep 2022 21:37:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVgFp-0000Cs-Gl
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 21:37:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2306c22a-2e01-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:29:55 +0200 (CEST)
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
X-Inumbo-ID: 2306c22a-2e01-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662481795;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0G/6mXL/Y37gyhQ+RC+HyWT47eAXf3k8XGHQflSS00o=;
  b=WSSWx9Oy3+kf2yf5PfhPGeinJnfTfHn6qA603bz5+RhkK3h0qDpyRYXJ
   0P23MLRI/YUekptwf7JKBhto0sHUKZSFJTRCJqwf4xUg8bQPd7qgAbu3C
   EIPURbt3Jlad15tmSksd92LGRLd6nB9ezvPSrXlBltClTn9N8u8ZWHAHA
   0=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80309892
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/4G4RawJIhQ3HtDeT5d6t+dWwSrEfRIJ4+MujC+fZmUNrF6WrkVTz
 2EeDWuGOvePYjehKNonYInkpkxQu5TSmNFhQQM/qCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Usx5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN1qVmUXBa8j+9xeAFF/6
 uY/MnM8Qz6M0rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5Fwpi+C8YIuPEjCMbeJz3U2ni
 FnexV78CxwRbfjE1mG37W3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTpv20iVWiSslfA
 0MR8ysq66M18SSDS9j+Ulu4p3qBswU0X9tWGvc9rgaXxcL85AKUBXMNSDJbX8A3r889RTEs1
 VihksvgAHpkt7j9YXCA8raZqxuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLOKu8kt30FCy22
 zeLtikznZ0XjMgCzaL99lfC6xqyp57CQwgpoArKX3656R9RYI+jbpavr1/B4p5oPIufC1WMo
 nUAs8yf9/wVS4GAkmqKWuplNK+o/fueMHvfnFtmBbEl9jKk4XnleppfiBllOEpnO8ADPyT1a
 UXevQdQ4p57LHqubKlnJYm2DqwCxKztBZLvW/bSY9dmZpl3fRWAuiZ0aia4xHz3mVQriuQzN
 Imzdt7pCXcBFb8hyDuwTv0al7gxyUgDKXj7HM6hiU79iPzHOSDTGext3Eaygv4R6PmggT33y
 NdlHsq6+gpFd/e9UwT5/ttGRbwVFkTXFawauuQOKLDZelo9ST9/YxPC6eh/ItI4xsy5gs+Np
 yjgAREAlTITkFWdcW23hmZfhKQDtHqVhVYyJmQSMFmhwBDPiq7/vf5EJ/PbkVTKndGPLMKYr
 NFfIa1s+twVFlz6F801NPERVrBKehWxnh6pNCG4ejU5dJMIb1WXpIW4JlG+q3JUUXPfWS4CT
 1qIj1qzfHb+b146UJa+hAyHlDtdQkTxaMotBhCVc7G/iW3n8ZRwKjyZs8Lb1/okcEybrgZ2I
 i7MXn/0U8GR/NJumDQI7IjYx7qU/xxWRxAFQDeEsufvZUE3PAOLmOd9bQpBRhiFPEucxUloT
 b4Kpx0gGJXrRGp3jrc=
IronPort-HdrOrdr: A9a23:5R4ZR6qHimWS2n3Kjoydy3oaV5oreYIsimQD101hICG8cqSj+f
 xGuM5rsSMc6QxhPU3I9ursBEDtex/hHNtOkO4s1NSZLWvbUQmTTL2KhLGKq1aLJ8S9zJ8/6U
 4JSdkZNDSaNzlHZKjBjzWFLw==
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="80309892"
Date: Tue, 6 Sep 2022 17:29:31 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V5 3/6] libxl: arm: Create alloc_virtio_mmio_params()
Message-ID: <Yxd1a1m9aH7tkk5F@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <e07aa93a748525d81d6524c492347626ca7a362a.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e07aa93a748525d81d6524c492347626ca7a362a.1661159474.git.viresh.kumar@linaro.org>

On Mon, Aug 22, 2022 at 02:45:15PM +0530, Viresh Kumar wrote:
> Create a separate routine to allocate base and irq for a device as the
> same code will be required for each device type.
> 
> Suggested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  tools/libs/light/libxl_arm.c | 46 +++++++++++++++++++++++++-----------
>  1 file changed, 32 insertions(+), 14 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 1a3ac1646e94..0e3051bac5e4 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -85,20 +103,12 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          libxl_device_disk *disk = &d_config->disks[i];
>  
>          if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO) {
> -            disk->base = alloc_virtio_mmio_base(gc, &virtio_mmio_base);
> -            if (!disk->base)
> -                return ERROR_FAIL;
> -
> -            disk->irq = alloc_virtio_mmio_irq(gc, &virtio_mmio_irq);
> -            if (!disk->irq)
> -                return ERROR_FAIL;
> +            int rc = alloc_virtio_mmio_params(gc, &disk->base, &disk->irq,
> +                                              &virtio_mmio_base,
> +                                              &virtio_mmio_irq);
>  
> -            if (virtio_irq < disk->irq)
> -                virtio_irq = disk->irq;
> -            virtio_enabled = true;

This change to virtio_irq and virtio_enabled, as well as the chunck
below, isn't explained in the patch description.

> -
> -            LOG(DEBUG, "Allocate Virtio MMIO params for Vdev %s: IRQ %u BASE 0x%"PRIx64,
> -                disk->vdev, disk->irq, disk->base);
> +            if (rc)
> +                return rc;
>          }
>      }
>  
> @@ -107,8 +117,16 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>       * present, make sure that we allocate enough SPIs for them.
>       * The resulting "nr_spis" needs to cover the highest possible SPI.
>       */
> -    if (virtio_enabled)
> +    if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
> +        virtio_enabled = true;
> +
> +        /*
> +         * Assumes that "virtio_mmio_irq" is the highest allocated irq, which is
> +         * updated from alloc_virtio_mmio_irq() currently.
> +         */
> +        virtio_irq = virtio_mmio_irq - 1;
>          nr_spis = max(nr_spis, virtio_irq - 32 + 1);
> +    }
>  
>      for (i = 0; i < d_config->b_info.num_irqs; i++) {
>          uint32_t irq = d_config->b_info.irqs[i];

Thanks,

-- 
Anthony PERARD

