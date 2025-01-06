Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CFDA02169
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:04:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865558.1276796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj1h-0002Uy-BU; Mon, 06 Jan 2025 09:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865558.1276796; Mon, 06 Jan 2025 09:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUj1h-0002T8-8x; Mon, 06 Jan 2025 09:03:57 +0000
Received: by outflank-mailman (input) for mailman id 865558;
 Mon, 06 Jan 2025 09:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUj1g-0002T1-5R
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:03:56 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 27ffda73-cc0d-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:03:55 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385df53e559so11115446f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:03:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8330d4sm46833903f8f.29.2025.01.06.01.03.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:03:54 -0800 (PST)
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
X-Inumbo-ID: 27ffda73-cc0d-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736154234; x=1736759034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0l7vRPBfuuguFIUIDZW5bUWbIXANs8SJ8zLqvL4irD8=;
        b=ZVnIHANhyYNTqHQIGKRS9lDwEmm05Eer8yV3RoV6BW5fPCroOWzl6EsgrHlmQSe7fr
         IqYVQO+AQpH4dE5wdZ5aHMf4hX3oz/Ok4NCmJuzMb0oiNeVTBLTyE/KcyCAdDxt4KBRg
         ig8iv9JUnHRmOF+w0sgcnteJxS8ZngzWBccON6rI3tF9rI1f5NVEWUclfoTVD5J5klYn
         ib6HqAVDURQcUNSNj1MqMpssb0Sun1SyNijp5H6xXLT0UfGHNm1H84WCQdCJrUsULz+x
         lcAnOvao1jcBIf0zyr2NJORygZX10/OPPztEMby42mXfBpLQwx5+UwwStcn5JnN65bYu
         +wwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154234; x=1736759034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0l7vRPBfuuguFIUIDZW5bUWbIXANs8SJ8zLqvL4irD8=;
        b=onADGGWqogElNMch68XFjOMAImhY13Gw2kLvtmSoZd+c/RDA9dtTP6+u2JfVHliJbI
         jfCLYAoP/2zSulsmz8hI5CXBgCG8xQADmwgu5VtWJmr5MRAwPrr9IsVzUYjD6/YX376C
         22AsMQvVLleFTAQs+4KeGcvD7BNtCHLNZHUIIAQaDid4+knzWGgFajjVogy52qJZo36J
         tGEdWXzX4QM6z39Zb1ugWnP04W5JoxGqQgPHSSjC82IhgoFQYkJYsJ5U0Rvh6tiqvFLt
         yNuqwusCytT3KTvVfJ1oKS2Lgcc3xRInNgl0uZnjwqLm3pTmcNCNZYu6a+TDodqhwFuv
         3EfA==
X-Forwarded-Encrypted: i=1; AJvYcCVtUOSMbS08nZuwkZlhI1Zz8j0ILTc3ixqZP3vaR0oTS5GqnwudluIFcRMw6VzJYNxM5pfQn7/Mhc8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8s85VPa8lOnZhhIGvzC+xMdFA1yyIUfEt8YGFvamqLoNcja45
	ziqR67tP9OQbL5zfp5lVr7zuS0KiHktFERGRZcEN33sjC9vVTPDnApq3Yza2Gw==
X-Gm-Gg: ASbGncukIMTRDmuowWiWKjwNoui6WcXYtWeHKPtQa3pPeHGui5SCbBPMI7/u5G2JNPl
	UT1wuYn5dOlqT7mVGd9kyPqAiFGvmwIMhae/L0ALxQ6BrfslpwvyFBAZbfG7AWNRiLn3xr5wD2g
	u/TVfboE09PUhsE37uJRjkE7oVnGWroJmiyjnaAhpQjG+8b7YLwDWngS+okHwqqZFlPUJwuJ5qn
	YfGaLIQY4ew5QTzYPVtWQk5BnlyyNOO7A+1DOK6cW+QgNKRYqtF3K0+EaBqA+njQvzRs7ZTVAyN
	4/4M1mqgB1wkqg/xEg0/jxidemIX3Et20WOXqHJLpA==
X-Google-Smtp-Source: AGHT+IFBBRYXv6HlVP8XxQEH/siKXNMJDfILmPd20jLAFltvKjg3gcMSdTIKeJARbKpRJHNa+c45Gw==
X-Received: by 2002:a5d:5f83:0:b0:385:ec6e:e87a with SMTP id ffacd0b85a97d-38a223ffaf7mr42931000f8f.43.1736154234559;
        Mon, 06 Jan 2025 01:03:54 -0800 (PST)
Message-ID: <5335a9be-4fdd-4b9a-a941-5ab8d3c0829e@suse.com>
Date: Mon, 6 Jan 2025 10:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
 <9c9120f6-6291-43d1-93ac-deebdc222f3e@suse.com>
 <hYzpsKcLLQl-hDLJQHJZSrZtcT5PVx6qx3aKoTyDtH-EYxMtYA9XKavqTvfukRQshSpt9ffdH0MyiqSdglLWtNTSPGduWBOnUbb4DLfityc=@proton.me>
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
In-Reply-To: <hYzpsKcLLQl-hDLJQHJZSrZtcT5PVx6qx3aKoTyDtH-EYxMtYA9XKavqTvfukRQshSpt9ffdH0MyiqSdglLWtNTSPGduWBOnUbb4DLfityc=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 03:57, Denis Mukhin wrote:
> On Tuesday, December 10th, 2024 at 6:27 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
>>
>>> Introduce new printk() variant for convenient printouts which skip '(XEN)'
>>> prefix on xen console. This is needed for the case when physical console is
>>> owned by a domain w/ in-hypervisor UART emulation enabled.
>>
>>
>> Imo it should still be guest_printk() which is then used from there.
> 
> I ended up w/ printk_noprefix(): vprintk_common() expects user-defined prefix,
> while original printk_common() does not expect prefix. Such inconsistency
> may be confusing because both functions are named xxx_common().

Your reply at best partly addresses my comment: I didn't suggest a new name for
the new function, but I rather suggested that you use an existing one instead.

Jan

