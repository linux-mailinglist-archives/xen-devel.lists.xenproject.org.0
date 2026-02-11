Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GuzAtM9jGlyjwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:29:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1A41223CC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 09:29:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227059.1533391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5aU-0004Dh-Sv; Wed, 11 Feb 2026 08:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227059.1533391; Wed, 11 Feb 2026 08:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vq5aU-0004Ar-Pz; Wed, 11 Feb 2026 08:28:42 +0000
Received: by outflank-mailman (input) for mailman id 1227059;
 Wed, 11 Feb 2026 08:28:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uigq=AP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vq5aS-0003u2-Sm
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 08:28:40 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa8b7ab3-0723-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 09:28:39 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-382fb275271so49974221fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Feb 2026 00:28:39 -0800 (PST)
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
X-Inumbo-ID: aa8b7ab3-0723-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; t=1770798519; cv=none;
        d=google.com; s=arc-20240605;
        b=TWs30vC+irwc/h5ktAMjtaUWmcnvpltlT5FMGKCs15pWvZZ7qQf6iZn7J1tm/Syn0O
         WsA964epO3kKHPexhx4GgPh1ZKAZHsbA7M2wgJVuXXneate4pSXqN6qWKzlvGag7lsg4
         wp2DWMr+VZMt2faLJVfjvWSTt7cYAfdf8GuxxaKhMuJOYHZqFe30GgPig21Fkj/gbPrO
         4vYVzW0H9LYknz5++MciLLVsYym6RkZTXkXEhA8rBHOipEGsixi0ax5R7foma8RiPjRq
         BZ1xHY2eE+LQLHXD2O4gCuTLCJdliyHZ2BYjs5vR0r7k8/kj2bafqnD/NCuIrWi3c8VX
         8gAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y5P0pA5ww1oZkDFmE53oeDu5lMmJYN+rkyRE56YrgrU=;
        fh=S1TgsMYO/ju21WOcmYTQxMlAU8ImCjuw50drwKkfBt8=;
        b=anHjhAAnguwcP/ro60uY0YvCWFEnh1ggmBXpxumQlxPWrpF7hDmp4PRc3b9BVAa20a
         +eZVB9sZH0Wy0UcuPcM0CVVao9L3NBpwKkjrwslfTTW+lYu/by6rsxEVSVREj8K98EEo
         iW8jLSjGuvJQ3rQMLaop94AA51GCa1a46axuZTsW25kSSoebvacEzSyzXUODZw4tgX4T
         +fQWPx7+KwkGlHjcG4hzYbGD/0yEo9/YFwKKHMrTISR4RVUnOSKew5FhD1WVbh+rh9DX
         9AowRuIgZmV1m2R66gwyQ8Wmkd96SDtONAITI6xXFNmVNneIXJLHbyUwAGmPVyPvl0hU
         JAdQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770798519; x=1771403319; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y5P0pA5ww1oZkDFmE53oeDu5lMmJYN+rkyRE56YrgrU=;
        b=ZAbE7DiE1884uRwsrKiRtvqnoKy6YGJKrCj6AwbojoLFQPDoE5c9J3be6/mViwdBP+
         YHYNkEPoIuYAldBl/SItWkE3xukf/C7L0oDTdhlcy30uQazHBdBPU0tfoMixjVShB4zH
         jptXFx0HyFf2hEY1GaVrJqJk+robi7Mc6GzX5wicOCHXhi6qMNC9UuNv1ePAUPUygp/9
         fNyYxDzy2gRugLDe6lUTHsVr7pMnJj1OzoZTFaRhmP5rhIlXfHAnuxQI4AOsmknFeels
         ZRK1vn7K5Px4pmqGoXhvlxfl5SOwqPLxH/0wE8HOxgxrtd263kAGlr5OT1epYiHmdZUL
         R7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770798519; x=1771403319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y5P0pA5ww1oZkDFmE53oeDu5lMmJYN+rkyRE56YrgrU=;
        b=QN9kxDkwTCrVs28fmI692uJ5Tm5R3OzzPYm755EOk835vIPjcYqckAKwdgW/j9NeCn
         7dXemSv/qVymgmSBFhwKMucmuiJxChVKBlOdYUcUqEe1ROVaKFP1gCfAIP86GoptRlwa
         is+4Mmbs4oDSX7tnAO9h1ySSNEOv5w66qrsEuoJMci7a9yuFslLaNSIPRfGJZL+dpABV
         GB77gsIiDcVt4fqUgw5T+6siffHQyYXbNqlcjNxdxHG59FB19IEnCiV9itChf0oPBxDj
         CcI5jshfSD4ZBhxUf+fBWQrB6MJur+NeF6gu5f3wFKN1QIjcwIfecluaFq/ZGV0iXCGU
         7V6Q==
