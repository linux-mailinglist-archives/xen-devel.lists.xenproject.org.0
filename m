Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C94C31F9700
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 14:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkoX6-0007yQ-V3; Mon, 15 Jun 2020 12:48:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jkoX5-0007yL-IH
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 12:48:11 +0000
X-Inumbo-ID: 75254b46-af06-11ea-b7fa-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 75254b46-af06-11ea-b7fa-12813bfff9fa;
 Mon, 15 Jun 2020 12:48:06 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Nh5LXmhLtCbbZ63JR5d3tnwCEewMo1+TaSAPZ8FxYOH1Kxe8NtpniYLsiKTds5PMA0laHTNakk
 nLiIwcZDT9zM0ygdqkZkaB3yBFEf2WKDoRxHP5wMshRODN2qn1iI+LdEUIavkGJrYx0Ub9dyDE
 aI+anYMAgQlixzXO6PTXZdj/aupni6RIg9tlQQI3kN+KttoWb2gufhS2Jm+Xl1CAOlXr+i9+k2
 UxosB4mQvLqCiQtjssaxOl1tLBjKOoUYF8437gTzPoAugsUoTxPSSes8f6Vfxgkt3oz9NDi/S9
 6PE=
X-SBRS: 2.7
X-MesageID: 20289285
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20289285"
Date: Mon, 15 Jun 2020 14:47:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Grzegorz Uriasz <gorbak25@gmail.com>
Subject: Re: [PATCH] hw/xen_pt: Don't grant opregion permissions
Message-ID: <20200615124758.GF735@Air-de-Roger>
References: <2157e10d63619d43151fe8b8ca913b44c54aba6e.1592176600.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <2157e10d63619d43151fe8b8ca913b44c54aba6e.1592176600.git.gorbak25@gmail.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, jakub@bartmin.ski,
 qemu-devel@nongnu.org, marmarek@invisiblethingslab.com,
 Anthony Perard <anthony.perard@citrix.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Jun 14, 2020 at 11:21:09PM +0000, Grzegorz Uriasz wrote:
> With the upstreaming of linux based stubdomains to xen, qemu can't
> assume it runs inside dom0 - permission assignment must be moved to
> libxl running in dom0. This xen patch:
> https://lists.xenproject.org/archives/html/xen-devel/2020-06/msg00973.html
> implements granting the required permissions to the stubdomain running
> qemu. This patch removes granting opregion permissions in qemu - this
> should be fine as when qemu is running inside dom0 the memory mapping will
> be successfully created without first explicitly granting the permission.

In order to avoid breaking certain libxl - QEMU combinations, could
you make the check below non-fatal?

So that the current code can be kept for dom0 while not throwing an
error when used inside of a stub domain?

Thanks, Roger.

