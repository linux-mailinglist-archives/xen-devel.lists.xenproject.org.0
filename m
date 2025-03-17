Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F66A65288
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 15:14:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916970.1321973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBDg-0007wA-ND; Mon, 17 Mar 2025 14:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916970.1321973; Mon, 17 Mar 2025 14:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuBDg-0007t2-KF; Mon, 17 Mar 2025 14:13:32 +0000
Received: by outflank-mailman (input) for mailman id 916970;
 Mon, 17 Mar 2025 14:13:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuBDf-0007sw-7S
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 14:13:31 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0050b7ab-033a-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 15:13:29 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf58eea0fso11183815e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 07:13:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe05ff4sm105575575e9.10.2025.03.17.07.13.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 07:13:28 -0700 (PDT)
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
X-Inumbo-ID: 0050b7ab-033a-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742220809; x=1742825609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qfvH16llj3XyoW3Vm9q3otwDycWiALw/Cjy4JMOarwU=;
        b=RLoQuWa8LlRq4PPNzjyo2nJWlOEKJFVvqU2MIci4Y8PizV5gSJ9OcMccfrQXzO9pAK
         Iv6TejqhKBabMxFFsu/aXw36LPmVCfLcz7bvCLBwWHcf6C4XwpGy4BjpIu5OaYrZuY9x
         d3lI7Mrjxy1zH5/xMlsmLES75rrDRRDQQPhjteo13pt9jk8xxbxxO6bw+5xmC6rhAfLz
         gbtu7G7XkJqPKCOPQbXrbEFThCC+a4II7T/BLPNXJJlNJBZpCeraF3ZKJDULQAMPebEi
         QP88pEsZWUMv1mYC0w4/0tGydNHXhajIH+G9LQWm0QpdU5R5jRK1Vxo/W83Q7UzQpDMK
         GimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742220809; x=1742825609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfvH16llj3XyoW3Vm9q3otwDycWiALw/Cjy4JMOarwU=;
        b=M6Bp3J25AQ3+vbdVqy4lQjQOBITZ4HQyQ5qyP/TVlUkMmiuDAUlC73qa408ZnM97/e
         XSh3iXp3ZOQR5zp43Iz1mQ/8x7FIb/xxytOJeL9dKArSP67aK/TmUZ57XNjGHpDJUWs5
         ryUrBzJ3D+EI7WOr1AMWoCxTvKKg1c/V/YToh2IrxvN/gQm2c6qHLNxducByF8XlvfUb
         V3fr9DCbIXhB6XNQ96k/cLwlpVfkxD1n/0Go2lYj5a0nZu1txY+Eme8kkWn1wzNIsP0u
         AcBRyHgzTe/rHwtL/gV40bpI6wu/oPvzj3YbMVv9ls146vLPF1+tsId8ZXb8NSykTbkb
         ImsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqh9zcs0lvsqfGz2vjcnprS1HO5buy1ADAPp79LLqdzoW+SyNyvNLICcmbEIokm7QtytReEogSjx0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxkxfosa2lBx6QskJtfkb08LSODfqMfBvf/tySK9oMYtw+xIGGF
	6Fqg+UqGrtnM+nxBYf1Pkv7qvdF1JihbAmHVDxSWbsXtV99jlXjKkRDJJIfd8g==
X-Gm-Gg: ASbGncvrn9pmnkq2zXo2kbGG92cifEn8rruYUUDz4evdAYT7VdUE+JLILJS/FbmP6iy
	wnAaW1uZgvHUjul1HSoySS1eqqYIaMgzOvRVNzddPowV4t4xPLP7tUQdKDlFu13+ASRJ/HMjA+r
	S7sMbJIl2sKKgIH8VOjGg1y793LJruh0sIC0zmAehp/J/GM9p8AVv3wA05JOOybYop8JZPfMkmY
	ZVlziwtZDbSoekcH9bqR//LSlD0FAeX5g5NZ0cHzZ/Js4QPoxjaCMHC89G2Sca76FtsWKU5/IEg
	RgZv/DvxP3O7dg5ygnTFgjcMRgpX3vTa03l26Z0w9k9xJpkytqgz8Qv4ZeK5dhTj/q+GBMLAhOE
	hOcsXJPq3l8xhn1oE+P2naV2yTLNcgw==
X-Google-Smtp-Source: AGHT+IF7USxI6eCGANQp/3rrlshXsrdg/80dEX4lu9KyUMmFS0nm9Qw0k8tfHWuaM4CbZPCkmQR0lw==
X-Received: by 2002:a05:600c:3b9d:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43d1ec7aa37mr145216325e9.11.1742220809214;
        Mon, 17 Mar 2025 07:13:29 -0700 (PDT)
Message-ID: <5aac6880-7821-4217-a493-d0ab8b0139fd@suse.com>
Date: Mon, 17 Mar 2025 15:13:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] xsm/dummy: Allow XS_PRIV
 XEN_SYSCTL_getdomaininfolist
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-14-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-14-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> To hyperlaunch xenstore, we want it to automatically introduce all
> domains it finds while initializing.  To do that, change xsm_sysctl to
> allow XS_PRIV to call XEN_SYSCTL_getdomaininfolist.
> 
> Xenstore can already call XEN_DOMCTL_getdomaininfo for the same
> information, but it requires knowing the domid.
> XEN_SYSCTL_getdomaininfolist eliminates the need to guess domains.

Yet then - is it a good idea to make such changes here for the sake of a
new feature? If existing Xenstore was enhanced to use this, I'd find it
easier to accept the change. Otherwise can't the hyperlaunched Xenstore
behave like the "normal" one, not needing the change here to be made?

Jan

