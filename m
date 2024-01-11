Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E7A82B32D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:43:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666443.1037087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNy9E-0008OM-HZ; Thu, 11 Jan 2024 16:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666443.1037087; Thu, 11 Jan 2024 16:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNy9E-0008Lj-DH; Thu, 11 Jan 2024 16:43:16 +0000
Received: by outflank-mailman (input) for mailman id 666443;
 Thu, 11 Jan 2024 16:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNy9D-0008Ld-4k
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:43:15 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 832e0c8a-b0a0-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 17:43:13 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e60e137aaso7162925e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:43:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o21-20020a05600c4fd500b0040e34ca648bsm2590497wmq.0.2024.01.11.08.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 08:43:13 -0800 (PST)
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
X-Inumbo-ID: 832e0c8a-b0a0-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704991393; x=1705596193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i+csp2JrHuHYTLYkP9Hl1DJt1ft9a0uqwDoUn7rONBc=;
        b=HiLJofMrgU+d2dHH9591GxU80JLPbumX9He5LKqwcIqtpWPi8aY/3yHv9LVUg03ZNK
         /PIOUaQj6AjRjvrFXdIGhZY6EYlJxBVmCRjUhKHD9hrwqWz1w5axx/TyWYYoPW+eON1z
         G6K84TD3qtxzWaHGOshH7vt5ndsMVkMzn05xiAImEolCmyhxWppY+Co1z7TWcujrC66f
         +4L32uiH1ikHybA0ZZqCB4fXnV6YdM1j0LpHXeEIJs4f8CYiSr+uLpYSf+mssu6cRVhl
         KN0dD2YZxTGoTT+47Vi992zTOFQ8uFjSnvntRxPQdcr83W9HcLVuUqGvtrjy3cH3OGQU
         2tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704991393; x=1705596193;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i+csp2JrHuHYTLYkP9Hl1DJt1ft9a0uqwDoUn7rONBc=;
        b=kRjNQCYtnHcsTJlnBQiTiegcQDWA5/I+zZPnqxz8r21gQ5NL7sAozn4twypy3CLRh8
         AfLn43HhmkVkLDQjpQ/4RbEWkoNhEPbRUXcjlOBL+6vFfCu97b7vLM2W+sgshGji6MTI
         VlO8GFwfJL5Nx+CVy1U1sOm3GEuvL3q88evc4zfWuDysdxpYQ1vgxYeIdJPDoolOJs6O
         j943ldAgurt5FvOj1f8ptAuSBgtaIN4vtD//T9uTfUBfpKqL99bRNkzHCLbDYGJBqpjq
         8ibhLaPnlDfgi0D8NEWONQ66n6acy8uVC6y0hhKFfoIiED/bvfU/Ze5Y/WJKu8NcY+WA
         ucuA==
X-Gm-Message-State: AOJu0Yzx5V3Snh0AabuCDH9sZZo34UGyS/VBmr0/Epb0L45XLNla1NZ7
	+vCDE2Gan5gSeGZ0Q5CqBfa5UYpmWVpe
X-Google-Smtp-Source: AGHT+IF8QAp6IuJvDyJUZB1uNuAvlJ1U0/6eoQUqkc1YJuI5TUX7hSIENJ50imgxdMzMwtfDH9B47Q==
X-Received: by 2002:a05:600c:1d0e:b0:40e:4f24:64d6 with SMTP id l14-20020a05600c1d0e00b0040e4f2464d6mr61676wms.41.1704991393393;
        Thu, 11 Jan 2024 08:43:13 -0800 (PST)
Message-ID: <7609d810-a2f0-4843-b019-0f9e700aa1e3@suse.com>
Date: Thu, 11 Jan 2024 17:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 31/34] xen/riscv: add minimal stuff to mm.h to build
 full Xen
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <4411f6af38586074b347cd6005f19f9c670faa74.1703255175.git.oleksii.kurochko@gmail.com>
 <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
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
In-Reply-To: <3231bf55d5da1d3e1eb03a43759932d8ebcca8de.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 17:32, Oleksii wrote:
>> +#define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
> I missed saving these changes. It should be _pfn -> pfn_. (Just a
> reminder for me).

And what purpose would the trailing underscore serve here?

Jan

