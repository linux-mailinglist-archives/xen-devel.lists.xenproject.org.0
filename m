Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5704B353CE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 08:08:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093913.1449283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmqU-00033z-05; Tue, 26 Aug 2025 06:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093913.1449283; Tue, 26 Aug 2025 06:07:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqmqT-00031G-Sk; Tue, 26 Aug 2025 06:07:49 +0000
Received: by outflank-mailman (input) for mailman id 1093913;
 Tue, 26 Aug 2025 06:07:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n+o/=3G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqmqS-00031A-Bi
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 06:07:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc4a5452-8242-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 08:07:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so837527466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 23:07:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe97a4b200sm165447866b.72.2025.08.25.23.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 23:07:45 -0700 (PDT)
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
X-Inumbo-ID: fc4a5452-8242-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756188465; x=1756793265; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k5kk1Tcr25CccVYYtAS7h+H6GJgs/bb1m0Ca0LaCQ+4=;
        b=Of5DV53yIbZZAGIzfgNGTIS2N7hS3aFVchs4JadtWdE0oO8XthDmGgPZz2rm9g6df0
         VEdxuchDx6fxlLPbPYy96bzPnHdeaeXMPfokx8twiaOordW1GNx+ktouw92ni0AfsQnx
         RpBn//yRxEsSLfCveFlzSUUZzfePyCW3CJjc8ZGDlakvvELpJsRTJOYLuO0/JlUUbdkC
         a2AAU6qbdAJjqjco9utJtVMbUfBk3FfnXOt0P9EhbCejHAiugjlIiWRevrsnez9SvUbK
         XUzlwZzviLb20ItXibrs6fLezjynuZc2QfwK841iFuzHU35gRkcRFZaTFgldYCwuf2U4
         cPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756188465; x=1756793265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5kk1Tcr25CccVYYtAS7h+H6GJgs/bb1m0Ca0LaCQ+4=;
        b=Rc7hj4xUw9o/x0TErFMI5OW5TEImA8i8vZVovMKWD/vkmIHyqowe0TkKkxDxzBh9ss
         3MEmfZW6B0ouTCfv7tAXhNqdTGMvyIqP7sX0r0Ne05Sdrno7zpcMNmlRFS2v3pwkRJWB
         jBUzoDjBr2x8edYBl5+gVlKZ0oJiA0j8gKyVZnigk3KvF5BD8CtRqLLB+M0jTURflxst
         VNSalDaLHSR3gU6Caeprf2dcOWcAr63nFgGe1aNogA+X44uq/41Y+MjktYAXyEU9HJN+
         10Cc029ed45+/g743lw2md7lHBvIIO4lCZ+nh7Zmo3+utPVUJ+aHzrd67tGhZpV3CG5t
         r9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCXjnb0OBl24QDrwN9hSqSwhYTgvLIWzcVFUSH59PHsG7WFb1mbRhbqKf50icjIsBJAU1HICr43Ao/E=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/xXSIBUJTX0fhIc5/IWIFiIlD6UAjIHcaDye4/TbVUtv1YN1Q
	bA4G10+iZBB/hdpMDhFBC0X9GxmJeI7FLOAzdF0/iauAT0RR0zkli4jr5yZmE9k0JA==
X-Gm-Gg: ASbGncsS10KlZR3oE1wNI7d7o3vmYKdTCRupPZmejtX/ekU6Bwln+56eOiiLm340GIA
	CHrxJnxYfSHRxn9a7ISq8h3DHa72T287PYOaNgvC+uBKXruw9kGJJIHVEnfXhqowc0Smbr5cOcT
	2FSMTYChEBrgnziUtC5jrsFn0PJHA5oMEI3wmMLxOsIwlBuqB+uk3VOXtE2Kes31BNTPq4LoZCv
	fkIt4V6QcXOtyyI7BylkL0pSP8Fwe8mjro+Xxn0UQCy8F/uUPEp23QgiTdoqthYeH+vOiCKMU5o
	Y1lXZiLdQ/qb7lTVGYelXQ8j9BKQxQm96EsxyniEfkWexbsa93v9SxpQm6Ktp+Wy8qdT+B6twEn
	2ohp69viT93Vcfru2hijjTog82E0ik+Ir8SUH4RERXpRoaf8WThtiVlAtwBZUKgKOnIDISAxMI1
	O61wcTpOY=
X-Google-Smtp-Source: AGHT+IHquKA9S+9W42S3myELSgaO3vFznzDkPt+TEXYVPFE2ieSRtbWzQ+SGSTYwRvuuy6HnGqhCtQ==
X-Received: by 2002:a17:907:7203:b0:afe:ae1b:bf17 with SMTP id a640c23a62f3a-afeae1bd560mr64117166b.3.1756188465527;
        Mon, 25 Aug 2025 23:07:45 -0700 (PDT)
Message-ID: <1af4778e-8a2a-4fa5-a41d-0142947da137@suse.com>
Date: Tue, 26 Aug 2025 08:07:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/irq: Delete the pirq_cleanup_check() macro
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <0959802e4fa73b848b2b9e47c57c6daf062e9630.1756149543.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.08.2025 21:22, Dmytro Prokopchuk1 wrote:
> From: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> MISRA Rule 5.5 objects to a macro aliasing a function, which is what
> pirq_cleanup_check() does. The macro was originally intended to ensure
> the condition 'if (!pirq->evtchn)' is always checked before invoking
> the function, avoiding errors across call sites.
> 
> There are only a handful of users, so expand it inline to be plain
> regular C. Doing this shows one path now needing braces, and one path
> in 'evtchn_bind_pirq()' where the expanded form simplies back to no
> delta, as it follows an unconditional clear of 'info->evtchn'.
> 
> While this complies with MISRA, it shifts the responsibility to
> developers to check 'if (!pirq->evtchn)' at call sites.
> 
> No functional changes.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> Changes in v3:
> - added back wording from v1, originally written by Andrew.

Thanks. Just to mention, though - you copied it verbatim, including the
typo (simplifies). Can surely be adjusted while committing, if and when
somebody acks this. (I think it has become sufficiently clear that I'm
not going to.)

Jan

