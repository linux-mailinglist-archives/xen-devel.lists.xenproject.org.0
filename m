Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8C9EC5A2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853912.1267246 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHES-0007ST-Qm; Wed, 11 Dec 2024 07:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853912.1267246; Wed, 11 Dec 2024 07:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHES-0007QE-O2; Wed, 11 Dec 2024 07:34:04 +0000
Received: by outflank-mailman (input) for mailman id 853912;
 Wed, 11 Dec 2024 07:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HaM=TE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLHEQ-0007Pr-Qs
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:34:02 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a41087c-b792-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 08:34:01 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-434f3d934fcso21177935e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 23:34:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ef7315fd3asm8644326a91.44.2024.12.10.23.33.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 23:34:00 -0800 (PST)
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
X-Inumbo-ID: 4a41087c-b792-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733902440; x=1734507240; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=x1zWuERKWHXpk3QeEuDiUP2J1ewr49478Cn28QWMU38=;
        b=OVb7F5R1/CCjNcNvrvc1wHcUI8LtPQ4G5O9MBL1dWRSiwcNZ2PkiSrkELqmFicUDYw
         kIXLdAI+7ki8hRKpfNHUZAbMzSh86w+yQ/mDHAGaVxIA9aqhlu98DsRPceXh804Pz156
         tMQM75lrQKgWr5izgUo3rWRJkX7kW81ncPmlmE9G6AmQvlh4WcAxNhxPQoNAQNuiFw0x
         ftQgrSFI6www7r4mex+JrrHNFzzxouxEQWWQNrAhWLt0/H1En25isVb6+RpnBf6I0iUq
         Tx4RWJ8i32i+vO40a7Ysh7uCEbBnEAUbzSfxWYP6AO7UBLsPUyEpi47KEmP6BY8HBYmL
         Fqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733902440; x=1734507240;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1zWuERKWHXpk3QeEuDiUP2J1ewr49478Cn28QWMU38=;
        b=vdfPrIKxZQYPWF/IxtWpYuov1SvIaECjYIVSthnbWeK5WvRnMVU1lFYN8kvAx/Cyh6
         UxNO8xLgfKeJBziZTaKcMkgyunMUlcoNGqd1ccHGtHpnRzX9dItZJf+lGOl6V2ns+vri
         iCuUOSzQQ6yvj3jYbtSRfa3BmFtCWV+Ymut+xVVmpU4PPkJ/fkynk09HkF9bhA2YQrEM
         kh6SMIPZVJm92LrDNip0UXZD/IBbaYukXQ0NJce5r/184uXR6qVhvD/5FF5kB9iFSMZM
         sB2Ut8uup5A9zTWnmT2uka9Q4IupPARwHfZmEaVBudLb7nXQYo0xn/89kSySFH0tABO8
         fp5g==
X-Forwarded-Encrypted: i=1; AJvYcCWAW0/vXaOmI56jEYqMX6BJHzoGtnmzVXKAkCN2hutVtObFtYuIYRuHC/GZSmkM1B5oUxSnP0lBybY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWftFsDCMUlXXD2V2SmjiDQofAKulKKZ/jk10dqKyeSWjeJtBO
	t6LEhufqNfmzGycuY97MgU86QQZdXZUymIQzQx/9Km1mLM7h2k9XLGJuep5U/g==
X-Gm-Gg: ASbGnctsBBdJfaDVIAk8q+J5IT5Pho4wPzPVMhqyBiM9HjBbY3wdcd7HH7jbnGoKTvn
	HRGf2jtTGVNzrURPbWSRfvbxf+7ryBa0Y3R0mvj7v/DI3wP4NXSlp9uuvy6AGyRpKnTI6D0QIrO
	iDOCAYR3axJ1f5ltedDqH2Tqo5JdN3JZVmqp3c3WwvySjD/gkQjocmllurQosnm5WqnquVPWIg3
	edFoedmaUZVohh5pepgEBOPuDexeFUEwP0OE3vr1+HVX3WLfvtweVLOvvyipxpItz7Eu4EUQsks
	ccpYhuD+uRXRt3db3UxVzZaGl5Ik/HFSe1pyyGg=
X-Google-Smtp-Source: AGHT+IFAMa17/9TzroTdAhsrXHnUHuM9rM3YnPfYxz1ataWhtwKwJ4+OXc38dZbdFXlhUWRujuPaXg==
X-Received: by 2002:a5d:5f50:0:b0:385:e22e:288f with SMTP id ffacd0b85a97d-3864ce60b85mr1273073f8f.31.1733902440582;
        Tue, 10 Dec 2024 23:34:00 -0800 (PST)
Message-ID: <b0b92749-f795-4e8e-b6fd-5c02e14aa83b@suse.com>
Date: Wed, 11 Dec 2024 08:33:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/35] xen/console: introduce console_owner_domid()
To: Jason Andryuk <jason.andryuk@amd.com>, dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-20-e9aa923127eb@ford.com>
 <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com>
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
In-Reply-To: <9be0addc-d4cf-47c4-937d-e1937898c010@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 23:11, Jason Andryuk wrote:
> On 2024-12-05 23:41, Denis Mukhin via B4 Relay wrote:
>> From: Denis Mukhin <dmukhin@ford.com>
>>
>> console_owner_domid() is introduced to obtain the "console owner" domain ID.
>>
>> The call is used in NS8250 emulator to identify the case when physical xen
>> console focus is owned by the domain w/ NS8250 emulator, in which case,
>> messages from guest OS are formatted w/o '(XEN)' prefix.
>>
>> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> 
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> 
> I expected this to be used immediately by patch 21, but it is not.  You 
> might want to re-order it directly before its first use is introduced. 
> I haven't gotten far enough to know when that is.

Plus, no matter how far in the future it is, there'll be a window where the
Misra rule of not having unreachable code in the project is violated. New
functions now really need introducing when their first caller appears.

Jan

