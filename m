Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E0C80769
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:29:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170481.1495549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVhK-0004hh-39; Mon, 24 Nov 2025 12:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170481.1495549; Mon, 24 Nov 2025 12:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVhK-0004eY-04; Mon, 24 Nov 2025 12:29:38 +0000
Received: by outflank-mailman (input) for mailman id 1170481;
 Mon, 24 Nov 2025 12:29:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNVhH-0004cg-Ua
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:29:35 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c6f57b1-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:29:35 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso32714165e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:29:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf1e86b3sm227919165e9.6.2025.11.24.04.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 04:29:34 -0800 (PST)
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
X-Inumbo-ID: 3c6f57b1-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763987375; x=1764592175; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq8T8Ut7nBFs5m+qS+nnXIlDrchpr4rx4FlUw159pzQ=;
        b=Dj+guRVOYaQ9bQKHQVJoOEWdDghkgBJkpMQfhbocHbovraVH+YBjoCaWVtESCIN+Vp
         Gto58n2Is6sLuTGJ6e+levYUSZznrtEspDc6Ws8jZWRovJmQGyFjK5KLq8a9ix39fTqo
         Y2gzK9H4PAkG0eSXtE3dxzTwKr57dmriUO65SDeQutN10rFothdTxGvKC21RdEDN/sZJ
         Wy4KDBXEGtWEwxbCjC/h7qnL5CZPzQyQAhjQ+oosxDzg2OTmHhJuVe9bnBmSfEJFed8y
         zzaRiSq+NNkdpdG4XIf5h9rzUrweoMlpiQKJaNtbhCrkWHjgsGZcJH+77C7k3hSxaOHN
         sPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987375; x=1764592175;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq8T8Ut7nBFs5m+qS+nnXIlDrchpr4rx4FlUw159pzQ=;
        b=Q46D65ovc3/lq73letOmXdnex4i/VOqNhVeZroXymAmAVUhkGDPayrC6EPTkHzSMBi
         +Moj/YBG/Ce/PrCGVicfkGr+Hq+zlsFORnHNiaduYMIJRpZpAn2h2RwQyn10NipTQN5c
         z44fBFTchlSLe8/dUmRtkqx9yBOUlq4hflxvqaWTBryk6Tq/F2sPjhwKXFtlum5NlnCw
         KJ3A856GAtIPixxTbwUT8iAGnx3XYJ9aOar2NApj9gQx1GIiDGWxiinVVxppqX5fsVee
         3Bc1UaFV4sHn7/Ej8gawPZwdOOm1D9nYKFl9C4hq4DwygA1LHz8alZ/JElZF/XMHP5Ku
         Dc6A==
X-Gm-Message-State: AOJu0YwLAibqOjX+elPPJUIEUM+EPfYtIQci7bYFzryhQTml4s0lKpt/
	J2QhRsFAh8ge2/myerHkuqWwBBJLU1Ddej3HNCpeP7UthILEc/N3fe2Rtsc3Hezw5SnijHEhpjx
	Luuw=
X-Gm-Gg: ASbGncvWP2pU0hi2JAqpKXkDYpU9m7q6c8abFrJ23MGz8Ypn2gK0PspXg2zhtG5Roaw
	UkcwoV9MmjKUj593Zc20Oj3/KmRy3YclHnljgYwQAx4WZ1Qmbv8VNP7ZpFS+tc0YbM0ya3ujiuH
	ebOV/x5M/1715CSqjLz+5P2T60hmow1NMD4ZIseCfylbZxq9EYxBEvVJYi7cmMxXRfWsZ1Z3vJ0
	NLAiGFLHrIB0J4nTnBm0BfKVJsK9u+QzJWZ6lFwYUWt11YPDWK9ubzBgXSLkANY3fhxMkhi1dLi
	X4rtAP1SjqjcDR5cv6hvRHFDHEr3Jeki6f6pgR9GMCgFKGOO4zIVBcLZgR4duuDg7JE+NKcJnUq
	5gccx+YEsPMF1T1l2Co6NNjQTMbwX4K5bWm9icptH++1gC8DsJwZQACL5Cjg4uS5GVWWecgf2XI
	eO3Xibm3URF71heefGXUjf0QBY47eXcTD0JLPWR5UvPLurR44HCyXO6yN5fQK/rxpOAFIK6gEI3
	hQ=
X-Google-Smtp-Source: AGHT+IGwloRQ+kF3xPZB5o2a3bfC7PgT7rI3XJAc58AlNPaD713BOvTDDEDqeqGNoHEIaHs6CrLuNA==
X-Received: by 2002:a05:600c:642:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-477b9ead384mr94298145e9.8.1763987374786;
        Mon, 24 Nov 2025 04:29:34 -0800 (PST)
Message-ID: <96e8cf62-987e-45fb-9463-8a3069d346f4@suse.com>
Date: Mon, 24 Nov 2025 13:29:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] x86/vPMU: move APIC ack past the handling of the
 interrupt
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <5ac2e9b1-81f2-41d9-8f05-d546a49c43a7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

While benign as long as it's using a direct-APIC-vector (handlers for
which are called with IRQs off), follow the more usual pattern of ack-ing
the IRQ only after handling it.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -1319,8 +1319,8 @@ static void cf_check error_interrupt(voi
 
 static void cf_check pmu_interrupt(void)
 {
-    ack_APIC_irq();
     vpmu_do_interrupt();
+    ack_APIC_irq();
 }
 
 void __init apic_intr_init(void)


