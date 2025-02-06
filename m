Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFC0A2ADF4
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 17:39:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883035.1293122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4uF-0005k9-Lw; Thu, 06 Feb 2025 16:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883035.1293122; Thu, 06 Feb 2025 16:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tg4uF-0005iT-Ij; Thu, 06 Feb 2025 16:39:11 +0000
Received: by outflank-mailman (input) for mailman id 883035;
 Thu, 06 Feb 2025 16:39:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TFaJ=U5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tg4uE-0005gq-9Q
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 16:39:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e34121b8-e4a8-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 17:39:09 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5dccc90a52eso2141748a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Feb 2025 08:39:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab772f485dfsm123048966b.28.2025.02.06.08.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2025 08:39:07 -0800 (PST)
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
X-Inumbo-ID: e34121b8-e4a8-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738859948; x=1739464748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4sV9k+175k3msximi4JJcT6AvrgKCiG9eiTcKyYco+w=;
        b=cg0be1Fda9pVgBpuHStIoVheAqraW7ARjn3/xH5AplgcABg6yM6/BQ3o6K4eN9Qtjh
         QyJAKi9/xvl9C8wyUpyyuR7oq08X7NreZ1OlVYXoNoYbek2BqB0j5FFy+nzyadvsjkIc
         Mfvf2YyBlvRtnYxm1UxpxuG4XGGHIf5k36OaukkV6UiXMd+wdNCSlz77K0mXOADlxwiH
         xF42NOh4lUql1SmJKFDm0woJGsaDSAM0GPn9vZ+xeZNvcFnRenK/nq36QmMLcq4WMLDx
         9kGcNdxa1hPk/CpvMB2v5Aixo2pGCFmCvRmOYFjsunOmnv1SKUeoksb2IZukZwXAGvvZ
         Lqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738859948; x=1739464748;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sV9k+175k3msximi4JJcT6AvrgKCiG9eiTcKyYco+w=;
        b=cIuYDWkay98iON2AiFKcQ073cez8TLlZw56H3UVllR4PLcAjwns6yRCY/v7a5cB8Iv
         GXQb3TEaz0oTO1TYzH2jvcgeP1QzrXj56PNcW1QICQ7oKvVsBeMK5bZ8FfVUo5PjZOLJ
         5VKSQ3NTCxuy5t6zm9xjeReADjqMbDvT8mLtzUgPZ8kmaGeeoGLTrdhcr9kZ4TLwJjyr
         zCycmWPzHZlgSe4O18j6vewqdtuHmUxly/IT5pE0OXmK+G9teALaRJ8Z5C8hWJ7pQY5b
         fKA8jYv6D8/XXoH1KQ1uBNoVJe8ZjUKiDNDciSjAo7xz/GNyu5a8jsyLFrzL8O7OcD0X
         hHMw==
X-Gm-Message-State: AOJu0YwzWkmm5KO+4ovRiu6d8OaOAA3AuJadJgslZb3Be9rNCpvaVNFT
	y4h9jtX8uPwBCC5kZ4TYyJxfnNi4yojNfJ7Ez48Jusyh9MgtSxvb/s6902n4yw==
X-Gm-Gg: ASbGncvCh6IF1sZFAsmLKwDWMXxS76fcBAQr52eXRCcPGdPWJaZ+hgPD5yelCCZcfZn
	kOhOZrSFHMyG7TakM9CU8Fdy6iH1/nMlzhezAc4l8YCx/MlVh0drzHI1QC3hbheFIknU2uwhb1V
	6jDOoN35JjiikshIj7ZunUy0v0ppSJDSzhko2cmaqkyzQ0cHAoupxYVo4iG6sLM6aQ6oQet+FTY
	0LKdRURe4SiRC7dvIbqVHAQwYrHcOXJ6N6fIoJ8by9sf5XDKS76v/xUFJaE7a39EqfimPRl+/Wf
	VyJMLo1eNCpzT4shuyyAc5zF1gCyT3JRvz8yznZYNQahaYFaiDNb4HmzSYSmnKExzD2Aw4p0gXQ
	X
X-Google-Smtp-Source: AGHT+IE58PAkOvqkcNPmCxj1nnMVAl+vETxQeLKtsKe4rhguKXu580MKQ5Ir3bVVCj7V2qom9nhEaA==
X-Received: by 2002:a17:907:26cd:b0:aae:b259:ef63 with SMTP id a640c23a62f3a-ab75e261a2cmr1046277666b.34.1738859948480;
        Thu, 06 Feb 2025 08:39:08 -0800 (PST)
Message-ID: <db3edc3d-5d91-4c6a-8b97-52048df9e800@suse.com>
Date: Thu, 6 Feb 2025 17:39:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: xen-devel@lists.xenproject.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Conor Dooley <conor@kernel.org>
References: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
 <20250205-chariot-blandness-7e9a791f7f34@spud>
 <585eff97-af33-4bfd-be10-fdacbb9b9069@gmail.com>
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
In-Reply-To: <585eff97-af33-4bfd-be10-fdacbb9b9069@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 14:05, Oleksii Kurochko wrote:
> On 2/5/25 8:07 PM, Conor Dooley wrote:
>> Yo,
>>
>> On Thu, Jan 23, 2025 at 03:46:36PM +0100, Oleksii Kurochko wrote:
>>> Supported ISA extensions are specified in the device tree within the CPU
>>> node, using two properties: `riscv,isa-extensions` and `riscv,isa`.
>>>
>>> Currently, Xen does not support the `riscv,isa-extensions` property, as
>>> all available device tree source (DTS) files in the Linux kernel (v6.12-rc3)
>>> and DTBs generated by QEMU use only the `riscv,isa` property.
>> That's not true? The riscv,isa-extensions property went into linux in
>> late 2023 (6.7 or so) and QEMU in v9.0.0 about a year ago, so all source
>> files in linux and blobs generated by QEMU should have both. OpenSBI &
>> U-Boot support both also. Might not affect your decision about what to
>> support here - but the rationale provided for implementing the deprecated
>> (per the binding at least) property isn't accurate.
> 
> I confused something with Linux kernel sources. Double-check and riscv,isa-extensions
> is really supported.
> 
> Regarding QEMU, at the momemnt, Xen uses Debian bookworm and the following version
> is used:
>    QEMU emulator version 7.2.11 (Debian 1:7.2+dfsg-7+deb12u6)
> 
> I will update the commit message.
> 
> Do you ( Conor and Jan ) think that it makes sense to support deprecated property?
> Or it would be better start to use QEMU v9.0.0 and just drop support for deprecated property?

Unless there's a guarantee that all actual hardware we'd ever run on would
offer the new property, we might be better off supporting both. In no case
should we take only qemu into account, imo.

Jan

