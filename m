Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CEBE1EEE
	for <lists+xen-devel@lfdr.de>; Thu, 16 Oct 2025 09:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144184.1477636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ITR-00082Z-L3; Thu, 16 Oct 2025 07:32:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144184.1477636; Thu, 16 Oct 2025 07:32:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9ITR-000803-Ha; Thu, 16 Oct 2025 07:32:33 +0000
Received: by outflank-mailman (input) for mailman id 1144184;
 Thu, 16 Oct 2025 07:32:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CbFY=4Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9ITQ-0006T6-Pb
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 07:32:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 460d1b93-aa62-11f0-980a-7dc792cee155;
 Thu, 16 Oct 2025 09:32:31 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e42fa08e4so3356175e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Oct 2025 00:32:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444d919sm9776065e9.14.2025.10.16.00.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 00:32:30 -0700 (PDT)
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
X-Inumbo-ID: 460d1b93-aa62-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760599950; x=1761204750; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V65ZkZ395fafRCHZS/zrJWqELR8Nj+iaElKK9I3wBLM=;
        b=ZMzlL3hjqVjYh8SIdlb6J4aekfZErVr7KZu0qUqV+Z0DcfY8J1BjOkWflhVEKQpz71
         0ImLx4ghLgXIs3wYPCEbjJKkILNNO0KPHhnQuw6yzP3NQDFi6WUJmEiSQWTj6rV6a0hc
         lq/wBEzOaNeWdVZFlUHx1eEzrAeaUC2iMAi4LYDAwrzEr112CIK2kFjJveyfRDbpe4up
         RbtdWPUtebpJGLhEKDwo5Ocpl3aG1dLxgHW/ia6Xp26usjnj0ziv2jecdpvVxxgOcCFd
         Gg1OJWtBWswqNx7/wIowEopHSB66uoedfrRHcGO4fBCH6EQ/aWWD+We5iMUVrCqGfT1c
         gRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760599950; x=1761204750;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V65ZkZ395fafRCHZS/zrJWqELR8Nj+iaElKK9I3wBLM=;
        b=JKTHr/K2uNKVbdo6E4eN5CltZn/+wuyDrowhPgaaioPxkO9JIgJrw03nsoGniyjG69
         B3VEXZTC2iuJBAdmslRKchboI7H7Etj/MCEPMC00RCyWaZswwwzCo17InalYLeG1VMfH
         J6GPcXpYwgTCSehoKLsaMQyk/PprJAhajY0lA0gcRlnvWpzKVw/USZDZaCEun3NlM/St
         nAcJBaBH0wTn/zWfTSCYtqIaOGnorcmgh64g4ABL5yJimjsHrya5NZx2QGQMtw1j93cv
         sPaBP2adgSy3yhh+0aAlwCzGNMnXggxWn1yRdxqGtN3FhBk1UWx8uCdSExis+5BlcMFb
         1zCg==
X-Gm-Message-State: AOJu0YxemibZUB4IEG6kzt1bnYX/lvtCJtYrg8/r1lMoOnxz5vG1Gyvf
	ku43lFGtLVxE0XjgpxFv8J2secB4PMHrUouTeh9PGTh2nyHXkZP4XhUAlXks8cNQdQM9C8jxCl9
	eFvs=
X-Gm-Gg: ASbGncscng08u9C8qW+HmT0MZMpYeVS+LLyoLHYYWms/MLecbrFhZh1L+zwUiFsLZ4I
	bfSvRg9WDlBzkXkB0YWJfks5JQh62D8TUplvfFW3t0rlXhA2iYXNxhHW5HveAjHfxmRlMDMgxhs
	dEkZ0Uv8weoDgHVpJRy34BKdwK6KAOEhHIT1XpWU27VCYMki40g+Xgwp84nBumTdtMGboRIteZO
	6Thi9ZAQFjoLRtmpM1CnNaZRWkqxiQsTPaCOYs1TYIux6k/inUVt3N/RBPSjj/Ov7mLOtEzJyGp
	g0y5WATbwNadqREpkuIiMbCEXHbqzijmk3rugmlsN74e94U5DhkgKsOW0m7tUy5d0tkTRTkcY/E
	ZklZ341frBN+PBFKmchRSVp/wN0yjf4btq5w5+7ZaAGT5kpRnVn2iQjBrGsaIj7d3yyysf93iur
	uPdBI2at/81mdJO6keCEpbfnkcWucLz8X1djh+m9ucbSJ2Sp0Z53e+0MD1BqoezTvkWXVawoeU+
	2csnCZxgw==
X-Google-Smtp-Source: AGHT+IGExuecQHMcMThBN04NXiCdhbFFiy3hh6zBX5FNGlfL2Vu5MipJ5VxAO0rkDJmfFxcTc+cS7Q==
X-Received: by 2002:a05:600d:416a:b0:46e:6339:79d1 with SMTP id 5b1f17b1804b1-46fa9a8b3cbmr212337515e9.5.1760599950240;
        Thu, 16 Oct 2025 00:32:30 -0700 (PDT)
Message-ID: <e16e2b62-9c2b-4534-8279-daf986cf438b@suse.com>
Date: Thu, 16 Oct 2025 09:32:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.21 04/10] x86/HPET: ignore "stale" IRQs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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

Following hpet_detach_channel(), IRQs may still occur: Ones may already
be in flight (both from before and after the last IRQ migration, i.e. on
possibly two distinct vectors targeting two different CPUs), and new ones
may still be raised as long as the channel is enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Previously, when we still used "normal" IRQs, this would only work
     correctly if there's no shortage of vectors, i.e. if the original
     hpet_msi_set_affinity()'s call to set_desc_affinity() would succeed.
     With that changed the patch may not actually be of much help anymore
     (hence I've also dropped the Fixes: tag again); it was pretty useful
     prior to that.

--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -241,8 +241,9 @@ again:
 static void cf_check hpet_interrupt_handler(int irq, void *data)
 {
     struct hpet_event_channel *ch = data;
+    unsigned int cpu = smp_processor_id();
 
-    this_cpu(irq_count)--;
+    per_cpu(irq_count, cpu)--;
 
     if ( !ch->event_handler )
     {
@@ -250,6 +251,9 @@ static void cf_check hpet_interrupt_hand
         return;
     }
 
+    if ( ch->cpu != cpu )
+        return;
+
     ch->event_handler(ch);
 }
 


