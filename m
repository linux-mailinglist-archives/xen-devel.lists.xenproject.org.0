Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aN92I52xhWkRFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:17:17 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CBBFBEA1
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 10:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223035.1530691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHxU-0002G0-1i; Fri, 06 Feb 2026 09:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223035.1530691; Fri, 06 Feb 2026 09:17:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voHxT-0002EV-Uw; Fri, 06 Feb 2026 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 1223035;
 Fri, 06 Feb 2026 09:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O5P7=AK=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1voHxS-0002EP-CA
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 09:16:58 +0000
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [2607:f8b0:4864:20::c2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 952638e0-033c-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 10:16:56 +0100 (CET)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-66314fa03c9so1175291eaf.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Feb 2026 01:16:56 -0800 (PST)
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
X-Inumbo-ID: 952638e0-033c-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770369415; cv=none;
        d=google.com; s=arc-20240605;
        b=Bf8JuqUy4bGJcVj3w/NJIIV4XD4clsHaQFOC+4OMEyNTKVjm+Bolv1KGsjiV44uEPz
         AeO4bghcFXFgv1vHuQ2QmKvsd29LExWsIy16unbLw6oyGo7cnem8rqQd9c08erf2teC8
         0tvbsbp+M1qwhbNXhp771MQUjTm9Dgaa11FwudrWqeCdajTVfsFrLhfSmdn79xcumW+S
         YvVuqE6Am3/f1bnSLZvCK8p1zuR5xS81tP3AU7soMRdMFpIKzz7CEQAcV8198e5jZBAI
         e6MO5HtStS7IXsdm9mqzC4LS2ysrumCDlb3qxdPDe3DG5lnF6lcklillxhPqT9V0igCh
         vVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ewCMcU3FXn5aamHbAb40erMcNWhH6SJAYdvFqj8jIc=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Q6ZUUXePTvigmhoTNRLEjmcgRgQVRFNFtH6gj6Y/YINWxuJaNi6ut+UekMYTUEnZmV
         BCBigv2Dg1l0Y4ifmhXigX5orrcrSGw7Nx2IdgsiPNI9QCN4GktpdN6fvoak/NmWhltj
         MUzZPKuxYiMD/hXDhCuaHFzd0vC5LCMAfw4LdnC08tvWW2E6uQe1IZvWC5MVcq/Q7duS
         CKq62csU6klKFRbJhvxP+UVR+tpZi9eZQ5Ovajf83HJww7pxhWgjupxpD1xcQ5t8/kmW
         acVktc7yzWS43NuKCseViA9zcTCtRzosAgbNdAbqFnK99vRZIpuY6l8X69PrTaokFBPn
         adLg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770369415; x=1770974215; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ewCMcU3FXn5aamHbAb40erMcNWhH6SJAYdvFqj8jIc=;
        b=jF923ObE9v0qAgDXd+N4FtbMktwaTX2jPOxmxNtI2/OutLIc7RZ3mLQNyg3LlB2bNw
         CGURfc8mOGpItFHSU2OG3IeeilsHUO0nG2dzRDhtMEQH/LqRmrcNMWri+JMo+kdnTD8c
         k2/lWi/Qi2vuNC1tdcdLzy9ntHDMeGduzLomDI3tUOg0Oc1n402WlGWZig585ycy72pv
         MZK/LnKerm/e8Xd6ISAPuPap4SVa65DXzLNXWaMoiarfp+PISX9JpexBTfjwMiDSAQy8
         VYCdnfAkDypWZ+O0SDQBrJW1IIAhaeJWqB5GIHoifrWV5UgfF9TglQEkrVW5e49uWPlF
         O5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369415; x=1770974215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ewCMcU3FXn5aamHbAb40erMcNWhH6SJAYdvFqj8jIc=;
        b=ALLLY4+erWi5ekA53NjoZhpyEw5F7ompM9EaEXyFv6eN147gmUkQBOG1JM+PyszPfK
         nl/Lp1xWjIS4GPGRhCsXuGnFcNCc3Nfow9cs9rGPK/7wbUFG6mc3E3hQ0rD3TlGs9K33
         1fw+WjP9CGvp+joqJHHIqc4klImqx8gnguA6wIUziRJVE6vKNEh2NaAhmDENsX1rP3fH
         sG39XaXrlh+7jcBMAzvRTtTEJmK71PWtrgbUs0dKM9dOm6La35kN4JvGGFhLDY1wG3ml
         zCMgXxD+RKeb4oe6o5YtQAB7TVlpMudwVmDN9rn8S8TChEDBgco4XnbKiS3nWxoZqUfq
         f8zw==
X-Gm-Message-State: AOJu0YwMJTzIQINjN/urbeVHhmOGZQJ1zNCWI1XRors+TTBHV2xPhvqh
	/uauWIohT1hviyAkDzN1rBgB1qjvN5zj4fwgEabJ5m5CTmtnEv1C6zQ+9B4AjVNCUgVZuHFp+CW
	+at82sYnXInX32QI4EthuD9Ltujq2mPZPcAzGT1z2vg==
X-Gm-Gg: AZuq6aKUtGOgErrRvxQshOWhhEf80T12eyINMJBhUnK2VIoXuSUQnVj1/7lC0s/dcTL
	tsQkzatAk+LKkdzr7msNeHlj92BBfm7B927q2e3+c1P/UdI1ADHc+9Adh3D8cbBUBG2rhDJqfVI
	9RsKT93NCBNPQY7E3FbqIYSzbjapsqG2NLtwe6yV6yfexQTzUMNmm74/naLVTZuVNUmDwPyFY4N
	YZuZIKz/7O4pvctnQtN05OH19PGbzVllFlJf5DsHk+J6h4pB+i3tFDR1UtRhVWqy9B5lmN9X+dN
	sc1rzKd34CYkBTlyuoTgcJyB3g==
X-Received: by 2002:a05:6820:450a:b0:65e:eec4:70d5 with SMTP id
 006d021491bc7-66d09cb41fcmr743769eaf.8.1770369415349; Fri, 06 Feb 2026
 01:16:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <db0a0b4459630ea00a67d5e985cff3bca73d1c64.1770115301.git.bertrand.marquis@arm.com>
In-Reply-To: <db0a0b4459630ea00a67d5e985cff3bca73d1c64.1770115301.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 6 Feb 2026 10:16:44 +0100
X-Gm-Features: AZwV_QjXp9DRPui5uG1Nm-KlF1mnWZ8D9-0nik7Tczx6wq6kr7FZbgo1A9ENgkU
Message-ID: <CAHUa44ESzOCDpt-HuXRFOkDDHRxz3LsjQJsxMpNjMv=mzxyj3g@mail.gmail.com>
Subject: Re: [PATCH 01/12] xen/arm: ffa: Add endpoint lookup helper
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,linaro.org:email,linaro.org:dkim,mail.gmail.com:mid];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 01CBBFBEA1
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Direct messaging paths duplicate endpoint validation and RCU domain
> lookup logic across multiple call sites, which makes the checks easy to
> drift and complicates maintenance.
>
> Introduce ffa_endpoint_domain_lookup() to centralize this logic. The
> helper validates the endpoint ID (rejecting ID 0 for the hypervisor),
> performs RCU domain lookup, ensures the domain is live and has an
> initialized FF-A context with a negotiated version, and returns the
> domain locked via RCU.
>
> Switch ffa_msg_send2_vm() to use the helper, replacing its open-coded
> validation sequence. This consolidates approximately 20 lines of
> duplicated checks into a single call.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa.c         | 45 ++++++++++++++++++++++++++++++++++
>  xen/arch/arm/tee/ffa_msg.c     | 24 +++---------------
>  xen/arch/arm/tee/ffa_private.h |  3 +++
>  3 files changed, 51 insertions(+), 21 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index ed18e76080d0..6de2b9f8ac8e 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -433,6 +433,51 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>      return true;
>  }
>
> +/*
> + * Look up a domain by its FF-A endpoint ID and validate it's ready for =
FF-A.
> + * Returns FFA_RET_OK on success with domain locked via RCU.
> + * Caller must call rcu_unlock_domain() when done.
> + *
> + * Validates:
> + * - endpoint_id is not 0 (the hypervisor)
> + * - domain exists and is live
> + * - domain has FF-A context initialized
> + * - domain has negotiated an FF-A version
> + */
> +int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain *=
*d_out,
> +                                   struct ffa_ctx **ctx_out)
> +{
> +    struct domain *d;
> +    struct ffa_ctx *ctx;
> +    int err;
> +
> +    if ( endpoint_id =3D=3D 0 )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    err =3D rcu_lock_live_remote_domain_by_id(endpoint_id - 1, &d);
> +    if ( err )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( !d->arch.tee )
> +    {
> +        rcu_unlock_domain(d);
> +        return FFA_RET_INVALID_PARAMETERS;
> +    }
> +
> +    ctx =3D d->arch.tee;
> +    if ( !ACCESS_ONCE(ctx->guest_vers) )
> +    {
> +        rcu_unlock_domain(d);
> +        return FFA_RET_INVALID_PARAMETERS;
> +    }
> +
> +    *d_out =3D d;
> +    if ( ctx_out )
> +        *ctx_out =3D ctx;
> +
> +    return FFA_RET_OK;
> +}
> +
>  static int ffa_domain_init(struct domain *d)
>  {
>      struct ffa_ctx *ctx;
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index 4e26596461a9..10856fddcbc4 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -161,30 +161,12 @@ static int32_t ffa_msg_send2_vm(uint16_t dst_id, co=
nst void *src_buf,
>      struct ffa_part_msg_rxtx_1_2 *dst_msg;
>      void *rx_buf;
>      size_t rx_size;
> -    int err;
>      int32_t ret;
>
> -    if ( dst_id =3D=3D 0 )
> -        /* FF-A ID 0 is the hypervisor, this is not valid */
> -        return FFA_RET_INVALID_PARAMETERS;
> -
>      /* This is also checking that dest is not src */
> -    err =3D rcu_lock_live_remote_domain_by_id(dst_id - 1, &dst_d);
> -    if ( err )
> -        return FFA_RET_INVALID_PARAMETERS;
> -
> -    if ( dst_d->arch.tee =3D=3D NULL )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock;
> -    }
> -
> -    dst_ctx =3D dst_d->arch.tee;
> -    if ( !ACCESS_ONCE(dst_ctx->guest_vers) )
> -    {
> -        ret =3D FFA_RET_INVALID_PARAMETERS;
> -        goto out_unlock;
> -    }
> +    ret =3D ffa_endpoint_domain_lookup(dst_id, &dst_d, &dst_ctx);
> +    if ( ret )
> +        return ret;
>
>      /* This also checks that destination has set a Rx buffer */
>      ret =3D ffa_rx_acquire(dst_ctx , &rx_buf, &rx_size);
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index 282c105f3bce..cd7ecabc7eff 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -437,6 +437,9 @@ int32_t ffa_partinfo_domain_init(struct domain *d);
>  bool ffa_partinfo_domain_destroy(struct domain *d);
>  void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
>
> +int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain *=
*d_out,
> +                                   struct ffa_ctx **ctx_out);
> +
>  bool ffa_rxtx_spmc_init(void);
>  void ffa_rxtx_spmc_destroy(void);
>  void *ffa_rxtx_spmc_rx_acquire(void);
> --
> 2.50.1 (Apple Git-155)
>

