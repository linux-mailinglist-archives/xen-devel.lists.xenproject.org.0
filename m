Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGAqO9qy6GmIOwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:36:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B8445799
	for <lists+xen-devel@lfdr.de>; Wed, 22 Apr 2026 13:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1290335.1569955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVsw-0006nc-B5; Wed, 22 Apr 2026 11:36:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290335.1569955; Wed, 22 Apr 2026 11:36:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFVsw-0006l4-7k; Wed, 22 Apr 2026 11:36:50 +0000
Received: by outflank-mailman (input) for mailman id 1290335;
 Wed, 22 Apr 2026 11:36:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jens.wiklander@linaro.org>) id 1wFVsu-0006kP-Kv
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:36:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFVss-00F6KO-Fa
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:36:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8b2ce-2eae-0a2a0a5409dd-0a2a450ce240-6
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:36:47 +0200
Received: from [209.85.210.50] (helo=mail-ot1-f50.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jens.wiklander@linaro.org>)
 id 69e8b2ce-62f1-0a2a450c0019-d155d232f121-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:36:47 +0200
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7dbec19732eso4647757a34.3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:36:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Transfer-Encoding:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1776857806; cv=none;
        d=google.com; s=arc-20240605;
        b=JHM5It/r+JWKfEdVOy1eKP10aX4P0qKO+SogNW84yOzg2wAk6AtgCJzpQImpsboQgm
         W0iiGiQkDztS5qXsxcqOJRnvffBQtolsZw0VCTXHSAhb65LPUlLpyZcsLqoFvf1T+Icq
         3LvRDMF+UQIVmUU35L9K/iJ2e5RtWUvWvMo2iyE/XTPe+EU0rWajKvuVp8HAETG5066K
         LI4sr9LUQatC4CBFMKc2p+kvGKAONVUjIVhFUf1aTa9i/5F35L1gj9UMZn5q2SWIRXsM
         B/KgXUkhbxtDOYW/JmJ2sihBXATc0/MDxMHf0KB7STor1VboMeJ+V65THsI8erqxKMUb
         CfQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jEZNxUnk2Oq7Xdr2TCQhDKMYigTcFQmDeD+SVScAU64=;
        fh=wNLC6Hyb5Ukz/ErppBRQBwv8vwa/OMsdh6R8bnNsiPU=;
        b=TB1+fQpe3P0SZZDy8Fp99deSnZWr0EDHtSnhM9ADV4meqS1TRoqLKxkjSLkPOWJt7E
         JcstwWikIWYuMN9bpiExilI7U1nrjAnaBOvtuEStonhai744ymYMGfnthK5KZbq93ZIT
         d+Mk/xhpBN8WCASGN/mjKc/GSnDj6OdHT0tOpK+yZb1jmWPX6a7TuHlr2QL8e57xqulP
         eaSN2bYPWhjRxp3AWU/rA6wX6oxxLEghHTbctmbSLuY6qNsXSHbrXsBhnXbA1WIp79Zu
         JmA7kYq5H8EEEJn9Kk86iB3SRvOdDWluTy1R2GmHqicnd9Jezmcnm/pmlF1Xlv4ifPvz
         IYcQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776857806; x=1777462606; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jEZNxUnk2Oq7Xdr2TCQhDKMYigTcFQmDeD+SVScAU64=;
        b=Vk5fCOzu/M9GZHdP/uBF+3FjHFlnBHHTw7K96XuSWOujpyDhQUyfs02wdz9DJY+zx4
         VKbc/y1dojPgkgvIzokRNo/TovYa3oALm9OpkhUCeKYmwOeTbKqT1+RhRrTC73aqThUq
         MJpa1x0zMrLyA0f+piDDHTL2khbpjr7Zy76rtC3gYYzrFC3Wk1WEyV3+YB+lOXGnO4FA
         ssYHeCWw9oxsybzMf49NiaGzmgyfTpLjF4UFUcZELlWnkkKlC5g5z/REURFZsxAFwaz8
         DxbPwrGFIyEgcy52I5OYF0HMDXPV3NiHZ28TkbZVKuS839w6uGIrWBg0OW22PtVyd4ET
         fNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776857806; x=1777462606;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jEZNxUnk2Oq7Xdr2TCQhDKMYigTcFQmDeD+SVScAU64=;
        b=fKTh8U/IKR6ftDxTerMkF8eWilKRVK4NVpBqDRpbbpS7fpU1jy53Lm/p+mN5PMIII9
         CMFvk+tgf66jd90xA+i7rsZvKEqwYxwQeCPMhScVC6sP8i7XPxI5lMJ8pdOmqhlbFeSp
         IBawbSz2SbE4aBJlWDFyVRlGwvFw4z6I0u4SiMV0kKcu5BYuj6PO/QaLajczNpxnZjut
         S7XDxdFmothDNE8Hg1j7LMBmxMt0Nvzv+E/1JZVSq1FAsgKPUiGNKYI3xYXWsWO7mA0Y
         njIRLvDe69cV9YEJRBUzM+uX3TTTtXTA5UvTRVBMrFraN0NQip7Rxq7GJFuguDqBO8na
         tYkQ==
