Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFDAA2A732
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 12:17:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882762.1292861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzsj-00007p-VN; Thu, 06 Feb 2025 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882762.1292861; Thu, 06 Feb 2025 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfzsj-00005p-So; Thu, 06 Feb 2025 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 882762;
 Thu, 06 Feb 2025 11:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfzsi-00005j-Fj
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 11:17:16 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb960900-e47b-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 12:17:15 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5dce3c28889so1745434a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 03:17:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf1b80f6bsm733099a12.43.2025.02.06.03.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 03:17:14 -0800 (PST)
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
X-Inumbo-ID: eb960900-e47b-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738840635; x=1739445435; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mBEEaVAVR5uzdwrV9n5UKXSQBx6ngCVpVDMfVMR7QnA=;
        b=cumhdzL53vJsk07ySxAlVRMJlF3Blkw5qUyWU/3zJqJlPWQ6XmsUGF87UEvQzmjINZ
         JP+VhZ5EurWn/2Caf2q4yq6/+LzM0f9wzMJ8HnJguvZBagzCez0HAZViCRHs5KMEMuUT
         BpnqnxGGmFrdpkJpC9loLhtdDbSpzilp9Mb12FWJIwL6PqHgEBxAJjNUHkA+Mns09Tjj
         swDU3qbqt6JIemx08GuwXhFFLCc82N/lFTiyFxzMaXLqPfSAY7k3EYnJd1LcUuPBGOPR
         aIQjXKLyciUk5ZOvPkC7mduqpDNxKAsg55BnWiHJwvL53PhpypnfELYkCE4OeSdwZtNV
         ZFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738840635; x=1739445435;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mBEEaVAVR5uzdwrV9n5UKXSQBx6ngCVpVDMfVMR7QnA=;
        b=XnkzfB1RfZ4y0Ornzhshf906pwZo3l6IyRSLIZRPfOukyn6pRO63lhCsQrnG4mMe2H
         6mIVfI5lDsvRWnIPNCJkcLp0YCRum0FwDyJauh5G+QyS2sgcrvUsjQQzeIqDiPjBWdT2
         bNADef0hOTo6Zu2Y6dZ+wUTfvPCdgMKVLEaPQXVnJb4TTi/uZyMXH0U/MrpD+MUjuzJ2
         Z4kB81hPS7Pmm/OY7wTjENEiIKuvWeXNIf6OhsQt8w4x2nvwA/TD7djYpu8EQUXnv/no
         EkXoASLqAxGAz9lRSEcT3eE+JFx9pFQ+6n6wifnW6EBoV7YBb5QKnq9swKuci6Zt8xHZ
         16pQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2T8Ug99HH3ZAKgaUUHyHtdKUGYFRwEt7hDVpyGwfNWNWIAP8hDb1+EjdyYfKnNRGUuHKtQC2Pcvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwEMfUEfJjhWo5XIvd0r58R2FAgsdB4V1bxR8i10N5y5Ou8I8fH
	1FaBKFymJUc1DppgGMELLNYZEFq2flt9FV8XDEbSFvGgWv9Z8vGoTJaGvbJWuQ==
X-Gm-Gg: ASbGncvCke3amSQ3dcw9eo7C3WoBaYoJ3b9oOGLG5kpznSTLKDe1iUPCeJQBjgZ4yXI
	JQ2ZhGzbtQsRxtgTmF8tgweF42bXU1Qm7tr6TJdSHdZ3cjjwoaMs+eBsNrkG3QNo/ax2ajdJGWj
	lFve1k9MF6etRSIGjp04qIPisOTj7rlcaQYva/fdaz6owyCS+EDb/qcdyuK+FKqSqiW1q/yMHj3
	XTbi+ru069iLIaq42pNJVPRsdZxrmCsUyhLPjdlS9K4TifhAzlE5tdd2vc4mEGGRC9kxr7w30IV
	2VdyWRBLOr6AFfh/v64AJWY+RY7Det3v4/7zC+Rc2stwyHPLAj/lDfaLfYlnMK+r3Gn8MKY+sH4
	B
X-Google-Smtp-Source: AGHT+IHXUoIQS9ZC2SVO2tn8UOzvJwFaa85Bd3L5y0+5j1F5FF+jL8ksXoYDljjWSQF+AN9UG5g/+Q==
X-Received: by 2002:a05:6402:520d:b0:5dc:89e0:8eb3 with SMTP id 4fb4d7f45d1cf-5dcdb717af9mr7058648a12.11.1738840635104;
        Thu, 06 Feb 2025 03:17:15 -0800 (PST)
Message-ID: <98b53e49-4b0f-4a25-a164-4e6ac5b305a9@suse.com>
Date: Thu, 6 Feb 2025 12:17:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for 4.20? 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
 <131ecfd1b39b4ca4fe3e5d7f7e28a130c301e0fd.1738587493.git.oleksii.kurochko@gmail.com>
 <1223dc81-da85-4616-be12-ad445ad4ca4f@suse.com>
 <171b1291-5ff0-414d-abfe-00ef11152590@gmail.com>
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
In-Reply-To: <171b1291-5ff0-414d-abfe-00ef11152590@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2025 17:58, Oleksii Kurochko wrote:
> 
> On 2/4/25 2:56 PM, Jan Beulich wrote:
>> On 03.02.2025 14:12, Oleksii Kurochko wrote:
>>> @@ -160,6 +158,18 @@ static inline struct page_info *virt_to_page(const void *v)
>>>   
>>>   pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
>>>   
>>> +static inline mfn_t vmap_to_mfn_(vaddr_t va)
>> Btw., for static functions (and variables) a prefixing underscore is
>> fine to use. Its identifiers that don't have file scope which shouldn't.
> 
> Should it be used a single underscore prefixing or a double one?

Never use double underscores as an identifier prefix of your own. Only the
compiler (and in principle the library, if there was one) may use such.

Jan

