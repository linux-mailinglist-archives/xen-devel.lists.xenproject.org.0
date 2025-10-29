Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53634C1BA07
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 16:24:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152874.1483379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE81z-0000Qz-Co; Wed, 29 Oct 2025 15:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152874.1483379; Wed, 29 Oct 2025 15:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE81z-0000Oc-7y; Wed, 29 Oct 2025 15:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1152874;
 Wed, 29 Oct 2025 15:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE81x-0000OO-Ki
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 15:24:09 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5027a4eb-b4db-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 16:24:08 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47721743fd0so4849465e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 08:24:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e222ca5sm56827985e9.15.2025.10.29.08.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 08:24:07 -0700 (PDT)
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
X-Inumbo-ID: 5027a4eb-b4db-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761751448; x=1762356248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3KKUpRsegBQyQOw2Ndw6/gWUDRIf/NOiDOKyEMcTvoE=;
        b=bn1uDulg1npsp8tJOQofM7w9qVUC3HeEh9/Y3cs9ONsn04j6FMjOhFZW/xcfVXxb3p
         veVWuh8a5fIXuHti0PXoDQgVWsvZe7XYpKVa0o5A0/WAVfEakwzT6ACyRv4fMAVJ4Bqe
         3w0P+O9AkAMe3LUiYRZYd2gQ3T0qwaV3Go4UxNbB5cFjeJ8RZLTb5MKg2c7eBnKZMflj
         2xoWiiPzB1wk8u+BpUSxK1KRdoITRsKQGjbKNYDfcZNTNucLKSY8pQ9YHrSvjS0bxRHi
         9xfn7QyvftfxRqqmEsgdYCG7QdmgM3uJcTV6203iUshK9PqnTMG7GIqyEEADSZx3YKk1
         JTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761751448; x=1762356248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KKUpRsegBQyQOw2Ndw6/gWUDRIf/NOiDOKyEMcTvoE=;
        b=P1SF3otE4YALQxYLSV13+fMma2X/vD1BtjE7sWzseBeymU0WKkQNdq8goFaowtmBb6
         rH3wxMXyFHFQ4kJJzm7XqLIOqb36dCur1w9qq8dK/Qi0UzLAol8lChC2xltUvhYvJAr4
         6afL26ziF47rAIb5UhTDm+EAHasfqAAB5u/PMtlRf4Zugv4dzXEjfpo+cC1eMMrYc6Xm
         dZSa+qsLigMh+GX68sK9WaOKbnQT59NZcLQTv1Hq5aKe7iMcoNzY5sl7Z5YHtbQKTuj8
         nDpSPOCqOq+JuhnUo5GLFylqnV4XBylLaUd6FXZ8/wQllV81MHSu1FeaD2ttvP6YS4FC
         j34A==
X-Forwarded-Encrypted: i=1; AJvYcCU5t8W9yo58Zp8LYOsEn02ou6QDmQ0fOZJXLgQYa8N/3AAE91nSzYNElTBlZRp/uwZfHOdXPY1xmqc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIoJ8zbSohuKvyFX791e4uGL0ti065JEKaeolzEBQOblE2uQ/+
	LgCUYfCc48aOQURkamK3OcNGecMTAu1GVyOMKmfDzZgLg0IeJ2jRA9PwJfi3bOH9XQ==
X-Gm-Gg: ASbGncs4FIp83jK+f9b70X9YGsQGradJo4gib5G0Dt/z+6p0+SPJQ85IQNZKvY1AErz
	QbEzIXk0+uywRKBFpYG4e5SwTnHEj5K7X8UqsO/2L7PEH8j9OtR4bQOUheF4fksUvuknl3pHWRz
	EHmqATVX8CWbVGwguPDUKj4/ZBnjubP0sawAbqXhbcHJO2g0x/ZXzQ3PKh9c92qnuVSgbjNOr+F
	3Pp+sdIOqH7ekDfkO+R9NJapPM3ZB69UlEpZp0MnYR4cPp5E4plcuZcGQUxtoFI/jZN944rdOQe
	04L2cCBNFHH4PXSz9r8GYEO2i2z49Grc7lQer4cUB8B354fnt1opCw09sbvQFtrePGEiN39R5Mh
	jCVFvXRgXUxeYxpBQ2kIABSkq2HeIFp2nNCnp3WsKJlNA+ZSAsLqiRAyTNLILiHT8a+whcRvY6V
	IAm8tPaglGBProdu+lLLjYEsSFPS8qQh5lAO4Qbik2kK3kzPIuQ1l/KNYmsA1EH6cTlNItWgQ=
X-Google-Smtp-Source: AGHT+IH75uIJVJnDCMUXEOo7evOY9aNKJnEA56PRjND+5Hl3lX769Y+v45z2JrW/hCN6qb2n8Gnh6w==
X-Received: by 2002:a05:600c:19d1:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4771e21ed74mr32570625e9.23.1761751447889;
        Wed, 29 Oct 2025 08:24:07 -0700 (PDT)
Message-ID: <a67fb756-e8d3-4b97-a12e-e779add1d98b@suse.com>
Date: Wed, 29 Oct 2025 16:24:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] symbols: avoid emitting "end" symbols for data
 items
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6fdfd369-6c1e-48a5-8189-4999d566788a@suse.com>
 <398385e1-c21a-41a3-a76c-be820ff4341d@citrix.com>
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
In-Reply-To: <398385e1-c21a-41a3-a76c-be820ff4341d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.10.2025 16:13, Andrew Cooper wrote:
> On 29/10/2025 1:34 pm, Jan Beulich wrote:
>> symbols-dummy.c and the generated .xen-syms.?.S may place their symbols in
>> different sections: Like for all C files, -fdata-sections may be in effect
>> there. As a result, besides moving these symbols may then also have
>> different amounts of "end" symbols inserted between them.
> 
> Sorry, I can't parse this sentence.  Do you mean "these symbols, there
> may also be" ?

Oh, yes, I screwed up there. (I think it read half-way sensible to me when
inserting a mental comma after "moving".) Really I'm intending to go with
"... besides these symbols moving, there may then also be ..."

>>  While the
>> movement is likely not problematic, the change in table size is - linking
>> passes 2 and 3 want no address (and hence no size) changes between them.
>>
>> As, at least right now, the "end" symbols are useful only for code, limit
>> their emission accordingly. When data symbols are emitted (i.e. when
>> LIVEPATCH=y), this obviously also has a positive effect on overall table
>> size (I'm seeing almost 600 entries going away in the build I'm looking
>> at).
> 
> Xen-crashdump-analyser needs end in System.map, and I expect so does
> `crash`.
> 
> As this patch only adjusts the embedded symbol table, I think that's all
> fine?

I think so. With "end" (quoted) I never mean symbols with the name 'end'
here, but rather those that tools/symbols injects (as unnamed ones). No
symbols with names (including ones named 'end') will be affected / removed.
(I think though that it's '_end' anyway that you mean.)

Jan

