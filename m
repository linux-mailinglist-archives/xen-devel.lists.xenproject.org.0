Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFg4FJznjWkm8gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:45:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B338612E72C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Feb 2026 15:45:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1229137.1535142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXwe-0002ql-Vd; Thu, 12 Feb 2026 14:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1229137.1535142; Thu, 12 Feb 2026 14:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqXwe-0002oA-Sy; Thu, 12 Feb 2026 14:45:28 +0000
Received: by outflank-mailman (input) for mailman id 1229137;
 Thu, 12 Feb 2026 14:45:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Yal/=AQ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vqXwd-0002nh-Ix
 for xen-devel@lists.xenproject.org; Thu, 12 Feb 2026 14:45:27 +0000
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [2001:4860:4864:20::31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 770de5e7-0821-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Feb 2026 15:45:25 +0100 (CET)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-40970f97638so1884208fac.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 06:45:25 -0800 (PST)
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
X-Inumbo-ID: 770de5e7-0821-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770907524; cv=none;
        d=google.com; s=arc-20240605;
        b=Czp0WyfHA6in3WWXojMyRKkYHF8LoiSPWqbKSCWe4/yRQTzHE7ttyTXZxHBFoIJHxx
         V5YBViXkzU/axc5Q1tUO8Pa41evS4F+Av91yzcjVWWI5AXhzOUH9HVZd4RzaVH1n50My
         hwcLmMQ6Xw4mqhCG5GKPJf1Fo3OABOw6NnXWAUmff8XzpwuR3q6ZoCtu7JuaY227AgfB
         S63WIMzZwmvDtgwhNiByxRUBqRharfR5t+0K+o3umCC+xxCwA1eeVCuzH1woZvslPQPY
         fbQv9M4H+mKlQfp8hOGpq8mT5d787hwqktNBntDzJklRqXSj+fNrrEk3ZCVXanMFOb2i
         uN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g1SdNkbfBqxDqNzv7rl3msqZw+ALt97QHJL2xmSJB4s=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=Om78r335v3nhE7ZRs3gVM/S4mAzDFSahQv0+s+aql4ztfo+eop1jZWmEmhMdkgXMWn
         tkdKuKkGTa2RVD8i6EEVUsW736gKF408ulyRLQsbG/mI/1Be/B5SBqRfQYqOs0luR36S
         t27N3UL3ZJMg15S7+sH1XcnaB59BhydeYltVYKZjpGDJenxSxA7zT85q0ENE6c/ybCCq
         V0ZQKWefcCSiUrzbDGFlu2KJN/iGqTiBrFb/M0SHHYhVBRc7wh5YR5hAWodlsi6rRsAs
         yQjbIjzK1V8vN/cBS67iZLtxrxNFe4IxwrELyAvD9oWv2mFWWygeXOCXmC0zJMlLkf9A
         8ifw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770907524; x=1771512324; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1SdNkbfBqxDqNzv7rl3msqZw+ALt97QHJL2xmSJB4s=;
        b=qw9zHejEJ6Cnw7cc/mGJOrh3lnf+nxg+MSP/9wa9kbUyKus8Zrq02UY0hzBcNEMKdY
         BtQdWTvSSoWN3DpvsCKO/5YDmDtoGNXCI3sO5NN9a42ll7raNPZ7Y7E99KOuG7l9popA
         kMhrGtgKk+S/+wOzsbl8FLKWcBolt+OZyrrwZvCThpTnTYERU9zhQgub4qtVQDi0eNJa
         9JqVpdCGI+HfrT2IvNBygNTIekpKN8X5Mwmn66bfEQ2vvscaiAH7vLBKFmOwvZOv3h11
         f2s84H4bAZ+nkF+znT4m1WVwLcnERBGFq9eKbLaXhgWkWR3N9n6GU2yibW6mQ2pHDDMo
         gd0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770907524; x=1771512324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g1SdNkbfBqxDqNzv7rl3msqZw+ALt97QHJL2xmSJB4s=;
        b=KuyonAEHwnapLelAwH948lghw/Gb6AJuJGotMm/i0i1Vts+a1YKK33QEJGziVBVU00
         FgX60kMFCrAnu83HLlhtRl+3U8TZryqRbadC2GBlJsmfNpLPl6o3yCjobawL7SmtfFkK
         JNLrS+zDGC00mYlOXsldOrkOwlx/eMxj+ttyRu5qka3bPPIVwPjqbLm8RjBUgtn3SuTr
         YuZtjX404LojrFqSFY1NoWRIiT9QkT915jWRfogxM0Mm6uM+Ka7L9dHESf//+mC8k4y9
         ohQcsxVQPuAuZfTlgbyoon8Khj7qHnNC0awkC9QRxLaQM2qXfeLW7v6DpvCTAGGAxTQc
         ky2g==
X-Gm-Message-State: AOJu0YwOqM4poSt0JaMMUosVGp+irz8r31BWIQSCxsDykOurdW666obV
	Pk/OnBpfOveN1PbURn5xjjaIRx4R3QY2hsvq3dI+ulM8de5+c8onEJC9K4sdT61J3DVQRGU1o6X
	JzIghd1tkaeQXEwSmo07lDo9POh0TSuh9pX1N3JJtsA==
X-Gm-Gg: AZuq6aK4kbvdjybnj0jzL1KWTBvZczk29Z0NfynFuji0dFAx+5ORkgz+T+sklDLBYX7
	jAxoyBuaqUgxqiR+NIS/hVgcWEYpLKS06oRyDEVYRa0zLpqcoBIwZaVYhR9pWJXyoY4k4qf0qjF
	74G08CugIot+Me7QWlpvSxf1IFwbwfIMy4I05oePWoXyPVuRgGa/u4azyJtPNy85ZiX8Fq9t9DG
	eEbLJR2Z7CR66X8tIG6HV6lsFAho4bfb9MMAbCK5qWxvKGZrjedv70FpRPcKX2HN6v5oP7zT/aE
	UrnYv68Sy/PJi09io264IB4IifdbokeLn4TgbA==
X-Received: by 2002:a05:6870:3288:b0:409:bd2b:91a3 with SMTP id
 586e51a60fabf-40eca1fd9f0mr1255487fac.32.1770907524234; Thu, 12 Feb 2026
 06:45:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770826406.git.bertrand.marquis@arm.com> <4fa6736cbe35b060cf34b2978bbf9b3481d9266a.1770826406.git.bertrand.marquis@arm.com>
In-Reply-To: <4fa6736cbe35b060cf34b2978bbf9b3481d9266a.1770826406.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 12 Feb 2026 15:45:12 +0100
X-Gm-Features: AZwV_QgOut5rCLJNUhhFg5tR5m71EHGai87vMWyWZN1fOx7VKE5YuNQZWPVD29o
Message-ID: <CAHUa44F5-XQKc2TBH=KbOPXcpv_w_hm3CwHR-o0=ROQ9Upj5nw@mail.gmail.com>
Subject: Re: [PATCH v2 11/12] xen/arm: ffa: Add MEM_SHARE page diagnostics
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
X-Rspamd-Queue-Id: B338612E72C
X-Rspamd-Action: no action

Hi Bertrand,

On Wed, Feb 11, 2026 at 6:16=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> MEM_SHARE failures in get_shm_pages() are silent, which makes malformed
> ranges and page mapping failures hard to diagnose.
>
> Add debug logging for page validation failures:
> - descriptor validation failures (unaligned, range short/overflow)
> - per-page mapping failures (unmapped GFN, wrong p2m type)
> - address overflow detection in range walks
>
> Ratelimit temporary reclaim failures and log permanent reclaim failures
> as errors.
>
> No functional changes.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes since v1:
> - use one print per error case instead of the previous system using
>   variables to classify and a single print site.
> ---
>  xen/arch/arm/tee/ffa_shm.c | 39 +++++++++++++++++++++++++++++++++++---
>  1 file changed, 36 insertions(+), 3 deletions(-)

Looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
> index 070babce9627..3d61caaeba78 100644
> --- a/xen/arch/arm/tee/ffa_shm.c
> +++ b/xen/arch/arm/tee/ffa_shm.c
> @@ -161,32 +161,62 @@ static int32_t get_shm_pages(struct domain *d, stru=
ct ffa_shm_mem *shm,
>          addr =3D ACCESS_ONCE(range[n].address);
>
>          if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
> +        {
> +            gdprintk(XENLOG_DEBUG,
> +                     "ffa: mem share pages invalid: unaligned range %u a=
ddress %#lx\n",
> +                     n, (unsigned long)addr);
>              return FFA_RET_INVALID_PARAMETERS;
> +        }
>
>          for ( m =3D 0; m < page_count; m++ )
>          {
>              if ( pg_idx >=3D shm->page_count )
> +            {
> +                gdprintk(XENLOG_DEBUG,
> +                         "ffa: mem share pages invalid: range overflow r=
g %u pg %u\n",
> +                         n, m);
>                  return FFA_RET_INVALID_PARAMETERS;
> +            }
>
>              if ( !ffa_safe_addr_add(addr, m) )
> +            {
> +                gdprintk(XENLOG_DEBUG,
> +                         "ffa: mem share pages invalid: addr overflow rg=
 %u pg %u base %#lx\n",
> +                         n, m, (unsigned long)addr);
>                  return FFA_RET_INVALID_PARAMETERS;
> +            }
>
>              gaddr =3D addr + m * FFA_PAGE_SIZE;
>              gfn =3D gaddr_to_gfn(gaddr);
>              shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn_x(gfn), &t,
>                                                    P2M_ALLOC);
>              if ( !shm->pages[pg_idx] )
> +            {
> +                gdprintk(XENLOG_DEBUG,
> +                         "ffa: mem share pages invalid: gfn unmapped rg =
%u pg %u addr %#lx\n",
> +                         n, m, (unsigned long)gaddr);
>                  return FFA_RET_DENIED;
> +            }
>              /* Only normal RW RAM for now */
>              if ( t !=3D p2m_ram_rw )
> +            {
> +                gdprintk(XENLOG_DEBUG,
> +                         "ffa: mem share pages invalid: p2m type %u rg %=
u pg %u addr %#lx\n",
> +                         t, n, m, (unsigned long)gaddr);
>                  return FFA_RET_DENIED;
> +            }
>              pg_idx++;
>          }
>      }
>
>      /* The ranges must add up */
>      if ( pg_idx < shm->page_count )
> +    {
> +        gdprintk(XENLOG_DEBUG,
> +                 "ffa: mem share pages invalid: range short pg %u\n",
> +                 pg_idx);
>          return FFA_RET_INVALID_PARAMETERS;
> +    }
>
>      return FFA_RET_OK;
>  }
> @@ -741,8 +771,10 @@ bool ffa_shm_domain_destroy(struct domain *d)
>               * A temporary error that may get resolved a bit later, it's
>               * worth retrying.
>               */
> -            printk(XENLOG_G_INFO "%pd: ffa: Failed to reclaim handle %#l=
x : %d\n",
> -                   d, shm->handle, res);
> +            if ( printk_ratelimit() )
> +                printk(XENLOG_G_WARNING
> +                       "%pd: ffa: Failed to reclaim handle %#lx : %d\n",
> +                       d, shm->handle, res);
>              break; /* We will retry later */
>          default:
>              /*
> @@ -754,7 +786,8 @@ bool ffa_shm_domain_destroy(struct domain *d)
>               * FFA_RET_NO_MEMORY might be a temporary error as it it cou=
ld
>               * succeed if retried later, but treat it as permanent for n=
ow.
>               */
> -            printk(XENLOG_G_INFO "%pd: ffa: Permanent failure to reclaim=
 handle %#lx : %d\n",
> +            printk(XENLOG_G_ERR
> +                   "%pd: ffa: Permanent failure to reclaim handle %#lx :=
 %d\n",
>                     d, shm->handle, res);
>
>              /*
> --
> 2.52.0
>

