Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EE187EB85
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:59:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694777.1083891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmESa-0000z6-IW; Mon, 18 Mar 2024 14:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694777.1083891; Mon, 18 Mar 2024 14:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmESa-0000wU-FK; Mon, 18 Mar 2024 14:59:32 +0000
Received: by outflank-mailman (input) for mailman id 694777;
 Mon, 18 Mar 2024 14:59:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmESZ-0000wO-Cb
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:59:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ebac03b-e538-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 15:59:29 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so5142530a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:59:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 eo14-20020a056402530e00b00568a1897dbesm4440379edb.77.2024.03.18.07.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:59:28 -0700 (PDT)
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
X-Inumbo-ID: 1ebac03b-e538-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710773969; x=1711378769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3riX+v6dfd9+Zjk5Yj5hZvN8xcEUeV+FYYHRvgqoxRA=;
        b=EhND6e9Q42fyZp6kPv5o953d9Y8I3Z/f6uAmyFR4acWbwT9leMY6RlTERHqgnRuYcH
         p5XuDwUCP2sFelMaQVndM3ps4A/SJT9PlM7WFD7GXwaovbS/tu/rhSjOjCGYxTC0w9oA
         TASDHyWtrsJIskClE28wAnYNVWDJ4yjPNx0DTn6ShT3pu0ksBZdHHqmObqmApkHohR5L
         VPNECltLbndvOyIZQJ49LN+qmhXzwlXu7PESVAgrcolIl5Y9/wyLVQOWQtAPvdBr/cur
         rBmrzgi0EisXh4IxfVXkKeDOiVNr3CxHn2CCxlEhwe50RAtOsaY0y9BQV3RwAwkWwanZ
         9hTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710773969; x=1711378769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3riX+v6dfd9+Zjk5Yj5hZvN8xcEUeV+FYYHRvgqoxRA=;
        b=M4/NiqZGj+4uM/D/JhWy0VOdHDJLYhIVpZROqoAldwStxx4iEYiVOQNYgeZhxQgnVb
         rhSAizDIzQ+jkZsUTxpMnYhB61kzO0zYVXwnCn6vKz+u36QRQaEProgYTyRwDBxe5F+n
         judfSH+CyWfBy2pRfbkIwjpJCBXobM5ZURkjGK9CsgTd7mNoRFE8+IiVNIDg8itJzBWd
         X3wb/u5s+D2ayWyQIFleSJp2414WEK7TdxXPcCkzDSljfbUEto4791kdOjAbzQgU2B+5
         3b75gyLLb/ImaAYX/MtNxC1RI00GbRvVwJnJkrUjipcq81o2K6n/EY9UuUPY6SrEclXr
         eOSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNmUYO+vRhQ/DCdOVsIHHIgRudSKxid5BnZ+qWV2pAe/yvT3j3B5heZcpI1htAe72KaCQJg1IiiN0yoy9MpcTbNsct2V2tGcdo5wkD9n4=
X-Gm-Message-State: AOJu0Yzrm0bMFz/WsyFYZFhx1b8EjNPI8q/wceS2t2WtxK/s3KZaH9UX
	qAZ1fqSfkn0qxg5l6iCklm1TmxwajJ5Qg01kBY+VSNvXGPPGUmnq7Yj26k3wWg==
X-Google-Smtp-Source: AGHT+IGWb42vkoX7Y8/zVVp8bLKmfVbJBri2tFhKl6S4eSBILILA8b5+enTgTDHwbS90Ke1dH4Craw==
X-Received: by 2002:a05:6402:4282:b0:568:7ad9:f2af with SMTP id g2-20020a056402428200b005687ad9f2afmr10509674edc.27.1710773968764;
        Mon, 18 Mar 2024 07:59:28 -0700 (PDT)
Message-ID: <6aa7699e-fe39-44d6-8781-c32147ff9581@suse.com>
Date: Mon, 18 Mar 2024 15:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/13] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240314072029.16937-1-jgross@suse.com>
 <20240314072029.16937-10-jgross@suse.com>
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
In-Reply-To: <20240314072029.16937-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 08:20, Juergen Gross wrote:
> Recursive and normal spinlocks are sharing the same data structure for
> representation of the lock. This has two major disadvantages:
> 
> - it is not clear from the definition of a lock, whether it is intended
>   to be used recursive or not, while a mixture of both usage variants
>   needs to be
> 
> - in production builds (builds without CONFIG_DEBUG_LOCKS) the needed
>   data size of an ordinary spinlock is 8 bytes instead of 4, due to the
>   additional recursion data needed (associated with that the rwlock
>   data is using 12 instead of only 8 bytes)
> 
> Fix that by introducing a struct spinlock_recursive for recursive
> spinlocks only, and switch recursive spinlock functions to require
> pointers to this new struct.
> 
> This allows to check the correct usage at build time.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



