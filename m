Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9759B9F46C5
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 10:03:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.858649.1270896 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTTY-0005DE-Fb; Tue, 17 Dec 2024 09:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 858649.1270896; Tue, 17 Dec 2024 09:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNTTY-0005BL-Ct; Tue, 17 Dec 2024 09:02:44 +0000
Received: by outflank-mailman (input) for mailman id 858649;
 Tue, 17 Dec 2024 09:02:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNTTW-0005BD-Tf
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 09:02:42 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac28406f-bc55-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 10:02:42 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e27c75f4so3866652f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 01:02:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c801ace1sm10557669f8f.60.2024.12.17.01.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 01:02:40 -0800 (PST)
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
X-Inumbo-ID: ac28406f-bc55-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734426161; x=1735030961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xjAZZXIZu4thRZG/EQtx9Gvia9nq9b5bV4ABjR28CUQ=;
        b=VEYZUDj5Di5jlyUDia67INEuPStoi9M8r+o7cEbtejIBcUjS3RK/iPhOVXAOlz2Mbz
         aKwtjAJPwozQUrW2uWmJzpkhSP71wjBlTGXoA1dTkNTBTzbcbbNUib4EHsWbD9Siugcc
         NJ8r7KEtibw2iKPbrbBso534wSBjjSxTlIyToFImdLZ6dxsDKN1LG0EpB/WMDtr2cjoN
         9OOyweT+sUveP1e+58JVjnSjGjOMYxMroF8B1KHC5xW1aWL7jvA3qsxwNQGKwAuFHfyT
         HTb+rIXXnv8TNmBeiy3DpnCkdXzAfOHxXN0qi63X9UVm6Bvvg0qr4OeURZEGQ2vTuU6B
         B9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426161; x=1735030961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjAZZXIZu4thRZG/EQtx9Gvia9nq9b5bV4ABjR28CUQ=;
        b=PTr3rzS+93CmuB3xNPcIlcYmAy5asLmtHGhm2AvsLCn4kmtdSog4rINh6p3ydpa6bv
         TPTelqxOGWvurwywM8dTHfDWaonkAMLoFEtbTvKyesYXzLy4R2GbSz5aLw5gL+e3Dn/w
         G7QwI+EfSbshAcUWIt7gdu79x0DZ+8uNAgxl8exh688UNCjRku3dZaa9FCfS2SXsFxJ9
         GfqaC5n3yRq5IJvl7q35iy4ldLrAiH3tOM1Ankqc2Ah7QYfxeePqGsFzqp2c8COUSk4c
         qmPbs/M1EGk5OZznS18yvlBD2ZvBKKMgBKd1NhwUyzbsrELGaeutTq+XfomKm6lRaXEe
         CE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXg/69eMN/nQTPFW36rW+Sr1QdTHhGaF5cB8UiIJ8LAZtJ16+E3ak8Ug1pd3t+ReejrOZkFNtsqTw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy+SrQpgRosiRg+oORa9GrtXuXQbSXXlQ1M3he4WE7rhYlU/0ME
	ZRCxfg/nV86BSyXq7eKOjq5J5k1RfZpuf/wMYiqmDoqVt0K0FiC/9Sf6TWbC2Q==
X-Gm-Gg: ASbGnctfG5Fuo/AK7PA2ZNPYHNOeGh3V1viROGGPuAeOghCxFbY85+VEXFQmb5Jjj6d
	T/7JRtizyZrNgYS7hmG8ZVHGRHi2U+EU/zV3GxXBTNoKB47+Y0WVKoNHIr8r5s5nmoMGZ0zE6EI
	VRlSItDB9evx/56w24MSa4iY0WCfkiWsEiL3CTW6KsWM6GNS1T+efXIuN5YFluPhb4QJQF27FSD
	Q8WradBuQRuhyzAdnYMsWPIql0kpEZr4Rj35jEy5D+NCQKN4BnERZferRLnj39qZM2yYqtDAOzU
	p+AGsTvi/cQ2nqRpEoX8bcAN7glj3WMQ9VjZx1qmnA==
X-Google-Smtp-Source: AGHT+IHAwkomFfJdPR4XAeJVfEWLG80Mq1QrbUImadenqFOabRzZ0S4ZI/Y6UKUPOe4dLs8sQgDA9w==
X-Received: by 2002:a05:6000:2a8:b0:386:3262:28c6 with SMTP id ffacd0b85a97d-38880ac2d54mr12501831f8f.5.1734426160740;
        Tue, 17 Dec 2024 01:02:40 -0800 (PST)
Message-ID: <61a277f3-5650-4976-9ea2-4cb7137653da@suse.com>
Date: Tue, 17 Dec 2024 10:02:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: add deviation for MISRA C Rule R11.8.
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <202c8efa4f846018e463f6242d25eb10c015d835.1734367711.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <202c8efa4f846018e463f6242d25eb10c015d835.1734367711.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.12.2024 17:57, Alessandro Zucchelli wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -393,6 +393,12 @@ Fixing this violation would require to increase code complexity and lower readab
>  -config=MC3R1.R11.8,reports+={safe,"any_area(any_loc(any_exp(macro(^container_of$))))"}
>  -doc_end
>  
> +-doc_begin="Function __hvm_copy in xen/arch/x86/hvm/hvm.c is a double-use
> +function, where the parameter needs to not be const because it can be set for
> +writeor not"
> +-config=MC3A2.R11.8,reports+={safe,"any_area(any_loc(text(^.*__hvm_copy.*$)))"}
> +-doc_end

Documentation text is quite a bit more specific than the config line.
Any function anywhere in the code (even non-x86) with a __hvm_copy infix
would be deviated this way, aiui.

Jan

