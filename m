Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8600A02131
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 09:55:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865551.1276786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUitO-0000lD-Hn; Mon, 06 Jan 2025 08:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865551.1276786; Mon, 06 Jan 2025 08:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUitO-0000ie-F9; Mon, 06 Jan 2025 08:55:22 +0000
Received: by outflank-mailman (input) for mailman id 865551;
 Mon, 06 Jan 2025 08:55:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUitM-0000iY-6I
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 08:55:20 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f46f6352-cc0b-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 09:55:19 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436326dcb1cso93515915e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 00:55:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656af6cbbsm595118285e9.3.2025.01.06.00.55.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 00:55:18 -0800 (PST)
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
X-Inumbo-ID: f46f6352-cc0b-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736153718; x=1736758518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HNHP5KHMf27LdU0KeBedMufdxZs5vEsqAMcYSe5Zu0E=;
        b=fBCbKvnOYnm310kNskQOte0M5oAeHTl5DGXkNRnG3bAaAAHOtZfDzShoUjC65FmLBg
         1HwoVGCt+KaVZkXaBhwKhFbzD2rT+4BWDDbOWnGAt4XL2VTHedGc+cbYhKR3XIvPKcPE
         Opj1lNd4ZGfBnnry2HdP5Rz5dQTkrw1ooWmJf58NJ+4UZDkE5bGTY12nxPmT2eoD9CXK
         cHkK7P14J4t4c91TfMf7WQbM2HcLId67LxlJ7s76aWq3sU5J0TH/to3LQWQOMNjFP7Rn
         p9Mml58fiyq0TwQ2O+hZcKZiBVJIy3rWavvs0EtLFfFN2yUAJ1SxYgxb93bF9cG3AZ8M
         TV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736153718; x=1736758518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNHP5KHMf27LdU0KeBedMufdxZs5vEsqAMcYSe5Zu0E=;
        b=ssCswrRPkjr5D0uKqb1hlUNWwVEwrGXLvJmVVr96JbPjI3dNJZirodfULPzW1bHJB5
         RVqFAZnpWjk5UJVfKjRnCRXmegkTEQqmkEJme6ahIP2XUWFi2BrwfhRNeE/ddE1Z14sS
         xG/uOZWWBBQm3xdR9tZb1+S2DtyS8ssXW0VbBFzcUn/InJ8MUQWD4JEES6A3mi51wfsr
         1l+lCmjbj3Ik7ptJPXTR/899mKmkY4Ma+nXzQF+gKcX2FYoaHAAfBOU2Wse0qVuN8vJl
         ZluIT3IWPIDVrlPVUg8bkx6ICnP0LQ/3TV2O2qZGWG57TE1XFsbu8vHFTpakVtwcyGne
         2pTw==
X-Forwarded-Encrypted: i=1; AJvYcCUGghtBs6j4bKPWAntJ616gI7UKGZPlFohbtH2OzwuPjlQHYeOZoHGcRHQwNcVDBnQfMA5SH1ob7Os=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwW4ereGMCWB/KifNvcW993HJbaBQBqAWktV6nRcfCL7GUnIFEW
	JR1ZBDuYIVtUuihDi7hdvqywh1UgcFmWaU7kpB78TfkfVktNwdWwp7nKd81+6Q==
X-Gm-Gg: ASbGnct5jvfLXeSdudtxlw9Sh6HoOdN6TB3LZlmCW9aFLOm9AdXdX2WCxrsbg4yO6FK
	Yv5Jt0U/lT4CzvVIEsI3dVEs24hqbVYAX+qOOKMz25obg/hg8QjFM70oQkKgI2mpT9bhSRBz3QU
	9Gb7y9PFn1cSf6oal2YvByx4MUevudpoooYywQjfoJ7HZjGeyuPTcFkQX/jkycxixU08vD8LMxg
	aJMveswYbs5iM2Mgha1/ryOZhAcJqMEdf1P6uBi11QXP4fnFJjvenWURkR76QFhGAY4s34NYTVv
	QJITtlPKPDrnjP37l6380ldU5OJc9eff+iqHUIvbyQ==
X-Google-Smtp-Source: AGHT+IFoeHyuk4EieHn3bvrcLDmDb2PF2X7gBEvCSrQ3jQjUQUhC1e952KbdU8pVSUUwIFpHsFwp0w==
X-Received: by 2002:a05:600c:3ca4:b0:434:fe4b:be18 with SMTP id 5b1f17b1804b1-436686468fcmr521538215e9.18.1736153718543;
        Mon, 06 Jan 2025 00:55:18 -0800 (PST)
Message-ID: <180fb50d-37c8-439e-9fc2-883e75895a8f@suse.com>
Date: Mon, 6 Jan 2025 09:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/35] xen/ctype: introduce isconsole()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-3-e9aa923127eb@ford.com>
 <b3afb61f-0a82-4a66-ae9c-42c1106a5399@suse.com>
 <UxuSYzSmEVywRqZ_UFKaoIq1qJIu3HJsDIFnih7hfMmjZ7m935H9ODPtxpe4NxWRFKBsiQL_j42X6U_1LdeSoI2Eflge05xsI5YUClj0HFc=@proton.me>
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
In-Reply-To: <UxuSYzSmEVywRqZ_UFKaoIq1qJIu3HJsDIFnih7hfMmjZ7m935H9ODPtxpe4NxWRFKBsiQL_j42X6U_1LdeSoI2Eflge05xsI5YUClj0HFc=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 03:31, Denis Mukhin wrote:
> On Tuesday, December 10th, 2024 at 5:22 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>> --- a/xen/include/xen/ctype.h
>>> +++ b/xen/include/xen/ctype.h
>>> @@ -4,6 +4,8 @@
>>> /*
>>> * NOTE! This ctype does not handle EOF like the standard C
>>> * library is required to.
>>> + *
>>> + * See Rule 21.13 in docs/misra/rules.rst.
>>> */
>>
>>
>> How's this change related to the purpose of the patch?
> 
> Only because the very first version of the macro was failing
> an ECLAIR job for me because of Rule 21.13 violation.
> 
> Updated the commit message (v3).

Well, no, in such an event please drop this comment change. Or else we end
up with Misra related comments about everywhere. After all _all_ Misra
rules need to be follow everywhere anyway.

Jan

