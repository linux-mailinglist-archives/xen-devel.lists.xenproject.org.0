Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356EAE61A2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:58:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023519.1399507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0QA-0000W7-7D; Tue, 24 Jun 2025 09:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023519.1399507; Tue, 24 Jun 2025 09:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU0QA-0000U6-4X; Tue, 24 Jun 2025 09:58:30 +0000
Received: by outflank-mailman (input) for mailman id 1023519;
 Tue, 24 Jun 2025 09:58:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU0Q8-0000Ty-JJ
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:58:28 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5abbfc5-50e1-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 11:58:26 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3072683f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 02:58:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860aa41sm105970925ad.106.2025.06.24.02.58.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 02:58:25 -0700 (PDT)
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
X-Inumbo-ID: c5abbfc5-50e1-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750759106; x=1751363906; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P0Z4tXF+pI0lQ7neKAgB5b8El/84/p5Kvp/v8vWw24U=;
        b=BYXazRE73pxf9v/ZMRiiaVML0ad14Y/jnouD5UVr8rY4tfkki+0ZeD6BbrPiyGqvWX
         QkFcQtsnZxJqpEb0KvB4B022lmepWLOqH5wrNYppJZ0lqS4OSw5QNqR1+NqYFTBIl2/X
         y71r2ZOl0ChkM4yvkCKjWgmuKypAnZO3Cy7oNyYAs/f41fwpD3WDZYPlCVowEzd9hf7z
         KLWvX1FDghxRTLylRo4chx2BvEW8bqVddUrjOWRnXr1VaKVFyQ5cGcwtbN6yI6QDbhor
         LWeQB3nCGJjWn2ePG6etwoWWdK7MBvn/g/LBUkKfTCriJlf99PGvlIp9xtDepyeKlbZA
         QCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759106; x=1751363906;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0Z4tXF+pI0lQ7neKAgB5b8El/84/p5Kvp/v8vWw24U=;
        b=BHhjEh+bPHhEwf2glVsTEXJk9oXA9vwVN4FTYZTH/M0wFlbpyNeRDkgZzUERCwAw1r
         B3MfMbR+Ira22eV0S0C6tCL04pX9mInuVrqzZMuISW7J3bwFsmcW1s9B6vEZKGK3qV5y
         juWWwxn1hDLbx1YoKyOyHJDp8QZofZDnISm0VS9Y8i5NT2r8Y5rkIdv6a2o9Po08jHOA
         IAok+RaPHOjGK9gTLTgRILKzV1qIhhDOlADEzlF9dG8UtnFXcfjvjT975rbLCJzX4GxQ
         YeZMrM+8NdX8YsjsmtYJxEBSZFfynw4wfqU72z+/a5sf5O5WdcFGrKh6L8l33CEeVbaf
         v7HA==
X-Forwarded-Encrypted: i=1; AJvYcCW7mlWT8dNIsSxaMB0e7kkOZLzi3HLdLnfJBxNr5sfIVYOimUYj/x2gJGYCSq3wqa1kCakYgthslVg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyKXX96bS18pdCSxX8+BaJ66RC80+t0bMTVju3LuyKIiiK9NRLN
	RLzqjt5BObMXICDbcDFbZwwFq5DhsrZAWBaUwMZsipgpbe2nBhbnTvExITKnW8/8OQ==
X-Gm-Gg: ASbGncsmzHaQpz6CgLVpARa3gfHCb7/SfrwyDEW3SzgV9MdFupCuTLR2qxGklbzePYm
	TacXwWAJ5QP+29pxOIr8aGVSmrlJ+uhGGL7MT4o22eNTqRbgSMHeuL2xkpoH0yh9huBoWUy+5Zn
	7VaX/LWFcAQhf8A7SIx842+U5jiG1OZ+FMyvCfyCZ91wZ6M/g/SlmY3SXB8G5he8lUnnlSQmmyF
	TCevde65O0dcrzewmgNQzHAG8QrnuEsnG9FKPeUg+m6/Fepm0PO9rod7kGVKHTcW9qQ4ZeMFym1
	Y63+8BuvjPcWe8G3jlkSl2PndlU/7zzweYtGiOu+wqVg9pEXKvTpO0ydriNqJKuc8RkpVLIVUBj
	84MVSSVzridiNM+CDTNyekyT07Xk6WakYGiB9BRsa8M1LJMY=
X-Google-Smtp-Source: AGHT+IGvlxKgm7jPYLqOCXKKRmgk7n2rA2UgnPkH8J6u6epstKKX4KPtBDiDVqyN3L40PLvmJAFfLw==
X-Received: by 2002:a5d:5850:0:b0:3a5:14e1:d9ec with SMTP id ffacd0b85a97d-3a6d12e6386mr12553562f8f.51.1750759105736;
        Tue, 24 Jun 2025 02:58:25 -0700 (PDT)
Message-ID: <5e0c7bc4-13e4-4051-a65c-8ceb5e3b6925@suse.com>
Date: Tue, 24 Jun 2025 11:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/char: wrap suspend/resume console callbacks with
 CONFIG_SYSTEM_SUSPEND
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <07f047e4a3640696e46c6890d3826c03d4f28856.1750756537.git.mykola_kvach@epam.com>
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
In-Reply-To: <07f047e4a3640696e46c6890d3826c03d4f28856.1750756537.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.06.2025 11:31, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch wraps the suspend/resume console callbacks and related code within
> CONFIG_SYSTEM_SUSPEND blocks. This ensures that these functions and their
> calls are only included in the build when CONFIG_SYSTEM_SUSPEND is enabled.
> 
> This addresses Misra Rule 2.1 violations.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


