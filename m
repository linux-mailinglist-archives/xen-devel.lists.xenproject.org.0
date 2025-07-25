Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5D0B12775
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:28:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058693.1426189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufRpC-0001RW-Uy; Fri, 25 Jul 2025 23:27:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058693.1426189; Fri, 25 Jul 2025 23:27:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufRpC-0001Pa-SH; Fri, 25 Jul 2025 23:27:38 +0000
Received: by outflank-mailman (input) for mailman id 1058693;
 Fri, 25 Jul 2025 23:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ufRpA-0001PU-UH
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:27:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1ae7c39-69ae-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 01:27:35 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25D7E5C6BB7;
 Fri, 25 Jul 2025 23:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BE8C4CEE7;
 Fri, 25 Jul 2025 23:27:32 +0000 (UTC)
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
X-Inumbo-ID: f1ae7c39-69ae-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753486053;
	bh=yiPWR+tgjvEqd4fVVQG9ZZqvtwpM6NANzIDQlIRzxYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oaopKDgVUuYCihrcq2b5X3X14agGqVoZfQ3zh19cJN9mcPqmusdanmbYqi5MIOZ3q
	 KZLr5u4yGw4QAg9u6n0iXe4bAEMjdGlm5prjuLHJ2o3WKxxKodckNB+rCyasVjq+vM
	 yhxGhWZQQmvR0Qn+bOC+Y+S6OEDH4itjE8rNm6iTl7uDgXtw0lBk5a162kPgSL2wXR
	 Qs33L5sDWrbyinlPZ5imzhNnAYjRDV1w+yr7DJDRvXqXASdwqgm5nmv4vSuAh1E/yM
	 CB7U1eWyFx4mzQufAk3Fa2FIJUE19tly6/VvAaGkAvN0GQO1gLp2gjfujkhfGTInz2
	 TXk1O2dNz80zw==
Date: Fri, 25 Jul 2025 16:27:31 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>, 
    Marco Solieri <marco.solieri@minervasys.tech>
Subject: Re: [PATCH 4/4] tools/libxl: Remove unconditional XEN_DOMCTL_set_llc_colors
 hypercall
In-Reply-To: <20250724162306.2978741-5-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2507251627110.2578571@ubuntu-linux-20-04-desktop>
References: <20250724162306.2978741-1-andrew.cooper3@citrix.com> <20250724162306.2978741-5-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2013979071-1753486053=:2578571"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2013979071-1753486053=:2578571
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 24 Jul 2025, Andrew Cooper wrote:
> Hypercalls are not free; cache colouring is an experimental feature, and
> ignoring an -EOPNOTSUPP is bad form.
> 
> Now that Xen has been fixed to initialise colouring information correctly for
> domains, xc_domain_set_llc_colors() only needs calling for domains with
> explicit configuration.
> 
> Rearrange the logic to avoid the hypercall in the general case, leaving a
> comment explaining why it is performed so early.
> 
> Fixes: 748bd725fbec ("tools: add support for cache coloring configuration")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Carlo Nonato <carlo.nonato@minervasys.tech>
> CC: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>  tools/libs/light/libxl_create.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
> index 4301f17f901a..4042ae1a8957 100644
> --- a/tools/libs/light/libxl_create.c
> +++ b/tools/libs/light/libxl_create.c
> @@ -699,19 +699,21 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
>              /* A new domain now exists */
>              *domid = local_domid;
>  
> -            ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
> -                                           b_info->llc_colors,
> -                                           b_info->num_llc_colors);
> -            if (ret < 0) {
> -                if (errno == EOPNOTSUPP) {
> -                    if (b_info->num_llc_colors > 0) {
> +            /*
> +             * If Cache Coloring is wanted for the guest, it must be
> +             * communicated to Xen prior to allocating guest memory.
> +             */
> +            if (b_info->num_llc_colors) {
> +                ret = xc_domain_set_llc_colors(ctx->xch, local_domid,
> +                                               b_info->llc_colors,
> +                                               b_info->num_llc_colors);
> +                if (ret < 0) {
> +                    if (errno == EOPNOTSUPP) {
>                          LOGED(ERROR, local_domid,
> -                            "LLC coloring not enabled in the hypervisor");
> -                        rc = ERROR_FAIL;
> -                        goto out;
> +                              "LLC coloring not enabled in the hypervisor");
> +                    } else {
> +                        LOGED(ERROR, local_domid, "LLC colors allocation failed");
>                      }
> -                } else {
> -                    LOGED(ERROR, local_domid, "LLC colors allocation failed");
>                      rc = ERROR_FAIL;
>                      goto out;
>                  }
> -- 
> 2.39.5
> 
--8323329-2013979071-1753486053=:2578571--

