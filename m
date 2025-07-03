Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13DAF69FF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 08:02:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031734.1405500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD1A-0002po-Cc; Thu, 03 Jul 2025 06:01:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031734.1405500; Thu, 03 Jul 2025 06:01:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD1A-0002mj-9A; Thu, 03 Jul 2025 06:01:56 +0000
Received: by outflank-mailman (input) for mailman id 1031734;
 Thu, 03 Jul 2025 06:01:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXD18-0002U4-AB
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 06:01:54 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 375c6b2a-57d3-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 08:01:52 +0200 (CEST)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3a6cdc27438so4461112f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 23:01:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc4c8easm1445571a91.7.2025.07.02.23.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 23:01:51 -0700 (PDT)
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
X-Inumbo-ID: 375c6b2a-57d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751522512; x=1752127312; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N4lOCw8IYJyiVobipOUopfsFfsxWGNXlxTiRqrfxXyw=;
        b=QboxJX2TPt8lGd3b9fEv6F+d6vbukdyvmUlUB5PXxQjf8l8hFXzBRAeN+yGawqazOC
         6fq5QCIDvymKgYZwLTcCJ7amWaC1pO+6rbgl0RLAgq0NKcCCepRrYB1NN0TkDvDpGqfF
         rzuuTA1pJDb/jgmtsq5jime4j7lImwdBxubFtxd62/YNeekAffMPnuIAV6It3HtoFxHS
         bexNohnF4RJnpHAc/u+9ORYJDIGN2NU/5OR9RmZTuVQvTEfamQj3UTGTFaxBAHv/o6Hc
         zegfMlPiAboQwkfBqGKaEDKUaXqHapT+tPrUi5IDwIQRAjrSFCTXG8j3/LjEMp5d35ww
         iKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522512; x=1752127312;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4lOCw8IYJyiVobipOUopfsFfsxWGNXlxTiRqrfxXyw=;
        b=JhnOh1y8pgkSoNUPP1FRJmV1PYh5Tl7bCLmY85zkapwmA5PbxU3tXQ8H0RKKzvMf08
         cSacTwPuD9hc8/8ofe/2pnLw2gqWassvlXs2M8IWeWl5GK/vt74w3pqM7sNS3iFg8l8q
         1JjUSTrFj56weayWYF5Ki1ZlNmK8b/FGCPEe5IM6Tkk2x05/z5yJXpFNOml4ugGpuX6R
         pAHZ8m/XmPL/SULrlJf55N+gkCabvuxPl0379FNLMpC8xh1fsfIKxMu4kgFJFDJxxryg
         i3HWbe/UXX5UZKCHkPFnJ7wO+cf43xEHCwICz1DEJmLbRC8WugkQNsQyrhRYMzP/Z0Ey
         PRqg==
X-Forwarded-Encrypted: i=1; AJvYcCUwUhS5v2aYn3sB55RLhwOG/qLaoclEUCP6z+W+f91OMfIDM95v4MJU1MnGNL8HMVq5lVrM6B9nUtQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTgYvAXvHaKnJ1coUh8FqiYxmGkiqUiGI7qe+67X0v5y8US06z
	NNSmMJCEXnYfLVUzKlY7G71ECy2YNEl4c8eiki068QEbu9X7A3dbapvzT7fbckMCHw==
X-Gm-Gg: ASbGncsSauSODUT5GBogsLt8zbAJTwODwe1ob7YrEYkXpiWYE8ngvUeCzlB3N4sUEmw
	gWeprCVDjdrEQsRHUyz69zCLFNXmI+WCAKy9pWTFWCxrtg2TKpOGbY/gvWn5D5h5rzMU2b9Txo+
	dOCXELiEtrLzgw7dHdLcW5cb+eGGWbWPzSk/NITQP3d63YxDXHyVZaXvdW+tyGkDvmHpr5EXB3x
	g/rM3naSRYcjQLo9kfmu53nxVcDSYtMY/iJHVQaQWP3ZVhtjQA3MFRpDDAnUWKXS6K8m+qSgN8Y
	OFoaqnwTtPFm1lfr90bmI7TsTLYA4HsIIaBY0YVtI6L5WfjMKkZftIGiMO6yf+1hBZRTPtEXMW4
	jH+aoBFem+y6pcpKpzjtd1LtRJ+j426pjcer/vmtjKyXdDVQ=
X-Google-Smtp-Source: AGHT+IGf1B9nQ/qO82ZNTxHIiUqVBYkRymI6wc9HedPuusT9C9mYyKz/k5o2X86awTPSBGHVhE0obA==
X-Received: by 2002:a05:6000:250f:b0:3a5:2e84:cc7b with SMTP id ffacd0b85a97d-3b1fe1e7339mr4492219f8f.11.1751522512086;
        Wed, 02 Jul 2025 23:01:52 -0700 (PDT)
Message-ID: <d9601a06-4118-4c1a-9784-51fe514d0697@suse.com>
Date: Thu, 3 Jul 2025 08:01:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] xen: Refactor kernel_info to have a header like
 boot_domain
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Alejandro Vallejo <agarciav@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-3-agarciav@amd.com>
 <3128c4ae-7146-4480-b7b3-e17f253e3870@suse.com>
 <DB1P3E6TW6WS.CPYEJLOZTFO6@amd.com>
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
In-Reply-To: <DB1P3E6TW6WS.CPYEJLOZTFO6@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 18:04, Alejandro Vallejo wrote:
> On Wed Jul 2, 2025 at 2:56 PM CEST, Jan Beulich wrote:
>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>> --- a/xen/include/xen/fdt-kernel.h
>>> +++ b/xen/include/xen/fdt-kernel.h
>>> @@ -16,7 +16,7 @@
>>>  #endif
>>>  
>>>  struct kernel_info {
>>> -    struct domain *d;
>>> +    struct boot_domain hdr;
>>>  
>>>      void *fdt; /* flat device tree */
>>>      paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
>>> @@ -34,8 +34,7 @@ struct kernel_info {
>>>      paddr_t gnttab_size;
>>>  
>>>      /* boot blob load addresses */
>>> -    const struct boot_module *kernel, *initrd, *dtb;
>>
>> Where did this "const" go?
> 
> x86 mutates the boot module to set the released flag, the headroom, etc.

Might be nice to mention such an aspect in the description.

Jan

