Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E559643AD
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785725.1195214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdpB-0001Lq-0s; Thu, 29 Aug 2024 12:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785725.1195214; Thu, 29 Aug 2024 12:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdpA-0001Jo-UA; Thu, 29 Aug 2024 12:00:24 +0000
Received: by outflank-mailman (input) for mailman id 785725;
 Thu, 29 Aug 2024 12:00:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdp9-0008JK-Qg
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:00:23 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 455805a8-65fe-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:00:23 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5bed0a2ae0fso533878a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 05:00:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8989196975sm70956866b.135.2024.08.29.05.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 05:00:21 -0700 (PDT)
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
X-Inumbo-ID: 455805a8-65fe-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932823; x=1725537623; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DYYTaskfgTvZ4g7no0G93dtPg+JMiV4HrqW3HUo5R4s=;
        b=d1DkFcV9b9YyqNhCdkOBN52MNpS8JLObuGqmoTJrOBsOxM0z1GMaaaCEVfD0+jiZhk
         a+Ax2W1HP8iTfYTpxeoiQ+8oo2DEawCsAYzwE0izonJ8QbdFGi39DWdy96tjH6MMiXZY
         B1mfvoQsDt9Q9IHsQ1y0bGJG9eC9U0tBaYNvOaVH/xMvMcZfcOqJtyF7045glHdw6cxY
         anPrKnFp5eAnzlDC9O3MhjYnIoO18zNLZfTNIPm7D2Pys8J4E8Nxl2DZMyFV3s2ixGig
         LCVraR/b4clhZIaaksionF8L2op4AybCKPFFWD2cqKQ7IlCXjOrXL1hyH7lJMDymrWnS
         1LZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932823; x=1725537623;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DYYTaskfgTvZ4g7no0G93dtPg+JMiV4HrqW3HUo5R4s=;
        b=DpAoTO09JEaXrhCMNP9hLeu17yzKDTpoIaajuNndO1zi2TvL9dm89D1mzVvCoXSzDT
         yIykyRlgjTun7zIVYLGPE9EZaY+1NtSeVyn+sCYEt59XofsdZyUBw6sUqDuQQeJihnL2
         ofhdkJxf3nElh5tukbp6xvv5cyZc2Q71GtLgWMOu+m2AtoFpIm2tFNjILsbkwvb9okUs
         mjAcQrrOxzwPnDChEKx9MuQnlSeb2kS0JDizvnACX6ctq5UUR4olPjRzpbl20RvqNRwJ
         7PfpwWVEDJQwc/IHF5Bz8zdCBX54Rnr8GQCnxOE6/XXV2p6bm3mz4NKkIZnJWNhXbENT
         KwQg==
X-Gm-Message-State: AOJu0YxqtWEVzndiuX5ZXrm8ohlMWJMJ/Hu6wUdtnK+JjtlyppyqBVzx
	cchCx9L4wrZ1fvCSz+0D5Hkhlthf8YQNOS7VAiCytRRQG1AZ9MSfPD+L7eK2FqeH29UmIxKN4mU
	=
X-Google-Smtp-Source: AGHT+IE8ZUfXZU3uzZZtba31YP3xh8mJLc4nhklYgKzdkfAwkLo8V7Y/UxggnnumlinqBwN2YvoPvg==
X-Received: by 2002:a05:6402:90d:b0:5c0:a8c0:3726 with SMTP id 4fb4d7f45d1cf-5c21ed54acamr1783229a12.19.1724932822369;
        Thu, 29 Aug 2024 05:00:22 -0700 (PDT)
Message-ID: <a3c8c66a-3b90-49e3-bf49-b73fa05a1f64@suse.com>
Date: Thu, 29 Aug 2024 14:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/5] types: replace remaining uses of s16
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
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
In-Reply-To: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... and move the type itself to linux-compat.h.

While doing so switch an adjacent x86 struct page_info field to bool.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -135,7 +135,7 @@ static s32 get_addend(unsigned char type
         addend =  (*(u32 *)dest & 0x00000FFF);
         addend |= (*(u32 *)dest & 0x000F0000) >> 4;
         /* Addend is to sign-extend ([19:16],[11:0]). */
-        addend = (s16)addend;
+        addend = (int16_t)addend;
         break;
 
     case R_ARM_CALL:
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -124,7 +124,7 @@ static int reloc_data(enum aarch64_reloc
     switch ( len )
     {
     case 16:
-        *(s16 *)place = sval;
+        *(int16_t *)place = sval;
         if ( sval < INT16_MIN || sval > UINT16_MAX )
 	        return -EOVERFLOW;
         break;
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -67,8 +67,8 @@ struct irq_desc;
  * the old destinations.
  */
 struct arch_irq_desc {
-        s16 vector;                  /* vector itself is only 8 bits, */
-        s16 old_vector;              /* but we use -1 for unassigned  */
+        int16_t vector;                  /* vector itself is only 8 bits, */
+        int16_t old_vector;              /* but we use -1 for unassigned  */
         /*
          * Except for high priority interrupts @cpu_mask may have bits set for
          * offline CPUs.  Consumers need to be careful to mask this down to
--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -286,8 +286,8 @@ struct page_info
         struct {
             u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
             u16 :16 - PAGETABLE_ORDER - 1 - 1;
-            u16 partial_flags:1;
-            s16 linear_pt_count;
+            bool partial_flags:1;
+            int16_t linear_pt_count;
         };
 
         /*
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1390,7 +1390,7 @@ unmap_common(
     struct grant_table *lgt, *rgt;
     grant_ref_t ref;
     struct active_grant_entry *act;
-    s16              rc = 0;
+    int16_t          rc;
     struct grant_mapping *map;
     unsigned int flags;
     bool put_handle = false;
@@ -2580,7 +2580,7 @@ acquire_grant_for_copy(
     uint16_t trans_page_off;
     uint16_t trans_length;
     bool is_sub_page;
-    s16 rc = GNTST_okay;
+    int16_t rc = GNTST_okay;
     unsigned int pin_incr = readonly ? GNTPIN_hstr_inc : GNTPIN_hstw_inc;
 
     *page = NULL;
@@ -3416,14 +3416,14 @@ gnttab_get_version(XEN_GUEST_HANDLE_PARA
     return 0;
 }
 
-static s16
+static int16_t
 swap_grant_ref(grant_ref_t ref_a, grant_ref_t ref_b)
 {
     struct domain *d = rcu_lock_current_domain();
     struct grant_table *gt = d->grant_table;
     struct active_grant_entry *act_a = NULL;
     struct active_grant_entry *act_b = NULL;
-    s16 rc = GNTST_okay;
+    int16_t rc = GNTST_okay;
 
     grant_write_lock(gt);
 
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -43,6 +43,7 @@
 #include <xen/err.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/linux-compat.h>
 #include <xen/list.h>
 #include <xen/mm.h>
 #include <xen/vmap.h>
--- a/xen/include/xen/linux-compat.h
+++ b/xen/include/xen/linux-compat.h
@@ -13,7 +13,7 @@
 
 typedef int8_t  s8, __s8;
 typedef uint8_t __u8;
-typedef int16_t __s16;
+typedef int16_t s16, __s16;
 typedef int32_t __s32;
 typedef int64_t __s64;
 
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -6,7 +6,6 @@
 
 /* Linux inherited types which are being phased out */
 typedef uint8_t u8;
-typedef int16_t s16;
 typedef uint16_t u16, __u16;
 typedef int32_t s32;
 typedef uint32_t u32, __u32;


