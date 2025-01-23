Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 209BEA1A1E0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 11:32:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876149.1286517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauV5-0000Ve-3K; Thu, 23 Jan 2025 10:31:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876149.1286517; Thu, 23 Jan 2025 10:31:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tauV5-0000T2-03; Thu, 23 Jan 2025 10:31:51 +0000
Received: by outflank-mailman (input) for mailman id 876149;
 Thu, 23 Jan 2025 10:31:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhpA=UP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tauV3-0008P3-KC
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 10:31:49 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4009918e-d975-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 11:31:48 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so7306175e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 02:31:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38bf3214b4fsm18724758f8f.2.2025.01.23.02.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2025 02:31:46 -0800 (PST)
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
X-Inumbo-ID: 4009918e-d975-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737628308; x=1738233108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GkPtOo84ZGrBaC3bJPX3VZcUrguvma+CLYeb6XeRzK8=;
        b=eYh89Pm6wN2SrS3XlqB+Ky8XRsA2tT+IV1IdcNhXuvk/WrGTiQDIqJJDyDIY21hS/0
         cFVAmQ5GsfqSk+L0se1ktpaUwosuGvBcc/OrhW3OS6bo0/W05SkdYoUYyPwbpANIydw8
         vPJT2FpiuiWN54k4zZ4rPbDnwkZohD8J6fgyDpoxgLGEpivkyx7DXCXlnLZ6hoCWHp/3
         C03mbQXYIgdnfruHPPPJJH/XgA6qxbJEWtkleJm8OrLUdpxPM0E6+lRuX2dwWBFegbu8
         yC+EU2rb1RyXd1FMrgoQXNWrjN4rB9qvJUp2snHS5A+Usrzw4FOl7EH9tbyZgbp814PO
         qTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628308; x=1738233108;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkPtOo84ZGrBaC3bJPX3VZcUrguvma+CLYeb6XeRzK8=;
        b=HILFPX1bHyjt/xs5gPUVzX74KFGUyyzaFQvMfdBMZCYEcxHzmX36gJPCVHthU7bdMv
         4Xb1hrbqHJid4RLJPPPUjPhTTbtjx0PnH6nM0lI9NtpHvxvD6pFNhxJ66taXbCFy+z/Q
         gqX+Ube0DCCgYG0Ohe3KCBjlmmVHArgkKIeAbSSEk9Go7rdjHr2EsMrxqdN0kSQqp20r
         Kcy7qiYEWDURHTIonTBOC8E7vy/GOq7q7UhqM40fxdi6AHxuGv6mtQ0kF2/ADqyT7Anb
         nJkFGI+CvTqOkMCqgXwXO3LCp9ki/2mjSe8f49rxs+vUV2H74vwNvIqZ21HBf3gIcaZ/
         ahCg==
X-Gm-Message-State: AOJu0YyVfKILZk0auqg9xv/ThGfoWPAW/m+BlA0GfLxpgalHCUA5CMWq
	ZWerGvyQJIUZ9ZeDzcpGemHcvNXrYrKnCaFmO5qEsj9ggcARr5kSN2Ju88+H4nItiuDOpNo12Ik
	=
X-Gm-Gg: ASbGnctNp0t3i4T+hJeRCtsYJRnE2K4hZVQ0R+gD0SMzQu2CwLf+xQsi5K04rDEhDWS
	iUkyX+s9ZJ6a9zRBPq20+TrkCvtuIvSnCYoBd2IEclRLCktcV3Vg3s3kLDl1m0CKXkGACbV6kFv
	jy7VlhRCGBmXxiwXJKPWBiNngM34/ASdCfo42Z/NUyWkI6XxSkna1uwMVFmjNOlRWGoCxYLLs/P
	WVWnKEUNpL3Ds071mLTTJvriRnpanpZTDfVI625DD+5+o0PiJ+CFxX1VYjP815xZYedVQsWJWH7
	fvg0c/FXAWhSA6T4aRjYkXOaduRAWWAN/IQuXQl1VEH7oVo+Lwa0EwzzMsRzpRZCPA==
X-Google-Smtp-Source: AGHT+IGCWDUbub4VO/0yCZvz8DysCk7T1E5ger/ES1zeoOxNZfhJp1gTiug0jc0H+ZS/kCSCCPImLQ==
X-Received: by 2002:a5d:6ac9:0:b0:38b:d765:7039 with SMTP id ffacd0b85a97d-38bf5659be6mr17267975f8f.17.1737628307124;
        Thu, 23 Jan 2025 02:31:47 -0800 (PST)
Message-ID: <df11d714-b041-4e07-aaaa-4a3a3d37fb3d@suse.com>
Date: Thu, 23 Jan 2025 11:31:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 3/4] x86/HVM: slightly improve CMPXCHG16B emulation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
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
In-Reply-To: <729f7896-55b7-4b5b-a7e9-6eb0420e0b14@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using hvmemul_linear_mmio_write() directly (as fallback when mapping the
memory operand isn't possible) won't work properly when the access
crosses a RAM/MMIO boundary. Use linear_write() instead, which splits at
such boundaries as necessary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -1645,10 +1645,8 @@ static int cf_check hvmemul_cmpxchg(
 {
     struct hvm_emulate_ctxt *hvmemul_ctxt =
         container_of(ctxt, struct hvm_emulate_ctxt, ctxt);
-    struct vcpu *curr = current;
     unsigned long addr;
     uint32_t pfec = PFEC_page_present | PFEC_write_access;
-    struct hvm_vcpu_io *hvio = &curr->arch.hvm.hvm_io;
     int rc;
     void *mapping = NULL;
 
@@ -1672,10 +1670,7 @@ static int cf_check hvmemul_cmpxchg(
     if ( !mapping )
     {
         /* Fix this in case the guest is really relying on r-m-w atomicity. */
-        return hvmemul_linear_mmio_write(addr, bytes, p_new, pfec,
-                                         hvmemul_ctxt, addr,
-                                         hvio->mmio_access.write_access &&
-                                         hvio->mmio_gla == (addr & PAGE_MASK));
+        return linear_write(addr, bytes, p_new, pfec, hvmemul_ctxt);
     }
 
     switch ( bytes )


