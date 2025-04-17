Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56411A91B41
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957417.1350549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Nm0-0000zc-Rn; Thu, 17 Apr 2025 11:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957417.1350549; Thu, 17 Apr 2025 11:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Nm0-0000xR-Ou; Thu, 17 Apr 2025 11:51:16 +0000
Received: by outflank-mailman (input) for mailman id 957417;
 Thu, 17 Apr 2025 11:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5Nlz-00007W-BZ
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:51:15 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41f4102e-1b82-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 13:51:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so448280f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 04:51:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe6838sm31231875ad.221.2025.04.17.04.51.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 04:51:10 -0700 (PDT)
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
X-Inumbo-ID: 41f4102e-1b82-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744890671; x=1745495471; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9KySYqGVkYcpYFBYO5jG+XUM5oARZFVVnouSh5TTSuE=;
        b=JxEpjCYr3tGjDDB4zHZ4+MlncET7IyGF/RRNyEIWizTX03fPxlVVKqqNghbMUvRqiO
         sYO32dTUE3fePQsyGiJqviLgjxKrztZk8WiVxdZk4LZk/lxPCEyRTvNVPi3ZvxmPJ+XM
         YavDp4ZRsJyMSrIkre1g7tH5ld1SrcfCWtyxQd4iRWSxrPmXjlbLxFs5arMy/VO7q3/g
         trcGKndf6Faw8/Zvx+cgsBDDCqEqHk/WqKsunhQh2iwtzxaFS+QHvNKU3TbIAkB3I3Hc
         4NYJqNswwmO8Io0Jjx4gzc6YEcx+u09N+YPm0roktmZMJWQloQKNg0upLi0IGLc0SoWQ
         FFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890671; x=1745495471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9KySYqGVkYcpYFBYO5jG+XUM5oARZFVVnouSh5TTSuE=;
        b=Ou3ZoN+nwwqKndXGKXDUEc1fwUP00UnjA/8NUZWTQ0RkUl3FA1WdrmAJZQNLaqqnyS
         ywLqHnG6+weNhSqACa3/eyQuFch3Jq6tDmub9CN90v8rYFHlrwhXR5eyQ1v6Kyei1RHJ
         4A/BbefDq6r1V/6xOM8eqRDdajfpprQtbzwZQA5ySCECqfAyV0QCyXDQVV+ldcTP1Ba2
         iAP0y1q6d1jTP8jGCQqU5fPTJcWJZ3Kz4nCop9Sf2dahQZW8xvF4lNk9xR1MstcShSgl
         DZ/+2SLrFls1xYfjJ+abiNuO6klr0Ywr2gQmihp2MAni6WtBuUeM+pkU2i9QOXcdgxqA
         ydXg==
X-Forwarded-Encrypted: i=1; AJvYcCUuK5PsQvGjBP4zT4sKBbWkEEi0O8Nn5FegxonfnzJ84QLEI55PjAak0264YY8VsMFOY1I2a0Ue3Kc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEX2I/pJZzin7FhzXgCupvBPHRwQ27v4ySp6bivivx4g4fXG5m
	tQd9FH4JOj/IlTrafnXrNUCZaASg6SRK1BoDkqPR8PxRyoZQq/BeMBHPysnq6g==
X-Gm-Gg: ASbGncvdNJShi+UBCJhRfNxvxR8bZkwFIRU/RbtH7zY13sSgVlR6v1fkjJQmR+xRpL8
	ELi9NuvmRbHNBuHsWdjqUjCprdhYnQS8L73Lwt7xmsbQXDjl/Ro+br7t6u4ir6BoSiwPaQc04mh
	Y33nGTFKiPhE5K4aDFHTho4naIjYe75ApZb9aKdFBm9o88BVl64HBrGrrOfkmsFykdfzmlSGs8a
	z2iLKGezngnM3PLtSvOIiFcDUlaPiDBVDZpo6q9q4P4YjfcQp2NYx1rrC8h0M2XivDXrRc4xL6O
	6lMAT5R32tXLAIztlvseRJeHfcKwWn+PPtvUQ85rECIFKVVhWiMhXQHT8ATaUT9TYD5p/fuiy2L
	Qrt5zjf4/2Y+ZZIdz1+/8LTd9WsvD94kRy1vI
X-Google-Smtp-Source: AGHT+IECJYTgmORVl1GJPulMwRHI7fqTena20yt5D2ZEPG12P3Q/3w7Z1FEyC+U7ESI2BEr6ocnekw==
X-Received: by 2002:a05:6000:2209:b0:391:39bd:a361 with SMTP id ffacd0b85a97d-39ee5b19f89mr4671746f8f.18.1744890671006;
        Thu, 17 Apr 2025 04:51:11 -0700 (PDT)
Message-ID: <8551c59e-b038-403b-a131-ec50a74aaa47@suse.com>
Date: Thu, 17 Apr 2025 13:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/14] xen/riscv: implement setup_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <2bc37c3996978129a5b2c888917307ea32448651.1744126720.git.oleksii.kurochko@gmail.com>
 <47492663-5832-49e7-af4d-ee536206e641@suse.com>
 <7b1f5d89-2be9-450f-a4db-381df42942e6@gmail.com>
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
In-Reply-To: <7b1f5d89-2be9-450f-a4db-381df42942e6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 12:10, Oleksii Kurochko wrote:
> On 4/15/25 5:55 PM, Jan Beulich wrote
>>> +        /*
>>> +         * we don't care for now which CPU will receive the
>>> +         * interrupt
>>> +         *
>>> +         * TODO: Handle case where IRQ is setup on different CPU than
>>> +         * the targeted CPU and the priority.
>>> +         */
>>> +        irq_set_affinity(desc, cpumask_of(smp_processor_id()));
>>> +        desc->handler->startup(desc);
>>> +        /* enable irq */
>>> +        clear_bit(_IRQ_DISABLED, &desc->status);
>> Now it turns out this is really done twice: Once in aplic_irq_enable(),
>> and once here.
> 
> Agree, this is a job of *_startup()->*_aplic_irq_enable(). I'll drop that too.

Wait - see my comment there. I think it belongs here, not there.

Jan

