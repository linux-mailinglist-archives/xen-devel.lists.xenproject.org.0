Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE99FA854BF
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 08:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946645.1344462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Hb-0004NV-Uq; Fri, 11 Apr 2025 06:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946645.1344462; Fri, 11 Apr 2025 06:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u38Hb-0004LK-Rk; Fri, 11 Apr 2025 06:54:35 +0000
Received: by outflank-mailman (input) for mailman id 946645;
 Fri, 11 Apr 2025 06:54:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u38Ha-00045y-JH
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 06:54:34 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2d14cf0-16a1-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 08:54:34 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22435603572so16171025ad.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 23:54:33 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd23342ddsm728537b3a.164.2025.04.10.23.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:54:31 -0700 (PDT)
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
X-Inumbo-ID: d2d14cf0-16a1-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744354472; x=1744959272; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMrPec0FtWGKoKqlWKZKVYlPugkOpwSx2KisPfbkQKU=;
        b=TjWk9vHbuWglbg5m6Kd0xzDb5o3I0Todz+A9K7VDQoAjIXc6GwKtFkY/NROiHfqaqQ
         AT0Iy4BcF5FgRGzAVhXdfaXfmPRyAte5P3MS9aOzTBPoVpRbJZ9Q/D6jcbNtoLPJ9moe
         BRBotqe4TBfDp6+WFlAtqfZoJ2HVQt9K6ndO50RsRX46nufSbXtTzlSuPaQF2pHBONxv
         2eZXHG5nKvoLbJHRz8h1iIcQFcsH1Lf/x8UkAQez3t02ShqYVHzofAV22NN+C1GGaWOg
         L74zVRyY+OENbX5TLqvnzoKA++jKFpDhnR/rVNIm2EIxGoAp9Pi9qCJ0WxzU/SxncDpb
         5yug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744354472; x=1744959272;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EMrPec0FtWGKoKqlWKZKVYlPugkOpwSx2KisPfbkQKU=;
        b=eW/4XYtel1XDoHOc39iJ2Uk9GZavj3mV9ZT0c0LP3o2s2k1di1UG88h7KvsCQG8/vp
         2pcpqLbq/kwUnDWPNQcgrCzGH38jX2AQc147Jho4Gg0flNKKle7w1sz+/0eDPXzDJW5g
         OQ+9QXwTRIBIRqKsu/Y+falr66YTEpLZ3Y2jbV8jSt/osOcotyBVbBsF9eVOMMtWgXF1
         GTeMCb4dgImBH9gxr8w5PEhlY101UeQe7edAx6EbQ4sQcPV97veUm03aUs1+Itt2FwBY
         xUKfX2DGecGz0iRmqy6OQFo2xina+YahFpSQ5HyFZo166CfR3G/vfhnCWRqvu0v1gtN3
         0mMg==
X-Forwarded-Encrypted: i=1; AJvYcCXf6yIqQLwuGqPQCZEcuz42n7AH2YY0JBx7xAHohXexRzH4we+WXinueNBbFnyQ3d3jwbm8BKcsSE4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YydXRDuIwKR2MurG2hudz0B7+X+lbs30SAJ3QRqwgrGUDj4BQqu
	R4JGUiFF3DcIpaG0I/cKmJbtXIsVz42wpgyk6P1+0y0V9tpD+GIL
X-Gm-Gg: ASbGncvMfZ5rAwTSmIwmfP/mgq/yKghhGv7PhWrnZZxZUIThFmPqbQcylJEMSER89Gm
	aLzQzba52tK0yZg9WAFV33xzirKm8BMucKkm1b8nKCiTZospCCypRHdQ7pIBwbLGblgNozHJep7
	fL42hd5e00jT5ZOCaRrX3Pn962PgaagQp1VntyW3hPZilToAtcgS/8vdcHivAcG1qShiaU3QS9C
	upxDujGWTiuI8Kf5jrqJrfwLp3fPNh/86URsy7viCKOpGCnIN1vdOs2ml/iFWs2giqj/RISMFdj
	zWeT8Nhzm2iOOc3q1/TBM/UW5Gy3r4og7w==
X-Google-Smtp-Source: AGHT+IGSH0OgLf53VF7UhNZNnJ/VcLJp7S3R1+Mq4jeyNCKlAufgShNsDG1jyYvvXL3wLn/jNMdw9A==
X-Received: by 2002:a17:902:ce8a:b0:224:191d:8a87 with SMTP id d9443c01a7336-22bea4bc62emr24301425ad.26.1744354472347;
        Thu, 10 Apr 2025 23:54:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 16:54:25 +1000
Message-Id: <D93M1ULKMFVB.FY9I2463RQ68@gmail.com>
Cc: "Hugh Dickins" <hughd@google.com>, "Guenter Roeck" <linux@roeck-us.net>,
 "Juergen Gross" <jgross@suse.com>, "Jeremy Fitzhardinge" <jeremy@goop.org>,
 <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
 <kasan-dev@googlegroups.com>, <sparclinux@vger.kernel.org>,
 <xen-devel@lists.xenproject.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-s390@vger.kernel.org>
Subject: Re: [PATCH v1 1/4] kasan: Avoid sleepable page allocation from
 atomic context
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Andrey Ryabinin" <ryabinin.a.a@gmail.com>
X-Mailer: aerc 0.19.0
References: <cover.1744037648.git.agordeev@linux.ibm.com>
 <ad1b313b6e3e1a84d2df6f686680ad78ae99710c.1744037648.git.agordeev@linux.ibm.com>
In-Reply-To: <ad1b313b6e3e1a84d2df6f686680ad78ae99710c.1744037648.git.agordeev@linux.ibm.com>

On Tue Apr 8, 2025 at 1:11 AM AEST, Alexander Gordeev wrote:
> apply_to_page_range() enters lazy MMU mode and then invokes
> kasan_populate_vmalloc_pte() callback on each page table walk
> iteration. The lazy MMU mode may only be entered only under
> protection of the page table lock. However, the callback can
> go into sleep when trying to allocate a single page.
>
> Change __get_free_page() allocation mode from GFP_KERNEL to
> GFP_ATOMIC to avoid scheduling out while in atomic context.
>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 88d1c9dcb507..edfa77959474 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, un=
signed long addr,
>  	if (likely(!pte_none(ptep_get(ptep))))
>  		return 0;
> =20
> -	page =3D __get_free_page(GFP_KERNEL);
> +	page =3D __get_free_page(GFP_ATOMIC);
>  	if (!page)
>  		return -ENOMEM;
> =20

Oh of course you can't make it GFP_KERNEL after the
patch to take ptl even for archs that don't use lazy
mmu.

Thanks,
Nick

