Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1712F4B9F74
	for <lists+xen-devel@lfdr.de>; Thu, 17 Feb 2022 12:59:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274725.470303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfQq-000874-Tc; Thu, 17 Feb 2022 11:58:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274725.470303; Thu, 17 Feb 2022 11:58:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKfQq-000850-QY; Thu, 17 Feb 2022 11:58:44 +0000
Received: by outflank-mailman (input) for mailman id 274725;
 Thu, 17 Feb 2022 11:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mzVd=TA=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nKfQq-00084u-2r
 for xen-devel@lists.xenproject.org; Thu, 17 Feb 2022 11:58:44 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1876aa8-8fe8-11ec-8723-dd0c611c5f35;
 Thu, 17 Feb 2022 12:58:41 +0100 (CET)
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
X-Inumbo-ID: f1876aa8-8fe8-11ec-8723-dd0c611c5f35
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645099121;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zP5WKChedbDf2/dl7BiMkmk/iYp7HhvucErYv8k5dyw=;
  b=G7FJ5Xacn/mYokAOTGQ4ER/VtvXxHnhpb5b9MU41iJBMEwKXHcfC/f3d
   vyZROVioN2Pb1yYTSZoIrZ4u/HFqa88rjlkBnbfTpcjjB2b0znnDdLKex
   Nn2fblNttBYTnv8Q3sEbv9LYyNsTVI1GT/4tqUVGvgzSTYueSKvoPMDj7
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: DSKVq1igvFteTYfgveL2meV3oavkMLNB++61d8H0iJJBuPSK/xIVYxnSZZsb7ieGQv6vZo64Xo
 u6rRvk+AbIWce6V7+xS1PPdD0q1oMZ7F5z4YLvYF9nHq3d0MuFFqp/znQl9xwZMLLxRf568G4o
 eOkB3Zp1G2CCuv5LOMIfLPX3324SAVU87QtBiXEZoYMeVfoPIjdbed7PcWAqb1SjVCFrP1ShNR
 raWyHnUq86w6bDDd1BxgijyljfU05D3ObrNKJmOb/ugQLDtKrbVl7cBGYm/zQdqIjr8IqZRokj
 GMKTQ3fFjKN6kQMhf5u0yL2Y
X-SBRS: 5.1
X-MesageID: 66663852
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Uw5ut69MkL8CY86LJJWsDrUDCnmTJUtcMsCJ2f8bNWPcYEJGY0x3n
 WAZXjiFP67ZYDD9e9Byadzj8RgBucDQmtVhHlRk/CA8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rg3dYx6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhv9
 NdhioSLaTwHAYmSp9YyWh8fAQVHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4QQ6iFN
 5dDAdZpRBnmYANNC3kaNNUdmeOhpFXDSBgAgU3A8MLb5ECMlVcsgdABKuH9ZdiiVchT2EGCq
 Qru/W3/DgsLKd+3xj+M83bqjejK9Qv8XI8RD7S++uRdiVuf3HEICBYWWF24ptG0kke7HdlYL
 iQ88ywit/JqrBSDQdz0Xhn+q3mB1jYMVtwVH+Ak5QWlzqvP/x3fFmUCViRGatEtqIkxXzNC/
 l2GhdTyHhR0raaYD3ma89+pQSiaYHZPazVYPGldEFVDs4KLTJwPYgznUOphPJGttf3ONw7Un
 Q+4gyE4wKc3tJtev0mkxmzvjzWpr5nPawc64ATLQ26ohj9EiJ6Zi5+AsgaCs6sZRGqNZhzY5
 SVfxZDChAwbJczVzESwrPMx8KZFDhpvGBnVmhZREpYo7FxBEFbzLNkLsFmSyKqEW/vomAMFg
 meP6Gu9B7cJZRNGiJObharrVKzGKoC6SLzYugj8NIYmX3SIXFbvENtSTUCRxXvxt0MnjLsyP
 5yWGe71UypHUf84kmbrHLhAuVPO+szY7TmMLXwc5076uYdymVbPEetVWLdwRrtRAFy4TPX9r
 I8EapriJ+R3W+zieCjHmbP/3nhRRUXX8ave8pQNHsbae1IOMDh4V5f5nONwE6Q4zv89vrqZo
 RmAtrpwlQOXaYvvcl7RNBiOqdrHAP5CkJ7MFXd9Zwn2hSl4MN3HAWV2X8JfQITLPddLlZZcJ
 8Tpse3ZahiWYjiYqTkbc7fnq4luKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSlQwFtvSZdKu00i14SoXltVtUhaaOdJUYkjtrtRncnSjkv8tLsgQAhzf3T/Gh
 R2OCBIVqLCV8Y84+dXEn46eqIKtH7csF0ZWBTCDv723KTPb7iyoxooZCLSEejXUVWXV/qS+Z
 LoKk6GgYaNfxFsT6thyCbdmy6469uDDnb4Cw1Q2BmjPYnSqFqhkfiuM0/5Qu/Af3bReowa3B
 B6Co4EIJbWTNcr5O1cNPw55PP+b3PQZlzSOv/Q4JEL2uH1+8LadCBgAOhCNjGpWLadvMZNjy
 uAk4ZZE5wu6gxssE9CHkiELqDjcci1eC/0q5sMAHYvmqgs30VUTM5XTBxj/7IyLd9gRYFIhJ
 SWZhfaairlRrqYYn6HfyZQZMTJhuKkz
