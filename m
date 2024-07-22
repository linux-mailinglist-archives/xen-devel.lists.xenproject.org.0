Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C72938BD3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 11:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761563.1171527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVp84-0008HZ-7P; Mon, 22 Jul 2024 09:14:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761563.1171527; Mon, 22 Jul 2024 09:14:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVp84-0008F0-4A; Mon, 22 Jul 2024 09:14:48 +0000
Received: by outflank-mailman (input) for mailman id 761563;
 Mon, 22 Jul 2024 09:14:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVp82-0008Eu-IW
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 09:14:46 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d5b0ead7-480a-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 11:14:44 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-52f04b3cb33so1073666e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 02:14:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c95111fsm397878666b.216.2024.07.22.02.14.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 02:14:43 -0700 (PDT)
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
X-Inumbo-ID: d5b0ead7-480a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721639684; x=1722244484; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vVqp4hhmqQkIbuyCmCIePjQjo/UkfXfxQIXMoFPkMv4=;
        b=LWqQuvITCkrgxRZBvCEf0NngF7YaCpzNpIwGpwVNJcqQAFweBEmp9z/zzNLobIjkEl
         zKux5dGSokXcgV2H+HXcSZ9n91zi1GgXQmTpFTVfFl8/ZFb+96ag6Q6Hi0yQCfxL/PjY
         39VqgIbKKP/jOI8/C+9VUGrjlFIpT/k/5EJJ5Uufj3eJDPLCYnv6sbC6Qo8FDqS8Xymy
         jD5IAefQ0DDvcUvqDktw6lCBOEmUH5ZN7N5qjxMJ+ks723J5Q9wyqYwfyZwRnNB/vm9q
         tSlEAXn3JbDAEBkHvLLS8evvYauuX6MtYCsf4X8Bs7MyZSyJk+rdYboPOLahwjgyxqC1
         qBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721639684; x=1722244484;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqp4hhmqQkIbuyCmCIePjQjo/UkfXfxQIXMoFPkMv4=;
        b=w5gcTtVpqtmAegJgAkdLrFMyVHN7jVxq7de/9YvfMX/YQS+uYSG8/uNJdkSLMP1Te4
         fgWDKIULHHYe6jbgXTZt9yO4Nvc/Anfqc3OYs9i5i3vu4M5bCkEwN2mph6cF6FkQ1Ec5
         guZ0zfX4IQYE4wfYA/TEtK+1LtdwtwLk7CNfFAvR6FFTjvTNjKS9tXH2xDYwocRjhw1H
         PPtqB4rLJmvNfIu8s5vvFm+nRxIudQoFEZgR9oRNNQYdUQ6uQP6jdi/6EcqPE05t0CiY
         wZf7Dzfo3R7+zkCV2yEpeEfxYYxpliAssjPbBzK6LdcOGFzeBB5eahdAUuBbPH5u24Z2
         DrMg==
X-Forwarded-Encrypted: i=1; AJvYcCUDxsAXEGoH3uNJ8Qbh3IcSWycAtR/KI1kr2LfgVCFapo6cwhfLOeQMAy55i/bDXcMUpM/NOBqREVvTWQqGDZCJUJEGjZBLJ1XMCYOPJA8=
X-Gm-Message-State: AOJu0YwNL61OVIDwYsmkD75bH4dyngWb6azH7cMOjJ+aU4UicaRI3zLh
	wlT4ff3QLlQTjEzjAAcLWt5tUS/wHvjB6+iDF9xIFta8nh1YtD1D2mS8ii59Dg==
X-Google-Smtp-Source: AGHT+IFsYYXfYFWp9XNPK7mfNnSEAt/vdwsnLPqakXoPVN3yjy6RLQU/rbfbdwch0GPMWvEq8vsYeQ==
X-Received: by 2002:a05:6512:2304:b0:52c:dd25:9ac6 with SMTP id 2adb3069b0e04-52efb74594fmr4393469e87.29.1721639683840;
        Mon, 22 Jul 2024 02:14:43 -0700 (PDT)
Message-ID: <dfc0d765-0d7b-418e-b311-6a641941e8b2@suse.com>
Date: Mon, 22 Jul 2024 11:14:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/17] xen: add SAF deviation for MISRA C Dir 4.10
To: alessandro.zucchelli@bugseng.com
Cc: consulting@bugseng.com, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
 <b64a6b53de8bcf14c91a1534bb57b001efc12cce.1719829101.git.alessandro.zucchelli@bugseng.com>
 <d6c313e5-19c6-4775-8d9c-0742a37032b4@suse.com>
 <alpine.DEB.2.22.394.2407121527500.3635@ubuntu-linux-20-04-desktop>
 <39ca09f9ef0fe1b6ec93371995f2a49a@bugseng.com>
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
In-Reply-To: <39ca09f9ef0fe1b6ec93371995f2a49a@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.07.2024 10:54, Alessandro Zucchelli wrote:
> On 2024-07-13 00:28, Stefano Stabellini wrote:
>> On Wed, 3 Jul 2024, Jan Beulich wrote:
>>> public/x86: don't include common xen.h from arch-specific one
>>>
>>> No other arch-*.h does so, and arch-x86/xen.h really just takes the 
>>> role
>>> of arch-x86_32.h and arch-x86_64.h (by those two forwarding there). 
>>> With
>>> xen.h itself including the per-arch headers, doing so is also kind of
>>> backwards anyway, and just calling for problems. There's exactly one
>>> place where arch-x86/xen.h is included when really xen.h is meant (for
>>> wanting XEN_GUEST_HANDLE_64() to be made available, the default
>>> definition of which lives in the common xen.h).
>>>
>>> This then addresses a violation of Misra C:2012 Directive 4.10
>>> ("Precautions shall be taken in order to prevent the contents of a
>>> header file being included more than once").
>>>
>>> Reported-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> One question: when making the new version of the patch series should I
> revert this commit as Jan made the patch for it himself, or should Jan's 
> fixes
> be integrated in the patch series?

You certainly want to leave out this patch. Whether you want to add my
alternative into the series is really up to you. I intend to commit it
relatively soon anyway.

Jan

