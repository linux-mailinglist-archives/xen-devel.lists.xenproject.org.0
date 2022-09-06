Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 409635AF6F1
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400063.641640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFr-0000kk-Po; Tue, 06 Sep 2022 21:37:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400063.641640; Tue, 06 Sep 2022 21:37:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgFr-0000dX-Ll; Tue, 06 Sep 2022 21:37:11 +0000
Received: by outflank-mailman (input) for mailman id 400063;
 Tue, 06 Sep 2022 21:37:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+HoH=ZJ=citrix.com=prvs=2410c4419=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oVgFq-0000Cs-JZ
 for xen-devel@lists.xen.org; Tue, 06 Sep 2022 21:37:10 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d260ed1-2e03-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 18:43:37 +0200 (CEST)
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
X-Inumbo-ID: 0d260ed1-2e03-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662482617;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pa1RL658MOY2x+MYF4zQp4voWWRCaFCGRfsvy99OMWo=;
  b=Vp09P5ZDm4EMHpCzpnc+TFMr3ZFzY4z4KJhdTPfksklee7IgkY1rq33S
   SbSL34gRg9MFC69F/33iNdtSjAIB9tXSSluneRA9Gke1jd3S5sX8MJjUT
   b6MRNPpnhI1WRTt+W5R8AjnBXhHgz9MysaRICuVdcsxi2YCAcUGg0dYXu
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80311183
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EaDUKKI+4Vk12QjLFE+Rt5IlxSXFcZb7ZxGr2PjKsXjdYENShmMEz
 GUYWmmOP/uMMzPwLt9wYI+x9k9Xv8LXytAwQQFlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/Pb9ks11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TEk7ZILkE0F5Eh0d0sBU5ez
 LscEhUXV0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCDlFcoieG9a7I5fPSlHsly3X+Hj
 FncvHXiOkwkM4KA43mKpyfEaujnwnqgBdN6+KeD3uFuqE2ewCoUEhJ+fVy/rPqill+lW/pQL
 kUV/mwlqq1a3EmqTdS7Xxq8pXOflhodXdNKFKs98g7l4q3Q7gWCD24IVAldeccmv887Qz8t/
 lKRltavDjtq2JWXVHac+7G8vT60fy8PIgcqZyAeShAey8L+u4x1hRXKJv5mGbK1j9DoXyn3w
 iqLoTIWg7QVhNQMka68+DjvnTOqrZXPUkg6+wTLQmW5xgd4Yoe/YMqv81ezxeZNKsOVQ0eMu
 FAAmtOC96YeAJfLkzaCKM0THauk/PbDMyDZiERHG5gn/i6qvXm5cuh4+y1zKk5vNYAfZTbjb
 UvXuAVQzI9SOHqsfel8ZIfZI80uwLimH9njUP3ZRt5PZJFrc0mA5i4GTVWMxWnxl1NpnawhE
 ZCDNMKtFmoBT6BmyjOsQKEay7BD+8wl7TqNH9ahlU3hiOfAIi7OIVsYDLeQRrB6yoGEoi/Jy
 v1kbM+l2ywYVNfbeBCCpOb/Mms2wWgH6YHe8pIJLLbTeVs4RgnNGNeKn+p/JtUNc7B9076Ro
 yrjAhIwJE/X3yWvFOmcVpx0hFoDt75bpGlzAyEjNE3AN5MLMdf2t/d3m3fakNAaGA1fIR1cF
 aNtlz2oWKgnd9g+0211gWPBhIJjbg+3ogmFIjCoZjMyF7Y5GVKTpoe+L1S0rnZXZsZSiSfZi
 +T5vj43vLJZH1gyZCooQKnHI6yNUYg1x7spAhqgzih7c0Tw6ol6QxHMYgsMC5hVcX3+Ks6yj
 Vn+7eEw+baQ+OfYMbDh2ci5kmteO7ImTxoGQzmLse3e2Ouz1jPL/LKsmd2gJVj1PF4YMo37D
 QmJ55kQ6ME6oWs=
IronPort-HdrOrdr: A9a23:CrupV676w5DMWc3LnAPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="80311183"
Date: Tue, 6 Sep 2022 17:43:30 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>, Mike Holmes
	<mike.holmes@linaro.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [PATCH V5 6/6] libxl: Allocate MMIO params for GPIO device and
 update DT
Message-ID: <Yxd4srBXfXZKVoxm@perard.uk.xensource.com>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
 <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4a238937ceb803f494e5633a3a779866383bd463.1661159474.git.viresh.kumar@linaro.org>

On Mon, Aug 22, 2022 at 02:45:18PM +0530, Viresh Kumar wrote:
> This patch allocates Virtio MMIO params (IRQ and memory region) and pass
> them to the backend, also update Guest device-tree based on Virtio GPIO
> DT bindings [1].
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml
> 
> Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  tools/libs/light/libxl_arm.c | 51 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 4c1012e56893..86c1e560900f 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -121,6 +121,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>              return rc;
>      }
>  
> +    for (i = 0; i < d_config->num_gpios; i++) {
> +        libxl_device_gpio *gpio = &d_config->gpios[i];
> +    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,

Indentation seems wrong here.

Also, you could declare "rc" (without an initial value) for the whole
function rather than declaring it in each for loop scope.

Then, this patch could be squash into the one that adds GPIO support to
libxl.

Thanks,

-- 
Anthony PERARD

