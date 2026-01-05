Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161BECF4A45
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195610.1513540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnKJ-0000Gu-35; Mon, 05 Jan 2026 16:21:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195610.1513540; Mon, 05 Jan 2026 16:21:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnKJ-0000Dp-0K; Mon, 05 Jan 2026 16:21:03 +0000
Received: by outflank-mailman (input) for mailman id 1195610;
 Mon, 05 Jan 2026 16:21:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcnKH-0000CR-NO
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:21:01 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85dcbb0d-ea52-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:21:00 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47d3ffa6720so968245e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:21:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6c0c148bsm59048055e9.18.2026.01.05.08.20.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:20:59 -0800 (PST)
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
X-Inumbo-ID: 85dcbb0d-ea52-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767630060; x=1768234860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6jShIZmeIibAp/iblNc8xKCcRTgXVm3tEsNaObNaPks=;
        b=SG08rxz4mGwrwSupOGsarg4yfSU4izsY6I1FP/7LqwrdmC6jGXuhagx/eoWLaLW+cy
         aiZl5c4RcPdkz9waCbOOVruoo7m8GyZ/ghiMLuTVXd9m4TF/jX8M4IYXlVgQZh2bAtZw
         QZFLcs/PXgZwr3WQuAIJvoBNlBkr+SmtO0iZM1/HucmNUrTbNLpLOGXEyHvCSd+eTa2g
         aiHZnzQ1/7xWM0l2r89VrDndGkdvTIHDuN/Uk9YVhTZr7Ne9adsz+DQTCmJ4EeMWNcpx
         d3s3+L3hOlh7loxTkxgfaQstfYGVnciXjjRPRY1ZHug5lp4Rd72QyRvhZxB32NW2So0l
         DXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767630060; x=1768234860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jShIZmeIibAp/iblNc8xKCcRTgXVm3tEsNaObNaPks=;
        b=Bv2/aTJbHePthqGTtHZElYmVt99RRB8/QpOS+kka1k9Tc19bP56QXEePpm9JFCaSTn
         2m5PinlqwHL8RuAeUqzKSsNQH2FQ4V158tF0H+ohQZqYMLcJP8bGKBSkf4YAzoLjnl2P
         gCekHeDXt2DXoxpoATHBw5GZV06pXXqLuYA7ULbMWX1mbxvDR+FKxysYBbRlD4jy/Xqx
         8G6cyWypg9Cqvht7VW6s4oqNCUVL49gVxOXoiLJX3wSrvgLv2CfDqJzgWERkB+SlbHBd
         Eq0AIu299y59GE9VaGwbPhirFrTopQXImQOhfgPWyRdbPrJPIjEJZNzLrnhjoTGRaBff
         ALcw==
X-Forwarded-Encrypted: i=1; AJvYcCWuilRJ+ZYpA0d0ZBAOMMrB98Xk59iB5Yv/x3H57DGqjzhb8sv00E55EngYDXrvWWUJyj21GhYcUMM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSQtVsJvTKA7GZWH0yunFY9v/ZPaAuskgv+awN1ve6U5EuEtv2
	AJzixqAxvyR6rhJO83LddPJO69vMCQJB8wvSY1GpJ5iIXU6z1V+sUfbVpRUNo/U4Yw==
X-Gm-Gg: AY/fxX7N9qOzrWVjkoVk4YiBFhv2NkM4Viqm7OX+2Zp279XqTtacjoJm4rUelvy76k7
	18I6O+Z6y5BZNphYvBXPOBw9SqJRA/bK0dDJzC61PO5C8nc48WRWHL4qN+1IBZTsTHhUXR8btUk
	MW3YuXTlx+0N8OkvSmEgTl+BtX+jJua/3pt8+M+ia37sqB/Z6CDfZdvQmklO6szSyw/gYbUYF1n
	Kk5wvAEaoaqLRYDPUw3wWLNDeP8b0SysUQupqqUoD9UkqQQxmBrFLKqL6frLYuQC13cZJLLekAY
	pHqSOSTCvDutSv3KVGZrEf09fyqiEOE2f3HeDDws5/IY35T407/uMEA75WcGkT3Cwhe/mhi8f3F
	WsPYLoosz4cihYR0aSPH1LRxsIlQl11kw8mCGsIcmX75wEH/MtP2ufiRw3+uOQ6ruiBTdFTTWXC
	ihZ0sDvLjeYwbaT/eQS+vhstuWlsvALJ0dpD3xIDv2Sdxe0IEUflxvVcquYU85PYz+VXKNFL6uo
	vY=
X-Google-Smtp-Source: AGHT+IHC4/bjaxk7rbgEq6X3hbUtdI6NFGo7WESuZAuGb8yskDUM4VmV8+pr9213AOk5vrQzKXyhZg==
X-Received: by 2002:a05:600c:c041:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-47d1c0360b0mr450664335e9.26.1767630059803;
        Mon, 05 Jan 2026 08:20:59 -0800 (PST)
Message-ID: <4645c4cf-6ae7-4ae3-84d7-6cf00c49d113@suse.com>
Date: Mon, 5 Jan 2026 17:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] xen: Move x86-ism out of muldiv64.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135050.188191-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:50, Andrew Cooper wrote:
> Having an #ifdef CONFIG_X86 section in a common library is rude.
> 
> Furthermore, for x86 the main logic is 6 bytes,

If both insns' operands are registers.

> meaning it's ripe for
> inlining.  Create an x86-specific asm/muldiv.h implementing arch_muldiv64().
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

