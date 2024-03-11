Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D7A877D51
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691344.1077235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcJS-0007Hh-2N; Mon, 11 Mar 2024 09:51:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691344.1077235; Mon, 11 Mar 2024 09:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjcJR-0007Fi-W5; Mon, 11 Mar 2024 09:51:17 +0000
Received: by outflank-mailman (input) for mailman id 691344;
 Mon, 11 Mar 2024 09:51:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjcJQ-0007Fa-S3
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:51:16 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e64f7c47-df8c-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:51:14 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a45ecef71deso305197266b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 02:51:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 wk8-20020a170907054800b00a46021ef90csm2434146ejb.107.2024.03.11.02.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 02:51:14 -0700 (PDT)
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
X-Inumbo-ID: e64f7c47-df8c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710150674; x=1710755474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cjw1qo3T7OGwuTk84hXD8wjyH/8ueDiGizGMBQp+aGQ=;
        b=Y6XH9/2HRZRoHYrCMGWISeBvxFcoSVBovnLrSIZEfl1XufgMRERhlII5dRe6L6PbV9
         k7197LbKStjIxdUAoYQIMlJRc4h7Tj5DIwF2zoPDoTcl/nX7DXetMYLN40pPrL0l3QbI
         AglhCbRWJ/ccoAkn4vy81T+QyRQa+EK7IUSpU/vTIUbB6leT4R6APv/9u7AoqCzBr+SY
         P7Nk9jM8sNhm2lpzHu0G4Kcb3yURVF4xAtgFCwUg3iuPB9+jQag2ubUXR7xyzBIo0Qbh
         za9RNDTDnskquHEk30Gwf2tH2YeqMCuRdgmLhLaxmc35/0xmcO4q2VNF+nd3LKgzi5jJ
         GCyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710150674; x=1710755474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cjw1qo3T7OGwuTk84hXD8wjyH/8ueDiGizGMBQp+aGQ=;
        b=lRQ05OVc65utxL7ayd0xrOVc3Ld1fgflLg9BID/HNrFExPPlvv0R7l5+Mm4yT6feGj
         hjM4I62byyiaSEIXJycEicMO8A7Dy67QKfTHgpopRbKpDitGjqHOS3CEpE43O9Mc20ST
         ruAXlQRN/DYLHIwkYS983tqERPx6bMD1cvZ7nDQXkEUVDNGeEZ3cOBZtNTzr/wrLilP6
         pnaKx2+72MOG5RuoBJsYXOH9l44kLjy2/diPOfC+OrD3vdhUCyrWmYAq/EcBIyUl3/Zg
         8BJuzUC/Di/urm+ItZxyDDAr782S9iWlH0iK6FRY31IBgpZd73oziHF2fNnCjvEIuexP
         sAlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNGIh60SYlJgDBqTvfp5HWBJz8TzH2+vOYPV8SifRnXcB7obyvpu/heo/ffJR/X7mxjYRLT0WBByw9wukxwGUp2zZXmLBRo/8wSqwokFA=
X-Gm-Message-State: AOJu0YwioTl9Qa5zcVzVai6CJ73nnpiOXHIf/TGw1mAn+PanGHZTnS/o
	1BXtdyKLsR89ykmXaqcZX1KiXqEBl8Me+o6N0MTu+TxGPla19tx1p4QtzSxsaQ==
X-Google-Smtp-Source: AGHT+IElfjJDp4q7VIQduRqcTYK67XilJNwZdAqIIGWtHzqPXHZJn1/lD24bPQc/bX8Rmgat1tKdNQ==
X-Received: by 2002:a17:906:16d7:b0:a45:5bc1:ac35 with SMTP id t23-20020a17090616d700b00a455bc1ac35mr3447494ejd.30.1710150674312;
        Mon, 11 Mar 2024 02:51:14 -0700 (PDT)
Message-ID: <874fc4f8-f862-4fa7-b436-dd1420d010a7@suse.com>
Date: Mon, 11 Mar 2024 10:51:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen/evtchn: address violations of MISRA C:2012 Rules
 16.3 and 16.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <3ec419e30227a8016c28e04524cd36a549aaddcf.1709898466.git.federico.serafini@bugseng.com>
 <ef3e2ce7-6798-4ade-a5d4-fadf017bbd43@suse.com>
 <602c2da1-d5ab-4120-ab19-37e75820d129@bugseng.com>
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
In-Reply-To: <602c2da1-d5ab-4120-ab19-37e75820d129@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 10:02, Federico Serafini wrote:
> On 11/03/24 08:40, Jan Beulich wrote:
>> On 08.03.2024 12:51, Federico Serafini wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -130,9 +130,12 @@ static bool virq_is_global(unsigned int virq)
>>>   
>>>       case VIRQ_ARCH_0 ... VIRQ_ARCH_7:
>>>           return arch_virq_is_global(virq);
>>> +
>>> +    default:
>>> +        ASSERT(virq < NR_VIRQS);
>>> +        break;
>>>       }
>>>   
>>> -    ASSERT(virq < NR_VIRQS);
>>>       return true;
>>>   }
>>
>> Just for my understanding: The ASSERT() is moved so the "default" would
>> consist of more than just "break". Why is it that then the "return" isn't
>> moved, too?
> 
> No reason in particular.
> If preferred, I can move it too.

I for one would prefer that, yes. But what's needed up front is that we
decide what we want to do _consistently_ in all such cases.

>>> @@ -1672,6 +1676,9 @@ static void domain_dump_evtchn_info(struct domain *d)
>>>           case ECS_VIRQ:
>>>               printk(" v=%d", chn->u.virq);
>>>               break;
>>> +        default:
>>> +            /* Nothing to do in other cases. */
>>> +            break;
>>>           }
>>
>> Yes this, just to mention it, while in line with what Misra demands is
>> pretty meaningless imo: The absence of "default" says exactly what the
>> comment now says. FTAOD - this is a comment towards the Misra guideline,
>> not so much towards the specific change here.
> 
> Both you and Stefano reviewed the code and agreed on the fact that doing
> nothing for the default case is the right thing and now the code
> explicitly says that without letting any doubts.
> Furthermore, during the reviews it could happen that you notice a switch
> where something needs to be done for the default case.

That shouldn't happen during review. Anyone proposing a patch to add such
a comment wants to first have made sure the comment is actually applicable
there. Otherwise we're in "mechanically add comments" territory, which I
think we all agreed we want to avoid.

Jan

