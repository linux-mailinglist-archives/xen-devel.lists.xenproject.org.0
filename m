Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594838085C1
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 11:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649769.1014648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBwK-0006ON-0T; Thu, 07 Dec 2023 10:49:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649769.1014648; Thu, 07 Dec 2023 10:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBBwJ-0006LN-TK; Thu, 07 Dec 2023 10:49:07 +0000
Received: by outflank-mailman (input) for mailman id 649769;
 Thu, 07 Dec 2023 10:49:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBBwI-0006Ja-Qk
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 10:49:06 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3de7a824-94ee-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 11:49:05 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3316a4bc37dso755790f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 02:49:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x17-20020adff651000000b003333c2c313bsm1103151wrp.100.2023.12.07.02.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 02:49:05 -0800 (PST)
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
X-Inumbo-ID: 3de7a824-94ee-11ee-98e7-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701946145; x=1702550945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nFIRaNgAVQlZC0hF1HkoKscjDXBY96LiuDxTPVvcVCg=;
        b=DiZvGGu074r/OAj4/t5QpAnQPUsQyWns+4pjj4+ME1RyOW3UtK3Ue2MsupOQmEwmjj
         NF606uodVfSlnR45mSAnRq6veFz1Ue1gEApQCxl/e6PqgZgdjU3iBIGMKCt0t2qK+BtM
         nTyNgpkhp1h9KD3MDgzoK4DCssDKMQ4bH2mHNtaQ3QqFQZPmddVCmE3pwa4g4R3Y55I0
         tBWbdjVxa6sc6J3uC6mma+2AcH/YO0XUxXr/xk2bslJr4N0fi1vkrYo4U0FHhYgRgnD7
         qqylSUodi+4Cpj/w8/Nx1ATNT7cBn+45ciK7un7vdK1vqvqrv8/OBEFJH1zw+At8hxM5
         JC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946145; x=1702550945;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFIRaNgAVQlZC0hF1HkoKscjDXBY96LiuDxTPVvcVCg=;
        b=Mw+dZch+iP/3SBCCVc3OB9BMOaEVIYLGN9O5ja8hSMbkKJwBgqSWFiIHWCLqHNEZ9k
         Cau5WiK9XoZ3rEFcVyi7Z9sDGY94T5HHtzcjP3ygaOwRjyG/elINi3uFU7+86LLQAstG
         nUzVWE8q2Ttqx2O2N0ZBW4FtcB1Dw8kWQAdUpcJoA0UVfmBG5G6bJzVzlgY829k4IdXD
         8RqPy0PKS/thkwq42vX/Z9CfWpr4SUcFsNdsv9d0zeOYScgEzcTB61XL9GmVCNYSgD1y
         sfYOt8WvYwiq3eRzV89HTImPkWeK8vHyLPMAVC8G1GgQC5hiN6envrYQMTWEhhv+LapL
         gM0g==
X-Gm-Message-State: AOJu0YzXqJPFr1rM1CoTVBHgZDcV9T63qXf2aGZnkzM5hPdKB+xmnDOJ
	Wnb585VH7Bl0Chcndl70W8XjDIeyqeo860PgvfOp
X-Google-Smtp-Source: AGHT+IGgyh98bcv3Xc7UGyyh8TgR7+EwNKD0wsbrALkm46Z+N9P9F89x/4qZlUTNHAZUOsnU5J67dg==
X-Received: by 2002:a5d:6791:0:b0:333:4156:2759 with SMTP id v17-20020a5d6791000000b0033341562759mr1473048wru.130.1701946145346;
        Thu, 07 Dec 2023 02:49:05 -0800 (PST)
Message-ID: <d3998117-23c1-4481-bfa0-ce66eb4279e8@suse.com>
Date: Thu, 7 Dec 2023 11:49:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] Kbuild: simplify as-insn a little
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
References: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
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
In-Reply-To: <089964f2-1b2c-4ee7-92cf-f50f2e967d5b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As of 732571959f17 ("xen/build: use new $(c_flags) and $(a_flags)
instead of $(CFLAGS)") -M options aren't part of CFLAGS anymore, and
c_flags isn't supposed to be passed to this macro. Drop the now dead
part of filtering.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -59,7 +59,7 @@ endef
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
-                       | $(filter-out -M% %.d -include %/include/xen/config.h,$(1)) \
+                       | $(filter-out -include %/include/xen/config.h,$(1)) \
                               -c -x c -o /dev/null - 2>&1),$(4),$(3))
 
 # as-option-add: Conditionally add options to flags


