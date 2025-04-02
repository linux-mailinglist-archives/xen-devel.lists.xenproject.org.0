Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C38EEA7907C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 15:58:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935742.1337135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzybS-0005n3-4c; Wed, 02 Apr 2025 13:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935742.1337135; Wed, 02 Apr 2025 13:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzybS-0005lT-1e; Wed, 02 Apr 2025 13:58:02 +0000
Received: by outflank-mailman (input) for mailman id 935742;
 Wed, 02 Apr 2025 13:58:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzybQ-0005kV-M0
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:58:00 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c8ce4f1-0fca-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 15:57:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so1280170f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:57:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b7a41f5sm16850495f8f.84.2025.04.02.06.57.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:57:58 -0700 (PDT)
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
X-Inumbo-ID: 7c8ce4f1-0fca-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602279; x=1744207079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wvo15DS2o3owPyk9r+14HmKhMwdf4HpSiy1AYZEx6FU=;
        b=gUd6KJWJo66qrP3F+gJnG3Bh7b5qYyhSon4t+AE0K5Jttk8C+5zMF4S3H7y/tDKrmZ
         0EcNb0LepAa7d75GnJC6Fda6HPKDCBFC8b5rZMzysWLduCQ89MeKd7OcVXLWtqyZkMx4
         Ov4XaT0yX/sSLfGax1jAXf2F+rdkpavjalJbhR+mMD5MSQm5kfVvfXHU8dtVkC9i+RGR
         fWBmHg7PrteXBTok8xq9EJkDWOjomlD2tk2FgpiWuVViaNhR9E9jP6A61/5Itzc6IdUD
         TYc70fM7htk11cE7gnptEz8VnV7k1Y9YhF8CZ1zvFn8Niqb5aEA1+JTulDCBLGYORQH7
         VXxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602279; x=1744207079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wvo15DS2o3owPyk9r+14HmKhMwdf4HpSiy1AYZEx6FU=;
        b=jNEfrgk5EUCs52bkOmDpi3OdSKQme/5VRF7LP8tbqD50egjC9ucuGpg0S3qrhu2650
         havtBG1TgKUY0B41+gHyd1FuCNETkRPM+oP6AnLD+Kyt34L1l+rXYb2JcYxh2qTtc7B0
         guixg2nygv9coG/RB33YJhPNZS6Mm6VxSf/jLWHdf7/5zucl8u+78vDX4l7rtI5jltbI
         9iNdpjF6P37R39SMwPDZZ3/x0mN4M1Ue9iOaTmdFRUN3FpfTFqAzXzfGVjcHKs5h5pVY
         Vc+oRc5C6+YMRICnP3l666EBPgTUJBKUKk87mrdJ8gPOSDVOtelcc8I0gOmy4MjHGsp9
         9LOQ==
X-Gm-Message-State: AOJu0YyO44j9PnEs0lj/89TQfWZRHNeJVjowV770zYSUDVnbcBTCNvxL
	eDZXJXUDjEgUk+9rHiR7wtWfcVRv5bbq1fy8LgRiuvNqliNNF5C5JogScY+PmijjRDdQkUqaeZo
	=
X-Gm-Gg: ASbGncsDdeBTcaG5bfsAAt7sNRusdkXqJcVIHp/Cp7Jvn239vRNukaR2RJyq/p4tzCX
	hiHxxVV9x0j5Kl1/4aXU/JfQa5ihTq+oH08o4kcU+UC0uPgGd09XIP+PdjzcUc5gIWIldVJ0tNl
	ygWTiJt0KbrpVRkMOMAV+x5zw1BSBGdWRVcRZs7zBaLRVv74mUbI8Hz/QfqkoI66QF0M3idsOVw
	7sVb4w0fy4UNmXAJEcKwnKQO3eX+1j5myQUC57wGOPFshO4B7wkTlnU9awzNmWqEil8zsgIlmI+
	qs4UJ1HKaoH92GFC26PDUBM8WNLt9GssbY01ND2razzmY7Y53b+xhLKQn3z/dt+Ld3xgKxmjidU
	EdpX+dzpuprhWtJqf+ELj0OFZC7jhrQ==
X-Google-Smtp-Source: AGHT+IEvAMaGKn2Ttwk6M7eKwGqm0dtPoHP8cqbSjO8/vuoj4E5L4kwjV5UwiuRxQkhnHa0WG3iBUw==
X-Received: by 2002:a05:6000:2a10:b0:39c:1257:ccad with SMTP id ffacd0b85a97d-39c1257ccdamr9248107f8f.56.1743602279222;
        Wed, 02 Apr 2025 06:57:59 -0700 (PDT)
Message-ID: <879646dd-b55e-4b42-b637-d3b14570b880@suse.com>
Date: Wed, 2 Apr 2025 15:57:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/5] symbols: add minimal self-test
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
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
In-Reply-To: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

... before making changes to the involved logic.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
While Andrew validly suggests cf_check isn't a requirement for selecting
which function(s) to use (with the non-upstream gcc patch that we're
using in CI), that's only because of how the non-upstream patch works.
Going function-pointer -> unsigned long -> function-pointer without it
being diagnosed that the cf_check is missing is a shortcoming there, and
might conceivably be fixed at some point. (Imo any address-taking on a
function should require it to be cf_check.) Hence I'd like to stick to
using cf_check functions only for passing to test_lookup().

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


