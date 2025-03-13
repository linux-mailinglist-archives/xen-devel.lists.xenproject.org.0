Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CCFA5F6CE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:54:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912239.1318556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj0V-0005fg-DM; Thu, 13 Mar 2025 13:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912239.1318556; Thu, 13 Mar 2025 13:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj0V-0005de-9M; Thu, 13 Mar 2025 13:53:55 +0000
Received: by outflank-mailman (input) for mailman id 912239;
 Thu, 13 Mar 2025 13:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsj0T-0005Eo-Qa
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:53:53 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 991c7f28-0012-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:53:53 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43948021a45so8562395e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:53:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d188bb577sm21275545e9.19.2025.03.13.06.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:53:51 -0700 (PDT)
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
X-Inumbo-ID: 991c7f28-0012-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741874032; x=1742478832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy8f/0LGlSutg/mtmD9f1iBXGGEL7ZBLLMqdPuSrLnU=;
        b=Bq82f5+0XUOlWERvnfPtYutYU/H+RB1MAEXhjZUTbNz6T3Bn8zm4MLfM0Ij9nhPi9s
         RFYzCvzjv1FooG69+Onni6bXbieeTv3N2KhJSv2oIUrddAe4Z52PmFpgz+7fRJ+oHRGW
         sp7gblv1lwHytuQsYDw16HHnIs1g0SPHgd2OyTsZW4HkL/FPVKSV2M4t7YSOhaM+0szc
         B+YJQ0VvX/6JXJhQ8yLCCyRGvcj0sllD49DVxiuWqG17qDAx+ZMdQ7g0p/v3bA0gBegw
         wA1G2sfFRsSLU2Hs7faCq0FqLsAJeeeAHQ5fAlIhL2+eL+aERtCKmcpwMBfXCVWQ67Nv
         wknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874032; x=1742478832;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy8f/0LGlSutg/mtmD9f1iBXGGEL7ZBLLMqdPuSrLnU=;
        b=DeWgUsPjJEElPgyBHRSFmP3jH9KIzHH3qSeUIIyRx2Ku6W33k6dhCcgVjoDzo1csbE
         ZlJ6Oy1CwfRbayucO/F3X5CuBxLdP9n2lUQXi+KGaFlcCQwMoCBNuCn0ZiYKUvStR0w0
         FLfQxMLi+Fl4NbJffBC4BoEcKZLOcd1rOLuftFHbJTKOpy5SGGlPgrt4srVXCHwYvEbz
         KEUCc880nSOvHRiZX+Z5ewKRMTRLLTyLM8gUrVDz9kROGtyvLTYTrPPSCzJEstLleGeP
         wOIVW0QVJGOy0Rs8pKkUddGvqTHA15QGJZsUykpSyCUZLLAwDu7xt6x1VNrgUPV7kH/v
         AGPw==
X-Gm-Message-State: AOJu0YzwscQJ1It65bArsOv/DOYQSUmP07NfsBSBMFr2ZLS8o0a5058U
	FmgaOpM5oKyDPR2TfQM6cshd+9Xhy36LmxekaARtFdZVSf8XsOj2AJvQR8Ts7C9jfRw9buGB7ig
	=
X-Gm-Gg: ASbGncvhFUVIyV7TndA9uG1CNPn/8pvYu9swSZ7Aq2W6swKMTafatKLzvfFnlCY/knl
	KG/7NWYQ0hJG6gzLYehzHl9iLtK6JWl2KEgOFvaabqxtA5C/QyScRMVW4u92IEPXrWRzHlx62d0
	1uX/E5Ej1WV4zhjR0bIqrxEiBgto5owhXJ6Za0UN1AgNZHWihNqEBzVG8QmRaMy8uOh4nMLxtQ0
	Zjl5wCcN+UfkMGBbJ2eRmqwUiBFgcjwwz/9Dg+S+i0qfl2pG9Zrz+pKeg6/DXkedFBM5bsumFkJ
	9O3DftCkOZElqXLmgyWVPQTOiwRAMaHIF5uM8enufterr/cpPwh2GFbkmfwPF3FDdRH+LbCkE+/
	kPPX4z7XaYa+TKT7KGQdtGq9BSR136A==
X-Google-Smtp-Source: AGHT+IGyDuPMAywci6EIpal80CSyYfIDp2RwhSjgzL9ACvgV48UFjVYb+yKpq2vwLE2ZhpgL0nqMnQ==
X-Received: by 2002:a05:600c:3b21:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43cfee32d16mr103982915e9.26.1741874032154;
        Thu, 13 Mar 2025 06:53:52 -0700 (PDT)
Message-ID: <c4b7f6ce-baa9-4b55-bdea-a67ff7d5daa1@suse.com>
Date: Thu, 13 Mar 2025 14:53:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] symbols: sanitize a few variable's types
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
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
In-Reply-To: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Parameter and return types of symbols_expand_symbol() make clear that
xensyms_read()'s next_offset doesn't need to be 64-bit.

xensyms_read()'s first parameter type makes clear that the function's
next_symbols doesn't need to be 64-bit.

symbols_num_syms'es type makes clear that iteration locals in
symbols_lookup() don't need to be unsigned long (i.e. 64-bit on 64-bit
architectures).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -108,7 +108,7 @@ const char *symbols_lookup(unsigned long
                            unsigned long *offset,
                            char *namebuf)
 {
-    unsigned long i, low, high, mid;
+    unsigned int i, low, high, mid;
     unsigned long symbol_end = 0;
     const struct virtual_region *region;
 
@@ -179,7 +179,7 @@ int xensyms_read(uint32_t *symnum, char
      * from previous read. This can help us avoid the extra call to
      * get_symbol_offset().
      */
-    static uint64_t next_symbol, next_offset;
+    static unsigned int next_symbol, next_offset;
     static DEFINE_SPINLOCK(symbols_mutex);
 
     if ( *symnum > symbols_num_syms )


