Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731FBCAC8A7
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180180.1503414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWsj-0001Yf-Ap; Mon, 08 Dec 2025 08:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180180.1503414; Mon, 08 Dec 2025 08:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWsj-0001XH-87; Mon, 08 Dec 2025 08:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1180180;
 Mon, 08 Dec 2025 08:46:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSWsh-0001X0-Qy
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:46:07 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55d6c323-d412-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:46:06 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42b3b0d76fcso2401626f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:46:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7d222478sm23889544f8f.20.2025.12.08.00.46.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:46:05 -0800 (PST)
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
X-Inumbo-ID: 55d6c323-d412-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765183566; x=1765788366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BBORCVuX61x4kUoHG5ybt/Om9wvCAguzN7uvrLPATAU=;
        b=g0ij6wdfGAVKFisrSLMwWxlhFGBXkwKGmNBIgRs6bLh6idtTl/VKzbrb6OIRnz3TY6
         XzGBsLWFlsTIP9cluF9h330Pkh1OPMc3VsyOnE/KR6RwCL8AC525awZGCq+RZw09i7YK
         yirC2dAFf3ZwdCbiOvshr0b7jD4QJTKBl36dC38Mrp7YOyA7W5WLkieVjNgy7cgSmRGP
         S1QxxPCKbILXomQq6NZsHIaI/TkSwRBUBU63EVHC2UGK5fIj1kIwnK2cVxphNBk70LNO
         oEuCvyrMN4g+Npdfz7GvcPSFntql/hQAU0cbFqvA9w1UgJjxy2vJbUV7v8lftFavoRD1
         Kang==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765183566; x=1765788366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BBORCVuX61x4kUoHG5ybt/Om9wvCAguzN7uvrLPATAU=;
        b=odX6S7N3YA2kiN1PDH8dzN+yWpAsgMorJQHxkaGc8BT4ITfvU55wZVbHNBGddQluuM
         sFIUzeH1oubpPcUYVRJnOYsUhbkOvyJ+48d60QI0pUc4wdohSfTQDP66po6PZh7EUZZ3
         RUbv2yvrECpnoxoA7QL61zkJtjrFkDDb81nFiHiQsQpop9EIz+dW4fJrKacSqZX8rGD/
         8cYIJFYvnwLZJuweW0bJ3C2GJRfpE0aVdYmVLmtB2f4I+tMv9lCHun2KYg8iMHYePGjN
         Ub1shnUzY+YPo5hRjTMcbPm3qa3fH+C6A+HlVjnilxKVwnV/DKOg1thnfxSPKk6ibYCS
         oykA==
X-Forwarded-Encrypted: i=1; AJvYcCXgjMTY3milGN8JVNmkX+qINygf7Q03KQrWVL41g+nVzHTW9kuOqgOqXeDK/VIbb9KzFzL1QwYLQgc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgsQmSCJ4dWxABe7SyTer/lqfwCiq9sCaenLqdk9IRtUMzxrI8
	+6+4P+/66YrhTK5lLc3HdD1KP8Sbgyem5rmXhSgzI7CUBx1JonLp+05NIKjris98Ww==
X-Gm-Gg: ASbGncvXraLvfGLw19LNCqclQzWFz49uJYh9GfctrYBN1fz5i+U+9ASoOOeTlu3upcM
	Rtvxv9wE/j36yclPfFQPPf3hUiDMviVXs2rSc7eo799YZW1vUtxfoeKxENqWmVzeFcPlgUOUQIT
	sEm1uX4RQ4jnZrGWnwrtU9kaVtN0PMD/OTeE+EkNsLKmS0d/Fz+KRvVBT96nTWOlWTcfao5nyyp
	Og9WOfxCWoqf/iJr5UnbF+SN498bowkmw2+FrxaYuNbOJA+2y05OV9E5wnYuN3Rb9G+pnDBd8SE
	IxLRoC2KmH8jTjeW5fz0XX7UVAQ8y0+W3nJV9Nr5j9SKdqk6ZrPbCqZTXqgPYsvE8HyhT5LYE9N
	5TDJPxB1wW0yEGclHBZzSIuHb84CUNufDjC+fRpuUfYS4wvQAvifL7MNLKsdtg8cKVODsiGTYAS
	AnlqUahLR9EsqXmyVxIU9zDyw1ZvvrL2wi9CFzQsZO5tgn0/zqPxvkz1gUxDLDSa88ENyZ6yGZ6
	8o=
X-Google-Smtp-Source: AGHT+IEKFsGz0JAPGWv3tnmkvB5iec54susEzp8F3EqRjjmL7aMM6SWfMDdQ9UHR6MCPMcRDUOzx6Q==
X-Received: by 2002:a05:6000:25c8:b0:429:d350:802d with SMTP id ffacd0b85a97d-42f89f7f65dmr7033849f8f.45.1765183565769;
        Mon, 08 Dec 2025 00:46:05 -0800 (PST)
Message-ID: <32f54604-706b-4377-b59a-b287ef1afb3a@suse.com>
Date: Mon, 8 Dec 2025 09:46:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: xen/x86: Enable --gc-sections
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Grygorii Strashko <grygorii_strashko@epam.com>,
 xen-devel@lists.xenproject.org
References: <20251205222813.277164-1-jason.andryuk@amd.com>
 <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
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
In-Reply-To: <8dce8443-5a97-42c4-b867-27b83415b3d1@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.12.2025 23:40, Andrew Cooper wrote:
> On 05/12/2025 10:28 pm, Jason Andryuk wrote:
>> When linking to create xen-syms, add --gc-sections to garbage collect
>> unused stuff.  Relies on CONFIG_CC_SPLIT_SECTIONS
>>
>> We need to add KEEP() to the linker script in assorted places to retain
>> appropriate data - especially the arrays created therein.
>>
>> Something is off though.  In a test where memory_add() is unreachable,
>> it is still included.  I'm not sure, but I am wondering if it's the
>> alternatives somehow keeping a reference to it.
> 
> Yes, .altinstructions contains relocations against the origin patch
> site, which will cause it to appear to be referenced. The same will be
> happening with a bunch of other sections.

We will need to derive helper section names from base section ones. See
e.g. HAVE_AS_SECTNAME_SUBST as introduced by "common: honor
CONFIG_CC_SPLIT_SECTIONS also for assembly functions", controlling the
use of the --sectname-subst asssembler option, to in turn be able to use
%S in section names (available from gas 2.26 onwards).

I'd like to point out though that for the purpose of "x86/alternatives:
allow replacement code snippets to be merged" we may want to avoid
extending this to .altinstr_replacement.

Jan

