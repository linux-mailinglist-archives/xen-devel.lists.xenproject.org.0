Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 146AE93BC8C
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 08:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764669.1175162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWrzy-0008KR-S7; Thu, 25 Jul 2024 06:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764669.1175162; Thu, 25 Jul 2024 06:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWrzy-0008HR-PR; Thu, 25 Jul 2024 06:30:46 +0000
Received: by outflank-mailman (input) for mailman id 764669;
 Thu, 25 Jul 2024 06:30:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWrzx-0008HJ-PY
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 06:30:45 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1c410c-4a4f-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 08:30:44 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so584126e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 23:30:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3a95sm454424a12.61.2024.07.24.23.30.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 23:30:44 -0700 (PDT)
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
X-Inumbo-ID: 6c1c410c-4a4f-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721889044; x=1722493844; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JWV0Z/FRCc78nFOv71bdzI9o5hMZkoIum/9R1LZsDKU=;
        b=QnIJthufySiS46Xds5J/sRw1M0OPHyzteRnB5YqD5OHcMJE7LStpSEpenuQAO2ywI+
         XBL9UdUskrtkWFKlyHNg4ZoSHg8/SekUNRa5Jf8P1z547q/VEC0zajLbWJq6iBjAX7Mx
         9RuMl7eZu+7jBMaF0qV3i2+nhxQEbrHfcOJoJiLirHueY9brYqNIL0n1l2/yOVh1aaCp
         oHmU+UvcNQpBHGWMvJrNiqAgaUJFukKg+c4gL6hPegAQmk73YA89nS56KQ+5B061jjBx
         N3gRUtJLi9w6WhX+k9Wqg1wUAp6igI4/H454IQx3O6X137PoCf5FDe+aFP6JeS3ybdeX
         Rnjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721889044; x=1722493844;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWV0Z/FRCc78nFOv71bdzI9o5hMZkoIum/9R1LZsDKU=;
        b=WGWAQebTz+0GBuA+sxgbRFt3zF98WFMpFbyaXsVHtrW+6G/ZgN0JQc9u4w0Jfi4Nz1
         Iwlevt6DfnhkD2GUHx1gQDscJt2ul2RA7oE6tro/tEGOoIsmLzf9X65xoMt1etUsYbQa
         7LYcC/uJRxV8gXZXirl9CclBH+eq1/NxNYYCGov2hB/6WcylmH25k2vpqNL+x3cvTjWD
         P5V8W5ktatYX7imKB2AuJZSqZvwB8VAGkfS+yyvvWq8BL3Pej93WC4UGqcnAGAmafmI6
         HrO0YzH/NHFajDSf0hKLvbu/2KCIMhAZ5PKEo231Fvnl++24H+uk9Z1lIi5v1Eofdk9+
         HIOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrdYkkaPAG0Psc1uxeIbWRufo2KqMg+f/JdFYiqsiMq2B6+b5Sv6N8El3YwoNo4Q9/b9ycmToqqBbUu5seMbIwds5GT6Bupe7oAuMLXvs=
X-Gm-Message-State: AOJu0Yy1PD1aXz1uIOROnN2/ij9oQ6vvJhVbexEBT7XaXpf7IFB6Gijs
	ssJUYxl+AbHwPuNpdlCRN8l2/A4SsFtGSAEkfEo2m9eXzD3YMHnlxPZnFy5M4A==
X-Google-Smtp-Source: AGHT+IHJ/6SeBg4MMs7CQbkqDZk3rXHvIDcCj8dWe1upanLHiO72zoL2fGz73+dMbFMdZ4BXFtso9w==
X-Received: by 2002:a05:6512:a96:b0:52e:9619:e26a with SMTP id 2adb3069b0e04-52fd3f1c319mr1411309e87.26.1721889044307;
        Wed, 24 Jul 2024 23:30:44 -0700 (PDT)
Message-ID: <5a56ae90-f211-4650-b026-09650e93adf6@suse.com>
Date: Thu, 25 Jul 2024 08:30:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] automation: add linker symbol name script
To: "Lira, Victor M" <VictorM.Lira@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, roberto.bagnara@bugseng.com,
 consulting@bugseng.com, simone.ballarin@bugseng.com,
 xen-devel@lists.xenproject.org
References: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
 <4468a02f-4d8c-4b94-8af6-cd1751cd0a89@suse.com>
 <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
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
In-Reply-To: <8fa38784-ba85-4675-9fad-39dd97652bb6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.07.2024 19:48, Lira, Victor M wrote:
> On 7/24/2024 12:44 AM, Jan Beulich wrote:
>> Nit: In names of new files we prefer - over _.
>> +script_name=`basename "$0"`
> I have fixed the above comments in v2.
> 
>>> +#!/bin/bash
>> Can we rely on bash to be there and at that location? As you using any
>> bash-isms in the script which cannot be avoided?
> 
> Are the automation scripts required to be portable? Can you please point 
> me to a resource where I can learn how to make the script portable?

In addition to what Jason pointed you at, the more abstract answer is to
look at the shell specification. E.g.

https://pubs.opengroup.org/onlinepubs/007904975/utilities/contents.html
(issue 6, i.e. a little dated by now)

https://pubs.opengroup.org/onlinepubs/9699919799/
(issue 7, also already about 6 years old)

https://pubs.opengroup.org/onlinepubs/9799919799/
(issue 8, very resent)

The older variants may be relevant when backward compatibility matters.

Jan

