Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B7D904E99
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2024 10:56:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738996.1145897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJmD-0005B5-DJ; Wed, 12 Jun 2024 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738996.1145897; Wed, 12 Jun 2024 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHJmD-00059Y-98; Wed, 12 Jun 2024 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 738996;
 Wed, 12 Jun 2024 08:56:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h1N0=NO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHJmC-00059S-9Y
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2024 08:56:16 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0156058-2899-11ef-90a3-e314d9c70b13;
 Wed, 12 Jun 2024 10:56:15 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6f21ff4e6dso358837866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 12 Jun 2024 01:56:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f4b691964sm28845666b.71.2024.06.12.01.56.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 01:56:14 -0700 (PDT)
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
X-Inumbo-ID: a0156058-2899-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718182575; x=1718787375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=feaN8oXIcM5A7obxQ/KqJNLFUb+wYq7HPhGPru0feU0=;
        b=afUxdYjxUInbcYjYiPtW4Xe9vVPCAuQLx4lCpo7NxeN4m29eDagvFvN+pwy/WS3av6
         8xPv1C7NI+tthKLv79KFe4fEPHFmscEsZUCWN+37MoykKFaujXVNmD6HC8XHsuZTtVrR
         a2Yn7qJZZOpiDUNxcYceLP8rV13sQSiyMCZNopFUOn4keVJcVOF2epGmDm57d8aMtwHg
         CuwraqMnfdB+E16XrYhJkaNLRjed9YVOEkUl+hPqiN151YB7ntoqXvhQj6O8+DAQMcZ3
         u6ujBHKi2Jxoysndaj1xoLt94wYf2ClyBSvYxhBkhyENmKu07oAZ3wmPAMwEBXGka1e0
         yCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182575; x=1718787375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feaN8oXIcM5A7obxQ/KqJNLFUb+wYq7HPhGPru0feU0=;
        b=UHu9D7RDYWFLVfQLmWzdMCd/meNrotzhIvSJZvBujn2KHaxBHkRWTO++8tGsNHsuI1
         q5TOaRYg+p5yAVQprTPz8IlVT/wDp+r/883Cg72a8XesFLgQdWpN2oX0m63+d9RFAomc
         3sPyTk9/zBIvFvMwRO2sxWSHt3a5dGNOAjM06oZfwu1xxBgViSiMzsPhotc/ewNrunDN
         FGDR83oiE1tUe6vl5zvPHtauDMnnrDA7CQ5lClxRWhubA0f5hchgkBOsidyhk3DiMF6t
         jSnJVsF44IP4ni45qYTZnXLIgvPuHh03R6fuJWlKVH7jp3Bj5g7WFq36yiv9/63CM6/M
         IXFg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Q6/hEE/kpJFYY2qhDIjZePs9GHGf6yP7rEQv86Ng7DxLoVO6ckvWuoPqJ13TcKX5IWJsUzxZ9XxVAjPWov4gUA44wuTmsmQRwwZw4Io=
X-Gm-Message-State: AOJu0YzFP3JQMbUPfSsEAXhGMyvaOIVi2rvIuF/vlkBDnQWnrT40Lmop
	zjhAki+cL6ozJkbDXN5MCiuyrYQiYZegXT1AtICE0fOtuppH1+hPdW/P0bW0vw==
X-Google-Smtp-Source: AGHT+IGyh4fKP1D6C6FfPfUslS7sckZ6ZH+wCx933435WTrpIYswoj2K2oJWkZ7LsOQPG3zvDj2udA==
X-Received: by 2002:a17:906:234e:b0:a6f:1d19:c0b1 with SMTP id a640c23a62f3a-a6f47d5240bmr61769666b.18.1718182574848;
        Wed, 12 Jun 2024 01:56:14 -0700 (PDT)
Message-ID: <92584a2d-6695-4884-ba2e-990842318d8a@suse.com>
Date: Wed, 12 Jun 2024 10:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] x86/smp: do not use shorthand IPI destinations in
 CPU hot{,un}plug contexts
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-2-roger.pau@citrix.com>
 <615582c8-c153-424d-bce4-eb0c903d28ad@suse.com> <ZmlXve3rV2Vx9bH7@macbook>
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
In-Reply-To: <ZmlXve3rV2Vx9bH7@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.06.2024 10:09, Roger Pau Monné wrote:
> On Tue, Jun 11, 2024 at 09:42:39AM +0200, Jan Beulich wrote:
>> On 10.06.2024 16:20, Roger Pau Monne wrote:
>>> Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
>>> a cpu_hotplug_{begin,done}() region the function will still return success,
>>> because a CPU taking the rwlock in read mode after having taken it in write
>>> mode is allowed.  Such behavior however defeats the purpose of get_cpu_maps(),
>>
>> I'm not happy to see you still have this claim here. The behavior may (appear
>> to) defeat the purpose here, but as expressed previously I don't view that as
>> being a general pattern.
> 
> Right.  What about replacing the paragraph with:
> 
> "Due to the current rwlock logic, if the CPU calling get_cpu_maps() does so from
> a cpu_hotplug_{begin,done}() region the function will still return success,
> because a CPU taking the rwlock in read mode after having taken it in write
> mode is allowed.  Such corner case makes using get_cpu_maps() alone
> not enough to prevent using the shorthand in CPU hotplug regions."

Thanks.

> I think the rest is of the commit message is not controversial.

Indeed.

>>> --- a/xen/arch/x86/smp.c
>>> +++ b/xen/arch/x86/smp.c
>>> @@ -88,7 +88,7 @@ void send_IPI_mask(const cpumask_t *mask, int vector)
>>>       * the system have been accounted for.
>>>       */
>>>      if ( system_state > SYS_STATE_smp_boot &&
>>> -         !unaccounted_cpus && !disabled_cpus &&
>>> +         !unaccounted_cpus && !disabled_cpus && !cpu_in_hotplug_context() &&
>>>           /* NB: get_cpu_maps lock requires enabled interrupts. */
>>>           local_irq_is_enabled() && (cpus_locked = get_cpu_maps()) &&
>>>           (park_offline_cpus ||
>>
>> Along with changing the condition you also want to update the comment to
>> reflect the code adjustment.
> 
> I've assumed the wording in the commet that says: "no CPU hotplug or
> unplug operations are taking place" would already cover the addition
> of the !cpu_in_hotplug_context() check.

Hmm, yes, you're right. Just needs a release-ack then to go in (with the
description adjustment).

Jan

