Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E015A6A7F5
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 15:08:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922116.1325981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGYj-0002Al-PB; Thu, 20 Mar 2025 14:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922116.1325981; Thu, 20 Mar 2025 14:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvGYj-00028B-MS; Thu, 20 Mar 2025 14:07:45 +0000
Received: by outflank-mailman (input) for mailman id 922116;
 Thu, 20 Mar 2025 14:07:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvGYi-000285-TG
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 14:07:44 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0c1d620-0594-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 15:07:42 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3912c09be7dso523227f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 07:07:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df344dsm24592015f8f.10.2025.03.20.07.07.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 07:07:41 -0700 (PDT)
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
X-Inumbo-ID: b0c1d620-0594-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742479662; x=1743084462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oIQRrlnqHr8EFcLOdNscMcRAGvjkkQ3MoSzpL042RrM=;
        b=Uoy34Z4Uh6mEMID4qgBO35Cqz95PDXpKBZ78Wcz0KGETL+Rne5VQiZJG3/5R8pynk7
         d+G/m7acucUXCgI6zVakmMvhG9QcnP4fmRebs4/u1aTgs69HTGstbvBCzbk4s2TLmeXJ
         S04jPBMU+3qrKmRWUw4audG4GwupOGT8OQ+X/oX9bUttXT7tzTV1z15CaeBRa6XXBNfo
         OvbjjxSYv4gizYpIoL3JWbBaJ/vZQJXhlEjJcP1IqbnPh+inwOyQZ+B0gsd5sw6tgFob
         nu2PW0Tz4lDueR0rrA42bJN1ZCGABVWqNKIdUe7OC7r8XuPSuQv8IjzPUT3ifYtbiMbQ
         TAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479662; x=1743084462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIQRrlnqHr8EFcLOdNscMcRAGvjkkQ3MoSzpL042RrM=;
        b=QMV1uhl7L0wMEhHqGnVkRzyBG+gJD3OZom+8jTvxwqL/Bna07yx9uR+w9y593Swfas
         O24cGGVuvdrejtxcT9oNVEJBwhak34DP+bOSRIdEe4JDdjzCTe3n5bbwWnUo7yBP2BGT
         gpBpxH/a3v8BtwMYYXvbpnkqYrtHcXkAylLR9AhNG4Fw6B2NC4MjkgD0A4t10WzIuV9f
         KaDdkj6PeKuAxrTOIU6zbaQGoVvdBpI1TyGijY28pazCsv/PzXxQdka68Z/4GQ5YgQWB
         QGixJu03xUBYXOFQUHUakHhAmB1xGRcCc/S0ctUrl54b1t4TNHztNyP+nef2SNlT9fZY
         PCxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTvlJhYA0htADdrxDHlsrqh3Y5hKezbug2afrmQqMYad8SHqljGv4ybKGaztxbaM2k4lxLpGQ7dVI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypyQa0RHRBurgaaM0cy9kgrCx2cmpWEq9TbxBdR+d0QqxOhxcz
	uHJXwm4RfvByqPMGGlCJMvFr6tbdMLEhWpsWenmwvT5Bp3LQLeXnSkHfAnEwlA==
X-Gm-Gg: ASbGncsmBV50YQZk3k39gJEucX8WvQgQbh03TGZznmbmBpsHp3BnT5DFnMpub/2j8Ke
	n2g9iEqyArVj6ypRyVEXaL/F4i0RRRNbBWw1CZZKnTmoX5GvMcDITKA2mLIf1Q0yKYUPt6KREuL
	jQ70uEKfqu54Q2YX+riT3CJZrwxqou9O5rXr8hKutjED/jjH6XCY+VWmiVVuFmUGwsZzyLZXL9/
	T5GP/MNU6pQn5QEgUz701XzK3Nm1B1I3VhTKhyibC+o7Nw+MYA+tr7i6VYZQfiDnQUWMLZaRNbV
	sMVHdVWnxN8jHkWuDCa3Q+Eg5zgRnVwH8i8/rkZPf9rO1oNbJdqi+3aNknA7H5dv0WKZ051YC0m
	fV8AhXagxoCNkYq8bEeUouY8kDzMAjA==
X-Google-Smtp-Source: AGHT+IH2OOtsNhM2gB5SM6Wacs/c1PekLxESqMLeQDngAMZwkWqWlMnNAk8KGmhhNr+aoo1b7ZZzEA==
X-Received: by 2002:a05:6000:2a6:b0:391:2391:2f79 with SMTP id ffacd0b85a97d-399795ddfa3mr3404957f8f.43.1742479662141;
        Thu, 20 Mar 2025 07:07:42 -0700 (PDT)
Message-ID: <faaa5210-6f64-4553-a9a1-1ac217a63646@suse.com>
Date: Thu, 20 Mar 2025 15:07:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/4] x86:svm: use nsvm_efer_svm_enabled() to check
 guest's EFER.SVME
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1742465624.git.Sergiy_Kibrik@epam.com>
 <67e52e38695be12aca828025077a378e92174952.1742465624.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <67e52e38695be12aca828025077a378e92174952.1742465624.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2025 11:34, Sergiy Kibrik wrote:
> There's a macro for this, might improve readability a bit & save a bit of space.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



