Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99200B3A5BF
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 18:11:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099588.1453371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfDV-0004Kv-MV; Thu, 28 Aug 2025 16:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099588.1453371; Thu, 28 Aug 2025 16:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urfDV-0004Hn-Jn; Thu, 28 Aug 2025 16:11:13 +0000
Received: by outflank-mailman (input) for mailman id 1099588;
 Thu, 28 Aug 2025 16:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urfDU-0004GU-8p
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 16:11:12 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9c8028b0-8429-11f0-8adc-4578a1afcccb;
 Thu, 28 Aug 2025 18:11:10 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61c26f3cf0dso1888821a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 09:11:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61c310ab189sm11822826a12.8.2025.08.28.09.11.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 09:11:09 -0700 (PDT)
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
X-Inumbo-ID: 9c8028b0-8429-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756397470; x=1757002270; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oegueVaEFDD4ZZ/5zlAlg+aHdgEPHnv5g2qLMQZDk0k=;
        b=OcIo3WfUQ7WAsBh2w+6f6X20rCkIFJC+Tn4uIwA8qEbg30/T/GQrptfzaJWF+k6CGB
         mj+9Z8A+5wEqNdbuWLxTfM9Zx9KWHFxf9RI3VV6q0hzXV7XuhldbaPUwlOzRWkmosvDH
         21qPpQgDlEZk0u5HjKCRD98OOzZPvEK0Dc/3Dwa6VNcCORVp1TVHRCsuLwY9mAPiwXcd
         F0O/HBGeaN/G99D3zDlE+xBMBalQD42JJMAHmFYYgwQJO1TtpBb694yd7Lggwxvem4b9
         4HA2gI/tKLyf1VV/OPpW/CIpkwoWpFvMXpNbI6JS6HbN7j66SUG6SfYhdWLwLiWXkKC8
         1x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756397470; x=1757002270;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oegueVaEFDD4ZZ/5zlAlg+aHdgEPHnv5g2qLMQZDk0k=;
        b=OR3cqflsiPZpO9YPYbXEpgFYLS/nZOI+I7iaJIpYLh756RVobhCqW3DGeTDrVjFyDs
         0mOSiuql2mTAmmibazStd5RN6+70z/NVMr4crj12h3YX4HvJgfwqTmZtH4GE62epq7CH
         XSVwSnPNRRLDhZ/ACIGKnP/l93rLkasTUc8pBD6hgnfwGTsd82aEii7hzxrHR8ZR2E8c
         DkH1NU0l9M+vPV5tKcwAJ6Ku1EwRyHwt8wP+wa81Tz4OxRD9tOOZrPuyZQEhKpzJ1rd5
         9W7ptt4tPHxfApzaoewhDHWe1zazQ0NjBBvxHQwS0DAW+4hVBQXXWShTcj2rRSv9hEw2
         DNBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3zKqUUk82x4FUE23tiXjb8tQmU1rDkVN/rwgn9xnrcdZISpNmN8U/2r+xYBo5A40tiesIfZu51s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySYZFjXizNnl/nH9cqzYdZLUk+M93eEDuRmmRn5JkBQ0ds9hDv
	+NtCyrgHiOdxpI5AlgqdsrJme2/23Paa60WI8oDnZtlNzrDVHkGQ0N1bqA7Xd6T30g==
X-Gm-Gg: ASbGncuKYjCtG7JruzU3sBo0XvWxdeNY33H6x3tPe5FIKZ8+4rn2ZZFfcg95ToVmHOp
	imqbDTvQsJXJGlNWJQylXEsDUAgwP9bT/TQWncW1oibOChy7eOFn8S5sMDxnUmnMsKqotGm7dNm
	w7rk8oI8L6DdM853YefvNXr6vV+795N9t2mK4kFpDss6nlveeqe7OCgTRoPi+N4ZOivm+UToGu6
	uArcI08uXFFBrgwFnEyQVh35dCIOvcyiwkb+9gkb2yedVi92hXfuA23ISKwcGm3iC9DZhAPoFOX
	iR+dMIG8x5CnrrKRH3f/rmjQeAImbEfDSvH9pc0UMbOnjS0z3lEVFQDB/IvRM6/ETI22cxLYKdZ
	5+XY3Yxk8i/YOqHL+Ef9QQEAVIouK57RvoieqjkX/HN94S4lSmIIJpUWtCfzb1uMLqFSlDWRJGf
	mNenhwhZEGrb9Arber9Gk8g+g/Cowp
X-Google-Smtp-Source: AGHT+IFciKwCWaMnoXdlXEm4i2yz/U3i2BTeI+teBr8p7xUtFBn1fWqSUBNllXsQzKq+xIgr7nIUPA==
X-Received: by 2002:a05:6402:50d3:b0:61c:7a9b:21e4 with SMTP id 4fb4d7f45d1cf-61c7a9b24f4mr11667682a12.16.1756397470111;
        Thu, 28 Aug 2025 09:11:10 -0700 (PDT)
Message-ID: <e9eaf331-4a32-4c80-8b0a-5f36d8fd9022@suse.com>
Date: Thu, 28 Aug 2025 18:11:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] symbols: arrange to know where functions end
From: Jan Beulich <jbeulich@suse.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
 <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
 <24fd00b5-3053-43ae-8342-887eee94869a@amd.com>
 <d934d8a8-93c0-4cb6-baa4-f2aedb719f25@suse.com>
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
In-Reply-To: <d934d8a8-93c0-4cb6-baa4-f2aedb719f25@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 09:28, Jan Beulich wrote:
> On 28.08.2025 03:03, Jason Andryuk wrote:
>> On 2025-04-02 09:58, Jan Beulich wrote:
>>> --- a/xen/tools/symbols.c
>>> +++ b/xen/tools/symbols.c
>>
>>> @@ -318,24 +334,42 @@ static void write_src(void)
>>>   	printf("#else\n");
>>>   	output_label("symbols_offsets");
>>>   	printf("#endif\n");
>>> -	for (i = 0; i < table_cnt; i++) {
>>> +	for (i = 0, ends = 0; i < table_cnt; i++) {
>>>   		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
>>> +
>>> +		table[i].addr_idx = i + ends;
>>> +
>>> +		if (!want_symbol_end(i)) {
>>> +			/* If there's another symbol at the same address,
>>> +			 * propagate this symbol's size if the next one has
>>> +			 * no size, or if the next one's size is larger. */
>>
>> Why do we want to shrink the next symbol's size?
> 
> First (see related post-commit-message remarks): In principle section symbols
> could come with a size, too. That would break everything as long as we don't
> strip those.
> 
> The main reason though is that imo smallest granularity is what we want here,
> together with predictability. One symbol with a huge size could cover
> multiple other symbols with smaller sizes. We could omit that part of the
> change here, but then the processing in the hypervisor would need to change,
> to fish out the "best suitable" symbol when dealing with multiple ones at the
> same address. Other changes may then also be needed to the tool, to have such
> symbols come in a well-defined order (to keep the then-new code in the
> hypervisor as simple as possible). Look for "aliased symbol" in
> common/symbols.c to see how simplistic respective code is right now.

Furthermore remember that we can't record sizes, but instead we insert fake
symbols. Obviously there can be only one (at least in the present scheme).
If we used too large a size, chances would increase that the end symbol (in
the sorted table) would have to live past some other symbol, thus becoming
that one's "end".

Jan

