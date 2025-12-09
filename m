Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37278CAFF7D
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 13:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181611.1504635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx7e-0003Au-67; Tue, 09 Dec 2025 12:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181611.1504635; Tue, 09 Dec 2025 12:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSx7e-00039T-3G; Tue, 09 Dec 2025 12:47:18 +0000
Received: by outflank-mailman (input) for mailman id 1181611;
 Tue, 09 Dec 2025 12:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSx7c-00039F-Bh
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 12:47:16 +0000
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [2607:f8b0:4864:20::c2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f789e0f-d4fd-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 13:47:14 +0100 (CET)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-656de56ce7aso1761678eaf.3
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 04:47:14 -0800 (PST)
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
X-Inumbo-ID: 2f789e0f-d4fd-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765284433; x=1765889233; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dwo0mK+bqzIMV2vqVZqr/nVM7rma+VBvCjtz+3mts0=;
        b=F53ey8WpEZHUZwP9OIURFesXFssE18Pl1yXVgN1TiIQt1dgxUiJoJccIZN7WsHXveO
         Z9ZG2tGjvkQqrXBQ36fx3bCQFfwpsB2dkDoCorP4G7dIdQWKNZPUaBXrzdUKW0Gv/Ead
         ev90YUdhvErAfyLskIM6E7/Dkchzi/xpaXTlHXFXjjHZqfJ5/1HPGoyJSbWQ8VgbMGh8
         +8BMY+1VTCN3O4oYn0hN4rlvGbPHBkTWRb7QtNhX3yxHatz/svVkfxRNtGJV139bdbP3
         1B9ur3h7fHHbBMfGeqR+zQSVJRBLoqDH/y2aPVRfCBvbHW3MBEBaTS/Mg1M74TG6Fk4y
         /jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765284433; x=1765889233;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2dwo0mK+bqzIMV2vqVZqr/nVM7rma+VBvCjtz+3mts0=;
        b=hSaY8izCyNzf3nhU7Q4jtBZsWKzqNhhM/8Vk27nlpClx+xEosKfTPRPgE7oqho/Olg
         Iaf6ubpmHQ0conmN2mteIDTg+xfyzGlWtHAmr6z/uSNkF2PkmoTZZIKo8vL0VkBKpSdl
         JFNFWeFnjcc2h/DipsnDSEUTmWgki+N7emfLS+3a0iHxrSb2Rqtl2D+JjxLgyGN+l4xx
         4ltwTf8VulBs0jCygKsoR1ub1e7fxPVnoPJzyOoY2Svu6lok4DlXSIjwt7+rxSuoTntv
         szoCgm6RtFgI1DpVVZHrzkF3ROlP4HDNehZlPkD3kGi8wXiulUNgYBEHxhhzjQpCaReQ
         XiAw==
X-Gm-Message-State: AOJu0YzIlca2TtKj+eRapetUWhQYL1WCdcNv7Wi/tGpS7vVoJS+WFCBv
	FoQkbe5jR4qeu/IoGKe9TRNeunZTJ9OgdtnlCQAWRw06Vl6RfuccNV5HhV3/XBDNxpdr0jdshHC
	jgQw9fyW4d+ys4IiYjQufxCnFOypnNzFBAt5xwd98Ig==
X-Gm-Gg: ASbGncsqHib3gMgfHgtD3Um5LdlfjQH8BjFNjTRJlEyNfKGCDvhZYE6J2Djz4KRD2u7
	IJ9t915Ppv68xhx2SvmPckUuogFypW/1n/rqMb1QeVw6Lp7STnMQ+7U86KsOETRwPKJzEhah9Vs
	luuOlnLXK1eh4B6uNdCvaSJeucpGs+K59WKSv6fqsiV1vZy30B/XQ13pgvVXNGsrSr0v9YdsWIH
	wisUG3LR9zswmnGYM24FuoM2IdW7J3LG0W2lnidd0Kd3zyVx871tGOiaNshkH+P4OUFsu4NyiI7
	xnba7TAA2QpQmEuqHdc4PNNQAy+ffkvTNvnbYPzryrIhdHR/27XoTkz/92URRWe2+O87YnJr
X-Google-Smtp-Source: AGHT+IFFraRAeuiI1TjJcve+C8bWdGAK2iAh+f5+4vXjy4txmHxKc0Yi8Ai7Ds1xgFV9WZ/2ZcHhRDupTSRM5aVDIXQ=
X-Received: by 2002:a05:6820:1885:b0:659:9a49:8dc6 with SMTP id
 006d021491bc7-6599a8ba575mr4078815eaf.8.1765284433326; Tue, 09 Dec 2025
 04:47:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <93c6c48283da84976a40aae1395db5a8d47f0b97.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <93c6c48283da84976a40aae1395db5a8d47f0b97.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 13:47:00 +0100
X-Gm-Features: AQt7F2qE3MCaTAIHsWrXx-HJTnu8lfdK-7AeZm2kqLq1LHEB0rd3n7x6V784etA
Message-ID: <CAHUa44E2skYSjKVxq5a_j_CnvMJ6hLOnrLeb0egJK0eRNueAjg@mail.gmail.com>
Subject: Re: [PATCH v1 04/12] xen/arm: ffa: harden RX/TX mapping
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Harden the RX/TX mapping paths and keep signed FF-A return codes
> end-to-end.
>
> Reject zero-length mappings and insist on page-aligned RX/TX buffer
> addresses before touching the P2M. The unmap plumbing is switched to
> use the same signed helpers so dispatcher error handling is consistent
> across map and unmap operations.
>
> This avoids partially mapped or silently truncated buffers and makes the
> mediator behaviour match the FF-A error model more closely.
>
> Prevent concurrent usage of rx or tx buffer during map or unmap by
> holding the rx_lock and tx_lock.
>
> While there also introduce a domain_rxtx_init to properly initialize the
> rxtx buffers spinlocks.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - take the rx_lock and tx_lock during rxtx_map and rxtx_unmap to prevent
>   concurrent calls using the rx or tx buffer during mapping.
> - properly clean rx/tx buffer related context entries during domain_init
> ---
>  xen/arch/arm/tee/ffa.c         |  4 ++
>  xen/arch/arm/tee/ffa_private.h |  5 ++-
>  xen/arch/arm/tee/ffa_rxtx.c    | 68 +++++++++++++++++++++++++++-------
>  3 files changed, 62 insertions(+), 15 deletions(-)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0f6f837378cc..497ada8264e0 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -451,6 +451,10 @@ static int ffa_domain_init(struct domain *d)
>      if ( ret )
>          return ret;
>
> +    ret =3D ffa_rxtx_domain_init(d);
> +    if ( ret )
> +        return ret;
> +
>      return ffa_notif_domain_init(d);
>  }
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 2daa4589a930..d6400efd50bb 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -438,10 +438,11 @@ void ffa_handle_partition_info_get(struct cpu_user_=
regs *regs);
>
>  bool ffa_rxtx_init(void);
>  void ffa_rxtx_destroy(void);
> +int32_t ffa_rxtx_domain_init(struct domain *d);
>  void ffa_rxtx_domain_destroy(struct domain *d);
> -uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>                              register_t rx_addr, uint32_t page_count);
> -uint32_t ffa_handle_rxtx_unmap(void);
> +int32_t ffa_handle_rxtx_unmap(void);
>  int32_t ffa_rx_acquire(struct domain *d);
>  int32_t ffa_rx_release(struct domain *d);
>
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index a40e5b32e3a5..5776693bb3f0 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -41,10 +41,10 @@ static int32_t ffa_rxtx_unmap(uint16_t id)
>      return ffa_simple_call(FFA_RXTX_UNMAP, ((uint64_t)id) << 16, 0, 0, 0=
);
>  }
>
> -uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
>                              register_t rx_addr, uint32_t page_count)
>  {
> -    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> +    int32_t ret =3D FFA_RET_INVALID_PARAMETERS;
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      struct page_info *tx_pg;
> @@ -66,20 +66,30 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t=
 tx_addr,
>          rx_addr &=3D UINT32_MAX;
>      }
>
> -    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
> +    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT || !page_count )
>      {
>          printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (lim=
it %u)\n",
>                 page_count, FFA_MAX_RXTX_PAGE_COUNT);
>          return FFA_RET_INVALID_PARAMETERS;
>      }
>
> +    if ( !IS_ALIGNED(tx_addr, FFA_PAGE_SIZE) ||
> +         !IS_ALIGNED(rx_addr, FFA_PAGE_SIZE) )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    spin_lock(&ctx->rx_lock);
> +    spin_lock(&ctx->tx_lock);
> +
>      /* Already mapped */
>      if ( ctx->rx )
> -        return FFA_RET_DENIED;
> +    {
> +        ret =3D FFA_RET_DENIED;
> +        goto err_unlock_rxtx;
> +    }
>
>      tx_pg =3D get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M=
_ALLOC);
>      if ( !tx_pg )
> -        return FFA_RET_INVALID_PARAMETERS;
> +        goto err_unlock_rxtx;
>
>      /* Only normal RW RAM for now */
>      if ( t !=3D p2m_ram_rw )
> @@ -167,6 +177,10 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_=
t tx_addr,
>      ctx->tx_pg =3D tx_pg;
>      ctx->page_count =3D page_count;
>      ctx->rx_is_free =3D true;
> +
> +    spin_unlock(&ctx->tx_lock);
> +    spin_unlock(&ctx->rx_lock);
> +
>      return FFA_RET_OK;
>
>  err_unmap_rx:
> @@ -177,24 +191,32 @@ err_put_rx_pg:
>      put_page(rx_pg);
>  err_put_tx_pg:
>      put_page(tx_pg);
> +err_unlock_rxtx:
> +    spin_unlock(&ctx->tx_lock);
> +    spin_unlock(&ctx->rx_lock);
>
>      return ret;
>  }
>
> -static uint32_t  rxtx_unmap(struct domain *d)
> +static int32_t rxtx_unmap(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t ret =3D FFA_RET_OK;
> +
> +    spin_lock(&ctx->rx_lock);
> +    spin_lock(&ctx->tx_lock);
>
>      if ( !ctx->page_count )
> -        return FFA_RET_INVALID_PARAMETERS;
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto err_unlock_rxtx;
> +    }
>
>      if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
>      {
> -        uint32_t ret;
> -
>          ret =3D ffa_rxtx_unmap(ffa_get_vm_id(d));
>          if ( ret !=3D FFA_RET_OK )
> -            return ret;
> +            goto err_unlock_rxtx;
>      }
>
>      unmap_domain_page_global(ctx->rx);
> @@ -208,10 +230,14 @@ static uint32_t  rxtx_unmap(struct domain *d)
>      ctx->page_count =3D 0;
>      ctx->rx_is_free =3D false;
>
> -    return FFA_RET_OK;
> +err_unlock_rxtx:
> +    spin_unlock(&ctx->tx_lock);
> +    spin_unlock(&ctx->rx_lock);
> +
> +    return ret;
>  }
>
> -uint32_t ffa_handle_rxtx_unmap(void)
> +int32_t ffa_handle_rxtx_unmap(void)
>  {
>      return rxtx_unmap(current->domain);
>  }
> @@ -272,6 +298,22 @@ out:
>      return ret;
>  }
>
> +int32_t ffa_rxtx_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock_init(&ctx->rx_lock);
> +    spin_lock_init(&ctx->tx_lock);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->rx_is_free =3D false;
> +
> +    return 0;
> +}
> +
>  void ffa_rxtx_domain_destroy(struct domain *d)
>  {
>      rxtx_unmap(d);
> @@ -298,7 +340,7 @@ void ffa_rxtx_destroy(void)
>
>  bool ffa_rxtx_init(void)
>  {
> -    int e;
> +    int32_t e;
>
>      /* Firmware not there or not supporting */
>      if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
> --
> 2.51.2
>

