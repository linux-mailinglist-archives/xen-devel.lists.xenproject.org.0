Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FF8A82764
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944225.1342767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WC3-00068z-AW; Wed, 09 Apr 2025 14:14:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944225.1342767; Wed, 09 Apr 2025 14:14:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WC3-00066G-55; Wed, 09 Apr 2025 14:14:19 +0000
Received: by outflank-mailman (input) for mailman id 944225;
 Wed, 09 Apr 2025 14:11:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L8O5=W3=gmail.com=ryabinin.a.a@srs-se1.protection.inumbo.net>)
 id 1u2W9V-0005Uv-Ic
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:11:41 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e83bb26-154c-11f0-9eab-5ba50f476ded;
 Wed, 09 Apr 2025 16:11:40 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3912387cf48so456483f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:11:40 -0700 (PDT)
Received: from [172.27.52.232] (auburn-lo423.yndx.net. [93.158.190.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235a5d31sm17305755e9.35.2025.04.09.07.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 07:11:38 -0700 (PDT)
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
X-Inumbo-ID: 8e83bb26-154c-11f0-9eab-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744207900; x=1744812700; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=79dRAhMX6hAzgdIihnfQk7TyjpU16Gt/P7A1hHpHnDM=;
        b=KKEG+adXiy5EWkqmhISj3/4Jku3sKrwoYQD7oBr7pzX6oDJVoKoNgRf+0/vkHVf8kZ
         n/pQ30fAI0zODSZLyYZg7ebB/rz3FT+tWi3T8CtFcHnf5eH6HZ67uHzO266YLYldYcP5
         ofVYFrrsjqdqm01bedvay+p5jO/4v9grX+L813tBL/1Itf/TnNCOa6w6+MmOXhGLNCYf
         X3+IkN0bwt3EcCb26J7b46apIgMDP6eb9/pZrGl8QtpHJHgRa1DHbGUFTTiOJyETl55U
         bTvJOjw1BzDGLkiOprqzGsjcrucagynbr7y8l/0quBZZfLwnpvFRkxnnuMUZJ048+qwG
         XPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207900; x=1744812700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=79dRAhMX6hAzgdIihnfQk7TyjpU16Gt/P7A1hHpHnDM=;
        b=UnHLjXrdt66PKH7Rn1gAd1cqifLAQVbayQYWHwunk2SgIoqHx++rJqtHiLmH7V0OgT
         eig9E22SvPHist7r27Z1kAop/7ga74j3y3A0wD/v+oIEtqk8jilj9m3fO5B3XHlOs7sR
         vvls5Yeq9jR7EgSfT/1XrbN5t4NMFX0BiL/wSdTPJqF6DK3T2UDy/U4qMgTWMsgk0Lgz
         tHNsdCLsdNUAplsSgtmpJ+2SZ50jrwJo1ds7H2Ozijd2l1iV8LXRw8AT2+jcBiuH3HuB
         ppYkdFtcRw0wwUm5VWVt6YQs8jSOtbAvgQDnBDgprliMdHHYyXBIUAPXzaz8sG/BCn07
         fMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/VfRgwSvclm2I69lpqWnlI+0DcXSEfgOSyqy9Lp0NbERRqhn6umOukgaL+aJ0ULBkFW6UA+r9bqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzhYr7Vr+w072kz+IY3V2lob7FlxNoSt915bxfTzzB0ZZk8VaE7
	WYD1Ldf9BJXEjzpiFp0Ke1NS2FVQQH5DjNrE0QgckrMS78W9EcI/
X-Gm-Gg: ASbGncuUjLnLKf3ZDFhVvo/1oDI1AZCukoDyQkSuvJRjppZ33JjxiXIqQw04X7oTsHm
	nI1UrT6oPBRiI44V0KN9dcXaG6Fv248BdBorxZ9G53nE36sQHOJEwcVqUeNDRpMcy4kJhxe0gNy
	EoLubX3s5ahSmlpghEiAvF00hJwTLjUbSqE9x/MuOncd87rJo581I31cMl7QZfMN+m+/sAWvqS1
	X07uL1ODlGlYEet6mGRHcHfIQfwT3v0AKYCrrDb/4ZFxSBKONPWaeneUu9x+nwcrUx322gflVZY
	h58oig6O9phW+ZvzLRZqcEP0POopzxeLWer2sv3oTcTtjVb4nrN6voSXmF2lU5burlJrTA==
X-Google-Smtp-Source: AGHT+IHSANHfnsI22VvG7U6Add3MtuqdkHlNUqXmc+ZOIvDB4qPCFfsNQQmWuYIJe4cIBvlXQ9bdkg==
X-Received: by 2002:a05:6000:2901:b0:391:2acc:aadf with SMTP id ffacd0b85a97d-39d87ab626emr1029141f8f.6.1744207899192;
        Wed, 09 Apr 2025 07:11:39 -0700 (PDT)
Message-ID: <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
Date: Wed, 9 Apr 2025 16:10:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from atomic
 context
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/8/25 6:07 PM, Alexander Gordeev wrote:
> apply_to_page_range() enters lazy MMU mode and then invokes
> kasan_populate_vmalloc_pte() callback on each page table walk
> iteration. The lazy MMU mode may only be entered only under
> protection of the page table lock. However, the callback can
> go into sleep when trying to allocate a single page.
> 
> Change __get_free_page() allocation mode from GFP_KERNEL to
> GFP_ATOMIC to avoid scheduling out while in atomic context.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3c5c3cfb9ef4 ("kasan: support backing vmalloc space with real shadow memory")
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  mm/kasan/shadow.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
> index 88d1c9dcb507..edfa77959474 100644
> --- a/mm/kasan/shadow.c
> +++ b/mm/kasan/shadow.c
> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>  	if (likely(!pte_none(ptep_get(ptep))))
>  		return 0;
>  
> -	page = __get_free_page(GFP_KERNEL);
> +	page = __get_free_page(GFP_ATOMIC);
>  	if (!page)
>  		return -ENOMEM;
>  

I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().

Whenever kasan_populate_vmalloc_pte() will require additional page we could bail out with -EAGAIN,
and allocate another one.

