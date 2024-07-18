Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480B934B7E
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 12:10:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760344.1170164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO5S-0000Ek-0L; Thu, 18 Jul 2024 10:10:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760344.1170164; Thu, 18 Jul 2024 10:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO5R-0000CK-TJ; Thu, 18 Jul 2024 10:10:09 +0000
Received: by outflank-mailman (input) for mailman id 760344;
 Thu, 18 Jul 2024 10:10:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUO5Q-0007cr-QJ
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 10:10:08 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e872a541-44ed-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 12:10:07 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2eede876fbfso9290851fa.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 03:10:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecd603bsm9601397b3a.219.2024.07.18.03.10.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 03:10:06 -0700 (PDT)
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
X-Inumbo-ID: e872a541-44ed-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721297406; x=1721902206; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hUv4PJY4s6F7A2Q2OoPefLxNPOGfzg67ZqFhd8G8CaU=;
        b=cjTnWyZ8bcPpmPMliPQ3rThEQ9Tz+FzsI2MCtkf8+GH+cO43LcKRYg4Qfxs5a4YK7G
         JZvIAb3+GXLSApxj2cFky6Q8csNLDgI/sfy663ePe1nv7XTXncWWcYWltr3SBU8rBl8a
         8soAxw/+tExLPR+EoOn6LRVJqZdhpCnCXC1PifFwLtJPpbDZfy/N4RtCkH1Y6K93xSrj
         y2ubwPkatexd2WMOOeAAYk+iVkIS0xlJsq28Y8y3iPqT5n1sUDPjWbZl00DosKVisYKm
         LIkhJYXnHpfwnOQLaKat+L2PSIIdDfkD91I0KfT+14JgOGzOSM/F45P7sWr39FBauOaW
         0Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721297406; x=1721902206;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hUv4PJY4s6F7A2Q2OoPefLxNPOGfzg67ZqFhd8G8CaU=;
        b=G5pSYbcBJrBdOllEEduD08pHgbROZ7vLaAsjlkR/A36F22kLDRa2qEstEIo2eX6+uq
         whCT9WI38kM5MLsWvo1KTfKDl3mXoLmhdv1v+qodLuUQ4g7+/nLTmsdqUdn1xcO/3lV0
         5KR9kqwA5PHSNTEmDhpS5beUEKJbdt9EozQZduK1bo7ninRMS6GourEXgM/xURLyK/wt
         dnfbFhITnNLYU/ZDYGelKYTXJxJMtaL8hRsntJMSUo1y1hnboQ6u8COAn7FSFJo+bQZt
         M0gE4okpQd5jjyxWemIexjojXHN8lOrFWp2Ivy+L+G8aLdleYjtSViDrIUj+R9uFIgR5
         8ZVA==
X-Gm-Message-State: AOJu0YxUwJZ6j52hq2nMydoRopldeg6oTpFistAFMO3lKXs5P+7zbO5d
	eJPsl+jDQqq18gg9mnz0i+iQFXvWUMkyemW0MJ1C+eWUo/Sd0rzk78n3WLkt5lFbdvITV2LLJqI
	=
X-Google-Smtp-Source: AGHT+IHlQaUi44ZjV/zyYDtjOgicy4KN+lHsnCpeWnioeUykItvglIs7sxXb5F0qNAimer4L3H5aPA==
X-Received: by 2002:a2e:9bd0:0:b0:2ee:8bc6:6826 with SMTP id 38308e7fff4ca-2ef05ca05dcmr13484301fa.26.1721297406528;
        Thu, 18 Jul 2024 03:10:06 -0700 (PDT)
Message-ID: <76aafbed-bea9-445a-8abb-6e1e44996594@suse.com>
Date: Thu, 18 Jul 2024 12:10:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/HVM: get_pat_flags() is needed only by shadow code
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

Therefore with SHADOW_PAGING=n this is better compiled out, to avoid
leaving around unreachable/dead code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -271,6 +271,8 @@ int mtrr_get_type(const struct mtrr_stat
    return overlap_mtrr_pos;
 }
 
+#ifdef CONFIG_SHADOW_PAGING
+
 /*
  * return the memory type from PAT.
  * NOTE: valid only when paging is enabled.
@@ -359,6 +361,8 @@ uint32_t get_pat_flags(struct vcpu *v,
     return pat_type_2_pte_flags(pat_entry_value);
 }
 
+#endif /* CONFIG_SHADOW_PAGING */
+
 static inline bool valid_mtrr_type(uint8_t type)
 {
     switch ( type )

