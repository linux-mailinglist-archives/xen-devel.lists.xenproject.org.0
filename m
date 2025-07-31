Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE63B17469
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 17:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065864.1431185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfn-00011C-BJ; Thu, 31 Jul 2025 15:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065864.1431185; Thu, 31 Jul 2025 15:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhVfn-0000zQ-8K; Thu, 31 Jul 2025 15:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1065864;
 Thu, 31 Jul 2025 15:58:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhVfl-0000zK-W4
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 15:58:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3095bcfe-6e27-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 17:58:24 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-455ecacfc32so4420575e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 08:58:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e89771e2sm21696185ad.88.2025.07.31.08.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 08:58:23 -0700 (PDT)
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
X-Inumbo-ID: 3095bcfe-6e27-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753977504; x=1754582304; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifs8/uczK+VegxbFE6xIJnCm6EiSSgUzb5R6OOcsqQ0=;
        b=bdaKA041LQkgUIXCtGLD8hnTUVZdBobMsln5lHAhiZS+zZi12jSS6pkfDVVBefXW/Z
         wGYA3KguyS08nz4okOJunlR/4DJmGz84agcjCZRmXf8a21RS4zudi/SdKzAsXZ7RHbYg
         O178UOxvs8K+zxV7CsQ9fnP6KE8DOGzFUIAw8icNKh+2YHEchZ1sC6wmTmqRFqJDZcOv
         f7Tshi0u0v3iJD6YmkOJSQd3MkfHxl74Cd0x67vTA+SWhneuRY4LyFngpfaSkHyTIVXq
         HC0frKrOn+hrkODcxylNQUoV5sezJ3G4FaNiPk9NrfPkKE6yZUMf+MHGUr5/CnTzXE0c
         SbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977504; x=1754582304;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ifs8/uczK+VegxbFE6xIJnCm6EiSSgUzb5R6OOcsqQ0=;
        b=BjVVs8PW+9SWjKhLPQTBf0uEHX5nHqpzkE1GGqY+MgLmUSq1YrwwwlgWRlbzayvddu
         xO21reIbWRakg4LzQ+7xyEuSpdttAi3OuoQmzdj6MkjC7OT4foC8A5N6eSQ1WzNKm5hl
         trTXvRPo0EfHGMMh8Hd4COxJ4py70BkO71yO69ry3ygkCZsY02zil/59101RvgdcVuXD
         eMJW5hOgmYJEbG7mxDM/fLCzGgWPsoP9w7gSZOMFN1wECWQCCkAg4zI4AvQxKVMaqrZw
         /R+ZMtqz9srTzPzFqfU0/P4xtUn8iAxsFcpu4arwzQCzjyhiCVSKb7FdWxBlx+3sYeR4
         pyEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6B8BuzkT0ivgr4KCzp6qYMAnaPO142EvRFLJFFsrlDj5xfhmYaye7fVEvhyD80ZlruJUhA52sHQQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/6cEHCpMxYltvfLaOMEPM7FsfY5XOdnqIGKjrEIt4G1DHtIax
	RVlOkuEKApAJ56ltunLDLs85Z8DB3nIX8GagmFlmg/t2uMgyF7xzhZrUxKY9g3iK6Q==
X-Gm-Gg: ASbGnctghXC/+AH2fbqA/mnQfXIRiCxK3YTXF+iSnzTPJT30w1YaRS/m/qxTE6CjVA5
	ybxE33zdxyr/Nq7t1SM08iaOGxTkOjGVfQa8R9rIFCaWKRwndWliChqluASKQCD8hOag8MC8HUw
	r4L2F2daUluHvDlkhdmiJYq+y2FT5e0uroG4yZg/nNg0npNSjaue8YCYmMdBZB4BGp7n8Um9MwW
	tVbZ+KtukPlssftmDVR/Zc/MFmj3ZeMNsuRSle6JQ7fqGHGdl7NkQPt3To0w5joc5EMLMM4E+F0
	yTzsWiNNUcBtwIxsnqxougFWe9bC3F2U8xhtjqKDy3GUFGm2MrdqnPA3Fj0Cfyf9MY0/F57GCLY
	kgMVF7FkcKXQE+xLZZ9gejrmf3vc4n9+CMAbKGOl6mMSW5KWjVciFJ20xiBBbE1oJHWZD5uWHk6
	eR8RrTG0Q=
X-Google-Smtp-Source: AGHT+IGWHL/t/zgFHuwTLbuXtmGy4plZdq6Ni3Ce2UKKLrbtx7L4KMD/3gtPsWhPRCyanPmkvECygg==
X-Received: by 2002:a05:6000:178d:b0:3a5:8cdd:c174 with SMTP id ffacd0b85a97d-3b794ff797fmr5705864f8f.26.1753977503988;
        Thu, 31 Jul 2025 08:58:23 -0700 (PDT)
Message-ID: <898e1c2a-7684-489b-84cd-254b2ee53e5d@suse.com>
Date: Thu, 31 Jul 2025 17:58:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: fix violations in macros GVA_INFO, TRACE_TIME
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <73cfc8a2d4d66042b49f44c69e672ce8ad0556ce.1753971749.git.dmytro_prokopchuk1@epam.com>
 <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
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
In-Reply-To: <470a04e6-f8c1-4937-8478-0f80107d562d@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31.07.2025 17:37, Andrew Cooper wrote:
> On 31/07/2025 4:16 pm, Dmytro Prokopchuk1 wrote:
>> MISRA Rule 13.1: Initializer lists shall not contain persistent side
>> effects.
>>
>> The violations occur because both the `GVA_INFO` and `TRACE_TIME` macro
>> expansions include expressions with persistent side effects introduced
>> via inline assembly.
>>
>> In the case of `GVA_INFO`, the issue stems from the initializer list
>> containing a direct call to `current`, which evaluates to
>> `this_cpu(curr_vcpu)` and involves persistent side effects via the
>> `asm` statement. To resolve this, the side-effect-producing expression
>> is computed in a separate statement prior to the macro initialization:
>>
>>     struct vcpu *current_vcpu = current;
>>
>> The computed value is passed into the `GVA_INFO(current_vcpu)` macro,
>> ensuring that the initializer is clean and free of such side effects.
>>
>> Similarly, the `TRACE_TIME` macro violates this rule when accessing
>> expressions like `current->vcpu_id` and `current->domain->domain_id`,
>> which also depend on `current` and inline assembly. To fix this, the
>> value of `current` is assigned to a temporary variable:
>>
>>     struct vcpu *v = current;
>>
>> This temporary variable is then used to access `domain_id` and `vcpu_id`.
>> This ensures that the arguments passed to the `TRACE_TIME` macro are
>> simple expressions free of persistent side effects.
>>
>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> 
> The macro `current` specifically does not (and must not) have side
> effects.  It is expected to behave like a plain `struct vcpu *current;`
> variable, and what Eclair is noticing is the thread-local machinery
> under this_cpu() (or in x86's case, get_current()).
> 
> In ARM's case, it's literally reading the hardware thread pointer
> register.  Can anything be done to tell Eclair that `this_cpu()`
> specifically does not have side effects?
> 
> The only reason that GVA_INFO() and TRACE_TIME() are picked out is
> because they both contain embedded structure initialisation, and this is
> is actually an example where trying to comply with MISRA interferes with
> what is otherwise a standard pattern in Xen.

Irrespective of what you say, some of the changes here were eliminating
multiple adjacent uses of current, which - iirc - often the compiler
can't fold via CSE.

Jan

