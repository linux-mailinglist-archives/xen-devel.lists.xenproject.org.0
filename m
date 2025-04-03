Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F9DA79ECE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 10:58:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936383.1337647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GOp-0004LT-Vc; Thu, 03 Apr 2025 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936383.1337647; Thu, 03 Apr 2025 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0GOp-0004Iv-SG; Thu, 03 Apr 2025 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 936383;
 Thu, 03 Apr 2025 08:58:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0GOn-0004Ip-P6
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 08:58:09 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c351813f-1069-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 10:58:08 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43948021a45so5632875e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 01:58:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364d07csm11786055e9.28.2025.04.03.01.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 01:58:07 -0700 (PDT)
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
X-Inumbo-ID: c351813f-1069-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743670688; x=1744275488; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=embU6GXLDQ92HwWH0WfoeQy0wiSalRwveP8jnXM7BRA=;
        b=Q2BCYzVNH0A8vHpJdYequ+R2moQsgtGbbbRVgFTWmxRgbmGl7msvO90Ijhaag+Cfw+
         NSTqcUulYtPXtY2nFueDvW4alA/hte5iefrcXF8crm7HyLoPGht0RWLD4HmbddpWkhFS
         LTJ3mms/EOphMH6XnNbTzeV70ASwhCmvgNtJM/nSNyRNjUceRbZcyC26mx2H8u4yJUhE
         xsxrC2AcQLL6bM20XzP9bpU1XnoNvpUE0RpPpguepOf7s3zA6psdy4hm4Dejle87VGNL
         KXklLaqMR6zBxOpz/Mu9nE1k/gIUfEZO5FQ2Xj20iUlEy0JZXgU2f/zGqc2oFwI0YGwB
         PmiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670688; x=1744275488;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=embU6GXLDQ92HwWH0WfoeQy0wiSalRwveP8jnXM7BRA=;
        b=fFU2Iz8smT/mLLJMvdwhnXFlQfQ2oVC9TfD6d9ATpQNdhn64j6LaebFKKNwClzQvqA
         hpNUPjxE22Rc+TlW7fvKMmXP+D2bBC0EAGkwv831JqtMLbp4X/Wv4wibDotE7G6nDBGz
         Vo8gV2Oez313PIQ/A/VXWqVLnOYeYm75MONR9po2yZNMsWEpcJLxnRW/CScLmvk6qoB4
         9gs+VM9H/IQs9igqZJg5+C5XuOqjqNF+GoNvTdTqUyxEjFoFDs/PMdjmIZ0WExCln/es
         jP4+exGEizWDOQ9hGcj1/jEWlM+zIePAT7dVQEbq1w/DEuZ7SjIXEe+b3VLPB0hgZAJF
         d14A==
X-Forwarded-Encrypted: i=1; AJvYcCVbTTBTlGK3EzcLGUgXqAE/jSka5AK14aFDzWRgHTVho2YIHR8AgJCunIX9DebJeYNsizdehWBgILE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzK7ZXtusl0btWaB6qJnMepsS/FdCAItSJsaxj0m7Y6/zpx7S0I
	UmYE4zxaaoYHDlSwJ1SJRe2wpWEllbLRMrBziu4tP2I4fWABzYTgTmkr+9XaEw==
X-Gm-Gg: ASbGncvMp/GVt74hxrk/qW3pMr7qzdUU+Z59RuTuaw5lNEKoM29BJEnBDoTXinNFYAX
	un5pjNWNqj/bCpjdL4s6B/Y48tu6AitY709XvdsrFkmv6IAannLdfw3g1bmHpP+rxI5CzRBvsBW
	4NqdEENfDxMlK7xrc+0IND7UqiGxHi+MyT+fljvgdJJ/JdlhOQVeWROuHNps1rVeYDPyVMo6ukG
	X1KXuFDJ3wAnzNOVF+Wb9Y3HIrOIdf2CAqZfBXO9cvuV96/KfMLHQvSsVD7txhwUopQNTHUfH6z
	Q/OZEnGHu/lxjNLj7Zz44Au9HnDp6T8MwoL6wpjIENdROKrKsZfAlbFf6Lhb5xROyxH9lhk4AA/
	6eAh8N/JTOFUTmBmE66THX7Tt1azwkm0Em9rWxTRY
X-Google-Smtp-Source: AGHT+IETAI01sLG7/7JGHOS6pyEJ52dbp5Wcvtoq0iH3+VD5wDsWhtc1vb4FYYgjaXkQYTbsc+2rxA==
X-Received: by 2002:a5d:5848:0:b0:391:45e9:face with SMTP id ffacd0b85a97d-39c1211d5bbmr15251881f8f.54.1743670687883;
        Thu, 03 Apr 2025 01:58:07 -0700 (PDT)
Message-ID: <a67d260e-fe1a-44bb-8b49-fa0509716da2@suse.com>
Date: Thu, 3 Apr 2025 10:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] automation: Add Arm64 MPU build job
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
References: <20250403081916.6834-1-michal.orzel@amd.com>
 <20ac780b-f5ac-4531-997e-362d72adddd2@suse.com>
 <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
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
In-Reply-To: <2a8ab261-480f-4bfe-b2b7-7fdff4516078@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2025 10:44, Orzel, Michal wrote:
> On 03/04/2025 10:43, Jan Beulich wrote:
>> On 03.04.2025 10:19, Michal Orzel wrote:
>>> Just like for RISCV and PPC, the earlier we enable the CI build the
>>> better.
>>
>> What about Arm32?
> The series to enable compilation of Arm32 with MPU is still under review on the ML.

Oh. Is MPU in Kconfig then missing a dependency on 64BIT?

Jan


