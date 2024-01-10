Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 805E1829C9E
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 15:31:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665533.1035736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZcL-0001Lh-Ha; Wed, 10 Jan 2024 14:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665533.1035736; Wed, 10 Jan 2024 14:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNZcL-0001K8-EN; Wed, 10 Jan 2024 14:31:41 +0000
Received: by outflank-mailman (input) for mailman id 665533;
 Wed, 10 Jan 2024 14:31:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNZcK-0001K2-6C
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 14:31:40 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f64304bb-afc4-11ee-9b0f-b553b5be7939;
 Wed, 10 Jan 2024 15:31:37 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e4d64a3fbso23741445e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 06:31:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 hn3-20020a05600ca38300b0040e4a7a7ca3sm2279388wmb.43.2024.01.10.06.31.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 06:31:36 -0800 (PST)
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
X-Inumbo-ID: f64304bb-afc4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704897097; x=1705501897; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sHxjG98LecqqReEuFxkx/WoqeZa3gn+LST6HBOBZTZw=;
        b=W72yvK764El4z7oFGObXpNzl36Xrd+dHPiCMpIg1RettivtRlb6feDm0k4PQC+9afM
         5vK63Qc0LVhnb5MhpFLg/3nm3qgweXHWdzJTladoomBGqYniMA6OTcDpHwm/6Wfi+tzf
         VhygoFBWw48nkzgK0T4eU3oyb+xjT9mNkhQrDPGit0MizhtrrN/C5CI0LuQhZjQBG/P+
         BLsmRD7bEImPrtqrqs86KC8cPTpRDPxWqpxdaCOpaXvZKkQjYy0Ptnhd7unWfOq7lQoq
         mh+DkuMPaJAz3Alu1TgObjZxCI9xFzuJAXpgEd5n9U0i6XbZmvuCDYOHoEh+7Dt/NPOB
         LQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704897097; x=1705501897;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sHxjG98LecqqReEuFxkx/WoqeZa3gn+LST6HBOBZTZw=;
        b=v+5/8b/maxGCi8+oA5455HGDcGD+3BsOchZO2GDd0E9SpONa+FlQ8FcMaUa/ogrZ3q
         YFwBpFlcqK/kb3Xl0s2hNtMQmNPdM1t71gvT4Ez/ntvfbTp1gQdXNBgaLZ+ileJfdP/J
         U3XIz8Z97DoFyhvcZuONI0YHZu2/ft7U2wgI6LB+sZrkk6dasrjSVDcQVzyO8Uf0x1gQ
         WxM88TRl0jsMWJT2gDShG99nOKv4PvStzE7CDeJ0S4CqMI/rWigcbk969d5F2P9VMhDl
         /AL9zSRw0drJUm/1JkGtPWDqwllbeBloXiluBHxkEwBMZil/nsg2A6LmnSlSLDUimeip
         089Q==
X-Gm-Message-State: AOJu0YxiHZdSWX/rkhTQqw4JI0xKtqOQEitMVaZXWt2diRP3EaL8e1jc
	fpCGRkioTcBrxRp1+hAwRMpOIXsvcuDIQUIPE/EfY+jn6A==
X-Google-Smtp-Source: AGHT+IGswRAc/27csMag6lHzpYzhgYziv9XQyEb7c/QOhTkOoRH/MyrKH0xikXKQAbLeQhznC1GR/Q==
X-Received: by 2002:a7b:cd17:0:b0:40e:5573:1b7 with SMTP id f23-20020a7bcd17000000b0040e557301b7mr575556wmj.103.1704897097174;
        Wed, 10 Jan 2024 06:31:37 -0800 (PST)
Message-ID: <4db3f6fd-ba51-43d2-89f7-adbdaf720874@suse.com>
Date: Wed, 10 Jan 2024 15:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3] NUMA: limit first_valid_mfn exposure
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Address the TODO regarding first_valid_mfn by making the variable static
when NUMA=y, thus also addressing a Misra C:2012 rule 8.4 concern (on
x86). To carry this out, introduce two new IS_ENABLED()-like macros
conditionally inserting "static". One less macro expansion layer is
sufficient though (I might guess that some early form of IS_ENABLED()
pasted CONFIG_ onto the incoming argument, at which point the extra
layer would have been necessary), and part of the existing helper macros
can be re-used.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Introduce STATIC_IF{,_NOT}().
v2: New, split off.

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -255,12 +255,10 @@ static PAGE_LIST_HEAD(page_broken_list);
  */
 
 /*
- * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
- *
- * TODO: Consider if we can conditionally export first_valid_mfn based
- * on whether NUMA is selected.
+ * When !CONFIG_NUMA first_valid_mfn is non-static, for use by respective
+ * stubs.
  */
-mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
+STATIC_IF(CONFIG_NUMA) mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
 struct bootmem_region {
     unsigned long s, e; /* MFNs @s through @e-1 inclusive are free */
--- a/xen/include/xen/kconfig.h
+++ b/xen/include/xen/kconfig.h
@@ -11,6 +11,8 @@
 /* cppcheck is failing to parse the macro so use a dummy one */
 #ifdef CPPCHECK
 #define IS_ENABLED(option) option
+#define STATIC_IF(option) option
+#define STATIC_IF_NOT(option) option
 #else
 /*
  * Getting something that works in C and CPP for an arg that may or may
@@ -31,6 +33,17 @@
  * otherwise.
  */
 #define IS_ENABLED(option) config_enabled(option)
+
+/* Use similar trickery for conditionally inserting "static". */
+#define static_if(value) _static_if(__ARG_PLACEHOLDER_##value)
+#define _static_if(arg1_or_junk) ___config_enabled(arg1_or_junk static,)
+
+#define STATIC_IF(option) static_if(option)
+
+#define static_if_not(value) _static_if_not(__ARG_PLACEHOLDER_##value)
+#define _static_if_not(arg1_or_junk) ___config_enabled(arg1_or_junk, static)
+
+#define STATIC_IF_NOT(option) static_if_not(option)
 #endif
 
 #endif /* __XEN_KCONFIG_H */

