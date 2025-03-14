Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B827AA60FAB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 12:12:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914381.1320152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2xP-0001Vg-Ao; Fri, 14 Mar 2025 11:12:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914381.1320152; Fri, 14 Mar 2025 11:12:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt2xP-0001Tk-87; Fri, 14 Mar 2025 11:12:03 +0000
Received: by outflank-mailman (input) for mailman id 914381;
 Fri, 14 Mar 2025 11:12:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tt2xO-0001TY-93
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 11:12:02 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f77565-00c5-11f0-9ab9-95dc52dad729;
 Fri, 14 Mar 2025 12:12:01 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso13188305e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 04:12:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318a80sm5295100f8f.61.2025.03.14.04.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Mar 2025 04:12:00 -0700 (PDT)
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
X-Inumbo-ID: 26f77565-00c5-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741950721; x=1742555521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aOdt+TF+5jCROqr6LrWav4exmtUL+WDYUGY7F3zuLiY=;
        b=DFI8fA0DRtM+uPssf5CTDrRx8NCGlKGDkmoFs/i73chWFS9HjKM7CrQ7PB1ojZ+drr
         QGcB3F+Y0FztCyBOXfidskk14BbXChm62q1gGll30HR/EM5nuZeHRfa7ihszvMM9xY3B
         Go2vfKeEA7Ax6J0r++yeM8Ogc3mjhFUi2OfpAjMxNdZ9sCv7EsNYw50JrQ0u6jXzthPD
         2j+XD8cSYcNYWHf1PINi1vOZ+GIebC73XtPGKjKQUjLIWzsMYmVw4hbz6qiaFT8tsDcY
         cy7ltkuNjrpNkorklAHd3tIoCDntwcNFVn24K1CPDvK832ykyjVVWesOpNHL6NUvLaaQ
         YzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741950721; x=1742555521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aOdt+TF+5jCROqr6LrWav4exmtUL+WDYUGY7F3zuLiY=;
        b=ftZi5p44xSKCm2buWcx7JkY7j1yLUJjGQWLE3e9KYihGfzCawPtBR6nbO3vuurBzbk
         DqkEKu17oZO/Sb2dhlaMCnrHnapg771lym/EjZg0CfAFO1xRLn9QO3Muu39pX7wz1+zE
         Pm1rV5NImgYaQxgMq1ftJecFc7p2wcWO5UIzBH4zzk7Wz8xCQaNBgjeaM6u0L0NPSmsr
         znFt5BzH2RtL8kWLi5tRXLSb9cr5byUUebP1+nmIyg665d8MdVZ1XDNw/CO+Begoqi9U
         jwTXGSL8oo1+ffkV3mJFPCSuX++OjUalVjIZkNo9I/1zqV3KaLWlMgiFOKdKANwarFHr
         ABSA==
X-Forwarded-Encrypted: i=1; AJvYcCWlchxnt28mFQfNMiQW063Knf8HVZix5j0m3URj47wXqR2wE4j8xeyR7+dmhJS7aPeuljv9dUl+1k4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA30dzsnfbMwVYN/Rx0R+NyAblQrqxN8QoNfpgjGfpv495eCO2
	IxJanXtQyjk5fCq2Kk6cG9NMOGz8045FUE1bEfJUxv4lyUKV1DdPu6mxFkqYGw==
X-Gm-Gg: ASbGncvwVlzwL1Zwm6k5qTDGXPtj+1wdOMnTozqw9rKR7f8vf/iJ6ToWfOixDJ/kYeq
	J6SnPxAhxb9MmP1IoEvfydNSmGPz1fyVUCWo+b6AsYk+oZREoJ+arDxijfhYamsXLQpQ2o+QQXp
	7zMeP16bPztKrev9wXl8cJ5/YB9jvOdAKjoMRZShIia3vSaWgIZOJj3y9CVusbX0bBNJ5vyoEMk
	MjFYm6ZRkoFyHjKadNWnvDR63hNJTOhpvdm6oiLWhGEFxxA409kpwJakNer6J7MgbrWjVDVQPsy
	fqbx/6PTrITK6TSumQRDk1PDr9zkeOCLjIUVs9vamTpmnUzLo284vyZj5VjcIjmjt4gOEms5cUg
	PuGGL/3RgnDppFcZ6zwTWM8xuNeHDnA==
X-Google-Smtp-Source: AGHT+IFE6snGgKELAikGDvNTTq9wOY5ycnL7glLwhLNdqcyZ9rzJK10D7tW4bBF8bDaX7eWgzP1GWA==
X-Received: by 2002:a05:600c:3b10:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d1ec78437mr27357865e9.10.1741950720824;
        Fri, 14 Mar 2025 04:12:00 -0700 (PDT)
Message-ID: <871f6abf-5046-4435-91d6-b8ce2d9dac06@suse.com>
Date: Fri, 14 Mar 2025 12:11:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] x86:monitor: control monitor.c build with
 CONFIG_VM_EVENT option
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1741772330.git.Sergiy_Kibrik@epam.com>
 <39235285ffe341e446bf0fd5cc345379ae394e50.1741772330.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <39235285ffe341e446bf0fd5cc345379ae394e50.1741772330.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2025 06:23, Sergiy Kibrik wrote:
> Replace more general CONFIG_HVM option with CONFIG_VM_EVENT which is more
> relevant and specific to monitoring. This is only to clarify at build level
> to which subsystem this file belongs.
> 
> No functional change here, as VM_EVENT depends on HVM.
> 
> Acked-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

I see you've adjusted tag order in patch 3. Why not also here and in patch 1?

Jan


