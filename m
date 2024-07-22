Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325C938BF1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 11:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761579.1171547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpDk-0001wj-4B; Mon, 22 Jul 2024 09:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761579.1171547; Mon, 22 Jul 2024 09:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVpDk-0001u7-0p; Mon, 22 Jul 2024 09:20:40 +0000
Received: by outflank-mailman (input) for mailman id 761579;
 Mon, 22 Jul 2024 09:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVpDh-0001u1-Vn
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 09:20:37 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7e8fd56-480b-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 11:20:37 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a77c349bb81so382560066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 02:20:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c8c1e2asm396074966b.129.2024.07.22.02.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 02:20:36 -0700 (PDT)
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
X-Inumbo-ID: a7e8fd56-480b-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721640037; x=1722244837; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+qrDm+7iCuvG3eHk4Ffj9sSIZXtIE/q0BFusZ7IB3LE=;
        b=H2vty+eU+QLJyLqfjsYdYoG5FtSr6w78AuQJ93VwhjMrbFTKH7cBcSRPRUVclMZfwb
         2WeHcu+oDNu6gb9meKt78enwHwAvrfG41f/I2y9Lq4IdHOS+4GjcTz7fblpu6R7m3S0P
         0lyEhV8bhLqz0n4zQAG7eKOVKkvN16OQG9r9cANEsBtrvK55ahdOGsrt77cbuNcx0CN5
         OqJFm1E+aPZuTKpj/w522sUWr5I30qPTSdodP/Dfr16cfAmd6QblkZRPpYB3HmeZ9z7F
         prPUn5MN2IT5GFagLs2dfo6Xx18kwxNTXE06FE2OsIFqgRSrA/uO/721Cp+oVmN9xYcx
         t74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721640037; x=1722244837;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qrDm+7iCuvG3eHk4Ffj9sSIZXtIE/q0BFusZ7IB3LE=;
        b=p9135QyMkqfUiIH7yQtQ+Q3NefH0koLd1squg3Mt1Ev9wN1VIxUUvoP2QaR9T19NbE
         ru9xisC4Y1AAKNexkLWdLfZ/TY0YpCkh6CH2/w6/4DAq/LfTc+m4ajo/k1/PgFHkgx+q
         t9JocoQXuiF9Rp+CFe/d3AfuMTAy+OCwSPV1fie7L34Txx3EIDr+Ob5HH4E82H2Kw0ZD
         +r2XWYFrXVyNSI5Xt7CchJdT+j3243/AXAVD0Z5iDL9lNkS2uA2boTq0k1+0G0Wm/d/9
         Hee6RF5h5zZkwCzCBdKawkqovzdC5n3gxVMeIeJWrLEElEwCpsii7qpM0aOgUO43LVDL
         bm0g==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8bCBAA5nKOG7g2l0p2cqZofoobjzZusjqutT03irHGHYxXtS/HOxbYsxK3ArpV2pzanBXK8GEy2dfx+Ya/M5E3OD2zJzWqcRdQwhbbk=
X-Gm-Message-State: AOJu0Yyk6h8rhz0rG12jaURvCkc1DoHUt/vD2Idu2i6xlkqvswYYn0cW
	e4vsp6/ICDqY3G64pD1NErW73nSGGP9Sk65S7Ldtuz4yUnFOAhaqtT+EXtktLQ==
X-Google-Smtp-Source: AGHT+IFuszN5Uz9Ql1DmYTI9hphvM34iGZz/AxkpuuVUuGyEx4jk6xUcLiJFf8UayvQ+4SgMBCFZBA==
X-Received: by 2002:a17:906:7952:b0:a77:e7cb:2979 with SMTP id a640c23a62f3a-a7a4c2a6123mr474139766b.51.1721640036648;
        Mon, 22 Jul 2024 02:20:36 -0700 (PDT)
Message-ID: <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com>
Date: Mon, 22 Jul 2024 11:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 00:47, Tamas K Lengyel wrote:
> This target enables integration into oss-fuzz. Changing invalid input return
> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
> build.
> 
> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>

I've reverted this right away, because of ...

> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>  	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>  
> +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
> +	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@

... this causing

gcc: error: unrecognized argument to '-fsanitize=' option: 'fuzzer'
make[6]: *** [Makefile:62: libfuzzer-harness] Error 1

with apparently a fair set of gcc-s used by distro-s we use for CI.

Jan

