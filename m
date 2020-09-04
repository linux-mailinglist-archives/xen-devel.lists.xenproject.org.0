Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B025D3FD
	for <lists+xen-devel@lfdr.de>; Fri,  4 Sep 2020 10:53:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kE7Sq-00087L-MR; Fri, 04 Sep 2020 08:52:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/+qm=CN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kE7Sp-00087G-FY
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2020 08:52:55 +0000
X-Inumbo-ID: a2f51831-edc7-41ab-98a9-9607034a54ba
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a2f51831-edc7-41ab-98a9-9607034a54ba;
 Fri, 04 Sep 2020 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1599209573;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RnUJNOf4CaYsuRZLDt2r6rvifeKeMVgj45xh20GyzEU=;
 b=RN2YSi7If2nE86Y892L+mID+QA09gSWuXSlb8Vp4L7TYE9kZAQFtP+xA
 MAr/1Zxu/VXpIOOQOp4m1Ryof8gVCHBanu8Ocdi9mJSR6OIrYLRqShSpY
 N/V+4EHGW7V+uctlG2rMyrEmTByuazU5bATKtyikLbIth4DmWMvqe+GER w=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WzYs+O+c2I9cwNchukCbDn8Ci4XvgtHp5iBbFdMfxmVQnjUaKqZGswmBdBKEmZVuiniFxL+Qbe
 sgH1sCyuzcN7h1ZPsJ/sAQmdUtMo6H0t5U9G+U1C1nly272n0Uf62RBxZtDXgKSlOVsj1cqCfK
 ZMEB+KEPzT5CgLBW+Nq3sm8h1RanRW9qKV5R6OyFeWKjZk/xSHWsKrUk+aGiQguVuhdCfYEBgD
 mUPQwxsLXFHXlc4PnA+MRymiS3kPo2NQgmK85GpAuGy/ClRupN3iBYCyHMjUSy8wPj0VQvadku
 Lek=
X-SBRS: 2.7
X-MesageID: 25975881
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,389,1592884800"; d="scan'208";a="25975881"
Date: Fri, 4 Sep 2020 10:52:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Paul Durrant <paul@xen.org>
CC: <xen-devel@lists.xenproject.org>, Paul Durrant <pdurrant@amazon.com>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Anthony PERARD
 <anthony.perard@citrix.com>
Subject: Re: [PATCH 2/2] libxl: do not automatically force detach of block
 devices
Message-ID: <20200904085244.GO753@Air-de-Roger>
References: <20200903100537.1337-1-paul@xen.org>
 <20200903100537.1337-3-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20200903100537.1337-3-paul@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, Sep 03, 2020 at 11:05:37AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The manpage for 'xl' documents that guest co-operation is required for a (non-
> forced) block-detach operation and that it may consequently fail. Currently,
> however, the implementation of generic device removal means that a time-out
> of a block-detach is being automatically re-tried with the force flag set
> rather than failing. This patch stops such behaviour.

Won't this break cleanup on domain shutdown if the guest doesn't close
the devices itself?

I think we need some special-casing on shutdown that keeps the current
behavior on that case.

> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Wei Liu <wl@xen.org>
> Cc: Anthony PERARD <anthony.perard@citrix.com>
> ---
>  tools/libxl/libxl_device.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/libxl/libxl_device.c b/tools/libxl/libxl_device.c
> index 0381c5d509..d17ca78848 100644
> --- a/tools/libxl/libxl_device.c
> +++ b/tools/libxl/libxl_device.c
> @@ -1092,7 +1092,8 @@ static void device_backend_callback(libxl__egc *egc, libxl__ev_devstate *ds,
>  
>      if (rc == ERROR_TIMEDOUT &&
>          aodev->action == LIBXL__DEVICE_ACTION_REMOVE &&
> -        !aodev->force) {
> +        !aodev->force &&
> +        aodev->dev->kind != LIBXL__DEVICE_KIND_VBD) {

Doing this differentiation for block only seems weird, we should treat
all devices equally.

Thanks, Roger.

