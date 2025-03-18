Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C27A66A80
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 07:33:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918516.1323166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQW3-0001x8-TN; Tue, 18 Mar 2025 06:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918516.1323166; Tue, 18 Mar 2025 06:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuQW3-0001vf-Qo; Tue, 18 Mar 2025 06:33:31 +0000
Received: by outflank-mailman (input) for mailman id 918516;
 Tue, 18 Mar 2025 06:33:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuQW2-0001vZ-5F
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 06:33:30 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e73be530-03c2-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 07:33:28 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3914a5def6bso2745263f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 23:33:28 -0700 (PDT)
Received: from ?IPV6:2003:ca:b70b:b4be:a081:f026:906f:3550?
 (p200300cab70bb4bea081f026906f3550.dip0.t-ipconnect.de.
 [2003:ca:b70b:b4be:a081:f026:906f:3550])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c83b6b2bsm16757274f8f.26.2025.03.17.23.33.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 23:33:27 -0700 (PDT)
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
X-Inumbo-ID: e73be530-03c2-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742279608; x=1742884408; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zoVFAjZzwrPQ5pscn2vTeLIf/ovitfI9oioKUQ8959c=;
        b=Ckg61t2cYNyuTUc6qsqM3EOss3H85Nb+GshCASwzhd9nvGWr9kPlYM/rk4k+IVMrv1
         k2meiXcVW7tJGfPxB6X8uTYxK0se/Or3YY2RvUbQUjq6EKjqdqWTfsXg4wgi15nON2oD
         MfJCk+sqACc4S2KPqpxs8MmI+Lvo6mx95zas3XYqT6yxzxLmk9l81UBOApsXdilvdoQ1
         YEYBq0ki3KazdS2OZLKpXZk3DaY8SRgv4w6vQ1rWbMCB1ZsAQEOWGEcI+pc2Io8nG+Ou
         rZXNBV7WSsV6pk8t+b/dnXA0wmhOA/qqlyJMKk+x4F5GAicOsrJXVb9DzTr6Q+P/Lyz5
         xtUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742279608; x=1742884408;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zoVFAjZzwrPQ5pscn2vTeLIf/ovitfI9oioKUQ8959c=;
        b=kHA8/cWK0ruQgLTjfSL1bD8613JjV5++uRysq6q9sIPHSh6oy69I4aYPLdzaHT6hyb
         ROLeijIw3CQ6UkqQmpZfIN4wLHLPHGh0AjGnmoHt8D/kD/ElY9vNj+GqjDMhvbNSD/2P
         OkWKrk6wWaAXLFY8b6mcSLQYY+I+0IwZX3ZroyUu7aeTmct6R4BHXfrqSLqxcZk6bgSX
         TJ2MzfsahkkoJE5TduR+XZdO8bQ+MxN9A3UVpRvw/oVoibOeMmYqtU//E2j11QuYh2GI
         XCoD+3OKAj+gOfK2C0mJf0baNjSnkSfqItKHMjLzdZXH6a+YKaTmD+H5HRjtboo1srfi
         ljkA==
X-Forwarded-Encrypted: i=1; AJvYcCUFfoW0d0BUu6hKRsyRINhn2R0EnKsN4gtmgzlIC8IWMa8xrkQw5/tpUWJYhZFUbWwSzrZ4foOcgpM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYJoNRsQLxuFpJCWYQlx3hidJ8ufoN4mok2V9WaGy3+ueKymuW
	eC+P0Chfwdk6YfkbmKj1qxPmJDdAh6qFhkrHxSKA3YPxHNvDjXQvx96YASqiWg==
X-Gm-Gg: ASbGnctDZX56ssvUm9rJqHl5ZkopNwISm/zotB+UGpF3hjMDkom9UnXYFDiUgZLgqVB
	JUs6V7EpE1CWK3q+vztTYMs+WAGewigNsQG+DiEgsbUhwUNw/O9IDMhgFJxA/du7u8FWL7E5zld
	WCQa01RjFaRIodhuqJoLaibsCrLJOmi5wCHZMxUuHx+hgaU4/aOE4TFtlqGSpX9UGt7yGpxT1mr
	7eNoebRGPgsUQkKwIvHCWAQ43hS3q/Ynyq0ey3pcEH62bjoy/RZMoEfuVUd2h6vwyn7AinarLWE
	veHiNUgwPiBr7FIbUxNxbBCCEdyl9b6ALqB6HiNI5+YAR8wvs1YfPVaY5J6IeS5vDADPtjKq2oe
	ehFrIKaxZIFm9raPWSDAJoQYAgwvjcQVqnL4OxvxsUmgum6eDdcY8FjKfialHIPwDDR83hWD9b7
	lqIqI=
X-Google-Smtp-Source: AGHT+IEg73NSiwTK+FrOkF+SpOCLzFZ9pCMQ+PrnzK/JFI22hcVwOZxfUdp4jGASgUVwp0Qj6uuW8A==
X-Received: by 2002:a05:6000:1549:b0:391:40bd:6222 with SMTP id ffacd0b85a97d-3971d9f1fcfmr15327794f8f.22.1742279608219;
        Mon, 17 Mar 2025 23:33:28 -0700 (PDT)
Message-ID: <bc8505f5-0712-4661-b6af-8d8f96a1ea2b@suse.com>
Date: Tue, 18 Mar 2025 07:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/23] xen/xsm: Add XSM_HW_PRIV
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-16-jason.andryuk@amd.com>
 <095042a0-94c1-4f86-b6df-836a7107efa2@suse.com>
 <a6bd6175-32fb-4da5-b70d-70e8dabadf66@amd.com>
 <alpine.DEB.2.22.394.2503171653220.3477110@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2503171653220.3477110@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2025 00:55, Stefano Stabellini wrote:
> On Mon, 17 Mar 2025, Jason Andryuk wrote:
>> On 2025-03-17 10:22, Jan Beulich wrote:
>>> On 06.03.2025 23:03, Jason Andryuk wrote:
>>>> --- a/xen/include/xsm/dummy.h
>>>> +++ b/xen/include/xsm/dummy.h
>>>> @@ -95,7 +95,11 @@ static always_inline int xsm_default_action(
>>>>               return 0;
>>>>           fallthrough;
>>>>       case XSM_PRIV:
>>>> -        if ( is_control_domain(src) )
>>>> +    case XSM_HW_PRIV:
>>>> +        if ( is_control_domain(src) && action != XSM_HW_PRIV )
>>>> +            return 0;
>>>> +        if ( is_hardware_domain(src) &&
>>>> +             (action == XSM_HW_PRIV || action == XSM_DM_PRIV) )
>>>>               return 0;
>>>>           return -EPERM;
>>>
>>> Hmm. Isn't DM_PRIV a property applying to the control domain (besides
>>> any stub domains), but not the hardware one?
>>
>> I ran QEMU in hardware domain to provide devices to a domU.  I thought QEMU
>> would better run in hardware domain than control domain.
> 
> Leaving stubdoms aside, QEMU has to run in the hardware domain because
> the hardware domain is less privileged. QEMU can be attacked or affected
> by the guest so it is undesirable to run QEMU in the control domain
> which is highly privileged, and considered highly secure / safe.

Yet having access to the hardware, hwdom can likely also do about anything
to the system. IOW I'd consider this "highly privileged" too, just not from
a pure software perspective. If you want a secure / safe environment, I
fear you won't get around using further (stub?) domain(s) to run qemu in.

Jan

