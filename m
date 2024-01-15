Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A182D539
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 09:44:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667214.1038252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIa0-0000WF-4Z; Mon, 15 Jan 2024 08:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667214.1038252; Mon, 15 Jan 2024 08:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPIa0-0000UL-1p; Mon, 15 Jan 2024 08:44:24 +0000
Received: by outflank-mailman (input) for mailman id 667214;
 Mon, 15 Jan 2024 08:44:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jLm1=IZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rPIZy-0000UF-Lr
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 08:44:22 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4706e65c-b382-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 09:44:21 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40e7fce1abcso607585e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2024 00:44:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g7-20020a7bc4c7000000b0040d5c58c41dsm14739655wmk.24.2024.01.15.00.44.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 00:44:20 -0800 (PST)
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
X-Inumbo-ID: 4706e65c-b382-11ee-98f1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705308261; x=1705913061; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U01Ehwgs5B6LmAPaY3WKSiwDxNPutwx/aEutUDHSZBM=;
        b=LVg/TGD4FvelmEeKFbySlRPEcvksOBvYr2hggbbKPVi5yfe77LLgFBk+rDMztVyiN3
         +bfwuizVkxtx0KV0ZvRzg03DjEjgx+ldyx9KJTdxQz3jZ3nO2KKVlJn8SnR8yrY1IO4q
         w38HRFYfxItGyLki69agGPKL6IDRVW14Vhf18+9sgU7Yl3wHYAblsgSalOw6ZvWXWAx4
         WWUE4Y8UfYzxmd531E04nMw5aOk5oGA0EWh/4vaYu0qzVF4sycYEha2cyFLhlSM3tVZQ
         fQXWRQS3hORhaR7tj82nX7/oXHijx31JHqh4GLJNJa58V14eJwwHRwcFXD2tDI2GNODS
         iTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705308261; x=1705913061;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U01Ehwgs5B6LmAPaY3WKSiwDxNPutwx/aEutUDHSZBM=;
        b=gKXX7kypjnbuo4pmR4mz1Ptrp9oc+AtdtJ37mjAdyJKDgzCOZ6/xpX1sGZd/KJGSWM
         kGf97tM+lIt0o7Hn5E8/Qbl9O3F7VR7erVbhGuirMP0aKLyIPl/jS3ad0fSf71h4k7kF
         B1xr0S0CHTLq78wedwtnfLSwKV2/d5GN8eI7tkNUQVMHEPLb9S5wkoSbON3363hUQiNK
         so8jnOnfF6TI0J4H1YSOiC9laY4RG82HvPpJvZ/ipSpejEgT83hdgIuwFiYptyXtMQXp
         8Vi98gF0xuE0AgqOsISukLPgdL2eZZCX0FxjrGHWgP2nPBdt+WKcY6XVJm0V/7hpZ5HC
         8Ngw==
X-Gm-Message-State: AOJu0YzgBKyO0B7SJcKzafOGRtYprcF+yc3nUBzFSEG7tB1KgrQFwIzL
	Bcc+L/QNLfrnmA/pzfh4J/N0NzEThUzT
X-Google-Smtp-Source: AGHT+IGikOcJFJnyUcas44nyO2HvFpUl0O0+WNCooWxHfVXCROYMpL9ijRivBV9on04hny6pgZmOKA==
X-Received: by 2002:a7b:cb93:0:b0:40e:7d47:661e with SMTP id m19-20020a7bcb93000000b0040e7d47661emr254374wmi.51.1705308261035;
        Mon, 15 Jan 2024 00:44:21 -0800 (PST)
Message-ID: <859202f5-b946-4cb7-8ef4-3d74afc8128c@suse.com>
Date: Mon, 15 Jan 2024 09:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] IRQ: drop register parameter from handler functions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Kevin Tian <kevin.tian@intel.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <c6926627-aeb6-40dd-a85a-1be0b324bf49@suse.com>
 <1e520de0-8698-499d-8187-c79f589c974d@citrix.com>
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
In-Reply-To: <1e520de0-8698-499d-8187-c79f589c974d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.01.2024 19:10, Andrew Cooper wrote:
> On 11/01/2024 7:35 am, Jan Beulich wrote:
>> It's simply not needed anymore. Note how Linux made this change many
>> years ago already, in 2.6.19 (late 2006, see [1]).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=7d12e780e003f93433d49ce78cfedf4b4c52adc5
> 
> https://git.kernel.org/torvalds/c/7d12e780e003f93433d49ce78cfedf4b4c52adc5
> 
> See https://korg.docs.kernel.org/git-url-shorteners.html for full
> details, but this is a guaranteed-stable URL.

Okay, changed. I'll try to keep this in mind.

> It's worth saying that despite that patch in Linux, they've still not
> yet managed to drop the regs parameter.

How that, when they have

typedef irqreturn_t (*irq_handler_t)(int, void *);

?

> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.

Jan

