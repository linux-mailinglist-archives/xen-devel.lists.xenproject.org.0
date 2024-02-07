Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728E084C8EA
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:47:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677384.1053949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfS3-0004WY-Rp; Wed, 07 Feb 2024 10:46:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677384.1053949; Wed, 07 Feb 2024 10:46:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXfS3-0004Ui-Ns; Wed, 07 Feb 2024 10:46:47 +0000
Received: by outflank-mailman (input) for mailman id 677384;
 Wed, 07 Feb 2024 10:46:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXfS1-0004UX-Un
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:46:45 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ee469b4-c5a6-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 11:46:43 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4101d096c92so831295e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:46:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fa7-20020a05600c518700b0040ef3ae26cdsm1653253wmb.37.2024.02.07.02.46.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:46:43 -0800 (PST)
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
X-Inumbo-ID: 2ee469b4-c5a6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707302803; x=1707907603; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4pT1WW3ucR/uqmeTEXzqlHGNfRbEHUD7g5eHjPYIV4=;
        b=CQYdYr7RRXCKrOM7Zk+6BpCAo3a1A5NuUb/w1nJmRFpyfYydjnwX0o6avhHVpnS5Xu
         UfWPgqNI49ghrqSMIgi2p4JFEnrfJS73odcLRgdzyv272nnQrh2/7rBJ0pgwgOr3SsVB
         N3iBC0ZliUAjkySdlFNPt8w16gDrKwhmOqY/oENr6F2aXBxop5S2RDk6TpgYP2T3LyoI
         aWMGfdcUDi2t+DDCHXaZZZaViJM/RZ8RGqp8+iK6FcGFdurMeFvOL97DpZeAPVPX1GFl
         8NZs1HBtm4R/kspChFerHgiI5kxIMIQI8cmGPIZzSb/lhyUl2kqt7BOJfoIaAwNSec9N
         VXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302803; x=1707907603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4pT1WW3ucR/uqmeTEXzqlHGNfRbEHUD7g5eHjPYIV4=;
        b=u3EaWz5sEVvHRlG/fHhLLxtsJQrwqcKz8bJkak7X0UulLTP+Qd3zfnKZFRK9nHGIc9
         g/0+ACFGu6rUv3UUqMaSVFV853cRhC6Er8NCB2mxgGMScAOs1LxyDxmX5I1TSi7fJohW
         m13SouJnOB5vm26KY8ccKRYM03hM/NRHaOMQMiRWuJkTHoTyiv6KCxKjOjWP3Mvurf0+
         FF7U3a0kyXpPybTbkazu5/8c0K4TeARXmsYenByD16C2iZtDtpFZ+e37CWp2x3kJQ0NA
         h7apzKe19wKRQeIQ9x5lLjnlBVUkBIRu0pS2Iwy+CsCfA6sdBsfC5Xqqt6CyBOt7jePb
         Hslw==
X-Gm-Message-State: AOJu0YxIbUoSPKltVKKgXvdanHDvxdn8BjMOKQlHls5ebZBns6bFDa/i
	x+Q/Cm/51U1AfAGSodt7R057k5ruMYsnfE9dsKIMs44NdXj6wE5FEOOeXL1NKw==
X-Google-Smtp-Source: AGHT+IGakxpF+ru2UeXDCy+ErLka3tC+imQPfnr4mVsZBYV2BqatndNONa8vuVOJ24j2SwSI7ftQBw==
X-Received: by 2002:a05:600c:35ce:b0:40e:a3b8:a2b8 with SMTP id r14-20020a05600c35ce00b0040ea3b8a2b8mr4110513wmq.26.1707302803258;
        Wed, 07 Feb 2024 02:46:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGgysI5ulDnic/9qaqBpeV8Hj/wDFy6L0afUxyp6wmRRgouSMYhb6QU5OYY227PIeRPKsJNwCL3U/RkzRpaA5Fq1VAbZV5n12y2PTtCeCDBMwKSTwTd/TtvcQLSTzTkTN0B5JsJjHIuJuD23RyVqQN2m2Qk8w+MWlXYTpm/A==
Message-ID: <513796cf-7735-49f2-8d70-59c4165e6482@suse.com>
Date: Wed, 7 Feb 2024 11:46:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Mini-OS: x86: zero out .bss segment at boot
Content-Language: en-US
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20240207103138.26901-1-jgross@suse.com>
 <20240207103831.dtvlyjtbmgz7kmll@begin>
 <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
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
In-Reply-To: <d51d842e-5609-4c98-9a31-8d6a0b237c31@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.02.2024 11:42, Jürgen Groß wrote:
> On 07.02.24 11:38, Samuel Thibault wrote:
>> Juergen Gross, le mer. 07 févr. 2024 11:31:38 +0100, a ecrit:
>>> The .bss segment should be zeroed at very early boot.
>>
>> Is that not done by the elf loader of Xen?
> 
> It might be done by Xen tools today, but I'm quite sure it is not part
> of the ABI. The hypervisor doesn't clear .bss when loading a domain (e.g.
> dom0).

libelf's elf_memcpy() looks to say otherwise.


> I stumbled over it while implementing kexec in Mini-OS. For that I need
> it for sure.

Hmm, yes, if the protocol there doesn't guarantee zeroing. But then you
probably want to give this as the reason for the change?

Jan

