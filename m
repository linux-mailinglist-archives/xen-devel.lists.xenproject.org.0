Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMFEKk0yjGkAjAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:39:57 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E16F121EAB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 08:39:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227003.1533342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4ou-0003qv-Lz; Wed, 11 Feb 2026 07:39:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227003.1533342; Wed, 11 Feb 2026 07:39:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq4ou-0003pB-J5; Wed, 11 Feb 2026 07:39:32 +0000
Received: by outflank-mailman (input) for mailman id 1227003;
 Wed, 11 Feb 2026 07:39:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wgMA=AP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vq4ot-0003p5-I4
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 07:39:31 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca078ed7-071c-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 08:39:26 +0100 (CET)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-409470ad5bbso1905260fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 23:39:26 -0800 (PST)
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
X-Inumbo-ID: ca078ed7-071c-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770795565; cv=none;
        d=google.com; s=arc-20240605;
        b=k9oFJOJoMBPglYv+4KoKVActD2cegbVonONPDbdz6vibdWxNG6b1lLoZ92bIT1T7D+
         pAdNaxSYvcFLZccOT46L+F8VWEBn0MNI0REaFuRzT1S3yo7Vy24NwCVTdxL+BZb1IlDS
         rYwzYDNZ1qK/6G/TfUYqMOXSLT5y+kDYH8/IGMbxL7vv2Uf4WxpCxi707GN3NSGNvnnp
         LiWnz6y+xuiCUOdeWldHrlH8KJ/mIR7AwOyZe6SpKnFsNiCmGdBdzj/BZIrG9VEoYzCD
         a0GqhbWdRg5Noxo0/DkoWP2QLYLj2w3epYmRO7Ofh+4Z+W19dNJ+ROK4UWadVoQrTMjM
         ftNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAOqMCJadlogczB7gZP3FZlkdp68ySmqKKAKzRWZ3Cc=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=YBbgRt7eBuHNstkVihPyQVPQKiexGSUyxbH09fqcJ7vcroOown3TOVTqo45YCGc63i
         0QfBls2xqCopOWPOlJp35DfB8rWrday2gYUKZQdrtpVoRjcPK+VMw8QXvlEvmZpccrK1
         y9Nqgd9Q+HPEW/c9g1MTi1mtstsZSTX8sp3iE3D4YBPfKRu8WJhMuF0BZDvxhDYi9Y/V
         g0GAh1QwQtxT5k+d5OxT7jMmutifkScLIm+Xv6+ry97h+YEbiIFgC14tHm81octGzu4M
         tinYWPZ0krM0PnOEsGXwVqSztw1TDycm3odBanp6hCL2n57HzindrvwSlls+BJxYOMmr
         I4vA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770795565; x=1771400365; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAOqMCJadlogczB7gZP3FZlkdp68ySmqKKAKzRWZ3Cc=;
        b=DlbqmdKIhdhAAM5/tgsVP264+9YQI3BcpNt3Y0I59yTyyNwcVBGy0t8/mVZwa5oRbA
         yeArjcmAbX+Y09UAdhuts7P+xg7AxHE+AZbJd/Ik8krfbAxbh++OI8GI5hEeJZfnbJT0
         3gLt84fQ2I4uNvvaC6h6QOQ/n7D4dNo4Qp8kDARdZ7oiKpCVzaHzwZONN4DOMNb1D3/J
         NhL312d9v8unI0ptBJagBQZGOgN/H1mW55MmvX3iHeuvX4guv2bfEJsKy1yfCV2eqCnt
         aKAZYeo/f1zl5OxeOCC9WO2EKbGhUJPOWTg6/WXw7AwN1+M+euZdkHcKIkUjf7ng5G0G
         LwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770795565; x=1771400365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hAOqMCJadlogczB7gZP3FZlkdp68ySmqKKAKzRWZ3Cc=;
        b=jiJVrTczYlPrNy5MCmETZt2ZGV4isx4EwmvMjgn9a7vQYS2Md+hPV6MuUJpnsP0hBK
         2lIYJlKbKJ4YZiuvBtYFVqyEZmw7/C65QM6zZmvTYTm6i5JwSteXsXNREOy4j28nJlon
         KDTKNgv8LzeCpPsH0/5TaXuPnQQ/+I+xkGDKAVcr7aMILgBc/ILqL4I/l8Nb6hOaeQCm
         AGj1Otq+RdXzmQUKBS1WGkEsgKm90PDJYRWvMSmicRaRTEnGWu7+eW6gAqGLmBi4WYo5
         u5P6oKMMQY3kBdMHfcZM6BXtqVLHkMWszEPjmKQWH+YO58k8C+2cgOH2Fufn/ytlbH6j
         OK+w==
X-Gm-Message-State: AOJu0YzLhRj0aYzoDOI8AiOkKPkZVMxA8HbUv8D7T/NwkIvo1S0KqCXH
	KT5HMdeeoG2Y2AOT411hjlY01N4sCLKAknJ36S1J5c/jJUn7BmowWvYSk7V0jfJsAvvKuezUQzY
	ePti/TBlA0pegBuqXJyjxhIJPViBj5tD0mmSwgxaEf3J8huLZ7MmJ3MI=
