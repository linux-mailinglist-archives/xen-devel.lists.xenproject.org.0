Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B87826CD5
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 12:31:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663412.1033318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnqn-0000OY-Ht; Mon, 08 Jan 2024 11:31:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663412.1033318; Mon, 08 Jan 2024 11:31:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMnqn-0000MH-EM; Mon, 08 Jan 2024 11:31:25 +0000
Received: by outflank-mailman (input) for mailman id 663412;
 Mon, 08 Jan 2024 11:31:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMnqm-0000M8-Cx
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 11:31:24 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d1b8e3-ae19-11ee-98ef-6d05b1d4d9a1;
 Mon, 08 Jan 2024 12:31:23 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cc7d2c1ff0so18184361fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 03:31:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ca15-20020a0566381c0f00b0046e25a7bb9esm530141jab.176.2024.01.08.03.31.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 03:31:23 -0800 (PST)
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
X-Inumbo-ID: 73d1b8e3-ae19-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704713483; x=1705318283; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LI6FO34QCLvXUPTqRWYt+HLnZi/yUQ47r87BvBhx+5c=;
        b=agVBcwPj1l9ARflZh/D607zWhxFYZF9OhEG9F0mF6z88JJpMCz6VrfXU9+h/sgEvKB
         lZYmBUzRkE3MWjhMQwVIFJaLDWoz5rRHt3srNCZrJ/9yQtlOPshg1MyqjUo6CItFaEED
         33AddFRYdE+yUeQjMVMxfXB9cHQ8TiPREMPZLcUdkmY9YkgmbCndYc2JsYXCyh1pSWYR
         l9vpoIfXjTzTwPDxC1k7KVwtITerPI9g0GCb+XkbY379YGqqycf0IRm13M0id33Fsb8d
         iMYIpUUrJ/nvB01WFpOC9XHei+T8VsYy4nLY21+TxVMJHfR3/+hRcJmsjc6tDbBRQaFy
         PX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704713483; x=1705318283;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LI6FO34QCLvXUPTqRWYt+HLnZi/yUQ47r87BvBhx+5c=;
        b=opUgyVFDIzfUd+aCwxxPchi2TJBR6zq0RVgEfselog9/9EYFye/5RohejXV+ij+WYY
         g+xr1rMamy0qBij7tUymjyhYunahZ5qYiKDbQLQBTvBW/L1eqCNfV1dQ51faW56q+29R
         Y3HesUVPBqeWROUpTum7FEKSLxLQJQaugqB3eAtp3MQPRBc/jSASJkGOmeHE7JL5NZgj
         Py/z72xmAVuI1fPNz2RecMzMvR/OMgtZYLBa0W6fE8118GpIW/fCyZT75eKHx+6AtHSj
         k9kHR5hfPDoHB+VFnEVTg+rI63m3M2jnz50tnCP3//z3nq5ttDQT6sP0wMOg0SFtuOGh
         Oesw==
X-Gm-Message-State: AOJu0YwVDrc6JIlaMsG+cRxYCBASHdvp9mN5kh4oioMZPQozklxzSO/u
	d6IKo/Mo9mtcxLjDh/U3e/VgcCZOQHwln5zOlFeTwYjCsQ==
X-Google-Smtp-Source: AGHT+IF5+mjBK6JuwVymLXwjecWlgC36G07uYYGHl8O+sw0Fsa1+z+ZW5riFaaZtZqJHOeNtUqb3Gw==
X-Received: by 2002:a2e:b747:0:b0:2cc:68ba:98a9 with SMTP id k7-20020a2eb747000000b002cc68ba98a9mr1459276ljo.41.1704713483377;
        Mon, 08 Jan 2024 03:31:23 -0800 (PST)
Message-ID: <224db25e-bd4c-4415-aff8-6ff3e84343d8@suse.com>
Date: Mon, 8 Jan 2024 12:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] NUMA: limit first_valid_mfn exposure
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
x86).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Julien suggests something like

STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn;

but I view this as non-scalable (or at least I can't see how to
implement such in a scalabale way) and hence undesirable to introduce.
---
v2: New, split off.

--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -254,12 +254,13 @@ static PAGE_LIST_HEAD(page_broken_list);
  * BOOT-TIME ALLOCATOR
  */
 
+#ifndef CONFIG_NUMA
 /*
  * first_valid_mfn is exported because it is used when !CONFIG_NUMA.
- *
- * TODO: Consider if we can conditionally export first_valid_mfn based
- * on whether NUMA is selected.
  */
+#else
+static
+#endif
 mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
 struct bootmem_region {

