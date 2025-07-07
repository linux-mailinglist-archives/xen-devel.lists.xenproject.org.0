Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ADEAFAE58
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 10:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035303.1407532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYh0j-0001qX-OV; Mon, 07 Jul 2025 08:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035303.1407532; Mon, 07 Jul 2025 08:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYh0j-0001oX-LJ; Mon, 07 Jul 2025 08:15:37 +0000
Received: by outflank-mailman (input) for mailman id 1035303;
 Mon, 07 Jul 2025 08:15:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYh0i-0001oR-7r
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 08:15:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eb3c7d4-5b0a-11f0-a316-13f23c93f187;
 Mon, 07 Jul 2025 10:15:35 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6cd1a6fecso2745642f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 01:15:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23c845b741asm85340205ad.233.2025.07.07.01.15.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 01:15:34 -0700 (PDT)
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
X-Inumbo-ID: 8eb3c7d4-5b0a-11f0-a316-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751876134; x=1752480934; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3EJKBd84JF2a8xo3/hd4yBFkjq0l+uJxW3L1Ns812Zc=;
        b=TgqT+tdF9dMscpKqv9smvNAM0QrJzqr2lDQe7D7rIdzzPdG147vcpQEooKQCqtq6rJ
         WOSQVpmQNRB/OOi+5RQSTw26a93Oy3HLweI0HyaIjjldYDPcXIIUuOHK+FWg+MFEXe5B
         CfQRt/P7YBNG31ot0Vjuk+VKsgS4CJmicBv3ylD81aCdM+jNcjmNpxW+53khXBpbWFMe
         pKyNWBNVxdg03k0AwaHovdYNGVG7I65h3QBGE5RB7hOucXohHS3yXgp/1qeI5A1R0xDn
         s/7GLXRhoft10xxDF3p86vXzGpZs/7V9aq7OrQM19+8wldTUSLKtbFEKT0/et9m2gTGD
         OeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876134; x=1752480934;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EJKBd84JF2a8xo3/hd4yBFkjq0l+uJxW3L1Ns812Zc=;
        b=tWch/XZaguuK25ehr2qLVTzSZQNm/pCJd2H+y5StTFOD/9Nb9dZMgYJj0OA2z8Os6g
         f62HcU1+WykLGY9OEqdd8URYHWfrYutXIa3y6kpAARUDz/hYnO+MaYrC/gJlOSCzzovU
         oYICyI3WZnvNwSOBAG706/yuAh43mcJOh8xvLXaACLhAPWiOfM8l5xKGQ8L+qElvySE7
         7RmcTL+56NeMcsvYgnnr6SNnBi4zVOOlltMtw592JYLkKa6p5bXeW8o/yR9DynQquxq4
         Y6uuDeqKOHzMshhDmDDI/Cwigq32pV6FvRj9mp98clpF6A3yfCKJ4MSII76zQrUxbf+i
         R80w==
X-Forwarded-Encrypted: i=1; AJvYcCVEQRE9LcsxP762Pw2pfoFWSLvC17lKjzhUPi+cVKDnQbyw3YKIQUMjCNtp29IXqHinWsieOTByy7Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJ5ii1IT0M7F0K1Mwl6YsjyFS/q13dXt5V3FQNLeaEq42Z7nzq
	S9qdXup5/XkQDXQnOs8UKWv+zmINfprEJiGXApGmTT6buXX2+aliBlywNYpNoFGx9FO3yf4kBad
	VkTM=
X-Gm-Gg: ASbGncsNsJi/uc/OppKz8aB7CfqdK0dlfhTQ+C323xAv14Ct05K9d1NjBfP8Hmae3Q/
	N3lFLfwjf9fTAsgc788KEBGf/JADbls1pfxbGjmKwd+bSYSzGMkRvLpNQ7c41zhEFwxcgkzfTY2
	VaQUYdl0743pVNJMJ6bG5UobdmKAcP9yZqFwtSYGH/imKpTbtYyU/EWO4eyGfg/JOKW3x7UMbGe
	iS8Y8cwyqgdvDq8YvzMUmbmu+HOxBoXFlG882pB6VLuaN+H7rW59klYKvObSpy3e57MqkmaMHzz
	v71bCkGRXJRcaMVZcc1hQg9zXiXsOIIvpuB6c7uXZ4es0aSL4ntiuPLUYYZjNa5XRpHwS4Ykotw
	M222LiVnkIMV+qmnFIue/EWYdmM4722GbdrBGbzHESN3u3i0=
X-Google-Smtp-Source: AGHT+IFOrCmvMD4rBOrN2te0aosNxc9T51pOOMtZuF/yZBXCgdhLq9Qe/p5lFMWan7agRs6i2ukTUQ==
X-Received: by 2002:a5d:64c9:0:b0:3b1:9259:3ead with SMTP id ffacd0b85a97d-3b49aa73e31mr5037410f8f.28.1751876134556;
        Mon, 07 Jul 2025 01:15:34 -0700 (PDT)
Message-ID: <70628c7f-5d9b-43d2-8fc6-da79a62d2fc2@suse.com>
Date: Mon, 7 Jul 2025 10:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] x86/irq: address violation of MISRA C Rule 5.5
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1751659393.git.dmytro_prokopchuk1@epam.com>
 <0e289fdb9187902d59dce3fc7368facf5eafa2ff.1751659393.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <0e289fdb9187902d59dce3fc7368facf5eafa2ff.1751659393.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2025 22:39, Dmytro Prokopchuk1 wrote:
> Address a violation of MISRA C:2012 Rule 5.5:
> "Identifiers shall be distinct from macro names".
> 
> Reports for service MC3A2.R5.5:
> xen/include/xen/irq.h: non-compliant function `pirq_cleanup_check(struct pirq*, struct domain*)'
> xen/include/xen/irq.h: non-compliant macro `pirq_cleanup_check'
> 
> The primary issue stems from the macro and function
> having identical names, which is confusing and
> non-compliant with common coding standards.
> 
> Change the function name by adding two underscores at the end.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>

I'm not going to NAK this, but I dislike the transformation done. The aliasing
in this case was intentional, to avoid any caller appearing that would bypass
the macro. Yes, the double underscores will also stand out (as much as the
parenthesization that would have been needed to override the protection), but
still ...

Jan

