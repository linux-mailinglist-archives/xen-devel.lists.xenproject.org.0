Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7333F7004FD
	for <lists+xen-devel@lfdr.de>; Fri, 12 May 2023 12:13:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533761.830672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxPkt-0005gT-3M; Fri, 12 May 2023 10:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533761.830672; Fri, 12 May 2023 10:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxPkt-0005e0-0Z; Fri, 12 May 2023 10:12:07 +0000
Received: by outflank-mailman (input) for mailman id 533761;
 Fri, 12 May 2023 10:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GX4r=BB=citrix.com=prvs=48968f2ef=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1pxPkr-0005du-9K
 for xen-devel@lists.xen.org; Fri, 12 May 2023 10:12:05 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ed7dab0-f0ad-11ed-b229-6b7b168915f2;
 Fri, 12 May 2023 12:12:03 +0200 (CEST)
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
X-Inumbo-ID: 6ed7dab0-f0ad-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683886323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FRXaMTqIjdb7DUaJ81ZOK3/3JsFUFm6MFLGfquu1aWs=;
  b=dyT5aRh0Zmr7u5QpM+vCBv9CMet8IHwm/c1xaBioagDI4BafSp+r/cKO
   l70+gKg3IMlMSQpvYOuF1JCzTFS6nIujVU3bGVaqGIRd8PV7d9Wnk8mwU
   Qt2nUfW0UNgnF6zby1+bicKRD1OfGcbW2dQnwKuFDchyzjNoyOu0WfpKd
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 111253143
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:Ykh3xaPoGx39LGHvrR31kMFynXyQoLVcMsEvi/4bfWQNrUolhGADn
 WEdXmCGPv7ZMTPxfY90O9629RxTv8DXytJkTQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5wZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sFXHV9O3
 vk4EjdOPknEuLqZy4OaT+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXTHJ8IxR/E/
 Qoq+Uz1PCsLEuWS1gGg3TXrwdLzoBu8QK8NQejQGvlC3wTImz175ActfV6yvfm4h1P4Q9VeM
 U0Z4AIqrK477kvtRd74NzWxpHOU+BQRXdxdHsU+6QeE0K2S5ByWbkADSjNCc8A3r88eSjkj1
 1vPlNTsbRRmqLCPQGiR3quVpzi1fyMSKAcqaDUFTk0e6NnipIUyiB3nStdlGbSyyNrvFlnY2
 CyQpTQ5nPAfgNAj0L3++VHcnynqopnPRxQyoALNUQqN/g5/IYKoeYGswVza9upbapaUSB+Gp
 ndss9af9u0VDdeOiSmEWs0JHbeg/fHDNyfT6XZtEIMm7C+F4GO4cMZb5zQWDFloNM0JfyOvb
 1LSpR9W+LdXPX2jd6gxZJi+Y+wo0KzhGNLNRv3SKN1UbfBMmBSvpX80IxTKhia0zRZqyPtkU
 XuGTSqyJVE6FZpn5z+WfeBegeZs+XgRzlLyQJ+umnxLzoGiTHKSTL4ENn6HYeY48L6IrW3pz
 jpPCyeZ404BCbOjO0E75aZWdAlXdiZjWfgavuQNLoa+zhxa9HbN4hM76ZcoYMRbkqtcjY8kF
 VntCxYDmDITaZAqQDhmi0yPipu1Bf6TTlphZ0TA2GpEPFB9CbtDFI9FK/MKkUAPrYSPN8JcQ
 fgfYNmnCf9SUDnB8Dl1RcCj/NcyL0zx1VzXYnfNjN0Dk3lIGWT0FiLMJFOzpEHi8ALt3SfBn
 1FQ/lyCGsdSL+iTJM3XdOiu3zuMgJTpo8orBxGgCoAKKC3RHH1Cd3SZYgkff5tddn0uB1Kyi
 26rPPvvjbCT/tZlq4WX3fzsQkXAO7IWI3e21lLztd6eXRQ2NEL/qWOceI5kpQzgaV4=
IronPort-HdrOrdr: A9a23:dPyVF6iUYJjeFp8nvvzLJeCgvnBQXiwji2hC6mlwRA09TyX5ra
 2TdTogtSMc6QxhPk3I/OrrBEDuexzhHPJOj7X5eI3SPjUO21HYS72Kj7GSoAEIcheWnoJgPO
 VbAs1D4bXLZmSS5vyKhDVQfexA/DGGmprY+ts3zR1WPH9Xg3cL1XYJNu6ZeHcGNDWvHfACZe
 OhDlIsnUvcRZwQBP7LfkUtbqz4iPDgsonpWhICDw5P0njzsdv5gISKaCRxx30lIkly/Ys=
X-Talos-CUID: =?us-ascii?q?9a23=3A4HSYo2oyUOCjk1VXCVX/+D3mUecFbkPd53LwGUj?=
 =?us-ascii?q?7WT8ud+W6Qm6x/awxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AFPlHCQ4wMPQN6ErafO9nyV++xoxk3Z6/LnkAjq4?=
 =?us-ascii?q?jlI7DchFMBg/alBmoF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,269,1677560400"; 
   d="scan'208";a="111253143"
Date: Fri, 12 May 2023 11:11:46 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH V2 1/2] libxl: virtio: Remove unused frontend nodes
Message-ID: <d48500d8-344b-4ad6-af23-dacad8fec2b2@perard>
References: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <782a7b3f54c36a3930a031647f6778e8dd02131d.1683791298.git.viresh.kumar@linaro.org>

On Thu, May 11, 2023 at 01:20:42PM +0530, Viresh Kumar wrote:
> The libxl_virtio file works for only PV devices and the nodes under the

Well, VirtIO devices are a kind of PV devices, yes, like there's Xen PV
devices. So this explanation doesn't really make much sense.

> frontend path are not used by anyone. Remove them.

Instead of describing what isn't used, it might be better to describe
what we try to achieve. Something like:

    Only the VirtIO backend will watch xenstore to find out when a new
    instance needs to be created for a guest, and read the parameters
    from there. VirtIO frontend are only virtio, so they will not do
    anything with the xenstore nodes. They can be removed.


> While at it, also add a comment to the file describing what devices this
> file is used for.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
> V2: New patch.
> 
>  tools/libs/light/libxl_virtio.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index faada49e184e..eadcb7124c3f 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -10,6 +10,9 @@
>   * but WITHOUT ANY WARRANTY; without even the implied warranty of
>   * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>   * GNU Lesser General Public License for more details.
> + *
> + * This is used for PV (paravirtualized) devices only and the frontend isn't
> + * aware of the xenstore.

It might be more common to put this kind of comment at the top, that is
just before the "Copyright" line.

Also, same remark as for the patch description, VirtIO are PV devices,
so the comment is unnecessary. What is less obvious is why is there even
xenstore interaction with a VirtIO device?

Maybe a better description for the source file would be:

    Setup VirtIO backend. This is intended to interact with a VirtIO
    backend that is watching xenstore, and create new VirtIO devices
    with the parameter found in xenstore. (VirtIO frontend don't
    interact with xenstore.)


Thanks,

-- 
Anthony PERARD

