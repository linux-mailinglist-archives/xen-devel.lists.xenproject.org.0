Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A3A5629F
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 09:35:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904694.1312537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTB2-0007jW-29; Fri, 07 Mar 2025 08:35:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904694.1312537; Fri, 07 Mar 2025 08:35:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTB1-0007i3-VA; Fri, 07 Mar 2025 08:35:27 +0000
Received: by outflank-mailman (input) for mailman id 904694;
 Fri, 07 Mar 2025 08:35:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hW4D=V2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqTB0-0007hx-I5
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 08:35:26 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bc66617-fb2f-11ef-9ab5-95dc52dad729;
 Fri, 07 Mar 2025 09:35:22 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43bcfa6c57fso8808635e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Mar 2025 00:35:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bdd93cb9bsm44488615e9.31.2025.03.07.00.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Mar 2025 00:35:21 -0800 (PST)
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
X-Inumbo-ID: 1bc66617-fb2f-11ef-9ab5-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741336521; x=1741941321; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mnwWtfn9898dg3u5GPG2f+D52GCr/PsssNU0Y0tfSSM=;
        b=dX/jI/DljqTB1YKWQRDbA3clRra5Jm1Z1WWKVIhOnXZ99bYDbBKIV4O25pD7wryFqn
         nrU6+hsl26NEGSr5z2WQpTXGkhNObrnlB+dwRluwITxU05lApgXgG5KiJy7Uxq3rXOOK
         7Lps+kRYsyEesK479X0stX5cpJegaUCZzvGbJzZvfhrr4Z91envyFdxA1tCUaK8Kg3cj
         9I3IHYHAwIbXaQ+eFltjEW7VGlMXzWJCvbDPRsKokLWwC3xtnCEz47x/AdD2kbcaDV5c
         w++VG912/CmgfH9AfLDuP7e4bJNyxVj4qRnw4uCgGQx4c7dtTXNcOdXrwbGcY8IpFXZC
         QBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741336521; x=1741941321;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mnwWtfn9898dg3u5GPG2f+D52GCr/PsssNU0Y0tfSSM=;
        b=g7m9P1zmdMUYV/Jrj7s6Movv+DpwevTKiPUZhsFznhoZKURf25I8JI5YSWnWPusa8c
         /TOiubBfIKpGx0YEcDufbh/q3a6poUMSxnpw1v6atzu0kPFbRKjWNDi2i+ehSCmAF36y
         yDzqLwaQvHTTO1VanqAFPld3ME0RIs6LbikQShkM5ADaO+DDENUBe9v26oUoPZG5Ilz7
         WIZvxLNJwCbwdFBO8R8ckY/Kv5wNtrpF5rbmQ40qZHwSqjD7pbFUaJJT+lPPYpczDzrw
         F49Gw4U75S3W/OHR2cOzI8Z7/641v6v0tdu7luRth6DVLjb0v1kpuK3H3B8W7N/oMLKB
         IFZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWejQKxdSOY7qHHYuEt3D++VZIfo+o7t2EUzSPpbq3c/0W0cYwu30Zyxg85YFEFFLkDIm60q3mgzMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwfBLiFGZlgorYtRbaEPHnKIUc0AE7q8zs3IaGeZ+oTiLUmzVlk
	HHSysYy/aiqMcDjI2NM0/LVkn+cUafqx5ol+tDLnzoPxvRIR6OoJ4JUUWy6k8g==
X-Gm-Gg: ASbGncvlwqtAn3qFeOziPMWHKOXzO02DPdYAAxFZ1GaVSDXvEBpvX9iHRJPusmaSvOn
	yoZ6JeaArZCaaYfGQi8n4EH3xNPYmQAsUub9hdBKq+5MB+dxgQgvyd6Bcs/4N4IUvJgjb+e/KcD
	laaolO9vsbdb5UVPaz6avnkb76b298O1hrKrxJ0bnU9wVtWVFg1AiPCaUq0jtkfZ2dIrOW8dMNO
	pb9uPojyNmwg65MMM1yi0qYY2aHrtB4UfZ07kYFawjMhZmku7E1pNKgRjjiRXdlurDFt3B9GHKd
	Lbu8jll3nf71Xd9bf3NR3p/1pOI/w6RTJrO1YQHvpuaqyHMqXPVp9glAftEcmGfQl53v5lbDcYx
	7w2ZzOrppLufMJ3xl9abgUw3a9DQAKg==
X-Google-Smtp-Source: AGHT+IGgTBpotmGJ0JzvPrvBIgIY90nHLWz7UUe4NAQ1lMI/cDy7jtRYP7oIVXoxRRmftWmzH8M7Ug==
X-Received: by 2002:a05:6000:1fa4:b0:391:319c:1950 with SMTP id ffacd0b85a97d-39132d0539dmr1362194f8f.8.1741336521596;
        Fri, 07 Mar 2025 00:35:21 -0800 (PST)
Message-ID: <fc9caab0-6d7c-4901-a366-4cce8e3aa90e@suse.com>
Date: Fri, 7 Mar 2025 09:35:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/23] xen/arm: dom0less use domid 0 for hwdom
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-5-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-5-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> Assign domid 0 to the hwdom.  Normally, dom0less does not use domid 0.
> 
> This fixes using the Xen console which assumes domid 0 to use the
> hypercall interface.

Iirc a patch by Denis Mukhin is taking care of that, if what's meant is
the input focus switching logic.

Jan

