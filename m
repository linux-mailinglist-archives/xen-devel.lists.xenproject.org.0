Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6wmiBtM9jGm7jwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:29:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BB71223CD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227057.1533382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5aI-0003vc-Kf; Wed, 11 Feb 2026 08:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227057.1533382; Wed, 11 Feb 2026 08:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5aI-0003uB-Hd; Wed, 11 Feb 2026 08:28:30 +0000
Received: by outflank-mailman (input) for mailman id 1227057;
 Wed, 11 Feb 2026 08:28:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uigq=AP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vq5aG-0003u2-MR
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:28:28 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2fb0ea1-0723-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 09:28:26 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-59e4993e00aso1689064e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:28:26 -0800 (PST)
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
X-Inumbo-ID: a2fb0ea1-0723-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770798506; cv=none;
        d=google.com; s=arc-20240605;
        b=AF2k+Bf+gIUR4wKc7/EFRRYrmKIR/zAyMJwzAMVfzPabYQIC/aEx0fSBw1WmeMsKO1
         NA2EWaJAMLWeKVVBcCmS53DXoBheNJNaJBSDyCFeOrJ4Dimfmthtw/UvmfC5ADx9VNVr
         QkHcO9VaV4mqVdd/WhVQBoiivjgMndCroVB5/rPThRxPaBLakJEbIiUpnZqx4c3DbEuA
         XWve6fs8BmsqPou2Gm8oGSfF/iZL87U/I2xi19QZ9E1MO6GTtkBmdnxQ0srfIn4qCu+k
         tn3iUbgeaYpm9NuDfVGN8MpzF41fWelHRmt9E9mxWK9qgUM0ZOFIHcuQr66+fi3Thf+U
         e9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0mCF6gCW7FxARpUXdySi7kBsVPBEEF/j/OX0R90cB4=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=OlQMf+d01fl8Zramr3kxc5cSxDbNpuQ2vhM4/t20Y9J5blONBzwhvTi1Fksr6tvxj8
         nXV3Irfnbtum2sXMSgqWL7OMpZRmic2/p42XXqQEOmZvd2oz94LRsObsP7OlkTy34da5
         xeEc3w6Osgck0PM/Wy3FnXqLkFQRsnPRL18t6bq8UduDnYt+PfK2ZfaD3E52/JpmkOXR
         5xiqj2LvMAJ7TN7YRJfuqZWDXsyjmo6KTTe48WazqVYdui18akltb+/D1Jvv25EaglMM
         o9BYalCp4RdLK9/QhsEq0X7JIusWWHEbKTRSD1fItxeJro2ZBFvZhZDazNEFTMLrTvwT
         Q1TA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798506; x=1771403306; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0mCF6gCW7FxARpUXdySi7kBsVPBEEF/j/OX0R90cB4=;
        b=a7FCUGGOBHnbMfUS9CbiVF3JdGrJWGcYdUtyKxLPTKffK9ZSZCgy0UZGPgksgv6r5H
         KL/V2GUU9R8vpTzJXKgpAW6SDovLqbZ1brBFYBr4gNDnXm4HO296xh0S578xq+P20SNZ
         CDiSU15F/QG8nWBdL8dWkd3MQMbxbKKfdKRiSjZBcILBFvB9pqGWSZNVYtAGk2X9fAKR
         9vJXAO9oZANordZe3Nk6FgYOrxWKdwoT8wNzPdY4QKFngV9n3i0jaG4KA5pK2kCInnRQ
         5b4zfZTA8QxL+VcbtlNvhNzaCuiKIqeQeOuTddvxHrTXlOerVO8H4+SVC0YTyEQw+2Uy
         CNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798506; x=1771403306;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G0mCF6gCW7FxARpUXdySi7kBsVPBEEF/j/OX0R90cB4=;
        b=bQe8kfngG9HsTzh+IN25fYUnMJkWWNNnkDjSJZvQjbPJA32zWrY/R59Lht2kTkYMPM
         8yh2GBPPzYulBeqjm0VL3jOqu2765qz5/HrBwCAliOKOYgdlJnnA/ZgDJ7OK8Dnk8nhD
         +daAVL3mHrI1PVuBnZyZ5WlYj+fMrxSjJpsIREhj+xNusXZ7/Ml3p2JIGztiH6zQ8nwS
         mrrhlkTTBWUnEiSy+XPY1kOE1SDV3ND77jdcV9H2+QaE1QQ5SY9JylIdgx+d7c2sSC8H
         l+oUlkh4mYzEfgn7izjRA+JVzt1VpyPKr4FvswPL81TIde0A0D+GfFKPW6kjgS4/2iUB
         c5tw==