X-Gm-Gg: AZuq6aIDS+gzEDrD8AgnU9NHpDDF925Di0yAJRuqFcf1I68XblpLJ09kwkyKfKht6kB
	i3CM28RzYk3ZwXkhaCFTs3RdacuxYQCigpSwPegDpKQ6jFRqskPSx9vz3sdFC1oh847wOlb8IlA
	G8LCACgxnsfQ1zuEvDM+Vw/oyFpnUFs/YE8B6Wu9Hk/nZnrUsMylsURF+bz5PwmGShreNHcULMy
	sLxnW1hpTBbTzEjoDLHwY0Gl20QbrplWxhxZ8UeJ5d3Qt4DlWEevzsOZjlUas4GqVB0oKkMF1XS
	OGbgclgcYUtKiWArlEGkn6drWwAmL6Lz/wrjHg==
X-Received: by 2002:a05:6870:e391:b0:3d9:5ec5:9168 with SMTP id
 586e51a60fabf-40ea937d68dmr1017618fac.1.1770795564849; Tue, 10 Feb 2026
 23:39:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770115301.git.bertrand.marquis@arm.com> <971bf27b9a2cafa0ed405a638a532b6fbbf51142.1770115302.git.bertrand.marquis@arm.com>
In-Reply-To: <971bf27b9a2cafa0ed405a638a532b6fbbf51142.1770115302.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 11 Feb 2026 08:39:13 +0100
X-Gm-Features: AZwV_QgDQKCi4OiQx0XmIgx2lycCVB8uWIjtbZ7LzBFjf_W0JhSSJjhf9apn2f4
Message-ID: <CAHUa44F9sSzTV-X9tKDffk9vWfT9=KZGmqp3EiR0rEo1nwd7Pg@mail.gmail.com>
Subject: Re: [PATCH 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,mail.gmail.com:mid];
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
X-Rspamd-Queue-Id: 1E16F121EAB
X-Rspamd-Action: no action

Hi Bertrand,

On Tue, Feb 3, 2026 at 6:38=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> rxtx_unmap() checks RX ownership without holding the RX/TX locks and
> only enforces the ownership rule when FFA_RX_ACQUIRE is supported. This
> allows a vCPU to acquire RX between the check and unmap, and it lets
> RXTX_UNMAP proceed while RX is owned when buffers are not forwarded to
> firmware.
>
> Hold rx_lock/tx_lock across the ownership check and unmap, and deny
> RXTX_UNMAP whenever RX is owned, independent of RX_ACQUIRE support. For
> teardown, release RX ownership under the same lock window; use
> FFA_RX_RELEASE directly because rx_lock is held, and clear the local
> flag when the firmware path is unavailable.
>
> Functional impact: RXTX_UNMAP now reliably returns DENIED while RX is
> owned, and teardown releases/clears ownership without a race.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_rxtx.c | 36 +++++++++++++++++++++++++++++++++---
>  1 file changed, 33 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index eff95a7955d7..450ce102cbdc 100644
> --- a/xen/arch/arm/tee/ffa_rxtx.c
> +++ b/xen/arch/arm/tee/ffa_rxtx.c
> @@ -220,7 +220,7 @@ err_unlock_rxtx:
>      return ret;
>  }
>
> -static int32_t rxtx_unmap(struct domain *d)
> +static int32_t rxtx_unmap(struct domain *d, bool teardown)
>  {
>      struct ffa_ctx *ctx =3D d->arch.tee;
>      int32_t ret =3D FFA_RET_OK;
> @@ -234,6 +234,36 @@ static int32_t rxtx_unmap(struct domain *d)
>          goto err_unlock_rxtx;
>      }
>
> +    if ( !ctx->rx_is_free )
> +    {
> +        if ( teardown )
> +        {
> +            if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
> +            {
> +                int32_t rel_ret;
> +
> +                /* Can't use ffa_rx_release() while holding rx_lock. */
> +                rel_ret =3D ffa_simple_call(FFA_RX_RELEASE, ctx->ffa_id,
> +                                          0, 0, 0);
> +                if ( rel_ret )
> +                    gdprintk(XENLOG_DEBUG,
> +                             "ffa: RX release during teardown failed: %d=
\n",
> +                             rel_ret);
> +                else
> +                    ctx->rx_is_free =3D true;

I don't see why this assignment is needed, or the one just below.

> +            }
> +            else
> +                ctx->rx_is_free =3D true;
> +        }
> +        else
> +        {
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: RXTX_UNMAP denied, RX buffer owned by VM\n");
> +            ret =3D FFA_RET_DENIED;
> +            goto err_unlock_rxtx;
> +        }
> +    }
> +
>      if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
>      {
>          ret =3D ffa_rxtx_unmap(ffa_get_vm_id(d));
> @@ -261,7 +291,7 @@ err_unlock_rxtx:
>
>  int32_t ffa_handle_rxtx_unmap(void)
>  {
> -    return rxtx_unmap(current->domain);
> +    return rxtx_unmap(current->domain, false);
>  }
>
>  int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size=
)
> @@ -369,7 +399,7 @@ int32_t ffa_rxtx_domain_init(struct domain *d)
>
>  void ffa_rxtx_domain_destroy(struct domain *d)
>  {
> -    rxtx_unmap(d);
> +    rxtx_unmap(d, true);

How about adding a /* teardown */ just after true as a reminder of
what true is supposed to represent.

Adding such comments isn't very common, but we're doing it at a few
places in the source tree, and I think it helps when reading the code.

Cheers,
Jens

>  }
>
>  void *ffa_rxtx_spmc_rx_acquire(void)
> --
> 2.50.1 (Apple Git-155)
>

