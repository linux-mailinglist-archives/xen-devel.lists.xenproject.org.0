Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DAC9EE71D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 13:53:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856031.1268789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLigY-0004HU-Pt; Thu, 12 Dec 2024 12:52:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856031.1268789; Thu, 12 Dec 2024 12:52:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLigY-0004Fn-M9; Thu, 12 Dec 2024 12:52:54 +0000
Received: by outflank-mailman (input) for mailman id 856031;
 Thu, 12 Dec 2024 12:52:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QzH2=TF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tLigX-0004Fh-6x
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 12:52:53 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff0ee83e-b887-11ef-99a3-01e77a169b0f;
 Thu, 12 Dec 2024 13:52:51 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3862d161947so258750f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Dec 2024 04:52:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436256e05fcsm15657915e9.39.2024.12.12.04.52.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 04:52:50 -0800 (PST)
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
X-Inumbo-ID: ff0ee83e-b887-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734007970; x=1734612770; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uN3gUeNWduKGh7s7l7BMZRqec9xj6mow4csbPQ3FN7g=;
        b=ahhoG/9PJ6CZT1DP5LbOskJI6pVRVW1MJ9w8Gj/T5zGo5WVRrkTwOU+/XR0rpGR3eV
         c1G+eq0pR3pziXMt/Avsl/FDe9D19wAMtftFmaXc6xfJmKe9ec88RXBGOC9OBkmVpuTl
         7Q0cyG9XVQRDzjqdrYNzbSgv+NEi0H3mQC7VlT5mbRntdZrNWR6NVFiCkk71HpKAxeQL
         GuTYDZOcwuN9ta1kTlbphyZ44N2iSBX8Q8tA6lK21s8XmdTbnj0+obGBaeGjCKgJfqsX
         cO/JlbFujjIlXiusEHMicfm7cIuZsQcZSvNmFH4jrlOm/amR92jDXzVltAd0emTDbn8B
         DyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734007970; x=1734612770;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uN3gUeNWduKGh7s7l7BMZRqec9xj6mow4csbPQ3FN7g=;
        b=vrXLA3bkZCi1o3gR/CIF3W5ReMmGXzmxY4EzDjkXBCMSURWxkwkX5dWMMeX4nC7Fp6
         yRsOQNSvZGBKWdBKbCVNoyHB9nHpt85fUFeB5m2C0bOxuHjZ4Gpwa2kS3o1P7eUw2MqY
         zhi6bHHEHmyhC5r49OJoXVqCiBtQpTlxuV/PH8eZ/tvZZhkLyfE0hnaVi+BW2dnsJguH
         zDB4gzEVyTMp0gGt1Igcp1Ro0/I4r4mpSk99Zbsx9OIIdev8GQwrH0sq6JpRYjSRZK7T
         C5BOpRLKsw6JSh3hSh8mnBe57BkLh334H2eX+saLbRTod4VaeCHZe2O6v84OHGTARFEm
         7Pzw==
X-Forwarded-Encrypted: i=1; AJvYcCW/3kyTQ/FQwPUgfZBJy+VLkfT+wdN3D1Kjy/QYLJxVh8Nv/kUk4TXuRLbLxbd255Er3nB9798cOd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+nUolxnrvbLSygnP/96ReEFSgYj1FB8lzHue9/DYMMko237Xf
	Ro60Z2YYB2uZVvHHp2a8XPtrb95ssAb+Fk7kU3lF5Pb2Y0SI0m06E0FodOV6SAZuWSDJdjWR5Kk
	=
X-Gm-Gg: ASbGnctxgr3zP3sYlEwYhpm4T2wYq+tCxeu5Gbsscc8hzGLBdaQq0MGr2HwU/dEtuRf
	Z1L7Fqo1EjTf0mnqxZwNARvJreTva3B9K06It1qP3HvpGkc6sSp7qBjSoDuVedcayF+GEupFraf
	C+vFO6BMpS27p5A7ovHwqYqb3+TVHsxp3aoc4mf6VEqZ40dXkCIPCBkKAD47R8BWRx5b3lEjEX+
	nqewgol+xc+O5f0MkYT9TgT+3n4aHnsVH3vuro3HYo0xX7Vk/lahkkv5EBtZBAf+s17kY+T+/PO
	cqAoBbmxz111l3NPPDFABnxs/wY/6EeC3jeIuZDlSg==
X-Google-Smtp-Source: AGHT+IGIQ4Y215HfE1p1/3T2tW8yos0+320jQ8SzKctBmtEwcBE+Ik5j+2YDz56OPPP4GQcbm7YwdQ==
X-Received: by 2002:a5d:6c63:0:b0:385:f9db:3c4c with SMTP id ffacd0b85a97d-38787685894mr3003366f8f.9.1734007970662;
        Thu, 12 Dec 2024 04:52:50 -0800 (PST)
Message-ID: <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com>
Date: Thu, 12 Dec 2024 13:52:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: dmukhin@ford.com, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com>
 <Z1qpk55qKBywx26R@macbook.local>
 <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com>
 <Z1rT3lsr9B0dy-Jr@macbook.local>
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
In-Reply-To: <Z1rT3lsr9B0dy-Jr@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.12.2024 13:15, Roger Pau Monné wrote:
> On Thu, Dec 12, 2024 at 12:57:25PM +0100, Jan Beulich wrote:
>> On 12.12.2024 10:14, Roger Pau Monné wrote:
>>> On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Relay wrote:
>>>> From: Denis Mukhin <dmukhin@ford.com>
>>>>
>>>> Introduce new printk() variant for convenient printouts which skip '(XEN)'
>>>> prefix on xen console. This is needed for the case when physical console is
>>>> owned by a domain w/ in-hypervisor UART emulation enabled.
>>>
>>> IIRC the ns8250 can only send or receive one byte (character) at a
>>> time, so you should likely put that on the console as soon as it's
>>> received?
>>>
>>> For the hardware domain we explicitly don't buffer writes to the
>>> console (see guest_console_write() hardware domain special handling).
>>>
>>> I wonder however how you deal with domains that don't have the console
>>> focus (ie: != console_rx), as for those I think you still want to use
>>> the (d<domid>) prefix?
>>
>> Imo no matter what domain has the focus, the (d<domid>) prefix should
>> always be logged. Just to avoid possible confusion.
> 
> WE don't do that currently for the hardware domain, because we avoid
> doing any kind of line processing, as characters from the hardware
> domain are send straight to the console without waiting for the
> newline terminator (like we do for other domains).

Right, and that's kind of special, and aiui intentionally so. These are
the only un-prefixed lines logged.

> Are you suggesting that in case of the console input being shared
> between multiple domains they should all be treated as plain domUs and
> thus lines should be buffered?

No, I'm actually not suggesting anything here beyond perhaps reducing
the scope of this series to just what the equivalent of vpl011 would be
for the 8250 / 16550 case.

Jan

