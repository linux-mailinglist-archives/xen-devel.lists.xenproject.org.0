Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C555A5F6A3
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 14:52:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912225.1318536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiz3-0004jO-NF; Thu, 13 Mar 2025 13:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912225.1318536; Thu, 13 Mar 2025 13:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsiz3-0004ga-Jk; Thu, 13 Mar 2025 13:52:25 +0000
Received: by outflank-mailman (input) for mailman id 912225;
 Thu, 13 Mar 2025 13:52:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsiz2-0004gU-Ax
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:52:24 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63c459df-0012-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 14:52:23 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfb6e9031so9262215e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:52:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a74cf8bsm55030405e9.12.2025.03.13.06.52.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:52:22 -0700 (PDT)
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
X-Inumbo-ID: 63c459df-0012-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741873943; x=1742478743; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fO6uuX/NNeoYzMSs64Qkp5bjEbxgGLcuU9dVefmd5QY=;
        b=QdQoJw2ZH7ek3dGMXaDo5dN73myQKoAWKiVaVTFeLLFzQ6WIn96RGgx66rVgilYXV+
         k2SXGc1rPBrzNCeHCqWK8M69uUfPxjk4ax3PRskemdcWZmZJ1l6BS0alaCw2HuAMCPSw
         ytaIUIzEJ/M1GuZ89fZNd6Q1gGUYiLkhG4kDv0VM9FpyUhYUbZb4MF2NixVZo6xNOWZl
         2sOvburOalkqC5VwV7uvj9ygdiei9hD1Qi3rQKqorkJyo+fbjxSCYKoqiG3R+/kgrc21
         JhWEoDvNRHcxzW17D58YItEP0Z1sAqCNoaajrEmGUNCLGFrdALGeDwFy4RWIdQoRlwC/
         aIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741873943; x=1742478743;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO6uuX/NNeoYzMSs64Qkp5bjEbxgGLcuU9dVefmd5QY=;
        b=cmCR36YkWXcLwH9VEpsTzBdt+nxsgD3UWnw1dzw3UOAaIB3sQUKsQHtz8VvwDG92d4
         zz2piYUtczTqNKJ+EPr65MgZePf7g6vuG32aV65PAStRHx31qB+3iRLtrMfVFPdp0I2X
         Akkmt0ol5DEYXXOfLMGBX6lCnP+3VrlGBxDtYDt/gFUW8KN1FXUt5yixSs2reOMy8uV5
         qIBDhxVvFxL1+1yOHUR3zN+oP9/hAfFnMFmFHGgp/OjgY4VHrEqjYWkRkDGE069sRt27
         l2d0IDovmlVDyNc0Jb+LLgz7H97XIf1Rt4YkZuIbJI1iG5KBTMQd7of6st0koaEhyhzA
         7NfQ==
X-Gm-Message-State: AOJu0Yz4ljTK66ceMKOKXtxJveypIi1g4llwednH+ndtdAo9ZO/qEBBI
	D2HcNT3DLHCQpJH8m4qgKdNll5Aifip9JMT/s5o7gEMQxTiEvsqZMTgzEXa4KSxheZ2Y3fyxg/M
	=
X-Gm-Gg: ASbGncv53HZTH6YJyvDQHybbQ99+Z1zn+O0h1x2QbQ+vJvepe/A/Z7B3i+3wxYqBy6Y
	GSVIEBE1Ay+WJEo6Na1q9ah1onGEER6i7t6aJaHnbNYBXgk3ZqLffx7gzQ4Eo/kI85okWeH0TsC
	ZZiHPjvjc6M5Bu3KVn/myWjMLv7LDs3edhDT5uwVvR0V9vZs6ebd7W9Ervkdmm74yH4J1pyudOy
	3YIo6skueG6npTZVO90xowUyabf+DOA0KKQ9JkAaByaqYYKjyWQ7q+FCCXAj9oJ2vpGvn/QYBow
	j8Dk4pAEDQUjTgspR8aQvIBk4tKagWjrPXCjk61YyixNs2I4DQ7Edxjj1u9GKkM6I08n6v8ogsR
	ExoyQjDFkuFF4XfdbL9uf2nS2PJ2UIw==
X-Google-Smtp-Source: AGHT+IEQcc1w3qVtZd/nrWClsUIJLEx1OCdv2qxru5vIJE6ASkLEWvwvH1zuUdJDbUKuiIKe6TieDw==
X-Received: by 2002:a05:600c:524a:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43cf75aed5emr172596805e9.13.1741873942752;
        Thu, 13 Mar 2025 06:52:22 -0700 (PDT)
Message-ID: <a556439c-b652-4789-bbdd-6d6402b2a124@suse.com>
Date: Thu, 13 Mar 2025 14:52:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/6] symbols: add minimal self-test
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

... before making changes to the involved logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With this FAST_SYMBOL_LOOKUP may make sense to permit enabling even
when LIVEPATCH=n. Thoughts? (In this case "symbols: centralize and re-
arrange $(all_symbols) calculation" would want pulling ahead.)

--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -260,6 +260,41 @@ unsigned long symbols_lookup_by_name(con
     return 0;
 }
 
+#ifdef CONFIG_SELF_TESTS
+
+static void __init test_lookup(unsigned long addr, const char *expected)
+{
+    char buf[KSYM_NAME_LEN + 1];
+    const char *name, *symname;
+    unsigned long size, offs;
+
+    name = symbols_lookup(addr, &size, &offs, buf);
+    if ( !name )
+        panic("%s: address not found\n", expected);
+    if ( offs )
+        panic("%s: non-zero offset (%#lx) unexpected\n", expected, offs);
+
+    /* Cope with static symbols, where varying file names/paths may be used. */
+    symname = strchr(name, '#');
+    symname = symname ? symname + 1 : name;
+    if ( strcmp(symname, expected) )
+        panic("%s: unexpected symbol name: '%s'\n", expected, symname);
+
+    offs = symbols_lookup_by_name(name);
+    if ( offs != addr )
+        panic("%s: address %#lx unexpected; wanted %#lx\n",
+              expected, offs, addr);
+}
+
+static void __init __constructor test_symbols(void)
+{
+    /* Be sure to only try this for cf_check functions. */
+    test_lookup((unsigned long)dump_execstate, "dump_execstate");
+    test_lookup((unsigned long)test_symbols, __func__);
+}
+
+#endif /* CONFIG_SELF_TESTS */
+
 /*
  * Local variables:
  * mode: C


