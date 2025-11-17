Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1987C64AC0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:39:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164104.1491118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0OB-00088Q-FU; Mon, 17 Nov 2025 14:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164104.1491118; Mon, 17 Nov 2025 14:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vL0OB-00086n-CX; Mon, 17 Nov 2025 14:39:31 +0000
Received: by outflank-mailman (input) for mailman id 1164104;
 Mon, 17 Nov 2025 14:39:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vL0OA-0007Pr-SI
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:39:30 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39b229e4-c3c3-11f0-9d18-b5c5bf9af7f9;
 Mon, 17 Nov 2025 15:39:30 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b7277324204so574071566b.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:39:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fedb2eesm1089927466b.68.2025.11.17.06.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:39:29 -0800 (PST)
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
X-Inumbo-ID: 39b229e4-c3c3-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763390370; x=1763995170; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=M7I822gJPFWI4MHnpyr7sWzwrYwyv165WM3oRfNaztDlWZ+cNeFJXYNQBENgindruD
         t3KlUobWSyWNiTna8nt3Hv7uBlmEkmGjnXOeMZHDWHgppKrjg21pQMXs5gJEUQsxigPq
         4XdSn2mD7+SheiFyBJ9aUm93svu6NLW+LzvFVd2MW4beThK/kdzvkUs2kD5KSXQtVcVa
         rvXrW2GzA5wXkqSOLK5WPQ1Wgpr/vWFq5AjF0sK6crPxzkdpyuv9RzNHVS9ewq8CiHac
         xvXZvjkCsKDdZqN1qvv0bQQhj5ZHfHaSvVIy+Bghr8UE7fhpPo5sCqigqKFTFz+llPOJ
         an1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763390370; x=1763995170;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yfju5TuSYr1gnKBFs17R38Pvw/Jb2fzNTTH63D/Pa3U=;
        b=HwBYHnCH00oRdtCgeu9sEWpRYsFjOERB6ev1YSpCTX4egwdw8+ACg4LCRJqrNe5h89
         hSHy/vKcLm7H8llvvTxp1equuSMk7IiLeehEpK6Elt9YVzxfAj74Gf6jVOxZ5ThbOZix
         HPgiqnZd4NeGi8fFdn8T/Bky6grlwQvN86E3PbopaRI5zbDvDVgkBA9u6+oy29Fzphj4
         hlUuGnD6XdoUzdloCads4qtOXwYm9oYXzMscMsI2AxlwnoAjndUfdb4uO5IVX+QNz+PF
         bkOEX7slfeM721qKSvyYz/ps+CUrF3ZzsZDEPbN0SDXMtsAVhPo+n/WFqDuzPndifNid
         gs7Q==
X-Gm-Message-State: AOJu0YzWvkWxYjbcv2eqLvZmWkE9Mdb6yNkuHlDh0/toSQx+jOlDCMng
	Mj419xx+ze2xgIVXZ0/u+897QJEGdcKMnFAlCk6XTP8a/P9BZ9KY0T8sTojvfEKBgGKvUbyqR+6
	WXBA=
X-Gm-Gg: ASbGncsNGxyqw8CBROm5/nqXpNnhOr733N3znLXxlPMfc1zNeO5KNVSoPWb1SU6hCCP
	sSDYL5kIzm1ErohQ9vnK42/7conCiMG/tDuBg/TLKMtrnjhL4ouS+O15IqpFbU5lUeiC5S91ace
	2pcNqMnZK1TMx8PBhWg2Y6DVHSgzlW7xFV7BybY8/bT1LBweEBfIsE05fEVEgX2VB+fqVtL2sl2
	CJucV5XQ15GfHnWgUfJTUCrDQPhPeaBl5TzimFlyu6WlibgEVe4zjYU4XUcl1EK3rN2EDosZ+q7
	Ipwedlfa5FjB2Z5nwUmkxqCYJuKXuPNFBCi/EvtIA+lmlyUNpsZnHMD/LUKyFQ6XqOKDWH2XFof
	2l7USiOJKvo1fvP15gtQOzPT4kkWIJX45fQ+xqYcemAYsy2eH48LKZIaz5kjbgKh0KLjzwJTFUC
	0DoVfaIp5kUmtmAoF6k2qQaVBCHKNxy9imZQ87s+cJuuFKvq2VPc5Sj8y0HjY2ezWcfYQQ3+lUV
	nMwnexT1s8Rgg==
X-Google-Smtp-Source: AGHT+IFqKWURIzhu1XRhapZ/K6XdgrEUTElkp6+U2JG4zQb4GkX7BZZ7YWOcY6wzJVt2sz+bOVLMZQ==
X-Received: by 2002:a17:907:7b8d:b0:b70:b93c:26cf with SMTP id a640c23a62f3a-b73678086a4mr1208450666b.6.1763390369788;
        Mon, 17 Nov 2025 06:39:29 -0800 (PST)
Message-ID: <0bc920e2-2e32-4b3d-9ed0-a2c2b34e9591@suse.com>
Date: Mon, 17 Nov 2025 15:39:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 6/8] x86/HPET: simplify "expire" check a little in
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

When this was added, the log message was updated correctly, but the zero
case was needlessly checked separately: hpet_broadcast_enter() had a zero
check added at the same time, while handle_hpet_broadcast() can't possibly
pass 0 here anyway.

Fixes: 7145897cfb81 ("cpuidle: Fix for timer_deadline==0 case")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -147,10 +147,10 @@ static int reprogram_hpet_evt_channel(
     int64_t delta;
     int ret;
 
-    if ( (ch->flags & HPET_EVT_DISABLE) || (expire == 0) )
+    if ( ch->flags & HPET_EVT_DISABLE )
         return 0;
 
-    if ( unlikely(expire < 0) )
+    if ( unlikely(expire <= 0) )
     {
         printk(KERN_DEBUG "reprogram: expire <= 0\n");
         return -ETIME;


