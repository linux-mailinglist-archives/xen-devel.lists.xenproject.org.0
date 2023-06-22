Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F31373A79D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 19:48:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553909.864764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOQ9-0002ak-4v; Thu, 22 Jun 2023 17:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553909.864764; Thu, 22 Jun 2023 17:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCOQ9-0002YA-1Q; Thu, 22 Jun 2023 17:48:37 +0000
Received: by outflank-mailman (input) for mailman id 553909;
 Thu, 22 Jun 2023 17:48:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3b9O=CK=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1qCOQ7-0002N7-KS
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 17:48:35 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02a28834-1125-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 19:48:35 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b47742de92so76264961fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 10:48:35 -0700 (PDT)
Received: from [192.168.157.227] ([91.223.100.47])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a05651c020300b002b4832d0c8esm1421362ljn.118.2023.06.22.10.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 10:48:34 -0700 (PDT)
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
X-Inumbo-ID: 02a28834-1125-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687456114; x=1690048114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqzSwhmIqLC0pNAcU2LtSNI/E1J8NE7gvDvKGn+6LZQ=;
        b=zuKhnA4x/RPSFsbRDJ0d4Ftiske/KmneH55J9Sv9/ZNVVwbQ3icFYY8MVzx8/+V+SR
         4px+9lMVNc6S6yvGsRMvceKngfoW5pSqqDQQYha/GLw6t5fgE82RkgNXPjSfLlIUq2S8
         74Gy4qNIB83KfhY9VgP7FhCVfKwLiYQM5/Gq9OuvUnzhr4ChZp+/8xcqVOjBMc5OMnXL
         7lZZUBotN2tra15w4fQs0CKbHFSzkmjl5gWKDqCI6yat/f3cTNUnlkQKgFQcHajMXIlS
         Rc93JrOx+coCGdYDTXciBqhdaAn9GSwr36eB+HAU5RTRzwbNQhV9G5MhDRblA/3DLi9f
         Wsmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687456114; x=1690048114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqzSwhmIqLC0pNAcU2LtSNI/E1J8NE7gvDvKGn+6LZQ=;
        b=hrbfvzfPT+pwkmYzqDkLyZf+Z01+NbBvdNIF0AEGkaEDHroPSkqDCHaFaqh0q6hvEo
         Vx508gpI3ul8axtXzosaHQF39CLhCINUWouSp0Vc40dmAjGbtHnurmhCRrNArU9a8W/b
         QmPIeNVnIDi/coYS4NYbA1pBC11+a5/PgKFnkthV9wvpY+C2t9vLOUUF6jT5Zd1e7uq1
         JAIH4/7fu3TaUvocfBJKDxQHsk8wouUFIx2s+Ynqf2xDhq4xCWR5i/oFZGJSiA3mAAqE
         qV+cnD/w2E/I+AkLyv8YyLCwkmmD6vut2BvccVENp/f7yWPnVgrUR3qcyF0ospNdY4ev
         sX4g==
X-Gm-Message-State: AC+VfDx4JtzooesHEvTs0nU6dvbtTjuVBucgwAywO9nP72K1u/wxpcRK
	x5SQlVhIkDide1+J9XC/MKWu4Q==
X-Google-Smtp-Source: ACHHUZ4yU6Z4OBHWNZinbZubWOW6GhuB/jEGytDVFOrPmlBXaknK7EKzwKrqWJRARRFro1oeE4SvtQ==
X-Received: by 2002:a2e:834b:0:b0:2af:25cf:92ae with SMTP id l11-20020a2e834b000000b002af25cf92aemr12328492ljh.22.1687456114734;
        Thu, 22 Jun 2023 10:48:34 -0700 (PDT)
Message-ID: <d1d63ac7-b0dc-4d8d-73ff-9b693ca163c2@linaro.org>
Date: Thu, 22 Jun 2023 19:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 12/16] accel: Remove WHPX unreachable error path
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Roman Bolshakov <rbolshakov@ddn.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 xen-devel@lists.xenproject.org, Eduardo Habkost <eduardo@habkost.net>,
 Cameron Esfahani <dirty@apple.com>
References: <20230622160823.71851-1-philmd@linaro.org>
 <20230622160823.71851-13-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230622160823.71851-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/22/23 18:08, Philippe Mathieu-Daudé wrote:
> g_new0() can not fail. Remove the unreachable error path.
> 
> https://developer-old.gnome.org/glib/stable/glib-Memory-Allocation.html#glib-Memory-Allocation.description
> 
> Reported-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/whpx/whpx-all.c | 6 ------
>   1 file changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

