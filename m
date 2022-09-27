Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 362F75EC71B
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 17:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412745.656169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odC4L-0004my-9a; Tue, 27 Sep 2022 15:00:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412745.656169; Tue, 27 Sep 2022 15:00:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odC4L-0004lB-5M; Tue, 27 Sep 2022 15:00:21 +0000
Received: by outflank-mailman (input) for mailman id 412745;
 Tue, 27 Sep 2022 15:00:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4SB=Z6=citrix.com=prvs=2628f7867=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1odC4J-0004l5-J7
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 15:00:19 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17579a1c-3e75-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 17:00:16 +0200 (CEST)
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
X-Inumbo-ID: 17579a1c-3e75-11ed-9648-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664290816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HoL8XYNsx2xbxwUQHjtR2WimqObB3a+3dKCryKwFxVM=;
  b=NkqLlvA/kTFPQ3uUy0u1CKxoqcX6CpInL6WmNgke89HaizBU7hmbh+7Y
   cmv4RE6SshluwcUwu0ZclUPyOl24qPsdimCtj8iNF2VS6qEuYhTZeC1xK
   3lSif/KRstXcbco40DK4cs7IrxyBtu6epbnZhUbWWMaBK8wFu+Frfvady
   w=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81455231
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3AkRSeSKAFbova8RVWkefolGt99h7EJp4KDTa0Y?=
 =?us-ascii?q?r1iHsdyfbJa/94HLcsJFMlSPqH4CM41jsrWWreElGSAQAlalYX0ke7CJO57b?=
 =?us-ascii?q?zywN8FA2AtTw1sb4YLeJSRDX7saEgeNzBnt1HGmb/DG3zdY8X4WChI6bh2Bs?=
 =?us-ascii?q?rfnxZqLMTu1ac2+RelVyP7sPCNydYRXEN4btivSc2CQcnYqPfCgJN9mgeNrJ?=
 =?us-ascii?q?nMI7+LAwfvdQxFsYKG8NwmId7Z9Gc/vy268T/OihKaNcDJRbVNs9eVFjTecw?=
 =?us-ascii?q?KIkdOCirsrZsHXhq/jLnAUMC2SK3PEN9M9gK4Swri2Cdk316eC8+8KsS+n4Y?=
 =?us-ascii?q?DnzZOSD54yvk7LrDGHiuUF9TRaruT/OnrCDztRgSn8xYmiAmhAM8KTe+SAaQ?=
 =?us-ascii?q?dr7lvADECAOvD8NycIaF2mSvhaHSPFj+wDUNv/YBSrlFfjMtBfXOXRehfl/0?=
 =?us-ascii?q?wPmM1s68ZzcXbRn+TbEbgUk4SGD2TQysr9yoZB4YJN2r0uvypx9pL6TXs1OP?=
 =?us-ascii?q?OF2rh/1/cDppsImEuPHehgaTvUdnkxDiJdZkI6S9emouLbAoRBJs7l9QJxZY?=
 =?us-ascii?q?rlZQXqZMOM/5KWZtVLN48z3MjIMGkIaXYeW6FGd5M1NVNF73W/jJdkXJW0c4?=
 =?us-ascii?q?DpJyMPW4NhiGmdLm7K5Zjkvv9ebJnEQtKhe1S1GIRcGpFAKErpOnXkEaNXx/?=
 =?us-ascii?q?z21E8xl74wiy5rfghcbTK84mfIF+QNBqrsbMnB90LipmwaeFH9UJ1WrCIfc1?=
 =?us-ascii?q?pC+pCznVaCH+ZHeJxjey0ozw35CM8D1VnMGEiHD07TDhpOqGIXBQ/UIrqeR8?=
 =?us-ascii?q?jhmV1L7uqftJnYiXmiBwW3mRivjj59fr6InTocJpCVFLhZKWDhZmusx3+sUc?=
 =?us-ascii?q?7XHnE32hpcV4yOUlHG1BhHXWua4TFcQgpirYb6kexrEa0+kllMGf4dSnb2cf?=
 =?us-ascii?q?ddFvs8YamJT8tv8+n53Q6JxVTr94oXR7cHAeRonaNRKZbsLHLmkuMNMksEe3?=
 =?us-ascii?q?uZjXiv2K5k1ct3sly4tXXOR0bTIe6X/CZ9752ExduthdJlKh4gaqHKDIGojL?=
 =?us-ascii?q?EomRAKrsBxvtAj13a2huNfKZXqvVHcapHQGDKuJKG+3O+ffbF4gFXF5qnIMK?=
 =?us-ascii?q?m5qJI8u2C8X9/KHF3YfEYufC3Wg84YFWT68Wvi6IuenayJYM08McDGIxnOye?=
 =?us-ascii?q?9LjRzJvzrdFl0MnhErtUli+YEiUUgIc8wTU6eQr0xseksKlshOnsqBykHtvy?=
 =?us-ascii?q?JrrniQAOk5o3Oz586CgbJGHHUiZDhvi+DFTYo2FgKXBwaksR9D4fdFfp86BZ?=
 =?us-ascii?q?rutDjE5nkgn1afkEV9Yw84576aIE/L34rpxvuiqofZ0nyARhx+EpvetVzSFa?=
 =?us-ascii?q?tR01x4V8qiHDc8UbWv8ifuBI/CUAmV6kuE+ndXr64MxuiO7G3ZP8FvfSKiad?=
 =?us-ascii?q?571ycsLtGZozPpcBX16LCJLsVMCG65Ssb37aquKABZhxpQ4C0TGLZe6u4HRr?=
 =?us-ascii?q?IhYiJqmsWF+5ybRjuJgeK4cD01OFxa7g/MO+KVT/P3r4+bO1S4LvERO1ksgK?=
 =?us-ascii?q?zm8w5vHpITE0Pr2leUDjaITJgl/cJcHI5KfKNVpXrQ+n05lLeTWHiM9YfUzR?=
 =?us-ascii?q?9xpYQgJNRikXZKc8UXIAgE03b+bexs3vx17qhb3knej5HyT7AI/TPUL4lJkM?=
 =?us-ascii?q?+U9n6dJ8QDc5PfzkIjuro0f1Umv3da4cLoj5ZlwP7rVcamQZGDMsMjMwd2Mr?=
 =?us-ascii?q?d4aReP1LNXpsHDYgCDaHOkmcdl6Y9AD8bnVqN8V2ktYPsGZALP8dZH9qzXFC?=
 =?us-ascii?q?KfkMsKzS5/v+oDM6og6zkCfprHNNCQlYExeYe31/dYmif1CajPJs0WLF1s6v?=
 =?us-ascii?q?k9UDvQ3JcOEDZtO89O8YfqnkUorfrqc9DR0iWUcLS8H0MGn6/3AAEcxdRaxC?=
 =?us-ascii?q?evLgyKXQpOOvaGG0O35AOgz5M+D3J3km/PiQdfx4xCbTy7EsslBM6auTorBN?=
 =?us-ascii?q?XWW8cUtghWg0WIuyd3dN5UnZVArAGg8V6QiNPQIpNSH2K2di/EfRly7cenMD?=
 =?us-ascii?q?pzDOX+xu1unlBkqzJ4l56F/jWkUX9Vv/th7iGQDGPQSv7eyoc0LGmpUqBjNu?=
 =?us-ascii?q?RgF3K1LkMVsF/agO2phlUIQPHHI9ty8xONIW22IvlJc5nS5ATTptnQlqkwy8?=
 =?us-ascii?q?vFgRi2TsUO8SxDJTFUrqviuiqsQsRTEN+RiUxCwPySmbGGlM+y/2UTow4OBu?=
 =?us-ascii?q?ye48vID7PTYUN33hxlWZ6sX/sWj6RHOrHSZpadHZbYfj5ck69tcbKFuyJars?=
 =?us-ascii?q?wSRWGzgm4M06IOeGl4Pmgngw5LEj/Nls+oR+YucZRK6nf0/SQ4JvV+iWwL/L?=
 =?us-ascii?q?j5Upbd7f38dyflTemjfDBPnLsW3dR/Uhr33KqGAbpWPD4x5Bh3LZNpxIh20b?=
 =?us-ascii?q?+RHCf3DsuM1fEUDiQGOQmxIlUwHxDMatYzsssW0P0m5/el8uT/SE6fTdsXSh?=
 =?us-ascii?q?mMJDF4YtLegwYRjBCotfpXZiNwCq0YBEDFA8q8ZkeGJWrJ9obXJ3M7jOQUyT?=
 =?us-ascii?q?Nn3hdNZXlKTP8srM0KjqVaSWyMlXzo0ZoDOk7a132DUCmVktciTPCAGmYCl9?=
 =?us-ascii?q?D6jCbj6b7m37hJr+Wx+fJuEz7p7WIuDUIUDSnV7wiTb/YQX7eDb7/f29ReO7?=
 =?us-ascii?q?aQPBDP5Dh4XFxpb+/6EBccApp/RcOSy5IWzipaYOdHnYmamfMaGFljViztZH?=
 =?us-ascii?q?J6w83INeUUNEeGi+9CwG9gfyo8lox0B2l3ikXbKQztj4m97RtZd2hwgURCO5?=
 =?us-ascii?q?e4wxChx/LJ/STSsGbIbRM+LcFqru7AC+tlbV8+kPMCE1i7cTU6UKV4e3wwnR?=
 =?us-ascii?q?l0cP2QFk/zOTN+LdBAVFtoBQHbGoEkZzJHh4EPMciCVhMiBpu24SV2ZnlB20?=
 =?us-ascii?q?9NBFXPYz78poUKZ3EfDlLgz9Xmg2tpEyd9p?=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; 
   d="scan'208";a="81455231"
