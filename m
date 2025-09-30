Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F202BAB644
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:42:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133655.1471730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SC4-0007Tw-GB; Tue, 30 Sep 2025 04:42:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133655.1471730; Tue, 30 Sep 2025 04:42:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SC4-0007Rf-DW; Tue, 30 Sep 2025 04:42:28 +0000
Received: by outflank-mailman (input) for mailman id 1133655;
 Tue, 30 Sep 2025 04:42:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3SC2-0007R6-7F
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:42:26 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d929a01a-9db7-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:42:20 +0200 (CEST)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-U0GkLpl8Mc2yP93URxHw2Q-1; Tue, 30 Sep 2025 00:42:17 -0400
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-b4544f46392so18836066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:42:17 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3e89655b09sm359039666b.77.2025.09.29.21.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:42:15 -0700 (PDT)
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
X-Inumbo-ID: d929a01a-9db7-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759207339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tvxLjB/EsvBZ5htouvq/q3x83R6wXLK+5or1QrTnakw=;
	b=NZcrNuNDEV+RiCbVuGjddgcNeoRWmtrnQalgxte8aZZDS5gPkEefYEchJWGNDnIij1pL0m
	831tnulTVCoXPK/o73TeIApKtRUTTXsWKV93dekAyhC12aXGQPKZjEWPNkmAmKTzmtXiMJ
	QWOSnBXXFX9Ghpk1MueW081ZQygjecM=
X-MC-Unique: U0GkLpl8Mc2yP93URxHw2Q-1
X-Mimecast-MFC-AGG-ID: U0GkLpl8Mc2yP93URxHw2Q_1759207337
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207337; x=1759812137;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tvxLjB/EsvBZ5htouvq/q3x83R6wXLK+5or1QrTnakw=;
        b=PbUYUzKvddUSZAGWRkRMiUYLsKwSfeUyI0zBkobBZjgKkv9oWcuVrRd9PzRawjcGq4
         BHsIr80k2UkIdxwYuVHUihxIDlD93hnhSR/dykkn1U8toCLWZe4Px4U2VWx9LdhwzHWc
         L/JSZaTkR1BUQiCH1iGAvdbpB5hjdkQbr8z45SMB8M4DAQb8/DJSsaG8f0iy9UHWLHx2
         9t15UPsDb4FkvNk9glQFArP50716PE8U41X/BW1Dq+Fqcrk4cjlrN1uhN4vNwI13XluR
         vXCOGhw40hCZ3vxencJ6Im1X7YbAuFPqZ5Z/+Hy/yBRQ4VCI2SW6wdO6C92sAXli5yBW
         vFcg==
X-Forwarded-Encrypted: i=1; AJvYcCU90BsLFOA83/co2A4EHW1sfWwTSFWOwWQW9IqcPXEugDB9yXbs2JeMpIVSRurogfcdlWSw0wB4vqw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHaZDa+qgmOkjy1C+3tj68zHkD9CjGlNMtGn7TS3XhVW3SE4Op
	KfIYoN+RCaFwlTJMNBvxuCsCQgBlnwmUh2pskoUz1H/shaWuHH/6y7ds8jXekI+cvEvRKkcJaEz
	+7YzRNtafcGnoxSNjf+KNxs4sd0dpL1TYCjiTdDOSuAf0Djd80kvvsYLVp7es93ZsL1nF
X-Gm-Gg: ASbGncvlF08atln7/fWiAyJ1yPeFZdvA4DieGmvpPMlVNWcPZCho9nqDM64jox9f+3G
	tiOanbvJBppn20VJ4ArZbafBmU4EhwqcnUkRMKGr0axHhpwoyvAxwjIMLwuiKdJY4fysNBL/c1C
	rDicfB3cjCSWCbjHqsMP2iP3ZCdeSHT8fCMfRUGUGeSwetZOS7WMeCUdUzAuCmi0Q6FYN8NQM0P
	MjJGj/+4RWd1nBGfXMs9Ihif8Yhfcurmqqi6bjtaQIoyhamKpa3KGGke/KuL7szY9zzBlmHyN8u
	29fhCq03hBnDeMi11374FgI2giTpunNj5SfleDsiRWuEV7qvLlGbNPrZSRj96tH3SDXO5+vNgtZ
	w69utNyA05w==
X-Received: by 2002:a17:906:55d3:b0:b3a:875c:294f with SMTP id a640c23a62f3a-b3a875c2f2bmr943874566b.10.1759207336654;
        Mon, 29 Sep 2025 21:42:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE05FwuhQMGeXmbqCfNb5OYa/tRq8eoNKOW/kmksbVHWw0wqxA34cy3qT6OjHD0nk6wgB/ziw==
X-Received: by 2002:a17:906:55d3:b0:b3a:875c:294f with SMTP id a640c23a62f3a-b3a875c2f2bmr943870066b.10.1759207336259;
        Mon, 29 Sep 2025 21:42:16 -0700 (PDT)
Message-ID: <69b0255a-b6b5-46da-9940-ce1f2a18c2e6@redhat.com>
Date: Tue, 30 Sep 2025 06:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] target/s390x/mmu: Replace [cpu_physical_memory
 -> address_space]_rw()
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
 <20250930041326.6448-10-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250930041326.6448-10-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tvwIQrXzG72lNeD8gaQjUhHE_AYTXa4oh6W9Ddda400_1759207337
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
> When cpu_address_space_init() isn't called during vCPU creation,
> its single address space is the global &address_space_memory.
> 
> As s390x boards don't call cpu_address_space_init(),
> cpu_get_address_space(CPU(cpu), 0) returns &address_space_memory.
> 
> We can then replace cpu_physical_memory_rw() by the semantically
> equivalent address_space_rw() call.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>


