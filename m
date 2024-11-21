Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3239D507A
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 17:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841590.1257081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9iR-0002ig-Fm; Thu, 21 Nov 2024 16:07:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841590.1257081; Thu, 21 Nov 2024 16:07:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE9iR-0002fa-D7; Thu, 21 Nov 2024 16:07:35 +0000
Received: by outflank-mailman (input) for mailman id 841590;
 Thu, 21 Nov 2024 16:07:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0oSv=SQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tE9iP-0002f9-J1
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 16:07:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58e20a5-a822-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 17:07:30 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314fa33a35so9045515e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 08:07:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b01e1170sm62988635e9.3.2024.11.21.08.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2024 08:07:19 -0800 (PST)
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
X-Inumbo-ID: b58e20a5-a822-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI1OGUyMGE1LWE4MjItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMjA1MjUwLjIyNTMwMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732205249; x=1732810049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DdLAAEO5PDWJDXAZxFxXEb+XutM7Xnb/2tIpqcGTVT0=;
        b=ACL8ika5R/5YlROe+tHARN6/1eTJhHAoKjsbl4VA+FEEF8ObuztFA53JWjb/q0N457
         L5BkqDESb3Iwt17edSH0wJVFhaLNRGHDADyuEJpekTFjwvchVrThy9gtyD6lmAlbBId3
         uiJeZXslh+XZKlMZPBiCvdY0bojKSs3kWzIL/2QNWvYhte2EL+E3Ygr8VyRQ8xHZck+Q
         cTSnI+9a7SAikfuk4nKj/5VY0XDPtmD1eNTfsk+3k9YnBys649XQ6Nnk306J1s6v4ePv
         0o8w+yIQfy1sONx0VPS3saf4N+9EkpP8W6PDcZjv9cq1F7v/rm84dJaF1iqSYvZSxPdW
         EtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732205249; x=1732810049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdLAAEO5PDWJDXAZxFxXEb+XutM7Xnb/2tIpqcGTVT0=;
        b=LpzGxbKz/rVqtl4Fp+C3SGMNB9vpWksImmM/R4oqTtnfvDkXqwOtaH8Wvll5BgDRuj
         TIv/t5CRGLfocGyGx++1FrZODToJA4lKfvMBYwGC1mHK4T01RR6/M1dYv2pKDE8Vf29w
         7HIsVu2OInxpBGysk/730gFp0etmG48E5Ong+IOIx141D1vgEvvqhXCtcLKFmJL0yMXM
         sG9tjq0LxG0+Yhkrr4rrypVGbKV2nI41pEyICYlbgWDh0uveVAiEvvRP8/ICU2C0PuDE
         agAn0kZnD1jw9tMPs30ubN46OfMC9F4uDyeB8oM+TySWutF2mCa3EHrzdWsS3X0Y6vgV
         9Rjw==
X-Forwarded-Encrypted: i=1; AJvYcCWJp7OOPOeG1qTdPMhQ0X6ykVnde4fBaaud3Gk8F4JuNsleiW4sZ/Ha4u5/9HFeY24RE+/gpz1FFgk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx0Zf2cD7h4y00LS5Z92+Mmvk+menFwa4hHxzs427HFgUXVe8RM
	my7WoMujeWkV8B5mHrcffgs5uqqBQvJxzRZri3/uEV28xHcjtd9RxOMcn119G4/xeHNvM+GYsbw
	=
X-Gm-Gg: ASbGncu35vr3RE+yVinr2XYi8buqUuD9J68pI9QQu7MfOcSyvQCsPbrY876NLMA5x8b
	6a06HgHn/oMDpIQ9rfVQvFC6xwNkVsrOJobUkPQjVA5Y0IQ9IhDSZaPWTJHCzNk16lJJWcPEznP
	I3lV0H5DfgCV6OJTJvYcJPUeo3piWAIBS2dFxa6URBbwuWcj72U4/40iym+LKgEMpEPT40XMBdJ
	ZioyEhFF5nbfGbVBgSjUoe0o/+IUFsnDgKhquldIpiQAOh70vIYilAx1BOB2iFk0lOtQ0lSMWs/
	x9nNDt/4DKK5CZQXmmH8i1ORnf7o2BUCJ8s=
X-Google-Smtp-Source: AGHT+IGjxecNIlHQDEvJBuOUoibpN6fBFJQ+4/f5KDrzH4VOihzPAa+7CUZGtwFzuPaJJns7/N5gUA==
X-Received: by 2002:a05:600c:34cf:b0:431:5a93:4e3c with SMTP id 5b1f17b1804b1-433489d4d84mr70668465e9.16.1732205239981;
        Thu, 21 Nov 2024 08:07:19 -0800 (PST)
Message-ID: <8e233118-ed75-4b85-b753-a815952661f2@suse.com>
Date: Thu, 21 Nov 2024 17:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/bitops: Fix break with in a for_each_set_bit() loop
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241121145000.3107723-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.11.2024 15:50, Andrew Cooper wrote:
> for_each_set_bit()'s use of a double for loop had an accidental bug with a
> break in the inner loop leading to an infinite outer loop.
> 
> Adjust for_each_set_bit() to avoid this behaviour, and add extend
> test_for_each_set_bit() with a test case for this.
> 
> Fixes: ed26376f20bf ("xen/bitops: Introduce for_each_set_bit()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nit: In the title, isn't it supposed to be "within"? And in the 2md paragraph
there looks to be a stray "add".

Jan

