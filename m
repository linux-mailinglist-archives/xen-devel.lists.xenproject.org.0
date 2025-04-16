Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9CCA8B4A2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 11:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955381.1349170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ydh-0002em-TQ; Wed, 16 Apr 2025 09:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955381.1349170; Wed, 16 Apr 2025 09:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4ydh-0002cj-QG; Wed, 16 Apr 2025 09:01:01 +0000
Received: by outflank-mailman (input) for mailman id 955381;
 Wed, 16 Apr 2025 09:01:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4ydg-0002cd-68
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 09:01:00 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5058c8ba-1aa1-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 11:00:59 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so46861345e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 02:00:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4d33a6sm14844185e9.15.2025.04.16.02.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 02:00:58 -0700 (PDT)
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
X-Inumbo-ID: 5058c8ba-1aa1-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744794058; x=1745398858; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WptL+d1Yor8MxanXfuO0rr+6GghDt4hm4bVV6+NuoCI=;
        b=FYIr5Av2k1ngB2VwkHzXMw7BXS9yxMpXk9VEulhtr2sA56dcl5aKIoBoJ3l+5RA7Nt
         K3jpztPj78dKZ3C3Ga0vdYWjW2qBBasR/Ote+sPd2Z8HqBhPWKIqAoxDRhzCvB0UzNwx
         eX5hwM/xcSr72XOYfSLOGbkru4TRLCgKmXE2pnjfn0SlCSpP8rXJ/z4OvOO8mJSNJ2KM
         2nYxtXsmItNpQwmVvz3igQbl/ll6lQ12qS5OMSLHDLCOhV9e833asFY8vXY/T4UdrEqD
         KkM0s8s8ouASz4pRkc4wj1mNk+iBO3zEhE/zs6RWwU2VHrpZRIWQG09LB1t6TILIU3cn
         EIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794058; x=1745398858;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WptL+d1Yor8MxanXfuO0rr+6GghDt4hm4bVV6+NuoCI=;
        b=hOnIRhw98XoufTChH5G3+a42er0WlOYOM2BKk7V9gGmB3YHfkYAnJzr2jPBF11OrWR
         rxYyQ0smERob1im/QqYdcNF337wydHQb5W51nuU6nd5lUhdhq3uno4fbmUGVw9H1Cf7O
         JUFCz1kuS3vJveHd88ki8Sr1jiLIduQsOEQ2tMCzvDEtRezhZf8WiHvSbaWzsMu1F3Ao
         l08gL/41iEiS4hCIosUMN7qV6PZZO7ynrZqJhgF8lYF+OJstwz3bjfOFFlNEX0IgHzGh
         aCKkzzQsCz1i79/M2AU4cq2qGBDjqZL9No81rmwBJtbD3DCKqdDi8T89dg6/dBdKY16G
         LTlQ==
X-Gm-Message-State: AOJu0Ywr8APdLqvjlXbVsJgLPQJ45TPPtHkRzwzfoHoNV7uU4gb1n0UY
	UB8VaFcTPbGeUojrw2LKdg//IQbH5D6iRT/8HGi0HfcUQ/0KTSK3f54qBsT7XFLB6RmWvVOOhZE
	=
X-Gm-Gg: ASbGncvAU1gG9agM7aXqenamrnHAg5XNwUGi0gSJWsEJQ9LX7NXJAIqAjZfVtg0LcVQ
	XlOptXvZ2WxJGgV3gVl/Z3PWdYJ67mUOm9g9IYyudabbu5BzAwf4rxymQX7/A4Xjyc/f4NUhYiL
	HjqpWwsMqe8M7HEr8H/9WhbgQT+qzw6nYQo5QYAWjZQ1OI07hSkaox10pbgFQ/BmsdFd8/eVpHk
	sRvM9Jut47VNABiyq+eq6WUj+l6hSAt9Tfp46SavZ38OHFCJhuditugqQHewGBI9FNM4/z2Y+k9
	vJlb1stE2SU/2QD1lCRNTX0eVgesG5rf/gINLnxtpZVmCVSpa/eM+WPjWotkn4gujV+OzkaapRZ
	Lj6akV3FrX7MDRY8BtsuAQ03QZg==
X-Google-Smtp-Source: AGHT+IFxX22jXKEpL1oniT/+zpfJ6wQGZvSrZgDiZNXvOtETjK0kmmo/vrT0SSf67L+fTN20hgTRPA==
X-Received: by 2002:a05:600c:8705:b0:43d:db5:7b21 with SMTP id 5b1f17b1804b1-4405d6cf812mr8290505e9.28.1744794058352;
        Wed, 16 Apr 2025 02:00:58 -0700 (PDT)
Message-ID: <2412a7a0-bdcd-4647-8ea2-8d2a927dcde3@suse.com>
Date: Wed, 16 Apr 2025 11:00:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] symbols: discard stray file symbols
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

By observation GNU ld 2.25 may emit file symbols for .data.read_mostly
when linking xen.efi. Due to the nature of file symbols in COFF symbol
tables (see the code comment) the symbols_offsets[] entries for such
symbols would cause assembler warnings regarding value truncation. Of
course the resulting entries would also be both meaningless and useless.
Add a heuristic to get rid of them, really taking effect only when
--all-symbols is specified (otherwise these symbols are discarded
anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Factor 2 may in principle still be too small: We zap what looks like
real file symbols already in read_symbol(), so table_cnt doesn't really
reflect the number of symbol table entries encountered. It has proven to
work for me in practice though, with still some leeway left.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -213,6 +213,16 @@ static int symbol_valid(struct sym_entry
 	if (strstr((char *)s->sym + offset, "_compiled."))
 		return 0;
 
+	/* At least GNU ld 2.25 may emit bogus file symbols referencing a
+	 * section name while linking xen.efi. In COFF symbol tables the
+	 * "value" of file symbols is a link (symbol table index) to the next
+	 * file symbol. Since file (and other) symbols (can) come with one
+	 * (or in principle more) auxiliary symbol table entries, the value in
+	 * this heuristic is bounded to twice the number of symbols we have
+	 * found. See also read_symbol() as to the '?' checked for here. */
+	if (s->sym[0] == '?' && s->sym[1] == '.' && s->addr < table_cnt * 2)
+		return 0;
+
 	return 1;
 }
 

