Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595B812D37
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:40:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654438.1021353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDj8r-0008Jk-Ka; Thu, 14 Dec 2023 10:40:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654438.1021353; Thu, 14 Dec 2023 10:40:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDj8r-0008HW-Hv; Thu, 14 Dec 2023 10:40:33 +0000
Received: by outflank-mailman (input) for mailman id 654438;
 Thu, 14 Dec 2023 10:40:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDj8q-0008GF-Ef
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:40:32 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 343f4a20-9a6d-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 11:40:31 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-551ee7d5214so914159a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 02:40:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ga22-20020a170906b85600b00a1d3e9e8be7sm9000308ejb.204.2023.12.14.02.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 02:40:30 -0800 (PST)
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
X-Inumbo-ID: 343f4a20-9a6d-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702550431; x=1703155231; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cWi/xWteB0dJ+cLa6UZTA/zWrYQVrv5W0pjDjSwqS5s=;
        b=D9SG5aIoRo0/fnduFmQTdUspGebfkaTdtswTjKHwY8Do5qgJGvSzYnE0GNsRYGK257
         eikVSpPuz0azyl+hlmDSHClIp7+nHBGQAu2vkZbLGztrmxJXF3VN5gT9+WUzCkFQdKeC
         y93pP8J4Fk026doTzDNF49wPwd5DgjIIo7Auj9xjmpKXIR5FA0H31N2mHARof1iVJR1Z
         k1nxDOnJdtgCqMZsk+nlogAW4LWx1Mt8qBw+wUn/cgNOa520T07A7nRk74mUnRQInkyl
         vfWkfkV0n9NYly/Z+ijqnonwmITf2ZW3chY/BubWctDzCiAI5VnQtghG9J7sNaQnktoB
         GG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702550431; x=1703155231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cWi/xWteB0dJ+cLa6UZTA/zWrYQVrv5W0pjDjSwqS5s=;
        b=HpRM+IR/IjM8x+dlra2OTsp77Ac9lHW/QS+2rN+uCZOW7denFZD3qDD/INcgqbp6HN
         qUX7Xn11EpLBDbwASyD1ajpVjTpHmkGvaByC7DFEt97DFzSMofcym2lc+Lci0F2zLqsp
         iOkHPYYGMvP22SmIoESapeGIDkQMz92aZoTGTD6x9wCllY2a6Sif3+nqtR4IKQxaAtKp
         bRaz8Z0tFHlqDLQ/6tPx8xxQo2schlCSP8eKoG+KoJe2t5h1/mClL322ZwdP3vApOsKF
         V98agoTwlfrJZ9H+bx0jT+WxaqsH3EdZcFM247RS/ArqPeUb1UAT7v1fWFlIG/mPns+5
         pczg==
X-Gm-Message-State: AOJu0Yx6Pc9BLOw3YqL3DmHgY1EMRtorP4dG8VY8KA7ZManMDDoXBgti
	UaAUKBRVzSjwy4reEZgjD4LT
X-Google-Smtp-Source: AGHT+IEVktsKINVR2V5tJtIyVOjDq3r+pqqwkCTma4C6OtlgVLWNEMqJeG9EYa2qX2VtyLc4UufhFw==
X-Received: by 2002:a17:906:af04:b0:a22:e827:fb7b with SMTP id lx4-20020a170906af0400b00a22e827fb7bmr4278422ejb.23.1702550431012;
        Thu, 14 Dec 2023 02:40:31 -0800 (PST)
Message-ID: <302a5dde-5b08-4a2d-8571-b28dfc8fb130@suse.com>
Date: Thu, 14 Dec 2023 11:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/x86_emulate: address violations of MISRA
 C:2012 Rule 14.4
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1702310368.git.maria.celeste.cesario@bugseng.com>
 <da78956b9dcb09ef78cc31debb58ad781b33dbe9.1702310368.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <da78956b9dcb09ef78cc31debb58ad781b33dbe9.1702310368.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.12.2023 17:10, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
> headline states:
> "The controlling expression of an if statement and the controlling
> expression of an iteration-statement shall have essentially Boolean type".
> 
> Add comparisons to avoid using enum constants as controlling expressions
> to comply with Rule 14.4.
> No functional change.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Somewhat hesitantly, as indicated before:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

