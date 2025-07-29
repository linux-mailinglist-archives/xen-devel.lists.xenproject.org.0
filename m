Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538EFB14911
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 09:26:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062105.1427722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugejH-00027k-IT; Tue, 29 Jul 2025 07:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062105.1427722; Tue, 29 Jul 2025 07:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugejH-00025K-F6; Tue, 29 Jul 2025 07:26:31 +0000
Received: by outflank-mailman (input) for mailman id 1062105;
 Tue, 29 Jul 2025 07:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugejF-00025D-8D
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 07:26:29 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 561497ab-6c4d-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 09:26:26 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3b786421e36so1474511f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 00:26:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2400ab23985sm46666345ad.38.2025.07.29.00.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 00:26:24 -0700 (PDT)
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
X-Inumbo-ID: 561497ab-6c4d-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753773986; x=1754378786; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+nmp7r+U8cFO9NmBgC6hvVkCvwF18iQs7H6GvcKET1I=;
        b=c7WPB5O+TdjUhA3uaFeHQ7TRBSaUCL2CVPuf4+Ch/9zGXi4/PdQE+R1NRMUQpwKOnL
         Wqg7WAqpIqKAQXWZnP/BH6g4DUtiZ/DMLVAWvJwkt7CyIXOJE/78hwB9MdHd9b3v3HPO
         19YX2295J+a4tSNmeysWJQikv7GidGA1xwQZi+TM+CBfCxbPnXL3r1MYdXem1rzAMtw7
         s1odQIOO14Z9lNfZSKNrJ+/h3Njon0E6miEEOo5p8rHCy2LjpQoB6BT4fzCmjk8bFM7y
         nXr7S7wd4Ie5xDJ2qR4VK7MCIR0uY4CeWImMpfjENe5EcNx+3ucmemEXTnvaElvmt83z
         MqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753773986; x=1754378786;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nmp7r+U8cFO9NmBgC6hvVkCvwF18iQs7H6GvcKET1I=;
        b=aVu+MaQyHw4mT+OhhNKiRx39y6jnCxEfd3Q/QLlewMV9lcQ7qnEW6BvOvBtI3NRfSx
         Hnty1CJ5Tc8LV6yJIQekOUgyhvbfU8GAgSSzFNNqHhlC2YVElkz3gtGZm8iHf2+JhOba
         Fym63erSfJPJBxQ8yl68U3gKr3anZRqR4SQIyoIgoAHz1bSlRk7u4e3BzOIjXpHU1M9Q
         JLVhwPY+Kd8l3XRJiCThskvSnBhI+8u3z7CjJNTg4Y02Ts7fmwyyHUXZPtSrpHntrzXU
         BI1vGdmjJWRli9sMsbRbwakedxbsZIjwQW/eZfEbhHYd8aT8tww64KFy05okhwMsJztr
         qAig==
X-Forwarded-Encrypted: i=1; AJvYcCULmwef4SqvtV6qN9RYSGQ3PVWA+MbBUhVqLXpWvI9y2WMXrRgKlreX+fZKx9yZ6dkCsUlDfPNKpIs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNb5HYSlFdQ7YOirpsQE3chheSMsTh6b3fmatNE5QykqMGZ3zC
	l4zT/U8tb/s+Boe5DndKU5ILmxA3FwBE35EzZd1+xXRD/Xm8uvh/tUKr4n+1Jaglnw==
X-Gm-Gg: ASbGncueYuVosN9Ulc6qe3EeQelPFBsdLQjzjDSKoAYyxk6uHQWv+AMEiK0uqnRO/yN
	NxYQVWmsFZI2mRnzEy+QOFZZVsXlFk+QfRB19TqW24s+Ue8xy2OFRIJKeaEm9oRbPCtJEUwBNqu
	ydPy6u1xRu6GtMi7vo7RWg94kA/rYwopWiHctxDSoKXoBclfbT4G/EmpQkPvvIFlgEXs/geMVXD
	aYh7s3Z89i7GllcGUrAvMwzSLEo/U/Chik/kMLBG94Xbr6j0wRGu+mdle4hTN9RTO7cxz5rpfC1
	GZt4yXTdMWzWQCUlA1dfjZXm35sVf9UdkxKBaP5NkOzHIYW6GBS8pZ+15QQYwptSyuuJ9iBSt6J
	YwTFcl+VDSjwQhdd1v7r1vzAZn97V1TepC84G5y6QEXiMwBwlYd0QGwWIwPabNBWvrmpDfpEaP/
	BZZZ5Bkvo=
X-Google-Smtp-Source: AGHT+IG8U8v7B3znj4LagXw6G/F/GZ45WcXequdAfG+WifTQzJKWYnp+WKDCnnaIIERQdiK21UyTyQ==
X-Received: by 2002:a05:6000:40de:b0:3a4:f70e:abda with SMTP id ffacd0b85a97d-3b77671c5fbmr11922423f8f.10.1753773985528;
        Tue, 29 Jul 2025 00:26:25 -0700 (PDT)
Message-ID: <4708ddca-2079-491d-9b1a-031ab66988b1@suse.com>
Date: Tue, 29 Jul 2025 09:26:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: deviate explicit cast for Rule 11.1
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
References: <181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro_prokopchuk1@epam.com>
 <093601d7-691a-48ee-a0f4-2e86a0f2015e@suse.com>
 <43bea8dd-fbd3-4a64-ad9c-aac5813c15a9@citrix.com>
 <f1fa4da171fd7b6dbfed06cff3d4771b@bugseng.com>
 <a5781ddf-d353-470b-a072-1e0b4e6931dd@epam.com>
 <efcda932-633b-4140-b869-e22d552b3aea@epam.com>
 <aa6c034443b495fdf13eaf88487a94b1@bugseng.com>
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
In-Reply-To: <aa6c034443b495fdf13eaf88487a94b1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 21:17, Nicola Vetrini wrote:
> On 2025-07-28 20:58, Dmytro Prokopchuk1 wrote:
>> It works.
>> The violation "non-compliant cast: implicit cast from `void(*)(void*)'
>> to `void(*)(void*)'" is gone.
>>
> 
> Great. Now what would be really useful is a way to abstract this more 
> nicely (I was able to write this only by looking at the AST). However 
> noreturn is probably about the only attribute that has a repercussion on 
> the decl and is safe to cast away, unless I'm mistaken.

Not sure what you mean by "repercussion" here, and hence my remark may be
entirely meaningless, but: const and pure are also examples of
attributes which are safe to cast away, aiui. In fact, given the sheer
number of attributes, I would be surprised if there weren't more.

Jan

