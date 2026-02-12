Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANXpMRvijWln8QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:22:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D512E38E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229064.1535083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXZt-0005jd-Pf; Thu, 12 Feb 2026 14:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229064.1535083; Thu, 12 Feb 2026 14:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXZt-0005gf-Ls; Thu, 12 Feb 2026 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 1229064;
 Thu, 12 Feb 2026 14:21:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXZs-0005gZ-Bs
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:21:56 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bb67295-081e-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:21:50 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-40ee196dd78so109013fac.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:21:50 -0800 (PST)
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
X-Inumbo-ID: 2bb67295-081e-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770906109; cv=none;
        d=google.com; s=arc-20240605;
        b=WTj2CZkfVXN7mP6UPkS1Cumm7f5sD5mekO6+vt+iUfeIeVft39yI4L4uNx9GwPpDkn
         dRhJKj0SLLCNDEGrlPVMIWulDmQi7TiE/7f/7AhfT8rp/CiB+/Pgv2ghdazCZwhaoqO1
         Yp1NGcXEQjfJdWYfRCRzcGHMg9bd0KQx3OifMTd2gZb8kesYN+B65DSC05jws2hIvWQ3
         9S+tw/geZ26lnBHfAkABG2hmonPwUQ+Vmyect0UooEt5h2hRKP5/gky4WSfu03xu75aC
         oCcHG+FFpONNoRdfPpOI3r4JyK4DYACbITCif+yH25U8K96jXvqZzO8yFL8RcA47AIJT
         pT0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLYIz9zueWt1IEe9/Rwa8pHPWMoKFKCSivYWzBo0ARc=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=LnC6M79n6JwWEKXRJ4eiTuGYwq1e1G//eWlMM/Zppho+b59AuOJK17QQmUniB70xx4
         p26xlftXP7FgQzPBJFNwoCxx3CaD925cuMcF9fRJOVDZwmYIVu8GBvGz6yzct9KdV21D
         u7PDSPSEfUj8SRlkPpIyZLWXGQlNN4hQX2+bg05HHsB5L8OEfWSpAbKJLKEHMrYyc+B5
         j0/qv5d10KLuP4e110McGASfQaI5qNWQ12b7kIob6z68qeJP3Aw8y4wJRo3rePQXA/T4
         CtKOk+85k2XqJnbHFu6+Lmv6wNmYa6qKWKg6Sr0sf6VEEjhfq1FMmcTa0rqobN5KQYqh
         EkTw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770906109; x=1771510909; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLYIz9zueWt1IEe9/Rwa8pHPWMoKFKCSivYWzBo0ARc=;
        b=T0LCOSAyZWTDDCB+A/zmcRdcRURMF3ryxGF4l0JTocwRmY+Vb+xmrzmNaZr6wZr8t1
         M2pyOgsIUMMR8Gj0F+ZTF/lChImKsg3FXnC9/wDX57pPBDHIjkdLAvEOT3coxxtadgrT
         UHe95H6swR5E20obsbFCCOHrY4umrJP83DjD04f4+M5qhEtw7BKQe2M0JN5/+zEqCbwK
         1XtRxUEBnVvMOF+ELt/fHbkbpJaQ856MkmOCtd8n0ys7bxb0Rt4SY6SfT5EDioSu3VqM
         Y6gI/fc5ycxFjhwz5/4OXax9kHGs7Ks2GX0xnMLqjXmi+YlZ7tA2u3Ws70GTqrggtHAF
         Hj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906109; x=1771510909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLYIz9zueWt1IEe9/Rwa8pHPWMoKFKCSivYWzBo0ARc=;
        b=p09s7R/6s6rC2gnVv24ltQezfgz4tis/iJogZxeAKrELegvexyU44Apt3u3+jAE8W7
         DPUN7YeEoSTDOebVh73wXeuhudx8XEH3VRmEz+u0glWXiLBTzOS3ho7CRG/Cmi+e781+
         qzywk+W8wlzZ317OKpYEyIk/iMce2CTjqbU0l/gRM0JSFUyys6DmRHoAtsxMOSqNuMNe
         NGGO5UPQ6xTKzdYqk+PJgTu+Ajcv2h7ozgQjk87WGrh4kotdLR9NLmHBKimN/t9DDLhA
         AWwh9eDseWD4rU0rrpIPpuRVlLrGbmQvF9rnGb68wlbpODVFoNqftrSNCT/bScvRJDB3
         B2zA==
X-Gm-Message-State: AOJu0YyUMEFOxrf3482c0CG7ptmReeyI2ItdsAek2f4fHMxdaEkh8+sM
	rzgsQKf+fXj9lAQ+3mpxlMGf/sYqFDB1jKTORJpiM65jYC8XL6e1TCzoJ4HM5UgVm5aDIVhh//m
	+mOnbd5I5xPeYSdr1u/5FH3RSLvNnK/h1KQOn0OdZGQ==
