Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A348A5B9BC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 08:26:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907234.1314492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru0O-0005Sg-IV; Tue, 11 Mar 2025 07:26:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907234.1314492; Tue, 11 Mar 2025 07:26:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tru0O-0005Pw-FL; Tue, 11 Mar 2025 07:26:24 +0000
Received: by outflank-mailman (input) for mailman id 907234;
 Tue, 11 Mar 2025 07:26:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+cUl=V6=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tru0M-0005Pq-FG
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 07:26:22 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20d16e62-fe4a-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 08:26:20 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf848528aso15548545e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 00:26:20 -0700 (PDT)
Received: from [192.168.69.199] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd8b0548sm176538855e9.6.2025.03.11.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:26:19 -0700 (PDT)
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
X-Inumbo-ID: 20d16e62-fe4a-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741677980; x=1742282780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WBH8un9SN3jvdF5o16jBTUcJYgDHmjsu0gBD/ioH79g=;
        b=yWcA7RR4G0r8VzdI6KQPRb9EJlfhycN9Qoy7FMl8AWMfcx8wJThs/bgMo0TYI8uycN
         4kVmVFksyBg2gpJo/KAfgF04E/dqONFFKD0cdynhqcXjDP/z+XTTSHYPqDQlb8jMK2Ow
         V3RLCWd83VIMJZgbthZJjyxzkFTFDq5hApbrfZ8GU3wz9TOeIjK6aC1OlsmQIMOCt5Rx
         WkMnYDi+arq2K0dZhmfZ/5SHGIZZ/hqd/CbXGOOAuoSa2rtyS7ggUzhvzf/ala4i1a7P
         YV8da/0aEKoGNnZI2hlzwJYDfxdoSWMiJW55LIvqrPf71flVSNJHJh94sGi7DewyBgLm
         dq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741677980; x=1742282780;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WBH8un9SN3jvdF5o16jBTUcJYgDHmjsu0gBD/ioH79g=;
        b=rCZ3r36yVgSJGqhph6FjFDsu3rMJ/3GI5eDf+qrWFeSzxxtrA62xIvcp11qK5+jFCa
         Gv9PpY9pwWBrZoOIhQVj8TYI5Q5334kN/19nSPEp9GHf83Nzf0yuKiTCJc10CXNSLP8F
         dQbrZe7ib2q8A2Sx29QiRDy//dgVhiLOgkM5laWU8ahE3hgXK5zveNq15k6RHRIqsWuG
         3VMbRV7BSqV+rC+LRf176ZpJpALaQmuOMPLzWpj7fi8tMQYouFWO5q0oFsvFhQ4TuYFs
         R0KA6lwwuIex9WthNeEt480CtY+oEpPYAh4IIUAZ9tdAkHQgCGd95hfW5wgvZ+h9grb1
         3NrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDxp7qGaNA/D5dLyAC/bTc//5UEDgCTpGWMfJCFYKzEmHo4EvL870GB+qKxPS3y9XQr2MKS9xpclE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzGK4oErbLw1XVVuFUikOTdJdwfaFspDTdDKnzS5gf+jn9LwOxh
	jbGHumSXev1vaeX2OFcs/h0+rfLGvghWTxtrCH6tk9iEctYBh3n1ihM4aoAt2gA=
X-Gm-Gg: ASbGncsTPfZh+DpSKJkALaERNRsTuig72lxsElrDRFpfm+SjzGmxqQwDxwHYOzZqosB
	ZdVakSlMJj+vvJFLL6Y4AhiJmw8+MBUcucp5P4SVcXrSBC/i09jV4ipJAXUfrntVeFWNn1/ZbTQ
	WX4oASRX3/745Sc6nA9FtzEl6lwJ2eFvD+kERt5uoO1P4cdAbBjdAUflyhT+I7If6pubHh0Amk9
	Nr9iJr4RAWcSphbQr1tC/VSxWcY3reoRp0aOGrkWlTGJPsqGaWKZ5v49pEP/ZB2t3V/4T1qT+23
	IgQcGVONyLLMffHW5awo10XfLaaX7XoZ89SUKso2xGLCSeTmsLTwGYLihIkfKEsZaKmq3J/MfJC
	h2mCUVjY2S9UU
X-Google-Smtp-Source: AGHT+IGFEKvevhRYU5jwIA+OF5lD7GqYNAbzux+l1q3TxUHSloakvK6wXKgncMmFM2y1SaO/Ty9ZZA==
X-Received: by 2002:a05:6000:440e:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-3926487d48bmr2239834f8f.30.1741677979924;
        Tue, 11 Mar 2025 00:26:19 -0700 (PDT)
Message-ID: <f0c7b0ff-a43a-4203-aba1-2e06a462771e@linaro.org>
Date: Tue, 11 Mar 2025 08:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] exec/exec-all: remove dependency on cpu.h
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 qemu-riscv@nongnu.org, manos.pitsidianakis@linaro.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
 <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250311040838.3937136-8-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/25 05:08, Pierrick Bouvier wrote:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Missing the "why" justification we couldn't do that before.

> ---
>   include/exec/exec-all.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
> index dd5c40f2233..19b0eda44a7 100644
> --- a/include/exec/exec-all.h
> +++ b/include/exec/exec-all.h
> @@ -20,7 +20,6 @@
>   #ifndef EXEC_ALL_H
>   #define EXEC_ALL_H
>   
> -#include "cpu.h"
>   #if defined(CONFIG_USER_ONLY)
>   #include "exec/cpu_ldst.h"
>   #endif


