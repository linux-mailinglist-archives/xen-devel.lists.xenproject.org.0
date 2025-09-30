Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 881A5BAB704
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 07:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133700.1471772 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3STR-00079c-NM; Tue, 30 Sep 2025 05:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133700.1471772; Tue, 30 Sep 2025 05:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3STR-00076U-Jv; Tue, 30 Sep 2025 05:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1133700;
 Tue, 30 Sep 2025 05:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MVVz=4J=redhat.com=thuth@srs-se1.protection.inumbo.net>)
 id 1v3STP-00076O-SL
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 05:00:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dc89bf2-9dba-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 07:00:22 +0200 (CEST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251--tRg7vbRNpus1nQvU_A70A-1; Tue, 30 Sep 2025 01:00:19 -0400
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-61d31626b01so5072119a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 22:00:18 -0700 (PDT)
Received: from [192.168.0.7] (ltea-047-064-114-056.pools.arcor-ip.net.
 [47.64.114.56]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b3d277598bdsm449199366b.3.2025.09.29.22.00.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 22:00:15 -0700 (PDT)
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
X-Inumbo-ID: 5dc89bf2-9dba-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759208420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3xiFBQZdSxrBR3BZG3caEthJ8AMJq39BtL8Q95119s8=;
	b=SBHh2B1ehjS1OsE30nl6CgD3k6znH4lD99OSLoKnvcnIf9e9c1WAJOKrdSIyCWxt5DlAC4
	FHObzVciICIGkrhnu278WtHBGjTshpuyFloJQFT1BvO0bD/Q5PKawlizcYcLxKF0puBNuX
	wJ/j3yeSn2EagKkoORldU9/IuLIw8wU=
X-MC-Unique: -tRg7vbRNpus1nQvU_A70A-1
X-Mimecast-MFC-AGG-ID: -tRg7vbRNpus1nQvU_A70A_1759208418
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759208418; x=1759813218;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xiFBQZdSxrBR3BZG3caEthJ8AMJq39BtL8Q95119s8=;
        b=bN5eVhI8fV/EDMoJFbuQIBFZBLnpQD9FsYYnI6WMxMH9UAXgIcvNXo8FG3+LDJyFzf
         PCI0L3cnBGM3Hyf91z1br9gtQYKm7H/iubQ5QWjJ/USE4BnVZcfhQ0PDYP3pgc/PZmqW
         cT/uHmUUqVAlWT/PWDAiRgXb0KRQeVvC5coDW9pACafc5i9uYjvzoh9ytr5uMt7gUrgP
         iQfqWZNTgAyNiAd2wFvHUog5oV1f+Ysbdb1Pz0lKqC+Fmaf1zxH5tQz9Xgbb7+Q4nz/2
         7f17YYL5xlstIPDCqmKtApRnRk+TlQtRF3GxCsdBVqUlZQe1+DSaa2Sda+FPtlTUBard
         hVcg==
X-Forwarded-Encrypted: i=1; AJvYcCWmB3tRGyhfUVpYgZOM9Cug3HLW4qycE7lVCYBqjN3fbR6BlGnO8PxPErqBeNqOYEN4WJTUhoDf9sI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMAweozXIEvZmWbzMWbPX8PT8DZm+MlOq/3G6UDcnaDaSWa2UM
	wirb8K3026dUHdq0brt94zHj+j4ivDrbr1dY6PA5aodgAEMZxNJrTubRNJ6S5qwQbdvYYedp9vY
	lHPpwv0R+UaE6FZkrgP1U+kGEEGOUFJUwRooFwKNpSd3q8ID2Bm1tmFkgNlzjlQ6NOzUD
X-Gm-Gg: ASbGncuXyCTahfnEycGhlNkdqAdjUutuY4e5xRJpXiE+CaqKzj0ZJo1WHXLMLazJg4R
	3mZo7I5trplee1Tyf2hkgWfgp/ebImgyhoVSl/frwzQRNXYBHCfh428JNyF0zvzvnZeVwHVuzO0
	7f1KN4mhiBpYL6qo7WnC1Te1RGwKkYzJfqhQfIDt/RDpGWeIFdSZh8mKgUojoTuoxYa/bwRnylP
	JPF2LzFxk4DW5/V6Aw33xa9KBHe+rQ5nxARO4tUx42gwmbUGH6xJNDymD5HAb2OXkZlSQqt5ch5
	zjWP+XpT9VfzIhzj0te+eD2xOnNnhvZegcpbMfwlnf9Kbsfea9aIydCVza2RpQN2g6apaoeZsAh
	Phjra/TCB1w==
X-Received: by 2002:a17:907:3da6:b0:b3e:f987:d6a8 with SMTP id a640c23a62f3a-b3ef987d997mr637744366b.44.1759208416626;
        Mon, 29 Sep 2025 22:00:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa8KgJhbAbV0RRCkwD4pI/pD3HkfND1iGeihF86L8+aCZePSj+3WOJ+3YXP8Jeay5jFXCoTA==
X-Received: by 2002:a17:907:3da6:b0:b3e:f987:d6a8 with SMTP id a640c23a62f3a-b3ef987d997mr637742166b.44.1759208416253;
        Mon, 29 Sep 2025 22:00:16 -0700 (PDT)
Message-ID: <6c7d7a37-c7e1-44af-839f-7d6d01fc843f@redhat.com>
Date: Tue, 30 Sep 2025 07:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] system/memory: Factor address_space_is_io() out
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
 <20250930041326.6448-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250930041326.6448-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ab_Aoyl0h2ot4E2viPxZxiJvsjn1gCbc3Th8C2JQL4w_1759208418
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/09/2025 06.13, Philippe Mathieu-Daudé wrote:
> Factor address_space_is_io() out of cpu_physical_memory_is_io().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---

Reviewed-by: Thomas Huth <thuth@redhat.com>


