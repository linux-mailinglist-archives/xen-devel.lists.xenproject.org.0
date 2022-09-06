Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C145AE49B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 11:44:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399717.640989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVV84-0001QC-9y; Tue, 06 Sep 2022 09:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399717.640989; Tue, 06 Sep 2022 09:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVV84-0001Nd-67; Tue, 06 Sep 2022 09:44:24 +0000
Received: by outflank-mailman (input) for mailman id 399717;
 Tue, 06 Sep 2022 09:44:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVV83-0001NV-4r
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 09:44:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a798841-2dc8-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 11:44:20 +0200 (CEST)
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
X-Inumbo-ID: 7a798841-2dc8-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662457460;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bPyyuT8mKNP4f28QVf9lsNEun9V5OpHrXza/LRAjcSM=;
  b=a1kdPCqFyzQbzUdtJIobPYYsPYUGeLHadfWpIu474LhFk3FnKJX35Xaq
   7GniVqH9JQcjkbQO6P2iLy1M+Pexfj0Ml/LktASwBQ9n4q6wXADLLy0Mz
   1lT0RgasWSOedzjRtQAb4CQf4hrqUtCeNUr9fC6SNf18euQqCj3RKhVm1
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82351095
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zcNVl6uI5d/yLsUlTE1iRdepFufnVI1eMUV32f8akzHdYApBsoF/q
 tZmKTuPO/bZazb8fdtyaNu0/ENSsZSBx9JkTgI+qi8zHnlB+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4G1A5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fc49wPRXHkdHz
 LsVJylVTzqmq9K2zr3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3FYICOJ4XSFJg9ckCw/
 E3/+XTpGDomKtW62SWhrlyBoMHvpHauMG4VPOLhraM76LGJ/UQ5BQcKT1K9rb+cg1SnRtNEA
 0UO/2wlqq1a3HKsSt7xThipukmutxQXW8dTO+Ai4QTLwa3Riy6GAkAUQzgHb8Yp3Oc0SiYtz
 UShhM7yCHpkt7j9YWKQ8PKYoC2/PQARLHQefmkUQA0d+d7hrYovyBXVQb5LEqOzlZvqGDL0y
 jaGoTIWg7QVhNQMkaKh8jjvgS+op5XPZh444EPQRG3NxhhieIevaois6F7axfVNNoCUSh+Gp
 ndspiSFxLlQV9fXznXLGbhTWuHyjxqYDNHCqR1KJYsB6BKkwjmucpkIwRtbCHdpPMlRLFcFf
 3TvVRNtCI57ZSX0N/cnONPvVazG3oC7S427C6m8gs5mJ8EoKVTZpHwGiVu4hTiFraQ6rU0o1
 X53m+6IBG1SN6loxSHeqww1ge5ynXBWKY8+qPnGI/WbPVm2PiT9pU8tagfmUwzAxPrsTP/p2
 9heLdCW7B5UTffzZCLamaZKcw5QcSBhVM+t8ZMOHgJmHuaBMDh4Y8I9PJt7I9A190irvrygE
 o6Btr9wlwOk2CyvxfSiYXF/crL/NatCQYYAFXV1ZT6VN40LO9nHAFE3K8RqJtHKNYVLkZZJc
 hXyU5/eUqgXGmubpG51gFuUhNUKSSlHTDmmZ0KNCAXTtbY6L+AV0rcIpjfSyRQ=
IronPort-HdrOrdr: A9a23:+CPVr6lXUAtNCgqPKQXSXCcNbU/pDfIs3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5OUtQ/OxoV5PsfZqxz/JICMwqTNCftWrdyQmVxeNZjbcKqgeIc0aVygce79
 YCT0EXMqyXMbEQt6fHCWeDfOod/A==
X-IronPort-AV: E=Sophos;i="5.93,293,1654574400"; 
   d="scan'208";a="82351095"
Date: Tue, 6 Sep 2022 10:44:12 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <Bertrand.Marquis@arm.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 3/9] xen/arm: add a primitive FF-A mediator
Message-ID: <YxcWbH3XImDpj/Yi@perard.uk.xensource.com>
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-4-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220818105601.1896082-4-jens.wiklander@linaro.org>

Hi Jens,

On Thu, Aug 18, 2022 at 12:55:55PM +0200, Jens Wiklander wrote:
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de093914..a985609861c7 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>          return ERROR_FAIL;
>      }
>  
> +    config->arch.ffa_enabled =
> +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);

There seems to be missing a call to libxl_defbool_setdefault() before
this. This could result in an abort when creating a guest for Arm.

A call to libxl_defbool_setdefault() probably want to be done in
libxl__arch_domain_build_info_setdefault() in libxl_arm.c.

>      return 0;
>  }
>  
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index b98c0de378b6..e0e99ed8d2b1 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2746,6 +2746,9 @@ skip_usbdev:
>              exit(-ERROR_FAIL);
>          }
>      }
> +    libxl_defbool_setdefault(&b_info->arch_arm.ffa_enabled, false);

This should be done in libxl (as pointed out above) instead of xl.

> +    xlu_cfg_get_defbool(config, "ffa_enabled",
> +                        &b_info->arch_arm.ffa_enabled, 0);
>  
>      parse_vkb_list(config, d_config);
>  

Thanks,

-- 
Anthony PERARD

