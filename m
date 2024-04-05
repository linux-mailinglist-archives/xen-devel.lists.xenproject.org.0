Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B479899E8E
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 15:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701307.1095680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjoG-0001XN-TS; Fri, 05 Apr 2024 13:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701307.1095680; Fri, 05 Apr 2024 13:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjoG-0001UN-QI; Fri, 05 Apr 2024 13:40:48 +0000
Received: by outflank-mailman (input) for mailman id 701307;
 Fri, 05 Apr 2024 13:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jola=LK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsjoF-0001UH-71
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 13:40:47 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1a73a97a-f352-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 15:40:45 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d47a92cfefso28194761fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 06:40:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t12-20020a05600c450c00b004161bffa48csm3016115wmo.40.2024.04.05.06.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:40:44 -0700 (PDT)
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
X-Inumbo-ID: 1a73a97a-f352-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712324445; x=1712929245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=52pIHdSDXG40u8ziotvfnbgQcedbYh6jpFfewoNhGeM=;
        b=bV/q0OvU8fE1sJyB2nYT+jV+a7znfRKHrMhU02USYMCKRepkY0IWU8QWlVn/ZCKFqt
         NGJmtat+lku4UL+L3J1UO3kkM8ZEnSFnMLgsTLeQrs+1n2A8YkFHLgmthz9GxSRCmBpo
         /2R7Pka6HXkL/LKkMkqEbLMivIujhV+AWXVR2BOLGVL118cMeOZ2i1UNvkgi0A5kGDKZ
         e4jZECg3Wc3uzA/npLgnLODnASOjHq2H8yO54v4GNQCAiU7NDmOT2DIFfE6LiFMsaAPy
         Q8Cz1bUgwcLbK8+SSnISwBOPpHaax0ohJ1GMGZ0mkoNnLPSTWViZOOj02vonsNDQtlYO
         T3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712324445; x=1712929245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52pIHdSDXG40u8ziotvfnbgQcedbYh6jpFfewoNhGeM=;
        b=CoLE36M8vuiHSLUtDBTFdbdaWE6alt5uszCJcpLlKGw7ecveSF51p5eOLV/eZI8jGo
         Zct17RRck25TKVZWp0jIndGRM7BJxfX2WQo5G9+qiaW+EaDzuX2pXDwjkEMZTUmjYdrB
         oH64IY3GfUsWwt1es7AmIrM8Ltjj32sIDa3L1haggkohVnECBBUo//5qthissZqwa6/D
         dtxzqLg4/HimJcKiLwGsYIY4RVNi+ZY0M4RWfo90qmmjPzOCSN3hwhRoV7bWOyi9+YP0
         59gBKjQuk/ZJkTdbe1Av7D8gPn67xb4misfkrkqM38oRLjuI9oVeCPpi2BB1vm89bWug
         1dZg==
X-Forwarded-Encrypted: i=1; AJvYcCU3CevuGvmx1+++iDRxkpU/cBUsBZpgooY28BiReIiM917zcd6GQE45/2iKmfukHkDOTcsOFLs/HvHQr+S45ovQ6r2c/TcDP9Cb0pMoYdY=
X-Gm-Message-State: AOJu0YxAMg51Jrg/rKCROCk1rPqKObXD3EHSVy9deYe9qJXNVrE2BfiQ
	Kbmp7f5rm/sPKWqFlBxGsfwNQPZYJmwdsriQ5ykLosN1JG6Z0kPOpetOXgNb9g==
X-Google-Smtp-Source: AGHT+IFZf7Rzj1mwdJwJ5MmkKf2i+zUz9jqFPMglSXIn0xjnwcN0spkTZgBiwHz6gIEmQlnQsEVmeQ==
X-Received: by 2002:a2e:980a:0:b0:2d4:a22e:d3b3 with SMTP id a10-20020a2e980a000000b002d4a22ed3b3mr1216296ljj.11.1712324444764;
        Fri, 05 Apr 2024 06:40:44 -0700 (PDT)
Message-ID: <3608d0f0-68a7-4124-8d1d-098fce4c5440@suse.com>
Date: Fri, 5 Apr 2024 15:40:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240405130722.2891221-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240405130722.2891221-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.04.2024 15:07, Andrew Cooper wrote:
> It turns out there is something wonky on some but not all CPUs with
> MSR_TSX_FORCE_ABORT.  The presence of RTM_ALWAYS_ABORT causes Xen to think
> it's safe to offer HLE/RTM to guests, but in this case, XBEGIN instructions
> genuinely #UD.
> 
> Spot this case and try to back out as cleanly as we can.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