X-Gm-Gg: AZuq6aIbzpzA8zuWfvdphmvIanwwdda1AvwOuKLN8VD3vkmrsEsMbGOd1JQ0paDJVwD
	DRsAiQnLjbfq/bvCmwPUL6DY1GZU14lOeUdX23dblv6rh7U+GYfZgtFp/KjY8UfnsYvJ0AS3i/a
	aTqS7GkfL7cLgHuKiOf6imMpcUKk0ikzKP14uA3FM133CZ5RjQW0RNjPhihLb2ypz1kp8uBLYZA
	eFGGecinWBEJNftwABhYN1aoV+QJ0IG63AkkHFsf4bk/HVH1I67mNTLeARLrSE0+YXqxCmcn+2w
	NMV7miQ4Yf634n1qzIySoDlmWe1R3wcguDs5xA==
X-Received: by 2002:a05:6870:700b:b0:409:6ddb:10fc with SMTP id
 586e51a60fabf-40ec8819e62mr1376475fac.7.1770906109113; Thu, 12 Feb 2026
 06:21:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <5189cce4272700616ff5a39870566abc72a1acd2.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <5189cce4272700616ff5a39870566abc72a1acd2.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:21:37 +0100
X-Gm-Features: AZwV_QjVAk-V_PvYUdiIzB30hBZsiWN4A82btvhLaiZ12FBzJDPJj7YphZzSoDk
Message-ID: <CAHUa44FMnUMUYv=c__xznhyHYC8mGQk6fz2buNtBdTOuvKX_6g@mail.gmail.com>
Subject: Re: [PATCH v2 03/12] xen/arm: ffa: Harden shm page parsing
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
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 029D512E38E
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
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
> While there rename ffa_mem_share to ffa_spmc_share and ffa_mem_reclaim
> to ffa_spmc_reclaim to have coherent names with other parts of ffa
> implementation for SMC wrappers to the SPMC.
>
> Functional impact: invalid or misaligned memory ranges now fail earlier
> with proper error codes; behavior for valid descriptors is unchanged.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - rename ffa_mem_share to ffa_spmc_share and ffa_mem_reclaim to
>   ffa_spmc_reclaim
> - remove unused frag_len
> ---
>  xen/arch/arm/tee/ffa_private.h | 11 +++++++
>  xen/arch/arm/tee/ffa_shm.c     | 60 ++++++++++++++++------------------
>  2 files changed, 40 insertions(+), 31 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

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
> index 90800e44a86a..adc7e645a1c7 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -96,16 +96,14 @@ struct ffa_shm_mem {
>      struct page_info *pages[];
>  };
>
> -static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> -                             register_t addr, uint32_t pg_count,
> -                             uint64_t *handle)
> +static int32_t ffa_spmc_share(uint32_t tot_len, uint64_t *handle)
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
> +static int32_t ffa_spmc_reclaim(struct ffa_shm_mem *shm, uint32_t flags)
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
> @@ -297,7 +305,6 @@ static int share_shm(struct ffa_shm_mem *shm)
>      struct ffa_address_range *addr_range;
>      struct ffa_mem_region *region_descr;
>      const unsigned int region_count =3D 1;
> -    uint32_t frag_len;
>      uint32_t tot_len;
>      paddr_t last_pa;
>      unsigned int n;
> @@ -350,7 +357,6 @@ static int share_shm(struct ffa_shm_mem *shm)
>      }
>
>      addr_range =3D region_descr->address_range_array;
> -    frag_len =3D ADDR_RANGE_OFFSET(descr->mem_access_count, region_count=
, 1);
>      last_pa =3D page_to_maddr(shm->pages[0]);
>      init_range(addr_range, last_pa);
>      for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> @@ -362,12 +368,11 @@ static int share_shm(struct ffa_shm_mem *shm)
>              continue;
>          }
>
> -        frag_len +=3D sizeof(*addr_range);
>          addr_range++;
>          init_range(addr_range, pa);
>      }
>
> -    ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    ret =3D ffa_spmc_share(tot_len, &shm->handle);
>
>  out:
>      ffa_rxtx_spmc_tx_release();
> @@ -637,8 +642,6 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint3=
2_t flags)
>      struct domain *d =3D current->domain;
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      struct ffa_shm_mem *shm;
> -    register_t handle_hi;
> -    register_t handle_lo;
>      int32_t ret;
>
>      if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
> @@ -652,8 +655,7 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint3=
2_t flags)
>      if ( !shm )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    uint64_to_regpair(&handle_hi, &handle_lo, handle);
> -    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    ret =3D ffa_spmc_reclaim(shm, flags);
>
>      if ( ret )
>      {
> @@ -677,11 +679,7 @@ bool ffa_shm_domain_destroy(struct domain *d)
>
>      list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
>      {
> -        register_t handle_hi;
> -        register_t handle_lo;
> -
> -        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
> -        res =3D ffa_mem_reclaim(handle_lo, handle_hi, 0);
> +        res =3D ffa_spmc_reclaim(shm, 0);
>          switch ( res ) {
>          case FFA_RET_OK:
>              printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
> --
> 2.52.0
>

