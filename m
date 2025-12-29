Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D5CE63FA
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 09:45:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193932.1512429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8s3-0007EI-0P; Mon, 29 Dec 2025 08:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193932.1512429; Mon, 29 Dec 2025 08:44:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1va8s2-0007CE-SR; Mon, 29 Dec 2025 08:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1193932;
 Mon, 29 Dec 2025 08:44:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PeLl=7D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1va8s1-0007C8-JM
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 08:44:53 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3ae2f85-e492-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 09:44:51 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso85012385e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Dec 2025 00:44:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3aac6d9sm241224875e9.4.2025.12.29.00.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 00:44:50 -0800 (PST)
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
X-Inumbo-ID: a3ae2f85-e492-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766997891; x=1767602691; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q2LxhFklo+9vcT4liU9CbBqJDKAbnLUQqaPmkX4LGtA=;
        b=J6dymoNl4cwrZzGrb/pM+zDPMo2kh5e+XHNAiJvqXcwmLh68L22KwwlT+fj0RMu6qc
         5qDX6ls/gsRN1ZEoAThqI+jdyVK41wzmIMtHSnm5RxB95mUTvUWprzciZgbX3rXxGbOz
         fNZq4a2zJ+6UXcoFTFVPyCqua8I62Sa0c3vvMlGkfhcMQtGNTD0e6zTdq2eHg7hH/3hQ
         CE9YUkgCHIGPwzysDLRmSSt80JHc+d1MKhH1lAmki9DrQ7/Q1/2nPig6LIpxa5OF6Qnj
         QYtIcdKdq5JyYyV4vcJw3xfpkZGPZmM8I1oEhMAkE12E9ZCzrqgyOhawy8eL25XNOt+W
         hP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766997891; x=1767602691;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2LxhFklo+9vcT4liU9CbBqJDKAbnLUQqaPmkX4LGtA=;
        b=OPH1PN7gsw5ufKViAPxqiDKYTZGhmlnqJTcsvCysMHEVcOt0tKhdWsWFPvrN6zquO6
         EdshxMe2+BlEWp+cz9NJvKqCim6ztN8MmCZZweFkwUbXNwVa1nkxLziV6DI3jGsifVSc
         JoejjoSLTroi7e10VRShFqTtwh7aYs9veoB6jOhiLOC+IBcT3OnHnIW6BBtNNZjiYjN1
         Bsn+4H/74R4FgrMxwBqXbUH09bCADHRj4oYl7mWHqMXTKHFO9wxgnfJVyuh7yjhI7KvN
         rh1tZJUjHiOlXSgERIGfI/4OJGbPE/BrQsveehDmK41GbQMrccEQXub+dQlG1Syz7MNx
         TJFA==
X-Forwarded-Encrypted: i=1; AJvYcCXOQLtfrrpWlxf9+6OaYsB7g8ZIjsdvXA9IjczYrTmghCn6myXnRAfhwo+FrnLaJDc4UvcyRc0YVTE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy0jmElfBF9aUH56JVnrt7Vl1VcbtHuELblJOZUd2shft6TxdKK
	wojOjb8EKq0pCmbwRMQhmGHujWfbEHTrfGk9KN+czGiXrealuEsxafw8JsvsISD5Ug==
X-Gm-Gg: AY/fxX6qTFKoM3WXaayyI3u2sc2rMlgINGDiQo/vD+XVmQk+YCSZVcwpk5/0+pW3jlq
	j37F18Hq4SCGBwsAXr93FumzPffUGDk6ugg74e67x953Dk4rHT9H29n1rvOymarxx2OisCIjHr8
	i0aa6EgvYxAW6g8+zp+/TrZsTXl+z7j19Srnb+hJCrrl/P5K9kCwjymkXZcgOazRV/zSkF5Rc+u
	/2CiXkQfz+VjtjyGEw4FENZ8Rg2oQYB+F9V1Fc6wGeBEbC6jM4FAW50ojUAKwKK59ZDYVX6ZEze
	TEjCuoP3ICOpaj3Xnpd2jV7yOV3NqIEGehL06ddZytHsoyjWOHuTmtxbuZvqU5XlQ7Y8P7zd9kY
	PfXp10qHNkfybmf8NjW5B4Jcdh+s7cuJT1rci0KV8RtZd4bkuDjGrAaDPv5vbomkakSpgm0CDyA
	8O2H30H7qBuTV9jXO5YbTLyFVTOEOtLIffMyf7OgvQ9LOq+J1wgOTgCCz7yQMGM/rEoibkVMwSu
	U8=
X-Google-Smtp-Source: AGHT+IHCc/3ftJop2txqh4Ayd4GWmGhqEZcmyUNzHxaY80ju8dyu/DdS2je2Xi0Tlpi4yO2GlOBMiQ==
X-Received: by 2002:a05:600c:1d1d:b0:477:abea:9023 with SMTP id 5b1f17b1804b1-47d19577fb8mr336159555e9.9.1766997890646;
        Mon, 29 Dec 2025 00:44:50 -0800 (PST)
Message-ID: <6ba614c0-740f-4c39-b81d-990a1d0add0a@suse.com>
Date: Mon, 29 Dec 2025 09:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mm: move adjustment of claimed pages counters
 on allocation
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20251224194035.60173-1-roger.pau@citrix.com>
 <20251224194035.60173-2-roger.pau@citrix.com>
 <bf6a97ed-2daf-4057-a283-cfe820954c71@citrix.com>
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
In-Reply-To: <bf6a97ed-2daf-4057-a283-cfe820954c71@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.12.2025 23:31, Andrew Cooper wrote:
> On 24/12/2025 7:40 pm, Roger Pau Monne wrote:
>> The current logic splits the update of the amount of available memory in
>> the system (total_avail_pages) and pending claims into two separately
>> locked regions.  This leads to a window between counters adjustments where
>> the result of total_avail_pages - outstanding_claims doesn't reflect the
>> real amount of free memory available, and can return a negative value due
>> to total_avail_pages having been updated ahead of outstanding_claims.
>>
>> Fix by adjusting outstanding_claims and d->outstanding_pages in the same
>> place where total_avail_pages is updated.  Note that accesses to
>> d->outstanding_pages is protected by the global heap_lock, just like
>> total_avail_pages or outstanding_claims.  Add a comment to the field
>> declaration, and also adjust the comment at the top of
>> domain_set_outstanding_pages() to be clearer in that regard.
>>
>> Finally, due to claims being adjusted ahead of pages having been assigned
>> to the domain, add logic to re-gain the claim in case assign_page() fails.
>> Otherwise the page is freed and the claimed amount would be lost.
>>
>> Fixes: 65c9792df600 ("mmu: Introduce XENMEM_claim_pages (subop of memory ops)")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>>  - Regain the claim if allocated page cannot be assigned to the domain.
>>  - Adjust comments regarding d->outstanding_pages being protected by the
>>    heap_lock (instead of the d->page_alloc_lock).
> 
> This is a complicated patch, owing to the churn from adding extra
> parameters.
> 
> I've had a go splitting this patch in half.  First to adjust the
> parameters, and second the bugfix. 
> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/roger-claims
> 
> I think the result is nicer to follow.  Thoughts?

Question (from the unfinished v1 thread) being whether we actually need the
restoration, given Roger's analysis of the affected failure cases.

Jan

