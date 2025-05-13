Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7534DAB4C73
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 09:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982557.1368913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjjL-00025m-CI; Tue, 13 May 2025 07:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982557.1368913; Tue, 13 May 2025 07:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEjjL-00022e-8y; Tue, 13 May 2025 07:07:11 +0000
Received: by outflank-mailman (input) for mailman id 982557;
 Tue, 13 May 2025 07:07:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHDm=X5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEjjK-00022I-6q
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 07:07:10 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1ff236c-2fc8-11f0-9ffb-bf95429c2676;
 Tue, 13 May 2025 09:07:08 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5fc7edf00b2so7230049a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 00:07:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fda01f4da6sm3294692a12.38.2025.05.13.00.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 00:07:07 -0700 (PDT)
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
X-Inumbo-ID: e1ff236c-2fc8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747120027; x=1747724827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4gayBjEZvREEXqM82tQUjyMR6cCyOQLO8tYV9dOJ+sA=;
        b=F7JXlDrrwkwF7Yu59YE1/werN3hJY7F8MSgbdrchf2QQkToBFmnRNT095td/1oGVfk
         bbNs+2BQRflRQ1PPkYu75FjEX9Z+7UgwpNeCPcNi66hjXQzZ3l1l83mgtq5kpYWptgj8
         W+K0vnmH4pr2dBKSamqzUvz42tZLOgdWfgJZX7sbG60/zqwcaskzhUaCNQc0tWsfrcTp
         bnnhonPROKIs0gOYn+Wxw09C6p8sbA3jCuKKhlOq9GogcYDZNfzjEEx2ubNKPBsmFsYJ
         GKd1zI8oooZxJVPybN5La4Wp6qteD+eZgqgcK0icjeYt68i7PIpvXU7gS8Lr8SEWaxfl
         w2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120027; x=1747724827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gayBjEZvREEXqM82tQUjyMR6cCyOQLO8tYV9dOJ+sA=;
        b=B7JnG9d79Jlw3XZ6kAXGQ52UKIdxwOIc4TYMwcog4vkjxorMkHWldGQ3uW0nZC9eMH
         tOK4p166Ssj3GEwdk8j8I4ryc/wdCGZtlqJi8WXcKvI38+IrpuBpyF0AMtm50pumhWsf
         2PK+uK5HrWSXXoNduvchtNVEMBFpINfYoSA3DZcWbPUXgF7lFNBuf58khvH2xehxJBEX
         kKhB6lBkMIHt1OR8SjRoDi1Q8y93e8S4G/fe55gmI25iY1wZ6hr94xhzGkMOJZa5Axh0
         Zf7aiNc4sYMacGZTBD11w5CaA8D1c+1dd5tdjsv3QflL8OSx9Fef1DeBdrqfoTPjc/9w
         la8w==
X-Gm-Message-State: AOJu0YxuJsOPh6sFtuI/kYpboxYHdlLQhR5IBvaX177kJTTh3NIgG2PM
	ybWv2+azIhP9R+y74keon9ykojHSWjmNbky5ZSQYEHcMGkwubtWVWkazmuGGlw==
X-Gm-Gg: ASbGncsOiKafpM7FSMcoEvfXCagmzMs3moVeZmMqwUxfSamOMPcN4LruWAXgAW4XZzt
	21ow8sp24/kKxJHNWg8xP29nhF9/dDXNIJExvsej1TJtz6zTsKeeD+6pLxeuZ4BK2vHbSlaxzPF
	8cKAlVwDhiNUQ0Jj+FEr8P4wftnTMfWS+Fkgi7LqMf4JPRXXoiPpozOnOqtKAvaN4SKJ/NLuvdx
	lZpEcdgW4lZXtNG40RSGV3yRUd4MmEyqwOuaWtJOMH7ylVANF9g40SryX52iwLe8GJXEnJoKBtn
	TPzAgbYozN7B3M9sJsNdCmCRIjJjRyU+3ktvHOCiWryv5MNu3qjBzxnF8OtPJ8c6FxS0/XVjTXA
	LrYE47UaFuLds9p5ZdHyGYLf+Ax+DKGHQj1d+
X-Google-Smtp-Source: AGHT+IH7kzdBLU6WMTgKNgoEdcD1UZeSWWYouxlFmBmJ2sd6bA14R2R8H8/UC6ag9OziCHUvLakVkQ==
X-Received: by 2002:a05:6402:43ce:b0:5fd:10fe:9e86 with SMTP id 4fb4d7f45d1cf-5fd10fea100mr8845709a12.28.1747120027486;
        Tue, 13 May 2025 00:07:07 -0700 (PDT)
Message-ID: <b00ae1e3-9812-411a-aaa5-b191c94a16a2@suse.com>
Date: Tue, 13 May 2025 09:07:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>
References: <20250512195628.1728455-1-kevin.lampis@cloud.com>
Content-Language: en-US
Cc: xen-devel@lists.xenproject.org
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
In-Reply-To: <20250512195628.1728455-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.05.2025 21:56, Kevin Lampis wrote:
> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system. Lockdown mode can be controlled by a
> Kconfig option and a command-line parameter. It is also enabled automatically
> when Secure Boot is enabled and it cannot be disabled in that case.
> 
> Ross Lagerwall (2):
>   efi: Add a function to check if Secure Boot mode is enabled
>   Add lockdown mode
> 
> Kevin Lampis (1):
>   Disallow most command-line options when lockdown mode is enabled

This looks to be a plain re-posting, without addressing comments already
given. For my part, I'm not going to repeat them on this (now properly
threaded) re-submission.

Jan


