Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281BB973A1F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:40:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795698.1205152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so22I-0003MP-4g; Tue, 10 Sep 2024 14:40:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795698.1205152; Tue, 10 Sep 2024 14:40:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so22I-0003Kg-1R; Tue, 10 Sep 2024 14:40:06 +0000
Received: by outflank-mailman (input) for mailman id 795698;
 Tue, 10 Sep 2024 14:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so22H-0001bT-Cp
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:40:05 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90c331a7-6f82-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:40:03 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c26311c6f0so7009139a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:40:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd8c4c6sm4339178a12.86.2024.09.10.07.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:40:02 -0700 (PDT)
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
X-Inumbo-ID: 90c331a7-6f82-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979203; x=1726584003; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JtF6rX15d8QXjen/iS3ft5RyDQCEqObl6NadGkjDRxw=;
        b=fcBuJULcHGZ/hcW5X1C04UxOFq7NeoG11mNZZTMsu8j0IVGNMccRil/B8sJI8MrcwI
         b5/g95TmkdZ5ttGZJch4iUkaa26XdOcIMPsBrIDo6Chmc1Z8NX8elY4PVX27diLdKY7u
         LqE55N2STItwuQHdgagbUC4rbhpoqliHLvHEz3fWvSTjpw1LK0zRMK1qs9EonvjdBRVq
         tv61TvWANEw0N6pr0sdUN7hI3nR8h/RcAksfc6HzeZp9hEESuyxnL/r5ZY1z67hxHdrX
         egWF6wr7JTxNz3d0Iys97HZTf9HwUvNjOIMIc95AZ5jqJmP48IRpIWxRZjIQxYLMjpby
         YCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979203; x=1726584003;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtF6rX15d8QXjen/iS3ft5RyDQCEqObl6NadGkjDRxw=;
        b=d6QSBmkg+y/LZKaBEjtF+xXczPCP6k5es+d2qjLW7Q7DMMiVCvEtswnAHzZ5UOQDtr
         eZgzGEe7z5GSVmrfxdcOxuXJGdeKnkacmXtrpaIqoU+4ntVYKeYsdjIO8wvNJjGzJ6wH
         ZRY0FjBAu+RM9H3jkMRyoF2mcmFl75SCGFY2vOqClaxMM5LU4gEZM77E6dPGZyIko9m6
         CYkHEYAHPDh1ozXQvTNOUhy6QYMpnOAeLpIL7T44sZot0bn8XhNG5t50XFicCQ1lulIV
         ybLTaj3Q9F/BxKMJRdwgSjLNYqnRpgcJwsz408E7WiBK3s3Zcu/QGhMzvtRIGsEXes15
         pBVg==
X-Gm-Message-State: AOJu0YzJMJLI1gojCh1rAI3DDgQRFkUH/yYLgBqt3nkiciFHSBrcq9EV
	I8zpGoJudLSquZwLpmtDtuJggdX/pV9XSIQbK/HZdQFB3xOFiPmvUNnT+V+Rc0XzBlOntahRlJU
	=
X-Google-Smtp-Source: AGHT+IHnI3SrYGR6O7LNUw/aJlCsNCoWnLkRrnmBDU9XXILtpTC5z90FwZZT5TaGg4cLwAGdosuKKQ==
X-Received: by 2002:a05:6402:3894:b0:5c2:6c2d:3fb3 with SMTP id 4fb4d7f45d1cf-5c3dc7cc3fcmr8017407a12.36.1725979203038;
        Tue, 10 Sep 2024 07:40:03 -0700 (PDT)
Message-ID: <836afb28-581c-4ab8-a0a9-badf29a51b5e@suse.com>
Date: Tue, 10 Sep 2024 16:40:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/7] x86/HVM: drop stdvga's "stdvga" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
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
In-Reply-To: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Two of its consumers are dead (in compile-time constant conditionals)
and the only remaining ones are merely controlling (debugging) log
messages. Hence the field is now pointless to set, which in particular
allows to get rid of the questionable conditional from which the field's
value was established (afaict 551ceee97513 ["x86, hvm: stdvga cache
always on"] had dropped too much of the earlier extra check that was
there, and quite likely further checks were missing).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -498,19 +483,17 @@ static bool cf_check stdvga_mem_accept(
 
     spin_lock(&s->lock);
 
-    if ( p->dir == IOREQ_WRITE && p->count > 1 )
+    if ( p->dir != IOREQ_WRITE || p->count > 1 )
     {
         /*
          * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
          * first cycle of an I/O. So, since we cannot guarantee to always be
          * able to send buffered writes, we have to reject any multi-cycle
-         * I/O.
+         * I/O. And of course we have to reject all reads, for not being
+         * able to service them.
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


