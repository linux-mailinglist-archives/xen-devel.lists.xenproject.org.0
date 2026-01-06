Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8BCCF8A45
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 14:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196164.1514048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Zy-0001lO-9S; Tue, 06 Jan 2026 13:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196164.1514048; Tue, 06 Jan 2026 13:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7Zy-0001j0-5m; Tue, 06 Jan 2026 13:58:34 +0000
Received: by outflank-mailman (input) for mailman id 1196164;
 Tue, 06 Jan 2026 13:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7Zw-0000Ic-OF
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 13:58:32 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c87719c0-eb07-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 14:58:31 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42e2d02a3c9so662912f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 05:58:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0daa84sm4538795f8f.2.2026.01.06.05.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 05:58:30 -0800 (PST)
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
X-Inumbo-ID: c87719c0-eb07-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767707910; x=1768312710; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qbeAdy4fJOCoiATm+OOVH4vL9Ep2W/kjzFBlSuDnJHg=;
        b=AAk4cKEH/MNAF6bbT/iomc7jS8D4jE4uWO2rzpmxju8Xz6NS0NqU+a/EF+uhzRmv/j
         mL6dpLTvQdt55RbEuCuCfdDU92VBBGKztaND4ON4jcnfN8HCOKuPh6y0yG/WVd+GBMts
         LXgJjRCu0qXp70RXFn5sYSlb7Hinq/zvKh3bpG5XW2HSjb0OPdZjJJEklTrCUhYAGBiU
         Tm8c5d0iHL734kJ4AcnozzyDqnY/1x0JSiQ+3HLwRk/Rym1bddA4ZR/7e6IcXVrhko34
         zancJj0UMElkl+YEFix2nu4Ymmuu3d4Rw7PGmF7yl14AAJlOFlCic2jU19ZWGN7cYKmt
         /OEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767707910; x=1768312710;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbeAdy4fJOCoiATm+OOVH4vL9Ep2W/kjzFBlSuDnJHg=;
        b=wSqDFDnuO+DdY51yA7d0Y2loOkmthTh2VcOuSN6r3Qb2HfU052kDPPuo63vGJk+GmX
         msqdkJhf4tCQ26qW4tC1An1S3Q8Wvahnh9XcYq129gfRtEoVBccQO90MiVtTVujjSGB0
         OHS8eIvGxqA2vTEAmXrG157bvsM3xig7PMWGB5VzHzwWeFBC4jmnjGu9XA6bMlNJ7SU9
         5tzLvG5cuptESV2CaQsrd4WGU3v5GeETUV9hEWJMgmr1BeO7eBHKnu+NX2W0kDxCoGSY
         pz/cUqNL/JIJclogXdUhnFjW6Q8k9XLy6NUsKOiYurlH+eG0Z4Nr575PDZp6HQ3LvhTw
         V8NQ==
X-Gm-Message-State: AOJu0YygxPN/dsy0UlWpAXJ7g2QICcdn5ZEkRx+5jHFwAAQmVx5UtOQk
	5ZKiVoZ0uGEwWUeQwc1Jh4lZF1Eqbo/KHuEZBeGoBvqZslsFSMflee9wYCSCrJgbn0H6c40fiSg
	7hN4=
X-Gm-Gg: AY/fxX4Fua3DdFCSwhjm9HqNsFNSgwPvAdbW0xFHY11p1yr8IqNLOCHipGnVK+2/izk
	wfG2lZ3SVnjlGcPYzDHiu5Kbi91DnKdfvugfeCE/Rme4Vi84+nt3CSVpTbsUA7lxauGyEf1g5MX
	0wZE5HAD0LUUdXSbV2kEW6CD4tF3aB4e3o0VoKYAtWCV9Bg7dPRBLZ/nefo4cSUndWHJNN3evVk
	hvhR6WBqWOxkkkKC8g0aEgDL/22W6kge2cLXQtgv6VeXxN5NG0q/fS5Jt/IFdS5rmp1xXrTi0Zr
	VvaUsXAnsCdIBNqaLPdd7btRh2uRMaIq4bVNdhJBQUQBm1JVzP3fLVeGexP1lApfXFSjLFAw0z5
	o9vaf2D128gNMoYZyP1zpVv5UHy2HTBXwzGrvyoxgu25frRxYezBRxIAMP19PVVVVLxkleWjZpy
	/24FLChq9Bi0RDbGm+tEKtusS6829y2tIPYHb7BiKCI2PwiDvHI7hdbni/6Nv54zEpvRJKS0+rc
	R0=
X-Google-Smtp-Source: AGHT+IGs8dt/cpuz54Rk28BksowpcERFXjUxejHHjhnBtQD+XHzSST3nTisOBYQYPDD/p+vcm0aNnQ==
X-Received: by 2002:a5d:5d08:0:b0:430:fb00:108f with SMTP id ffacd0b85a97d-432bc9d272dmr3811591f8f.18.1767707910383;
        Tue, 06 Jan 2026 05:58:30 -0800 (PST)
Message-ID: <ccaba595-aba4-409e-be36-ea5004cd6484@suse.com>
Date: Tue, 6 Jan 2026 14:58:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/5] x86/time: scale_delta() can be static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
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
In-Reply-To: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It's used in time.c alone. Modernize types while there.

Amends: 5a82d598d2d ("viridian: unify time sources")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -56,7 +56,6 @@ u64 stime2tsc(s_time_t stime);
 
 struct time_scale;
 void set_time_scale(struct time_scale *ts, u64 ticks_per_sec);
-u64 scale_delta(u64 delta, const struct time_scale *scale);
 
 /* Programmable Interval Timer (8254) */
 
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -131,9 +131,9 @@ static inline u32 mul_frac(u32 multiplic
  * Scale a 64-bit delta by scaling and multiplying by a 32-bit fraction,
  * yielding a 64-bit result.
  */
-u64 scale_delta(u64 delta, const struct time_scale *scale)
+static uint64_t scale_delta(uint64_t delta, const struct time_scale *scale)
 {
-    u64 product;
+    uint64_t product;
 
     if ( scale->shift < 0 )
         delta >>= -scale->shift;


