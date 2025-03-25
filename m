Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 162EDA6F87D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 12:53:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926411.1329261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2po-00065s-FV; Tue, 25 Mar 2025 11:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926411.1329261; Tue, 25 Mar 2025 11:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx2po-00063d-Bm; Tue, 25 Mar 2025 11:52:44 +0000
Received: by outflank-mailman (input) for mailman id 926411;
 Tue, 25 Mar 2025 11:52:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx2pn-00063X-IA
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 11:52:43 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8556ef8-096f-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 12:52:42 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so50884035e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 04:52:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43f331dasm204060155e9.8.2025.03.25.04.52.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 04:52:41 -0700 (PDT)
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
X-Inumbo-ID: a8556ef8-096f-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742903561; x=1743508361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=G1cYr8I6qORlTi6dZb7acGai+pNP1pMpg2G61H4vQHY=;
        b=BJsZLmq8AR6L4oa7q4oB7NdA5krGuLV2Bszb4U6N5V20+L4VvrWQ2+7aDdGmLX7SkY
         kB+01AFxOp3m0Jjs7HjGDYHvTFcXtCJHuslH+iszTNEzhR6bv2CbOQmag0LXzL62fthP
         ghNYoqGe/zNHeXP3OZ/IJ1MBrMTODd38AmoIAvYGKrajjcvYqf4XyTu7JxMtdggMoefc
         9KMwbR/TLvAhi7PMRIGRO0M+MYv/BdUbTK3IQG8Gf61TQstzfhMlXLUjpWyKvUxlb8Kd
         K8czeoxKRQHTvyYA5Vi11FebDINPvLIBZ2KY9jEO1zlBCcORBbG1YmY8KyukjLbNh2cH
         xRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742903561; x=1743508361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G1cYr8I6qORlTi6dZb7acGai+pNP1pMpg2G61H4vQHY=;
        b=YWMo9pTj11/5/jJxisPqzIUWHs/E/EDNcyNM0WMNZQXVQNxl9ubPN6iy5Z+v1W268k
         R/AImrJCove5pN62bHoPLQi6g7/z4v0wA8dARUQY1jHgwjQX98l5TOFHbhFqOVUKUGPb
         WkbDygcOsdMFSE20qDl/Y31NDKIeQBbDwMyzrvtyKnw9HCHMTBZZ3jajNvtV2jNJzqNM
         fnjgcIDBZY5YhS2cC33x4mEeHsxmmoS3ee0A6FSKR1F39HCZGh6BeCL+PZF3mLkHX7He
         QidH68VbingOkyFKJ9vcWo1qLZ43KM4qON8Id1t8HTqgk4d/eAhQIwEsFyogO0oC3obA
         Lc5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG6YoVA9bhRdnEmG7w+l2ZTtUc5a/a4CViYjYsefPRq+62ONhRfyvUGfCoPquhcJXzxY1hxZkM0xU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyBezGYvGyHxKS38/KQ4Xw60S0PA2sZXcGh6gpWJS93L65Y1VHn
	eaCag6orPBzyA1eIM9NPzp9x0RYQho205fEnWPKJjBgFnbULdznynUIcECeV/Q==
X-Gm-Gg: ASbGncsYFsdNVbCC1XZMr+5H5cUbQ5/o1oGxdX4s206Rn5+qjoILR1BydiIV/MoK/ZN
	Ql/qopn94/dgVrNVckGHS3+zOlz/6ajc9d67OG0RbwRXxrZplMP9YNsULLTL3GbKZsKPJQ4ZW81
	Spn/96RUsjG4Y3tnTvBYmIVNa1jCd9/OgKVHzqk58B2cRfGjhiPA89yf17LdIunUNPWLK2nDuyy
	rLLIGrqW5olG7kVjvI+tQh4zDDRzm/64BR+ob1iK4HCUHGAVHWcj76Z/VCOi6N0HroxZreu/ZQ4
	8dvoLpYsc+wK7viKxTHRSxnm2GfWm5elCDe7zlWZ8OWSwUBtutCo/NBv8FNWRdeto+Zj9y9IrRe
	SkCs7KWU8lautNsmbSUsTh4Z17IMS9A==
X-Google-Smtp-Source: AGHT+IFfK4nfcDoKa0uViZ0lrA4wrNOg1Yr89QIA1zEovnOubrB7XDLXTDpl0oBD7YxM+djABmD/2A==
X-Received: by 2002:a05:600c:3d93:b0:43d:300f:fa4a with SMTP id 5b1f17b1804b1-43d58db553amr98854625e9.12.1742903561439;
        Tue, 25 Mar 2025 04:52:41 -0700 (PDT)
Message-ID: <3d9e8e8c-2e09-43d6-a254-2f081c9e5eb1@suse.com>
Date: Tue, 25 Mar 2025 12:52:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: add H extenstion to -march
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Milan Djokic <milandjokic1995@gmail.com>,
 Slavisa Petrovic <Slavisa.Petrovic@rt-rk.com>, xen-devel@lists.xenproject.org
References: <0a072ab36b54ea7c4f9a6f94465fb7b79f9f49b2.1742573085.git.oleksii.kurochko@gmail.com>
 <c9c7c8e2-d441-4a1a-a658-98dfe0a98ed8@suse.com>
 <ee8b8e09-9b0b-4757-989c-b7d81721c325@gmail.com>
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
In-Reply-To: <ee8b8e09-9b0b-4757-989c-b7d81721c325@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.03.2025 12:48, Oleksii Kurochko wrote:
> 
> On 3/24/25 1:31 PM, Jan Beulich wrote:
>> On 21.03.2025 17:17, Oleksii Kurochko wrote:
>>> H provides additional instructions and CSRs that control the new stage of
>>> address translation and support hosting a guest OS in virtual S-mode
>>> (VS-mode).
>>>
>>> According to the Unprivileged Architecture (version 20240411) specification:
>>> ```
>>> Table 74 summarizes the standardized extension names. The table also defines
>>> the canonical order in which extension names must appear in the name string,
>>> with top-to-bottom in table indicating first-to-last in the name string, e.g.,
>>> RV32IMACV is legal, whereas RV32IMAVC is not.
>>> ```
>>> According to Table 74, the h extension is placed last in the one-letter
>>> extensions name part of the ISA string.
>>>
>>> `h` is a standalone extension based on the patch [1] but it wasn't so
>>> before.
>>> As the minimal supported GCC version to build Xen for RISC-V is 12.2.0,
>>> and for that version it will be needed to encode H extensions instructions
>>> explicitly by checking if __risv_h is defined.
>> Leaving aside the typo, what is this about? There's no use of __riscv_h in
>> the patch here, and ...
> 
> It is going to be used in future patches:https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/p2m.c?ref_type=heads#L32

For this and ...

>>> @@ -25,10 +24,13 @@ $(eval $(1) := \
>>>   	$(call as-insn,$(CC) $(riscv-generic-flags)_$(1),$(value $(1)-insn),_$(1)))
>>>   endef
>>>   
>>> +h-insn := "hfence.gvma"
>>> +$(call check-extension,h)
>> ... this, if it fails, will not have any effect on the build right now
>> afaics.
> 
> No, it won't have any affect now as instruction from H extension isn't used now.
> But it will be needed forhttps://lore.kernel.org/xen-devel/dae753618491b2a6e42f7ed3f24190d0dc13fe3f.1740754166.git.Slavisa.Petrovic@rt-rk.com/
> and for p2m changes mentioned above.

... this both being future work, it might help if it could be made clear
right here how things are going to work (with both gcc12 and up-to-date
gcc).

Jan

