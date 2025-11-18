Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F8BC6A34A
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:06:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164910.1491767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNHa-0002Hc-CU; Tue, 18 Nov 2025 15:06:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164910.1491767; Tue, 18 Nov 2025 15:06:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNHa-0002F1-9N; Tue, 18 Nov 2025 15:06:14 +0000
Received: by outflank-mailman (input) for mailman id 1164910;
 Tue, 18 Nov 2025 15:06:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLNHZ-00026P-7Y
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:06:13 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e5faad2-c490-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:06:11 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so7585778a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:06:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6450e8d1a23sm883561a12.15.2025.11.18.07.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 07:06:10 -0800 (PST)
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
X-Inumbo-ID: 1e5faad2-c490-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763478371; x=1764083171; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MuGvsatbOCNTnf1+piHi4k6STW82U3evhUtfXUWwz38=;
        b=XwPw7oGq0Dz3tDGnK9H4mVkz3NlCua/EsIGWpagevuu36gQzMXoAzM5/Zw72fYsEx4
         4yWMpk8JaBa3VN5IQrj6fENrNIjw5dWk8K3SlIRRDfuzy082B8HIuv2hLNUrmdMpDLt3
         OukLgqY3qYsxMK5IfIRKyyB4ncRMq0ox2eDWvo1d8cTvrtyXoeLBGuwbVWXzpypVZt3i
         G23Kgq5U5dm6HQ0acVRaD6NAGZaOXpqAlCd2aj/UP1QlfsihuAMjz00+y4PgZd4l1KyK
         JQtYtCIH/CShPjGhRuepbiTz4RU4K+UU80x+r6td6Iu3L9gThi9JKW5IknrvMAWKtils
         geZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478371; x=1764083171;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuGvsatbOCNTnf1+piHi4k6STW82U3evhUtfXUWwz38=;
        b=lrOtj2X4Z8XQAI+ymLzfUvJh6rRaN40ZQ/dacCz0CNsq+uRc83Z/E6VRk8BsxzCOiz
         WtHTfuX/jjNFV2BHeAMsxrk/drleiroDkcGG24zipUmW7CoqFMJEEWQK7gTjc4bZya9Y
         GiM+R5i+WAHIKTQJCQIjTh6+o808+l/cIP5TBMoSd9d30uJgDknie+1+7zF+O2KLbuu9
         smZ49q9FFeHrBgNCQIe/hBYzm/mC7zJOq0ZQyVwysZd54G+ijk8R6MGVqkPIaFyXwEJB
         irI6atF9JeXXRXKGx+YHRpN97FqAXk78UA8WqCB+Dtzy8jZFPe2WfNfN7yT+RlbbFKkp
         CqsQ==
X-Gm-Message-State: AOJu0YxfXmoS3ocsIiM9AUB9cgWpKUW/EettVrSBd25kh9AV0mANIZ+3
	B+PLNq2Z7e4mgBJUpZKbv9bVyUZERGZQF7PqVWJHqk1FYzI2fCIn1nz5lwWtgl6FnHjjkN8sPQM
	KKv4=
X-Gm-Gg: ASbGncuJixqDfxSMwdoP8Qh3IBUMROXXnhWA7VUjo2q/2T0f0dR9Mfgq3MBW9ddLLuY
	kXCTdUKeg0naS3IGroDdTNVBhxZse+W2mbMpxqNLNHIgu/iXE36oGKHI2aL0KuEmFDg+4fWuPsl
	mRARFUqiT+p6cgCwpnmmZrMmBTG5coQ6PcJYPo5w5YMzXjqhgAeFPE4QxhbZIvXLDFbiIOUQwt4
	C22E0QPhhc3CzXHWV0K0hNrBrEOwYFV0asC4Jebh4visvY0MSF8nN27kQk8b4Kckz9pAzaYA9rS
	c+zUbcUfQph1clV9J4sSSuvWPHUfBl2OXR3SlOcPRfgp+1F8oVqygHGzaPh5exBOAQAsIyaMxnU
	k0qKU5FC3O4jev4tMkqmZPSmlnoKiqm8tArkHBT4Yd8TBzw1ZT9IInxEJlZ1SOogO07o1FHejQ4
	7EIoZpnStxYsGjYp21w1S7uLIWfSOIwIsOyEh3wQ5BhwUGSleJa57zc7mAQVKjiSo5
X-Google-Smtp-Source: AGHT+IEEiBmygkrrcJUcQiqLuhkHHAct9qy+FLpfROJT5T1xQ3QMMYhvLBaCTwjo/TyStGFSwZN+Ww==
X-Received: by 2002:a05:6402:20d5:20b0:641:297b:5567 with SMTP id 4fb4d7f45d1cf-64350ec18d4mr12995892a12.35.1763478370677;
        Tue, 18 Nov 2025 07:06:10 -0800 (PST)
Message-ID: <b59c0994-6bb2-4506-88ec-4ea0f3b6c311@suse.com>
Date: Tue, 18 Nov 2025 16:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/8] x86/cpu-policy: define bits of leaf 6
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
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
In-Reply-To: <53ef6c9a-1115-4bb4-bb7f-e2595ab9d0b6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... as far as we presently use them in the codebase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Or should we make both parts proper featureset elements? At least
APERFMPERF could likely be made visible to guests (in principle).

--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -121,7 +121,31 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            struct {
+                uint32_t /* a */:1,
+                    turbo:1,
+                    arat:1,
+                    :4,
+                    hwp:1,
+                    hwp_notification:1,
+                    hwp_activity_window:1,
+                    hwp_epp:1,
+                    hwp_plr:1,
+                    :1,
+                    hdc:1,
+                    :2,
+                    hwp_peci:1,
+                    :2,
+                    hw_feedback:1,
+                    :12;
+                uint32_t /* b */:32;
+                uint32_t /* c */ aperfmperf:1,
+                    :31;
+                uint32_t /* d */:32;
+            } pm;
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */


