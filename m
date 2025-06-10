Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D6EAD308A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jun 2025 10:36:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010606.1388747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuSh-0002o0-9d; Tue, 10 Jun 2025 08:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010606.1388747; Tue, 10 Jun 2025 08:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOuSh-0002ma-6W; Tue, 10 Jun 2025 08:36:03 +0000
Received: by outflank-mailman (input) for mailman id 1010606;
 Tue, 10 Jun 2025 08:36:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6UIy=YZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uOuSg-0002mT-Fo
 for xen-devel@lists.xenproject.org; Tue, 10 Jun 2025 08:36:02 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f067370f-45d5-11f0-a306-13f23c93f187;
 Tue, 10 Jun 2025 10:36:01 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-adb2bb25105so823979866b.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Jun 2025 01:36:01 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b49b:5992:e13c:c106:5fe0?
 (p200300cab734b49b5992e13cc1065fe0.dip0.t-ipconnect.de.
 [2003:ca:b734:b49b:5992:e13c:c106:5fe0])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a5323b4e2fsm11631311f8f.36.2025.06.10.01.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 01:35:48 -0700 (PDT)
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
X-Inumbo-ID: f067370f-45d5-11f0-a306-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749544561; x=1750149361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1QwM8MjnnqQa6IzvTFhZa2Yfu4mvxmSyGlKAuPxVIBg=;
        b=dHP5HoNmIRVZnwkYXFGjAhyK92mNR1JRZzpsa6/6ZpNrhq9HO/F1yRiJeDEwmPgR2U
         03c/OiIdnLqb+6Q/OAdGeyFzDLhsfKqUczcSQQkt+nj5fLRp3K4iKDqRGXSwhyH7FCq/
         I4zVtqQ1frzDtot+jFHim+ttXI1ZL1JsSXSOvRKqSAKeld3LRrYFjXUVOMSs2Z483r4N
         2oRohiBk80KaGf6HLLGHXWtFI1u7FrZLUUn4fo+4steiIef/stzXqxu7CAnD3z19I0p6
         3qyJAUN/WnwGSBMx246COqQzwTiA5xhN0EMshHDRwo6Dw1UO6mZ3/S2CwqWHZYdQeEU2
         fzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749544561; x=1750149361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1QwM8MjnnqQa6IzvTFhZa2Yfu4mvxmSyGlKAuPxVIBg=;
        b=vXRQBBQ34lv26rlpIm1hE3DhdYVBlzbkiSG6H44B+7/p/CmbXQePZKH85JfpEGDz1Q
         8W+N3qyLpDNWOdw5GXJervM7FjRehIBgHp3iUDgcCfpabXcPFS1kXJdRXp9liaIeAIvK
         rXS9OtM+lLAOWIsD9OkPD4DIY7CH5KGuuxMzMzf1jm3EGLx1s9zT41ilndHAofxNSRto
         rUKLx0rgEGE+Dj+wvek8ZzqLQMqBhM/KwYzsqJXtJByYIoIHT0LQ7xsdMAZ5C81sivnH
         eBWj4ltMu1YvOfetdpmLQtl7V4jgyGVeR7PvATrpWxlbp8Qji3NhjeA3uvDfwMk//9r8
         Yfjw==
X-Forwarded-Encrypted: i=1; AJvYcCWqrRCJItyr1diUwKM4pGkEWj8+JYdDLfiwI9ShYoRk8tbvvpexNaNKR+Eyt/iOLZeFrmdayDYUcGg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZcaLhmJXv8dLP7y1ukpLn5ibweWoESmsNGMvsvLSaPIG5xrlc
	N6tUG2hopdOYYgbOjueoZ6cLbcz0M2vZbDP9L0uYrO1TBH+6796fxOBju5i6Jj8uwjo3rYzgmnI
	evvI=
X-Gm-Gg: ASbGnct0GC2SeCEd9mJhPETWIE0tpghFfcuJZm/c8aizKu9a1DI7EWo/9HLzW29qgxC
	yFi80VPeyLqTg6dTv4Mg1ylQWv5KGpVYFsCEMLIPcw6FIgAgLictF23NtRJPAq9HYCUyvGKQRVE
	JiAY++DzjSsSlW0brM0TVGBYY2KtZfrpHMSDMOPSnERkFfb9A2DOKYIzWqXJVOcoYeJo7brhsA5
	Xxf4sdtoKNJES5wTGWzJck3pJ5dCz6KL7obU93vUCfMUc+T2MiVXkk+VtAGd2FOEyO3CfDY+qDy
	rIjKVcevNP9iESs5pNPWW/sOqfJuL67Ua3nHonPPwWJV2MP7WEf6YjE6VCFPxfCJYJ/rS1ypC3S
	8D1LDDzzn51K4VtnbqFuWFGC//JGflHJVfGcZokT7bCueIwobcmOl9EwK2oMv5/LM4O9MceryHW
	EUOIC+X6aQzuxBWCMjcu8v
X-Google-Smtp-Source: AGHT+IFgK6+UpEs/eU4CgvUrfc5FBzjbHttoZA1oAmLu3QByXWhiKQ8l55KLc/fbaoHMWQePalIfbg==
X-Received: by 2002:a05:6000:40d9:b0:399:6dd9:9f40 with SMTP id ffacd0b85a97d-3a5318823bcmr13074382f8f.9.1749544548529;
        Tue, 10 Jun 2025 01:35:48 -0700 (PDT)
Message-ID: <e2575351-851c-4d10-a1ea-cd63f086b42e@suse.com>
Date: Tue, 10 Jun 2025 10:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] xen/keyhandler: add missing noreturn attribute
To: victorm.lira@amd.com
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?B?Um9nZXIgUGF1IE1vbm7Dg8Kp?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20250606212712.1901838-1-victorm.lira@amd.com>
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
In-Reply-To: <20250606212712.1901838-1-victorm.lira@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.06.2025 23:27, victorm.lira@amd.com wrote:
> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Function `reboot_machine' does not return, but lacks the `noreturn'
> attribute.
> 
> Functions that never return should be declared with a `noreturn'
> attribute.
> 
> The lack of `noreturn' causes a violation of MISRA C Rule 17.11 (not
> currently accepted in Xen), and also Rule 2.1: "A project shall not
> contain unreachable code". Depending on the compiler used and the
> compiler optimization used, the lack of `noreturn' might lead to the
> presence of unreachable code.

I continue to be unhappy about this: I still fail to see how this
"might" could materialize in the specific case here. My earlier
request for commit message improvement was specifically about making
the description match the particular case, not to add further general
wording. That said, if others feel like ack-ing this in this form, so
be it.

Jan

