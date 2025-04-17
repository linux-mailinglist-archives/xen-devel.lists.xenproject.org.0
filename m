Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A9EA91B48
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 13:52:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957436.1350570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NnT-0001x9-FI; Thu, 17 Apr 2025 11:52:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957436.1350570; Thu, 17 Apr 2025 11:52:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5NnT-0001tn-C3; Thu, 17 Apr 2025 11:52:47 +0000
Received: by outflank-mailman (input) for mailman id 957436;
 Thu, 17 Apr 2025 11:52:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5NnS-0001tH-Fi
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 11:52:46 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79b56762-1b82-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 13:52:45 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so13441475e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 04:52:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe6894sm31348835ad.215.2025.04.17.04.52.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 04:52:44 -0700 (PDT)
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
X-Inumbo-ID: 79b56762-1b82-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744890764; x=1745495564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lmKJhYLaEm5XtDyFOVODFlR2ZrhsBfILgSsmEvzbfNI=;
        b=W2dJMRaEh8hhKtp9A6X8q+kNDgn8VAhADRg35vAyrru899BOalFNAcwCh2EofF28LK
         ikYU5Li4YhqLXz3y5Cp5CZk9H5RXE6Q3rjor521YFHxGmRwLxk/2UN4lDSm7GHCEuNKm
         0tdK8c5xd2TYIciqmnni4FZ1nfeE+pWE6H7RyfXS3DpUOKZbZ3TvzUtKULTY6e6EWnZ6
         amFIZwmqQ4VPJioj0E66WosGVsIY9EaYXtI1+h4hg5sHgnT7VWVGM5uLuJ2thVlcDT04
         rxI3a7a9E9IkIr31lNQ7190jEcQEL3louI6ZMlM9aFcc1QrgRAReg1rLV2H0USRRtrLI
         foWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744890764; x=1745495564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmKJhYLaEm5XtDyFOVODFlR2ZrhsBfILgSsmEvzbfNI=;
        b=Pnvsdg2ERzrNqXwcp3MDPVUqQMyQKE+htEJVkXu8iClYISUbqJUaWfaXRgqX9JNqTo
         EqvhR/k3M9wcqL+szSMQaSVNrySgMIRKZheeENzZAbWg9MAz2bObU0DSLqrg27PU6l+3
         YKzMNrR1hHOjZHB0jEKyAadACTAvra2+bUmNAswHrXDqeHLKSmSadNW6oF3Oeb4Tl5IJ
         I0NJBlVOKBjbJCn/HKw7tQ8bmysW4ye6G3yHrwJUvncsyS/4kgKKnVjKBk6ebKAtBzf5
         W04iDoG3T8NS/eZZFttsgokaVSn5/+qyTIoj0x3s0X76AqtBr3xgDLEPWiMqDuEiKZR3
         sFrA==
X-Forwarded-Encrypted: i=1; AJvYcCXPuFCZxfQ5xjS2JnVRFmn13mT6KzjUxoIyByLzjJtUCAr8UuDKj3Wrg+21310XLS1TMN9X2sAUxog=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyEAVE34N7l7+zaFnkvg9RXCq8fMApPE1a31ul8qeVpyMcK8LO9
	8kbrr3iTqa+xQ2D+wcAIapeHiNWrgvaLiutb+ZG2HcOsomS2F6IgqW4Q2UdLUg==
X-Gm-Gg: ASbGnct57dztSHnEUZhbzMlFSiKWghyB1M+qifAGvj3q/pN80yhQgl+/odyAzeHzWzE
	abgPN5oG6G0+nm1KUmvt+P9nTgQbcCFHA4sfh5ET63tM5CHR2lQZ63oLqx+ecylDTfyl/qAB223
	3uVJVxiDxegFPgHkydx97jQucnDBOBaILQ83VZXSbvl4PvxfN+vh3QCckE9TTw9tCFU+OkqEUbM
	lWci4VBIwnqRELuUC38rIguVnVmpQx432MpnNtfTbgwPVjOeTcyVqxp+qDYUb24ityRuCAo3O45
	vs3ODl3s+63Lf5/FB+SQGw56X1xZKiU8ZIjiYEV9omIyAenWEQbOdWWyhGXjr+vQINseo8Ru3tk
	Yn+MdPMQUD5bgYY9Re3byCLO8kQ==
X-Google-Smtp-Source: AGHT+IGV5dnmZ820lQWYdm5JkUTPHnEgQbhvj5DibZKmgEMtUJKnPM3+PzMQpOCgR/mTENVv2pm1bw==
X-Received: by 2002:a05:6000:2212:b0:39c:12ce:1112 with SMTP id ffacd0b85a97d-39eea304284mr2424300f8f.21.1744890764537;
        Thu, 17 Apr 2025 04:52:44 -0700 (PDT)
Message-ID: <0169d9b5-4b44-47cd-afae-ea3d6a9467c3@suse.com>
Date: Thu, 17 Apr 2025 13:52:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 14/14] xen/riscv: add basic UART support
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1744126720.git.oleksii.kurochko@gmail.com>
 <3e96851da8751ac17cbf0cb5a649c0d86259460a.1744126720.git.oleksii.kurochko@gmail.com>
 <49889d22-55b6-4dd4-b497-13b50d19d607@suse.com>
 <4c16e34b-10b1-4320-b031-e26a883426a0@gmail.com>
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
In-Reply-To: <4c16e34b-10b1-4320-b031-e26a883426a0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 12:31, Oleksii Kurochko wrote:
> On 4/15/25 6:03 PM, Jan Beulich wrote:
>> On 08.04.2025 17:57, Oleksii Kurochko wrote:
>>> --- a/xen/drivers/char/Kconfig
>>> +++ b/xen/drivers/char/Kconfig
>>> @@ -3,7 +3,6 @@ config GENERIC_UART_INIT
>>>   
>>>   config HAS_NS16550
>>>   	bool "NS16550 UART driver" if ARM
>>> -	default n if RISCV
>>>   	default y
>> Just to double-check: Unlike Arm you don't want this to be user-(un)selectable
>> on RISC-V?
> 
> Thanks for noticing that. I want to have this selectable by user. I will add RISC-V here.

At which point we may want to consider whether the condition on the prompt
wouldn't better become "!X86".

Jan

