Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12746BAB70B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 07:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133710.1471780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SVw-00080y-2Y; Tue, 30 Sep 2025 05:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133710.1471780; Tue, 30 Sep 2025 05:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SVv-0007yV-W7; Tue, 30 Sep 2025 05:02:59 +0000
Received: by outflank-mailman (input) for mailman id 1133710;
 Tue, 30 Sep 2025 05:02:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3SVu-0007yO-8H
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 05:02:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9bdd89f-9dba-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 07:02:56 +0200 (CEST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-17-Uz6QhTx1OgWxMCIGnMY9BA-1; Tue, 30 Sep 2025 01:02:51 -0400
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-afcb72a8816so521739666b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 22:02:51 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353efb88ebsm1061296766b.32.2025.09.29.22.02.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 22:02:49 -0700 (PDT)
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
X-Inumbo-ID: b9bdd89f-9dba-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759208575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bL+RjxGqhOdRGXNtIbLqiRsKj/Y3K4D3P43i5DVXnfw=;
	b=KDyi3tqoWpmkeEg0L7vUIl7hkOAiZ1lu9q6VBujRrzg0CQFQaN/I30aMrlTfEa5wkwSJuC
	tTQ7ev9/5N1DzxlAeOu7s2Nx0iaaHcD3B4cjeIlNQOv4/0CzHXMsCx4mYpnvgbuyO3w00K
	jUanIPvvXrrt9uACGvtNBC+EYHZnDCg=
X-MC-Unique: Uz6QhTx1OgWxMCIGnMY9BA-1
X-Mimecast-MFC-AGG-ID: Uz6QhTx1OgWxMCIGnMY9BA_1759208570
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759208570; x=1759813370;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bL+RjxGqhOdRGXNtIbLqiRsKj/Y3K4D3P43i5DVXnfw=;
        b=tS5oQGtG5H8AvDe+Ms7gsuTqrzbZwHJMmnjRd7gt3ubKthUWVLaK+t5rtdiHTgs7sD
         /ueehSjMWJjGaqfbOhyM+JhHF2KgAod/fFlXX14FgEgqVU04gRtf8A3QJPUjNrnUKmAr
         bQq5WRDy86Q4sLnPTVRmI1N3F8jm5foJfKxxwXjw7Ggr68Akcs/JTrFgGOf4IXhZB0qE
         OF/WuVdnCDeYr3Fwxze+8Tc6jY+BAkQYjYk58DevPIgp8cuO01LLGmfvit0sUxcJl0ok
         VQqxLpto+hpBnEmk2PQGs8fitpUpTdU/cEkiYopAOPpSHwbsAd2zwgxjxyp2FASLH3iE
         yeKA==
X-Forwarded-Encrypted: i=1; AJvYcCUROMTjU98iJJtJeHdDI4AG857IF//jAO7CDPAb0lL9aFoiGVxvqvMpUQPUUrD+ZOxTVjsKFFzUvvY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwuZstutDbj7hUVSOFQomNvtjXciIuhzH7yOZpk0UIVAZqLs74F
	9K6yNZfKhoffv/dwGQ3/hv8/qwrD4n8afPHweiuk0XWqN3TUbODeezDQHtp//oqp7sdAe0ayCHZ
	jUQ2MGOCwDHjwRT4s66zb7nDzw2TIkaKd0ZUApc8MN2Cb1Ou7IR9PEHHgnSKg0jwzv3UW
X-Gm-Gg: ASbGncvV42zmxz0Ey5ebudQNKiVFZHSBUbc3BVaQwxADqe57VOuPzjg5+K6uDyrIbMP
	iJ6UWZd+atHRen/lH1He8MuKPIXb0+52CvCdtDAuK3y13ZHH+C2yj9fg+sNGdhtMV1EUuQG0rt7
	YCPsC1CzYkXCWf+1KDm+p7DDE6KRybbrBeYK+d23P1DstsiQ8Rbd3miJttEHCed+JoY0LrIO8j/
	eB02++FwI+Q9tKKZ6WovtIUbnnwWtR+zYORyjR7lk41lr0HceAfcCMiZFr1J/Z6gOMXoVc/++vc
	b/6IJ5jYIMZ1j2giyLQgN9PNg6v6FM4zvI74xJ0kPpgaJB4UZmHnKki5hzN3770lhb/mLXNfco7
	yENOCOOPRQQ==
X-Received: by 2002:a17:906:f5a0:b0:b41:a571:21b0 with SMTP id a640c23a62f3a-b41a5712270mr236497566b.39.1759208570369;
        Mon, 29 Sep 2025 22:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxIe1/gUAycFtpVQcR4b+NsqR4Pre+MyQnotThndZ321+xPzQyp6FkW4vxaOLRMNcnkRphAA==
X-Received: by 2002:a17:906:f5a0:b0:b41:a571:21b0 with SMTP id a640c23a62f3a-b41a5712270mr236492866b.39.1759208569870;
        Mon, 29 Sep 2025 22:02:49 -0700 (PDT)
Message-ID: <193cd8a8-2c4c-4c2c-af22-622b74c332ee@redhat.com>
Date: Tue, 30 Sep 2025 07:02:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/17] system/physmem: Un-inline
 cpu_physical_memory_read/write()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Herne <jjherne@linux.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Stefano Garzarella <sgarzare@redhat.com>, xen-devel@lists.xenproject.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Eric Farman <farman@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Reinoud Zandijk <reinoud@netbsd.org>, Zhao Liu <zhao1.liu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-s390x@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-15-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250930041326.6448-15-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qSedsP2layODZu98HrgFL-kZdUVQALWgbLJAlInIdno_1759208570
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
> Un-inline cpu_physical_memory_read() and cpu_physical_memory_write().

What's the reasoning for this patch?

  Thomas

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-common.h | 12 ++----------
>   system/physmem.c          | 10 ++++++++++
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 6c7d84aacb4..6e8cb530f6e 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -133,16 +133,8 @@ void cpu_address_space_destroy(CPUState *cpu, int asidx);
>   
>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                               hwaddr len, bool is_write);
> -static inline void cpu_physical_memory_read(hwaddr addr,
> -                                            void *buf, hwaddr len)
> -{
> -    cpu_physical_memory_rw(addr, buf, len, false);
> -}
> -static inline void cpu_physical_memory_write(hwaddr addr,
> -                                             const void *buf, hwaddr len)
> -{
> -    cpu_physical_memory_rw(addr, (void *)buf, len, true);
> -}
> +void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len);
> +void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len);
>   void *cpu_physical_memory_map(hwaddr addr,
>                                 hwaddr *plen,
>                                 bool is_write);
> diff --git a/system/physmem.c b/system/physmem.c
> index 70b02675b93..6d6bc449376 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -3188,6 +3188,16 @@ void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                        buf, len, is_write);
>   }
>   
> +void cpu_physical_memory_read(hwaddr addr, void *buf, hwaddr len)
> +{
> +    cpu_physical_memory_rw(addr, buf, len, false);
> +}
> +
> +void cpu_physical_memory_write(hwaddr addr, const void *buf, hwaddr len)
> +{
> +    cpu_physical_memory_rw(addr, (void *)buf, len, true);
> +}
> +
>   /* used for ROM loading : can write in RAM and ROM */
>   MemTxResult address_space_write_rom(AddressSpace *as, hwaddr addr,
>                                       MemTxAttrs attrs,


