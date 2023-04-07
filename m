Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D022F6DB6BC
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519116.806333 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv5T-0008BT-4Z; Fri, 07 Apr 2023 23:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519116.806333; Fri, 07 Apr 2023 23:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv5T-00088s-1Z; Fri, 07 Apr 2023 23:01:43 +0000
Received: by outflank-mailman (input) for mailman id 519116;
 Fri, 07 Apr 2023 23:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkv5R-0007Nc-SY
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:01:41 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27981dfc-d598-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:01:40 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id q102so40802556pjq.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:01:40 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 l2-20020a17090aec0200b0023fda235bb5sm3162546pjy.33.2023.04.07.16.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:38 -0700 (PDT)
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
X-Inumbo-ID: 27981dfc-d598-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TyPr1D+jmxon9z6cKE0o6xLl1ClF9NGYyNAHslJg3cw=;
        b=qw2wYpt5HKJz5r2a7OsRAzIXXkpT+qRLgdZ/nuCwMrIJrOzNH3fD9ex8LmkqgpG98t
         P7PSjtCmHjdONgfStzQ+Ft1yGw+mfPAJthFu3pkWjLS+Cx48M7Vchp8/VYXnCx8F0Q2l
         rMqzBqzxBQ+l/wpnRRrS/rTAmA759a2Cy1DvVHxMSI3cQ01dOcepbymKuIRh7i5+Rj3y
         2E5GOExso1G5XPyhGSXfoim2hbUkG2QTnQTTe8bwyEhXxDoEojVOcZO2EHhYS1wbqqGZ
         YjJzG7gBuAZ1vZfTsQ5mtob4797mWInf+aP3yIRHgPoJedv7oF+XRHI69l3pt0FE3cNd
         WV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TyPr1D+jmxon9z6cKE0o6xLl1ClF9NGYyNAHslJg3cw=;
        b=5Nv2YnOaUPSyVfNAU5+T6mPGNcdg54VgISDv3PbHoMA1TNdXuLkEpK/jkjgLjSb6jO
         diFZhfCMm8NUNEwYRKjVxJQRS9vJFPDk+B/RgmeXL17d/5WNYG3iK5KyIpCl6o0U5HPK
         M2ka5debBPzKlLk9ZrA5PFqqbriqCb3jpv5d3a86uuEvDkLUs0VXESiaYrurlGLKL1iE
         yPEpxeDWihzwLgC3nDMkLCsHU1r2v2vZJ/blv0C1ORmXN4nP+fMZO2NZX6DzXh30uL17
         z3tL33fYzIQ7oriln5lKyFFBeybgPNT/081WmIMrpDPTSyKYZKbKCpkAL0tW16upOZuZ
         PR9g==
X-Gm-Message-State: AAQBX9eNu7cb6qA+EWmGAnJgzhs7G5m88+CnFMuuFa7WUnUnnAMQLD8V
	KME7XS3TbtMnoNhdlgoTsejV9VamNSiMgNhW8SI=
X-Google-Smtp-Source: AKy350ZQLIgsGvtQbrBz25NftlqZ9SOXyQK0RAxFlNjlFwKEYf49WMV87F8ttHZLtHbQzsn5rLkPTA==
X-Received: by 2002:a17:90a:34c2:b0:246:6b3e:38dc with SMTP id m2-20020a17090a34c200b002466b3e38dcmr1539291pjf.10.1680908498904;
        Fri, 07 Apr 2023 16:01:38 -0700 (PDT)
Message-ID: <ba69b6b3-1b4f-6cc0-34a6-4c19fa3dbb8d@linaro.org>
Date: Fri, 7 Apr 2023 16:01:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 03/14] accel: Fix a leak on Windows HAX
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-4-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> hThread is only used on the error path in hax_kick_vcpu_thread().
> 
> Fixes: b0cb0a66d6 ("Plumb the HAXM-based hardware acceleration support")
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   target/i386/hax/hax-all.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

