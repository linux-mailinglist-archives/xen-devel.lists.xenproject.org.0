Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CF8FBF0D35
	for <lists+xen-devel@lfdr.de>; Mon, 20 Oct 2025 13:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146229.1478687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo2H-0008PP-Rg; Mon, 20 Oct 2025 11:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146229.1478687; Mon, 20 Oct 2025 11:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vAo2H-0008Ns-NK; Mon, 20 Oct 2025 11:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1146229;
 Mon, 20 Oct 2025 11:26:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7iz2=45=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vAnwg-0001y1-S1
 for xen-devel@lists.xenproject.org; Mon, 20 Oct 2025 11:20:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9fd58f3-ada6-11f0-9d15-b5c5bf9af7f9;
 Mon, 20 Oct 2025 13:20:58 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-46fcf9f63b6so22311905e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 04:20:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47154d38309sm142168915e9.9.2025.10.20.04.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:20:57 -0700 (PDT)
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
X-Inumbo-ID: d9fd58f3-ada6-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760959258; x=1761564058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=DvtaxUr3fc0WHOImWZeiK+H6ToJPY9jRlhe5DyKLGXpsTfurc0yvR/3pEatQsaBg7v
         Jzlwqzwv0NrBJ5Kk+KbmTaelbXiC1uZKMRIQQULlIhfM5nkec8hAGgO9+5IYUf5G9tja
         XWyt8T64Iy8pZGjJZkCs+dQNG0KKpk9tMDAXSisogRHhWU7y/s3/Kca/+cke6WBuxykN
         1XWpuBFH95MIsDHzVncHH09a2c3OwUYtQ11xH8kKVFy/lCqq7/zIVq3aEN7mVSCra7ii
         MiRPnTHjWX66jsiySarVIF2ppdP9oLpBUtn3a03X38to4k8t+5eeEGwFQ2Uj44400Wmr
         Nb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959258; x=1761564058;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rds4jnnN9NVrTZyuc+q65+QBQEjCAV7rC8oJIxMqDF8=;
        b=qg8m1RMzcaEQvWBt7nzBW/lc7jj63GYMvq/PAAi70lZRlXRtGotbnLlbVp9LThTdVR
         C2Mki77hXYtewVBPa+r4eR6vbUxSkunG3W9CZfoUNvOxSkq2j17mGy9CROpd68Ux/eTQ
         0iMYrk3c69m21UwaGJUnJUYFXGN8xmVRq4RgsNHPmgH5heRyxMR/bpHf1eZ43t+H0qAw
         xIuJWw7qJ5O4Mm+o6DAJv9hMoD0UNU65J2Vl/cx3ujnWCyLl8QavczP1YJ7uGclOeNMF
         JUhtNd1EzrCWP64Q8jGZTE0Z98ha+IVR3QW24JZWGMwTOQjwfTuYrhuMuyo+wu/bumEy
         tXrg==
X-Gm-Message-State: AOJu0Yz4MDQR7EB6maWUsV/rxs4i92EbuBhgOjkwUPYJCg2Oby1HJmja
	/i1gkvmlpXXxxyRh/bukA9Lsl/Uxt9LX/Fl0sx8DnVsgBsSHrnDYAzfyMsNp1uLWElvGrTVe38C
	2EMU=
X-Gm-Gg: ASbGncvXnkp1TFWRV/R3BKVKmsrh26Sii7YqHfW2/yWTVAvX+lc/4BaPfkUYKlFCxQq
	guDr7q/48VSTmBC1nJNnYgwhzelN7IuCdzueiGlYsnJZj/z0r9OW0PrsBZTQ5UBapbK+5SJ2L9p
	3oTB8xANYCbYV5lCBR92zu4LdC2UmoHUUrTa8FGsYnJeJjBZwX/fPHvx6x1hNGtbysLhPUkzSf4
	62VSKcQ/4DZQ/8QB75svI1zQhMihNP1WGUBJhMl3Vi9BAidFQ+Hzao+SPnKiuzoiex/HCuWYQXA
	7DVQeo5gBXTTyUZOvqlXapTyx2QeyyBAoOGAvfp0OdoBA2ef2Ao5oUjQCqxKX5pktYE1UVdYilM
	unBdMUHMleoooPAVsPEC0Bl8pBbE9VfGsAtZcrnxUG8xrUvt6T2XjTcthCgBONPY4j9XDjtb0nB
	I7zFHiwUTOfWDhAcZOxmLToIVXGAvLnHCyp8nVuZbhq/CoYxheHN3ObjupFXKqC+yU2OHFWayYr
	Yv2hMpBgg==
X-Google-Smtp-Source: AGHT+IFxeSoKZVTafA7dqmByPVATZl0pltbsEYB4cctuuaQSYVLfZrncYc3yd+dH+OjUjxxC/ofeWQ==
X-Received: by 2002:a05:600c:6385:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47117912365mr94081455e9.29.1760959257809;
        Mon, 20 Oct 2025 04:20:57 -0700 (PDT)
Message-ID: <7e376968-1eb6-4f0d-a9eb-167b26d90786@suse.com>
Date: Mon, 20 Oct 2025 13:20:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 7/9] x86/HPET: reduce hpet_next_event() call sites
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
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
In-Reply-To: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I'm surprised gcc doesn't manage to do that: At least in debug builds two
call sites exist, just like source code has it. That's not necessary
though - by using do/while we can reduce this to a single call site. Then
the function will be inlined.

While improving code gen, also switch the function's 2nd parameter to
unsigned.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Oddly enough the CDQE is replaced by an entirely unnecessary 32-bit MOV of
a register to itself (i.e. zero-extending to 64 bits), as that's
immediately preceded by a 32-bit ADD targeting the same register.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -124,7 +124,7 @@ static inline unsigned long ns2ticks(uns
     return (unsigned long) tmp;
 }
 
-static int hpet_next_event(unsigned long delta, int timer)
+static int hpet_next_event(unsigned long delta, unsigned int timer)
 {
     uint32_t cnt, cmp;
     unsigned long flags;
@@ -173,12 +173,10 @@ static int reprogram_hpet_evt_channel(
     delta = max_t(int64_t, delta, MIN_DELTA_NS);
     delta = ns2ticks(delta, ch->shift, ch->mult);
 
-    ret = hpet_next_event(delta, ch->idx);
-    while ( ret && force )
-    {
-        delta += delta;
+    do {
         ret = hpet_next_event(delta, ch->idx);
-    }
+        delta += delta;
+    } while ( ret && force );
 
     return ret;
 }


