Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE39866D46
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 09:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685346.1065897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWmU-0003mj-Kc; Mon, 26 Feb 2024 08:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685346.1065897; Mon, 26 Feb 2024 08:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reWmU-0003kL-Hz; Mon, 26 Feb 2024 08:56:14 +0000
Received: by outflank-mailman (input) for mailman id 685346;
 Mon, 26 Feb 2024 08:56:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reWmT-0003kF-4M
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 08:56:13 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3d08299-d484-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 09:56:12 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a3e6f79e83dso289690266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 00:56:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gq9-20020a170906e24900b00a3fa275de38sm2191955ejb.162.2024.02.26.00.56.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 00:56:11 -0800 (PST)
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
X-Inumbo-ID: e3d08299-d484-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708937771; x=1709542571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aaaGjeO8xh1J9ErIche9rNbsmQTIfaYVfGjYrUdriGA=;
        b=XFXxAX7tpilQAnnmXCFHVYWEb0bMOQTqTWA/wVUwG6LilO72vAUEyVWAedftK8qfpo
         gFpiTPbi0tY2lUAcHb7tqRE8k4+X0RPCnfxO4uNSAFJiYnMqKzSnfIc/If3eOsyKMqCF
         Et0V920vTQ7ozrrmDvK8Xg1nW2rGO/KIdPDv2EFd9NZw0P2JV+PtT82A4udJuTAfIKm+
         D/U4e+2o/E1Lpc/HSSEHIbjBJ/JKQOqqmaolazLomO+qYywAm5qYLAjJci0GD5nqJ1Vz
         J2cs+wq/LLlZKRvkY42I3OS+pWusRprwxjIL5M//im4c+5DQSFgINcImojs0nSnHoZH7
         g6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708937771; x=1709542571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aaaGjeO8xh1J9ErIche9rNbsmQTIfaYVfGjYrUdriGA=;
        b=c2S6T2sfTgU7N2xue99D7zcI5hQMeRw9vPB+HMFOJMDNjTXD4+16CUMULz1zHvI1QI
         eyhGpKbWJ3B9durI2JLoZBBvrEtQe/NCV4Af0aOsGFdZWuYUu9bpSn2febhJqK57SbKP
         U/C3larMKfbicJ7LILI4Y93rYFik0QIz14bDMcRXyqIFg3kfcbtdHZmQZIxhPBU8y6nO
         gL7Mla2SQSA3mEU1lrjN70+g8xh+I19ZMSBD9YNZiw2N0yJIBqGEnZEGfsGCc1FQOKzc
         Sj/E8lMMrqZtVWelAfaTm+5RZBK9pdKWq1dhVlt4vXZMoRGDysX8rbdss2pGxdIb816Q
         KL/g==
X-Gm-Message-State: AOJu0YydquSbYCqC1FebQRyN28k/VWrZozWpP9tNvQ0OLmu715TDFnV7
	2q/PkOB9B6Sg1J0VkrxgpPAj2Ar9J/wzVrqElbRfJOjRRcqIkPMD3NaoD7LiNw==
X-Google-Smtp-Source: AGHT+IFbsnxpH6q8bfHneMlQcWCOOQlhB9sc10k+rfJz7RCKL0Pc5AP37U43GKnoijWrpAAGDXZSWA==
X-Received: by 2002:a17:906:d923:b0:a41:30be:4a82 with SMTP id rn3-20020a170906d92300b00a4130be4a82mr3404498ejb.61.1708937771405;
        Mon, 26 Feb 2024 00:56:11 -0800 (PST)
Message-ID: <a8bab8eb-a735-4440-a075-7c62a12d4e4d@suse.com>
Date: Mon, 26 Feb 2024 09:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/2] xen/console: drop return value from
 consoled_guest_rx/tx
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <4998ec735bd7e5a50a229507e2b92ae56ec1ba4b.1708680104.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402231456350.754277@ubuntu-linux-20-04-desktop>
 <004877c8-9aea-44b9-aa93-65665b0d3a8d@suse.com>
 <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com>
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
In-Reply-To: <b417d7a330addd295b3cbbbac4bed2a4@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 09:23, Nicola Vetrini wrote:
> On 2024-02-26 09:00, Jan Beulich wrote:
>> On 23.02.2024 23:56, Stefano Stabellini wrote:
>>> On Fri, 23 Feb 2024, Nicola Vetrini wrote:
>>>> These functions never saw a usage of their return value since
>>>> they were introduced, so it can be dropped since their usages
>>>> violate MISRA C Rule 17.7:
>>>> "The value returned by a function having non-void return type shall 
>>>> be used".
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> The cleanup is certainly okay, but would one of you mind clarifying in 
>> how
>> far this code is relevant for certification? I don't expect there are 
>> plans
>> to run shim Xen in any projected production uses for which 
>> certification is
>> relevant? (The subject prefix is also unnecessarily wide here, when 
>> it's
>> only daemon code which is affected, not console code in general.)
>>
> 
> I agree on the subject prefix being too wide. The configuration that 
> uses consoled_guest_tx is #ifdef-ed for x86, so even in configurations 
> that may never reach this condition this is relevant, unless its #ifdef 
> is restricted to cases where the call may actually be reachable.

Hmm, I see. There are contradicting goals here then: It being just X86 is
to reduce the risk of someone overlooking a build breakage they may
introduce. Whereas for certification it's quite the other way around: We'd
like to "hide" as much code as possible.

Really I would have been inclined to suggest to drop the #ifdef, if
possible even without replacing by IS_ENABLED(), but instead leveraging
that pv_shim ought to be compile-time false whenever CONFIG_PV_SHIM=n.
After all that's a pattern we've been trying to follow. But with your
observation is becomes questionable whether extending use of IS_ENABLED()
is actually going to be helpful. Stefano - perhaps something to discuss
on one of the next meetings?

Jan

