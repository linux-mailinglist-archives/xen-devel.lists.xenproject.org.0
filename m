Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AF48690DF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 13:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686121.1067652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rewsI-00067u-Pf; Tue, 27 Feb 2024 12:47:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686121.1067652; Tue, 27 Feb 2024 12:47:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rewsI-00065O-Mm; Tue, 27 Feb 2024 12:47:58 +0000
Received: by outflank-mailman (input) for mailman id 686121;
 Tue, 27 Feb 2024 12:47:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rewsH-00065I-Lf
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 12:47:57 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d651725-d56e-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 13:47:55 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-563c595f968so5542547a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Feb 2024 04:47:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 vg8-20020a170907d30800b00a43a4e405bbsm666196ejc.115.2024.02.27.04.47.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 04:47:54 -0800 (PST)
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
X-Inumbo-ID: 6d651725-d56e-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709038075; x=1709642875; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z1QqbI5mtmSOu0DPqiyO616vQ7jNr/cWLNVJDh2On38=;
        b=VWQTt0JFYUYLIilM8cULjy/aKzfBOx9haYBTLHY2uUW1bz/W+NYoY6FNayp2X01rp1
         twKjoWYROHKjAByAxB45+GxEQDMKfDOT7pLDM0lqM5RJPBXs2BqaY48lgStbUI2/tu72
         nX9kIKrDXmcp9My/or+AJ0NMT9QQ99w1KEI6DUeJLrA/UC9vILHAexcitbAFk3iJnnWm
         goz42HlZeWW8PW8kzuXKxWVhFJCk8UYXhqy0jXrg20wzws6qiKKEL4mlhtJz0+JBPRh6
         5gGmfMGJH6xxMo7VMG1ffS7LLbc0kDw/2wrytEezPyE5Zgr9HuqaxMDArRFa2+3puHVw
         0+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709038075; x=1709642875;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1QqbI5mtmSOu0DPqiyO616vQ7jNr/cWLNVJDh2On38=;
        b=E3SMedkIWM8ICJ6AYnBBwJibSA8QxiFZTfE/NCKCfcu2dbHwRQ0BpEuHOIFb3qYvK+
         nrelcdhnqV23pPVdJo0b5eNvm/4JcY1ipbp/HQYKsbaNYBsgh2PHPPfvfao+VyIgFyeQ
         jRev50fCF6qeqtibCoQLEHLbNEyLQZ6wxpXLUxDjALVjK49ERloBO38RKg/J8gX1ZLYK
         mneeWDnoF2KCoupcRKgXUoMkY3L3p4wifVroJKxIXE7QIfAAkFND8u05qSilXzBk3rh9
         YRrEE3af8LmK96Tvb0n6Eyt2I6FR+rr75AJvuKn2/iS6COcMSMIVDwClwLy3InyZAyVV
         4A+w==
X-Forwarded-Encrypted: i=1; AJvYcCWhEJE1OtrLWAY39Hz1hsZU4+2b9AiDdthUJaQ4uCXtO0fG1J28EU+LsuMVa2T0Pl8c6zNhy8zS8dlryvB9StMAZACRvVoW5dHgj9CMrfc=
X-Gm-Message-State: AOJu0YwN/t/IP4JO14pfN0pEnx6pQGClz17PlXiJAb06cK+RE/k0rfHm
	jylKKZCTiKQea5O92yiO4WfCj8BSE4sYO27MV0+wTuq4z41rzZbrx5nhTRoQSg==
X-Google-Smtp-Source: AGHT+IEW5gWWHZA3E4nolNaxAaQC570yEkJ8SZkia87fnHUE8gYjqmuAwxs35II9g6BG9/jVAiuSnw==
X-Received: by 2002:a17:906:3685:b0:a3f:98c1:3ed8 with SMTP id a5-20020a170906368500b00a3f98c13ed8mr5701889ejc.29.1709038074958;
        Tue, 27 Feb 2024 04:47:54 -0800 (PST)
Message-ID: <4bee79ca-7a7e-4bcc-ac97-5a5a57ec2c91@suse.com>
Date: Tue, 27 Feb 2024 13:47:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/2] xen/cpu: address MISRA C Rule 17.7
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1708680104.git.nicola.vetrini@bugseng.com>
 <dd4ac0e670a2ad7ecb5eb435e5e3b4b313b1e0b6.1708680104.git.nicola.vetrini@bugseng.com>
 <33342a17-e71c-4752-a16f-da5c0ef77b51@suse.com>
 <alpine.DEB.2.22.394.2402261619210.247676@ubuntu-linux-20-04-desktop>
 <2178731a-ec81-4505-ba8a-2f945bf85133@suse.com>
 <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
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
In-Reply-To: <7a8e610e-913e-4a56-8ce1-6dd6abd894f4@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.02.2024 12:52, Julien Grall wrote:
> Hi Jan,
> 
> On 27/02/2024 07:28, Jan Beulich wrote:
>> On 27.02.2024 01:26, Stefano Stabellini wrote:
>>> On Mon, 26 Feb 2024, Jan Beulich wrote:
>>>> On 23.02.2024 10:35, Nicola Vetrini wrote:
>>>>> Refactor cpu_notifier_call_chain into two functions:
>>>>> - the variant that is allowed to fail loses the nofail flag
>>>>> - the variant that shouldn't fail is encapsulated in a call
>>>>>    to the failing variant, with an additional check.
>>>>>
>>>>> This prevents uses of the function that are not supposed to
>>>>> fail from ignoring the return value, thus violating Rule 17.7:
>>>>> "The value returned by a function having non-void return type shall
>>>>> be used".
>>>>>
>>>>> No functional change.
>>>>>
>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>
>>>> I'm afraid I disagree with this kind of bifurcation. No matter what
>>>> Misra thinks or says, it is normal for return values of functions to
>>>> not always be relevant to check.
>>>
>>> Hi Jan, I disagree.
>>>
>>> Regardless of MISRA, I really think return values need to be checked.
>>> Moreover, we decided as a group to honor MISRA Rule 17.7, which requires
>>> return values to be checked. This patch is a good step forward.
>>
>> Yet splitting functions isn't the only way to deal with Misra's
>> requirements, I suppose. After all there are functions where the
>> return value is purely courtesy for perhaps just one of its callers.
> 
> You are right that we have some places where one caller care about the 
> return value. But the problem is how do you tell whether the return was 
> ignored on purpose or not?
> 
> We had at least one XSA because the return value of a function was not 
> checked (see XSA-222). We also had plenty of smaller patches to check 
> returns.
> 
> So far, we added __must_check when we believed return values should be 
> checked. But usually at the point we notice, this is far too late.
> 
> To me the goal should be that we enforce __must_check everywhere. We are 
> probably going to detect places where we forgot to check the return. For 
> thoses that are on purpose, we can document them.
> 
>>
>> Splitting simply doesn't scale very well, imo.
> 
> Do you have another proposal? As Stefano said, we adopted the rule 17.7. 
> So we know need a solution to address it.

One possibility that was circulated while discussing was to add (void)
casts. I'm not a huge fan of those, but between the two options that
might be the lesser evil. We also use funny (should I say ugly)
workarounds in a few cases where we have __must_check but still want
to not really handle the return value in certain cases. Given there are
example in the code base, extending use of such constructs is certainly
also something that may want considering.

Jan

