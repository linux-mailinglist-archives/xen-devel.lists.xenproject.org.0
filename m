Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C816F4649
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 16:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528693.822168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrFe-0005KL-G6; Tue, 02 May 2023 14:45:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528693.822168; Tue, 02 May 2023 14:45:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptrFe-0005I2-CI; Tue, 02 May 2023 14:45:10 +0000
Received: by outflank-mailman (input) for mailman id 528693;
 Tue, 02 May 2023 14:45:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M8xE=AX=citrix.com=prvs=479c33cca=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1ptrFc-0005Hw-KT
 for xen-devel@lists.xen.org; Tue, 02 May 2023 14:45:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebbba320-e8f7-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 16:45:06 +0200 (CEST)
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
X-Inumbo-ID: ebbba320-e8f7-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683038706;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AY1oCzQUnRwuXpbdb05yJrH7EzCQOVt+9I90RiIuFAE=;
  b=ecShEVvL2VB8e6oozCRqB6DuAdEx4guQ+HcDRrsdkkDAAIl2PeqKhxdn
   Z/AY9VvB+k3RFUFZr4RmG55NHuYMedPSvmwzh47lZhkkeZ5biKhG6rMAP
   DZ/2jn2iAL1tnlDrla71GRrJYGOGbSICz1Td2A8FpqCydAapAczOhYwj5
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 106346520
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/l7eVKNUtbzLopTvrR0cl8FynXyQoLVcMsEvi/4bfWQNrUomgz0Hx
 zMaXzyHbPiJZWekf4twOYm/9EJTvJfUmoJiSgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvPrRC9H5qyo42tF5gZmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0rdJW01J0
 e4VESpTdzSlmdqZh5C7V9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSG54JwBvC/
 goq+UzSPVZKL9yc8AC//yuzp7TBgg3VdZg7QejQGvlC3wTImz175ActfUW6u/Siigi9RtdWM
 WQQ+ywnt69081akJvHtUhv9rHOasxo0X9tLD/Z8+AyLjK3O7G6xBGceSSVaQMc7r8JwTjsvv
 neLgtfoCDpHoLCTD3WH+d+8szK0MiUTMSkNeC4YUQwZy93ipogpiVTIVNkLOLWplNTpHiq1z
 z2UhC8mwrESltIQkaG6+1ndhHSrvJehZgcx6xWRVG+j6A50TIqkYYWy7h7c9/koBIOQUlmAs
 WVCg8+f9uEDF7mJlSqEWuJLF7asj96CNDDfmkJ+BJkJ+DGk+nrldodViBlzPkZqdN0PeT7tZ
 E7VtitV5ZlaJnzsarV4C6q4E8kwxLLsPcjkXPvTKNFJZ/BMmBSvpX80IxTKhia0zRZqyPtkU
 XuGTSqyJSckU4hg6Ci7fv1DyJsN2BgRgkHTWKmumnxLzoGiiG6ppaYtaQXeNbhgtvPb/2054
 P4EaZLUlkw3vPnWJ3COrNVNdQ1iwW0TX8ieliBBSgKUzuOK8kkFAuSZ/74ucpcNc099xraRp
 SHVtqO1JTPCaZz7xeaiMCoLhEvHB8oXkJ7CFXVE0ayU83Yie52zy6wUaoE6e7IqnMQ6k64uH
 qdaIp/YXKkQItgixwnxkLGn9NAyHPhVrVvm09WZjMgXIMc7Gl2hFi7MdQrz7igeZheKWT8Fi
 +T4jGvzGMNTLzmO+e6KMJpDOXvt5ylC8A+zNmOUSuRulLLEqtk2cXSv1qVofKnh63zrn1On6
 upfOj9AzcGlnmP/2IKhaXysx2txL9ZDIw==
IronPort-HdrOrdr: A9a23:TdL6VaPfSjkpUMBcTjejsMiBIKoaSvp037BK7S1MoNJuEvBw9v
 re+sjzsCWftN9/Yh4dcLy7VpVoBEmsl6KdgrNhWotKPjOW21dARbsKheffKn/bakjDH4Zmvp
 uIGJIObOEYY2IasS77ijPIbOrJwrO8gd6VbTG19QYdceloAZsQnzuQEmygYzRLrJEtP+tFKH
 KbjPA33waISDAsQemQIGIKZOTHr82jruObXfZXbyRXkzVnlFmTmcTHLyQ=
X-Talos-CUID: =?us-ascii?q?9a23=3AWRI8C2gDAaWp0CjyKsLhsZVvTzJuI0OH4HD0MUK?=
 =?us-ascii?q?BEzhwbJuLcXDX2qN5qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A08WewQ1QDdhbZwZ7qZUMyCLX5DUjyJvpWFsNkqw?=
 =?us-ascii?q?8gcTdKg0rNSizohmta9py?=
