Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77A9A8546B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 08:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.946600.1344432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3846-0007DF-AL; Fri, 11 Apr 2025 06:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 946600.1344432; Fri, 11 Apr 2025 06:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3846-0007Av-73; Fri, 11 Apr 2025 06:40:38 +0000
Received: by outflank-mailman (input) for mailman id 946600;
 Fri, 11 Apr 2025 06:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8esB=W5=gmail.com=npiggin@srs-se1.protection.inumbo.net>)
 id 1u3844-0007Ap-GU
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 06:40:36 +0000
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [2607:f8b0:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id deffcf1d-169f-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 08:40:35 +0200 (CEST)
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-736b350a22cso1376119b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 23:40:35 -0700 (PDT)
Received: from localhost ([220.253.99.94]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b029dff3b64sm4083209a12.0.2025.04.10.23.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 23:40:33 -0700 (PDT)
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
X-Inumbo-ID: deffcf1d-169f-11f0-9ead-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744353634; x=1744958434; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WFEK5BUAzhnm7Ls0LSYKvyunOzyOHTaf9tKVCyYIPn0=;
        b=js33gaEp83OAwPIntbfNpAYLR9W0OI3+TYprDxXwsQiJ7hEagJbR/cF2+tofPWyG5s
         s74rKgL6zbUY6pBwADLRF+QOi7JsVqlf4B83xc18Yo/McL/9NOUlZNUzaNoJDAtKfHvd
         fH4eMfdCDhJD/u9oWi284R9saUO+Hx55tNu5EuyreEpEkaMrMbHge9ceD3Whe5K2oEaD
         SpEx2Kr0sx9O3WZKQpbiFbxMi2XWp3SlZeHHt/E93EdSsCIZ9yIFqlSFgK8JQ1q9sJYq
         BhfwqvfeS0vn9OfrN5sydMNjcvvIRWKSJ2UFZ4ypn7PfnNBhCXRXqUBHwBDgoXK6brbG
         k22g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744353634; x=1744958434;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WFEK5BUAzhnm7Ls0LSYKvyunOzyOHTaf9tKVCyYIPn0=;
        b=j6obY+4vaAWVnrLEBXw/ATgbg+Zwumjxe4u4etsMwfsUH8RpVPZdTsSAwj4s2uTEn6
         2pKv9ITZj18xMCc/X2xmvsacQirU2+aHK2Qc8NtuWjCn+W9WqNhoFolZPKEPnpEL1PYJ
         /QeRxoBlNnkCpO2OxUGz8BFtHChTfrfx5YJJp8y2TTbnr/O3UTzGmLi4lQVbjuOWwk2x
         iS/Ls+BENJUz5w5Xjgo7pd8HMFS+5MhFv14MRb3V5nQCcim2+iYkacokAd33M4KPGtJF
         r5usyxfEdKI5xfTWnpVCfsPZHITjNS4uqTLr+lRK97XEhwM5gr+eOewx/8loMVq5aB/3
         b81w==
X-Forwarded-Encrypted: i=1; AJvYcCURPQsofTi0vriQJNo1Pp+QZHipmyIE6NCJU8Hld3kRKaFKiVVc9OSJL5GKkj2cOsDBcdwhRyVOQX0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhYu27FBu/XhgFCcmAD0u8RmFaIfYqTbZpPWh1DgxRhq1dLu92
	ZQYb7GyvpRwkL6ExG5p0flr69fGN4O35uCPMuHz7gOMchMI6PQzM
X-Gm-Gg: ASbGncuiR6LORMr2IPP6iboeOPRhdROH7v98xdepfCIUOYfZMXQLsUtImQAj+PzK3cx
	If3cotZ/rjOywJ9u4YdzDHvFDiZhCGfeF16pYeOLBfKEYoJXpkyksgU44Y0E3PlclPx4ERCC6d8
	w9CK/dKkOC8xAsoWKmAQuGdg4iaxGQWZeaCLAN5/3xOm+pOEEbOBoC8rYeLSSC6Ee2PDWbqqQKC
	tbLkwWEV0hCGcnZLgY5ZuFxmzsRItLG9yjtF5qyuzL/rW7M80MZ1zeJubgfss+pCTh6mznPyGNu
	EG/gbP7tt+PMscZaOU7DmYc6Eo9haz/VVQ==
X-Google-Smtp-Source: AGHT+IGxv2OdTwUHRm9UMQ0BxuItHKpv+vDYxaqSXEB9Rf30X+vmBhY4lLT/tgRpdLMgX439EpkNdA==
X-Received: by 2002:a05:6a00:13a1:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73bd12a9926mr2119650b3a.20.1744353633666;
        Thu, 10 Apr 2025 23:40:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Apr 2025 16:40:25 +1000
Message-Id: <D93LR52FZ2QR.399C9CFVNU658@gmail.com>
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

It's a bit unfortunate to make this use atomic allocs for
archs that don't need it.

Could you make it depend on __HAVE_ARCH_ENTER_LAZY_MMU_MODE
or is that overkill?

I wanted to remove ppc64's per-CPU page array and replace it
with on stack or dynaimc alloc array in the thread... but
cost/benefit of working on ppc64 hash MMU code is not
high :(

Fix itself for ppc64's requirement at least looks right to me
so for that,

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

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


