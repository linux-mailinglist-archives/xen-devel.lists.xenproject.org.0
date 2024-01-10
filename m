Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE708295F0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jan 2024 10:11:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665350.1035534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNUbx-0007e6-Ef; Wed, 10 Jan 2024 09:10:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665350.1035534; Wed, 10 Jan 2024 09:10:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNUbx-0007al-B4; Wed, 10 Jan 2024 09:10:57 +0000
Received: by outflank-mailman (input) for mailman id 665350;
 Wed, 10 Jan 2024 09:10:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/O5u=IU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNUbv-0007af-Tj
 for xen-devel@lists.xenproject.org; Wed, 10 Jan 2024 09:10:55 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 287626c3-af98-11ee-98f0-6d05b1d4d9a1;
 Wed, 10 Jan 2024 10:10:54 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2cd7e429429so2033681fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 01:10:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y16-20020a02c010000000b0046b656f4618sm1181290jai.111.2024.01.10.01.10.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 01:10:53 -0800 (PST)
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
X-Inumbo-ID: 287626c3-af98-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704877854; x=1705482654; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JIQQBubYknC3wI0uWH6IRtt9CNL3HhXNugwo3F4kwuw=;
        b=Th0SWsoVWliuErKUTfNRJgxCoIOq0Ng+Oli42aPPv8mezN2d12Mjs9C2j6hpE+eAiw
         euBVbCmJyWRQRAzcMZ/Ghf3yp/I2UODDLF9nQ77KAqstcct7qAj2UgHWGA83QfD+QidP
         R03qmI/iCH6JcAORiuZArZHMvFWi1SwsNlS4SqUy4SOvGWDqXQ2ly1aTinGHN2IR36ca
         YiCVR67Rt2mbolLXoG5/Ssxs7E0X5giRrabyx2LYl8FlwRjg+HDsjMKvcyfd3sylhIX+
         fqUUEGx1aVNvXEtw6Kn8pYFQ1xQHc8e8Whlruf1uaWRSvTOo5rb2zRhDD7UZAAR2DOH+
         SwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704877854; x=1705482654;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIQQBubYknC3wI0uWH6IRtt9CNL3HhXNugwo3F4kwuw=;
        b=BvP2ZRxwenHLGhAugn6Y6FJkPycdgjfIKuyltKRcwqKASSL5MfGzSi828eJwC0/D3S
         5WoTrVzGHz1h5NBe6SCfwM5K11K2JvskbkJCUby2TK8uN8rmXaucgUb2FCRRgEpRpXcP
         ojymmBJiCNywalU8OyZc93lcJi6VBvowb2OB/wUs4PBLSXluNp/w8+z37lTTC0XYyC8a
         lTpbSyUtX1rNckkV/6A7TQI1ZpS7NiroAjpukBF8IkCEhI/JrCkLbbKZftoG10hbCj1W
         yhvWZ5AWyduA0UxyOu5VDkCv9ii/EqYqhE7i/pKDl46Ainwc6SkNv+Ib6sxWnV0Oi+xL
         9slA==
X-Gm-Message-State: AOJu0Yz0Qr4OEpe0LvsGAeJftVdZ7sgf2GlCzaS7/PlXlQsMnhKMOnM8
	FHH54SshDGBE7cx7Y7cjeUjHhU9YvsY1
X-Google-Smtp-Source: AGHT+IFRuv8tjbbC2tMZ5XIUhZXPjTQQbVhwAzKO8freRZx1GNyFue+lR3gnermPYoZkNkZ8sSYQrw==
X-Received: by 2002:a2e:930d:0:b0:2cc:e48d:d0f3 with SMTP id e13-20020a2e930d000000b002cce48dd0f3mr401916ljh.79.1704877853985;
        Wed, 10 Jan 2024 01:10:53 -0800 (PST)
Message-ID: <0f7c4c1a-5c20-4e89-bef9-2ebd02c0b141@suse.com>
Date: Wed, 10 Jan 2024 10:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen: add cache coloring allocator for domains
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-10-carlo.nonato@minervasys.tech>
 <7fbe9526-60cf-4844-8b48-58ab69ec1b29@suse.com>
 <alpine.DEB.2.22.394.2401091637160.3675@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2401091637160.3675@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2024 01:46, Stefano Stabellini wrote:
> On Tue, 9 Jan 2024, Jan Beulich wrote:
>> On 02.01.2024 10:51, Carlo Nonato wrote:
>>> This commit adds a new memory page allocator that implements the cache
>>> coloring mechanism. The allocation algorithm enforces equal frequency
>>> distribution of cache partitions, following the coloring configuration of a
>>> domain. This allows an even utilization of cache sets for every domain.
>>>
>>> Pages are stored in a color-indexed array of lists. Those lists are filled
>>> by a simple init function which computes the color of each page.
>>> When a domain requests a page, the allocator extract the page from the list
>>> with the maximum number of free pages between those that the domain can
>>> access, given its coloring configuration.
>>>
>>> The allocator can only handle requests of order-0 pages. This allows for
>>> easier implementation and since cache coloring targets only embedded systems,
>>> it's assumed not to be a major problem.
>>
>> I'm curious about the specific properties of embedded systems that makes
>> the performance implications of deeper page walks less of an issue for
>> them.
> 
> I think Carlo meant to say that embedded systems tend to have a smaller
> amount of RAM (our boards today have 4-8GB of total memory). So higher
> level allocations (2MB/1GB) might not be possible.
> 
> Also, domains that care about interrupt latency tend to be RTOSes (e.g.
> Zephyr, FreeRTOS) and RTOSes are happy to run with less than 1MB of
> total memory available. This is so true that I vaguely remember hitting
> a bug in xl/libxl when I tried to create a domain with 128KB of memory. 
> 
> 
>> Nothing is said about address-constrained allocations. Are such entirely
>> of no interest to domains on Arm, not even to Dom0 (e.g. for filling
>> Linux'es swiotlb)?
> 
> Cache coloring is useful if you can use an IOMMU with all the
> dma-capable devices. If that is not the case, then not even Dom0 would
> be able to boot with cache coloring enabled (because it wouldn't be 1:1
> mapped).
> 
> On ARM we only support booting Dom0 1:1 mapped, or not-1:1-mapped but
> relying on the IOMMU.

So another constraint to be enforced both at the Kconfig level and at
runtime? That said, Linux'es swiotlb allocation can't know whether an
IOMMU is in use by Xen. If something like that was done in a Dom0, the
respective allocations still wouldn't really work correctly (and the
kernel may or may not choke on this).

Jan

