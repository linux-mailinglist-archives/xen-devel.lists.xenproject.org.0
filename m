Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D593A824297
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:17:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661792.1031504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNaq-0004Cc-Ty; Thu, 04 Jan 2024 13:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661792.1031504; Thu, 04 Jan 2024 13:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNaq-0004Am-RA; Thu, 04 Jan 2024 13:17:04 +0000
Received: by outflank-mailman (input) for mailman id 661792;
 Thu, 04 Jan 2024 13:17:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0by4=IO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rLNaq-0004Ac-5b
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:17:04 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c4e8ea3-ab03-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 14:17:02 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cc7d2c1ff0so5726301fa.3
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 05:17:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b16-20020a92dcd0000000b0035fc82879a4sm9191412ilr.45.2024.01.04.05.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 05:17:01 -0800 (PST)
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
X-Inumbo-ID: 8c4e8ea3-ab03-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704374222; x=1704979022; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kOI3oQwAgohong0NCjBRbivF8Iuh+3qejyQXg5mYyck=;
        b=DXu/jTfWwGkT9fgw/sUOIF5cuX4fBHdEkWdsjKNhD9gYbytRyckFXlJv/tZ2Zpjzrj
         8z1T22BIhiG60X4PYPCPw4WMX5ow1HsobX+Z80mO/GUeWalNunIaHmqTe+v1Kat/pqyo
         zQhGA1m3Lli6W5IjwwhodptTTrdjawooy49mkwa+mptwGxpGMfof8lMBIlA2EGwsJasu
         c9WO2fxo0LWpGDCAOpmAv+HCyeRDfgmjLvcQcJlnAgGpq7UvtYZdRUkaeyl9sidzgNVH
         pQAj7REsWxiLh/s9yD0oabBzpsNa9Lv1V4Dg4dHfk5jEpSMJ/VwsGA2TMMAxPXN+Vdpm
         5b0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704374222; x=1704979022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kOI3oQwAgohong0NCjBRbivF8Iuh+3qejyQXg5mYyck=;
        b=MXDYBagDKDL3VhE1UNa49yRXIHNugYlHqJmP1s+I+anqOxB0FMJ5BRbjIKG99Hoqgr
         ohxnRYfVGRprmFiabyFmuGuCk4Ux0vVTwcAaFKo6cqxhZHfImOyzs0NbeIxrmL3xJr0M
         iLBPNyDBtp9JNQnS2wT47KpkENLs+4zwRlR3F8N4QTB3lfoPOK/YF6hm9lGe3Oh9Z9Zs
         zgPYyBM2fw/xA3SHDSelkND/J4eNBRbmEOGQ4N7klLCEBoQDwCbCOEgYXs4PrlLQZPvW
         jCF7vH60NiXBKBZCBCwPSjGVWM+CE1yGXjM5bLAQ69z1uj0V1r9qVILL3rNlxYOVSqPq
         +JUg==
X-Gm-Message-State: AOJu0Yyw1cK83YlnCmIezz0eR6SQ7l9/FuklBzPjWvZKEHxuvhHYqQxb
	RgAVhIvbd51Y/Yq9jUwvtPaL2Q9rsnpwX5oZgJPUY1UjVw==
X-Google-Smtp-Source: AGHT+IGdoM0B2091y9+sPMzB4uhxpFHnJZePS7ZFCek9c4bwgL2HKNRI0+YeEfuN90j8hZKcwApPEA==
X-Received: by 2002:a05:6512:11c9:b0:50e:682a:3303 with SMTP id h9-20020a05651211c900b0050e682a3303mr340022lfr.54.1704374221814;
        Thu, 04 Jan 2024 05:17:01 -0800 (PST)
Message-ID: <6db70696-4b40-46d2-b19c-881820338ba4@suse.com>
Date: Thu, 4 Jan 2024 14:16:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hvmloader - allow_memory_relocate overlaps
Content-Language: en-US
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
 <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
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
In-Reply-To: <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:49, Neowutran wrote:
> Full logs without my patch to set allow-memory-relocate (https://github.com/neowutran/qubes-vmm-xen/blob/allowmemoryrelocate/ALLOWMEMORYRELOCATE.patch)
> https://pastebin.com/g 
> QGg55WZ
> (GPU passthrough doesn't work, hvmloader overlaps with guest memory)

So there are oddities, but I can't spot any overlaps. What's odd is that
the two blocks already above 4Gb are accounted for (and later relocated)
when calculating total MMIO size. BARs of size 2Gb and more shouldn't be
accounted for at all when deciding whether low RAM needs relocating, as
those can't live below 4Gb anyway. I vaguely recall pointing this out
years ago, but it was thought we'd get away for a fair while. What's
further odd is where the two blocks are moved to: F800000 moves (down)
to C00000, while the smaller FC00000 moves further up to FC80000.

I'll try to get to addressing at least the first oddity; if I can figure
out why the second one occurs, I may try to address that as well.

Jan


