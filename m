Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5129D9378
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 09:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843400.1259014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFr8N-0006oa-Gr; Tue, 26 Nov 2024 08:41:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843400.1259014; Tue, 26 Nov 2024 08:41:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFr8N-0006mA-DU; Tue, 26 Nov 2024 08:41:23 +0000
Received: by outflank-mailman (input) for mailman id 843400;
 Tue, 26 Nov 2024 08:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zjIj=SV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFr8M-0006m4-3B
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 08:41:22 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34c9ca5b-abd2-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 09:41:19 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-434a766b475so2212505e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Nov 2024 00:41:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb537d4sm12594749f8f.61.2024.11.26.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Nov 2024 00:41:17 -0800 (PST)
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
X-Inumbo-ID: 34c9ca5b-abd2-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM0YzljYTViLWFiZDItMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjEwNDc5LjA4NDE5OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732610478; x=1733215278; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=69nPffd76CJigFlbnQewr3C0A2liyDSeY3ss5wqzMPg=;
        b=gT4Ojat9dEAC+rIvGOpY+L10q7didHNmzUl93Rw3izGGMo/Ez9OHpwi8obmc2wioP1
         pQozvBY9w/rFXBRCNF8dRvP85kMM33roh85bmK9S1O6LCA2hYL32spG9f3Q/DXEEJI8M
         FPbndTA2c8e7HbtFyAwmi0yBfYGa9bWpJV88G8uaRs4RzaHftVZJLrHvX3Y96IEkLszV
         2O9+i5X3hj3gAC4wy/rL4nJoqgJlqG07spEzLWJUwu2Q1o//ULQRCUBYUJxYYXm97hjL
         GjU++V0LoJYqOyTjYC16sO06twOJr677Ba9diBOcwidnDcaHOAEdU6Y+LSpbhbwjrp9q
         EUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732610478; x=1733215278;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69nPffd76CJigFlbnQewr3C0A2liyDSeY3ss5wqzMPg=;
        b=a4FcA+8MeT1WvupNnLT8wwxoZ9HJ6/Y15LT/jOfzCUrYVzQa8x7/s4XSiCyMXh04z2
         o2KPXrVezhdzd1aW46wQiUska+xsVuDqo7wyYGBSoIlxQZ+qg9mnNKzr9VUYTE9TxNyc
         92y25ObCR2RMF7UsXVA4y4gaheIZQxtoFezQU+WmrRg9c7H72zwiXM22epybp3DsPpRI
         GeoJgrb+e0ffWNeVOtpPh+i+nY8UDTNV3A20oiATuJFlRRDzB32w7qbJ+rgTdDUcI4R7
         s5iCPVqjNpgsej6k5h4qK9rOkzHcP7kWhAcf2dQJR0Pzrg/GTUCnlzxBMlfKekJhAeow
         kLOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqPfJBT1oBe3pYkxaHTbTuh0zWpSnHgl3MsiVqn/YJmujse7CB7cDBEp2PoDXnoGyy0apbE1RrGZ4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwbJZdcuVuOLP54OCmK9x5CxMQL5upws2k3kotb02hg3DwgaM4d
	15K+8FQ6kqgnw3WikEqXLEieCMCJnCqMhcQb9EJcxaA+963B0WYjZkOAjYkMbA==
X-Gm-Gg: ASbGnct136triCvJyr2VNiBFmT0oIfH/lrWc56QlubWcKNfD8/pRCm/6ZarI0agPQei
	3GjobXgoxjB+h8crLKmt9a2w9oVNLHKhDVV/ihxuhC0MhCgs/EKBRXBFap9wxBVO//htz/0FCR/
	dy3P8jk31A7C7r4B6jHl7L17CPP2cn0pjfv1RwDfiAeXpmF096KXYctCsH0/k/AJCKFWxVcFY7m
	LGyzD+EYgBnF8gQEqDFiKGMHVYqKgxUMRZW2k3ZrFoM28a6gdP/3Zxr9f/mH5oLyO1UR78+Blw7
	g77L/hmYzJBRtGBKVVBy/94BjC8glXdHMvs=
X-Google-Smtp-Source: AGHT+IEDJBNx+EpCxHwlNRs+ymsuctwuuLdgG45gpT6wDbJGqXAOtos79hijJJzZ5Z0q7hMGAriq+A==
X-Received: by 2002:a05:600c:1f8f:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-433ce4210fdmr162050805e9.10.1732610478046;
        Tue, 26 Nov 2024 00:41:18 -0800 (PST)
Message-ID: <2af39ca6-af4a-4686-bc4c-90dfbe9b6c8e@suse.com>
Date: Tue, 26 Nov 2024 09:41:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] Arm32: use new-style entry annotations for
 library code
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <658f0a05-742e-44ed-bf3f-bd6bb8c694a7@suse.com>
 <7026ab4b-11b9-4ca1-9d33-581fc46b11e9@xen.org>
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
In-Reply-To: <7026ab4b-11b9-4ca1-9d33-581fc46b11e9@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 21:15, Julien Grall wrote:
> Hi Jan,
> 
> Sorry for the late answer.
> 
> On 01/10/2024 16:16, Jan Beulich wrote:
>> No functional change, albeit all globals now become hidden, and aliasing
>> symbols (__aeabi_{u,}idiv) as well as __memzero lose their function-ness
>> and size.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> If the function-ness is important, some new construct would need
>> inventing. Not setting size for the aliases may even be desirable, as
>> I'm uncertain whether it is really legal in ELF that two entities
>> overlap in space.
> 
> I can't think of a reason where we would need the "function-ness".

Good, thanks for confirming.

>> I fear I'm breaking __memzero(), as I don't understand the purpose of
>> the ".word 0" next to where the FUNC_LOCAL() appears.
> 
> I am not entirely sure either. AFAIK, "0" is not a valid instruction.
> 
> This code was taken from Linux, the history doesn't give much clue 
> because it seems the ".word 0" was added before Linux used git.

My vague guess is that this is a crude way of arranging for desired
alignment of labels later in the function. That wouldn't require use
of .word (could simply be a nop), yet what specifically is used there
doesn't matter for the patch here.

> However, it looks like Linux replace __memzero with memset() 6 years ago 
> on arm32. So maybe we should get rid of it? This would at least avoid 
> worrying on the purpose of ".word 0".

Certainly an option, yet may I remind you of your replies [1], [2] to
a much older patch of mine, which I still have pending for the
suggested removal never having happened? I fear the patch here may get
stuck over this just like the other one did.

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2022-08/msg01185.html
[2] https://lists.xen.org/archives/html/xen-devel/2022-08/msg01190.html

