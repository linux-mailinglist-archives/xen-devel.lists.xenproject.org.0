Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD088995B3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 08:43:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701102.1095219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdIC-00049K-DT; Fri, 05 Apr 2024 06:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701102.1095219; Fri, 05 Apr 2024 06:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsdIC-00047V-Ai; Fri, 05 Apr 2024 06:43:16 +0000
Received: by outflank-mailman (input) for mailman id 701102;
 Fri, 05 Apr 2024 06:43:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsdIB-00047L-9r
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 06:43:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c6110a01-f317-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 08:43:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-34356f794a5so1525287f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 23:43:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u26-20020adfa19a000000b0033e25c39ac3sm1216123wru.80.2024.04.04.23.43.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 23:43:12 -0700 (PDT)
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
X-Inumbo-ID: c6110a01-f317-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712299392; x=1712904192; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2EGxgBV6A/5H+HCyZP7yuDF5hnhKuT3q3E5BDSevTU=;
        b=Elkk507aTk/0WuInb9jLWXzp/j6C1Gs7r0y183bygwWuGJcbqW6RB9mpqZk/8yoa9c
         fwJ42+kvN+ksEQyZQsTlIFUiMVXeCC01Rre7w/U0DGizlTbZ6623ClEDajYfdYafIm4E
         QOy/hGU8j7dUnLmu+KGTZbqOTHwX1JDHOO79bFGM9StzVMatO6oaYoSSzkwtpPtFOLXe
         RddEmpLqQcslUGFTkNPLC0C9UQrpFZ9hOkKsDehafMQnzzJaw08rMgyGQIYRAKefyZZ/
         cHErTJKbjAYEqAwQSvefBJZDvhbZN1qIEwuayb/w+lG7kc+ca2v4wbdh6Y1VIxNVC1z7
         sQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712299392; x=1712904192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2EGxgBV6A/5H+HCyZP7yuDF5hnhKuT3q3E5BDSevTU=;
        b=sB2vyw0GTRcmw2jB0OW9Pg89uQtqDPsxrIbXoB08ZVAzg5t12Be148s2H9biFW9rZK
         w0BHVDlG959+PcjAkm5C81SrPF8ejbnt684cAmDu4L9dF3m7y5NyJtNy3/LaZeX+6nID
         ds7bgDKcutC9fvo98pZOZX1GDg0pfm9peUMKr72QOfoCl1VO+f8mqRdVWDKCfQrRY4Hp
         MaW/QAxvDaB1itLKlz2fTkWCbha2+JuCpd7yb++SpIWwUMaw8MCMwTpOvw5YiQj7TQKr
         qsKt5pC90TwcrpRuS4i7onIfl9AqDJaTJt+4gsGFZkuCtSD2uJ/IcmpM0xQC+OALZnQ2
         ubeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqk9++DoilEGbY24zlAFlfdE5IlxtdF1XYHvVdOgSTvqZeGF+OF0wwulHJ0Q/tf3loOXbDlvbqGWWu7F/fzIsoWj8XDfW7uU+kNy7t3Zw=
X-Gm-Message-State: AOJu0YxSd6Znx0Ad41kbW4225jBTpBQHOW/ZFEELcMSTkRNwqctE2d6D
	mIrDAjOyBq3OeXEyEpFZ4s/D3x6E3GwZhQ+LIDGMik1e/cy8mS40iIGIgsMx/A==
X-Google-Smtp-Source: AGHT+IEabo4FFj6jEfqI36y9tsTpRftx0lLV0FybTwTQ1BoE1CeUzsY3vVCj74OT7e5mV8i5W8bq0g==
X-Received: by 2002:adf:fdc9:0:b0:33e:c91a:127e with SMTP id i9-20020adffdc9000000b0033ec91a127emr458764wrs.63.1712299392396;
        Thu, 04 Apr 2024 23:43:12 -0700 (PDT)
Message-ID: <627b2436-f7a0-4434-944f-5d4f173ba8ea@suse.com>
Date: Fri, 5 Apr 2024 08:43:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/7] xen/sched: address a violation of MISRA C:2012
 Rule 16.3
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <8f91430e37594831dd8d92ab630477be88417b49.1712042178.git.federico.serafini@bugseng.com>
 <28786c5b-c625-4754-980d-c9a0fdc49c37@suse.com>
 <0d0c8cd162a8bfed07dd374ef2dd62d4@bugseng.com>
 <alpine.DEB.2.22.394.2404041715400.2245130@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404041715400.2245130@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 02:18, Stefano Stabellini wrote:
> On Wed, 3 Apr 2024, Nicola Vetrini wrote:
>> On 2024-04-03 08:33, Jan Beulich wrote:
>>> On 02.04.2024 09:22, Federico Serafini wrote:
>>>> Use pseudo-keyword fallthrough to meet the requirements to deviate
>>>> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
>>>> terminate every switch-clause").
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>>  xen/common/sched/credit2.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
>>>> index c76330d79d..0962b52415 100644
>>>> --- a/xen/common/sched/credit2.c
>>>> +++ b/xen/common/sched/credit2.c
>>>> @@ -3152,8 +3152,8 @@ static int cf_check csched2_sys_cntl(
>>>>              printk(XENLOG_INFO "Disabling context switch rate
>>>> limiting\n");
>>>>          prv->ratelimit_us = params->ratelimit_us;
>>>>          write_unlock_irqrestore(&prv->lock, flags);
>>>> +        fallthrough;
>>>>
>>>> -    /* FALLTHRU */
>>>>      case XEN_SYSCTL_SCHEDOP_getinfo:
>>>>          params->ratelimit_us = prv->ratelimit_us;
>>>>          break;
>>>
>>> Hmm, the description doesn't say what's wrong with the comment. Furthermore
>>> docs/misra/rules.rst doesn't mention "fallthrough" at all, nor the
>>> alternative of using comments. I notice docs/misra/deviations.rst does, and
>>> there the specific comment used here isn't covered. That would want saying
>>> in the description.
>>>
>>> Stefano (and others) - in this context it becomes noticeable that having
>>> stuff scattered across multiple doc files isn't necessarily helpful. Other
>>> permissible keywords are mentioned in rules.rst. The pseudo-keyword
>>> "fallthrough" as well as comments are mentioned on deviations.rst. Could
>>> you remind me of the reason(s) why things aren't recorded in a single,
>>> central place?
>>>
>>> Jan
>>
>> If I recall correctly, the idea was to avoid rules.rst from getting too long
>> and too specific about which patterns were deviated, while also having a
>> precise record of the MISRA deviations that didn't live in ECLAIR-specific
>> files. Maybe the use of the pseudo-keyword emerged after the rule was added to
>> rules.rst, since deviations.rst is updated more frequently.
> 
> Yes exactly.
> 
> I agree with Jan that a single central place is easiest but we cannot
> move everything that is in deviations.rst in the note section of the
> rules.rst table. Of the two, it would be best to reduce the amount of
> notes in rules.rst and move all the deviations listed in rules.rst to
> deviations.rst. That way at least the info is present only once,
> although they are 2 files.

Could every rules.rst section having a deviations.rst counterpart then perhaps
have a standardized referral to there?

Jan

