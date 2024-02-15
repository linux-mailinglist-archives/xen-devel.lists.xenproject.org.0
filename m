Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BB2855F06
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:20:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681532.1060365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYqM-00065P-Gc; Thu, 15 Feb 2024 10:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681532.1060365; Thu, 15 Feb 2024 10:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raYqM-00062s-Dp; Thu, 15 Feb 2024 10:19:50 +0000
Received: by outflank-mailman (input) for mailman id 681532;
 Thu, 15 Feb 2024 10:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raYqL-00062N-DJ
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:19:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id becc0f8a-cbeb-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 11:19:47 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33d10936af1so63996f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:19:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bs3-20020a056000070300b0033b45bdb2a1sm1361072wrb.4.2024.02.15.02.19.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:19:46 -0800 (PST)
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
X-Inumbo-ID: becc0f8a-cbeb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707992387; x=1708597187; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n1vU3iIA9oaJ5u3mwUz26PW+j70BjJveVatCei2osX4=;
        b=A7AkwQ4YMd9dftW5esA3vyDOBmmJNEgTY2RgxZs5rdusj6OxC5sZZxqMBu/1T6RCkQ
         DOQOnlj9TELtJGKRIZl6uu17GNCZ3KVhmYQ5AmvA6TStwwhhVhK82WjHk/QvRb6VXh9m
         XqJKV/WzL3JwXvyMQflF+fvMW7Ak68V4e2QBLGq//xlA0Xr6nxxxgUe20Z4GY+rYT8FZ
         IBMWd7iG8vw+YzEXndb357jaBt9PkIxjGz2e7UG5zcOo3xzi6/Te8rU3gT+PnxkTqzt4
         yGPybe31O+456ngkHhXaSXRQdNT2I9ikeFli8BvwhJlYzRw2t7w9ben9ApIX+z20l/Wn
         d4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707992387; x=1708597187;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1vU3iIA9oaJ5u3mwUz26PW+j70BjJveVatCei2osX4=;
        b=XD7fxLOft60MqoC9ZwYhspOrqBI2n7QYZC82DE4TnxQsqkfhy8w4AwNwvHqVRBDpqp
         SAaHeUY1pDZT/a+BC19+Pm7RfAbZkgFQja+pBt7KnCxGujiCkaEIUxlJT56b/BW1AxcR
         +fEhYWMeip+fxuHB9ksJBiWWY1ghuWcmutKvcHHzuRE3mPos5fhWReFmINfCKvRGGlFM
         WXpSEPOr9oNMGMcEw7PJhdQpfWpXf5gpGQ8LF9p91D8ng7btm+TCVZp0ZMv5C7IAiYZY
         nLr0GRUf9Qiq1VnlHg6Oh85mn2zjzT08kbxZNJ0h06SZHbC4HnXdrJc8FtQKQ7E+q7mN
         HJ9Q==
X-Gm-Message-State: AOJu0YwlIlh2ky1u/9A4gNcQRJiAtCbD03eiBy2lJ+rYRc3oCNTG9sms
	HiEORAsAfpODYuS+zEk9Fp/5J5aory7beKlJnm2fV7rDpjxUX+LLiKBgnLqdBn17QAcm/zmFV4E
	=
X-Google-Smtp-Source: AGHT+IGIfIj8HOKsHO7ITuiOtJqVOoRtnWdu7rLwJYHY0y3h/emNo2LUPfyhohPAdb/ytCC6Nmdofg==
X-Received: by 2002:a5d:644b:0:b0:33b:68c0:8e2f with SMTP id d11-20020a5d644b000000b0033b68c08e2fmr1001767wrw.46.1707992386941;
        Thu, 15 Feb 2024 02:19:46 -0800 (PST)
Message-ID: <edec0260-e338-49aa-a21f-c507ef9e35cb@suse.com>
Date: Thu, 15 Feb 2024 11:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 12/12] PCI/ATS: tidy {en,dis}able_ats_device() a little
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Kevin Tian <kevin.tian@intel.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>
References: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
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
In-Reply-To: <64b028be-2197-4951-ae5b-32f9eabfa84a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use appropriate types for the control register value as well as the
capability position. Constify a pointer. Use "else" in favor of encoding
the opposite condition of the earlier if().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/drivers/passthrough/ats.c
+++ b/xen/drivers/passthrough/ats.c
@@ -23,10 +23,9 @@ boolean_param("ats", opt_ats);
 
 int enable_ats_device(struct pci_dev *pdev, struct list_head *ats_list)
 {
-    u32 value;
-    int pos;
+    uint16_t value;
+    unsigned int pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
 
-    pos = pci_find_ext_capability(pdev->sbdf, PCI_EXT_CAP_ID_ATS);
     BUG_ON(!pos);
 
     if ( iommu_verbose )
@@ -35,7 +34,7 @@ int enable_ats_device(struct pci_dev *pd
     value = pci_conf_read16(pdev->sbdf, pos + ATS_REG_CTL);
     if ( value & ATS_ENABLE )
     {
-        struct pci_dev *other;
+        const struct pci_dev *other;
 
         list_for_each_entry ( other, ats_list, ats.list )
             if ( other == pdev )
@@ -44,8 +43,7 @@ int enable_ats_device(struct pci_dev *pd
                 break;
             }
     }
-
-    if ( !(value & ATS_ENABLE) )
+    else
     {
         value |= ATS_ENABLE;
         pci_conf_write16(pdev->sbdf, pos + ATS_REG_CTL, value);
@@ -69,7 +67,7 @@ int enable_ats_device(struct pci_dev *pd
 
 void disable_ats_device(struct pci_dev *pdev)
 {
-    u32 value;
+    uint16_t value;
 
     BUG_ON(!pdev->ats.cap_pos);
 


