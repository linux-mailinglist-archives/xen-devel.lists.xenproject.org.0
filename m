Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F9E5AF6EB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400064.641661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFu-0001OO-5d; Tue, 06 Sep 2022 21:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400064.641661; Tue, 06 Sep 2022 21:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFu-0001L9-0x; Tue, 06 Sep 2022 21:37:14 +0000
Received: by outflank-mailman (input) for mailman id 400064;
 Tue, 06 Sep 2022 21:37:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVgFs-0000Cp-Pz
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 21:37:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 82615bf4-2e01-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:32:35 +0200 (CEST)
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
X-Inumbo-ID: 82615bf4-2e01-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662481955;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yqhlErwciJVAhXvw/R0wfVyEAMpDzNkidgSvAR/+DE=;
  b=SoLJft8MiPWh9mHsIHiK+EEcEsrN2QAUti32LXwP5LDsH17UxS9tZcth
   y6Iobvtfpf3KTdHJlY8onXJGpcffm61opnWFS/aFef3te/bLqyh5wq/Fy
   /wxMBWUsOYgRVy1wDlgS2R3W6DWq7SEYcmBN7DKtNvkJf77FG/ZrN77U3
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 79867428
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:owW9DawxTTKPT9QdOwR6t+dRwSrEfRIJ4+MujC+fZmUNrF6WrkUCz
 mtLC2rUa6qINGuhLYwkb4Wx90sC68LRzoJqQAdr/iAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv676yEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii8tjjMPR7zml4
 LsemOWCfg7+s9JIGjhMsfjb+Usx5K6aVA4w5TTSW9ga5DcyqFFNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiM+t5yZqgpDvkQPPpMTb5LwX6v1ZwKhxLidw
 P0V3XC5pJxA0qfkwIzxWDEAe81y0DEvFBYq7hFTvOTKp3AqfUcAzN12AWoPHdAl3dpUAEV81
 +c0GhYqZBa60rfeLLKTEoGAh+wmJcjveogepmth3XfSCvNOrZLrGvuQo4UChXFp254ITa22i
 8kxMFKDaDzJZQFPPVEGToozhu6yilH0ciFCqULTrq0yi4TW5FMggOaybICFEjCMbclWnByj/
 mLbxjXgCU4WK9Oc92um/X3504cjmgukAdlPRdVU7MVCn1m71mEVThoMWjOTpv20iVWiSslfA
 0MR8ysq66M18SSDS9j+Ulu4p3qBswU0X9tWGvc9rgaXxcL85AKUBXMNSDJbX8A3r889RTEs1
 VihksvgAHpkt7j9YXCA8raZqxuiNC5TKnUNDQcGQhEC+MLLu5wog1TESdMLOKu8kt30FCy22
 zeLtikznZ0XjMgCzaL99lfC6xqyp57CQwgpoArKX3656R9RYI+jbpavr1/B4p5oPIufC1WMo
 nUAs8yf9/wVS4GAkmqKWuplNK+o/fueMHvfnFtmBbEl9jKk4XnleppfiBllOEpnO8ADPyT1a
 UXevQdQ4p57LHqubKlnJYm2DqwCxKztBZLvW/bSY9dmZpl3fRWAuiZ0aia4xHz3mVQriuQzN
 Imzdt7pCXcBFb8hyDuwTv0al7gxyUgDKXj7HM6hiU79iPzHOSDTGext3Eaygv4R9K6vmSWIz
 vFjFMqu+TdEfN/YRSPRyNtGRbwVFkTXFawauuQOKLDZelo9ST9/YxPC6eh/ItI4xsy5gs+Np
 yjgAREAlTITkFWdcW23hmZfhKQDtHqVhVYyJmQSMFmhwBDPiq7/vf5EJ/PbkVTKndGPLMKYr
 NFfIa1s+twVFlz6F801NPERVrBKehWxnh6pNCG4ejU5dJMIb1WXpIW4JlG+q3JUUXPfWS4CT
 1qIj1qzfHb+b146UJa+hAyHlDtdQkTxaMotBhCVc7G/iW3n8ZRwKjyZs8Lb1/okcEybrgZ2I
 i7MXn/0U8GR/NJumDQI7IjYx7qU/xxWRxILTzWHvebqbkE3PAOLmOd9bQpBRhiFPEucxUloT
 bw9Iy3UWBHfoGt3jg==
IronPort-HdrOrdr: A9a23:akVhwqGmddJCPsP/pLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="79867428"
Date: Tue, 6 Sep 2022 17:32:28 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V5 4/6] libxl: arm: Split make_virtio_mmio_node()
Message-ID: <Yxd2HCA9GDJS1A4N@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <981b663f6a44f9f82f32cc58219f6af26f73d66f.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <981b663f6a44f9f82f32cc58219f6af26f73d66f.1661159474.git.viresh.kumar@linaro.org>

On Mon, Aug 22, 2022 at 02:45:16PM +0530, Viresh Kumar wrote:
> make_virtio_mmio_node() creates the DT node for simple MMIO devices
> currently, i.e. the ones that don't require any additional properties.
> 
> In order to allow using it for other complex device types, split the
> functionality into two, one where the fdt node isn't closed and the
> other one to create a simple DT node.
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 0e3051bac5e4..4d0469f8166a 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1267,8 +1275,9 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
>                      iommu_created = true;
>                  }
>  
> -                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
> -                                           disk->backend_domid) );
> +                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,

Renaming that function to add the suffix "_simple" doesn't meaning full,
could you keep the same name?

> +                                                  disk->irq,
> +                                                  disk->backend_domid) );
>              }
>          }
>  

Thanks,

-- 
Anthony PERARD

