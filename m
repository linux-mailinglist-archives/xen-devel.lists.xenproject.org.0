Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIUDClXmjWms8QAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:40:21 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2112E554
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229115.1535123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXrT-0001fR-6z; Thu, 12 Feb 2026 14:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229115.1535123; Thu, 12 Feb 2026 14:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXrT-0001dT-3O; Thu, 12 Feb 2026 14:40:07 +0000
Received: by outflank-mailman (input) for mailman id 1229115;
 Thu, 12 Feb 2026 14:40:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXrS-0000kc-54
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:40:06 +0000
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [2607:f8b0:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b824f950-0820-11f1-b162-2bf370ae4941;
 Thu, 12 Feb 2026 15:40:05 +0100 (CET)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-45f0c1f1b54so4803172b6e.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:40:05 -0800 (PST)
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
X-Inumbo-ID: b824f950-0820-11f1-b162-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; t=1770907204; cv=none;
        d=google.com; s=arc-20240605;
        b=JAnDMZnJWpzO7tSt/LiWFa9inaKQdTNw1gPwoA0HbH5Kn0PheVSbFlkRgcJC7X/fvO
         I/DIlgaSvCkSIup7Zz/Trq78h9Q2Ou0P55AVgjxtUgSHl8fs+pm7PHVZOaRXMRs2KpGV
         7rLY6gtFCePN+nuYvQA7y+eJrQqsQUT4+uu+IACEfl6/QQ4OMr649+YeTl74oQOy/Bvr
         LosU073ytw8vsPAYjOByB/ba0VRPuN3kiFSr636Ft3nT9XZwTyf1isd3URtlEKT8+6XG
         gCmIJZuBNLd/CmiGaB3vgYajcl2Ba2iumXk4U1XyheV5Wvg9PceSArXnWVtRDHz4sapA
         CtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yn2zkDk6FP6Yc0FCN+IL9bgNIWDmfWx9UBf0hazkhSM=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=j7PHmZhHdnhWGvy/QQwxAUrEl90bEPl1NbEDyXTfgBdRUjI6HTJqik8dJDIo6GGXUw
         axxdk8JsEeR4Mbhf3nRshBYT56kflQ28qE0dtkh8bpZAzvC7xHWHLYmtFJ+zO/w/1hGB
         pp0gi9QkiZQrq3iUFQn5OGAEbEmlyN9VX3pNZ75ktegpeW9w2p4r3Z6j8sMXb2VfNbii
         jVgKtWgNdyZBTwbrdg7PDXC55Aiz+2StiTSbr2vx00i5hV+dDmX7UoUxJ5T76jz7zNT2
         /uOGl4fFZ6EVW7V3QUukKJ7nXqmjgSBE7brkr6TNbz0+8Rhpl5T+OXSXk02mVX2EnWcS
         Inqg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770907204; x=1771512004; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yn2zkDk6FP6Yc0FCN+IL9bgNIWDmfWx9UBf0hazkhSM=;
        b=VHS1moepifN6nIdK5EYGor5vWKfRGh/cn3Kk5DpSPgGXCR6jpqKRB5tGsWIqRSaBd4
         da6DjBAr1x8AuIRvK7CzWPRCSc8un+REgvDWLzX9+cSCMsuy5urFytFzZNaKeCHBjSW5
         t76GtE0A9IVLlj+wpRFQ5V/ZysRfyYjjp80YZl2GQV2VJzr2Gi2/fPS1Vf442w0USveR
         uFE4XjOQlpeo34mhX9iIjwzxTIgaVsplfUAuZTjfGuHJQenTj+5wJ+s3xmD8H/6g20zT
         v6ZYcDILzdKHEjAdQpN2yqmfe7J1fD3+7MylHFktpf5ln6SsaoI1QL+uXiWwftmgD6cV
         aN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907204; x=1771512004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yn2zkDk6FP6Yc0FCN+IL9bgNIWDmfWx9UBf0hazkhSM=;
        b=peNkndCn5S90rAk+zxobF+HadGVJFOt06RgBG2LWWTt81dg01rS7PnTnzfgzx/Kx9b
         LNyhYCxOfN8PbGlRi6E0cN3V4jbK7UZYOVhyR90f9C2ZuhM1q/1rwH4YBkjuRQvmBxlU
         7ppjf4RVaxZL0kVNU5nr46VrHZGBC1nsdH3fDUk8uQaY50yGHpbuFXLsMfJaowRH030k
         uJknLkhJh/sdEAAjgglvUr79OGv7FjHTZU9OT9Od0Cw8WrNNR8/0/G3w512QYt039+Vk
         BHuEy6x4pdyHnahawnMa9JPE3oQD4qh5I3I4/5YyviptlvpVzMfvJPRRkwcuZGY09cvk
         4btQ==
X-Gm-Message-State: AOJu0YzsgQePKB12yV3I28SgcT1c8Xuv6k5x6b8DKVOQl1WCnRc5hh4A
	gF5BI8PJDFdxu4q+iWfn0Wyt72XWdlYldcdhTUO3jrxykHkcnOfM+DTOEW18TsplfUucyY7qu9G
	BQFieTpRW0YbZUX94EpcnLMaSDSvPl2SbPAnb3guoTA==
X-Gm-Gg: AZuq6aI+e2tizBzQpzRyDi2qhTMiC1IzcPzr3cIjlq/0hJcjuOFWwCcuf5irpLNFrGF
	I4n+9I4L/ihJFNljhgQxFBm6TTcyTUJjChlbhljqJYs2PWbCGXIxULbV5qk8uXfv/m6kbFsY8G3
	yZ8vECvalY+g010B+Z7bmPoXg/Ju9Nn5+YgE76ukq/2Iid6KLJbNXP5UoRu9FTkgeU6AGlw8wl3
	kbYIYxsR9oDa94A0fdSEPnDSqGQg9foiITMYiGpTGff7L8e05gMdNQebuNp46e54MeHDyw4EgeQ
	5aV3aHFDOM5QDIqQGuWXm9m8jcGcKkbjiiogBQ==
X-Received: by 2002:a05:6808:4fc9:b0:45e:a501:750c with SMTP id
 5614622812f47-4637b947270mr1304278b6e.62.1770907203773; Thu, 12 Feb 2026
 06:40:03 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <cbe45740ea22b7d49fbaf45585acc6a8cc8866d8.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <cbe45740ea22b7d49fbaf45585acc6a8cc8866d8.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:39:51 +0100
X-Gm-Features: AZwV_QgI9DMUe8oOKn84WovEZj87WwTVaaQmHE3bYBcWwG5w8FoXjOz2U_773Jc
Message-ID: <CAHUa44E+7ADF1pg1Zq0NimFxrcqN4W9tzFd9pZBUiAbOpm-h7g@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] xen/arm: ffa: Fix RXTX_UNMAP ownership race
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bertrand.marquis@arm.com,m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jens.wiklander@linaro.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89F2112E554
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
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
> Changes since v1:
> - Remove marking rx buffer as free during teardown as it is useless
> - Add a comment when calling rxtx_unmap during teardown to remind code
>   readers that true is for teardown mode
> ---
>  xen/arch/arm/tee/ffa_rxtx.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
> index eff95a7955d7..c4fc4c4934af 100644
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
> @@ -234,6 +234,32 @@ static int32_t rxtx_unmap(struct domain *d)
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
> +            }
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
> @@ -261,7 +287,7 @@ err_unlock_rxtx:
>
>  int32_t ffa_handle_rxtx_unmap(void)
>  {
> -    return rxtx_unmap(current->domain);
> +    return rxtx_unmap(current->domain, false);
>  }
>
>  int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size=
)
> @@ -369,7 +395,7 @@ int32_t ffa_rxtx_domain_init(struct domain *d)
>
>  void ffa_rxtx_domain_destroy(struct domain *d)
>  {
> -    rxtx_unmap(d);
> +    rxtx_unmap(d, true /* teardown */);
>  }
>
>  void *ffa_rxtx_spmc_rx_acquire(void)
> --
> 2.52.0
>