IronPort-HdrOrdr: A9a23:akqZQ67DJcaQXjX56gPXwMrXdLJyesId70hD6qhwISY1TiW9rb
 HIoB17726RtN9/Yh0dcLy7V5VoBEmsk6KdgrNhWItKPjOW21dARbsKheCJrgEIWReOlNK1vZ
 0QCpSWY+eRMbEVt6jH3DU=
X-IronPort-AV: E=Sophos;i="5.88,375,1635220800"; 
   d="scan'208";a="66663852"
Date: Thu, 17 Feb 2022 11:58:29 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <jgross@suse.com>, <wl@xen.org>,
	<jandryuk@gmail.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v2] tools: remove xenstore entries on vchan server closure
Message-ID: <Yg44ZaC2YuftyEQe@perard.uk.xensource.com>
References: <20220216063325.1552217-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220216063325.1552217-1-andr2000@gmail.com>

Hi Oleksandr,

On Wed, Feb 16, 2022 at 08:33:25AM +0200, Oleksandr Andrushchenko wrote:
> diff --git a/tools/libs/vchan/init.c b/tools/libs/vchan/init.c
> index c8510e6ce98a..ae9a6b579753 100644
> --- a/tools/libs/vchan/init.c
> +++ b/tools/libs/vchan/init.c
> @@ -251,6 +253,12 @@ static int init_xs_srv(struct libxenvchan *ctrl, int domain, const char* xs_base
>  	char ref[16];
>  	char* domid_str = NULL;
>  	xs_transaction_t xs_trans = XBT_NULL;
> +
> +	// store the base path so we can clean up on server closure
> +	ctrl->xs_path = strdup(xs_base);

You could do this in libxenvchan_server_init(), this might make it
easier to avoid leaking the path.

You need to initialise ctrl->xs_path in libxenvchan_server_init() in
any case before libxenvchan_close() is called.

I think you need to initialise ctrl->xs_path to NULL in
libxenvchan_client_init() as well even if it's not going to be used, to
avoid issue later in case the field start to be used.


> @@ -298,6 +306,23 @@ retry_transaction:
>  	return ret;
>  }
>  
> +void close_xs_srv(struct libxenvchan *ctrl)
> +{
> +	struct xs_handle *xs;
> +
> +	if (!ctrl->xs_path)
> +		return;
> +
> +	xs = xs_open(0);

There is missing a xs_close() call.

> +	if (!xs)
> +		goto fail;
> +
> +	xs_rm(xs, XBT_NULL, ctrl->xs_path);
> +
> +fail:
> +	free(ctrl->xs_path);
> +}
> +
>  static int min_order(size_t siz)
>  {
>  	int rv = PAGE_SHIFT;
> diff --git a/tools/libs/vchan/io.c b/tools/libs/vchan/io.c
> index da303fbc01ca..1f201ad554f2 100644
> --- a/tools/libs/vchan/io.c
> +++ b/tools/libs/vchan/io.c
> @@ -40,6 +40,8 @@
>  #include <xenctrl.h>
>  #include <libxenvchan.h>
>  
> +#include "vchan.h"
> +
>  #ifndef PAGE_SHIFT
>  #define PAGE_SHIFT 12
>  #endif
> @@ -384,5 +386,7 @@ void libxenvchan_close(struct libxenvchan *ctrl)
>  		if (ctrl->gnttab)
>  			xengnttab_close(ctrl->gnttab);
>  	}
> +	if (ctrl->is_server)
> +		close_xs_srv(ctrl);

Since init_xs_srv() is one of the last step of the initialisation of
*ctrl, I think close_xs_srv() should be one of the first step in
libxenvchan_close().

Thanks,

-- 
Anthony PERARD

