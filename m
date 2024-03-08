Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F7875E6E
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 08:26:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690124.1075858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUcZ-0008Fv-No; Fri, 08 Mar 2024 07:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690124.1075858; Fri, 08 Mar 2024 07:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riUcZ-0008Cl-L0; Fri, 08 Mar 2024 07:26:23 +0000
Received: by outflank-mailman (input) for mailman id 690124;
 Fri, 08 Mar 2024 07:26:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fOiY=KO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1riUcY-0008Cf-4s
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 07:26:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28a2e7fb-dd1d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 08:26:20 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a45bdf6e9c2so210683366b.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Mar 2024 23:26:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 dl7-20020a170907944700b00a45f39b2d16sm89600ejc.200.2024.03.07.23.26.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Mar 2024 23:26:19 -0800 (PST)
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
X-Inumbo-ID: 28a2e7fb-dd1d-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709882780; x=1710487580; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uTWcfXJrYzYS20fiF3OEBcA73p13jR931MWUyarmd+8=;
        b=YLWjM1k43Dmu/Rzm/cfU6gviVBLprevUUZN3D+cwrTf0o7sLAYWAKETY+LKr27ei65
         GSqGDnBBqGjYdXLzrfjNF5zl10bEUhFd9XkP82ZYDaIZyF6le6kAViBVxxeYd3D0KFVw
         UccEUpQ375daYgodswFy6kSAGGluErLPAYOfC8/cj6FozqJugXA0reZAvf6/uYvCUtXK
         Glja7orXgFY9kCHKrkola7eSX3pDX/G3ux79ROWzuOPEouoeIONb0Cr0OcRUWlX4o7Dz
         XbRvwLdqhDXzIrvd/13lcCOzLuD2aicFC58cV5QpezHfIw5QlhcGhsPk6HuThFwGwrN9
         nxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709882780; x=1710487580;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTWcfXJrYzYS20fiF3OEBcA73p13jR931MWUyarmd+8=;
        b=KZqJ9c+JTBKPnS+198vf6TjRIye4OLLqApB0XELcwUGmlmZ1td+01InfmP8UMwaZ6Y
         XGbe5uRfL9+wyrYm4GXXXQzL3b3q0QDpVXJ/bjuzxbmtCkrOQfE4kWj/bdFOMo5K7KX2
         9vGuYNu+cbpL1YIK2h+ltHNCBV4LPSoJ8ADauPWrlR2MwYMm2aoLTU6Ic6gO/OK6WHVM
         sRJhaVEj6PcPokxjhOj7/M3mzljDBvJdjq2RZSTGrdRoORkof0bhpc9fMHBu4irmyAz5
         QONbJoRFav0R+/8+qfZAviUyMPU0LycL4d3ySLv3lLFDvOlTZVHb36kHQR7qPO/+mlIN
         aURA==
X-Forwarded-Encrypted: i=1; AJvYcCUEX+FXBuATYTVNPDBDm+8tuOn76HTyKHMW/Bm3e7j9g5ZjbgKcCESqSJcgoXPYWjn2B86sZb5YDGVK/j63XxBMwKnbOLlL1lImizyVCJg=
X-Gm-Message-State: AOJu0YwuAyFmWXfnqb7I+40eatpA3PLH4+2Cg2hHH5Etik7+0D1C+/bY
	np8aHDX1PdQntDT3w0gMhPWO7LpW5nDU6XqPpSEkTI3axPR3QZ5q+ljNSxjW9A==
X-Google-Smtp-Source: AGHT+IHA8ulfjCOmXk9YJlfxOprdM0oT+hgSeYyia3ycXFOHD3gEbhv6SDsKzyWHGqQ/6pqIlVxV/Q==
X-Received: by 2002:a17:906:f0d1:b0:a45:a448:b08f with SMTP id dk17-20020a170906f0d100b00a45a448b08fmr7493101ejb.54.1709882779680;
        Thu, 07 Mar 2024 23:26:19 -0800 (PST)
Message-ID: <82375df2-f7fd-43a1-9183-f4823fe791ec@suse.com>
Date: Fri, 8 Mar 2024 08:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/23] xen/riscv: introduce io.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
 <807c31d5-0c5a-4646-ba90-2f284289069f@suse.com>
 <d047c0956f804f7191f91b1d690650e220ec0fe4.camel@gmail.com>
 <a164230f-2054-47e9-b72c-51f4a5955fe0@suse.com>
 <2a3e49bf94332c17b50e4f0f745e4b28b16dceb1.camel@gmail.com>
 <2a05c233-b3c5-417c-bd6b-8b1c21f03c3d@suse.com>
 <e51500581bb71ef9cc2879050e2577802a5dd14c.camel@gmail.com>
 <bbd4ea96-565a-4843-a4fe-fbbc714ddbf6@suse.com>
 <9ec718f3bba178d437035add3c7467011fc3ffc0.camel@gmail.com>
 <d3eabf773211defb2f8a9a22545fca5c7cf3eca1.camel@gmail.com>
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
In-Reply-To: <d3eabf773211defb2f8a9a22545fca5c7cf3eca1.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.03.2024 21:54, Oleksii wrote:
> On Thu, 2024-03-07 at 21:49 +0100, Oleksii wrote:
>> On Thu, 2024-03-07 at 18:14 +0100, Jan Beulich wrote:
>>> For plain writes it should at least be "=Qo" then, yes.
>> Constraints Q is a machine specific constraint, and I am not sure
>> that
>> it makes sense to use "=o" only and probably it is a reason why it is
>> enough only "r". Does it make sense?
> Probably for RISC-V can be used:
> RISC-V—config/riscv/constraints.md
>    ...
>    A
>        An address that is held in a general-purpose register.
>    ...

Just from the description I would have said no, but looking at what "A"
actually expands to it is indeed RISC-V's counterpart of Arm's "Q". So
yes, this looks like what amo* want to use, and then as a real operand,
not just a fake one.

> AArch64 family—config/aarch64/constraints.md:
>    ...
>    Q
>        A memory address which uses a single base register with no
>    offset
>    ...
> Also 'no offset' explains why it was added 'o' constraint for Arm
> additionally.

I don't think it does.

Jan

