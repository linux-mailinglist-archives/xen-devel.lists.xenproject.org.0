Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B4A1DAE6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 17:59:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878103.1288275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSSV-0006UP-1t; Mon, 27 Jan 2025 16:59:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878103.1288275; Mon, 27 Jan 2025 16:59:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcSSU-0006S4-VO; Mon, 27 Jan 2025 16:59:34 +0000
Received: by outflank-mailman (input) for mailman id 878103;
 Mon, 27 Jan 2025 16:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcSSU-0006Ry-5G
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 16:59:34 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 144719db-dcd0-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 17:59:32 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso233521366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 08:59:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dc186285c6sm5750349a12.20.2025.01.27.08.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 08:59:31 -0800 (PST)
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
X-Inumbo-ID: 144719db-dcd0-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737997172; x=1738601972; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RxqKwMA9kOjUonsXlqNle56031jlQk8fyLQrE20GJ5w=;
        b=MKRvFF9sKn/bYYka3KZm7PuFeTueoF4UE99+l73PZNCmN14RC+PMOKqg5umZX6zaDV
         IgJQwUP1uohPC9yiGazBBVuqCNTSUITrlqJzDSQvHA4PrGBlj/0SdUCx7p+3WiOyZmmE
         0jCy40p3Q7utD0j6ll2nbZoXTPyE1JWbijm3SNs74LtL227o4BXU+R0Ozmj9daIFCc2L
         eNjhJFTxqfdqIPCz3sDTl+c68Op/GH5ZOk7SEvEYA5+xf4BjyQLTnfUF09MqNYZqZOjh
         ZYJAQ87rPw/QeupIkrJb2uF7iUKxFu/4p/6Kc9M1HKIrJFV6nYH+XCn+EmcQxUFz7PaK
         ssQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737997172; x=1738601972;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxqKwMA9kOjUonsXlqNle56031jlQk8fyLQrE20GJ5w=;
        b=BlZwXH9+pee2sU97FiFk0atBbNDQSOhly2mBCTRVFNLfCC6jZHPm5qfQ9+GcbF+PDC
         jaSnodGBfj4MAYXvaYXeVM5sinZn3EnL7Dc3NmDJPR4Cf1Ym/y746a0WV0+OPSyZexNn
         TR3MdBCeqcBfbnMVukUo6s9+c9d1InyzkWT01FBZpeU6qmthfIzARbRWkXEP92vAsXgV
         7RESnapfcC8isV8xdbqh/HcSiBUAWQCtQU4mUaJCi5uhGKD92cClxeP5VGanqFUBqbM/
         byfpWnC/yKaweQI7no28dn2Pss3WGvLe5WRX73hhXUg7unLhtEFBy+guCXL9Qca9bpxc
         m+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXntw5wiXwVDW7inQlyg4exF/APfsGieM8KAANcUIy/1rvMTYzvq9dOmJn+BBlwu7xflnsfdZMkr4M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyd/ZjTX+LxZ5s8Z3Uo3P0Q2di6A0be+CzSBRS+g6dv3XJPQ/ci
	BhGPXlT59vLAixFtU5iTTwnchvWS8P5hHpYHNM19r5JGWTDtrU8BKR0PfX8T6g==
X-Gm-Gg: ASbGncvAAUbMcq5Ne9T7Kyh5mRV2kWb8Xs71BfbJDUJCoa5dXjtnS7evsO1B+nbVx+I
	n1C3SRyH2J1QtwIANa6KR+ltmbMdWLyBOZwXeXNXJE5Dxth3qEvCCyhb5KTFSvIFaOxHx87rTCU
	dC5RPzJoJ7aIpH4ibmx9yYZhUvfwY7Lg0z6Zo6G4WmW7httcaCnax7U+4AaGKa15GXmjUsqR7i4
	E6JpCSfpoJPHNq1fmK3TWByFRsOw2yrbDjgCsGu7eTr5Uro7/FoCAVxzF+ggaDw7w88eimrQ3Jd
	TnU+uZPoYlrk7ib1rhJf9ssVGMvAzrI4r5fibvCHqcxeZaI1+5FI53AYpkCaZp/xJQ==
X-Google-Smtp-Source: AGHT+IGYRl8beb/gqSBPL8OMTm64BCoorM3+PdU/77JFmS/Ah9C/+JD6VkmMqonIM1/s6Jl+LXgRPQ==
X-Received: by 2002:a17:907:97c1:b0:ab3:85f2:ff67 with SMTP id a640c23a62f3a-ab38b10d030mr3318681366b.16.1737997171910;
        Mon, 27 Jan 2025 08:59:31 -0800 (PST)
Message-ID: <e723d8a8-204d-4711-8206-df74c94c2ef0@suse.com>
Date: Mon, 27 Jan 2025 17:59:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] x86/emulator: Refactor FXSAVE_AREA to use
 wrappers
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-9-alejandro.vallejo@cloud.com>
 <bc5185ca-9001-4699-82d0-88e629ae6503@suse.com>
 <D7CYXLM3PCGY.2DYKXZEIQH1Y2@cloud.com>
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
In-Reply-To: <D7CYXLM3PCGY.2DYKXZEIQH1Y2@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2025 16:42, Alejandro Vallejo wrote:
> On Mon Jan 27, 2025 at 10:52 AM GMT, Jan Beulich wrote:
>> On 10.01.2025 14:28, Alejandro Vallejo wrote:
>>> Adds an UNMAP primitive to make use of vcpu_unmap_xsave_area() when
>>> linked into xen. unmap is a no-op during tests.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> Thanks,
> 
>> despite ...
>>
>>> --- a/xen/arch/x86/x86_emulate/blk.c
>>> +++ b/xen/arch/x86/x86_emulate/blk.c
>>> @@ -11,9 +11,12 @@
>>>      !defined(X86EMUL_NO_SIMD)
>>>  # ifdef __XEN__
>>>  #  include <asm/xstate.h>
>>> -#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
>>> +/* Has a fastpath for `current`, so there's no actual map */
>>> +#  define FXSAVE_AREA ((void *)VCPU_MAP_XSAVE_AREA(current))
>>> +#  define UNMAP_FXSAVE_AREA(x) VCPU_UNMAP_XSAVE_AREA(current, x)
>>
>> ... the comment here kind of suggesting that ...
>>
>>>  # else
>>>  #  define FXSAVE_AREA get_fpu_save_area()
>>> +#  define UNMAP_FXSAVE_AREA(x) ((void)(x))
>>
>> ... use of this new construct is solely decoration, and could hence as
>> well be omitted.
> 
> It seems like a dangerous proposition to abuse knowledge of an implementation
> in order to skip parts of its interface. The fact that no such map is required
> at this point in x86_emulate does not mean it never will be. Predicting the
> future is hard, but being consistent today is less so (imo).

Entirely true. How likely do you consider it though that with a future
change altering that property, the comment above would be left in place
(and hence then be stale)? My take: Very likely, as long as the two
"current" uses wouldn't need altering.

Yet FTAOD: I'm not asking for any adjustment here, I'm merely mentioning
an observation.

Jan

