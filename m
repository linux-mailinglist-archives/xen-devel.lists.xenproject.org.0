Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A1D73F711
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jun 2023 10:27:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555935.868130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE425-0006B8-Gt; Tue, 27 Jun 2023 08:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555935.868130; Tue, 27 Jun 2023 08:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qE425-00068k-EK; Tue, 27 Jun 2023 08:26:41 +0000
Received: by outflank-mailman (input) for mailman id 555935;
 Tue, 27 Jun 2023 08:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YMkL=CP=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qE423-00068e-3E
 for xen-devel@lists.xenproject.org; Tue, 27 Jun 2023 08:26:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55ab23f2-14c4-11ee-b237-6b7b168915f2;
 Tue, 27 Jun 2023 10:26:37 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso5538652e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 Jun 2023 01:26:37 -0700 (PDT)
Received: from [192.168.203.175] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac244b2000000b004f843f31fefsm1422098lfm.281.2023.06.27.01.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:26:36 -0700 (PDT)
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
X-Inumbo-ID: 55ab23f2-14c4-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854397; x=1690446397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=72IHbVBD99VSHWTYqh7JmGpvBP5E8dLV6bukMnyN/rc=;
        b=k6FVJo6i43CAynJ6zVGuiO71rJZt0zZOXaSzHiSXkjVEXBFOlozOuRVKySWbIgESeR
         paPz9PQQBKJ15/4W6tj2G2Fygj4WoSTxCRT9GGCf/K3vVz0X+1oLROFou0jcOvGLTjQJ
         80cM1K8EgAQB+usItgMXK1SZnSRDjjnHn1TMafqUyKWCEIXV7cAuLFLFovRFeZpRaAwo
         5MEIsXws5WefgEAehozX4K+5eYb5WaNiSsIaGnTYnkal/5XlJ7fkmR/CE4nQqkylN8CP
         3AiK8Q55k4kvXXevET8iKHy1xZHgex20twflhsQIO8mwaxhaEeTsLRDl4thcNVVpU6D4
         3l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854397; x=1690446397;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72IHbVBD99VSHWTYqh7JmGpvBP5E8dLV6bukMnyN/rc=;
        b=RB8X8cyyQG/I51fUiithQGoVUfdBTt7x5iJFQ1rRh+JR+2ShzynQCKGsmL5Uh7nmlJ
         hO9GL8kwmoK9yysMmWk5PWQYcz+JiJw398slS8rlyUFMSl4T54VY6lUadlxIQYfnbShn
         396wnVCpbPUZ88ToiSkXSxujEpQ6JDl/qG+lMWgZaT0wdWSC+TwOCyGz52+TgczaBtCx
         WrfPvecHlsvlmeIg5xBndT/niU93RRkjDEsCpSyHA3g8Cl0Uz+7qwLAjt39VesAMR+Qp
         3eQoGJA58uDycONZZRksj81/PcB6IZJtuo7WGJSj4OQ0oxceFFtuaJyAIVgX56Tth/kv
         xpCQ==
X-Gm-Message-State: AC+VfDxSKEmYPDHK4N1dH2m8C2qQChH9cAXBm/jHaoy7rCfxF4QCSHTG
	zMI8Ot9ptcU2sjj1tqNAtfU=
X-Google-Smtp-Source: ACHHUZ6b/iPSP4PEM/ol4BAxHotZt4DZNdy42wdKtaQDXWD24fE9LgDgeABpWMVt0X1y9dK3DSNSCA==
X-Received: by 2002:a05:6512:1295:b0:4fb:8771:e898 with SMTP id u21-20020a056512129500b004fb8771e898mr663903lfs.15.1687854397050;
        Tue, 27 Jun 2023 01:26:37 -0700 (PDT)
Message-ID: <a8611490de9c44045a6eddf4f4ffab456c61def3.camel@gmail.com>
Subject: Re: [PATCH v2 1/3] xen/types: Drop #ifdefary for
 __{SIZE,PTRDIFF}_TYPE__
From: Oleksii <oleksii.kurochko@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	 <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Alistair Francis
 <alistair.francis@wdc.com>,  Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
Date: Tue, 27 Jun 2023 11:26:35 +0300
In-Reply-To: <20230627075618.1180248-2-andrew.cooper3@citrix.com>
References: <20230627075618.1180248-1-andrew.cooper3@citrix.com>
	 <20230627075618.1180248-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

On Tue, 2023-06-27 at 08:56 +0100, Andrew Cooper wrote:
> All supported compilers have these types.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Bob Eshleman <bobbyeshleman@gmail.com>
> CC: Alistair Francis <alistair.francis@wdc.com>
> CC: Connor Davis <connojdavis@gmail.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> CC: Shawn Anastasio <sanastasio@raptorengineering.com>
> CC: Timothy Pearson <tpearson@raptorengineering.com>
>=20
> https://godbolt.org/z/Y6PWcd6js
> ---
> =C2=A0xen/include/xen/types.h | 9 +--------
> =C2=A01 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
> index 6aba80500aaf..8b22a02eeaa4 100644
> --- a/xen/include/xen/types.h
> +++ b/xen/include/xen/types.h
> @@ -5,18 +5,11 @@
> =C2=A0
> =C2=A0#include <asm/types.h>
> =C2=A0
> -#if defined(__SIZE_TYPE__)
> =C2=A0typedef __SIZE_TYPE__ size_t;
> -#else
> -typedef unsigned long size_t;
> -#endif
> +
> =C2=A0typedef signed long ssize_t;
> =C2=A0
> -#if defined(__PTRDIFF_TYPE__)
> =C2=A0typedef __PTRDIFF_TYPE__ ptrdiff_t;
> -#else
> -typedef signed long ptrdiff_t;
> -#endif
> =C2=A0
> =C2=A0#define BITS_TO_LONGS(bits) \
> =C2=A0=C2=A0=C2=A0=C2=A0 (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)


