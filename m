Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHnrLoypiWnfAQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:31:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BB10D937
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 10:31:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225060.1531510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNcJ-0005kv-IM; Mon, 09 Feb 2026 09:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225060.1531510; Mon, 09 Feb 2026 09:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpNcJ-0005iq-Fl; Mon, 09 Feb 2026 09:31:39 +0000
Received: by outflank-mailman (input) for mailman id 1225060;
 Mon, 09 Feb 2026 09:31:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Y/H=AN=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vpNcI-0005ik-Dg
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 09:31:38 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bdf031c-059a-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 10:31:28 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-40429b1d8baso1316422fac.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Feb 2026 01:31:28 -0800 (PST)
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
X-Inumbo-ID: 1bdf031c-059a-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770629487; cv=none;
        d=google.com; s=arc-20240605;
        b=J+HJTN1L+6deIK1tkIf1bVmPZcMx0HaDiLGWH0pfSzMtwD6WRv23lg+8HJwx/e1Dnz
         IPwkYBTKw1U5wJZoYosFggeCwq05y1QsvNBeZbkMyOC1UWDSxIliipiR7YWZJT1lekUA
         ZZiBbV577Tacr+JIv289QdH0uTwvILPGAeZGB3nN+SYmKrqeJ5XfolaLvj3KSD0WSJuc
         wUlogLLgOnpyO+60Y/lJQ0BIIM54QkCtISK1mxSP6/bdiAYmBsSNXhOrwAzA6O9wSD6g
         A9PrWCpcZHzz+PwiTHuA1qR0v/+6TGjR+9BwFQ18J77vYUXv+FcbO31oljUCZFkOpBg2
         OxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O0o1/Bj54XGcPpPmp6xwMpgdLQgL1D0IbYLcV2QHG1w=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=TtehPdsyqfBqc9UwrnnTAN7w0O+rtj/BNUeQ58uTuLTpfx0J9HGkzDV0tLYVplZnBI
         tAbaWLaoVbc5qnsztJ34DOtrhOAGqsP2UHANW5DX9bj+i8JvECxZxAmxSHDevyFxKz7I
         /frG1Nb4lzo0OiZI+LzzmJUMla36o1kaBSTwoZNOU7kxE8nkIsWfc2IErpPMRvHRy5aJ
         OKoHVs0v4q8lkNeRptB6VRiYOhT5Yi5CvNc7rIQvmt3XroRjwFC5iGzUGyHK2Vmt2ZY3
         jcfhN+Iih5Vm7mIKWmlHsjmHUfz3BaBPOd2uxuxGACsFpiuGOat4iLc/SU98Q2g2Rd2p
         x+qQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770629487; x=1771234287; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0o1/Bj54XGcPpPmp6xwMpgdLQgL1D0IbYLcV2QHG1w=;
        b=jrHTzvc0kPIZMc0cozLt5FlGjxnefUAfEFKBpmJ/pbIzttzQaty7ygRdjW0EoPKXmf
         iBgUnCynk8gkQhdB7H0zuXTN250bXk2JsMxRHLUCr1O0yLczBYRZqcZklMOXf63NUChp
         h03cbUv5cDgkj/MI8xoF1yWCjsQtcAJsDsgNl3Djxg98ug6zzWsePsmBIhRqq7hQGIdE
         EIatCCKCwRQhQTEAx4wnkwRH37x9BncHIoJPoeVqXqaeBfdgDBQ95IMKEOBTcjL/eBff
         Vzaecr3UB3vO4Ac+w6tzz619zuLpvI+n/ucG9RL9PM5GNVKx/k/D6+f+cPC0soC6wZZM
         VM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629487; x=1771234287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O0o1/Bj54XGcPpPmp6xwMpgdLQgL1D0IbYLcV2QHG1w=;
        b=tTXXHmfdIfBRvcru7Z9z6iQ1h2CKmOysw4D9wO7wRSIUALLuqce4HaymC61FYm/AhG
         GDSfIKNznaBijG6ruAKmq7hEQIoQETH6+BsneM7mN5Uuh8vo1ZO3zkDjkln3qIy7n9gx
         4ro3D+VeMB3jtZSKZI9Ay0dvq00VDu28Zumdqtt3TJRmHbovTLtVaumflYgtGGZcd5pe
         1GyapSS0V8/Hwnpak34XeDEmT/w67Dq9C0ApxSnqj+k74v4ixZ3z1Od9ZZv1+pnRUnRp
         EV1Fqf8sqdl/68sGcCkwUOR0wlY0OD9GmL63CXBqXeqbI5Px3vmc7lyD5GATzrlu17a5
         dsVw==
