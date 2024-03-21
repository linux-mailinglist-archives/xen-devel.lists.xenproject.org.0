Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6D7885CC4
	for <lists+xen-devel@lfdr.de>; Thu, 21 Mar 2024 16:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696464.1087433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKn0-0006Sk-H1; Thu, 21 Mar 2024 15:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696464.1087433; Thu, 21 Mar 2024 15:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnKn0-0006Ql-DV; Thu, 21 Mar 2024 15:57:10 +0000
Received: by outflank-mailman (input) for mailman id 696464;
 Thu, 21 Mar 2024 15:57:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ILtd=K3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnKmy-0006QC-AQ
 for xen-devel@lists.xenproject.org; Thu, 21 Mar 2024 15:57:08 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab0f19b7-e79b-11ee-afe0-a90da7624cb6;
 Thu, 21 Mar 2024 16:57:07 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5684db9147dso1260498a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Mar 2024 08:57:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s24-20020a508d18000000b0056a2cc5c868sm18057eds.72.2024.03.21.08.57.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Mar 2024 08:57:06 -0700 (PDT)
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
X-Inumbo-ID: ab0f19b7-e79b-11ee-afe0-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711036627; x=1711641427; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bH2tQdROdE1XJnuc3haR/Rw5X+zMBpbGttw2yxStdVU=;
        b=MX0q/GHAV/TQ4Cko8lJA0rnsbvNKPQNzxxUEoYEQwT9blkoyzITCvR9NsBCrS/PAe7
         oeU9KcNAEHKq8MZO8zgXtGFn8q11sfKTet5l22UExMOODGKDxjVgKaXeF6344Z4tuuXG
         02Ad28TfOLqJ1JDxei4MYc1z7S4qEKwe57uq4VLzk1mpzjX2f0qoR/hRqtBdtUIeTR0f
         6zFsaQ0L6bN99eP8XpxyVjFQQyU75ubaTcYqsyqr5e5UOX+DeZ3ygQWFewdHZyOk54Yg
         Csr9i4+Sx6dWnFVKkKTczwa/OHk7q6z9eJ7mMXsSpZ193kxX+9ginBSJCBgjM9rQh+PV
         f3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711036627; x=1711641427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bH2tQdROdE1XJnuc3haR/Rw5X+zMBpbGttw2yxStdVU=;
        b=iQFAgE+RuKEa++T3FTgFSAf3HHVoddRZmsJjKoyiwNq0iWT8nNV0N7nOBzFQ/ulSIJ
         Yk7AC8+caBfsQaMSAPyO0unf2H6X+dJwa9qQXpgZdnwTcmH99JKLa+APE593HmuwUuXr
         8CvkEEUQs9zcDh2e1bRcjPwJVNpqRLT+fAdCiEYhcNwLcp8/N3qtBT0PwsEpNS899k5r
         fqNa96exrUjoTplVSZQR4o1qayUWfY4PU/TbfpP5mb3NG5bJmBDU6nzDqOlXzlKhxxvi
         iPDFbCboVS4W9gfeBhQGMGVSLlJqsTXeIB8kUaKieTMBt4O1HTNyOYBVmlhMVdMqVmQy
         lI/A==
X-Forwarded-Encrypted: i=1; AJvYcCXizQvAvIuPAb6jBymXt7paRr0VhQt8u3Hl9C9BW5UQwUd+npX9y1ta6uA2eZHJG7AzAdoOSjQytAJlDDZMuWbtvi/RoN1705JbOsxvwIA=
X-Gm-Message-State: AOJu0YxQxKRgBdQwqPyTABbhTwPB4Jz4iC1tXLARBP/4MYxpDBh7waiN
	VdzbL4DxRWAitXx1k7oARh7Vb7y4ss4QEJtib5ZDtMeApqzq2PAmTnmhlvOpHQ==
X-Google-Smtp-Source: AGHT+IEobiYEqLZFbfW9djWqLoBbj/s2GIgtzBdF2fkaJYJJrI4znZtLOlfV+CDnMoYMSmniWa93Hw==
X-Received: by 2002:a05:6402:388c:b0:568:a523:a66f with SMTP id fd12-20020a056402388c00b00568a523a66fmr15543528edb.39.1711036626745;
        Thu, 21 Mar 2024 08:57:06 -0700 (PDT)
Message-ID: <3ff10fdd-5a85-43b3-853a-fe69c7388ca9@suse.com>
Date: Thu, 21 Mar 2024 16:57:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech>
 <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
 <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
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
In-Reply-To: <CAG+AhRW8xDun1WGimaqsaUR+YqL4vW-OmiDMQHCBxT=S+pgOwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.03.2024 16:04, Carlo Nonato wrote:
> On Tue, Mar 19, 2024 at 4:30 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 15.03.2024 11:58, Carlo Nonato wrote:
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>>>
>>>  Specify a list of IO ports to be excluded from dom0 access.
>>>
>>> +### dom0-llc-colors
>>> +> `= List of [ <integer> | <integer>-<integer> ]`
>>> +
>>> +> Default: `All available LLC colors`
>>> +
>>> +Specify dom0 LLC color configuration. This option is available only when
>>> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
>>> +colors are used.
>>
>> My reservation towards this being a top-level option remains.
> 
> How can I turn this into a lower-level option? Moving it into "dom0=" doesn't
> seem possible to me. How can I express a list (llc-colors) inside another list
> (dom0)? dom0=llc-colors=0-3,12-15,other-param=... How can I stop parsing
> before reaching other-param?

For example by using a different separator:

dom0=llc-colors=0-3+12-15,other-param=...

>>> @@ -91,6 +164,61 @@ void cf_check domain_dump_llc_colors(const struct domain *d)
>>>      print_colors(d->llc_colors, d->num_llc_colors);
>>>  }
>>>
>>> +static int domain_set_default_colors(struct domain *d)
>>> +{
>>> +    unsigned int *colors = xmalloc_array(unsigned int, max_nr_colors);
>>> +    unsigned int i;
>>> +
>>> +    if ( !colors )
>>> +        return -ENOMEM;
>>> +
>>> +    printk(XENLOG_WARNING
>>> +           "LLC color config not found for %pd, using all colors\n", d);
>>> +
>>> +    for ( i = 0; i < max_nr_colors; i++ )
>>> +        colors[i] = i;
>>> +
>>> +    d->llc_colors = colors;
>>> +    d->num_llc_colors = max_nr_colors;
>>> +
>>> +    return 0;
>>> +}
>>
>> If this function is expected to actually come into play, wouldn't it
>> make sense to set up such an array just once, and re-use it wherever
>> necessary?
> 
> Then how to distinguish when to free it in domain_destroy() and when not to do
> it?

By checking against that one special array instance.

Jan