X-Gm-Message-State: AOJu0YwVj//ZVl2j7TicIbYo7jf4B+tBSCcukZPh4RErjgIMpjDRP4H8
	dxrC2hMu+qVCgLOik8/1978Hxryc+MsPdkiUgTo7QeBfQq/VcpuwQCVU5zC4MF5InrCdy7d44QU
	MMU6RWw21ffUo1tE0h2OrDiiUtcbt7oiLq4lAGTEjfA==
X-Gm-Gg: AeBDiev4LPtYvbpgX6caWUvHG2nWzzb8TL3QQoCG62SzKxudOwi9RcvDI/JJBg1sa0D
	VFl025Uhgbj5lJNQ6wPf8ctr5xJrqWREs/Wjh/VJ6/JyQ3vW6c5PduwDzZ4xw4CyI5GAJxvnPzF
	2PUbicO6Jjjhumbjx1zqTK6j+x7PqdX9GGdZx5eWQ094Ul04IGBLHY83bnWmcESl1zfxmoCph6j
	wuOLaMVnBPrMtq+EnNy2JA9n8LS0OBJSX52uqnWxQbUcPa3eDb4AiJQjU8/xA7acxwECWEwirGp
	G9D+XTGvOKTNYEQJkMC87/G7U3A6eK4ulnT5f3DBfyQ4rTzTl36HE56qKxk=
X-Received: by 2002:a05:6820:2002:b0:694:9a8a:2ce with SMTP id
 006d021491bc7-6949a8a0f5amr3057210eaf.8.1776857806031; Wed, 22 Apr 2026
 04:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1776266307.git.bertrand.marquis@arm.com> <1036add9199c6304eb649854024c74dd0f0192cc.1776266307.git.bertrand.marquis@arm.com>
In-Reply-To: <1036add9199c6304eb649854024c74dd0f0192cc.1776266307.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 22 Apr 2026 13:36:34 +0200
X-Gm-Features: AQROBzAOXCNcY7bb7hC9K-lRPBfgdi3ML2NV-noLI-5or5WRnEjH5_DjKHBVsdk
Message-ID: <CAHUa44FdbLqNRVzjy6Y3qMp5ez9PS-3tY_VjMJMXHRs+=AKVKg@mail.gmail.com>
Subject: Re: [PATCH 3/6] xen/arm: ffa: Tighten notification parameter validation
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-d25034/1776857807-6DF6ACF5-CAA67ECE/0/0
X-purgate-type: clean
X-purgate-size: 6539
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,mail.gmail.com:mid,arm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
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
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 7C5B8445799
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Bertand,

On Fri, Apr 17, 2026 at 3:41=E2=80=AFPM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> The notification handlers still validate overlapping subsets of their
> inputs. BIND, UNBIND, and SET each decode caller and destination IDs
> locally, GET still accepts a non-zero receiver vCPU ID and reserved flag
> bits, and SET still accepts non-zero NS-virtual flags. BIND also treats
> unsupported non-zero flag encodings as a supported-feature failure
> instead of as malformed input.
>
> Add ffa_notif_parse_params() and use it to centralize the common
> caller/destination and non-zero bitmap checks for BIND, UNBIND, and SET.
> Also reject malformed GET and SET requests locally before touching
> cached state or forwarding anything to the SPMC. Keep BIND limited to
> global notifications and reject unsupported non-zero flag encodings with
> INVALID_PARAMETERS.
>
> - add a shared parameter parser for notification caller/destination
>   validation
> - wire BIND and UNBIND through the shared parser and reject unsupported
>   bind flag encodings with INVALID_PARAMETERS
> - reject non-zero receiver vCPU and reserved flag bits in
>   FFA_NOTIFICATION_GET
> - reject non-zero flags in the NS-virtual FFA_NOTIFICATION_SET path
>
> Functional impact: malformed notification requests are rejected
> consistently earlier in the mediator.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/tee/ffa_notif.c | 61 +++++++++++++++++++++++++++++-------
>  1 file changed, 50 insertions(+), 11 deletions(-)
>
> diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
> index d15119409a25..491db3b04df5 100644
> --- a/xen/arch/arm/tee/ffa_notif.c
> +++ b/xen/arch/arm/tee/ffa_notif.c
> @@ -42,21 +42,40 @@ static void inject_notif_pending(struct domain *d)
>                 d);
>  }
>
> +static int32_t ffa_notif_parse_params(uint16_t dom_id, uint16_t caller_i=
d,
> +                                      uint16_t dest_id, uint32_t bitmap_=
lo,
> +                                      uint32_t bitmap_hi)

