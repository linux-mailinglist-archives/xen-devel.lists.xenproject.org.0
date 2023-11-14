Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9A77EAB02
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 08:43:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632167.986269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2o4l-0002Zt-Rf; Tue, 14 Nov 2023 07:43:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632167.986269; Tue, 14 Nov 2023 07:43:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2o4l-0002XF-OB; Tue, 14 Nov 2023 07:43:11 +0000
Received: by outflank-mailman (input) for mailman id 632167;
 Tue, 14 Nov 2023 07:43:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6V1E=G3=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r2o4k-0002X5-6m
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 07:43:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 741257ed-82c1-11ee-9b0e-b553b5be7939;
 Tue, 14 Nov 2023 08:43:08 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-543456dbd7bso12680082a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 23:43:08 -0800 (PST)
Received: from [192.168.69.100] (cac94-h02-176-184-25-155.dsl.sta.abo.bbox.fr.
 [176.184.25.155]) by smtp.gmail.com with ESMTPSA id
 er22-20020a056402449600b0054130b1bc77sm4739041edb.51.2023.11.13.23.43.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Nov 2023 23:43:04 -0800 (PST)
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
X-Inumbo-ID: 741257ed-82c1-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699947785; x=1700552585; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGJSh7ARTE57eUspw2fZ/Y9FEN8W9w9Q7cghnGFYjQE=;
        b=LghYQVKFsIcbnhRHkXTK8LGZJ16rmxPUb2AkKQqgq0J+e/DKajLD4kEpYORXOsBCqH
         ehc3rCpr4zffkN2yUxPR/ZbpoAjDRvlwO+wpKTGd6zrWX7fEpd1+7Ir4RW1SMQjsN8R5
         RWozjhE1LMS3Qm+vZaUl/Ea+u94t2USlWIHX7IdW7hN58zFksD2NWtaFmdJvp2nQefUY
         xlYZotHh+UmNCgSgA+AITjzdbQU5fDlSZvSPAHPmZywMYtk1fxsrShuGrN06Q3o51ctG
         Mzjtws8eTP1b2EPAZDI70Y3NeVnvRcicjBM4Oa78hm7cnen0MmxnnevtCZfm4NSn+ZzC
         2BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699947785; x=1700552585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGJSh7ARTE57eUspw2fZ/Y9FEN8W9w9Q7cghnGFYjQE=;
        b=LGVJ6HbXPa2Ifwpnl7r6uunWYKLLQXraJ5bmLDozo0u77RZ0xjyZU/W455hfO0lKWh
         dvzdkN5LwEG2wkNEN1erQoxKN3Z6PoYDnGPwTT+WtpdN1ZnokZxfuK0bOnzudZwAlpcf
         9/A5P2yraPn41aCDixSGHqCY5Xno02VbN7yEBL662Kx1gYxYC9Uub/lC6XShgYy4TWuO
         NfRlnL104ZAVMYpaZtbO78cZGMU7dD3Me8jvN+OQgikw+LKhWfYEPOSbFWQUJ4qaqzhj
         z2IVcR607HFeF/pCKs52MMFfBtBSPzXryTNeE9CPsqelYtZP335g/zSwTMeiHrQBJldT
         88Og==
X-Gm-Message-State: AOJu0Yz11yuxAZEihxppjCJ+RSwWIZqWxfQGfqMa42BZAyi4YipErY0H
	9YAtx2+sQ0ywhz87jgxxQz8QTw==
X-Google-Smtp-Source: AGHT+IGc3/NG8UqFInjKsnJ47x00sT9L6VqttZpc9DaeBplNVfbIFLh/QxmAKcqUI5QOxgCuVcfEEA==
X-Received: by 2002:aa7:da07:0:b0:542:ff1b:6c7a with SMTP id r7-20020aa7da07000000b00542ff1b6c7amr1704591eds.9.1699947784705;
        Mon, 13 Nov 2023 23:43:04 -0800 (PST)
Message-ID: <987f44c2-0fff-471f-b69a-fac0da5794df@linaro.org>
Date: Tue, 14 Nov 2023 08:43:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 08/10] system/physmem: Only include 'hw/xen/xen.h'
 when Xen is available
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-9-philmd@linaro.org>
 <1681041d88a9f9062170eb6599947e24424bf37f.camel@infradead.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <1681041d88a9f9062170eb6599947e24424bf37f.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/23 21:03, David Woodhouse wrote:
> On Mon, 2023-11-13 at 16:21 +0100, Philippe Mathieu-Daudé wrote:
>> "hw/xen/xen.h" contains declarations for Xen hardware. There is
>> no point including it when Xen is not available.
> 
> ... if even when Xen *is* available, AFAICT. Can you just remove the
> inclusion of hw/xen/xen.h entirely? I think that still builds, at least
> for x86.

Yep, also on aarch64, thanks!

>>   When Xen is not
>> available, we have enough with declarations of "sysemu/xen.h".
> 
> ... and system/xen-mapcache.h
> 
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> 


