Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2DA98B786
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 10:50:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807837.1219531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYa5-0007ms-QD; Tue, 01 Oct 2024 08:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807837.1219531; Tue, 01 Oct 2024 08:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svYa5-0007hw-LT; Tue, 01 Oct 2024 08:50:05 +0000
Received: by outflank-mailman (input) for mailman id 807837;
 Tue, 01 Oct 2024 08:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svYa3-0006bI-RB
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 08:50:03 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2594c7fa-7fd2-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 10:50:02 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8a897bd4f1so793412066b.3
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 01:50:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2947fbesm670219666b.128.2024.10.01.01.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Oct 2024 01:50:01 -0700 (PDT)
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
X-Inumbo-ID: 2594c7fa-7fd2-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727772602; x=1728377402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GkPtOo84ZGrBaC3bJPX3VZcUrguvma+CLYeb6XeRzK8=;
        b=dv1cfrWlDJoUIYzZwiHYlkC12QAv2G45xytWcLc6+x0XrMjvhLy1CHVc7+dw76dREe
         2IHbLNUuPRBydlhOudebG9DiYiaZlVKREiukR96J+BjvxuuIevrypqK/hX4FfCL0u3ep
         jrILkBUkw1ZDDVec2AlP+sq4/YYhS9kDAcL2abbOjXDkZb1VwFyvnayUVZfWcnezVO8L
         IH1t5p8Jm1ViH9jyQzE362fLTTHkGc8VKvHifmJViEwXuPgXMbSWMUakznIRiZGFkLSF
         Ki3X9x8b+R/fnisInAOtOCDFstfxJwwARaYieCa+CYQrzgRmzNuoP2wSV1WIftSqFC3l
         JYng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727772602; x=1728377402;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GkPtOo84ZGrBaC3bJPX3VZcUrguvma+CLYeb6XeRzK8=;
        b=DT5pvxlaPakwbfnWx+Tm+rGJoD0eqN81k7Z+7CV+LEs/vIh2tJXxSnJEKzZ6+GSIBo
         4qDSsKeEuCqIN8dvmkgW58dQYyCtziTVKXFEHMkGudHzQJfhS/ibnrkcJ8O/BBp/0Dzw
         nb5u7O0s2YIM+g8/TtIcRCj7Wp5M3ou7G0rGdeBZ2JddaFPV72GCuQEhsrFnA2r4vAQf
         L53jH+vgOX+WfVaBUyagSO36+fzl48kNapaC4fq+OTkRUBR15mQ0UcdcjC7RO46Q9738
         XInSde3bQ0fUrv5fgCseRjlEjVMZx+RAF5ILE9OFQlQQOAOgEyLl5xyGWz+hgsHvH6RA
         G95g==
X-Gm-Message-State: AOJu0YwOAj9Y0SyvmwCbWcOgJlDyHRJrVGRFi1LxYLVLlV6hSsPZLijO
	fyb/tdXhlOCFbobaJSOnDmzPqdKobJ+G9FnYsXdPTlD3sCPexB7/R3473v6LAPg/spT0/PHlvms
	=
X-Google-Smtp-Source: AGHT+IHYhewCLx3i4KL7jhtK7CRblhqhwGSI+ZXE8ao/Mp72DnePL2E5exZZNGhbYERJUCgWbYAlnA==
X-Received: by 2002:a17:906:dc92:b0:a86:8b7b:7880 with SMTP id a640c23a62f3a-a93c4aab863mr1531947766b.63.1727772601745;
        Tue, 01 Oct 2024 01:50:01 -0700 (PDT)
Message-ID: <3cfb6c97-26c4-4914-ac3c-2c0f39e8659e@suse.com>
Date: Tue, 1 Oct 2024 10:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] x86/HVM: slightly improve CMPXCHG16B emulation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
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
In-Reply-To: <3294f629-f91f-4b5d-9eb0-40a34aa2ec3e@suse.com>
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


