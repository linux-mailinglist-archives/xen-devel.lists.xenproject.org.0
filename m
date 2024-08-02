Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57A945B42
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 11:41:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770835.1181429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZomR-0007Ud-24; Fri, 02 Aug 2024 09:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770835.1181429; Fri, 02 Aug 2024 09:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZomQ-0007Sv-V2; Fri, 02 Aug 2024 09:40:58 +0000
Received: by outflank-mailman (input) for mailman id 770835;
 Fri, 02 Aug 2024 09:40:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZomP-0007So-2e
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 09:40:57 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51074e27-50b3-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 11:40:56 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5a1337cfbb5so12762625a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 02 Aug 2024 02:40:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5b839610c77sm885172a12.9.2024.08.02.02.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:40:55 -0700 (PDT)
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
X-Inumbo-ID: 51074e27-50b3-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722591656; x=1723196456; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pKKXex9KFUOu26NCOYv46gE/FsjTIih06YuWjkdAdy0=;
        b=V7rD41K+YVB6d5cF9uhZ4nzm+oQQrynvw6VEyjzd6i4PrPKDzn8OE3sEcJcZ8jVs6+
         rOIp57iFyWuwDfPYxX8IGzzCpz9ofd657P+/eZpR6yPd1M0jFaliaVv+sdvPqTZpO14b
         hij11CCCfzoZlg1TTY8uWG7LlGa41XrNdFUdsyqUP0xGkYTSlzYozTC0foV2LNByHHwY
         Bja+MVwsymm210t1sL9dimhmBOX6st9CFZGv+lFknaOoVXW3FJJLpn3tysltbJHyKMr1
         ImhyxodlcPBVUxtYHvLiiRoFgfGvZ3bVSCrv6zOShHvlyoslz0EqOeR3+2rBFQKfJAnD
         jduw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591656; x=1723196456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKKXex9KFUOu26NCOYv46gE/FsjTIih06YuWjkdAdy0=;
        b=Or1Jl5cfRwSUKtjdmwArEIXyI5vtHks1AIpewSb9g1VMzKG8i2MmzBKMFBS9E9chIB
         k1Q+SoKjfUb+sGoBRfoiwCsqbyI+gbt8Dqvj3HmYcz8zNQodkAamsSeLu5W27yf2mNYr
         e/Z6JavluI0Bk5HrLcGW/G1Vgx0ebBXRWm+iHMO650fs1jLT2Y1ipSbKS/t7Ka8Dpj3w
         GI/LFiRWvXPwL5/3gwHEByNbE87kFk1M/GdCDSjgQlKgaR4Y6M5Bqlg7e0KvBgNzZm9l
         PLbQbsQIt2qVtD2FIlnrYHnleb2Yt6rbjQWJPRjc+VyqOKdpBHAqaQmOZf0BCLs2LCu6
         jlxA==
X-Gm-Message-State: AOJu0YxhP9wSOgI6UrSysqqueir1ISl1fpmwMcjEL0K9GuYPOg21H+cY
	ge5WQrqJLYC/z3YKlqEZjAn7gcT7Ao1KCZl+yHMbmgPMahLw+fh73S6UfK7MkQ==
X-Google-Smtp-Source: AGHT+IFnOZI/8OAJRBwPH2r1vJ7pv8jfSdvMuIzw5oNwVBg7BMFR/MzmBioa4BMqug0/LUbXIqL3eQ==
X-Received: by 2002:aa7:c599:0:b0:5a2:a0d9:c1a2 with SMTP id 4fb4d7f45d1cf-5b7f56fd9cdmr2173272a12.26.1722591655441;
        Fri, 02 Aug 2024 02:40:55 -0700 (PDT)
Message-ID: <d5a6b8e4-d848-4b37-83f2-e492c9e99484@suse.com>
Date: Fri, 2 Aug 2024 11:40:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v12 4/7] x86/domctl: Add hypercall to set the access
 of x86 gsi
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <gwd@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Stewart Hildebrand <Stewart.Hildebrand@amd.com>,
 Huang Rui <ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
References: <20240708114124.407797-1-Jiqian.Chen@amd.com>
 <20240708114124.407797-5-Jiqian.Chen@amd.com> <ZqyT7ocbP6AZEb_S@macbook>
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
In-Reply-To: <ZqyT7ocbP6AZEb_S@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.08.2024 10:08, Roger Pau Monné wrote:
> On Mon, Jul 08, 2024 at 07:41:21PM +0800, Jiqian Chen wrote:
>> Some type of domains don't have PIRQs, like PVH, it doesn't do
>> PHYSDEVOP_map_pirq for each gsi. When passthrough a device
>> to guest base on PVH dom0, callstack
>> pci_add_dm_done->XEN_DOMCTL_irq_permission will fail at function
>> domain_pirq_to_irq, because PVH has no mapping of gsi, pirq and
>> irq on Xen side.
>> What's more, current hypercall XEN_DOMCTL_irq_permission requires
>> passing in pirq to set the access of irq, it is not suitable for
>> dom0 that doesn't have PIRQs.
>>
>> So, add a new hypercall XEN_DOMCTL_gsi_permission to grant/deny
>> the permission of irq(translate from x86 gsi) to dumU when dom0
>> has no PIRQs.
> 
> I've been wondering about this, and if the hypercall is strictly to
> resolve GSIs into IRQs, isn't that the case that Xen identity maps GSI
> into the IRQ space, and hence no translation is required?

It was a long-winded discussion to clarify that in obscure cases
translation is required: Whenever there's a source override in ACPI.

Jan

