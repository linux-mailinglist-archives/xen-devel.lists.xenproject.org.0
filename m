Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE65975215
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796514.1206136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMS4-000579-Pa; Wed, 11 Sep 2024 12:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796514.1206136; Wed, 11 Sep 2024 12:28:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMS4-000553-MV; Wed, 11 Sep 2024 12:28:04 +0000
Received: by outflank-mailman (input) for mailman id 796514;
 Wed, 11 Sep 2024 12:28:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMS2-0004dX-Nd
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:28:02 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48e47fb4-7039-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:28:01 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2f74e613a10so17139071fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:28:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25a25897sm607259666b.87.2024.09.11.05.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:28:00 -0700 (PDT)
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
X-Inumbo-ID: 48e47fb4-7039-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057680; x=1726662480; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XLf/RPw1YIOaKr3H1z6R8wvZ7gEJiJagpvfMhvGlBU0=;
        b=IoBY8hwjB/nbM0MzFD/3DTXq0/fHD04ZVfUXjhbjmJW55RaKhUF5HNk4cWfRIFwFYx
         vJfgtGe5/MV8s+MDKvIw8yBj1t47iJ6BUYCTBwVdz+sC95YycdRHkQuHPc67z4sRbQiy
         W7lskPOGwJePbzvy5376n0eb6x73Sq5e6rWk9lExTFdx6Hfi3maQoXSIpSlevyrz7Szv
         bu4SMwDMxXPzANLSmzqi1z5cxziD/czF+8ITOTX4dn4Mh2JtMqIxl4DW2sGmSQm9ALXy
         yhZ7UWwkcihC0+FnQDhiVymsZWJs6aRoy8IMlGYgQTJ3elAPY+8tBez5I+jOKejzKTpB
         ntdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057680; x=1726662480;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLf/RPw1YIOaKr3H1z6R8wvZ7gEJiJagpvfMhvGlBU0=;
        b=o38EOUUs3z3kyp7FZbq+UuKEwvl9lVVACb+VUNpCIjB9cav7atPI7HY7udCUAWV2qh
         ax8Xmabs7q3leE0eIwUIqMvNaNRRvN6FoXFIW7zhVdtgsMOE+wb/Fzh5JeclgYttkBZ2
         Dw56hyrB2Qj8X33KMbKdi5VH+VaH9kssMtJd5S7YcZJe7Dg6B+lVHzQVnFbQyCH5a65m
         +XVzkyOTdGOdzGqqqgkX1L9vVLVGAJDV0GsL/TDhX3reSuNVXLkHbD3L136bf+9ouigG
         CBPO8H1xeAZdNjU57Q89EqBTam2JtHSoQHXxuFe4EqqVIgufHJ/sN3Dn4VEvIdKbF4tp
         3dWQ==
X-Gm-Message-State: AOJu0YwbQfbJ8Vb0z0QflirEdvmGhpXhfkap36okxD/L2dSbZRcC4ToT
	mj8YueMCgPc9uUE3peeAXQt6bOCu5XG9NM+1MI9chmZB5plAgdGQ8xLtE20HvQfGIRFcFtK8FW8
	=
X-Google-Smtp-Source: AGHT+IF7+XNohs41mv2XyAhSG7oyRfbWf88mp+hBBrTq6JcaHcBwnaql3WBTXItFJ10ANOC1u6SSMg==
X-Received: by 2002:a05:6512:108b:b0:536:536f:5ed4 with SMTP id 2adb3069b0e04-536587a682amr17822718e87.6.1726057680253;
        Wed, 11 Sep 2024 05:28:00 -0700 (PDT)
Message-ID: <08544fc6-bca0-4c69-8f88-3745ed351d53@suse.com>
Date: Wed, 11 Sep 2024 14:28:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/9] x86/HVM: drop stdvga's "stdvga" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
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
In-Reply-To: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Two of its consumers are dead (in compile-time constant conditionals)
and the only remaining ones are merely controlling debug logging. Hence
the field is now pointless to set, which in particular allows to get rid
of the questionable conditional from which the field's value was
established (afaict 551ceee97513 ["x86, hvm: stdvga cache always on"]
had dropped too much of the earlier extra check that was there, and
quite likely further checks were missing).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Reduce a (largely pre-existing) comment. Re-base over new earlier
    patch.

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -103,7 +103,7 @@ static void vram_put(struct hvm_hw_stdvg
 static int stdvga_outb(uint64_t addr, uint8_t val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-    int rc = 1, prev_stdvga = s->stdvga;
+    int rc = 1;
 
     switch ( addr )
     {
@@ -132,19 +132,6 @@ static int stdvga_outb(uint64_t addr, ui
         break;
     }
 
-    /* When in standard vga mode, emulate here all writes to the vram buffer
-     * so we can immediately satisfy reads without waiting for qemu. */
-    s->stdvga = (s->sr[7] == 0x00);
-
-    if ( !prev_stdvga && s->stdvga )
-    {
-        gdprintk(XENLOG_INFO, "entering stdvga mode\n");
-    }
-    else if ( prev_stdvga && !s->stdvga )
-    {
-        gdprintk(XENLOG_INFO, "leaving stdvga mode\n");
-    }
-
     return rc;
 }
 
@@ -425,7 +412,6 @@ static int cf_check stdvga_mem_write(
     const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
     uint64_t data)
 {
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
         .addr = addr,
@@ -436,8 +422,7 @@ static int cf_check stdvga_mem_write(
     };
     struct ioreq_server *srv;
 
-    if ( true || !s->stdvga )
-        goto done;
+    goto done;
 
     /* Intercept mmio write */
     switch ( size )
@@ -498,19 +483,14 @@ static bool cf_check stdvga_mem_accept(
 
     spin_lock(&s->lock);
 
-    if ( p->dir == IOREQ_WRITE && (p->data_is_ptr || p->count != 1) )
+    if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
     {
         /*
-         * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
-         * first cycle of an I/O. So, since we cannot guarantee to always be
-         * able to send buffered writes, we have to reject any multi-cycle
-         * or "indirect" I/O.
+         * Only accept single direct writes, as that's the only thing we can
+         * accelerate using buffered ioreq handling.
          */
         goto reject;
     }
-    else if ( p->dir == IOREQ_READ &&
-              (true || !s->stdvga) )
-        goto reject;
 
     /* s->lock intentionally held */
     return 1;
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -115,7 +115,6 @@ struct hvm_hw_stdvga {
     uint8_t sr[8];
     uint8_t gr_index;
     uint8_t gr[9];
-    bool stdvga;
     uint32_t latch;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;


