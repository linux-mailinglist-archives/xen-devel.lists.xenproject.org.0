Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A16F843AF1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 10:21:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673860.1048370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6mB-0002R5-LS; Wed, 31 Jan 2024 09:20:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673860.1048370; Wed, 31 Jan 2024 09:20:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV6mB-0002PH-IC; Wed, 31 Jan 2024 09:20:59 +0000
Received: by outflank-mailman (input) for mailman id 673860;
 Wed, 31 Jan 2024 09:20:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rV6mA-0002P9-4h
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 09:20:58 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a69ef3f-c01a-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 10:20:57 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-51032e62171so5542720e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 01:20:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 18-20020a05600c025200b0040d4e1393dcsm997520wmj.20.2024.01.31.01.20.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 01:20:56 -0800 (PST)
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
X-Inumbo-ID: 0a69ef3f-c01a-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706692857; x=1707297657; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peipOnmfsgo0+TF6VdaI5c/UVx4GFyUKQ1LO5LDyhJ4=;
        b=Hk0HIoeaAic7btuOXG3fiqb5oI/EfXwIJcFAIVzmF6ujOI1d/ZPNGgrupLgY+bftXQ
         MfXTJWhyZhLf+OEwt6E8d6Tq10b6OpD89TJZGr+oWEq9Ff+PLjH5VnK5AU6dJb8+sEOQ
         3I5HBpNyq6D9eMzmwBRwyMeEt/zQKRrPVHUhRjH02iA5D5HlCvw4nRPZMlZBcRY7Chjq
         QAYs2AIBJc0BNa4dpAP+hN5mIR9HIa/6pxGQ6ESLvJbxUI+DnMgjg55D54QII/AgmepI
         1aceEGEfQIzWmx+IkZYv+vMjAI3ZjffMhVULW857KGNjMCc0rhYV3+I5morFy3IxvBvm
         UhVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692857; x=1707297657;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peipOnmfsgo0+TF6VdaI5c/UVx4GFyUKQ1LO5LDyhJ4=;
        b=BKUjZRl3sb2V2jfKo7aJQ0pWpwJxsPU/lyF3vwbmr3IDYT7EW8RSNFqx6TeAcdqa0F
         ge8PmuPy023gAJlVjkS5I3FkXdAQwPWIEI6NJaf5uga2h/nTyYmtqjh75WxngKYvAO7T
         tsIHT9qOe87j9Po8XCNhImxKjGJr8MeFlfhaMJ1CeyThelxcWfWD1H//1tHwlKIWXJ0B
         JFGjcxQ05OpZ8/uma3O8BbGIjfAwIhjPGrRrFeLdMNIwXD3LnB6XyUHAa3xhRmCnDJkC
         1tBU4yZxQLipenV0ovj3WIQNMLOEDEUgxqSP28fGJVYpk0ADpLnBR9vJ/Uk9lqZ5T6O5
         dG0w==
X-Gm-Message-State: AOJu0YzKfcuyMwnSyy6IOeJUtAKrX638WguMqnClp+rz+lSHqklcfMis
	joCcFO1eKcCyLmvJnlfcH/vA7dl3uq0dgE0/h6521sznR4PqrNz9I1U0c5X9akn9+kR7hd07BYI
	=
X-Google-Smtp-Source: AGHT+IHmA+6BwXm8UfwSIEdIyjxrhyckaB1PxHK2gCJUzOHXFJaLUsCx6Ha3STFSi4tqOCxhI7HdfA==
X-Received: by 2002:a05:6512:214a:b0:50e:9d0e:85f0 with SMTP id s10-20020a056512214a00b0050e9d0e85f0mr813017lfr.69.1706692856721;
        Wed, 31 Jan 2024 01:20:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWQxYowxiJQuSV+3Mr0/yfZSzwwUPp0V/wAYAkFh7dgZnLoG9ptmgTDaRE+nSPKAiR8zauP/CP45eHXiGsK04zsincK5NdR7AMOzUFAjeac/oNO62azQiK5eIw=
Message-ID: <61084180-d44a-4664-be13-462706587668@suse.com>
Date: Wed, 31 Jan 2024 10:20:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Kevin Tian <kevin.tian@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] IOMMU: iommu_use_hap_pt() implies CONFIG_HVM
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

Allow the compiler a little more room on DCE by moving the compile-time-
constant condition into the predicate (from the one place where it was
added in an open-coded fashion for XSA-450).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -438,7 +438,7 @@ static paddr_t domain_pgd_maddr(struct d
 
     if ( pgd_maddr )
         /* nothing */;
-    else if ( IS_ENABLED(CONFIG_HVM) && iommu_use_hap_pt(d) )
+    else if ( iommu_use_hap_pt(d) )
     {
         pagetable_t pgt = p2m_get_pagetable(p2m_get_hostp2m(d));
 
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -381,7 +381,8 @@ struct domain_iommu {
 #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
 
 /* Are we using the domain P2M table as its IOMMU pagetable? */
-#define iommu_use_hap_pt(d)       (dom_iommu(d)->hap_pt_share)
+#define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
+                                   dom_iommu(d)->hap_pt_share)
 
 /* Does the IOMMU pagetable need to be kept synchronized with the P2M */
 #ifdef CONFIG_HAS_PASSTHROUGH

