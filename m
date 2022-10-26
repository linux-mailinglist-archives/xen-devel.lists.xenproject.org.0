Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534C60E203
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:22:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430573.682412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongMV-0004c8-9u; Wed, 26 Oct 2022 13:22:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430573.682412; Wed, 26 Oct 2022 13:22:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongMV-0004aE-75; Wed, 26 Oct 2022 13:22:27 +0000
Received: by outflank-mailman (input) for mailman id 430573;
 Wed, 26 Oct 2022 13:22:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hd2z=23=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ongMU-0004a6-EF
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:22:26 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b19b9ea-5531-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 15:22:25 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id kt23so15616521ejc.7
 for <xen-devel@lists.xenproject.org>; Wed, 26 Oct 2022 06:22:25 -0700 (PDT)
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
X-Inumbo-ID: 3b19b9ea-5531-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mCcgfz/wvaZSqkoybq4ATyzXHlmrWG7ukWyi1Cbw+SU=;
        b=QKXiu8hnT1x/yaKzMdSFb6e61S4VVO8sPQGbiwI7n1byV0Ni1YNOvFe/Vyw320DVHG
         SHVI76NjqRb288Gs7Qf/niQtDrNVYPQwq9uit4lyk8X0J86Ah6PJq1XIDuCfTM+pICCm
         RT84k3iAzaNH9HPYAci+x/+PQxsLS0AF4Dzq4BTfDdma2a82LnaEkZMBJcUjuwuhF6qQ
         XV6Lroc1AFNLFq4jm/cU5DsM+pWFf8k8xG3H9UyP36uEM2Px+pjx7GNeskc3+YDRMbGL
         Vj5jhMFVT0Re1R1xGa/OqwjPXML5XZ/5/iko6vocli8F7xFUhmOr5mEsF8Tj7L9I0zbm
         C7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mCcgfz/wvaZSqkoybq4ATyzXHlmrWG7ukWyi1Cbw+SU=;
        b=SZVvmQ7/dgVAjUJO9OHnKieA5vHpvX7hNGjDkk4aQ4aW7fkSa6Sz2GXwEz4ZjPuRQG
         asKSUgw+Mt9UviLz4NLMjFpu84mqLXzKq8mty7wY0biG2Ny3N5eZu36ZcXro/bvKq/87
         /Zm1FeOkOIO19owMTgTbsoGQ3kix7/Rm7OZ9DOS8b2M5LjgcN60bQB38HS/5ZIQqNEAU
         1eabIRSqulXpxFCgpJGRuEpVLqIUqfELX+/xekIIvQg6Fwyak/rGp37IpISyVb1uyiXO
         1uqWdnj8vPvaUa9I7lVhQOfl0teGytftVag8cLn0l13rL+KGuVEaAK5KGVQn3ZdQHh39
         V/0Q==
X-Gm-Message-State: ACrzQf3ZwYS9w/GXdRwHkp98HogKgn/v7idObK2QoZlhpyrhW1bViU/R
	GrpU36wsvNzjAcycwfJVbeV9YbzJNEq/07n69hA=
X-Google-Smtp-Source: AMsMyM70YohUVmLpqHjt8uCDGyfHv1uPm4Ssf+QX6Rsr6adF0va406IcJLNYhJ8UN9dUmw5CXze8g9ix27XwksYws+w=
X-Received: by 2002:a17:906:30c8:b0:73c:81a9:f8e1 with SMTP id
 b8-20020a17090630c800b0073c81a9f8e1mr37428980ejb.649.1666790544802; Wed, 26
 Oct 2022 06:22:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221026102018.4144-1-andrew.cooper3@citrix.com> <20221026102018.4144-4-andrew.cooper3@citrix.com>
In-Reply-To: <20221026102018.4144-4-andrew.cooper3@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 26 Oct 2022 09:22:13 -0400
Message-ID: <CAKf6xptnDHePBLxE06bBUEkrgetg5-0X1TFFSDyJqPv4TCvA4A@mail.gmail.com>
Subject: Re: [PATCH 3/4] xen/arm, libxl: Revert XEN_DOMCTL_shadow_op; use p2m
 mempool hypercalls
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Xen Security Team <security@xen.org>, 
	Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Henry Wang <Henry.Wang@arm.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Oct 26, 2022 at 6:21 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> This reverts most of commit cf2a68d2ffbc3ce95e01449d46180bddb10d24a0, and bits
> of cbea5a1149ca7fd4b7cdbfa3ec2e4f109b601ff7.
>
> First of all, with ARM borrowing x86's implementation, the logic to set the
> pool size should have been common, not duplicated.  Introduce
> libxl__domain_set_p2m_pool_size() as a shared implementation, and use it from
> the ARM and x86 paths.  It is left as an exercise to the reader to judge how
> libxl/xl can reasonably function without the ability to query the pool size...
>
> Remove ARM's p2m_domctl() infrastructure now the functioanlity has been
> replaced with a working and unit tested interface.
>
> This is part of XSA-409 / CVE-2022-33747.
>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---

> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 2abaab439c4f..f93b221f1c1f 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -1448,6 +1448,25 @@ int libxl_userdata_unlink(libxl_ctx *ctx, uint32_t domid,
>      return rc;
>  }
>
> +int libxl__domain_set_p2m_pool_size(
> +    libxl__gc *gc, libxl_domain_config *d_config, uint32_t domid)
> +{
> +    libxl_ctx *ctx = libxl__gc_owner(gc);
> +    uint64_t shadow_mem;
> +
> +    shadow_mem = d_config->b_info.shadow_memkb;
> +    shadow_mem <<= 10;
> +
> +    int r = xc_get_p2m_mempool_size(ctx->xch, domid, &shadow_mem);

Should this be xc_*set*_p2m_mempool_size?

Regards,
Jason