X-Gm-Message-State: AOJu0Yx0bODncE5wk2MMLiPSdL3YMx3lgkYXYtnpmqlhTFOS+hFnTpeM
	MUdKFgYRpiFeYUQljyU7M6LBvJMy3ZLuKgF1IXLHMMhy0is5DEuNj6fb5/jwkWpzSoSHchDcfJt
	SprMrOuVsFzc9iIDmSZOJgmeWv6EjNYM=
X-Gm-Gg: AZuq6aLqbLHCR4rP7mnx0ipZ9CVIdDK7G1kWNtOp8LO5a14eI1lplTss3r5BBc0HUIK
	7kRTioE1VBopyr0x+BNJat5Y+Eran3OvvIyORV8uqvWOzz6ErJb51HlEDqThxyRdCdankVZspPp
	b684ARbysOpyZvj3l4VoPFfkQtfSZVsYbdQTqflr4l5jcgkRU7+6mmUxVPEYT5Zv8JbfVTi2U6B
	tQ9zLR5d77sU/TLziHwEUQa74J680IhFstA2EAZ3kSCcVm1TewGb1vFvgIaM6v4yg/rxZ8VlpeX
	G/l+
X-Received: by 2002:a05:6512:618b:b0:59e:407a:c8f7 with SMTP id
 2adb3069b0e04-59e45152d3fmr4858710e87.29.1770798505657; Wed, 11 Feb 2026
 00:28:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <21505d8f47bdabbf0f8e534eed937c5bf0a4ce02.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <21505d8f47bdabbf0f8e534eed937c5bf0a4ce02.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 11 Feb 2026 10:28:13 +0200
X-Gm-Features: AZwV_Qhf7Sk-3veq8pb7JP-KVFkxMtvofOqfn2KXzQJMJwrtBJMhdzS7avXhXbY
Message-ID: <CAGeoDV84Ys0Tqe8DGv7zC3-ExLZYqcBDkdVxEjNBUmQfDE+hYQ@mail.gmail.com>
Subject: Re: [RFC PATCH 01/19] arm/gicv4 add management structure definitions
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Mykyta_Poturai@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 90BB71223CD
X-Rspamd-Action: no action

Hi Mykyta

Thank you for the contribution.

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Add GICv4 specific structures to be used in later patches.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/vgic.h | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/v=
gic.h
> index 6f9ab1c98c..a874a02d70 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -127,6 +127,42 @@ struct vgic_irq_rank {
>      uint8_t vcpu[32];
>  };
>
> +#ifdef CONFIG_GICV4
> +struct its_vm {
> +    struct its_vpe **vpes;
> +    /* Number of VPE. */
> +    unsigned int nr_vpes;
> +    uint32_t *db_lpi_bases;
> +    unsigned int nr_db_lpis;
> +    /* Property table per VM. */
> +    void *vproptable;
> +};
> +
> +struct its_vpe {
> +    rwlock_t lock;
> +    uint32_t vpe_id;
> +    /* Pending table per VCPU. */
> +    void *vpendtable;
> +    uint32_t vpe_db_lpi;
> +    struct its_vm *its_vm;
> +    unsigned int col_idx;
> +    bool resident;
> +    /* Pending VLPIs on schedule out? */
> +    bool            pending_last;
> +    struct {
> +        /* Implementation Defined Area Invalid */
> +        bool idai;
> +        /* VPE proxy mapping */
> +        int vpe_proxy_event;
> +    };
> +    /*
> +     * Ensure mutual exclusion between affinity setting of the vPE
> +     * and vLPI operations using vpe->col_idx.
> +     */
> +    spinlock_t vpe_lock;
> +};
> +#endif
> +
>  struct vgic_dist {
>      /* Version of the vGIC */
>      enum gic_version version;
> @@ -193,6 +229,10 @@ struct vgic_dist {
>       */
>      bool rdists_enabled;                /* Is any redistributor enabled?=
 */
>      bool has_its;
> +#ifdef CONFIG_GICV4
> +    struct its_vm *its_vm;
> +#endif
> +    bool nassgireq;

nit: unused in this series


Best regards,
Mykola


>  #endif
>  };
>
> @@ -227,6 +267,9 @@ struct vgic_cpu {
>  #define VGIC_V3_RDIST_LAST      (1 << 0)        /* last vCPU of the rdis=
t */
>  #define VGIC_V3_LPIS_ENABLED    (1 << 1)
>      uint8_t flags;
> +#ifdef CONFIG_GICV4
> +    struct its_vpe *its_vpe;
> +#endif
>  };
>
>  struct sgi_target {
> --
> 2.51.2

