Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC5BAB51A
	for <lists+xen-devel@lfdr.de>; Tue, 30 Sep 2025 06:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1133517.1471706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmh-0004g5-P9; Tue, 30 Sep 2025 04:16:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1133517.1471706; Tue, 30 Sep 2025 04:16:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3Rmh-0004a5-AA; Tue, 30 Sep 2025 04:16:15 +0000
Received: by outflank-mailman (input) for mailman id 1133517;
 Tue, 30 Sep 2025 04:16:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MDOg=4J=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1v3Rm3-0006tq-FB
 for xen-devel@lists.xenproject.org; Tue, 30 Sep 2025 04:15:35 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1cbf9552-9db4-11f0-9d14-b5c5bf9af7f9;
 Tue, 30 Sep 2025 06:15:35 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so3873877f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Sep 2025 21:15:35 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-40fb89fb2fcsm22030581f8f.22.2025.09.29.21.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Sep 2025 21:15:33 -0700 (PDT)
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
X-Inumbo-ID: 1cbf9552-9db4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759205734; x=1759810534; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+gM01wdk2UseDL4pB4Fgwz3uSs5dQf4zrjZtOq7eYBI=;
        b=rwtv5pavX2EDdtqvo0dMFC05NB43px9OYAWyAcU3V76E6ZXLK3QcaN5CUshWPEKFV8
         yLoac8rpQmYlQ2Aw+8KNaktaFsl74CePNq502svqhPZFZZuqjdiI2LdZwNo1ND/3J4Jk
         ZcQwJV2WC0dx3ExGA283/MW2r96yjKluQzG6Th5GJpAFO4knxgOc3hf0pC+9eI2L8ieU
         GHJPTt4evrkDhGo2F/J876e0gYlkGAfDXcPicC8Yp1gOdV7rwfccAvCKE8tJgxxAvXCl
         Xvca6v5gwO1RAaxx+MyhohaV4ZguF3WUFsLM4nVyOp4Pq1d0yJ/WGOzP5RYE5KEBd1Vf
         yRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759205734; x=1759810534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gM01wdk2UseDL4pB4Fgwz3uSs5dQf4zrjZtOq7eYBI=;
        b=abMVVNA5TWU80jEr0Ko6630pCGRfK6j+UqcVtdOAoiL3EokgkPvbXfvsYfZm6JUI4U
         4Mtmi20n3eXs4UVeE16AvEpOafaxBmxBWV2akUaUXrBH4rNYHUzdhDsdCCPsVi3anhNX
         Y2Bkj2e8dM0Xrs8+f6L4FVxTuCgHkBxTnMMoz1wJmfMAk1JZwhUND+dikadq15QI1McR
         N5cie0zIKExbHr5G6KH6lM+QatdMxmdvxSQeaVuGNeep8OdCsEf2D9bLru1z3zCI+q0Q
         T+IMVJE+dUkNNNMcy9R5XK/KwMsVYrc/Xyhq20BxgMvjj0Wikuqk3qMcKnvUXk4KhRGu
         iUoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzb9VjKQ/H2nVKCiza/LIJUf8unTWZbT/+d+RjJZ+RNupQKdfE7UsMAMO7XCc96SfUQgJLUIEIZLU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw0bFfyxKIx9t7xKthlO7xrwJP6wGhLnrnArqTb9aKeb0qWuUjP
	MTE+gMULE9cDs8omvejpzj175E7P1RWjJt3LPyyaSoSysllB2sWz+tUefmhQkboWTiA=
X-Gm-Gg: ASbGncvNhah5sEtJ4Ejhd5zNNJ3TAmc2piNUIEnxcqoJVkFoW+AJHe35XSRcR11rwZL
	8idKYa0YpkRuVJrOFbBZC5pGCs1ukIF7fa3NQd2LYZmuASQ3IejCI1zNSEX4hD3CLvayyoGAMi5
	UBzB4LhInC/lMJ7iqI9fuQ6YF51F2sLiDXRR5kh4I9uBbuDyhasCPNnjqttIMVsSMUaiv85LYOS
	CZVZWCQ/OndWnhEFDwEGH9ZOp4L2J3V1mIOwXwbdwnCJ/QtoObtLRUGOiAje1sJIiLnIpjL3ceE
	vyumylXdsd9fLXrp9zrDj5qBN94p2T2Xd96HlGCNYLK6haXkM7HNGGy4UrtVg5JUHCcWjABBroo
	JEOQB+dg2kpKcS154b3k0snqdCCVZFt2IXPjZ7MEbRBqlhd9ZItqdeovsUZaPWigu5dxO6hfxgs
	Oivk/cNPsf/5PSEO16dZzl1io8
X-Google-Smtp-Source: AGHT+IG3+NO8caXmgDpmIXUT4U2a38OsXEUMyu+A/7GxYYPazyV8IqumGfAwZ8JxEPW+ODAlASvvgw==
X-Received: by 2002:a5d:5888:0:b0:3ec:dd16:fc16 with SMTP id ffacd0b85a97d-40e4bd186aamr16627860f8f.43.1759205734391;
        Mon, 29 Sep 2025 21:15:34 -0700 (PDT)
Message-ID: <95145136-7d86-4fb0-a93e-f23af9622ea6@linaro.org>
Date: Tue, 30 Sep 2025 06:15:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/17] system/physmem: Pass address space argument to
 cpu_flush_icache_range()
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
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
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
References: <20250930041326.6448-1-philmd@linaro.org>
 <20250930041326.6448-8-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250930041326.6448-8-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/9/25 06:13, Philippe Mathieu-Daudé wrote:
> Rename cpu_flush_icache_range() as address_space_flush_icache_range(),
> passing an address space by argument. The single caller, rom_reset(),
> already operates on an address space. Use it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> ---
>   include/exec/cpu-common.h | 2 --
>   include/system/memory.h   | 2 ++
>   hw/core/loader.c          | 2 +-
>   system/physmem.c          | 5 ++---
>   4 files changed, 5 insertions(+), 6 deletions(-)


