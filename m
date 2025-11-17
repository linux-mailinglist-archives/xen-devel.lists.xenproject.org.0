Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA10BC64ACF
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:40:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164127.1491138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Or-0001gE-4G; Mon, 17 Nov 2025 14:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164127.1491138; Mon, 17 Nov 2025 14:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0Or-0001ee-1B; Mon, 17 Nov 2025 14:40:13 +0000
Received: by outflank-mailman (input) for mailman id 1164127;
 Mon, 17 Nov 2025 14:40:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0Op-00079j-48
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:40:11 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5108964c-c3c3-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:40:09 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-640e9f5951aso8493010a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:40:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8d69sm1082524466b.50.2025.11.17.06.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:40:08 -0800 (PST)
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
X-Inumbo-ID: 5108964c-c3c3-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390409; x=1763995209; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5uOHVwkR4wfmN/82FZJU7rBePSTRT32bVOhGvFMjl6E=;
        b=OX906PjD48P3Gg0a4DIAIDtzLpa2HF95lj3cqS0IBCHUJdcGpnlzkfsUMEKTdCsh6G
         eUCoyw+tFzTVv09bw9aAogfrQtZH5H4l1zb5k7wdaM0ppDAOQVKOAI7X6OFLY8ZXR1sR
         3mR7wnwCR8XTFn5fBaTNa4ECRj+M8XXeUBM3trafGKg9+xK02tBCEF8qPwpy85+Ywnc2
         dreDn8dNQAZlyunlQ1y330Z/iC/tIztAdYYb1yTtDp25+Ow+TNr/ITgDZYRfFlKYLrVB
         PtG+71xt4Uw2hMdfSOcDmhcQIt4gP28cm/ffJ4dSVaOIXJQ4PcsGUPHh+ZqivBF0lOkI
         Bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390409; x=1763995209;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5uOHVwkR4wfmN/82FZJU7rBePSTRT32bVOhGvFMjl6E=;
        b=nGfwB724ldz1CxdqqjPg4fJlPoSPxFIAbkC/YFnCDOW3AzY5zoyx92VmjocK66xM3w
         jkm5+QbY6ixikk5pIVy9ORUWqeP8nEeRKzJQTSrUQQOh2tzsiYSpdVAzH+zkMvQ7W41u
         lqUPNpfBiRW6zv6+OgP6W0bh9rEbIFfWoClFjrPiBBoSej7Do4H4NY4milhEk3rxMmrD
         pZyE7iKQu/DNE4YCGyjS2TqQqCMsOUSVObSrR42qbkpQYWQNZkY2JT9sMmJUAXFvPkIw
         t0z8us5fs35wRxdIpz+awuh5XaV2QVgIhR8wY/zHv/RddB1JK6MFvh/FDz+3FFerc0Yt
         RssQ==
X-Gm-Message-State: AOJu0Yx27I53kh3gTnqQ6lavcB6HE6itLyOUwQqkWSYyHSaeOTUko0WQ
	XqYxct/yL+KkZmW8s+8ZaNXqa0452358r+dfMuwlDq6jXfk0huU8dcmkiHp6RjKyfatoH9gW6Gg
	HOJs=
X-Gm-Gg: ASbGncvQuuiB6+JcCBEEOSfzN5ROgloQoV05k2yvUy0O0fM+JXuDafcctPl53ujXrcd
	88oBsMTJsQIIpklPc6x/42d5pr1O6LREmUq2NXEkm1mQAxjwUR8JW5vp39AYT9dPeP0FvWCpCuo
	de2yKUYYSSmdRSIb4uzSsdTKIOFYzTId5yQWKoNXsf3Xr0NX4ufviVyuSDew0qHMaXOhdIv9M1D
	UXkTLEoWyokRILsX5mmEiD70B28LL6xacwzE76fTOtxzocyt/x8ktdlhWuy6sbKHD29wcYwDaqx
	YNlx7u618ipdiB/P2oFqsfzrLkdup09E+dkwB7irDn5oBPLA2ROiyFCAJFR3pCQlBfqelan80l+
	NGHxbWe6wXM9ruJ0aAkN/GivhDy3oUQANaOsjtjBJvIf0CkrMQBRxGswYz3PQoVr8ZYWNSqOWIi
	ymHjMeoByQE1a1/LzFFFaSwwRLcSIurMYhho9EXt0VbILdArVSOqfHJ9mJ2jZTWlrI
X-Google-Smtp-Source: AGHT+IGwrnn4A1jKS8uEriGFes2b0JucnS5GbtRGHV4wkeQ3vTw9dpeZS6tcxLaz+RsgFAF4E7cGug==
X-Received: by 2002:a17:906:9f85:b0:b73:2ced:9af0 with SMTP id a640c23a62f3a-b7365b11119mr1248131366b.27.1763390408967;
        Mon, 17 Nov 2025 06:40:08 -0800 (PST)
Message-ID: <37cdba83-9bf8-493a-9a7b-5ec11c32159a@suse.com>
Date: Mon, 17 Nov 2025 15:40:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 8/8] x86/HPET: don't arbitrarily cap delta in
 reprogram_hpet_evt_channel()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
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
In-Reply-To: <57f34114-54b7-483d-8ac0-e9fa49df959f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no reason to set an arbitrary upper bound of 10 seconds. We can
simply set the comparator such that it'll take a whole cycle through all
32-bit values until the next interrupt would be raised. (For an extremely
fast-running HPET [400 MHz and up] 10 seconds would also be too long.)

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -23,7 +23,6 @@
 #include <asm/irq-vectors.h>
 #include <asm/msi.h>
 
-#define MAX_DELTA_NS MILLISECS(10*1000)
 #define MIN_DELTA_NS MICROSECS(20)
 
 #define HPET_EVT_USED_BIT    0
@@ -162,10 +161,15 @@ static int reprogram_hpet_evt_channel(
 
     ch->next_event = expire;
 
-    delta = min_t(int64_t, delta, MAX_DELTA_NS);
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);
 
+    if ( delta > UINT32_MAX )
+    {
+        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
+        return 0;
+    }
+
     do {
         ret = hpet_next_event(delta, ch->idx);
         delta += delta;


