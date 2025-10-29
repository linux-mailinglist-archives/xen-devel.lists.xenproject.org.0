Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E9C1ABEA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 14:35:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152759.1483269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6K1-0006dd-F9; Wed, 29 Oct 2025 13:34:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152759.1483269; Wed, 29 Oct 2025 13:34:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE6K1-0006aY-CK; Wed, 29 Oct 2025 13:34:41 +0000
Received: by outflank-mailman (input) for mailman id 1152759;
 Wed, 29 Oct 2025 13:34:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE6K0-0006aS-9w
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 13:34:40 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 002a5bdb-b4cc-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 14:34:31 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-4270491e9easo5986849f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 06:34:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df682sm26227262f8f.43.2025.10.29.06.34.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 06:34:30 -0700 (PDT)
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
X-Inumbo-ID: 002a5bdb-b4cc-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761744871; x=1762349671; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HyqamvdLK6Um1i8RR6KfcQEH62gUXEyEb0Ap0y1KVE=;
        b=OmzhSXm7BOyTvXGYSonf0//HJhDQA2jgLZxIkkMGJuoM86gmBkJBEqTDLki+or4lwC
         QKHz9d6U3wKZhXzZXkL5ACxXXGanZ29k/5TfdaE0yzPKiRepi8+ZNbNHtVEKcy0Gen3W
         xs5bls6rbu8uZB5YDpi+DouceIMTt7JOxuq3NhePEqt+FFf6vVQUtRgBQ2KK1Bwr4TI4
         bJuLO8S5LZrtH+ySLHqLJVRXYA5KLNC/3oZsPOJP4Nz550kAIXa8ViNuhfG5OIIZt2Lm
         Drz7cWmZ9Ky9wJiZkLp9kamaxnvSPADGUsZEdJV4hNDbOsK/L//Ag+oD1DL24h81d6Th
         Iysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761744871; x=1762349671;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HyqamvdLK6Um1i8RR6KfcQEH62gUXEyEb0Ap0y1KVE=;
        b=FgfnO3s25BoFp92SBIs+Avl36O1yMdVyoYjqEYJpkFj0sh+7rrgEV1UVVLOcyPMcX8
         UMWMuuxzTVhYqprwIh295XxyCV3h72Js0o//Jaca5tJSxMfZA3Wq8RxZBd2EE/uyiRNy
         0VbfHaJzrb1zS0XhkVIXuJaBE81hFbP+Iwy5v9dkw1xBf7eI6zXIdkWz2UrBUfAKRpB4
         S+VIiPFAI9VZwIAZ8uFC1EwQKAtMoqSQTIr7RTQeXanIz6wGsNRwJSTszTcoFLGIMY+O
         79rPh/amNZKV6nK7CGyDhoVZO1gkGFKyZY9st58f/aj9sednB3v0GphIKO+WKQaX2oMs
         mYFA==
X-Gm-Message-State: AOJu0YxxAHkw5yAevJcx58+kwwGpU/M+7dFXhPfMMPOjQ1jwpNY5CysC
	2ZPpGOGx1o+IygHFVhAXwHXK+gfQN/e032QsOIkKztCzb+4RAMc3nVPOSalfxUT1q+68Npvn1fQ
	Y2QA=
X-Gm-Gg: ASbGncur39fGSyJyocIKm7lW3gZLEJKL9D3NPfKMtdu3kTIGQrSi6yEm9GsNtRhzguv
	nNlgsoEhG/yLfv8jbdhSxf6JJnr1edxPqH4PnaaAY+WTW9hKJbyHRqz5hY6LXL086a97JF+wE2u
	HwAVOWHLVz6cOFDY1rQ5Cnq+w/n6yKQ9q5GB0pwvyc7ZWIqlkrw3jWUn0wZxNvzbPWRWUGqEiT/
	1cFaGElmQWcpdc9T5v5HwW+U4Xcljz97Usv9hlRizMUvruWc1i0oYNEJuuzqyXAQ/8rypnVNlSP
	RAssUxTMvcFlTkT5c98pIgAAVFhe5yp22iz8JrpVITbWQuN0yfVo14p/HdyJKShuR+Hg6MpxTCY
	+m/aIZKDuv5ovVYwOJKJVqiQVF2U1iNk6AnWffRUdty8ohDHshnoA+2dcyOZck7YmTZZ+U3Xfjv
	N+ahieP1a5EAYf9IOyLlrNMgK7QEFHayaq3Lq4sCjXXBQl4iBI6PqQ1yPGjNDjTbX6HwChL1Up5
	vkus5CHUQ==
X-Google-Smtp-Source: AGHT+IFskf6Pc3PkvkEqxc/3Y2kQE2wpJ+gXy4jibT88wAwar4gRj+xe/bwuHe5lhOaZHNcxyVGA5g==
X-Received: by 2002:a05:6000:1786:b0:427:241:91c2 with SMTP id ffacd0b85a97d-429aefbd941mr2041957f8f.30.1761744871272;
        Wed, 29 Oct 2025 06:34:31 -0700 (PDT)
Message-ID: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
Date: Wed, 29 Oct 2025 14:34:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH for-4.21] symbols: avoid emitting "end" symbols for data items
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
Content-Transfer-Encoding: 8bit

symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
different sections: Like for all C files, -fdata-sections may be in effect
there. As a result, besides moving these symbols may then also have
different amounts of "end" symbols inserted between them. While the
movement is likely not problematic, the change in table size is - linking
passes 2 and 3 want no address (and hence no size) changes between them.

As, at least right now, the "end" symbols are useful only for code, limit
their emission accordingly. When data symbols are emitted (i.e. when
LIVEPATCH=y), this obviously also has a positive effect on overall table
size (I'm seeing almost 600 entries going away in the build I'm looking
at).

Fixes: d3b637fba31b ("symbols: arrange to know where functions end")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Furthermore at least some gcc versions emit the (read-only) data there into
.bss.symbols_* rather than the expected (but still potentially problematic)
.rodata.symbols_*.

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -176,10 +176,9 @@ static int read_symbol(FILE *in, struct
 		*sym++ = '#';
 	}
 	strcpy(sym, str);
-	if (sort_by_name || map_only) {
+	if (sort_by_name || map_only)
 		s->orig_symbol = strdup(SYMBOL_NAME(s));
-		s->type = stype; /* As s->sym[0] ends mangled. */
-	}
+	s->type = stype; /* As s->sym[0] may end up mangled. */
 	s->sym[0] = stype;
 	s->typed = strcmp(type, "FUNC") == 0 ||
 	           strcmp(type, "OBJECT") == 0 ||
@@ -313,6 +312,7 @@ static int compare_name_orig(const void
 static bool want_symbol_end(unsigned int idx)
 {
 	return table[idx].size &&
+	       toupper(table[idx].type) == 'T' &&
 	       (idx + 1 == table_cnt ||
 	        table[idx].addr + table[idx].size < table[idx + 1].addr);
 }

