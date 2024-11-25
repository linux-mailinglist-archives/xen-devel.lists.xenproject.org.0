Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377D29D88F4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 16:15:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842796.1258477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaoK-000128-VV; Mon, 25 Nov 2024 15:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842796.1258477; Mon, 25 Nov 2024 15:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaoK-00010J-Se; Mon, 25 Nov 2024 15:15:36 +0000
Received: by outflank-mailman (input) for mailman id 842796;
 Mon, 25 Nov 2024 15:15:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFaoJ-000108-TL
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 15:15:35 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ca04a54-ab40-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 16:15:32 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-432d9b8558aso31859015e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 07:15:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc38afsm10578877f8f.67.2024.11.25.07.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 07:15:29 -0800 (PST)
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
X-Inumbo-ID: 1ca04a54-ab40-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFjYTA0YTU0LWFiNDAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ3NzMyLjA0Njc3Miwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732547731; x=1733152531; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TGRkgRXpIK18BrPBydpyw7bMQqZHWSHjK9VFOA2LsgU=;
        b=Z2/y9KLFnk+Ji0Fq6trGwrskKYb/MHr5tx4d+HERI7P2dhqsGqZC16mikhzS4rT9Kn
         HEvSQLDfXP/CiYy7pBZov8Cx0S3KM81AY1AgwZDoTiF45JX6zofkdGkMtLgZCSa0cTz3
         7E+ThnnK5naXu6dMqWywvJMfas2PolPPOVCijTnp8gwgNUP48nptVuyPXI6DKK0WwCX7
         1Yje6UIcokzHwpgGZy7fF4rTZSuLO8za2URTLNpmWwerOXbWNjttuv70qTWCN3Gt2SOM
         mej/TvnRZ+39978Vd5e4/zSk81/huz4CVeJ6BjkK0EPQcMKf/OKTXATKgjidKq6iOsob
         NXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732547731; x=1733152531;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TGRkgRXpIK18BrPBydpyw7bMQqZHWSHjK9VFOA2LsgU=;
        b=aoq1iVb5Ft0Iegx528LHypi9+47t9Yo90Ce/DGVkFL2Th0bwmI7u3r4bBpqaRxALqa
         //MgKwy5c9CdRurjyDQqrfCKIa5HX5nswa+OCIH54JmsVo0IjKP8Vjz+bQLNtcDP4bgl
         jhUEaozP7zhVtvlYc9XPdUV8FJoHwPPOZOyh7wqWo0JRmMUcpGP5vJl1oJOAiqBFIyXk
         9toKY8IkAa/Su4bBg5ZuJ900Z6UnivHCPOHDf+incQoL9UlfiJMMV2iKeKnQ6Z4dbOcm
         mMNBxorXgFrRxeeh8/vqnrd2CNGEGyvCnmx02Ytbkfi616Re/aehCc72fRmtd9VgodPw
         DLFA==
X-Gm-Message-State: AOJu0YwFsutvBapFaCyklO5Vb9MkA9q0xE7sgCPFOhNfdc81HNSIaUYW
	/p/HQka16oJAwvX2pNk16avp+1qaoXyGmzM3Z5kP1M1wJbjQ14oDBuiA8XCQy5Fz14inzCvw0bA
	=
X-Gm-Gg: ASbGncvbWHEpuNOG0Irije7ywsLQugQlkcwVSTP6lYXq5xVYR/9s9oN2S/RhHg98Aj9
	fw4Rt5ODVT3qVaAxE6e9KnTJcj/fWrHFnMnX3YjBA67Y9NkND4JLJItXBNBZ6pLwHKwx+Uj+rc4
	GsZfn0aDGczDEo8TieAZw+PGqdPIMDdaOgD0AL7+4+NQXNKKs4RfRYMG7OFhDsRCp4MyGovDCHh
	fcVa550pr2aUJp0mVqY9y1wKMJ75F+m0EhloFwLpHTyKcKLp5g+CwIonmU8EJZZ8TqJip+3Hlby
	Z014YS1JkRqSygRFjsMzi0brTFHg+lW0gvA=
X-Google-Smtp-Source: AGHT+IGPj/0qEdeUlaY1455oF82V8Slr3195f0Xx9Hr3o5MCdEhyzG3ilHWB2pxtvz0kKbiL/xRXyw==
X-Received: by 2002:a05:6000:2c8:b0:382:3211:6b7e with SMTP id ffacd0b85a97d-3826061faefmr10747933f8f.31.1732547729929;
        Mon, 25 Nov 2024 07:15:29 -0800 (PST)
Message-ID: <9eca264f-57b3-45d3-8017-cd11af0b6cf7@suse.com>
Date: Mon, 25 Nov 2024 16:15:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] libxl/ACPI: don't hard-code guest page size
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>
References: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com>
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
In-Reply-To: <7455ff48-4bbc-465c-baff-d5c0ff684dfd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

We have libxl_ctxt.page_size for this purpose; use it to eliminate a
latent buffer overrun.

Fixes: 14c0d328da2b ("libxl/acpi: Build ACPI tables for HVMlite guests")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Yet better might be to limit the size to what's actually used (libacpi's
struct acpi_info). That would then also have avoided the respective part
of XSA-???.

--- a/tools/libs/light/libxl_x86_acpi.c
+++ b/tools/libs/light/libxl_x86_acpi.c
@@ -218,7 +218,7 @@ int libxl__dom_load_acpi(libxl__gc *gc,
         dom->acpi_modules[0].guest_addr_out = 0x100000 - 64;
 
     dom->acpi_modules[1].data = (void *)config.infop;
-    dom->acpi_modules[1].length = 4096;
+    dom->acpi_modules[1].length = libxl_ctxt.page_size;
     dom->acpi_modules[1].guest_addr_out = ACPI_INFO_PHYSICAL_ADDRESS;
 
     dom->acpi_modules[2].data = libxl_ctxt.buf;


