Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B620E9EB1BE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 14:17:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852357.1266170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL06x-0001N4-3i; Tue, 10 Dec 2024 13:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852357.1266170; Tue, 10 Dec 2024 13:17:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL06x-0001Ku-19; Tue, 10 Dec 2024 13:17:11 +0000
Received: by outflank-mailman (input) for mailman id 852357;
 Tue, 10 Dec 2024 13:17:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL06v-0001Kk-Ny
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 13:17:09 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ed2e5fe-b6f9-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 14:17:08 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so2436787f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 05:17:08 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:8df1:d232:d9a2:1ff9?
 (p200300cab746063c8df1d232d9a21ff9.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:8df1:d232:d9a2:1ff9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386220b071dsm15629457f8f.101.2024.12.10.05.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 05:17:07 -0800 (PST)
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
X-Inumbo-ID: 0ed2e5fe-b6f9-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733836628; x=1734441428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7NnMrJ1jCt3SXxiczbCnK0KjHO4wCfNpPKuiIhRFoUM=;
        b=R3UqxoszpFfSJlatOfGrm7LaQ0EPiT4kSpGGxQ3Dlj1NfV7SPqZ6EJiQ3jh8J2tTJP
         uCAFvoOc91t0nUxzZQouvPoy/c8XIVtIYWQjvn0767WIuRtIRpttUUkodXclrAInHcLa
         Wl4tOjFOV2ONelH14o9xGIrYC3nwN8l6yz5jSQy3tZePhNdG2UE6hE/i4GcaeCnnJCWV
         AaYrVBdlCgG4GU0/EXUxkM4Icnk2WxMQpQmnYki+vM055FgKalJiEuan6/GsDAwxQDZF
         Tm8IFZDOsC2Xs+nvJaLH8cFqAgQv2h5pLoDTaaNWnbiSfSZ3qcVW5FZs/jEyOAiByerO
         ceyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836628; x=1734441428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NnMrJ1jCt3SXxiczbCnK0KjHO4wCfNpPKuiIhRFoUM=;
        b=fVLEemJvcDj98uI8rZWE7tWaSAn9kY50A88I3nSTXDUMGj4Xn/Pvxmf1F8gcVvxAEp
         oWh9Xj5FPWsnEI/j1SaMWKAu0Myp9psOLrBi4lDt+qgqBoT4RwdzqgInOwmlB/gbJpft
         wHFegBCsodRs2ZXbtBgKm0hCs/tHiZ2HlFv4BixwVrXFXAki8O9mk7zpjL4QWEMKHsSh
         daWWi0F9ATHZ9Sr0xQ1Oq3RvM3eG1X1Yk+h1RtjIkiipwNvUSctrpBldv8GlrqpTujWk
         PHfMZW0NJd2TRNyGc5tiZq513XF0oJKglWmwhE83cqifXbsp3dJCLp2yBSXiruP1W2tJ
         QvCQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+GL8p9OIg0dt582QFrVuH1J0fswq7kYj9opr7m65ziyxqpU3B8nGRgis4PakFCCPI2HnzQbI/DvE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YympZn7XrfyXO/7NksWLM3njq+2+E/md87UFUYaXOCFSZdXeZDR
	+3j8Fq+T4bwIlDVQEzb4pp9VuVweU7HP4d1YFCMGHjcBGsmpGCE6nFzUFOUI9A==
X-Gm-Gg: ASbGncu5X8/DEwKSLV1iF511Eb4VDoRTpOvcq7icZjya1U58bdrK7FGbUpwx8Ossob7
	ikH/345dB7zlA5Qos23EKZ2h4TmKy1SQRcNL1dyAZ67U6pzUEa3bDcvVJ7mVN4rO1AGFpzPGo0O
	yKxfaSoVPT7I7fxSXAtJ85gbXAe3lSnDC8opv8oVaCIXfrN+NsNjG396Cy1FEDcF9aFw/dgf3ke
	gtCg1PIRH5KaKzW2RNSUKz2RKcuDe5TxMXpn8KdwFe0VFuE3OqEDwwr1BMtMskmJXplY/jXAdws
	Gmf8vab01Aw3r8Vo4tIylrIfCcsUJmhLR8kWIMhQyw5HzacLgQpDdebz1KnzA70R0Bm08UbjTjW
	CciCftvuL/g==
X-Google-Smtp-Source: AGHT+IFPB3t+svpamS6wHJE6uW8uhwUbVL/32mp39xubyJa6AAMR1jQcgRdgl34mzS+hU3KO58e6AA==
X-Received: by 2002:a5d:47c9:0:b0:385:f349:ffe5 with SMTP id ffacd0b85a97d-38646a09222mr2319330f8f.29.1733836627973;
        Tue, 10 Dec 2024 05:17:07 -0800 (PST)
Message-ID: <8c7daeda-2a00-476a-9a86-806139035cd0@suse.com>
Date: Tue, 10 Dec 2024 14:17:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/35] xen/irq: introduce NO_IRQ
To: dmukhin@ford.com
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
 <20241205-vuart-ns8250-v1-2-e9aa923127eb@ford.com>
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
In-Reply-To: <20241205-vuart-ns8250-v1-2-e9aa923127eb@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2024 05:41, Denis Mukhin via B4 Relay wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Introduce definition for IRQ resource checks.

How does this fit ...

> --- a/xen/include/xen/irq.h
> +++ b/xen/include/xen/irq.h
> @@ -53,6 +53,7 @@ struct irqaction {
>  #define AUTO_ASSIGN_IRQ         (-1)
>  #define NEVER_ASSIGN_IRQ        (-2)
>  #define FREE_TO_ASSIGN_IRQ      (-3)
> +#define NO_IRQ                  (-4)

... the grouping here? The constants in context aren't used anywhere,
so it's hard to see whether / how the new one fits here (and doesn't
instead belong into the new resource.h you introduce in patch 1). Once
again likely best to have this in the patch where it's first needed,
thus providing at least some context.

Jan

