Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45ED24BBADE
	for <lists+xen-devel@lfdr.de>; Fri, 18 Feb 2022 15:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275546.471472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4WR-00040n-Ti; Fri, 18 Feb 2022 14:46:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275546.471472; Fri, 18 Feb 2022 14:46:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nL4WR-0003xr-Q3; Fri, 18 Feb 2022 14:46:11 +0000
Received: by outflank-mailman (input) for mailman id 275546;
 Fri, 18 Feb 2022 14:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Bzb=TB=citrix.com=prvs=041dc651e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nL4WQ-0003xV-Gb
 for xen-devel@lists.xenproject.org; Fri, 18 Feb 2022 14:46:10 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8160fc5e-90c9-11ec-8eb8-a37418f5ba1a;
 Fri, 18 Feb 2022 15:46:09 +0100 (CET)
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
X-Inumbo-ID: 8160fc5e-90c9-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645195568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=76scZa6Wb0sZrTMu+slcePwmpKNJDx+oKFLbu6zjHWM=;
  b=ORJQNpwwvAUVxG69bFNCQQlnR+K2ytPpNzs8VRhNXSVoPfNN0ygWeB+c
   /KKIjpSeGLZBsTx1Ktf2kMfrbXNuFuU4GT22Ii0zpGGX1PSuxLzbs36Ee
   wJceXDV8e4EdMtiIWZajOC6J+Rim2LN8PIWasD3bWy6JkEhz7asK+I3f+
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64521464
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:n0fcx6vrK+n12SoEhzBPMqYJA+fnVEteMUV32f8akzHdYApBsoF/q
 tZmKW7UOKmIZWOmed8iatyw/R8Bv57Sy4dmSAQ+q3gyEysU+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQzy4bVvqYy2YLjW1nU6
 YuoyyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi8UYKz2vOVBSSVGODgjOaYbou7Bf1aW5Jn7I03uKxMAwt1rBUAye4YZ5vx2ESdF8
 vlwxDIlN07ZwbjsmfTiF7cq1p9LwMrDZevzvllpyy3ZCvA3B4jOWazQ6fdT3Ssqh9AIFvHbD
 yYcQWQzMU6ZP0MTUrsRILFhlfmHg1P5SGIbsXGno+kF+EHhjyUkhdABN/KKI4fXFK25hH2wu
 Wbu72n/RBYAO7S30iGZ+3ihguvOmyLTW48IErC8sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvH2Vge0p3OstRcGV91dVeY97WmwJrH8uljDQDJeF3gYNYJg5JReqSEWO
 kGhoo3oPxhu7KepV1mEq7Of8GnjP3Y7BDpXDcMbdjct797mqYA1qxvASNd/DaK45uHI9SHML
 yOi93Zn2ehK5SIf/+DipA2c3WrwznTcZlNtvm3qsnSZAhSVjWJPT6ih8hDl4PlJN+51pXHR7
 SFfy6ByAA3jZKxhdRBhos1RTdlFBN7faVUwZGKD+bF4plxBHFb5IOhtDMlWfhsBDyr9UWaBj
 LXvkQ1Q/oRPG3ChcLV6ZYm8Y+xzk/S9TI65DqGIMIMUCnSUSONh1Hg/DaJ39zqw+HXAbIllY
 cvLGSpSJS1y5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLFDEN5vYwtaQPUBshgtfvsiFyMr
 753apvboz0CAbaWSnSGruYuwaUicCFT6Wbe8JcMKIZu42NORQkcNhMm6el/I9c8x/wNzI8lP
 BiVAydl9bY2vlWfQS3iV5ypQOqHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:z5aksqm5o1NXqw1torQzH4zAp6bpDfIq3DAbv31ZSRFFG/Fxl6
 iV8sjz8SWE7Ar5P0tQ/uxoWZPwJE80mqQZ3WB8B9uftUzdyQ2VxeJZnOnfKl/bexEWn9Q1vc
 wLT0E9MqySMbETt7eC3ODSKbcdKbe8n5yVuQ==
X-IronPort-AV: E=Sophos;i="5.88,379,1635220800"; 
   d="scan'208";a="64521464"
Date: Fri, 18 Feb 2022 14:46:03 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein
	<cardoe@cardoe.com>, Wei Liu <wl@xen.org>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] CI: Clean up alpine containers
Message-ID: <Yg+xK0xO3Rk8+xZe@perard.uk.xensource.com>
References: <20220218131811.31133-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220218131811.31133-1-andrew.cooper3@citrix.com>

On Fri, Feb 18, 2022 at 01:18:11PM +0000, Andrew Cooper wrote:
>  * `apk --no-cache` is the preferred way of setting up containers, and it does
>    shrink the image by a few MB.
>  * Neither container needs curl-dev.
>  * Flex and bison are needed for Xen, so move to the Xen block.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> 
> I've already rebuilt the containers and confirmed that the build is still fine.
> ---
> diff --git a/automation/build/alpine/3.12-arm64v8.dockerfile b/automation/build/alpine/3.12-arm64v8.dockerfile
> index a1ac9605959e..006cdb3668b3 100644
> --- a/automation/build/alpine/3.12-arm64v8.dockerfile
> +++ b/automation/build/alpine/3.12-arm64v8.dockerfile
> @@ -8,46 +8,39 @@ RUN mkdir /build
>  WORKDIR /build
>  
>  # build depends
> -RUN \
> -  # apk
> -  apk update && \
> +RUN apk --no-cache add \
>    \
>    # xen build deps
> -  apk add argp-standalone && \
> -  apk add autoconf && \
> -  apk add automake && \
> -  apk add bash && \
> -  apk add curl && \
> -  apk add curl-dev && \
> -  apk add dev86 && \
> -  apk add dtc-dev && \
> -  apk add gcc  && \
> +  argp-standalone \
> +  autoconf \
> +  automake \

Since you are removing some other pkgs, I don't think "automake" is
needed either. We only use "autoconf" and "autoheader". (Maybe the
automake pkg give access to something we need, but I'm not sure about
that.)


In any case, changes looks good:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