X-Gm-Message-State: AOJu0YzzxSXOHj1aSJ6XYENkebvrF4EEvGAcWOHr9qVgsA2oXQopufpc
	rcL6Gf6FYrn8midO4Xtq+eiO4/xEpDvsxXgpl88cGJ4laHm+eoWpROd4Ue/zrrzqnAgR09DzdgM
	xTdWGlGVJCuoaoFoHxHyHC5swahSk0NE=
X-Gm-Gg: AZuq6aKGa5xk3RB3kCtxpOENWzp0X8RSL7KmMkAUUrPZkpzO02uafg5dbIU15DiByIt
	Z9ZVz7ZSAGFJrw4hNNfe6ZUHNLiMZirKBvOZB7UQin42oWK9yCgOGnN+FBTzt0rfU50A9c090Hh
	QXkJL5l9GbP+4DW+gUme0S9kCzbDUCHeJyB90RpYKXOJKaz2oBfORArHz1050AIH57oXxQaZ3Ip
	vr5PBRZML5PucnOoptFpzN9ltQr+bNAZn/w0x7W17i6gqNQ7pGugCG3mZT4H5ICB0MWJRlJRIVz
	R1Bl
X-Received: by 2002:a05:651c:1545:b0:372:628b:5cb4 with SMTP id
 38308e7fff4ca-38703270c01mr5333651fa.45.1770798518314; Wed, 11 Feb 2026
 00:28:38 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770046465.git.mykyta_poturai@epam.com> <3eb1cea5fb870e01b86e964caef5ceb9b2a8ed75.1770046465.git.mykyta_poturai@epam.com>
In-Reply-To: <3eb1cea5fb870e01b86e964caef5ceb9b2a8ed75.1770046465.git.mykyta_poturai@epam.com>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Wed, 11 Feb 2026 10:28:25 +0200
X-Gm-Features: AZwV_QjfORdiQXQuveEv0skT_N_toFlsGm-8olRbDuLsRhGAxkr25F6n81Gezvg
Message-ID: <CAGeoDV-330_HnGCUH-qgVEM-3_=LL_iwnMgOvzRTgJisoi78vw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/19] arm/gicv4-its: Add GICv4 ITS command definitions
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:email,gnu.org:url];
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
X-Rspamd-Queue-Id: 6D1A41223CC
X-Rspamd-Action: no action

On Mon, Feb 2, 2026 at 6:14=E2=80=AFPM Mykyta Poturai <Mykyta_Poturai@epam.=
com> wrote:
>
> Add definitions for GICv4 specific ITS commands.
>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/gic_v4_its.h | 41 +++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 xen/arch/arm/include/asm/gic_v4_its.h
>
> diff --git a/xen/arch/arm/include/asm/gic_v4_its.h b/xen/arch/arm/include=
/asm/gic_v4_its.h
> new file mode 100644
> index 0000000000..f48eae60ad
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/gic_v4_its.h
> @@ -0,0 +1,41 @@
> +/*
> + * ARM GICv4 ITS support
> + *
> + * Penny Zheng <penny.zheng@arm.com>
> + * Copyright (c) 2023 ARM Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; under version 2 of the License.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_ARM_GICV4_ITS_H__
> +#define __ASM_ARM_GICV4_ITS_H__
> +
> +#define GITS_CMD_VMOVI                   0x21
> +#define GITS_CMD_VMOVP                   0x22
> +#define GITS_CMD_VSGI                    0x23

nit: This looks unrelated to the changes in this series
      no vSGI handling in this series

Best regards,
Mykola


> +#define GITS_CMD_VSYNC                   0x25
> +#define GITS_CMD_VMAPP                   0x29
> +#define GITS_CMD_VMAPTI                  0x2a
> +#define GITS_CMD_VINVALL                 0x2d
> +#define GITS_CMD_INVDB                   0x2e
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> --
> 2.51.2

