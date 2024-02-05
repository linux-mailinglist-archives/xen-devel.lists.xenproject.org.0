Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5840E8498E3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 12:31:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675970.1051695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxCN-0001IR-TA; Mon, 05 Feb 2024 11:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675970.1051695; Mon, 05 Feb 2024 11:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWxCN-0001FW-Ok; Mon, 05 Feb 2024 11:31:39 +0000
Received: by outflank-mailman (input) for mailman id 675970;
 Mon, 05 Feb 2024 11:31:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWxCM-0001Do-AP
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 11:31:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1eb0a0c7-c41a-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 12:31:36 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40fc654a56dso25647515e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 03:31:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv15-20020a05600c548f00b0040e9d507424sm8330753wmb.5.2024.02.05.03.31.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 03:31:35 -0800 (PST)
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
X-Inumbo-ID: 1eb0a0c7-c41a-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707132695; x=1707737495; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dLfvIavVKbCmqidYG6Sb7t9toMcY9qBVM8LAb2HEdAA=;
        b=aR1B1xsPba0/0gNl6XTQ1dUKy8QRYApBMJUNLbZ938TUDEKwK+Vf5PCRcNI1TLpiXH
         5cQSwJWrf9DTgI+SBvh2LFphgU9uGGNsyQXay7YpCezwYCwCAUgMi+hVe/tjvfGqHBkw
         l9mnvOxTFMsc+9hccQDu6X6H2zoA4qg4zIyPg3dPeQuY1nCYhibAZM2OxLbFC3mX5W8f
         5fboSvKWOx0Ts03mMNlZn66dn3nmXADJ1SawsgpxYfvzXBVj/kx6+CCsuuH8yuga6+mX
         GxL5mpXuxNMdZ8PT48FfclLR4CN3ATKBsPWXTlEOp4sx1nBqevrexY89P0hPebkE/Mop
         1QxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707132695; x=1707737495;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLfvIavVKbCmqidYG6Sb7t9toMcY9qBVM8LAb2HEdAA=;
        b=WXDDARTfEY4n3p/pkZ/bnGqGWumAMJBas8bsglhxENQUKanCKUQUcO/dAiFI+nkfWK
         Lej1vFu7SHqzj903lXaP85U6JMh2O79CpFDxO+WVsXh1G3tfGWH8moiKif4TySGcdrks
         EiyDgFYpGgETsYLciMzuSTaLdHcA4ZxFoxF73bzSQ/3zdld8PjQHnW046pC9SR8gJ/MF
         5uD9zVNxwQOs+uJCYkIXcslfYDw5uNVcb8IRInGH2YOct5LbayQiz+yM/RttirFF1zKJ
         ao+/ddhuEyMQzCW9XQiQ0jtPaz2AOfwsHeqb8/22IcA7MuOudfIf8oCkBEc+3uALZNEU
         EKGw==
X-Gm-Message-State: AOJu0YzdagxQLXZmbQ50qwZQiF1rvd6jCPMhAIc7sTt5WbXndwfLxC2G
	Yb2rCw9tgUgho/DBNXoQzhDsCwUkCweRlau6F6t7ELgUmYWVEPXKugVlSnKESg==
X-Google-Smtp-Source: AGHT+IGxsgavsEHtBJNUYoGCN2eGWvGZeQury7INmJUgsEBB+Wl/9H8j6kzNWivajGwdlTDvTOAiSg==
X-Received: by 2002:a05:600c:3484:b0:40f:24e:d476 with SMTP id a4-20020a05600c348400b0040f024ed476mr4130803wmq.29.1707132695418;
        Mon, 05 Feb 2024 03:31:35 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXcFz13M0Y+hCHCypfNP5fZAVrxfe5MgrMuJmvWHyJHeyB+7ku53z5QhcM1i9APIHJOHMSc993JZe6CSZYra0UylGXuBNbb/bHNsTKKKr8BRPpYxdu5Kd7aIbIxMq3FmTOfuSQYIpRsHJmWi3fWIFJ1XiA95snK1LmJZUotDKuydI00eAHWTUeK3eafG9vcm0STsLqaqJGi/RZCQyyd3zCu6rtIsnYeBPqjLSA+iONkOZw1sneNfH8=
Message-ID: <e9961509-3453-42aa-a826-d3bea34f3a94@suse.com>
Date: Mon, 5 Feb 2024 12:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] Constify some parameters
From: Jan Beulich <jbeulich@suse.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240205104504.14830-1-frediano.ziglio@cloud.com>
 <d566e379-b339-44e9-8dd5-5f042e917409@suse.com>
Content-Language: en-US
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
In-Reply-To: <d566e379-b339-44e9-8dd5-5f042e917409@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 12:27, Jan Beulich wrote:
> On 05.02.2024 11:45, Frediano Ziglio wrote:
>> Make clean they are not changed in the functions.
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> For this and the other 4 patches - I didn't see a cover letter; was there
> none?

Even worse - while there is an In-Reply-To, they look to not have been sent
as a thread.

Jan

> And then please follow patch submission guidelines: Patches are to
> be sent To: the list, with individuals on Cc:.
> 
> Thanks, Jan
> 


