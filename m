Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F8930F6D
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2024 10:17:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758711.1168147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGsc-0002zP-N1; Mon, 15 Jul 2024 08:16:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758711.1168147; Mon, 15 Jul 2024 08:16:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sTGsc-0002xT-Jc; Mon, 15 Jul 2024 08:16:18 +0000
Received: by outflank-mailman (input) for mailman id 758711;
 Mon, 15 Jul 2024 08:16:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FSyp=OP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sTGsa-0002xN-NG
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2024 08:16:16 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81096333-4282-11ef-bbfb-fd08da9f4363;
 Mon, 15 Jul 2024 10:16:15 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so6063520a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jul 2024 01:16:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ec7eed2sm3753563b3a.116.2024.07.15.01.16.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 01:16:14 -0700 (PDT)
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
X-Inumbo-ID: 81096333-4282-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721031374; x=1721636174; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c1fCl8hvuy8T3Cz9xkd6LC3DHO1chOq/GeAxdBbXZ+I=;
        b=P/US6n1GawKJnh4vci/ggoSiT9JMnsZSNyHKHZn1f5wc70ntyrgwze1eG86m+tFkbl
         hyZvYdqysskU9PjMRIfxmjFi2D4asg7hOTpFucmDJyT9lC9nkgmn33TcLErjTF2bs++/
         xONjjJcIX/cgeXu9jg3xWLiWEnYg+tzUJWfRMp2NPpUlPrNhZsM5EAy2fndkT7HzyWYx
         Q2KX5aNp8gs/URhdQRm7qXITwrHer3cBoqb3Rmac78RUtYK5TYUI4E1TFugMsi7YBzPG
         v5nG+3UZV/tzry6Y1nruNzg/Dv5V4B8jRKe3jmd1BC80I38cjd2Mo9REXJBrrWIa8kCT
         dubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721031374; x=1721636174;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1fCl8hvuy8T3Cz9xkd6LC3DHO1chOq/GeAxdBbXZ+I=;
        b=vy5qFiW2h1IFWOK0ZpYDboH3VHTwcfaJbr8B3+DmG92lqG1WBORs/8E/0MFUI8cC8U
         RfpapPfG/6MIVFtfxuvL16BwW7OR3Rzm2bYBGqPzQ9hPfSmbqLnxun2WvZUEaVE9GzHl
         dmWrG0ldnaXu2FMejKpY7kBQjbDp3CaA8zkpGBwr13sxdOpVtf5UoLRhWqE4giXi6Iy7
         zEGQ1fz8qlfG2ADG5OKOuGTQ40M3mts8T9aqVxzmE8dHlDBnZnOGhJp2y3IK9KCTEBvf
         Kd5uKIaS2mWmRlIZubabTTogYKDsoWd6L0EpxB8hESvCA9HRoWP2zVKbSQG2aJHRfXQP
         7Hew==
X-Gm-Message-State: AOJu0YxjOeMN0rNqFd6qwMZQCHMBj2Xt9dBzPUV/0aIJ3QQS48JuK7FH
	lAK6hLQL0O4cIQIIITe3A86Bra/DHTg2wc3w3NmvZYelQ1BpaFSqLkDh8LoSQA==
X-Google-Smtp-Source: AGHT+IHtUgW4bS8zjANZXJD8SU3NTnIDfsFoWcYPzXhUO9H+/E+b1tp7MF8Le6aHRZwNrilxWeOuKg==
X-Received: by 2002:a17:906:7d0f:b0:a72:5598:f03d with SMTP id a640c23a62f3a-a780b884b2emr1071519066b.59.1721031374515;
        Mon, 15 Jul 2024 01:16:14 -0700 (PDT)
Message-ID: <77f1ff6e-a7dd-45c8-b706-429674b559f2@suse.com>
Date: Mon, 15 Jul 2024 10:16:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Help with Understanding vcpu xstate restore error during vm
 migration
To: Fonyuy-Asheri Caleb <fonyuy-asheri.caleb@inria.fr>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <60751777.2038091.1720694327760.JavaMail.zimbra@inria.fr>
 <94e94a94-14f2-4fa6-bc3b-6c64c1b84b59@citrix.com>
 <1546743760.2065506.1720696161057.JavaMail.zimbra@inria.fr>
 <8f8dac21-92fe-4760-8578-2fbfde2f2c14@citrix.com>
 <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
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
In-Reply-To: <1557490999.4048664.1721029086794.JavaMail.zimbra@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 09:38, Fonyuy-Asheri Caleb wrote:
>> Perhaps the more important question, are you booting the skylake with
>> cpuid=no-avx on the command line by any chance?
> 
> No. I didn't boot any of the machines with any cpuid modification whatsoever. 

Yet is there perhaps "Mitigating GDS by disabling AVX" in the boot log of
the hypervisor (which sadly so far you didn't supply anywhere afaics)?

Jan


