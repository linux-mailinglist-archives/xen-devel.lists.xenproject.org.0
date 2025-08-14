Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88037B25FBC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081132.1441257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTkS-0006LD-2R; Thu, 14 Aug 2025 08:55:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081132.1441257; Thu, 14 Aug 2025 08:55:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTkR-0006Je-Vf; Thu, 14 Aug 2025 08:55:47 +0000
Received: by outflank-mailman (input) for mailman id 1081132;
 Thu, 14 Aug 2025 08:55:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTkQ-0006JY-3v
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:55:46 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7701083a-78ec-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:55:45 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-afcb78e70c5so110868666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:55:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af99518bfedsm1578669466b.105.2025.08.14.01.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:55:44 -0700 (PDT)
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
X-Inumbo-ID: 7701083a-78ec-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755161745; x=1755766545; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LnTf488Su1eSM/7x3sWaI2lHpXsPgw9l0g9OWUqSQJw=;
        b=BGZ8ZFqFnRcfvw9aqV59Ta9YjtjJjhRrvrmKNujC1P+pycdR665bPYkXw6BF/2bPCT
         CSihWDAzFkFOeAnj6SsiQheoPlzYx34VoaFxft3cTexXnoIEBxOOibyV6lvA1wlEX0wR
         IWoThe5Zw0fZdNbbg6HbQ9RiZFSxILksh8Fr8qtIcokFIYXn7KJ3bjkFsVmrAswjn3Q/
         O6JTSRn0PFQqQbiWSgDub28NCsxqjSFvIp+QCN4jJmbmMvRzKcIxpRzw7YCPJudvQrJQ
         uPeYbQK71yYvNNHlj/jmL9L5zTOq8CoyKxmzxLnePQtyk8NFkuhQEaLMgV/kfkKoBDjh
         IueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161745; x=1755766545;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTf488Su1eSM/7x3sWaI2lHpXsPgw9l0g9OWUqSQJw=;
        b=bg2zNqkz5Qim4W8pFPwGFNCZKeSzToL8C4YKWowrl9ng7D53q/IfwOcoygRUKyS1ix
         h6ddpVxvSQ2BLohqvvfAhF4V2mTixYjKDW1XsRWBa9oFMvIMAGJDwaliF0Y75UPPCIKG
         tGWqn5amQC+WQSaMG+gG2kuiv1rrskr3mMilGS/rJUvR74okyDTEwe7cV9CO2GW0wHCN
         oo8iBscgOSZ6v9AXmdle4ssMM1vIxRTxzodN2LuzLybVoi1C+9k+IlY/8SldGZlVfmSt
         U79h45/0v5RXdGZsUxQ69qC4CDd8b2JQ/fsQ7XMIVe946efypfaD8SU90Pw86wMFI1aa
         0vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo200ROUCh4fON6+vgQdat/QUH8qhGpoqgbWtpdxpiinsRKSN8zCjIrfFZJX2tEhREZTDOCTRRGo4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPfCFkB+X8J+CGMltJF3UyYVUaHWDFj+dl+XEhrc89bp23pnEU
	KOYQHidxbfqArKt0tr/p6XIoMsJC3baKu8jfFMqyTsKrlmRl2W8yyFlJteDwPwYMLA==
X-Gm-Gg: ASbGncvzFaBlPfO6jr2MCrduH1TBEE6Wpwn1wRLeM8UC57uSVn/UkmuM+tiiucBXUV4
	2UKZwDIj2//N9J3ZggzXffqLAgqFj74r626KgF5GDNnSJRw1t2qFayzSNhzxdFvOHSseDxeI1cg
	UFjmmi6RwLM210XH9Cd7TYGroN0kEcW8//ztg/Ou345vsTZxyrrc8BrSRt9E8lv8+K8H58p+unN
	jI+a+9sq1eRsOLf74JJiB5w5bbQNdr/tDPF33f8qQJzML5OBtlHdy3KAt8m7jgavTSETq+uR3Op
	rrXXGlms/7CcjDPmMOyPB6HzMjKzC5TxJACfBtXYaHPa/eLWyIAWqHGztRKXEh2yEf7yIxJ/8rZ
	yT4kyFXtSO/xJnsMRCIl/C4kYaZg+LXY4Hui0KtpbBTvN4wFq/JRgRWo6oYqzqH0IRfKe4IyPiJ
	/pCuaAguM=
X-Google-Smtp-Source: AGHT+IEAXRLSNPpIJurMnEGwmvYApwNlOq6tDb9Dl0aVYkmeYSgfq1JFUld8MJVKjFypyctS+D1OeA==
X-Received: by 2002:a17:907:944a:b0:adb:428f:f748 with SMTP id a640c23a62f3a-afcb97d2a19mr203119166b.21.1755161744712;
        Thu, 14 Aug 2025 01:55:44 -0700 (PDT)
Message-ID: <8e0b4a82-3189-4446-96a8-921d8ae44a21@suse.com>
Date: Thu, 14 Aug 2025 10:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
 <a4a88d7a-8c1f-4170-a1fe-afafcad0c8ea@suse.com>
 <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
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
In-Reply-To: <9e955bff-c145-4a52-af4f-a7055fc9aa67@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 13:25, Andrew Cooper wrote:
> On 12/08/2025 10:19 am, Jan Beulich wrote:
>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
>>> simplify setup"), load_system_tables() is called later on the BSP, so the
>>> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
>>>
>>> Move the BUILD_BUG_ON() into build_assertions(),
>> I'm not quite convinced of this move - having the related BUILD_BUG_ON()
>> and BUG_ON() next to each other would seem better to me.
> 
> I don't see a specific reason for them to be together, and the comment
> explains what's going on.
> 
> With FRED, we want a related BUILD_BUG_ON(), but there's no equivalent
> BUG_ON() because MSR_RSP_SL0 will #GP on being misaligned.

That BUILD_BUG_ON() could then sit next to the MSR write? Unless of course
that ends up sitting in an assembly source.

Jan

