Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC389E8DC2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2024 09:47:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851047.1265200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZQF-0006Jo-VN; Mon, 09 Dec 2024 08:47:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851047.1265200; Mon, 09 Dec 2024 08:47:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKZQF-0006Gf-SL; Mon, 09 Dec 2024 08:47:19 +0000
Received: by outflank-mailman (input) for mailman id 851047;
 Mon, 09 Dec 2024 08:47:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKZQD-0006GZ-Vn
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2024 08:47:17 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30b959d7-b60a-11ef-99a3-01e77a169b0f;
 Mon, 09 Dec 2024 09:47:15 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-382610c7116so2075205f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 09 Dec 2024 00:47:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2162685c495sm39729085ad.38.2024.12.09.00.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 00:47:14 -0800 (PST)
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
X-Inumbo-ID: 30b959d7-b60a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733734035; x=1734338835; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dxNOweMxEd9puvkP05C8dvU33hQOHGm77Fh+Ny5DHms=;
        b=T6chaM5e+du8QFO3snoJo4i7K/gnUe2zBSY2hlRlWtpEaMfq/O0EaW+r5rWsuP+Dj/
         uhgBhx9rfzmbUcqOAH8YN9EclniITflYjDn45l/q+9yfxeBL6obFNisspFjvDJeMhA/D
         /TUVxVXxEJX0cZfwp/khNyK+nKUgByOLh0um6pRT0dfGb3lhcNkv3aSLIJ59ynUHA9Wb
         DVwTF4oCJeXUkPQNpk89Vbc2OIAnstcCySgkUMqdz4bWl7CJbB0sCkbM+dUKU1iUYlpf
         uHQODtqZyw3Rojlco9K61kp5s/8ljVWgq95pRNRD4PCFH73d+YyAbpOho7rEj65bqUHP
         hwbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733734035; x=1734338835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxNOweMxEd9puvkP05C8dvU33hQOHGm77Fh+Ny5DHms=;
        b=QX3a31IXDnUzs+K7hQunVDB0mJj+mUgZ7O86sap7joBadq8HFLKK0EB3bSsm40eqxe
         qTdkod0ElLIlypkhAQBDqYK5Tpff1ejrTWs/EVpEBxChFkDiX6hXFFcqaGVU4V0ZXdW5
         VvaKQdZ+VwEHrLvXpV45elMjy9CDQWhSb9oTuu6MD4mVgyZ1GCp9pggdcspAWw+Layl+
         CrsRozGbFfzRgsyPWUlA6TXrFfJKm+RrNF00KFhLrV6QPQtVJ10Uk6CWAkNBeYhpNDbM
         pRsv6HQ+uzZkPJdfabaiCvaRczY4mHCuYDjcyRsc99mk66j70hqEcZNivxgi2Jaaihg1
         b0nw==
X-Gm-Message-State: AOJu0YynzxOSu7ILxxK4oCbJE514c3Mya1bJHRZWGGof5tcTX4VUDV9Y
	Hp0Aqb6VrxuvdzSUtzH65mRymIO/DF/cIv9/xWQEat/zqan04NHddcHejVaHRw==
X-Gm-Gg: ASbGnctE3nn3MKqjkyoNulXeR9dE68wP4KxU7XZE2FkrTv+5MSG5duYAYfkrq6V6hXC
	LrHgRa5s9B3VaWzOgBlF6EUWpwWXYO8EXOUepHlU75pTiOxW8L2Mb8Uxoo+d6ES0KHMF9oTyHT0
	C2G7ExkaOsdq2EcF6916xSKL1byZAwexzMDgYUGMJAP08joymxpySXcKtCEXW11bFytSqRHor76
	dlHJDhNBnXSv52TsPMTr9fYl/SwCb5P2s5/ZB7qksHdVPOD8elcqpimkZwpCXM2SJlVP6h50oBm
	XjB3CG0XuALv5/hxXXOqZh2JzGvpGvdLcyo=
X-Google-Smtp-Source: AGHT+IEj8zaRdeB8IWX8JeQhJYj23gywJIiDOsDhWmlK6gnyezHiGkgGkcf6udSrSZnPWoaUj5q7iA==
X-Received: by 2002:a5d:5f52:0:b0:386:2fc8:ef86 with SMTP id ffacd0b85a97d-3862fc8f19amr5933871f8f.14.1733734035021;
        Mon, 09 Dec 2024 00:47:15 -0800 (PST)
Message-ID: <f9a73a6b-1932-44fe-87e3-e43debe19c0e@suse.com>
Date: Mon, 9 Dec 2024 09:47:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Virtualize architectural LBRs
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20241118084914.22268-1-ngoc-tu.dinh@vates.tech>
 <7706bd63-8f26-4eb8-8dc0-67b302597e3b@suse.com>
 <3f75df1d-f397-487f-9b81-d7740712b924@vates.tech>
 <78d9df73-c9b7-479d-8e05-e4efb823ea20@citrix.com>
 <953fed09-385c-4489-ae50-b59ebd444114@vates.tech>
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
In-Reply-To: <953fed09-385c-4489-ae50-b59ebd444114@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.12.2024 15:16, Tu Dinh wrote:
> On 18/11/2024 10:52, Andrew Cooper wrote:
>> On 18/11/2024 9:13 am, Tu Dinh wrote:
>>> On 18/11/2024 09:52, Jan Beulich wrote:
>>>> Looking over just the files touched: No change to XSAVE logic at all?
>>> XSAVE is hidden behind a new IA32_XSS bit. I'll try to implement that next.
>>
>> It's rather more severe than that.
>>
>> Without XSAVE support, Xen can't context-switch the LBR state when vCPUs
>> are scheduled in and out.  (In patch 4 you seem to have copied the
>> legacy way, which is extremely expensive.)
>>
>> Architecturally, ARCH_LBR depends on XSAVES so OSes can context switch
>> it easily(ish) per thread.
>>
>> There's also a reason why we haven't got this working yet.  There are a
>> couple of areas of prerequisite work which need addressing before XSS
>> can be enabled properly.
>>
>> If you're willing to tackle this, then I can explain what needs doing,
>> and in roughly which order.
> 
> Following the community call yesterday, I'd like to clarify my 
> understanding of the issue:
> 
> - Firstly, virtual XSS support for architectural LBR must be enabled. I 
> noticed that XSS is already implemented, just not enabled; barring the 
> LBR format issues below, are there any other issues with the current XSS 
> implementation?

At the very least, as with any code that exists be is effectively unused
(and iiuc even DCE-ed by the compiler in at least some of the cases) it'll
need to be determined whether what we have actually works. It seems more
likely than not that some corrections here and there may be needed.

> - There are LBR format differences between some cores of the same CPU 
> (e.g. in Intel hybrid CPUs: P-cores use effective IP while E-cores use 
> linear IP). These differences are expected to be handled by 
> XSAVES/XRSTORS. However, Xen would have to make sure that LBR MSRs are 
> saved/restored by XSS instead of by manually poking MSRs.

How could XSAVES/XRSTORS take care of format differences? Something that
was saved on one type of core and is to be restored on the other type of
core would require CS.base at the time the LBR was originally written
to be able to convert effective <=> linear IP.

> - A related issue is handling the compressed XSAVE format for migration 
> streams. Xen currently expands/compacts XSAVE format manually during 
> migration; are there any concerns with arch LBR breaking the XSAVE 
> migration logic?

That ought to be fine, I think, barring the first point I made above.

Jan

