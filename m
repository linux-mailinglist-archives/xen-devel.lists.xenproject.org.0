Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B459E8173E6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656072.1024037 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEo2-0004t1-BT; Mon, 18 Dec 2023 14:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656072.1024037; Mon, 18 Dec 2023 14:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEo2-0004qq-7p; Mon, 18 Dec 2023 14:41:18 +0000
Received: by outflank-mailman (input) for mailman id 656072;
 Mon, 18 Dec 2023 14:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEo0-0003LJ-8S
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:41:16 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f5c899e-9db3-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 15:41:15 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40b5155e154so39167485e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:41:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0040c4acaa4bfsm31329915wmo.19.2023.12.18.06.41.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:41:15 -0800 (PST)
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
X-Inumbo-ID: 7f5c899e-9db3-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910475; x=1703515275; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SA83WH/tVAa+8UrSlLg9fG17XrU318HxH5GSIudImvg=;
        b=S+0IbRap4/C1EFSlMJkMYUCyD+9KP7RY88e28IOhlK/wUI4EgE7AqyVDLq9AD1Vv5q
         n+kbVDKcd8la/QSzhEug/EMlt8PZhIBlvkwXieqV4AzZCUDQZqemFdIpl4lH8nyv//i8
         UPTa+cZQn1PDFHgBnRSR4jQMHPLixGIbF7631cOrnkcHz48ugEVE6lU7aKt5VL6LtXlR
         oyy5jeFoNYDc/I3kjdsalnG0FVvR3s/OqdxI+hP31qpvtV4CjM54Xq8sThcsNb/JnKeF
         gzSssWTqP0NqIBm08m2eeM/UHgK3O9a+vpChy3vsr75r+eM9jt9wq3VVNxS3s21AUqpQ
         XEoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910475; x=1703515275;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SA83WH/tVAa+8UrSlLg9fG17XrU318HxH5GSIudImvg=;
        b=s8lDsJC/XI4gmjuUZ3G+rvVJkEoRIkpf89S+jyX1dp+ouNtkDep51tCBE7TeaNIitf
         LulXkRh4Q1R1dI6O0BXCuMro40AK3/jfTTCVOgTj71LH1uk1Z7fem81x9aDV4xTyMueZ
         dMfpJe9VfDhuhhqNtRm9KUuWAa7RYGOxvuCQVw3m1zOuHsBIIIIqn0zFPiY75RKFhKCS
         nMIvPsM1DYFakiViNQwigoq5TB+KoNF3D/8v9YfZ7jIV2F8EW2N4Gz+A+gLCTmJCtB08
         P3NqVLiiZL77Z7eo0ZqFlMzLl6htrSMTZFqVBIGdFpW/B7IRhxlClYEyc8I8IiyOgaBw
         UaTw==
X-Gm-Message-State: AOJu0YxKaV1qPgRA/4RPkfu6B9gF2hShRWQ4SCUj4Iyg6HPQHpY6OjOR
	IO/+29PI8IOkIMPLiLVwx+nou2jGSA7ixDPFP57T
X-Google-Smtp-Source: AGHT+IEealb4TeglQHiJMGnJmhQlZzJDKrMBnAgY1fG14D5192f8JWEwkO3UZFcej4VUE8t1+TV/wA==
X-Received: by 2002:a05:600c:1c9d:b0:40c:837:f033 with SMTP id k29-20020a05600c1c9d00b0040c0837f033mr7923825wms.61.1702910475359;
        Mon, 18 Dec 2023 06:41:15 -0800 (PST)
Message-ID: <3bd1a8b8-1ed5-4d3a-8f5a-e193fdab7e1d@suse.com>
Date: Mon, 18 Dec 2023 15:41:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 5/5] x86/vIRQ: split PCI link load state checking from
 actual loading
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
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
In-Reply-To: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Move the checking into a check hook, and add checking of the padding
fields as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