Nit: I would have picked ffa_notif_validate_params() or
ffa_notif_check_params(), but that might be more a matter of taste.
Anyway, looks good:
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> +{
> +    if ( caller_id !=3D dom_id || dest_id =3D=3D dom_id || !dest_id )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( !bitmap_lo && !bitmap_hi )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    return FFA_RET_OK;
> +}
> +
>  int32_t ffa_handle_notification_bind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t ret;
>      uint32_t src_dst =3D get_user_reg(regs, 1);
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst & GENMASK(15, 0);
> +    uint16_t dest_id =3D src_dst >> 16;
>
> -    if ( (src_dst & GENMASK(15, 0)) !=3D ffa_get_vm_id(d) )
> +    if ( flags )    /* Only global notifications are supported */
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    if ( flags )    /* Only global notifications are supported */
> -        return FFA_RET_DENIED;
> +    ret =3D ffa_notif_parse_params(ctx->ffa_id, caller_id, dest_id, bitm=
ap_lo,
> +                                 bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
>          return ffa_simple_call(FFA_NOTIFICATION_BIND, src_dst, flags,
>                                 bitmap_lo, bitmap_hi);
>
> @@ -66,16 +85,22 @@ int32_t ffa_handle_notification_bind(struct cpu_user_=
regs *regs)
>  int32_t ffa_handle_notification_unbind(struct cpu_user_regs *regs)
>  {
>      struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
> +    int32_t ret;
>      uint32_t src_dst =3D get_user_reg(regs, 1);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst & GENMASK(15, 0);
> +    uint16_t dest_id =3D src_dst >> 16;
>
> -    if ( (src_dst & GENMASK(15, 0)) !=3D ffa_get_vm_id(d) )
> -        return FFA_RET_INVALID_PARAMETERS;
> +    ret =3D ffa_notif_parse_params(ctx->ffa_id, caller_id, dest_id, bitm=
ap_lo,
> +                                 bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( FFA_ID_IS_SECURE(src_dst >> 16) && fw_notif_enabled )
> -        return  ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bit=
map_lo,
> -                                bitmap_hi);
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
> +        return ffa_simple_call(FFA_NOTIFICATION_UNBIND, src_dst, 0, bitm=
ap_lo,
> +                               bitmap_hi);
>
>      return FFA_RET_NOT_SUPPORTED;
>  }
> @@ -142,6 +167,12 @@ void ffa_handle_notification_get(struct cpu_user_reg=
s *regs)
>          return;
>      }
>
> +    if ( recv >> 16 || (flags & GENMASK(31, 4)) )
> +    {
> +        ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
> +        return;
> +    }
> +
>      if ( fw_notif_enabled && (flags & ( FFA_NOTIF_FLAG_BITMAP_SP |
>                                          FFA_NOTIF_FLAG_BITMAP_SPM )) )
>      {
> @@ -204,11 +235,19 @@ int32_t ffa_handle_notification_set(struct cpu_user=
_regs *regs)
>      uint32_t flags =3D get_user_reg(regs, 2);
>      uint32_t bitmap_lo =3D get_user_reg(regs, 3);
>      uint32_t bitmap_hi =3D get_user_reg(regs, 4);
> +    uint16_t caller_id =3D src_dst >> 16;
> +    uint16_t dest_id =3D src_dst & GENMASK(15, 0);
> +    int32_t ret;
> +
> +    ret =3D ffa_notif_parse_params(ffa_get_vm_id(d), caller_id, dest_id,
> +                                 bitmap_lo, bitmap_hi);
> +    if ( ret )
> +        return ret;
>
> -    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +    if ( flags )
>          return FFA_RET_INVALID_PARAMETERS;
>
> -    if ( FFA_ID_IS_SECURE(src_dst & GENMASK(15, 0)) && fw_notif_enabled =
)
> +    if ( FFA_ID_IS_SECURE(dest_id) && fw_notif_enabled )
>          return ffa_simple_call(FFA_NOTIFICATION_SET, src_dst, flags, bit=
map_lo,
>                                 bitmap_hi);
>
> --
> 2.53.0
>

