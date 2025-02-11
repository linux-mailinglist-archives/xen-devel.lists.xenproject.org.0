Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF57A30856
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 11:19:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885291.1295084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnMY-0002ZR-5r; Tue, 11 Feb 2025 10:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885291.1295084; Tue, 11 Feb 2025 10:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thnMY-0002Xy-2C; Tue, 11 Feb 2025 10:19:30 +0000
Received: by outflank-mailman (input) for mailman id 885291;
 Tue, 11 Feb 2025 10:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thnMW-0002Xs-Kb
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 10:19:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab415b4b-e861-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 11:19:25 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab7a342ef4eso611454266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 02:19:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7c3c5c77bsm360981066b.74.2025.02.11.02.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 02:19:24 -0800 (PST)
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
X-Inumbo-ID: ab415b4b-e861-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739269165; x=1739873965; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M9fWU03JggM6nQWL5oL+G8twbZz3fh//TiwLK7au5q0=;
        b=P/JHysykdSw6/VzLlrberjDs73SlyRzfQUxK5eaNbr8jwnboiLD7LKIeS9qJiC6HoQ
         Ib4f4oeIH5bNXWGpY2VDXJEmCUGmAKYY4t5NYiSagsq3Nhqe57FHgWwvfdR8DS0Ce223
         BfUmeL38cArmHxNu6VTRRPdux+qDoU3rF1F3WtBH8/FBRX64ctYjw7CFGqfMh8Ev8GfJ
         jDS6dImbBIcWdg6bkJKn4p5fi2wLDP/Ie4fBzIhNcGUAoJg7S7ujaQZeiFx4+8AV76q6
         qv15poYega1HO2KDHS6IKLpRSILMqFxkbXcwUYwb/3O9ZzAYE7aVzaIc5E5mveFAxFUq
         qBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739269165; x=1739873965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9fWU03JggM6nQWL5oL+G8twbZz3fh//TiwLK7au5q0=;
        b=nkoPZRB8iun0xVI9gyO/KxMTZ3WPoKLk6qSowAg0zytwFAwJWzEs68ucTXibtJQgKh
         tK6WKNdmIkxVIr4Hp42U6LW8cgOsoMHj/955vXBM7HmTfQB1ILTulg+hzDojBCe+wpE1
         /yKkDjVW5s1QWcWSl+SHn8JGWK4pEbmE+TI/dNu/O4AswHO6YqB0cTcZJSRBgOiOnwNJ
         4/mZwNK02uW4TcUNqyX81m5Y6uuh1ubn6VqOrRa2VokDX9K8XpPs0octsolQqxLhaHZq
         g3qis7cQzwJypu2PFpqEf2zaJqnsS/u5RYOG/9O0uD2jYbjV1aVGFQXxHCipCgDDyVE/
         l6vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVryAoJA49QWy25eXlqRNMA9i+fHMDK0ZJXkUuZuK7qOc0DwkG4LeGVTObChcjVQkJ6vxggeRm0r94=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoDmtX4n6/QzuLf0vxgo3CFV2ohbxEiN6ZjFyIxQ+wFiiogMpL
	bv32+cYO3LRKUV7qH8fl/+feRtUfREzvg2UlKkHOfYj8tZiwIh16RGWIWbqwJg==
X-Gm-Gg: ASbGncsXqVaDYs9eYx/X4TGgrTFhlSTNIrqFzrjrrXvzf5AY7k0IdRbitHO+1OdKmYg
	IL//f73fHAYgQvc0Okho/x//lCwn+Ae0EvUoFcLD2yYA+AkPAZWC/CZIBql+C17LM8u5h2r3WQ3
	q2wEwet2dN27Rvmc8fVg0MLnhtosKQdTObPDAEwkDxEn69UYcEUfP/M0V2VyFHyW9yA46DoEHwP
	pzRfRt0++RFZAOZk9ZZsmd5pqXBgbAyxotAVYn7g8tZrvTnrX9FPp/4RONUtX+iuEwXfPAVaaUl
	tL+XK9UGCnSbGLNbmHKlgyJL2+TUMjn3V3dyt1sC+gk0wK7LsWg3k+j0T7aYho27G5NwIEbNEca
	t
X-Google-Smtp-Source: AGHT+IHh/qiIdALMoL+ty9fOl0NCNLQdhSi2zS0++s8w//YpEhDOOZVPsTFrTBA/QoKPb0SR6B/IWw==
X-Received: by 2002:a17:907:94d2:b0:aa6:a87e:f2e1 with SMTP id a640c23a62f3a-ab789c7735bmr1682058866b.56.1739269165029;
        Tue, 11 Feb 2025 02:19:25 -0800 (PST)
Message-ID: <55c4d9e0-77b2-408b-9bb1-8efed95891c1@suse.com>
Date: Tue, 11 Feb 2025 11:19:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Coding Style Review and Automation
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <5a15f8e2-079c-405a-95ce-92585ac529cd@gmail.com>
 <Z6sR87FrKcOhgEqX@macbook.local>
 <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
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
In-Reply-To: <4677686F-97C4-4D35-A113-0D8A1C0BC328@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.02.2025 10:10, Luca Fancellu wrote:
>>> 3) The size of the patch after applying clang-format is huge. Really. Something
>>> like 9 MB. Even if everyone agrees that the approach is good and we can proceed
>>> with it, it is highly unlikely anyone will be able to review it. Considering
>>> that new patches are being added to the upstream during such a review, it may
>>> also lead to new code style violations or require a new review of that huge
>>> patch.
>>
>> I think this approach is difficult.  It would likely introduce a lot
>> of noise when using `git blame` (I know, it's just one extra jump,
>> but...), plus would likely break every patch that we currently have
>> in-flight.
> 
> I think we already discussed this in the past and having some churn was accepted,
> also about breaking existing patches, every change merged has the potential to do
> that, this one is more likely but it’s the game I guess?

That's easy to say if you have just a few patches in flight, yet I'm worried
about this when considering the hundreds of mine that are awaiting review.
Of course this would be of almost no concern (to me) if for the experimental
phase it was only Arm code that was converted. Yet even then the plan is going
to be to later do a full conversion (to whatever the worked out final style
is), and I don't foresee the review situation to get any better. It'll be only
yet more patches then that will need re-basing.

Jan

