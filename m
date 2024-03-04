Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D9486FB3F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:00:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688185.1072084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3FH-0002cl-AB; Mon, 04 Mar 2024 08:00:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688185.1072084; Mon, 04 Mar 2024 08:00:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3FH-0002ZZ-6m; Mon, 04 Mar 2024 08:00:23 +0000
Received: by outflank-mailman (input) for mailman id 688185;
 Mon, 04 Mar 2024 08:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh3FE-0002ZT-Vl
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:00:20 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e3507f7-d9fd-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 09:00:19 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a446b5a08f0so502788666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:00:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a23-20020a170906671700b00a45128cec31sm1481337ejp.25.2024.03.04.00.00.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:00:18 -0800 (PST)
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
X-Inumbo-ID: 3e3507f7-d9fd-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709539218; x=1710144018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2+QnWhi9L12Yu/+D3/ARwU6sLmXV5ABIWzzkDpGCfTg=;
        b=dtg+B2TiSlpNTW1Tn+60mFmQl3xQHm6jq6munkU/+ajmtmPwynG1NkYPOfeEaXRpBz
         jth4wnz3CTj2/5GOcpLo5/1npFGvJt53lDaW/eFzhLJY2BsRRHotmKZh7nDEsatumT3d
         Or+hCstAshAQ+nv362ZvqFuulhUJMcO9er4L0cDlP9vNIogtnMerxVSGJIg2B7lc1WUU
         5epEm1L1p5OMBOLS9ylMbqikRXQuTst6Ea77tTKJKPxCoX5yuTf7kRT/nOEpSfu2kH/f
         1Pj4HgW45CoVA+s9cT2Whp4f6imoKX5n4kqnKxzNN+HlIsK7Xafz6fowvhDhy5v9b7sI
         V5PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539218; x=1710144018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+QnWhi9L12Yu/+D3/ARwU6sLmXV5ABIWzzkDpGCfTg=;
        b=QeDQy+Pw7Ho+CQmJSAi2UPKJ+AYC+M+lXNnGecaSiuvHmMyKNl73s4IE0L5jzRcBhm
         8+jut5OOazJc/egMuMAuGLH7R3CP97AL+b12Bs34RLdf9SgBcvwyuSQ3pHi7p4QwPfsY
         27LJbmhBqJvw9GLYSbGpB5KrmeU9S8q/3THmEmNNd+75hXdOX4qPoORIXByqaak4xsEI
         Qyxk8kGw7FaqiVzGfdEFJhGM65c4eeb7W2Q8d+o04CCsjRafzgt7yplE5/DnFOdF2N2Q
         IDCN6NQD1sjUri6tII/EiRz4us6cRGufOUtkWMJenAXSlhp8ykpbPD083JvcEuKW3kPs
         zsfw==
X-Gm-Message-State: AOJu0YxL6HAwX2knuNhGpK+v0wndr1TbYTk1rDAqKD5xt74IyHQa0El1
	zcUPvYztdYJRwKrf2w+iYs8qKG/4C0+02OGE/MlWlJuqeYkz8ciO08Vc9Eu+yA==
X-Google-Smtp-Source: AGHT+IG1avjWE/WrIeA+pYvrXrvY7Rr2GPB0bwRhxZwO6mpKVcURJVeG1uY4J6ZMrkG8sacH2HeeaA==
X-Received: by 2002:a17:906:57da:b0:a45:163b:6a3e with SMTP id u26-20020a17090657da00b00a45163b6a3emr2810034ejr.10.1709539218373;
        Mon, 04 Mar 2024 00:00:18 -0800 (PST)
Message-ID: <d7411c57-32f3-41c6-8233-685ed5dfe976@suse.com>
Date: Mon, 4 Mar 2024 09:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 10/10] xen/keyhandler: address violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <2bc4a964f0f2f47488e72237678e944dbdbd7bb7.1709219010.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2402291457000.853156@ubuntu-linux-20-04-desktop>
 <1afd8805-7365-40ec-8e8e-468a83e20c40@suse.com>
 <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2403011716180.853156@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.03.2024 02:37, Stefano Stabellini wrote:
> On Fri, 1 Mar 2024, Jan Beulich wrote:
>> On 29.02.2024 23:57, Stefano Stabellini wrote:
>>> On Thu, 29 Feb 2024, Nicola Vetrini wrote:
>>>> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
>>>> of macro parameters shall be enclosed in parentheses". Therefore, some
>>>> macro definitions should gain additional parentheses to ensure that all
>>>> current and future users will be safe with respect to expansions that
>>>> can possibly alter the semantics of the passed-in macro parameter.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> You did see the discussion on earlier patches, though? I don't think
>> any of the parentheses here are needed or wanted.
> 
> We need to align on this. Currently if we go by what's written in
> docs/misra/deviations.rst, then rhs should have parentheses.

Quoting the actual patch again:

--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -42,10 +42,10 @@ static struct keyhandler {
 } key_table[128] __read_mostly =
 {
 #define KEYHANDLER(k, f, desc, diag)            \
-    [k] = { { .fn = (f) }, desc, 0, diag }
+    [k] = { { .fn = (f) }, (desc), 0, (diag) }
 
 #define IRQ_KEYHANDLER(k, f, desc, diag)        \
-    [k] = { { .irq_fn = (f) }, desc, 1, diag }
+    [k] = { { .irq_fn = (f) }, (desc), 1, (diag) }

What rhs are you talking about in light of this change? The only rhs I
can spot here is already parenthesized.

> Can we safely claim that rhs parentheses are never needed? If so, then
> great, let's add it to deviations.rst and skip them here and other
> places in this patch series (e.g. patch #8). When I say "never" I am
> taking for granted that the caller is not doing something completely
> unacceptably broken such as: 
> 
>      WRITE_SYSREG64(var +, TTBR0_EL1)

I'm afraid I can't associate this with the patch here either. Instead in
the context here a (respective) construct as you mention above would simply
fail to build.

Jan

> If we cannot generically claim that rhs parentheses are never needed,
> then I don't think we should make any exceptions. We should add them here
> and everywhere else. It should be easy to write a macro or review a
> patch with a macro from someone else, and making special exception makes
> it more difficult for everyone.