Date: Tue, 27 Sep 2022 16:00:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: <dmitry.semenets@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Dmytro Semenets <dmytro_semenets@epam.com>
Subject: Re: [PATCH v2 2/4] tools: allow vchan XenStore paths more then 64
 bytes long
Message-ID: <YzMP+twWGAYxWEuI@perard.uk.xensource.com>
References: <20220713150311.4152528-1-dmitry.semenets@gmail.com>
 <20220713150311.4152528-2-dmitry.semenets@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220713150311.4152528-2-dmitry.semenets@gmail.com>

Hi Dmitry,

On Wed, Jul 13, 2022 at 06:03:09PM +0300, dmitry.semenets@gmail.com wrote:
> diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> index 9195bd3b98..38658f30af 100644
> --- a/tools/libs/vchan/init.c
> +++ b/tools/libs/vchan/init.c
> @@ -259,6 +259,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
>  	if (!ctrl->xs_path)
>  		return -1; 
>  
> +	buf = malloc(XENSTORE_ABS_PATH_MAX);
> +	if (!buf) {
> +		free(ctrl);
> +		return 0;

I don't understand what you are trying to achieve here. If we can't
allocate `buf`, we should return an error, right?
Also, `ctrl` isn't allocated in this function but by the caller, so I
don't think we need to free it here. Also, if it's free here, the caller
is going to continue to use the pointer, after free.

> +	}
> +
>  	xs = xs_open(0);
>  	if (!xs)
>  		goto fail;
> @@ -419,13 +426,20 @@ struct libxenvchan *libxenvchan_client_init(struct xentoollog_logger *logger,
>  {
>  	struct libxenvchan *ctrl = malloc(sizeof(struct libxenvchan));
>  	struct xs_handle *xs = NULL;
> -	char buf[64];
> +	char *buf;
>  	char *ref;
>  	int ring_ref;
>  	unsigned int len;
>  
>  	if (!ctrl)
>  		return 0;
> +
> +	buf = malloc(XENSTORE_ABS_PATH_MAX);
> +	if (!buf) {
> +		free(ctrl);
> +		return 0;

Nit: could you write NULL instead of 0 here? It would makes it much
easier to understand that we return a pointer.


Thanks,

-- 
Anthony PERARD

