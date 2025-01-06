Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F58A021A3
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2025 10:20:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865590.1276837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjH4-00062G-AM; Mon, 06 Jan 2025 09:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865590.1276837; Mon, 06 Jan 2025 09:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tUjH4-00060a-72; Mon, 06 Jan 2025 09:19:50 +0000
Received: by outflank-mailman (input) for mailman id 865590;
 Mon, 06 Jan 2025 09:19:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9khw=T6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tUjH2-00060S-7F
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2025 09:19:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f290541-cc0f-11ef-a0df-8be0dac302b0;
 Mon, 06 Jan 2025 10:19:46 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso140815855e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jan 2025 01:19:46 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm526734825e9.2.2025.01.06.01.19.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jan 2025 01:19:45 -0800 (PST)
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
X-Inumbo-ID: 5f290541-cc0f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736155186; x=1736759986; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HQ+h3jmlTLYJDjcZJ5AvWxwIB0eFHQfXJkXX/CkHaVU=;
        b=cJUGVbFNDHFlsbEMtlaU8poMW6LD8UxzKTFz3l5fLRMt/svBQOwm6Lp63ePogkoOom
         q75NSdpJ+XhqTOPiroND/aKD++n+o+GSO9w/KAIUHCpYOv+VI5ytKQsOhzDqnC8CTcMk
         4Acgz1EOswquS3U6YKzJFgR5XTp4UGhdYd/9WgVrteIlhVOyAPW9liz/ayR29SMAWeKu
         1GsZUPBHL7HXUb4608Ho9Ows4zjSzzjJAN0rjh+xInHGg/RjFxI+V/Z8CIOjCKGiTmal
         F050awpYLUxxGE0O5/eseRdRKBv4dtXHtQ04OhX8isYrHMtt/YvUAnLJ0/ov9Yrslpsw
         Tebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736155186; x=1736759986;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQ+h3jmlTLYJDjcZJ5AvWxwIB0eFHQfXJkXX/CkHaVU=;
        b=aOhtY01ITryAsa8NxSJowgOrjS6ajFCdnA2i4J/QrYuY1GDc9DeLAhQi8alBm2cIam
         aS3lNt3Xy8YfNQDG5Xbo1OOSyQdx3OkYq5XXmO0htcHkQwZRwp9T/jRj73ma3kXv1p4A
         emwAeOZgGQkEZ8Pc93IxXvvtzbbRBdyN9erVn9srCOAL8LZMp7A+uOMvtBBlbSf1oygK
         z9GfsBNa6q2n4iws3+xbBpsAjgUgWGq6x+Rp0jZuzFPvo2+DjXfcHbeNjfbnJ72Bx6Pj
         AIHxPUqJkp+Go2X0RojXsHUdAJgOG9XDCMNX+CfSSlunJHbrYKWynXLgzbrPfXxdz+Oa
         oOjw==
X-Forwarded-Encrypted: i=1; AJvYcCVwMDvqOeFkQehx7qyrTaueKeJ6JCNr/z+8nnutUQtQnm/29vkWeT6zFrRohtERDaKTltRBDxNPyss=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzttnO2R++P2IWML5sGkk8m2iNOtMaCQu9wFTXio92D8k9b3gH7
	vMythecw0zsLU8nr1Ay5KcTQtC4awq1eVaaimS+ozVJKJr+ykd7A2T0peg1atg==
X-Gm-Gg: ASbGncu0shICnY4AeeIHHpL5L7QUd/mwJbij5IVnzGtiTDpAUVo8Xw/8uUV6CiqD1+G
	pfSVyTOFbCvb5NY2THWAAN/+xNZE6gCLcjeAPFHpu7JQeCIWIlrOmdOgySJKqZqifkwQwQorTvV
	SFU6I7BCHe+HWSCinS3ggIOPubiUhJdZp+/J/SUAR74KFVr/bQzdVGoSioJq6r2PQNBx8gNQEj5
	ahedxmhEuRXgEqjHuT8udonl8uVlOxf+U7huGFMPNleDZ3xZ7CN5plui3JWWVrmG3EeRZ3CVmT3
	MY8i5AACVCJXtnI2vZd5coOmY/3Tcb1XGF4IH3/KKw==
X-Google-Smtp-Source: AGHT+IEv2C0VwV2IYdPQdFmPKd6CuOgJWQQmjpptM3HA061h1BG+IDfgbQqGuQU0LUE75NLBjvB/6A==
X-Received: by 2002:a05:600c:45cf:b0:434:a781:f5e2 with SMTP id 5b1f17b1804b1-43668642289mr456868325e9.8.1736155186038;
        Mon, 06 Jan 2025 01:19:46 -0800 (PST)
Message-ID: <5e4fb323-0dd1-4eb9-9e83-245ab516be06@suse.com>
Date: Mon, 6 Jan 2025 10:19:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 31/35] x86/hvm: introduce NS8250 UART emulator
To: Denis Mukhin <dmkhn@proton.me>
Cc: dmukhin@ford.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-31-e9aa923127eb@ford.com>
 <3be247cc-900b-48f3-98f3-0d97532ede76@suse.com>
 <DJo9IkTvGXsao_hA4njnkX9OVYVR6tXdo95AeBiT8wGtbPb7UKQjLCqqIset3bJ3JbLqogcIb4wPqNXJ-2GFwyrW_UIvRg5Nt9QhpG0hfyo=@proton.me>
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
In-Reply-To: <DJo9IkTvGXsao_hA4njnkX9OVYVR6tXdo95AeBiT8wGtbPb7UKQjLCqqIset3bJ3JbLqogcIb4wPqNXJ-2GFwyrW_UIvRg5Nt9QhpG0hfyo=@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2025 06:31, Denis Mukhin wrote:
> On Monday, December 16th, 2024 at 7:04 AM, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.12.2024 05:42, Denis Mukhin via B4 Relay wrote:
>>> + depends on HVM && HAS_IOPORTS
>>
>>
>> Why HAS_IOPORTS?
> 
> It is meant to highlight the fact that MMIO-based UART is not supported.
> It is not currently possible to enable the emulator for, say, Arm platforms.

That I guessed, yet you realize that HAS_IOPORTS describes a host property,
not (so much) a guest one?

Jan

