Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E52C97E35
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 15:44:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175759.1500373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ582-0005iS-Gf; Mon, 01 Dec 2025 14:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175759.1500373; Mon, 01 Dec 2025 14:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ582-0005fu-DG; Mon, 01 Dec 2025 14:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1175759;
 Mon, 01 Dec 2025 14:43:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckhn=6H=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vQ580-0005fY-PE
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 14:43:48 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24538357-cec4-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 15:43:47 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-65962c714eeso36805eaf.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 06:43:47 -0800 (PST)
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
X-Inumbo-ID: 24538357-cec4-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764600226; x=1765205026; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZbr8UvSDfzy4nkhgyFpOtzWOvl8QD48or1B2VBuZiE=;
        b=xVvtqoiyzJJyvVpl3mNDJ4a3P4eDDcXKYFFo5SMb9jeprtF9IZjmNFUq6xlO1TensC
         urUcmXb+flEbF/tICnVW9p7TYHVxZbQRgPhcgAqUEgCXB/aPZJH8bPIvBIuFsqSpQeAf
         4pQT94rzXcOagWJ+s9dPHuuwpU/IuOZtElhz71GSqkB2iQH1abBAHyN4GCNOq78HlL8L
         hPqnbbunN4GVee17IpMk1mxeI76YeYMW9EK7U3YavW6ouSrDH/lNJzuMh/OOZb7UHcUP
         Sm1C57qmZXweKS+/JAc55pTmvXW4RYCwGTHJ4JXx4XYEHh1K0P8V1R1zHcjVeVZXyTNZ
         wLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600226; x=1765205026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BZbr8UvSDfzy4nkhgyFpOtzWOvl8QD48or1B2VBuZiE=;
        b=vLGUoqNn8mQAmIbLxSlyOyT1qkpa3d8AXYV+WN4xOoyCSq9+/NvS7UWt6PoJ++DMlv
         YZS47R7mbOlg0ypzjrYVrSVhfeX60+O/qZyZaH5gvnky6Q6erau5TE3TaXzdphL2BTAt
         87hNWb4Umq8aqaD8oyQYAIekZnXEbpRnWrZiKF3BABMIztHM0Zq4PeZ6jtelv1hJ+JFa
         laHXmCA3b8TzpEkCawNtV1HkvDCT4+ALW8JN+JsqmmbNhxPPSpI+9Ewdm7BSoteLsnMx
         KriptlK1XWOhT/nT8sj+RNqLzCHaPaTVZjwmykwtJQ1bODFPDeWkG7XlXjbIY82yJwu0
         odAg==
X-Gm-Message-State: AOJu0YzbMxSrEkPPxPz/rN+oMEXAIwMLlx1Ug5vrpXLzK4dpqZk8dfnY
	cShYC4TT9xGCOBdUQ42gzFVuGm/tBh+DikHxPr0ePqCOT88Of7GxT44HyqhniQ6emzdQXkHyLcO
	8X2J71NHHlo5SEC95wOkYaldcko39x7h+WTHzrd82sfFeUJlhI+R4zVoAAQ==
X-Gm-Gg: ASbGncuVWY0z10DAAPm7rA6W3kTSHm5lyW/UNoUWoDkiEe+Zf+eVbPc+5bfosCeadsv
	0YAuvxAm+0JEKTQVjLTZiow6lqARWmb8kfCsRNvqUqya7UeQExRhHfihzN/mKLsaIPyDjEOD06I
	caS6Gs8wYuAvYtDlb0NhgoAhqfEVBo5CGy6x3Vch1+b1v8KAMJ79zAAvbNea7S86c3U2xPIIlwY
	XRnrsSymWBNyCPFmF/VtVYwXfbIaT2FUoRnHOIoFin85rnrzfoDf/6a0LE03DndR/uDxqfJmXd8
	ApvCjROitSSzH867uuMUVznLcBQ0y7EeVg6j
X-Google-Smtp-Source: AGHT+IHfs1H7G1sRdfTTHIOIwCp8bdvrJ0mOQ9jWX0hRRqzDzXizpq2SFC+jhdTWHrftnS7HwMo/wYugsJQUB2uNcG4=
X-Received: by 2002:a05:6820:5107:b0:657:182a:a5e2 with SMTP id
 006d021491bc7-657858c6ee0mr12080066eaf.4.1764600226003; Mon, 01 Dec 2025
 06:43:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764254975.git.bertrand.marquis@arm.com> <2264daf90cbb25b9a60ebe8edbebb8988d95966b.1764254975.git.bertrand.marquis@arm.com>
In-Reply-To: <2264daf90cbb25b9a60ebe8edbebb8988d95966b.1764254975.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 1 Dec 2025 15:43:34 +0100
X-Gm-Features: AWmQ_bk3NsETxMlafFSuq_v7-OmTt4Bzp4yVeBDec8wo6RfMhXgKnLkanqJTafc
Message-ID: <CAHUa44E=JChox1T8K_kRBQ2nt1QutsDAaMGf3bzD=VO12LFiPg@mail.gmail.com>
Subject: Re: [PATCH 01/10] xen/arm: ffa: add FF-A v1.2 function IDs
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
> Bring the FF-A headers up to the v1.2 baseline and fix the function-numbe=
r
> range used for ABI discovery:
>
> - update FFA_FNUM_MAX_VALUE so the FF-A function-number window covers the
>   full v1.2 range, and derive the ABI bitmap bounds from
>   FFA_FNUM_MIN_VALUE/FFA_FNUM_MAX_VALUE instead of hard-coding
>   FFA_ERROR/FFA_MSG_SEND2
> - define the new v1.2 function IDs; CONSOLE_LOG and
>   PARTITION_INFO_GET_REGS are added for ABI discovery even though they ar=
e
>   not implemented yet
> - extend the firmware ABI table to probe RUN and
>   MSG_SEND_DIRECT_REQ2/RESP2
> - while there, fix an off-by-one in ffa_fw_supports_fid(): the computed b=
it
>   index must be strictly smaller than FFA_ABI_BITMAP_SIZE, so use >=3D in=
 the
