Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1776F481E
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 18:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528746.822277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsdy-0004dI-Oo; Tue, 02 May 2023 16:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528746.822277; Tue, 02 May 2023 16:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptsdy-0004ae-M8; Tue, 02 May 2023 16:14:22 +0000
Received: by outflank-mailman (input) for mailman id 528746;
 Tue, 02 May 2023 16:14:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M8xE=AX=citrix.com=prvs=479c33cca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ptsdx-0004aY-1E
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 16:14:21 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63048d9b-e904-11ed-8611-37d641c3527e;
 Tue, 02 May 2023 18:14:18 +0200 (CEST)
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
X-Inumbo-ID: 63048d9b-e904-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683044058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dlVsysxRrIKNoi35lH/qtyIF3TPOuG6EK6kie+J/XDs=;
  b=aKoANNoc/vLWoTEs6sGNeqOLhl2p50rd9HgJj7dkf5UnMTEjNzfjIPlf
   uadU+La7pvCD5YwE3jwQUNDYmpZbgDnsd+XrFjnO6mY81dYj2NLoNo6ZF
   P92YxuqV3H3MM5zoBqp5a6piS55vDr/1g8i13vOROwCoGxRKnaGjWdKFb
   M=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: None
X-MesageID: 110045256
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:c9ANzqD0YxOYnRVW/6jiw5YqxClBgxIJ4kV8jS/XYbTApDIi3jIHn
 2AcD2mPO/qKajD1e9lxbdvg9B5TsMWDyt9hQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFuspvlDs15K6p4G5A5ARkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw59x0JGdv5
 KYhNTkQbhOsgP+k/pC4Rbw57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9I4XSHZkIxBvGz
 o7A10P3WzNBKPLC9RSY/kuwn/7i2hznQp1HQdVU8dYv2jV/3Fc7DAAdXB21qP+yh0q6RvpWM
 UlS8S0rxYAi+UruQtTjUhmQpH+fogVaS9dWC/c96gyG1uzT+QnxLmIJVCJbYdoq8so/XyU31
 0ShlsnsQzdotdW9Vn+csLyUoDWaMDIQa2QFYEcsVwwe6cPkp4I1ph3KR9dnVqWyi7XdBjXY0
 z2M6i8kiN07j8ER0L6g1UvamD/qrZ/MJiY57xvadnio5QR4YMiifYPAwV3S9/NJNouaZliHo
 nkfmsKa4fwODJeCjyiESqMGG7TBz/+dPSfVm1JHA5gr/DPr8HmmFb28+xkneh0vaJxdP2a0P
 gmK41g5CIJvAUZGpJRfO+qZY/nGB4C5S7wJiti8ggJyX6VM
IronPort-HdrOrdr: A9a23:fG0L0qsGgBbImt6lLOkPInQ57skC8IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJh5o6H9BEGBKUmskaKdkrNhQotKPTOW9VdASbsC0WKM+UyZJ8STzJ8+6U
 4kSdkCNDSSNyk3sS+Z2njCLz9I+rDum8rE5Za8854ud3ARV0gJ1XY+Nu/xKDwQeOAyP+tBKH
 Pq3Lsgm9PPQwVzUu2LQl0+G8TTrdzCk5zrJTQcAQQ81QWIhTS0rJbnDhmxxH4lInxy6IZn1V
 KAvx3y562lvf3+4ATbzXXv45Nfn8ak4sdfBfaLltMeJlzX+0iVjcVaKvy/VQIO0aKSAWUR4Z
 vxStAbToFOAkbqDyGISN3Wqk3dOXgVmjjfIBSj8AXeSITCNUMH4ox69Ntkm1LimjodlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KYuZlFkIP0jgYVq3MUi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwI/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFnxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiIuiYfzQTObNSSj5uw/zvmWehTPYd3E8LAt26RE
X-Talos-CUID: =?us-ascii?q?9a23=3AgKksxmu5dlxP0KgktlxOAtUK6Is4SH74ylbBeXa?=
 =?us-ascii?q?lAHtpS5KSVE2u2qBrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AhGkI6Q1fni7zQzgbHEgnroynEjUjxKr3KhsRv8g?=
 =?us-ascii?q?6ldSIDDBpKhrasyitXdpy?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="110045256"
Date: Tue, 2 May 2023 17:13:41 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Luca Fancellu <luca.fancellu@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>,
	<wei.chen@arm.com>, George Dunlap <george.dunlap@citrix.com>, Nick Rosbrook
	<rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>,
	Christian Lindig <christian.lindig@citrix.com>, David Scott
	<dave@recoil.org>, Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
	<marmarek@invisiblethingslab.com>, Christian Lindig
	<christian.lindig@cloud.com>
Subject: Re: [PATCH v6 09/12] tools: add physinfo arch_capabilities handling
 for Arm
Message-ID: <4e6758c0-dd81-4963-8989-d941eba2b257@perard>
References: <20230424060248.1488859-1-luca.fancellu@arm.com>
 <20230424060248.1488859-10-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230424060248.1488859-10-luca.fancellu@arm.com>

On Mon, Apr 24, 2023 at 07:02:45AM +0100, Luca Fancellu wrote:
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/include/xen-tools/arm-arch-capabilities.h
> new file mode 100644
> index 000000000000..ac44c8b14344
> --- /dev/null
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Do you mean GPL-2.0-only ?

GPL-2.0 is deprecated by the SPDX project.

https://spdx.org/licenses/GPL-2.0.html


Besides that, patch looks fine:
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thanks,

-- 
Anthony PERARD

