Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB87B21FA8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 09:35:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078331.1439320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljXE-0002TU-L3; Tue, 12 Aug 2025 07:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078331.1439320; Tue, 12 Aug 2025 07:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uljXE-0002QN-IH; Tue, 12 Aug 2025 07:35:04 +0000
Received: by outflank-mailman (input) for mailman id 1078331;
 Tue, 12 Aug 2025 07:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uljXD-0002QF-6t
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 07:35:03 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id db69e505-774e-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 09:35:02 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-615d1865b2dso7604508a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 00:35:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f26cc6sm19961548a12.23.2025.08.12.00.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 00:35:01 -0700 (PDT)
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
X-Inumbo-ID: db69e505-774e-11f0-a327-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754984102; x=1755588902; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TjgY2L9LIm6Y/Iy9QxSTk1W1C6xWfCe15u3DnJipLGY=;
        b=QVcDDcJECx4nuLCIpO3hG+J6EJOH2aG6bV8lhwrLmjHBYsXOUEcfm8Uz2uQ8tBiE/Z
         28z3vGGpv4TvkxU4A4oT7TlM2P1DWUNSzXVT1ZTjsIJxVcgPp5oDCIjwInLRU6KXM0sK
         CE9F+124rJgXD/AivL4piw1bv+v1bSGU2hcZsoqYXiV3EHZ+tGy1T5rEebxPcZMxwO/L
         vBk6cacpV9RiN5Fm2At+irQbRhhG9DeCpNAtHfjK4FKcJ6f3fnm+zUyxh/bcK8P+r8F7
         tcQFdV31gqQ+w+zS6QCXKYuQdY0X1u0ylwxMDr4RsfE3cuF0zuEZu4+fix55fp5HnKM9
         ow0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754984102; x=1755588902;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TjgY2L9LIm6Y/Iy9QxSTk1W1C6xWfCe15u3DnJipLGY=;
        b=P1Xh+WtMwZOGBLa8/WUC3SvOIutQdB71a7BbQH41ELe6JDHRdF3ONYTfTVhAcKm6/N
         eJbc9jCg86NRfB8mtPvHukROwpueWWMLfnaiknUdttlOERL4CtYIcZQ2IL8C8dDwvhQD
         Gds/7QPr+ckt0wJujYXd6OQVT5SbhSN70dy9fIBCv9/BrT7F0PGVa+54lgos71uevAAG
         J+D7L4mPefwm6hYXnWGNx4rj9wb61Cw0QSTPLobYpXON4DsqZ41l3bBqAHmtQCFd9Zd/
         10524iT1xUDl6PbRCaZk2xqQ5ySidWBhzrkn2y0m3XN3z7Wcc0IsqO25HpzpZa5CXsA4
         BBtQ==
X-Gm-Message-State: AOJu0YxoFPUhT6JF4U262ez7MN8eNF763FZAbTjBy5MOmSEiuRq9TFP2
	JjGN3gnMrWdrgcjJ3Vgnlv8PDO+OuRrZkYmfnxWZxN5lkVv3EbkafdVNM3GBrl3KWA==
X-Gm-Gg: ASbGnct4hRsJLFjSow/zCFP3N2helNx44DaPBOj7EuwkJeUmGRm1HP3WAgxT7raxuEG
	k6KI00uAepVQT9mmlERQi1OcE2F9NwxrUywgpuZE4NpPpKCbqHNBLmUBIcFyBdRWyuUG09emApe
	HmeKg8PD/XIP73M5laAL+bMxNY1dcQagYjvksPiWLzuyoxP5dgRDmkHymLA4cpvJVRuMVVdsRZD
	n9dJ2oqp9HsPTiREMu7xitaXX3ZhwVIQuIBS/qObYzMI9mGifzZTlEne3QmN+2Cf2M3O9FoqkQ5
	bmBU+l44COLoGmTzXeiFFVY/IsyJQCqhpWJ1etyOlCfivE88MNJauixlNhNZjRcP6eWierIWSAP
	Zr2gGUzRVs8genbSfYJAN3VQ5Vm23sGXae9rZTSGWWINU0OIOON3sVWdxFCtpSMSp16yLuC3XMo
	HSS2ujiAU=
X-Google-Smtp-Source: AGHT+IFmw/9NOE/XLPprKqSzrpsec2S49D+xyfTArXE9D95V7HxQh/36Q/proL03zcoC4TUDorE7IQ==
X-Received: by 2002:a05:6402:5246:b0:618:30f3:1d7d with SMTP id 4fb4d7f45d1cf-6184ea28edamr1690587a12.2.1754984101522;
        Tue, 12 Aug 2025 00:35:01 -0700 (PDT)
Message-ID: <21bb7592-544f-4714-b45b-0ddfca3fc724@suse.com>
Date: Tue, 12 Aug 2025 09:35:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: comment default case in single-clause switch
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1d3c5364b726e42a8c38c396f2e20efc52790f62.1754933752.git.dmytro_prokopchuk1@epam.com>
 <d82cc723a17ec65f12fd60182fd6fe20@bugseng.com>
 <110fc2a9-2f48-4718-995b-3295b9c7e9aa@epam.com>
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
In-Reply-To: <110fc2a9-2f48-4718-995b-3295b9c7e9aa@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.08.2025 09:19, Dmytro Prokopchuk1 wrote:
> 
> 
> On 8/12/25 00:14, Nicola Vetrini wrote:
>> On 2025-08-11 19:36, Dmytro Prokopchuk1 wrote:
>>> MISRA Rule 16.4: Every switch statement shall have a default label. The
>>> default clause must contain either a statement or a comment prior to its
>>> terminating break statement.
>>>
>>> This change adds comments in default cases in single-clause switches to
>>> avoid violations of the rule where the `default` clause lacks a suitable
>>> comment or statement.
>>>
>>
>> If you want to go this way then at least this config wants dropping:
>>
>> -doc_begin="A switch statement with a single switch clause and no 
>> default label may be used in place of an equivalent if statement if it 
>> is considered to improve readability."
>> -config=MC3A2.R16.4,switch_clauses+={deliberate,"switch(1)&&default(0)"}
>> -doc_end
>>
>> and probably this one too (haven't checked):
>>
>> -doc_begin="A switch statement with a single switch clause and no 
>> default label may be used in place of an equivalent if statement if it 
>> is considered to improve readability."
>> -config=MC3A2.R16.6,switch_clauses+={deliberate, "default(0)"}
>> -doc_end
>>
>> In the end it's a tradeoff; placing a comment with a suitable 
>> argumentation might be strictly better than simply tagging the tool 
>> report, at least from a developer's perspective. From a MISRA compliance 
>> standpoint in my opinion both are fine. Let's see what the maintainers 
>> think.
>>
> 
> According to Jan's comment here
> https://patchew.org/Xen/725ec86ac1aa883c35fb30b8f226c95cbe0934e9.1754322299.git.dmytro._5Fprokopchuk1@epam.com/
> there were discussions about placing comments inside 'default' case.

For notifier functions in particular, yes. The config quoted above covers
more than those, though, if I'm not mistaken.

Jan

