Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26699BE1EFD
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:34:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144204.1477656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVE-0000g9-CZ; Thu, 16 Oct 2025 07:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144204.1477656; Thu, 16 Oct 2025 07:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9IVE-0000dx-9b; Thu, 16 Oct 2025 07:34:24 +0000
Received: by outflank-mailman (input) for mailman id 1144204;
 Thu, 16 Oct 2025 07:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9IVC-0008Vq-Mk
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:34:22 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88558019-aa62-11f0-9d15-b5c5bf9af7f9;
 Thu, 16 Oct 2025 09:34:22 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e29d65728so2614415e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:34:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426fc54b32dsm3303972f8f.30.2025.10.16.00.34.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:34:21 -0700 (PDT)
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
X-Inumbo-ID: 88558019-aa62-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760600062; x=1761204862; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b98JIROgwUj5ZMl5roEfulit62hiDPJ/taq9DPUq3y4=;
        b=YNb7yEgry5NUZg0rqAwzHGzDad78C+Wck5hDoCAuaTdXl6nxl4jWkxtwuC/GS26xyc
         0au1szNS44euFBJFtKnXcaboglDSSAfnEbOE4+FVR7I25VWuDAsj9cs5vwm2gkvP3NZn
         WJcspILsvmA9tA4Q5V+vrwf7CLTXAf3dgUumUfKJJrs10jO9CfMw7Zg7YTp35iuQuw7k
         uk4CuhR2T9x0bP9gyS9duyduQr0pSXCHE8DAG6EAL3mF0y8k7Fm/Rcm6MX/+OIieSPzN
         BAhrdqhVsWiRjDjrE6ddJ3kcE8b7DYEovxcO5Lgr0UIeC5YqjP8lFmWXHFU6t4eSSgba
         /zNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600062; x=1761204862;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b98JIROgwUj5ZMl5roEfulit62hiDPJ/taq9DPUq3y4=;
        b=ElYZul8DII8+ekjiLYb6dnAAKIw9zFMYZFssQY4WzIFThZCndQ7SnedQOpmdJdUwZF
         TfNNQ9Id1e2Omvgf4fhzj88++6jQ96n5ox/fKfgy7neQNyAL2fUbFTve/I6Xola22aDV
         HTGV4HgDDBNkSTKmGcTEZgGQxJ/RP6nDQYfbgHtw+VCICmLhMrBjn1FjSG3hWSBUescJ
         ACwR4UvcVG8AMozzdhl4uhlqf3ny1DAeBzXp7exc947Ggv3u+fPBhHuw/awojloe1E7u
         8DySBqJKLTry33wFGaGTAiXXadS2NxaaccUwNAV0j6v+dkNi8ANMCHLEhU9rtQ9laCTE
         RKJA==
X-Gm-Message-State: AOJu0Yzv7+vQ+1FlfZxGYDGZK2Fszm5PD9flLDmKA+OWSQbb63cVmlqt
	1dxQtmzQE37UiqJAko+GI9JWQUXjBYnplTwPo7eK7ikyGB2Mg9yYE0xDaN0T8JcmFLitRi7Muew
	OWQs=
X-Gm-Gg: ASbGnctoZUoQl2WfTiKQ/9TmowsZZGrXNFqhErpz89/cDSeYdhEqTJjV8V7QlYgpHAl
	ISseJyThpT0inLJYFxRBqoK3GCdG2tbSfDG3Ggj8jg6s7578kdLjZYhK1GyE9fXFfJzbIA0cI30
	xTMffJQi8Add7dLMzE7DoCrrNnXsdU6yED4WXlwFRp8vyXHkraFTkGmrNVXvCuVKhZzG+tTMBD2
	09VHt8ZL/sPBv6o2X/EBsoXfJujCCAkiTSBFro/hjnCDW9iNOn38u493Y2LEhCBrvjx7HWYyYPS
	xQbL7n0+ki9gHdsFLv7kvrPhiVlHS9SCTrWWlXrNUpYlr7v791neErO1H6eFuaSzUKwXw9imQ1l
	aJKboiylTK+ubPjdv5zBuiFsmFck82YSwmsytE8t2XiYP+GHPh7rQLAgsutw7Gu1j0aSdPveAkK
	9TjCurzLaGecTV3s0+osknAWYfxRydjRkgf/dWMbRSfq5AKk9mSmeZx8MPpHbN
X-Google-Smtp-Source: AGHT+IHBJoFFNnxl50Z7RtmwkNLGNDv/iNsf/4KK2R4Qkrl8Owflzb73RZ9ZgklP09hJQe5HPR33qw==
X-Received: by 2002:a05:600c:818d:b0:471:1306:aa14 with SMTP id 5b1f17b1804b1-4711306ab29mr6180695e9.40.1760600061648;
        Thu, 16 Oct 2025 00:34:21 -0700 (PDT)
Message-ID: <069956ea-68bc-47cd-a2b1-e2058f8f8954@suse.com>
Date: Thu, 16 Oct 2025 09:34:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/10] x86/HPET: shrink IRQ-descriptor locked region in
 set_channel_irq_affinity()
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

Along the lines of hpet_disable_channel(), split out hpet_enable_channel()
as well, to then use both functions from set_channel_irq_affinity().

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -257,10 +257,9 @@ static void cf_check hpet_interrupt_hand
     handle_hpet_broadcast(ch);
 }
 
-static void cf_check hpet_msi_unmask(struct irq_desc *desc)
+static void hpet_enable_channel(struct hpet_event_channel *ch)
 {
     u32 cfg;
-    struct hpet_event_channel *ch = desc->action->dev_id;
 
     cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
     cfg |= HPET_TN_ENABLE;
@@ -268,6 +267,11 @@ static void cf_check hpet_msi_unmask(str
     ch->msi.msi_attrib.host_masked = 0;
 }
 
+static void cf_check hpet_msi_unmask(struct irq_desc *desc)
+{
+    hpet_enable_channel(desc->action->dev_id);
+}
+
 static void hpet_disable_channel(struct hpet_event_channel *ch)
 {
     u32 cfg;
@@ -503,14 +507,15 @@ static void set_channel_irq_affinity(str
 
     per_cpu(lru_channel, ch->cpu) = ch;
 
+    hpet_disable_channel(ch);
+
     ASSERT(!local_irq_is_enabled());
     spin_lock(&desc->lock);
-    hpet_msi_mask(desc);
     hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
     per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
-    hpet_msi_unmask(desc);
     spin_unlock(&desc->lock);
 
+    hpet_enable_channel(ch);
     spin_unlock(&ch->lock);
 
     /* We may have missed an interrupt due to the temporary masking. */