X-Gm-Message-State: AOJu0YxDgUU/SIdh/TOGPgZ4e22WoHH3vKoDXfS5u5iNMxwuT4PjNf8i
	QY5D3Hty05zK+KdjDS4CzsYOlW/TuyMZfHBuSIJ7sYYCAWav/h3q3FKX7THWGRu6Pm6Vad7dMjT
	+M+c8xjOOOh4pqHOlmH99jMIHa2Uc5nr5fBcfSKiAnw==
X-Gm-Gg: AZuq6aImVYy61paEj6pN6PQPHdOxkOV6dcgCmxwvn1YtWVjBQB0HBdlovSRnp43vwaV
	hmRwoBdZZWyC74zbAbU32rWUGAx27fA9uubznKIpY0QNWoLcwg16Mki13U93UwK538+9ouF8anP
	C/DGJmQJYtYm69BlHNdQYq3ZG+CY4lFume3A/9uoayVevC74NtcCzshLhIfK3cuJZNLUNFHVpJe
	1Am6rtW7i2dDgCfDMkOnh6VcFSM29yJShdeO6ZQAvHCdd9lQ4yOKLzZegytcB+EB1IMH/9S3FzI
	kfjY3LlLUcZSAFKyyZ0nTrc1Pg==
X-Received: by 2002:a05:6870:44c9:b0:40a:62b7:1619 with SMTP id
 586e51a60fabf-40a96f90eacmr5939057fac.46.1770629486838; Mon, 09 Feb 2026
 01:31:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 9 Feb 2026 10:31:15 +0100
X-Gm-Features: AZwV_Qh3Ing8UIqZBqcXWB5tfalsZrcsBW9TLoWWNf-WEJ9ogJ8KgZPu6NeBnrg
Message-ID: <CAHUa44Ey=Ph_m8r933K5enqPJgFuyVgY+2Qhtj3pi+V_Fw4=6A@mail.gmail.com>
Subject: Re: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,linaro.org:dkim,mail.gmail.com:mid];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 294BB10D937
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> get_shm_pages() uses unchecked address arithmetic and does not enforce
> alignment, so malformed descriptors can cause overflow or slip through
> validation. The reclaim path also repeats handle-to-shm-mem conversion
> in multiple places, duplicating error handling.
>
> Harden page parsing and reclaim handling:
> - add ffa_safe_addr_add() and use it to detect address overflows
> - enforce alignment checks in get_shm_pages() and return FF-A errors
> - introduce ffa_secure_reclaim() and use it for MEM_RECLAIM and teardown
> - simplify ffa_mem_share() argument handling and allow max page count
>
> Functional impact: invalid or misaligned memory ranges now fail earlier
> with proper error codes; behavior for valid descriptors is unchanged.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_private.h | 11 +++++++
>  xen/arch/arm/tee/ffa_shm.c     | 57 +++++++++++++++++-----------------
>  2 files changed, 40 insertions(+), 28 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index b625f1c72914..58562d8e733c 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -632,4 +632,15 @@ static inline void ffa_uuid_set(struct ffa_uuid *id,=
 uint32_t val0,
>      id->val[1] =3D ((uint64_t)val3 << 32U) | val2;
>  }
>
> +/*
> + * Common overflow-safe helper to verify that adding a number of pages t=
o an
> + * address will not wrap around.
> + */
> +static inline bool ffa_safe_addr_add(uint64_t addr, uint64_t pages)
> +{
> +    uint64_t off =3D pages * FFA_PAGE_SIZE;
> +
> +    return (off / FFA_PAGE_SIZE) =3D=3D pages && addr <=3D UINT64_MAX - =
off;
> +}
> +
>  #endif /*__FFA_PRIVATE_H__*/
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 90800e44a86a..4c0b45cde6ee 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -96,16 +96,14 @@ struct ffa_shm_mem {
>      struct page_info *pages[];
>  };
>
> -static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> -                             register_t addr, uint32_t pg_count,
> -                             uint64_t *handle)
> +static int32_t ffa_mem_share(uint32_t tot_len, uint64_t *handle)
>  {
>      struct arm_smccc_1_2_regs arg =3D {
>          .a0 =3D FFA_MEM_SHARE_64,
>          .a1 =3D tot_len,
> -        .a2 =3D frag_len,
> -        .a3 =3D addr,
> -        .a4 =3D pg_count,
> +        .a2 =3D tot_len,
> +        .a3 =3D 0,
> +        .a4 =3D 0,
>      };
>      struct arm_smccc_1_2_regs resp;
>
> @@ -131,12 +129,16 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint=
32_t frag_len,
>      }
>  }
>
> -static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> -                               uint32_t flags)
> +static int32_t ffa_secure_reclaim(struct ffa_shm_mem *shm, uint32_t flag=
s)

