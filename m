Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B7A07745
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 14:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868382.1279900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsVY-0004x9-0b; Thu, 09 Jan 2025 13:23:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868382.1279900; Thu, 09 Jan 2025 13:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVsVX-0004vG-Tl; Thu, 09 Jan 2025 13:23:31 +0000
Received: by outflank-mailman (input) for mailman id 868382;
 Thu, 09 Jan 2025 13:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pS5t=UB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVsVW-0004vA-JQ
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 13:23:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea3dff0c-ce8c-11ef-a0df-8be0dac302b0;
 Thu, 09 Jan 2025 14:23:29 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4361b0ec57aso9824105e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jan 2025 05:23:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9d8fc67sm21198055e9.8.2025.01.09.05.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 05:23:28 -0800 (PST)
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
X-Inumbo-ID: ea3dff0c-ce8c-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736429009; x=1737033809; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=taMpP9uuERCru14NxrX3wyxl/dR/ZpV+1DQFQasBkZE=;
        b=hG9Xbd0CLTW9iJchSIJrRlmvm7VRguq8dKYPC5Ua5IPJ5u99vgT5jM20/wbW+Js2er
         RTxuz7F3eJfXPrzboiHIoAPJLe8kr8Q7j5mZGu8B3CS3HdEEiVB951Jl/jYIL/kbSt1J
         QAYOjNhkNAidbneWOj0L45K1xWgzO4f7Crjop37N1ii6MVIXcArM8tVUaOtiCIueTbYm
         pHBI142VQpoMIjirj8Ad5bUwbhd22AI2YHU56vIynd7e5w2JiSEsd7GiADj+E6mSqt87
         EkisDNcc8aaAEufc4Y006XOQ7p0zvLHk+bndioQETX3K9TrmBxvU99aetz/yN1t6UCW5
         uW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736429009; x=1737033809;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taMpP9uuERCru14NxrX3wyxl/dR/ZpV+1DQFQasBkZE=;
        b=v8xg4Zox28Zon1bl1/NhxHx7pEfmTJPvN/tNuPeKyDO/4jQ7w3A+b1FmymDLZkqm5i
         tx8gXdgtMjCE96suHpToSGEnwIN1cOxeSw88bxCMq2PnywkKMl6JP8KKm/ZWrC/oXKLm
         cxmADuSAf/LwE3U9AfL0P7uUwfitotXkr8xeju4bTFWpJNYbIFAUja1yrhOmXdydoAAG
         ydaSMRjcdSvUb2VtB0IZGxzPCor001FHBqg62f5r2F8358rNrFawUO/aIdsOtrDDILCY
         XGyOewNmK18Y1cICshI1Fq3fayTiPoNxeRuw6R5Xi954DX6oZEJmbRJlSkK4q/Fbub3i
         Lyyg==
X-Forwarded-Encrypted: i=1; AJvYcCWHjqnlEkmtaABdwSyJG15Mxf3AiZoLmAcH+Sq1s7UafJFLjBjJFbwKe5Q4Y2MrxOlyhusoWlwXuKY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyaa8HGAK+yeAoSZ6uKsP6Amfjs0HmfpIOYaiub1ZGdAZIh9pBU
	EobBqDqBW9hKhyhnVyAH7BoQyam+c9asjOtI6VVCuo+585JTKdq3Cn5Rov8CbQ==
X-Gm-Gg: ASbGncsLIpkw3ve31vp9mQC9XuPW1IkzOdNbKRf+dE636RKJCVIGFZbQBlJKYX7k6Vx
	clZN/jXFWrFwiPhkJw8tosLEcp23XqWSotddnhWGr/fQk5TDsh0UENMC+9cvA2iQ3XfYMJCy1EG
	V3v2GT8rkPzIPynoKGy1sQlplkjupRiRvOH7yplymNOeijiimBqzND+XSFrBtBSDKyG3ormwaHd
	kurULi4yTJSH+cRUst4q7pl8uIdrwK0LvfqY6LEydutNHDdvWF2hHO+BkaVSAVoYVmIHFAGtzkc
	aRibsHFg0wWD0AB7r03lSXXjdnRUj5aQ7Xt80XjLdw==
X-Google-Smtp-Source: AGHT+IGrF77yx3oDYrFkmThxSWuOQwTF/LUkaevbwOx5t1+Ri9UVXwDBgjAJAO421EvsxfRzCy854w==
X-Received: by 2002:a05:600c:4511:b0:436:5165:f1ec with SMTP id 5b1f17b1804b1-436e271d428mr68183175e9.30.1736429008897;
        Thu, 09 Jan 2025 05:23:28 -0800 (PST)
Message-ID: <d7421558-c2d6-485b-96bf-927992c5c066@suse.com>
Date: Thu, 9 Jan 2025 14:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: adjust text gap/diff to work with 64-bytes
 alignment too
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20250109131515.1757764-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2025 14:15, Marek Marczykowski-Górecki wrote:
> Xen compiled with -mtune=generic has .text alignment set to 64-bytes.
> Having text_diff non-64-bytes-aligned breaks stuff:
> 
>     Traceback (most recent call last):
>       File "/builddir/build/BUILD/xen-4.20.0-build/xen-4.20.0-rc0/xen/./tools/combine_two_binaries.py", line 96, in <module>
>         raise Exception('File sizes do not match')
>     Exception: File sizes do not match: 70160 != 4080 + 66048
> 
> Adjust the numbers as suggested by Frediano to work with 64-bytes and
> even 128-bytes alignment.

And then breaking at 256? As indicated on Matrix, imo we should be able to
cope with anything up to at least PAGE_SIZE. Or we should reduce .text
alignment before linking.

> Suggested-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

No Fixes: tag?

Jan


