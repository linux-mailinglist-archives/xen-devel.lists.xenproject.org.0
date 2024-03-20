Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6B881210
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 14:10:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695908.1086195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvhe-0007Py-Mm; Wed, 20 Mar 2024 13:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695908.1086195; Wed, 20 Mar 2024 13:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmvhe-0007Mn-Jz; Wed, 20 Mar 2024 13:09:58 +0000
Received: by outflank-mailman (input) for mailman id 695908;
 Wed, 20 Mar 2024 13:09:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LUpO=K2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmvhd-0007Mf-EI
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 13:09:57 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25455601-e6bb-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 14:09:55 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-513ccc70a6dso11508189e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 06:09:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qt11-20020a170906eceb00b00a46d2e9fd73sm2567415ejb.222.2024.03.20.06.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 06:09:54 -0700 (PDT)
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
X-Inumbo-ID: 25455601-e6bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710940195; x=1711544995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GDAtE6pMunSN2aoshMW+PYqPKc8voG7r1xGtdTypMfo=;
        b=Acr5bSuAy7+YJOkL63dnjay7i5neGjmwVUfeqE/Vi+uYKvRMo6dCvgg6BKAzq7fB3Q
         8JJMfU70Tf1Rfdg/So3lGa1QDYCtV6lUtQ2+H5JgSjj1WJKpCMe4DZ855zxT8VA6Rt68
         /AZMh9/jTyGSIRzkG7lqQvqLHxn8sGHXn1tEwCbd25lrP66FO1bN/pd/wYdr2+QVBRxb
         jcCfuT4siDoyrLtW9rUzwR69ILeWwRCjbO9Pebvlkd7wrCoZ4hwqvdQgeYv/RVHjYFSy
         wnuAaT9Cw9YXXlOF7iJF+sktjYOL6OTdI2Uqa5mmuclaz/Apn+6gmBzzIDxbpwJ5ljsT
         QCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710940195; x=1711544995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GDAtE6pMunSN2aoshMW+PYqPKc8voG7r1xGtdTypMfo=;
        b=A9p/3Xpe54ydqAj7sDjw+944MsX3+XHvy2AOumm7xdrKFnxuJhysCjidpBGbsf0NYW
         ne0bp+qhrjW6IgtLit9ssbzqRlIwpc6onUXWcAze7xt+n8g8Zp4BdEMzFWdLcRHHmlkA
         ntISJqwNLm3ZQzxs2Ac7ZRahQLvyqmn49aWRG7B+zpmZoZ98Sgw3R7Xg/sj9rXSKTqUV
         8Lyayp5k8pK2aEK7n/IWxA9+2Em3EORQy3MC9r296ZW90jvp79NFJAr2iHPgvtB/Q/rC
         G8l9U84DrkSVcuHIG+PFCxmp+k/bq4BMOYWAEiIMaf1GaI/gEQ15beiJoQjnzp//Icf2
         hcKA==
X-Gm-Message-State: AOJu0YzLreiRWS0If8kQK5AdzLxA+99GE6ZxlCw19Msdo9EnB7iOpRr9
	sEAsbQIsA+64yL1vt22ASxGVDr/lGQYibmjb3fNE2b79hsJDu3DqhXrZpBfMYQ==
X-Google-Smtp-Source: AGHT+IGq/EARVD0JUtEy8N5UoOUNBjp13mNAGUQVPH9Av22FSZx4S+RxZ9tm3eKI5abvqgfmX6EAIw==
X-Received: by 2002:a19:2d10:0:b0:513:af27:df03 with SMTP id k16-20020a192d10000000b00513af27df03mr10540479lfj.5.1710940194797;
        Wed, 20 Mar 2024 06:09:54 -0700 (PDT)
Message-ID: <ecbb1db2-6d6a-4fa3-9b4e-c9367fae7b21@suse.com>
Date: Wed, 20 Mar 2024 14:09:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] xen/trace: Introduce new API
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20240318163552.3808695-1-andrew.cooper3@citrix.com>
 <20240318163552.3808695-2-andrew.cooper3@citrix.com>
 <CA+zSX=Y2gJ1_uWdeC6Gyv0VX4WytgVdqhbaGfmda3pLKZYs8pg@mail.gmail.com>
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
In-Reply-To: <CA+zSX=Y2gJ1_uWdeC6Gyv0VX4WytgVdqhbaGfmda3pLKZYs8pg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2024 12:58, George Dunlap wrote:
> On Mon, Mar 18, 2024 at 4:36 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> trace() and trace_time(), in function form for struct arguments, and macro
>> form for simple uint32_t list arguments.
>>
>> This will be used to clean up the mess of macros which exists throughout the
>> codebase, as well as eventually dropping __trace_var().
>>
>> There is intentionally no macro to split a 64-bit parameter in the new API,
>> for MISRA reasons.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> 
> Thanks for doing this, it all looks good to me.
> 
> I'll note that last time this was posted, there were some questions.
> One was regarding underscores in the macro parameters.  I don't care
> about this enough to stop it going in.

We ought to finally settle on our take on this, preferably recording
the outcome in ./CODING_STYLE.

> The other question was about the use of ##__VA_ARGS__. I don't
> actually understand what that comment was trying to say, as a quick
> Google search it appears that 1) this will do what I think it should
> do, and 2) it works both in gcc and clang.
> 
> We should give Jan a chance to explain his second point more clearly
> before checking it in;

Well. Gcc 13.2 documentation explicitly mentions this form; interestingly
with a quick search I couldn't find the original extension's documentation
anymore. It is possible that I didn't spot this 2.5 years ago. It is also
possible the their doc has changed in the meantime. In any event, my view
back at the time was that I'd preferably see us use the (long-standing)
gcc extension (args...) or use __VA_ARGS__ in a standard compliant way.
Yet with the original form no longer properly documented, maybe they have
a plan to remove that at some point. So while my preference stays for the
time being, I also don't mind if this code is left as is.

Jan

> but:
> 
> Reviewed-by: George Dunlap <george.dunlap@cloud.com>


