Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DB08C576F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 15:54:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721545.1125035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sc2-0002CT-9y; Tue, 14 May 2024 13:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721545.1125035; Tue, 14 May 2024 13:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6sc2-0002AB-7K; Tue, 14 May 2024 13:54:38 +0000
Received: by outflank-mailman (input) for mailman id 721545;
 Tue, 14 May 2024 13:54:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6sc1-0002A3-B3
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 13:54:37 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fe7adea-11f9-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 15:54:36 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a59ad344f7dso13772866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 06:54:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a8b634cdcsm37029066b.93.2024.05.14.06.54.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 06:54:35 -0700 (PDT)
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
X-Inumbo-ID: 7fe7adea-11f9-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715694876; x=1716299676; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IEl4cS4JlSGyp+2J/90G08D4D8e8CcqOq2eZS6Go0QA=;
        b=KVWfXvmk1CpKEDgbDmMOgtgIpFpqg15TPHyliG07iXVT3iVKXXuzBasrNcfnPAMNUt
         thS4h8KtMbxPfTXedNi57913qx/MH2XZTbIdhdP+mU3ismNKV8c75AfBF8DXnGQqOufv
         DgDbazCwvo2SEOISaXKNwBOiBbEDWiJG6Gy6XpAapZoSkRJzLLQmDr51JZtEVDbHD4Vv
         kRNycGRVuFsZA4qU5ZI05qewG+CYU3k4FyoD2nNwN/gDt2JfRXZtQQZx2bPpscXFH5AJ
         uDC1kW95ry6u+GYYAmkGSEw9TsQLIcuuLTMgs2vpFN0Nn5ouyW3edMbyHbB5upwKzCDc
         QwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715694876; x=1716299676;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IEl4cS4JlSGyp+2J/90G08D4D8e8CcqOq2eZS6Go0QA=;
        b=lxqtPkxzkb61lI+BhKdDf6zxyDhxCoddch6fSlcFg4hbYIe1HpuR1Ax+Abh9eMXAev
         ifkCBjDRrzIL+cYqMuVJvaabUdZipz+JjnUhUGGS3WvJJuj9LYRLIJr9h9XI1+8MfbG1
         S5Q0Bi2/R0E24QzgBfoA5CVVcay5ldUez0tpsGbDqmI5JopXoqhPjevP4pdqqDkmC0TB
         u6QsYP4QpOsrE7elgGMqlIfClEV5GfIcqNdL2t8JUgir9yNGt6ea1KgodLW9OFcKMHjF
         w6BdibA0E3r306UoNnxwlq5twYhg0zy6E8JeDgX59gVWPTHpjnXjNF7ouZQZTDcfl7Aa
         VzDw==
X-Forwarded-Encrypted: i=1; AJvYcCVlywG/sEecWQpNkDS81gNCh/vBVG5gK1G2hOM0OpiQRkEJo38TH+WssP7GTTpedBaeSReuCezFJTvHca+Ts4zFnu6oQxVD7ZUUtCG/aiI=
X-Gm-Message-State: AOJu0YwAJqmHT6gclo5YIiBBscxdrA+Z4tDQka5XPluIz0kDaV/LIihX
	2XN+wQIhFwKdagzlN6nwylJ+NWCj4nRDsW5/H9Xba0x7S7PhZ+86qMHFrghLrQ==
X-Google-Smtp-Source: AGHT+IEZCKfW5rdR+MQ2JYOOxzYmlIXgLz6dbQTdwxTVVu02Aksvov9kxsJKcFv5V0rWCdeiCmq/XQ==
X-Received: by 2002:a17:906:7f81:b0:a5a:86e8:4218 with SMTP id a640c23a62f3a-a5a86e84346mr94710766b.61.1715694875588;
        Tue, 14 May 2024 06:54:35 -0700 (PDT)
Message-ID: <8f183016-4117-45f8-ad75-6fb8363a0b60@suse.com>
Date: Tue, 14 May 2024 15:54:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: replace R13.1 with R13.2
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405101625470.2544314@ubuntu-linux-20-04-desktop>
 <369a3c75-2e71-4fb8-8373-aae737099e3b@suse.com>
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
In-Reply-To: <369a3c75-2e71-4fb8-8373-aae737099e3b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.05.2024 15:47, Jan Beulich wrote:
> On 11.05.2024 01:32, Stefano Stabellini wrote:
>> After looking closely at the R13.1 violations and potential fixes or
>> deviations, upon further reflection and discussions, we realized that it
>> is R13.2, limited to initializers list, that we want to comply with.
>>
>> Link: https://marc.info/?l=xen-devel&m=170751643325805
> 
> The mail you point at is a reply to one where I raised an aspect that was
> never really addressed: 'I'm afraid I don't understand the "eventually
> limiting" part.' Therefore I also don't follow why we'd want to limit
> applicability of this rule to just initializer lists. I'm pretty sure we
> do not want expressions the result of which or any side effects of which
> are unpredictable, no matter where such an expression is used.

Oh, and a formal aspect: I don't think an initializer list counts as
expression. Instead it's a construct involving multiple expressions,
evaluation order of which is unspecified. Specifically

unsigned arr[2] = { i++, i++ };

would violate 13.1 but satisfy 13.2, because 13.2 is concerned of
only each individual expression (and this isn't a comma expression
but a list, somewhat similar to argument lists in function calls).

Surely the compiler would already choke on this, but I wanted to use
a simple example.

Jan

