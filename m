Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A10B831CC1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jan 2024 16:45:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668826.1041305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUZY-0003a3-E2; Thu, 18 Jan 2024 15:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668826.1041305; Thu, 18 Jan 2024 15:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQUZY-0003Y9-BC; Thu, 18 Jan 2024 15:44:52 +0000
Received: by outflank-mailman (input) for mailman id 668826;
 Thu, 18 Jan 2024 15:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2mYN=I4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rQUZW-0003Y3-7x
 for xen-devel@lists.xenproject.org; Thu, 18 Jan 2024 15:44:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8287a86b-b618-11ee-9b0f-b553b5be7939;
 Thu, 18 Jan 2024 16:44:48 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e959b1867so4777185e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jan 2024 07:44:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b0040d5a5c523csm30290745wms.1.2024.01.18.07.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 07:44:47 -0800 (PST)
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
X-Inumbo-ID: 8287a86b-b618-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705592687; x=1706197487; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3hmdyKvYvqOXcRa7lXD0L2aIv9nRsMOheDmBP9XqpTg=;
        b=CthHrAJP7Vj+TMDVagHO5yudHF9EMdn0/omTXigppmIT0/3POjipm2AErIj1Cu4XUl
         kam6kWQs5w0QKqT6kO1wyj/19vut7m0RTdwzhmWuaNKUMPCvByU7eela5/oikM1R1lHk
         1MP8C8YzGB/vsAfs9znk46/Cl5r5UInaN57mqlDt/1IfatrXfJxn1iuJ+kGVIaNhtbAk
         94V1x64q94BDwZxQhGb5Z7nrlq0i1yk+oAFPlyRGsoFDgEyI5Jl0rrwrZNR7u0MLBh49
         6jHgkbwVRR8Iz4lFARL3sTg5zpCZ8uxpjvCJ0YqMiEDlD+BJc8MnWM6kbWvUg3KXXr/x
         +jAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592687; x=1706197487;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hmdyKvYvqOXcRa7lXD0L2aIv9nRsMOheDmBP9XqpTg=;
        b=aJlin08w/c6nGp9pJk1XaEXv72IqxIRXSvwZXab9L8zTiDUz/YLlTk1boHjs53gptj
         NBwcweHWVK6bhU+3wCm6YZXv0uPoR1UimVi8bMhNbUr57Dwive3OV2h6OwVzgcHaVH/9
         QMS+khTZK9egRjcysRP2Vcc8bPf7crOaopUhVQCGjwYJuj5M++iKfYRbYCGWXbIBEfte
         8XdOLxsHbATIQnKOyQZ+dC6Fs+XHSDukuj0efjFUURlICXZHPng9vfUAY2ZsA9zrCSTi
         8voXBZvLIACqf1tjBWg/hsMCXNcKI1IlkhdEoqvkWLUf5tNWBC0Y/8JAwF/zB/KTnYr9
         8cvA==
X-Gm-Message-State: AOJu0YwHLaYDgkDxRcwQtMdUzfadZQUiDAWo8Kn5wgOFaJaM418Jo1rI
	x6LwsyYv6Us7i7eJpovHWEt5T85Cd7P/YdNu/RWSxjj8O8YHbD3is8KqnAvJ0w==
X-Google-Smtp-Source: AGHT+IGJItYcMgnGqiwFjmuowqIbvOg/pR2n7kr3oLbs2hn53vQU4IMHR6QWIFc2hrqjOcsShX8vZQ==
X-Received: by 2002:a7b:c8ce:0:b0:40e:956b:7447 with SMTP id f14-20020a7bc8ce000000b0040e956b7447mr378247wml.131.1705592687581;
        Thu, 18 Jan 2024 07:44:47 -0800 (PST)
Message-ID: <442a2d6c-24bd-48bb-a73b-47fdc88ba8f6@suse.com>
Date: Thu, 18 Jan 2024 16:44:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] IRQ: drop register parameter from handler functions
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Kevin Tian <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
 <c6926627-aeb6-40dd-a85a-1be0b324bf49@suse.com>
 <36628428-3284-47c4-8471-21218c63df07@xen.org>
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
In-Reply-To: <36628428-3284-47c4-8471-21218c63df07@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.01.2024 15:17, Julien Grall wrote:
> On 11/01/2024 07:35, Jan Beulich wrote:
>> It's simply not needed anymore. Note how Linux made this change many
>> years ago already, in 2.6.19 (late 2006, see [1]).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> This patch will need to be adjusted to compile on Arm. If you 
> incorporate the changes from Michal (see the reply to the cover letter), 
> then:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>

Thanks.

>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit?id=7d12e780e003f93433d49ce78cfedf4b4c52adc5
> 
> NIT: I was under the impresion the tags would usually last in a commit. 
> So this would go before [1].

Well, I'm not sure. Personally I think footnotes better are last. If you
indeed dislike this arrangement, and since I dislike

"It's simply not needed anymore. Note how Linux made this change many
 years ago already, in 2.6.19 (late 2006, see [1]).

 [1] https://git.kernel.org/torvalds/c/7d12e780e003f93433d49ce78cfedf4b4c52adc5"

best I could think of would then be to go without footnote:

"It's simply not needed anymore. Note how Linux made this change many
 years ago already, in 2.6.19 (late 2006, see
 https://git.kernel.org/torvalds/c/7d12e780e003f93433d49ce78cfedf4b4c52adc5").

Thoughts?

Jan

