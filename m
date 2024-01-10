Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642A829D2E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 16:12:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665585.1035812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaFi-0004lM-BT; Wed, 10 Jan 2024 15:12:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665585.1035812; Wed, 10 Jan 2024 15:12:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNaFi-0004iV-83; Wed, 10 Jan 2024 15:12:22 +0000
Received: by outflank-mailman (input) for mailman id 665585;
 Wed, 10 Jan 2024 15:12:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNa2Y-0006ap-VU
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:58:46 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c069aa27-afc8-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:58:45 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40e4d515cdeso23232845e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:58:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg3-20020a05600c3c8300b0040d91fa270fsm2449640wmb.36.2024.01.10.06.58.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:58:44 -0800 (PST)
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
X-Inumbo-ID: c069aa27-afc8-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704898725; x=1705503525; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FVPwAQJHu1Ys1D1OFhmt8x4WU9vXNMKYubLdP+XfH6Q=;
        b=erFj5vJh2thQooT5vy0Rw1I1D2RNBdGO1OmrTPd1QJxRCN6+fGdM7G/+BP6Z1Sr1KY
         XuNrcrwQ+HIGEV0BgH2YBstosPGXLnS7mQ0EebsfYKc0c1P3WkZEnUWqaVh28BjyPWqG
         1R/pHyNMwANdHs2f02DI8zvkmtYTeIclsyhn5VWBswym5L6hZm9QLs1o+wk4GeQCwyHa
         nNKbtZ1BhLI6ST1tabT360tI7XpI7i5KReexK9ctoS4lJDAqePv7gqQY6EjvK/jQPwQI
         W+hKtbgAIU7sNUfEQIzMpySg7UC0C9Ft0EETHxXwwNmNyPgDJw7L0K/MXs9JHeuqRjhY
         7EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898725; x=1705503525;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FVPwAQJHu1Ys1D1OFhmt8x4WU9vXNMKYubLdP+XfH6Q=;
        b=X36EksVIZ7lh+P3X9RCVdBCeHQsa3o6HG5i34g+bfUxygmKzQLMtZEVBesnlmulbzW
         PvsVHMn054sYYcYsLBzb+MZSvcAv7b+MfPiR2QKhfx2non0Aty4Mr9cLf/eqVDPvlB8v
         PeJhtQ5TWnGLfwXrHfJAakQyPNAFnNDB8unwPNI4TLkvuN0/Qlsxe8l05yHMwe5Rgiwl
         cmL6ftuMl3eTllA0iohcX5NdQWhYLHM0OGBvfxT66wy8jcH1CxErQpCktCpfTIuk+nDJ
         V9WElFJWP5/o3p4dhGz/rKRpe5GcaCTZE7sWS4UYgI3nSLzNIuLNlbUUTubb4xVX3YFr
         XSBQ==
X-Gm-Message-State: AOJu0YzhQalEH08FwBq2Hw+EG8wmzSctVrhC66/+rfZdnm0eaGW1WHWJ
	ifzbv0/hBBhTImLttdaSql95nxq7D6/P/dwl4W9yfVEFJA==
X-Google-Smtp-Source: AGHT+IEQURZurI+Nxdoq5cj14seNph29kf5M31nmN8egPlPmbh4clEL0LBFkFua7s/5+4DXD7kcgDA==
X-Received: by 2002:a05:600c:1e88:b0:40e:4daf:b73d with SMTP id be8-20020a05600c1e8800b0040e4dafb73dmr635076wmb.169.1704898724921;
        Wed, 10 Jan 2024 06:58:44 -0800 (PST)
Message-ID: <e3cf9c8b-f063-4612-a588-afb71c39be42@suse.com>
Date: Wed, 10 Jan 2024 15:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 5/5] x86/vIRQ: split PCI link load state checking from
 actual loading
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
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
In-Reply-To: <8110e31e-5411-467e-9c59-06751902853a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move the checking into a check hook, and add checking of the padding
fields as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
v4: New.

--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -749,6 +749,30 @@ static int cf_check irq_load_isa(struct
     return 0;
 }
 
+static int cf_check irq_check_link(const struct domain *d,
+                                   hvm_domain_context_t *h)
+{
+    const struct hvm_hw_pci_link *pci_link = hvm_get_entry(PCI_LINK, h);
+    unsigned int link;
+
+    if ( !pci_link )
+        return -ENODATA;
+
+    for ( link = 0; link < ARRAY_SIZE(pci_link->pad0); link++ )
+        if ( pci_link->pad0[link] )
+            return -EINVAL;
+
+    for ( link = 0; link < ARRAY_SIZE(pci_link->route); link++ )
+        if ( pci_link->route[link] > 15 )
+        {
+            printk(XENLOG_G_ERR
+                   "HVM restore: PCI-ISA link %u out of range (%u)\n",
+                   link, pci_link->route[link]);
+            return -EINVAL;
+        }
+
+    return 0;
+}
 
 static int cf_check irq_load_link(struct domain *d, hvm_domain_context_t *h)
 {
@@ -759,16 +783,6 @@ static int cf_check irq_load_link(struct
     if ( hvm_load_entry(PCI_LINK, h, &hvm_irq->pci_link) != 0 )
         return -EINVAL;
 
-    /* Sanity check */
-    for ( link = 0; link < 4; link++ )
-        if ( hvm_irq->pci_link.route[link] > 15 )
-        {
-            printk(XENLOG_G_ERR
-                   "HVM restore: PCI-ISA link %u out of range (%u)\n",
-                   link, hvm_irq->pci_link.route[link]);
-            return -EINVAL;
-        }
-
     /* Adjust the GSI assert counts for the link outputs.
      * This relies on the PCI and ISA IRQ state being loaded first */
     for ( link = 0; link < 4; link++ )
@@ -788,5 +802,5 @@ HVM_REGISTER_SAVE_RESTORE(PCI_IRQ, irq_s
                           1, HVMSR_PER_DOM);
 HVM_REGISTER_SAVE_RESTORE(ISA_IRQ, irq_save_isa, NULL, irq_load_isa,
                           1, HVMSR_PER_DOM);
-HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, NULL, irq_load_link,
-                          1, HVMSR_PER_DOM);
+HVM_REGISTER_SAVE_RESTORE(PCI_LINK, irq_save_link, irq_check_link,
+                          irq_load_link, 1, HVMSR_PER_DOM);


