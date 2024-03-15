Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 208A687CAD5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 10:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693719.1082140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl43u-0002pI-VA; Fri, 15 Mar 2024 09:41:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693719.1082140; Fri, 15 Mar 2024 09:41:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl43u-0002mh-RU; Fri, 15 Mar 2024 09:41:14 +0000
Received: by outflank-mailman (input) for mailman id 693719;
 Fri, 15 Mar 2024 09:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZGBu=KV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rl43t-0002mb-Bm
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 09:41:13 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 283aa5b9-e2b0-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 10:41:11 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-568a9c331a3so984948a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 02:41:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 es8-20020a056402380800b00568afb0e731sm410668edb.63.2024.03.15.02.41.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Mar 2024 02:41:10 -0700 (PDT)
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
X-Inumbo-ID: 283aa5b9-e2b0-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710495671; x=1711100471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=teJnyWDQr2oaTGWwL+dBcI4Yobw/suAYoMyuPznVkAc=;
        b=DiX/IOMawDU86xF/O6YXCpZp8WWc7JvsGxE9UPrknfpp5Wwk1y9wtIkbyHzc1fQC9L
         0SplM/5rBDD9mz5XsY9MxOIboyKI3/J/0neUaJiPoymuI1Ze1SA1bQvRPllxa+lWOwkW
         8k/vtRo8Tl6LzR7bBJ8dCuOInXifIVIUbSx0KLNEkmIlDoIf6w5Z6e+t6gyxkW/3NXQ2
         u9mGlqKA94ea4j6ReNvpTuQ7aP2kSxxk9Hbo7IfZ6gMahA4LEnCh0/dVCfkNMVAwAIqq
         U0FE0jYi78d/gZ5M49+tOpWgNLSk4pMIz5y3rbFIcuGp9nO9Ubc0ZcGKTEjFrtXv1U7o
         XnZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710495671; x=1711100471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=teJnyWDQr2oaTGWwL+dBcI4Yobw/suAYoMyuPznVkAc=;
        b=aJ6zxCUdtjJ6e6OADPPPIUJAuer2i855PxY8au82B7S+n7CqZk5nJO0fOCojwQHuru
         cGme50KdSoOkLU5cbgjGT/Usf9Axo6RkXIFv8wrqJqDs2M5PIr8iOpAP5b3k+hJkD+Le
         t4vnXrjWFHnpB3sYtTbcAyxmKqvqDLm1JhAAyTqsiRpRiuiGj013XZAIqPE1/gKdvysa
         SiwCG2v1B3+t2qaWQEA0hiT+HbSc944RFeoWJL8tkB5qFk9mSftcIMXGcnoxFacy4UIA
         bOPgRm3I5Iuvgu6KQp3TTfB/DjHDnIJZhZMt55ZBNTgEszBPOTLvGUsW5E3gh2GUdoef
         PD9g==
X-Forwarded-Encrypted: i=1; AJvYcCVbKL0K58sM4I44VxI3LzOdJkM4uGpMi0yXrErAUSdBSId6VEbc88J7PSWvtXvY6xC9YSrU7eRNuEv8xe8eV+dyEigqxiHTFGGDjG7oHhs=
X-Gm-Message-State: AOJu0YygdMpGc1lsB34adhLadLHn9X3YehfWlMlQ72ufxA/nCRrCgkj2
	XeH4nXrYdZSyHQ10hvdczyHm9t1uAJlD54M+4Iva57hulChCM9gw7O4OIe6W3Q==
X-Google-Smtp-Source: AGHT+IGbx8q4GVgXeOD+o0CxbRx07eT9Nw8gmt7lUBAYEvKqMQQplzoJsgzpF0hiBo5P8VCCavkuFw==
X-Received: by 2002:a05:6402:538f:b0:564:dd13:56e9 with SMTP id ew15-20020a056402538f00b00564dd1356e9mr3332585edb.29.1710495670791;
        Fri, 15 Mar 2024 02:41:10 -0700 (PDT)
Message-ID: <6a76723e-ba47-40b3-8f33-d68030b14299@suse.com>
Date: Fri, 15 Mar 2024 10:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: document the expected sizes of integer
 types
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, bertrand.marquis@arm.com,
 george.dunlap@citrix.com, julien@xen.org, michal.orzel@amd.com,
 roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403141516550.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:17, Stefano Stabellini wrote:
> Xen makes assumptions about the size of integer types on the various
> architectures. Document these assumptions.

My prior reservation wrt exact vs minimum sizes remains. Additionally,
is it really meaningful to document x86-32 as an architecture, when it's
been many years that the hypervisor cannot be built anymore for that
target? If it's not (just) the hypervisor build that's intended to be
covered here (the file living under docs/misra/, after all), can that
further purpose please be mentioned?

Jan

