Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4051298B474
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 08:32:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807734.1219360 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWQk-0006SC-SO; Tue, 01 Oct 2024 06:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807734.1219360; Tue, 01 Oct 2024 06:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWQk-0006Pj-PC; Tue, 01 Oct 2024 06:32:18 +0000
Received: by outflank-mailman (input) for mailman id 807734;
 Tue, 01 Oct 2024 06:32:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svWQj-0006Pd-Ba
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 06:32:17 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62553c6-7fbe-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 08:32:15 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a86e9db75b9so967768566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 23:32:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c2775d23sm652331166b.4.2024.09.30.23.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 23:32:14 -0700 (PDT)
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
X-Inumbo-ID: e62553c6-7fbe-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727764335; x=1728369135; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rPf8JphMMaG1HIFqoHxUuiHW3PDeMWgjRaCIs+S372U=;
        b=aLKAepyRiOnDRcagMf5E/gIzgixZbxM4DayeRs+xyOuE0HaUOL3LyowiXrEyQ4rm6l
         r6+Ewo+Qjzjn9V07oEAnvEeqO8kmnix9Hd2PwtXywFaYR2NjtrwqdQrb6EicDnlu13j0
         XelHr5sSSb14wbWSxDhjcOC+plJuivEYq4yiG4U8Xxls65Z40JJZGgZHbx+xGciKA0zj
         lxfLLZP+74VdPL2XZX1Z3sdBIvZv65FoS5+ee+3GwGMKnoqeo8YdDgDSZmK55v3ABgSA
         26cXO4U23bUTDoeGWv7Go1T2KS8t8n++boQU5Qk6CYHdINsPJJx10aKNCyv3wWZTB4Wk
         MKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727764335; x=1728369135;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPf8JphMMaG1HIFqoHxUuiHW3PDeMWgjRaCIs+S372U=;
        b=RbkCBbyihEF8iyzQJDr86fGUZJ1KF1NZ53zBFB3QDzi33MTxc192AP/MPA2oIN3wiT
         ro3cd76Hk0rla3xcBTbUCLPY2aNzXUdf/d3TXX41h0dTcEDgY1pabntDEgw0wwbV6Zz/
         75BSuuGpGRC6U1CtLV4TAaZKaJ0/eEjAlmUE2pvhnSmxK1YF3glhVEeC1QeYiIjAIQul
         gTMFkQGkbgDjoMSlHvZ1gtsOOXOPdtAegnTsyjQPSN7kQv9+v2Xo8CXsAXTjmIIQEKro
         cH3EMJD+k52uwp08w7yuz+ZdPv/imyp6zQySg+mvtN6ff6or5bcff+i9hQ8i5piw+WgP
         Ci8g==
X-Forwarded-Encrypted: i=1; AJvYcCV49ixHaZbQ3TCXkKsMi8ZlIwO108pDth9gFiyKjGP/YTk6ZGCY3CmhU4dxllXGwRcvKz7KI6XIZds=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt6zMxZcZZwdN2+csWMxzMC542j1ApFc9CR/aCmUgRITymJ3ch
	vJQ1S6VLNbxTolujmNMoaLIUNIwT9IE5NRQTfie6usciueKXy7my/LnW8ljT6Q==
X-Google-Smtp-Source: AGHT+IGKli2++IfpWNTtTd9sMbTfHPF5i+latI4NG+eq5cx9vJnd5La69x9uR5j9fS7vYnVZl4blug==
X-Received: by 2002:a17:907:1ca7:b0:a8d:28dc:9e2b with SMTP id a640c23a62f3a-a93c4a68381mr1783607766b.44.1727764334930;
        Mon, 30 Sep 2024 23:32:14 -0700 (PDT)
Message-ID: <8d5e4761-9fc2-4e18-a6c2-9df1822dbbea@suse.com>
Date: Tue, 1 Oct 2024 08:32:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 1/3] EFI: address a violation of MISRA C Rule 13.6
To: Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1727690180.git.federico.serafini@bugseng.com>
 <c447f9faf0283bc6b83bbfbf05acd7acca00762d.1727690180.git.federico.serafini@bugseng.com>
 <b4fafd2c-d71a-4336-b009-07f3474f5a04@suse.com>
 <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
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
In-Reply-To: <a8dfe133-6f9b-4a26-918b-d0531d6af918@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 07:25, Roberto Bagnara wrote:
> On 2024-09-30 15:07, Jan Beulich wrote:
>> On 30.09.2024 14:49, Federico Serafini wrote:
>>> guest_handle_ok()'s expansion contains a sizeof() involving its
>>> first argument which is guest_handle_cast().
>>> The expansion of the latter, in turn, contains a variable
>>> initialization.
>>>
>>> Since MISRA considers the initialization (even of a local variable)
>>> a side effect, the chain of expansions mentioned above violates
>>> MISRA C:2012 Rule 13.6 (The operand of the `sizeof' operator shall not
>>> contain any expression which has potential side effect).
>>
>> I'm afraid I need to ask for clarification of terminology and alike here.
>> While the Misra doc has a section on Persistent Side Effects in its
>> Glossary appendix, what constitutes a side effect from its pov isn't
>> really spelled out anywhere. Which in turn raises the question whether it
>> is indeed Misra (and not just Eclair) which deems initialization a side
>> effect. This is even more so relevant as 13.6 talks of only expressions,
>> yet initializers fall under declarations (in turn involving an expression
>> on the rhs of the equal sign).
>>
>> All the same of course affects patch 2 then, too.
> 
> MISRA C leaves the definition of "side effect" to the C Standard.
> E.g., C18 5.1.2.3p2:
> 
>    Accessing a volatile object, modifying an object, modifying a file,
>    or calling a function that does any of those operations are all
>    side effects,[omitted irrelevant footnote reference] which are
>    changes in the state of the execution environment.
> 
> The MISRA C:2012/2023 Glossary entry for "Persistent side effect"
> indirectly confirms that initialization is always a side effect.

Hmm, that's interesting: There's indeed an example with an initializer
there. Yet to me the text you quote from the C standard does not say
that initialization is a side effect - it would be "modifying an
object" aiui, yet ahead of initialization being complete the object
doesn't "exist" imo, and hence can be "modified" only afterwards.

Jan

