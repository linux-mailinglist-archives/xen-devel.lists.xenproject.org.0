Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CFD938DEE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:08:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761697.1171705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqtr-00057X-L5; Mon, 22 Jul 2024 11:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761697.1171705; Mon, 22 Jul 2024 11:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVqtr-00055X-I6; Mon, 22 Jul 2024 11:08:15 +0000
Received: by outflank-mailman (input) for mailman id 761697;
 Mon, 22 Jul 2024 11:08:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVqtq-00055R-0U
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:08:14 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id afcefe0f-481a-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:08:12 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77c9d3e593so398738766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:08:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a7c3058f2sm47110266b.116.2024.07.22.04.08.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:08:12 -0700 (PDT)
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
X-Inumbo-ID: afcefe0f-481a-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721646492; x=1722251292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8vEJoS20U9T4zFE9PkSLs8DH9cg+4jTKrhK4jdHkx7g=;
        b=c6kMoh+7VfKst6+gf25j4Bw6WPlVTKrUcjU4ljj5Fl0+mZEOXFTUElRhNvu7h4fDUD
         0qr31Cy8x34PtNBFfWhEKBpCRTyvPe/rTR2L41VOIrtWNEgJZ+zZZoU6BbAfZ2rEt0Nl
         aMzE55NGbR/xni+EcLdWFoUwqmue/k3vCfu9e2PPg2eXqqYzuDLsRO65yyVkLTxQMl3D
         7hPoqpCXGKzSE3oJpATuTrJA3aBE4NRhmB1+gE4MnPPJMm+RwDBEIm2ggsyC7cEMhqdu
         MszB6uJkCVqTBvYNq8VF2o6WlNvJgf0WJDVNb6oQvx2tlMpTzwEb4KsCePDW1QWFlijW
         cmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721646492; x=1722251292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vEJoS20U9T4zFE9PkSLs8DH9cg+4jTKrhK4jdHkx7g=;
        b=QNkP6jBwkVe1rG6kVuHLxfQEFMqlasCI7UgpRKUw6IL3YC9Q7glXjGix7hkuKkvBkl
         6zW77DCnG7GfA/VHtc2l0FpgDeMqVWcOykhx1TPN16glWQGYvTj8stVtUxN6U/Q9T3Xs
         hEJhxVhfl2tuItoYfzdhQ5w+md0gJx4OLmhDbUsEcaIBO4KhgpH95fLoO7j4E7jFXaVB
         F8uP8Qqcm4N+rpDppo6JAUPhLeinM8BU1fjK73DO8EPyvFmdyEBqxSJGIi4FKtoh0qZJ
         tZyQ31mdxyH9+QuYeUrOYlM6MK7QbeKytsZG/JbLfUjrMjUEYKAig4B2LdwgtogWH/z1
         x41g==
X-Forwarded-Encrypted: i=1; AJvYcCU71qz/5XelTTACf727/+r3PaCWsHErsjpZdf8aeIixU/lXJ1pjQ4WXuQhwVacz1cuIFKF7liZt0AIKWSgyEg6/i7LqVpmPT86/egiSXAg=
X-Gm-Message-State: AOJu0YyMLjjeJsXn0RTGbbxYFUasZxNVACq/wOQEpiqHDv4BPOdNSzpJ
	YPCHlZa32Gngn2e7kgJjrhqHOpu7mTw72JvYkvJiKEuCxMP6Z/88pvkX8lf0+A==
X-Google-Smtp-Source: AGHT+IGRj6bi42oA2rh8pqqm/CM/KGXRayt8A1Y+CbX45NTJ/JyEMBiVZ8uGyT1JpAMrjmmaYPcvzg==
X-Received: by 2002:a17:907:1b26:b0:a77:cf09:9c5f with SMTP id a640c23a62f3a-a7a4c030e1bmr485480866b.37.1721646492309;
        Mon, 22 Jul 2024 04:08:12 -0700 (PDT)
Message-ID: <f2443c6d-895b-4d9a-b397-a5158c43a73d@suse.com>
Date: Mon, 22 Jul 2024 13:08:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to
 fuzz/x86_instruction_emulator
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com>
 <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
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
In-Reply-To: <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.07.2024 13:03, Tamas K Lengyel wrote:
> On Mon, Jul 22, 2024 at 5:20 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.06.2024 00:47, Tamas K Lengyel wrote:
>>> This target enables integration into oss-fuzz. Changing invalid input return
>>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
>>> missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
>>> build.
>>>
>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
>>
>> I've reverted this right away, because of ...
>>
>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>>
>>> +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
>>
>> ... this causing
>>
>> gcc: error: unrecognized argument to '-fsanitize=' option: 'fuzzer'
>> make[6]: *** [Makefile:62: libfuzzer-harness] Error 1
>>
>> with apparently a fair set of gcc-s used by distro-s we use for CI.
> 
> Well let me see if I can hack the Makefile to only build this with clang..

Oh, and - please don't special case Clang. Instead please check for option
availability (e.g. using cc-option), such that for possible future gcc,
when support there may have been added, we'd then build it there as well.

Jan

