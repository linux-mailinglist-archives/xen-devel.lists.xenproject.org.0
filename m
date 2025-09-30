Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F55EBAB665
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:47:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133674.1471751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SGy-0000yR-8c; Tue, 30 Sep 2025 04:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133674.1471751; Tue, 30 Sep 2025 04:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3SGy-0000vz-5i; Tue, 30 Sep 2025 04:47:32 +0000
Received: by outflank-mailman (input) for mailman id 1133674;
 Tue, 30 Sep 2025 04:47:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3SGx-0000vt-6E
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:47:31 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 910c4c9a-9db8-11f0-9809-7dc792cee155;
 Tue, 30 Sep 2025 06:47:29 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-TlmEGcJIPiSVWIJNUBIYPA-1; Tue, 30 Sep 2025 00:47:24 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-634c48a0ce7so4429191a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:47:24 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b40f9d0a652sm192717466b.33.2025.09.29.21.47.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:47:22 -0700 (PDT)
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
X-Inumbo-ID: 910c4c9a-9db8-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759207648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=F0CpCpGLryTSVfViexSV8x0K3iUnfmatiqDW29KVp44=;
	b=dWWEejV87MAuObRRkV3UQrW27oVnJmmT4fU6pXQs0nWFOHc9aHzezPY78dm6dDHptYB0TZ
	KhsQYq303k6mdl8cAuS+WuGRGfOQ5lA8BIJJivAeiw4pjN0Yk+84knXBBbrNfjYbQyYnMx
	fXOrECJd30uoBhVEeDEjzo3G/5l/7nY=
X-MC-Unique: TlmEGcJIPiSVWIJNUBIYPA-1
X-Mimecast-MFC-AGG-ID: TlmEGcJIPiSVWIJNUBIYPA_1759207643
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759207643; x=1759812443;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0CpCpGLryTSVfViexSV8x0K3iUnfmatiqDW29KVp44=;
        b=wFHJ5QsebQlHJ8h/tY4tFZJa2L3AdQfiQx+o3IOyIdxbObygguPI5NZ76GdeXZL/AB
         y8Ntp5P9crEv+GH6x1VO1LzXIkpRK2h4B6leoYvB0JRRCUh3sG8OrymjbT9a3ENT0mNK
         2MzigvOfnXrbt+G4j9J8e3GxPY0Bza6oUz9LZWo9G6ChCyl74Y3D3TN5gllAJtANyl0+
         ZSbrNemjTx/AecN9UWwVdWR4NykaoQTTwSdzkViyUI5Z42vuEHoo0UuE8AeJIa9tLWXs
         3duezb+KVU4M7wLYDUXT1ATi4eCtEwN3KEtVJaQP4T9GA4VgOazYzSSq1mPZM8qh+NDS
         PJjA==
X-Forwarded-Encrypted: i=1; AJvYcCXIdFZNi3Kgu1oz69ZZapZqBei7HcDD3YPKpSUdk1rFFXFvsa3tyjKRDQAzNNgRUmZ0GavLX+W3MHU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFtryZllxw6GBHgIugJnU3yBxns9ioh23JBQ4vtyNlJnrqHgqz
	ZRFrYyjROTS6NlOhb4POoDBiKPir48Q08cA5+f0kMtK8OZe0h2ACtcNMSQP4edxpe59CbilFvzi
	E70CF4AeHlEb1+popz7LqfRDrPBNI8w4uiJR375xym2+vRtPVZRA37+KNn9hJyI9drc3/
X-Gm-Gg: ASbGnctg1pdEaoEXbNXkAo9wDM7f7wU+2MFe9ACwThUfCz/It6OzSggsupjptxW9lt9
	xQkNqL5mNb5zRoGMirkKUg/izceRNb1kEp/81cZJomRxX96l/BSwI49gqFaqLOXBWen9PmXsfaW
	0q9Bts6MKrIfACxP7vWHCKz2YORid0uUfntt6YFmkyKMVOA7K95qTe18iphYvg5IfVEsPYz+0qn
	ricbmbNoQr305Nn13fdooB7zq9hQDQ4ckK0OKcY3NDxZuPIm+6VfJ0mAbRGJpAW1ve6EX82lH5C
	sKzxLy1I6yFQvLuBr4H4/4UprkkvkvuHDEtSWM8mVaSmX05A/j/dvqeSNUq0ECY5uv98Rl5QQm/
	Rdac2tL1wGA==
X-Received: by 2002:a17:907:6e90:b0:b04:2a50:3c1b with SMTP id a640c23a62f3a-b34bc9720fcmr2205354066b.53.1759207643438;
        Mon, 29 Sep 2025 21:47:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrEv+SaLvycPTTXjkfI3gAv2L4ih/JXeTcfurbaylseRmIiY1ztu3a3eE7D6ASNch/ayHT8g==
X-Received: by 2002:a17:907:6e90:b0:b04:2a50:3c1b with SMTP id a640c23a62f3a-b34bc9720fcmr2205350566b.53.1759207643038;
        Mon, 29 Sep 2025 21:47:23 -0700 (PDT)
Message-ID: <64065767-95b1-4dcf-b02e-e2f1d2033c8d@redhat.com>
Date: Tue, 30 Sep 2025 06:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/17] hw/s390x/sclp: Replace [cpu_physical_memory ->
 address_space]_r/w()
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
 <20250930041326.6448-9-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250930041326.6448-9-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4Re8dlLC0TPRN7X-7KJegUQE4LCols43JOGPRhvWHjw_1759207643
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
> cpu_physical_memory_read() and cpu_physical_memory_write() are
> legacy (see commit b7ecba0f6f6), replace by address_space_read()
> and address_space_write().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>