I agree with moving the uint64_to_regpair() call into this function,
but I'm puzzled by the new name. What's secure?

>  {
> +    register_t handle_hi;
> +    register_t handle_lo;
> +
>      if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
>          return FFA_RET_NOT_SUPPORTED;
>
> +    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> +
>      return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags,=
 0);
>  }
>
> @@ -145,7 +147,7 @@ static int32_t ffa_mem_reclaim(uint32_t handle_lo, ui=
nt32_t handle_hi,
>   * this function fails then the caller is still expected to call
>   * put_shm_pages() as a cleanup.
>   */
> -static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +static int32_t get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
>                           const struct ffa_address_range *range,
>                           uint32_t range_count)
>  {
> @@ -156,17 +158,26 @@ static int get_shm_pages(struct domain *d, struct f=
fa_shm_mem *shm,
>      p2m_type_t t;
>      uint64_t addr;
>      uint64_t page_count;
> +    uint64_t gaddr;
>
>      for ( n =3D 0; n < range_count; n++ )
>      {
>          page_count =3D ACCESS_ONCE(range[n].page_count);
>          addr =3D ACCESS_ONCE(range[n].address);
> +
> +        if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
>          for ( m =3D 0; m < page_count; m++ )
>          {
>              if ( pg_idx >=3D shm->page_count )
>                  return FFA_RET_INVALID_PARAMETERS;
>
> -            gfn =3D gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
> +            if ( !ffa_safe_addr_add(addr, m) )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            gaddr =3D addr + m * FFA_PAGE_SIZE;
> +            gfn =3D gaddr_to_gfn(gaddr);
>              shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
>                                                    P2M_ALLOC);
>              if ( !shm->pages[pg_idx] )
> @@ -180,7 +191,7 @@ static int get_shm_pages(struct domain *d, struct ffa=
_shm_mem *shm,
>
>      /* The ranges must add up */
>      if ( pg_idx < shm->page_count )
> -            return FFA_RET_INVALID_PARAMETERS;
> +        return FFA_RET_INVALID_PARAMETERS;
>
>      return FFA_RET_OK;
>  }
> @@ -198,15 +209,11 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>
>  static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
>  {
> -    bool ret =3D true;
> +    bool ret =3D false;
>
>      spin_lock(&ctx->lock);
>
> -    if ( ctx->shm_count >=3D FFA_MAX_SHM_COUNT )
> -    {
> -        ret =3D false;
> -    }
> -    else
> +    if ( ctx->shm_count < FFA_MAX_SHM_COUNT )
>      {
>          /*
>           * If this is the first shm added, increase the domain reference
> @@ -217,6 +224,7 @@ static bool inc_ctx_shm_count(struct domain *d, struc=
t ffa_ctx *ctx)
>              get_knownalive_domain(d);
>
>          ctx->shm_count++;
> +        ret =3D true;
>      }
>
>      spin_unlock(&ctx->lock);
> @@ -251,7 +259,7 @@ static struct ffa_shm_mem *alloc_ffa_shm_mem(struct d=
omain *d,
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      struct ffa_shm_mem *shm;
>
> -    if ( page_count >=3D FFA_MAX_SHM_PAGE_COUNT )
> +    if ( page_count > FFA_MAX_SHM_PAGE_COUNT )
>          return NULL;
>      if ( !inc_ctx_shm_count(d, ctx) )
>          return NULL;
> @@ -367,7 +375,7 @@ static int share_shm(struct ffa_shm_mem *shm)
>          init_range(addr_range, pa);
>      }
>
> -    ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);

Please remove frag_len from share_shm() since it's not needed any longer.

Cheers,
Jens

> +    ret =3D ffa_mem_share(tot_len, &shm->handle);
>
>  out:
>      ffa_rxtx_spmc_tx_release();
> @@ -637,8 +645,6 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint3=
2_t flags)
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      struct ffa_shm_mem *shm;
> -    register_t handle_hi;
> -    register_t handle_lo;
>      int32_t ret;
>
>      if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> @@ -652,8 +658,7 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint3=
2_t flags)
>      if ( !shm )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    uint64_to_regpair(&handle_hi, &handle_lo, handle);
> -    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    ret =3D ffa_secure_reclaim(shm, flags);
>
>      if ( ret )
>      {
> @@ -677,11 +682,7 @@ bool ffa_shm_domain_destroy(struct domain *d)
>
>      list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
>      {
> -        register_t handle_hi;
> -        register_t handle_lo;
> -
> -        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> -        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> +        res =3D ffa_secure_reclaim(shm, 0);
>          switch ( res ) {
>          case FFA_RET_OK:
>              printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> --
> 2.50.1 (Apple Git-155)
>

