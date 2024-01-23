Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68611838A78
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jan 2024 10:39:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670320.1042999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDFm-0003lG-56; Tue, 23 Jan 2024 09:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670320.1042999; Tue, 23 Jan 2024 09:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSDFm-0003jh-26; Tue, 23 Jan 2024 09:39:34 +0000
Received: by outflank-mailman (input) for mailman id 670320;
 Tue, 23 Jan 2024 09:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9pmr=JB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rSDFk-0003jb-Fu
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2024 09:39:32 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f3b39a2-b9d3-11ee-98f4-6d05b1d4d9a1;
 Tue, 23 Jan 2024 10:39:31 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2cf03521306so16071341fa.2
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jan 2024 01:39:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m1-20020a056e021c2100b00362772f67a1sm1763718ilh.20.2024.01.23.01.39.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 01:39:30 -0800 (PST)
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
X-Inumbo-ID: 4f3b39a2-b9d3-11ee-98f4-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706002771; x=1706607571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UGI8NV5kTpwX2KA1vZT+ImwYEIUrTLhXHybP9AU3X38=;
        b=RvZnLjdVoQays6BdLnKtQZcY+qO2HYpjK+dGfdzxs1pFatO0FQtOhOt4lY25m4shaD
         sQhVlDa3S5WjAj6BqR/8sWm1rq+aAGlpIxgAfGsIjqmAyW8cRG8iOPwbCsJX3iC1kYEc
         lKfxMFjSpZeyrdH4bJMw8yi4JfDPEvHW3uwfWFW47bnFGvUqtvm49r8v6RABpwEwtywR
         gCFVmJ5S68Ou/XPppljMzFG1PLkSEvlqZ2vN3cmfl14HSPXeXFxRH9fR4P1zxQbRyyK2
         DOvRgKA+uLxXTM0H9+s3mb5Rk+G0sg/izOnfq1d9o5gYxfdAsn0CdbV0dnYvMyZyNbIV
         S92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002771; x=1706607571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGI8NV5kTpwX2KA1vZT+ImwYEIUrTLhXHybP9AU3X38=;
        b=tLBktNjI0ozDkl2cJsxeR5TpmMrifthCiwZG2YVrzSiGdqHevyHgACy0mu1UXHzjCC
         ydCpqaMFSiYF5jPKovR862IQvnNTXtafqlEtCYEQfHdn6OFaHHb04klEyMaX4CRx3HGf
         ozXNhwSid7yAkfrXBtsV9+jrFCh5+kzGxJ1vIF7zosp8j4R8j+cBjmoO0wjcR/d61kLM
         D/Rm8nWV1Eh+XBqT8tqtbdG50Zezb0+/LOBagt2p0LxxFUggJ9g9v8UK+zaO0mtyl1Tl
         /CGcvMvnPpxYqXSG1ODEq1e70SVH3xn0pRCENFu3x7AUtsn9dVvCWybUFiv5EqawlCOH
         uBKA==
X-Gm-Message-State: AOJu0YyIvK0RZ+h/8TVAxUoq4Q7NXgtKiP8a+62SD8DC9FEX4gGtCTLf
	qhGWzxaUMx3pxP4OpQTfdunyfs51Ha2JLn1yk06sRWlFCB1zC0OMII4fOEuzcg==
X-Google-Smtp-Source: AGHT+IE33CZwjR4qolRsxnNRxfkd7Pv7IbWk/p1KDuUBsq80VwsssOAsRHlkFbx7ehCWhgwvYbbThA==
X-Received: by 2002:a2e:9992:0:b0:2cd:1c0c:99 with SMTP id w18-20020a2e9992000000b002cd1c0c0099mr2267360lji.74.1706002771027;
        Tue, 23 Jan 2024 01:39:31 -0800 (PST)
Message-ID: <cb138566-c113-4a03-8a48-8f3a1d1dcb0a@suse.com>
Date: Tue, 23 Jan 2024 10:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] x86/livepatch: align functions to ensure minimal
 distance between entry points
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240122110244.14091-1-roger.pau@citrix.com>
 <013210fd-6ea3-4719-afcd-1da97d9cd17f@suse.com> <Za6laZtVdQtFP4F5@macbook>
 <ab34df2d-ba47-46c0-a0f2-9c051f640906@suse.com> <Za-HtRgSbO3kiK7u@macbook>
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
In-Reply-To: <Za-HtRgSbO3kiK7u@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2024 10:32, Roger Pau Monné wrote:
> On Tue, Jan 23, 2024 at 08:53:15AM +0100, Jan Beulich wrote:
>> On 22.01.2024 18:27, Roger Pau Monné wrote:
>>> On Mon, Jan 22, 2024 at 12:21:47PM +0100, Jan Beulich wrote:
>>>> I'm further curious why .text.__x86_indirect_thunk_* is left past the
>>>> inserted alignment. While pretty unlikely, isn't it in principle possible
>>>> for the thunks there to also need patching? Aren't we instead requiring
>>>> then that assembly functions (and thunks) all be suitably aligned as well?
>>>
>>> Those are defined in assembly, so requires CONFIG_FUNCTION_ALIGNMENT
>>> to also be applied to the function entry points in assembly files.
>>
>> I see. Yet the question then remains: Why is the alignment not inserted
>> after them? Or will the insertion need to move later on (which would feel
>> odd)?
> 
> The thunk sections will currently be consumed by *(.text.*) when using
> split sections.  Looking at the assembly for them I think they are
> suitable annotated to create the right symbols for livepatch tools to
> pick.  They won't however have the right alignment just yet, as I
> expect that will get solved with your follow up patch to respect
> CONFIG_FUNCTION_ALIGNMENT in assembly annotated functions also.

Not exactly, no. Those will first need converting from ENTRY() to the
new annotations model. Which I certainly intend to get to.

Jan

