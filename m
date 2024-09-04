Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D26BF96BE8A
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:30:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790373.1200122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq5D-0006p7-VR; Wed, 04 Sep 2024 13:30:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790373.1200122; Wed, 04 Sep 2024 13:30:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slq5D-0006lT-Rx; Wed, 04 Sep 2024 13:30:03 +0000
Received: by outflank-mailman (input) for mailman id 790373;
 Wed, 04 Sep 2024 13:30:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slq5C-0005w7-5M
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:30:02 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c95e3ae7-6ac1-11ef-a0b3-8be0dac302b0;
 Wed, 04 Sep 2024 15:30:01 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a86acbaddb4so791563766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 06:30:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196d4asm822570666b.141.2024.09.04.06.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:30:00 -0700 (PDT)
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
X-Inumbo-ID: c95e3ae7-6ac1-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725456601; x=1726061401; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2QgSbescz9+dIFTje+LMqUKMCR9FaWXm6Y8nQPTQ+CA=;
        b=L+k4KMO/WndtgVypC3Z3+jMe3PrloheHeGzXDjiABgFbOaS1PdJz4SfziG2ld66DOy
         aJkM3l4xEVwr3t/OSf1rL6Rrt6BIpaOUT6F46/Bu0MED5GtecMI1ApxmyAnldapfcEfY
         U5W51FvPUFbZmbPT8WVWrqhYFCOKC69pp5oHuh/I0aqMtIjMrAybQ4X657BwtH7coJmm
         mtv7hc42tux4S+iVCZu82uybcBL5cLGSWmGmpMNZLAKUQd+fyH1YaEIJuw6BwVC6qVyq
         EYn+L4XPkBgaKUBiNQXfiWrkoLJ7RBB7fqXxanjB1/0uA+aAT3tbvljvvb4YU4gWnbTc
         wMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456601; x=1726061401;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QgSbescz9+dIFTje+LMqUKMCR9FaWXm6Y8nQPTQ+CA=;
        b=pn1VJSbmE9GK6KK6HPVki6gyf2Xr7mv6P2+rKVRf8OfaNg+BJ1F4EvHzl1U4bAto7T
         K2wVcWOvfsLIwgmhXCnWomLUhYj0N4Uj03lK3do8o6oXxuaxzx0iglSqGY5ZUgGdbFLo
         UL4lLCpR4m/9I6RJdhKHplnuTtlfHWrfxRqRbqQnADqMDctcgFujciUiGSqKOMnSarGS
         usYCLfmxf4o+NkIyZn8+p/O3P1MTAxxeajSJEPlogeqCcUzYw/RK0cGyYIGGr4mm5HBo
         kT0jt22SNUdrpeKchBnbQ6fEqQBd5oP0CdmMvvFIymDUC8wDEmr0e6lVwTwL1kmQSoph
         sxaQ==
X-Gm-Message-State: AOJu0Yx/p2txlHQ3XYtnkwVa5e5pcMpt88YIIAm3Mb2jMiFr396Bpf0y
	IPsOmm8Zn1BaDDb16sZ/xICO7/7BSuX311htas/6ikgybxtmLnFgRNCKwBQCbPZIQok5L9Zq7OE
	=
X-Google-Smtp-Source: AGHT+IHm2ePunR/QralYBJXAWsi35BkmukRbSCn1s8Rdr33IuvKyuY5+dF5ltle+rrY2uovZA5RWoA==
X-Received: by 2002:a17:907:d90:b0:a86:b64e:bc4d with SMTP id a640c23a62f3a-a897fa74489mr1641733466b.44.1725456600718;
        Wed, 04 Sep 2024 06:30:00 -0700 (PDT)
Message-ID: <dccd655c-2a9c-4e11-9889-53e80ff10fc2@suse.com>
Date: Wed, 4 Sep 2024 15:29:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] x86/HVM: slightly improve CMPXCHG16B emulation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
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
In-Reply-To: <31906cba-8646-4cf9-ab31-1d23654df8d1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using hvmemul_linear_mmio_write() directly (as fallback when mapping the
memory operand isn't possible) won't work properly when the access
crosses a RAM/MMIO boundary. Use linear_write() instead, which splits at
such boundaries as necessary.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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


