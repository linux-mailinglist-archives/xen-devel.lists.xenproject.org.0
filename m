Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D498A3B8FDE
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 11:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148326.274124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyt86-0001J4-Gw; Thu, 01 Jul 2021 09:37:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148326.274124; Thu, 01 Jul 2021 09:37:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyt86-0001Gy-DP; Thu, 01 Jul 2021 09:37:06 +0000
Received: by outflank-mailman (input) for mailman id 148326;
 Thu, 01 Jul 2021 09:37:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyt85-0001Gs-4v
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 09:37:05 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53b870e0-8784-4b35-93c2-ed344a96744e;
 Thu, 01 Jul 2021 09:37:02 +0000 (UTC)
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
X-Inumbo-ID: 53b870e0-8784-4b35-93c2-ed344a96744e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625132222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aMEQcTsDPgXtR1BmN6Rp3x+v5tEnrdawfN3Wbzs5MIQ=;
  b=Gk1bK/9RyibTwUPC5Atdsg/GtMcf08F7ouNdWobZWwiMuN/2P1Qma4nn
   z56HbMj4kdRJY6ot4g0j3nhr6MMNpdlUqW9tVRceHOJ9I4vqHDtLCPyoK
   6Fav301b/Hv5iAmLl5cn9icC50meGBrnJX/aABxHx/OZ8Hphh0a+gOjKg
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: D7sASBiW/pQzogWFFQWPVDciAodScg54xMExaFQMaLFKTfiUAVd5vN8t7M99S4jCzohkvw2Kt3
 bHMkP4dM/TFe8F7qUIcJ+RlejgCz/IlbSxbuQZuY3TU+pLnx95CvIamn9/YJLU9Zmhbp+Lf91E
 lKrq1jMS+JiidRfnaICSipkHYoVz73/RiuTdiu7GRf1sT5GoqILTVLzQ1bQ4I6rmY039O3iErN
 AvIr34ve66y9IkNUqLxvx+pgCF4nj81u3ikbi+p48Y7Tg05sqzoA0LpxVbhi8qISeQbLSdrEod
 LF8=
X-SBRS: 5.1
X-MesageID: 47361710
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:aV8rXagP0EaouoqsIqvy4nXxn3BQXtgji2hC6mlwRA09TySZ//
 rOoB0+726StN9xYgBFpTnuAsW9qB/nmqKdpLNhW4tKPzOW3VdATrsSjrcKqgeIc0aVm9K1l5
 0QEZSWYOeAdGSS5vyb3ODXKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.83,313,1616472000"; 
   d="scan'208";a="47361710"
Date: Thu, 1 Jul 2021 10:36:58 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxl/x86: check return value of
 SHADOW_OP_SET_ALLOCATION domctl
Message-ID: <YN2Mujj8jKGv7tik@perard>
References: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5d2bb2cf-8c0c-7300-c895-75bef0e50817@suse.com>

On Mon, Jun 28, 2021 at 01:47:03PM +0200, Jan Beulich wrote:
> The hypervisor may not have enough memory to satisfy the request.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Especially if the request was mostly fulfilled, guests may have done
> fine despite the failure, so there is a risk of perceived regressions
> here. But not checking the error at all was certainly wrong.
> 
> --- a/tools/libs/light/libxl_x86.c
> +++ b/tools/libs/light/libxl_x86.c
> @@ -531,8 +531,18 @@ int libxl__arch_domain_create(libxl__gc
>      if (d_config->b_info.type != LIBXL_DOMAIN_TYPE_PV) {
>          unsigned long shadow = DIV_ROUNDUP(d_config->b_info.shadow_memkb,
>                                             1024);
> -        xc_shadow_control(ctx->xch, domid, XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> -                          NULL, 0, &shadow, 0, NULL);
> +        int rc = xc_shadow_control(ctx->xch, domid,

Could you use 'r' instead of 'rc' ? The later is reserved for libxl
error codes while the former is for system and libxc calls.

> +                                   XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION,
> +                                   NULL, 0, &shadow, 0, NULL);
> +
> +        if (rc) {

xc_shadow_control seems to return "domctl.u.shadow_op.pages" in some
cases, are all non-zero return value errors?

> +            LOGED(ERROR, domid,
> +                  "Failed to set %s allocation: %d (errno:%d)\n",

LOGED already prints prints the meaning of the "errno" value, so we
don't need to log it.

> +                  libxl_defbool_val(d_config->c_info.hap) ? "HAP" : "shadow",
> +                  rc, errno);

Is the return value of xc_shadow_control() actually useful when errno is
already logged?

Thanks,

-- 
Anthony PERARD

