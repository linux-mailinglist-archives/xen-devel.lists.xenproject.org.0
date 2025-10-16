Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 713CABE1F06
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144219.1477676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVy-0001bH-Qv; Thu, 16 Oct 2025 07:35:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144219.1477676; Thu, 16 Oct 2025 07:35:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVy-0001Yx-Nx; Thu, 16 Oct 2025 07:35:10 +0000
Received: by outflank-mailman (input) for mailman id 1144219;
 Thu, 16 Oct 2025 07:35:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IVy-0000bW-30
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:35:10 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a413d601-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:35:08 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42557c5cedcso204964f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:35:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711441f66dsm9766545e9.2.2025.10.16.00.35.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:35:07 -0700 (PDT)
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
X-Inumbo-ID: a413d601-aa62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760600108; x=1761204908; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8UhliWPP1d1VfGO2jV5xKVQfFmJDT7e9Ve586LI2VOY=;
        b=dDQcrGPFhGLZT6XT7/P35zRL5ctMxUAf6nB/5tbUI1D2buf4r1e53sliesr4AQAHpN
         7HSdR+lq9Wu3sz6SZEksgynDHibqfioBIEiQsQGYdcnTHagqwPJkpmDrxnwxbTRWZNES
         9QUL5IDZDvW4EzQYzRVaK2MhmkYGYSZUF8L381DAa7DdAYq1fJt9BKw6QzKYDorqX70g
         iQyvfmVRziI/Y7gmGBpvqLKdlmP5PrYsQbgfpRuxffeuzTkyu3T7H8wr3meD+RK3WpSr
         MvgXFHPYp9Ci7RMMWbXa8MRWaKtAoBnSv06n0RRSN4Nc0drEAup5BrXVkuniT2brHtfj
         a9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600108; x=1761204908;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UhliWPP1d1VfGO2jV5xKVQfFmJDT7e9Ve586LI2VOY=;
        b=oJuw4xNQoydbGCXiZEhfIrh6DqgOIozcHSMQfMJgfxNZFU8CDvcYt2y0LNhyN9mvs3
         qL0FRLADfTeNTfR3pI/eqfvpb2pzo61g8JhWzhnsuvJEMRVhwQr/yNcJdN9EPH4UON6M
         d2ykA4eHytyt7ej0KrNFBFZHZEKKcNKlNe4qLs1S9+RNpkxWL+K3hTHI3LDqPUsMxf9y
         svNKXMyMIKHQ4CGXUs5hMYpraZsv8XB7aaFciYi++lPXQT1bNBiTt5gtZ5DVS6EsiOab
         pa3xS4jQ0acqpNG/9gNV7oFBKiJFh6krK+4LySeH/2HRjRO16Eky7E6xH8Ru6f4afVeH
         hhoA==
X-Gm-Message-State: AOJu0YziTepDVluu2lKivHYdMrWyUHNCJVLONEX2GjZ/fAV3RKzv3VgV
	UIizmtJJDbZVtEPCG0jOv5bAuhSaQaBIJ5kFZARdaKeJpBQ360qK/2vqneQGs1KSPwT/iRECzyL
	gB9k=
X-Gm-Gg: ASbGncsCfmS7BE6HLhD+7wcmBJECJBeDIeAG6+Yhn7cDNY5sSJg2wLTFmMP1TrX/KBS
	k94VY2O06/I+yRckcpJ87IU39VlxWaWh/2otejVg3GpD6OOUVQcz7ZsUnXF5K96aAKQ5fIbIg/j
	n27ubp/qnSajdbcGDzVKKeAXhQ+mKHOAwFClF2cgkRDkJgHTImVZPKrZ58WTVrqvLfY8msp5m8m
	sq2XEalIzjfEXc8LmWwL07B/KatQNWhRQEy+sJmoaLsmrNZEli9IQEDZpFKaJVAfs2+9Y3Ppszh
	1weh++D0OXYLN7u4Nfe1tH5hUZm7Aj/I2RbMaSTIGov9eXiOQ4CJOWlQAU80x1ocGzgi27/Q6z8
	1fv73fRqibWlBHxzisDKjbVLr/wchOMj9pcJZ7dS2reL9SZWwftzEGecnm3v6AlSUnfnjJqnUZO
	PoiIeL60xYsKcxQDHCQwpwYBiNIpkA1LVM0nNLjfakNV1ZNX7TpYYGZLZD4lPBNnpFkSj/J1I=
X-Google-Smtp-Source: AGHT+IEnhkFuLpDYeHjniqZKqq/rQ5QPlGFYuWKsL3SOUnkifAeba8gszd1ibTeYVQBB2ns2RCnDpw==
X-Received: by 2002:a05:6000:41d1:b0:400:6e06:e0ae with SMTP id ffacd0b85a97d-4266e8ddf1bmr21667340f8f.47.1760600107945;
        Thu, 16 Oct 2025 00:35:07 -0700 (PDT)
Message-ID: <8368780e-9c8b-4996-a78f-265007081f42@suse.com>
Date: Thu, 16 Oct 2025 09:35:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 10/10] x86/HPET: don't use hardcoded 0 for "long timeout"
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
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
In-Reply-To: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

With 32-bit counters, writing 0 means on average half the wrapping period
until an interrupt would be raised. Yet of course in extreme cases an
interrupt would be raised almost right away. Write the present counter
value instead, to make the timeout predicatbly a full wrapping period.

Fixes: e862b83e8433 ("CPUIDLE: Avoid remnant HPET intr while force hpetbroadcast")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -165,7 +165,7 @@ static int reprogram_hpet_evt_channel(
     if ( expire == STIME_MAX )
     {
         /* We assume it will take a long time for the timer to wrap. */
-        hpet_write32(0, HPET_Tn_CMP(ch->idx));
+        hpet_write32(hpet_read32(HPET_COUNTER), HPET_Tn_CMP(ch->idx));
         return 0;
     }
 