>   bounds check
>
> Keep FFA_MY_VERSION at 1.1 for now; we only advertise v1.2 once the
> implementation is fully compliant.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/include/asm/tee/ffa.h |  2 +-
>  xen/arch/arm/tee/ffa.c             |  4 ++++
>  xen/arch/arm/tee/ffa_private.h     | 18 +++++++++++-------
>  3 files changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/as=
m/tee/ffa.h
> index 24cd4d99c8f9..c587f76e63ca 100644
> --- a/xen/arch/arm/include/asm/tee/ffa.h
> +++ b/xen/arch/arm/include/asm/tee/ffa.h
> @@ -16,7 +16,7 @@
>  #include <asm/types.h>
>
>  #define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> -#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x8F,U)

This is MAX+1, if I'm not mistaken.

>
>  static inline bool is_ffa_fid(uint32_t fid)
>  {
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 1d0239cf6950..2b4e24750d52 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -11,6 +11,8 @@
>   *               https://developer.arm.com/documentation/den0077/a
>   * FF-A-1.1-REL0: FF-A specification version 1.1 available at
>   *                https://developer.arm.com/documentation/den0077/e
> + * FF-A-1.2-REL0: FF-A specification version 1.2 available at
> + *                https://developer.arm.com/documentation/den0077/j
>   * TEEC-1.0C: TEE Client API Specification version 1.0c available at
>   *            https://globalplatform.org/specs-library/tee-client-api-sp=
ecification/
>   *
> @@ -102,6 +104,8 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] =
=3D {
>      FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
>      FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
>      FW_ABI(FFA_MSG_SEND2),
> +    FW_ABI(FFA_MSG_SEND_DIRECT_REQ2),
> +    FW_ABI(FFA_RUN),
>  };
>
>  /*
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 6dbdb200d840..d7e6b6f5ef45 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -15,6 +15,7 @@
>  #include <xen/spinlock.h>
>  #include <xen/time.h>
>  #include <xen/types.h>
> +#include <asm/tee/ffa.h>
>
>  /* Error codes */
>  #define FFA_RET_OK                      0
> @@ -42,6 +43,7 @@
>
>  #define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
>  #define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
> +#define FFA_VERSION_1_2         MAKE_FFA_VERSION(1, 2)
>  /* The minimal FF-A version of the SPMC that can be supported */
>  #define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
>
> @@ -270,6 +272,10 @@
>  #define FFA_RX_ACQUIRE                  0x84000084U
>  #define FFA_SPM_ID_GET                  0x84000085U
>  #define FFA_MSG_SEND2                   0x84000086U
> +#define FFA_CONSOLE_LOG                 0x8400008AU

This is the 32-bit version of the interface. There's also a 64-bit version.

> +#define FFA_PARTITION_INFO_GET_REGS     0x8400008BU
> +#define FFA_MSG_SEND_DIRECT_REQ2        0xC400008DU
> +#define FFA_MSG_SEND_DIRECT_RESP2       0xC400008EU
>
>  /**
>   * Encoding of features supported or not by the fw in a bitmap:
> @@ -280,11 +286,9 @@
>  #define FFA_ABI_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
>  #define FFA_ABI_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0,U)=
)
>
> -#define FFA_ABI_MIN           FFA_ABI_ID(FFA_ERROR)
> -#define FFA_ABI_MAX           FFA_ABI_ID(FFA_MSG_SEND2)
> -
> -#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_ABI_MAX - FFA_ABI_MIN + 1))
> -#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
> +#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_FNUM_MAX_VALUE - FFA_FNUM_MIN_VA=
LUE \
> +                               + 1))

Depending on whether FFA_FNUM_MAX_VALUE is MAX+1 or just MAX, we could
drop the +1.

Cheers,
Jens

> +#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_FNUM_MIN_VALUE) << =
1 | \
>                                 FFA_ABI_CONV(id))
>
>  /* Constituent memory region descriptor */
> @@ -549,9 +553,9 @@ static inline int32_t ffa_hyp_rx_release(void)
>
>  static inline bool ffa_fw_supports_fid(uint32_t fid)
>  {
> -    BUILD_BUG_ON(FFA_ABI_MIN > FFA_ABI_MAX);
> +    BUILD_BUG_ON(FFA_FNUM_MIN_VALUE > FFA_FNUM_MAX_VALUE);
>
> -    if ( FFA_ABI_BITNUM(fid) > FFA_ABI_BITMAP_SIZE)
> +    if ( FFA_ABI_BITNUM(fid) >=3D FFA_ABI_BITMAP_SIZE)
>          return false;
>      return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
>  }
> --
> 2.51.2
>

