Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF44B01342
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 08:00:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040452.1411880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6nQ-0004WC-1k; Fri, 11 Jul 2025 05:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040452.1411880; Fri, 11 Jul 2025 05:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua6nP-0004Ub-VN; Fri, 11 Jul 2025 05:59:43 +0000
Received: by outflank-mailman (input) for mailman id 1040452;
 Fri, 11 Jul 2025 05:59:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Yw5d=ZY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ua6nO-0004UV-9g
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 05:59:42 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3aab1cf2-5e1c-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 07:59:38 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so937211f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 22:59:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c3e974199sm4269512a91.18.2025.07.10.22.59.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 22:59:37 -0700 (PDT)
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
X-Inumbo-ID: 3aab1cf2-5e1c-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752213578; x=1752818378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2bo+Qe1IwHKMl6mOrmv8VvdIJAcr8TOYi3gxW+p4sus=;
        b=BCujHKJ6F5P1SKXgo/hY1krpa8DAYOptLBsdPfnF7bQMDjBNaiR8YHHqdQ9RY/rsnO
         zBShlBLkU+FrVDfOB/dtnqrmwpeVtOLwHHHz/3tHM67Mu2dztX2gbuQ57a/hl7Jre9cC
         Ws7VT++OjirAcgx2W3mynZrYapbtpy3tBfveYTbL12z14pJoyXHVPODPpNPsFSPrVMIV
         lNdjIwXKUZjlJXVPWpbcn7kpJTuROyRZoCZNlRX0RV8u0WEbFN4MYwxOVOHHUpd1eFZQ
         2t9SlY3Qlu4TcyKH9GBlEBXnWTSBfEo8TRjcHiGsWfcw9VkOHs/Ad6KgKenVE0y7lKak
         PGAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752213578; x=1752818378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bo+Qe1IwHKMl6mOrmv8VvdIJAcr8TOYi3gxW+p4sus=;
        b=bPGmzltvmzTVoWAbyW2BA9Sj1Ldn9YvnMxHuLxhaMM+FApFq+FUgvKHoD74BecWGD1
         Gxee0dVuazh+JthOtgl+3KWlWQEItYb/nI9DhDQo6jz/nr6wb1btg6scKYPoquU/jcl8
         3HqTRgaqZsFvDkeb3ih37A2MGrNA0QljX2UHoHBIKra+24Sh9MVoI7uHXspd1a2+l2A6
         McuKbIWDlzjbqRRxYIVIuOyhvpJMG6k5pr709HI2uLMyQ2l4jrIL3uw3MLfG728bLYhL
         tYW8DJuLVY3UC2zvLy16pzaBH+Yvaidze/RhdYOUNB6h9iysn2pq/25iiHJ56zszCEaU
         zlLg==
X-Forwarded-Encrypted: i=1; AJvYcCW/Cl3dtUkftpn5RFJ5+TJmUpbq6qUuRCApaTzsHBdtYYO2o4SXJD1oHYiZlS+RcQt8UQ64HKcNZfY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIvSfGd2rikW/PfqsWoIozJVAHTLLMH18JaUbTYPoGBeZiZ9+q
	Wlhh/WFL1AczXfGijsYfQeW/OIpHXB+hplzQUOYXqzOvkZ5p5EXqyMS+jSq3gICjFw==
X-Gm-Gg: ASbGncugBqU4hJa4HlNu82VNnbELzh39+ELIjqDIrZKm6fjVuL4N4qtLNDL97VSnUeX
	1fspprhAq4JckZPv6L88Myz/VDK91Ceolgj/fF+kPKMw0HBeN2RB70HgDQh1vwD9p1LNW3/wa8g
	xXbQkp3jUajxgl0foanh1eI2GK6uN5L0VyR5rmfbMXyv9k7s9PXL0goJMT3X/UPOitrxVx2shDB
	df0MvmYZeyaRnf7R1pHwRIiR/hoC2jGKEvP4Vmb5g15fx4QQdUJUfs6VE3Al/vcc+r2BkXWeMPJ
	uxQxCMdXSb0WSSb/3u6Reyj81O7H9n7W2XOunypSnnBL4byCpBe6uvykbkGWKgsXM1lgd2w6f5a
	msSA5bYa7b7N8MiaZUkwIX+/yG+OXELYqsEB6ABJv3gMDZRGG6eECdOr1zB7OmP7Xz4VPT2kKR5
	iMuzMgM3g=
X-Google-Smtp-Source: AGHT+IEayASJI2O7nPC51j2YvglS8QdNCWu+gk/G0WJb+d2doCuDjaKzuu3sOgbWDlNuCxUV02tpvg==
X-Received: by 2002:a05:6000:24c7:b0:3a4:ddde:13e4 with SMTP id ffacd0b85a97d-3b5f18fff3emr1639050f8f.58.1752213577936;
        Thu, 10 Jul 2025 22:59:37 -0700 (PDT)
Message-ID: <f0d82045-4492-4d13-b0b1-97f95ad81727@suse.com>
Date: Fri, 11 Jul 2025 07:59:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] xen/console: introduce domain_console struct
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250710013421.2321353-1-dmukhin@ford.com>
 <6e3600ad-f53c-4e9a-9713-4301b5bd0a6a@suse.com> <aHBj4IZdD50LWSgF@kraken>
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
In-Reply-To: <aHBj4IZdD50LWSgF@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.07.2025 03:07, dmkhn@proton.me wrote:
> On Thu, Jul 10, 2025 at 01:16:24PM +0200, Jan Beulich wrote:
>> On 10.07.2025 03:35, dmkhn@proton.me wrote:
>>> @@ -877,6 +873,16 @@ struct domain *domain_create(domid_t domid,
>>>
>>>      /* All error paths can depend on the above setup. */
>>>
>>> +    BUILD_BUG_ON(DOMAIN_CONSOLE_BUF_SIZE <= 0);
>>
>> While the "equals 0" case can in principle happen, the "less than" part
>> is dead code (and hence this needs checking differently): The type of
>> DOMAIN_CONSOLE_BUF_SIZE is an unsigned one, so wrapping through 0 will
>> yield huge positive values.
>>
>>> +    err = -ENOMEM;
>>> +    d->console = xzalloc_bytes(DOMAIN_CONSOLE_SIZE);
>>
>> As previously indicated, new code ought to use the xv*alloc family of
>> functions, which deliberately doesn't include any ..._bytes() forms.
>> Note how instead there is xvzalloc_flex_struct() for situations like
>> the one here.
> 
> Looks like xvzalloc_flex_struct() is not used anywhere in the code base...

And what do you mean to tell me by that? xvmalloc_flex_struct() is used,
and x[mz]alloc_flex_struct() uses are still in need of conversion (which
is going to be a slow-going process).

Jan

