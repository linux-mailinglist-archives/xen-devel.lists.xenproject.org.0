Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAEEC9B94C
	for <lists+xen-devel@lfdr.de>; Tue, 02 Dec 2025 14:23:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176198.1500719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQQLg-0005jR-Uj; Tue, 02 Dec 2025 13:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176198.1500719; Tue, 02 Dec 2025 13:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQQLg-0005gZ-Rm; Tue, 02 Dec 2025 13:23:20 +0000
Received: by outflank-mailman (input) for mailman id 1176198;
 Tue, 02 Dec 2025 13:23:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGiA=6I=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQQLe-0005gT-Pu
 for xen-devel@lists.xenproject.org; Tue, 02 Dec 2025 13:23:18 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ebf9e63-cf82-11f0-980a-7dc792cee155;
 Tue, 02 Dec 2025 14:23:15 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-7c704bf2d9eso2715084a34.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Dec 2025 05:23:15 -0800 (PST)
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
X-Inumbo-ID: 0ebf9e63-cf82-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764681794; x=1765286594; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0GDNGat/xXk0kGngXyU5po9TKeJxjeediOvdyxPXw=;
        b=Jh1a72vioXxxWkVuYbWsEiqDZBvgKsEkxbw9XWyIDB+/w2IpVsmBdIBqblN5uw07Ac
         L12xwEohPjLgk+PcavswD1F5e8xU+WFg1tFYNr/OMMVPRi1W5hh4rPzZwQUDdzdU0yDW
         GJSj0crJcNYecepbxyAbOwviH7dj+CjZBqyr8G1fUtmlKstJ8jc+eUWPGRTtSbI6GwdI
         lx1lGGA1ElpUai0Fh0Ikmos+lOPjqv8FcgwEKjGIAWrbASuRx4AwHjz7Nyjr73KFUb9n
         0/vZy0O6bNWy6+rYEbAvuPwXPbaJY2H60KbZEYtcmd12MG5TbQT0HkZmkGymu8vBiy35
         z71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764681794; x=1765286594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dc0GDNGat/xXk0kGngXyU5po9TKeJxjeediOvdyxPXw=;
        b=l1qB6SNlhIgfnE24TFDTP0f6i/Ea0DQYEA3B2a4VuYlvgNM5lzK8HLzL48oqPGdvCi
         E9pTMdnEXwaDFF06q6NKjsQB7ETk5JGP5poKVNWT1sVNsAZvKhr+dn4pgm7nMccPBCh1
         pTTPGc68QaKivHGsDwhdcLxg3sNvEGBoCAuPBI2fz0lTQ0E5M/PjAEc/22lTBDsaHHGo
         e+coY6jiyIdk4AiqWREZhVMciemLIEqHBPzYl7gxM7Ixjn9i8hII56YtFutPNVnJT6J+
         wBSAgitIPuJrbBnRxwQ6fY1sElSDLHAX+omvI6z4P33BPYHud3f9oiaCYGakm5eY7HeK
         Nvqg==
X-Gm-Message-State: AOJu0YxfTlrvFMi7+6orSPEsiCfORPzqAJfjPaVrKI2luQVQF4YpwXns
	JLVKPMpxPrSxp86aRDzKKNAVCuuDxof46hR+5e56vjX+jZ9qt2VmOZoigMibb3+Grz+rIFD4o2H
	drvjWulBw8ubVvVDKtLABDFdbm/5wIHmqwI2ewzyHEw==
X-Gm-Gg: ASbGnctqx9T9bfMKoRkMetJmZAX2PV/mNBGFEuYAyU51513DXs0HtW89BR0w4wZI05h
	FUCrs7FEElJpsr8SOz5HnPyl4UxMGs79rP0isVGWl+86Bnty8sxGVdynxKNxEb0De621jgWVp1b
	qtUg8T/4Pmp8tW0RM8qVB1ILzOk3jZ+Qpz71eFpVWXcxYFPDKFKEV7DgmRNVRNeENk/qoF3wb6H
	OvgNdRM2eoMq7FdiZgz0Bwhszf+E/cNdmutTgoBqHEnU8/in56cZb1AEsjwyBjc0mAvLKItl2J4
	lgN/VNWWw7YTGzOk7FNMO4bGpA==
X-Google-Smtp-Source: AGHT+IGG1p7WgqK7wUmdqhVCLbiVBd0beHG22npXUOFHSC3jxKfTudC7o75sT1B+alVSe6U+KPLE61RsjkRvXMtJnbQ=
X-Received: by 2002:a05:6830:2696:b0:7c7:cf5:8110 with SMTP id
 46e09a7af769-7c7c437f20amr18161628a34.17.1764681794214; Tue, 02 Dec 2025
 05:23:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <d4e6fa4807528918f40e4db76ac57db33efa5f67.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <d4e6fa4807528918f40e4db76ac57db33efa5f67.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 2 Dec 2025 14:23:02 +0100
X-Gm-Features: AWmQ_bnRxE3WWjG7gbYNrnjpQPVZF_3HOJRW5m9LlF3FyVw7vQmj0Y1UVlNNUyc
Message-ID: <CAHUa44GCwG+4cGqZUGdLSk9gmiOdXUq3=JTqcRqzTvSAK6x2xQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] xen/arm: ffa: harden RX/TX mapping
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Nov 27, 2025 at 4:52=E2=80=AFPM Bertrand Marquis
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
> While there also introduce a domain_rxtx_init to properly initialize the
> rxtx buffers spinlocks.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c         |  4 ++++
>  xen/arch/arm/tee/ffa_private.h |  5 +++--
>  xen/arch/arm/tee/ffa_rxtx.c    | 28 +++++++++++++++++++++-------
>  3 files changed, 28 insertions(+), 9 deletions(-)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 3309ca875ec4..47f426e85864 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -446,6 +446,10 @@ static int ffa_domain_init(struct domain *d)
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
> index 88b85c7c453a..4272afd37343 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -427,10 +427,11 @@ void ffa_handle_partition_info_get(struct cpu_user_=
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
> index a40e5b32e3a5..cd467d1dba68 100644
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
> @@ -66,13 +66,17 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t=
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
>      /* Already mapped */
>      if ( ctx->rx )
>          return FFA_RET_DENIED;
> @@ -181,7 +185,7 @@ err_put_tx_pg:
>      return ret;
>  }
>
> -static uint32_t  rxtx_unmap(struct domain *d)
> +static int32_t rxtx_unmap(struct domain *d)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
>
> @@ -190,7 +194,7 @@ static uint32_t  rxtx_unmap(struct domain *d)
>
>      if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
>      {
> -        uint32_t ret;
> +        int32_t ret;
>
>          ret =3D ffa_rxtx_unmap(ffa_get_vm_id(d));
>          if ( ret !=3D FFA_RET_OK )
> @@ -211,7 +215,7 @@ static uint32_t  rxtx_unmap(struct domain *d)
>      return FFA_RET_OK;
>  }
>
> -uint32_t ffa_handle_rxtx_unmap(void)
> +int32_t ffa_handle_rxtx_unmap(void)
>  {
>      return rxtx_unmap(current->domain);
>  }
> @@ -272,6 +276,16 @@ out:
>      return ret;
>  }
>
> +int32_t ffa_rxtx_domain_init(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +
> +    spin_lock_init(&ctx->rx_lock);
> +    spin_lock_init(&ctx->tx_lock);
> +
> +    return 0;
> +}
> +
>  void ffa_rxtx_domain_destroy(struct domain *d)
>  {
>      rxtx_unmap(d);
> @@ -298,7 +312,7 @@ void ffa_rxtx_destroy(void)
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