X-IronPort-AV: E=Sophos;i="5.99,244,1677560400"; 
   d="scan'208";a="106346520"
Date: Tue, 2 May 2023 15:44:50 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
CC: <xen-devel@lists.xen.org>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	<stratos-dev@op-lists.linaro.org>, Alex =?iso-8859-1?Q?Benn=E9e?=
	<alex.bennee@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Erik Schilling
	<erik.schilling@linaro.org>
Subject: Re: [PATCH] libxl: arm: Allow grant mappings for backends running on
 Dom0
Message-ID: <92c7f972-f617-40fc-bc5d-582c8154d03c@perard>
References: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <817f0320316dd144826add0ac834618026b91160.1680165772.git.viresh.kumar@linaro.org>

On Thu, Mar 30, 2023 at 02:13:08PM +0530, Viresh Kumar wrote:
> diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
> index 10f37990be57..4879f136aab8 100644
> --- a/docs/man/xl.cfg.5.pod.in
> +++ b/docs/man/xl.cfg.5.pod.in
> @@ -1616,6 +1616,10 @@ properties in the Device Tree, the type field must be set to "virtio,device".
>  Specifies the transport mechanism for the Virtio device, only "mmio" is
>  supported for now.
>  
> +=item B<forced_grant=BOOLEAN>
> +
> +Allows Xen Grant memory mapping to be done from Dom0.

I think this description is missing context. I'm not sure what it would
means "from dom0" without reading the patch. Also, it says "allows",
maybe this doesn't convey the meaning of "forced". How about something
like:

    Always use grant mapping, even when the backend is run in dom0.
    (grant are already used if the backend is in another domain.)

> +
>  =back
>  
>  =item B<tee="STRING">
> diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
> index faada49e184e..e1f15344ef97 100644
> --- a/tools/libs/light/libxl_virtio.c
> +++ b/tools/libs/light/libxl_virtio.c
> @@ -48,11 +48,13 @@ static int libxl__set_xenstore_virtio(libxl__gc *gc, uint32_t domid,
>      flexarray_append_pair(back, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>      flexarray_append_pair(back, "type", GCSPRINTF("%s", virtio->type));
>      flexarray_append_pair(back, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(back, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));
>  
>      flexarray_append_pair(front, "irq", GCSPRINTF("%u", virtio->irq));
>      flexarray_append_pair(front, "base", GCSPRINTF("%#"PRIx64, virtio->base));
>      flexarray_append_pair(front, "type", GCSPRINTF("%s", virtio->type));
>      flexarray_append_pair(front, "transport", GCSPRINTF("%s", transport));
> +    flexarray_append_pair(front, "forced_grant", GCSPRINTF("%u", virtio->forced_grant));

This "forced_grant" feels weird to me in the protocol, I feel like this
use of grant or not could be handled by the backend. For example in
"blkif" protocol, there's plenty of "feature-*" which allows both
front-end and back-end to advertise which feature they can or want to
use.
But maybe the fact that the device tree needs to be modified to be able
to accommodate grant mapping means that libxl needs to ask the backend to
use grant or not, and the frontend needs to now if it needs to use
grant.

>  
>      return 0;
>  }
> @@ -104,6 +106,15 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
>          }
>      }
>  
> +    tmp = NULL;
> +    rc = libxl__xs_read_checked(gc, XBT_NULL,
> +				GCSPRINTF("%s/forced_grant", be_path), &tmp);
> +    if (rc) goto out;
> +
> +    if (tmp) {
> +        virtio->forced_grant = strtoul(tmp, NULL, 0);
> +    }
> +
>      tmp = NULL;
>      rc = libxl__xs_read_checked(gc, XBT_NULL,
>  				GCSPRINTF("%s/type", be_path), &tmp);
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index 1f6f47daf4e1..3e34da099785 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -1215,6 +1215,8 @@ static int parse_virtio_config(libxl_device_virtio *virtio, char *token)
>      } else if (MATCH_OPTION("transport", token, oparg)) {
>          rc = libxl_virtio_transport_from_string(oparg, &virtio->transport);
>          if (rc) return rc;
> +    } else if (MATCH_OPTION("forced_grant", token, oparg)) {
> +        virtio->forced_grant = strtoul(oparg, NULL, 0);

Maybe store only !!strtoul() ?
I don't think having values other that 0 or 1 is going to be good.

>      } else {
>          fprintf(stderr, "Unknown string \"%s\" in virtio spec\n", token);
>          return -1;

Thanks,

-- 
Anthony PERARD

