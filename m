Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1870AB12FCA
	for <lists+xen-devel@lfdr.de>; Sun, 27 Jul 2025 16:06:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1060569.1426429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ug1zn-0003aI-DM; Sun, 27 Jul 2025 14:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1060569.1426429; Sun, 27 Jul 2025 14:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ug1zn-0003YB-8T; Sun, 27 Jul 2025 14:04:59 +0000
Received: by outflank-mailman (input) for mailman id 1060569;
 Sun, 27 Jul 2025 14:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mCbi=2I=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1ug1zm-0003Xp-44
 for xen-devel@lists.xenproject.org; Sun, 27 Jul 2025 14:04:58 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe5c5ec-6af2-11f0-b895-0df219b8e170;
 Sun, 27 Jul 2025 16:04:54 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6150be62be4so1631972a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 27 Jul 2025 07:04:54 -0700 (PDT)
Received: from ?IPv6:::1?
 (dynamic-2a02-3100-2d4b-dd00-bd73-623e-7632-a2ac.310.pool.telefonica.de.
 [2a02:3100:2d4b:dd00:bd73:623e:7632:a2ac])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61500ae318csm2175223a12.55.2025.07.27.07.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jul 2025 07:04:53 -0700 (PDT)
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
X-Inumbo-ID: abe5c5ec-6af2-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753625094; x=1754229894; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OE6lXfQoczYjBjQ4RH4+wmtwsv/Rzy9alyWleTWOu9c=;
        b=NSEzrewkZa1Jm6AiSCJmkHbtPhYTVJXs3Dg5FUwd+9ps8uCzPPsXXcjxc8aoXZjZoV
         VoyZe3VbSrU3huzo42/Y33PxK0FvAcRQvWacRJZLjQMkXh3Tcl/eDRE7L36V/zwWRd7P
         W1SdvOCz/3z6vhOx31LVuzwWIHmCOabV0s1Tz96PZnloBvQ4QWjn+b9qEp2RAU8U7kkl
         Ti9tRTL6UPlLEN3ZIchcNxvX3Mk7WIXRy5eKhbrmpL1LEN172if8YX7YhsHFv/FGasuq
         y0n/5Poj2ZmqmjgzC0wMZEoed8TgnTZOVvFmmoqy3jrgXaAPTlmHNgKnKTSefMSIm9OE
         KRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753625094; x=1754229894;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE6lXfQoczYjBjQ4RH4+wmtwsv/Rzy9alyWleTWOu9c=;
        b=D3CtxrYQteYiTCsYJCpfrymb5A4xS2A/YxM2k9E6QSkpTWrrhrQ/enZp2BwxqhTUnU
         +5XJHnLfxgnwcfoVJ4iRqaAiCT4rVIOliEo/EAkDaXw2L2UE4QiZG0y+hRFDGeGiekfF
         f4mczXPuugd+u5S8qIdw0IYmXseGlYrZDFyGvX3y+JULn3IHxh/7B5w46UMvdPv1u/yJ
         tHqCPlZW4lzTQyZJ9pWBkJ53J833y+/n/yqWPrqCE95FGDbau2qxrdWT4fXdv4fdBdWx
         caGxkXEH10cEuh4BbJi3TXW5ilkdWuV7nbKjcCl83mwzzymS/Uhu8Vsst2XXewWf27gP
         pB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/JC9TvRy3KdRfgiFhWQOSUbdB0z8KX6dw3ZcLXg2lbml9fdXQ90/OnPo/59JL239OrP23EkPkg9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxJw714OmZ+dWeRT5OYZIgY+J6VwqXSUWnA1091HGsIN/Nxtpn
	UU3ibwGx7fP4s9/Xq7vIl6hNfTh+l4eCNjGtuGtpxuBc4m51y5HTwa9m
X-Gm-Gg: ASbGncsD6LSK6Rbg0QVBIxjBN1i+j9BIu3QkD7641Plrk+XD7XnyPjypLlW4K2HojaT
	csDJGZ3lS/uTeQtBHJOCD/e5euh/4p681RQEGer08vn0pqVvC3ElZR/qnXIGzcItpqqiGgC7xJf
	LxzuliI5rtiyVe5v5neCoJq8hGaVoHA966SFsNGh23YQRyr5h2K0nlIH5kDbNLWykfRIbUQaD5l
	nkZgkX4k3CqpR1E9V/T8KhkSXJI1WSLPRamQ2BKSbu5DR8rpqvOAmCnB7TbOf/UeTeusT5Izi5q
	JfTSYCloRp+4sqb8SxCN981u+jeDpS1hcTGIZHSScnOiE8mLcXfQbKA1M2PjMt1mWhSCgMvR6Ri
	k+RsaihhS9SPcRNmrcQQSJW3VWDz7WehDNZuDsL1k++EZqGOCTWemcG5cmQac0oibjDbdkd/i8v
	UpF0cHSOB23cHaBjRfYlzgc8Gv+9PdbA==
X-Google-Smtp-Source: AGHT+IFK+CgG+rGgJUofsetzGAfj569SNKsnWn33NNBINsSNfLifgPTTAFfvn42BIj1YNe70VGUbFg==
X-Received: by 2002:a05:6402:b51:b0:609:b5e0:5987 with SMTP id 4fb4d7f45d1cf-614f1f1258cmr5897568a12.23.1753625093843;
        Sun, 27 Jul 2025 07:04:53 -0700 (PDT)
Date: Sun, 27 Jul 2025 14:04:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org, Adam Williamson <awilliam@redhat.com>
CC: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
Subject: Re: [PATCH] xen/passthrough: add missing error-report include
In-Reply-To: <20250717220207.171040-1-awilliam@redhat.com>
References: <20250717220207.171040-1-awilliam@redhat.com>
Message-ID: <DDB29958-4D54-4862-AEF8-1C43E11DDB8A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Am 17=2E Juli 2025 22:02:07 UTC schrieb Adam Williamson <awilliam@redhat=
=2Ecom>:
>In cfcacba an `error_report` was added to this file, but the
>corresponding include of `qemu/error-report=2Eh` was missed=2E This
>only becomes apparent when building against Xen 4=2E20+=2E
>
>Signed-off-by: Adam Williamson <awilliam@redhat=2Ecom>
>---
> hw/xen/xen_pt=2Ec | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/hw/xen/xen_pt=2Ec b/hw/xen/xen_pt=2Ec
>index 9d16644d82=2E=2E006b5b55f2 100644
>--- a/hw/xen/xen_pt=2Ec
>+++ b/hw/xen/xen_pt=2Ec
>@@ -54,6 +54,7 @@
>=20
> #include "qemu/osdep=2Eh"
> #include "qapi/error=2Eh"
>+#include "qemu/error-report=2Eh"
> #include <sys/ioctl=2Eh>
>=20
> #include "hw/pci/pci=2Eh"

Reviewed-by: Bernhard Beschow <shentey@gmail=2Ecom>

