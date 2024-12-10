Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 400A59EB5CE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 17:15:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852829.1266511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2sQ-00059B-1j; Tue, 10 Dec 2024 16:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852829.1266511; Tue, 10 Dec 2024 16:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL2sP-000575-V4; Tue, 10 Dec 2024 16:14:21 +0000
Received: by outflank-mailman (input) for mailman id 852829;
 Tue, 10 Dec 2024 16:14:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tL2sO-00056z-Ts
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 16:14:20 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0942b1-b711-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 17:14:18 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385ed7f6605so2590700f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 08:14:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-216659c88f0sm26581595ad.102.2024.12.10.08.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 08:14:17 -0800 (PST)
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
X-Inumbo-ID: cf0942b1-b711-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733847258; x=1734452058; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R7G0DwzfFV7vHIhYjMaoAW2txuQp0kwPai3yGt9U9oE=;
        b=dRaXiIZLmnRDaAg7u+cNIW1Ua366jDHjuPzHlXyZeJDDP0QGhdSxUWVkpyOhZZFakf
         xmD7qPwlkQaVyY5vBqKogm1M6E6KFBX8jSjGO1qLd5l9RdjZgLNGhwQB0fqMFW9Rlqew
         QDFDzCqZjz8ycntXvelFUd+R15FYI+r+IJ8gIL6z2u1dArFxZ/+oPZqhsUHsp+WbMkAU
         mLNyLlqj+JtAz0QOLU9w+Zx0PCQpca1Px1we2SVuRyH7pd96bsqGz5RvExMzs3NeYKMD
         AbT0HUucYEiuNLqNX1Le+YuagH65MIXDAs2jxzx+TMOV5PqPJrCDZmuCHp3q5cT6w3zY
         wpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733847258; x=1734452058;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7G0DwzfFV7vHIhYjMaoAW2txuQp0kwPai3yGt9U9oE=;
        b=tGzZyDJq8iQri0ElkISAQFU/Ss0esG83GF3DneymBLKQi1GD47c31KN07oPEdOvQH4
         wA1fJEZqmL6OT0bTU4YghZOBJTDQhJE/CD9JSGXhamk/RvM/nIu58uyMqzSbKDXjLjgt
         U90h0zc6raBkO7O/KrZabB2YaU5AsVjUiYtDsUMihJB3zd+uSgy2fuC870XwWdAngsxs
         /+PdYzGvX3JCJT5Yg3IsOpqzY1eK/AdTnVD/JuF/NySDrD59DAovwcQxpWavqDisB8Ct
         f15XzXUGiz06WZZq9DIZIkhzirVWPrEOoRtzg10IuiCmmYhO7JhKl++ESjGAyL4xG9ip
         2xrg==
X-Forwarded-Encrypted: i=1; AJvYcCW3Ln/8Fsd5PyayPb8Vk0XOQ6EQvERqKTrG0gNIVQ9JklChKFwdJ0F8nW54uMfcTE1QY4ogIpCJX+c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQTjBZU4U7FfZNkK5zDD8UojIAgptyiT2Xd6u9CQNc6lo6LykR
	S+38rZV1wN6RdJzUPdRWm9MpRzQGX1KgMSF8XcdH44FCXzTdUehbrUWO2nN07g==
X-Gm-Gg: ASbGncu1FOZWs6RjEjsrN/slnm4suQOVOn30dNvLRSbYdW6ijj6ZFsKW6Ezxl98SRgU
	0bpSQFxIDzoGJYnIbr91BLaiJLhZr0YoLyu6j6aV4iMYPqhxNMqwwcEYtE6Z6vDtpsr7QIn+5ny
	g4fRYCJ52Es6y8ZD+51mltYMgtFMPFzyPdzPX1H6yuh4J/kUZEgmqeFbSGmhsn8nnrvFOIFDAW8
	1fKo7U0/XZnxiPBxC3qQrpLpEXVSBrx5t3e/WWFTzyTES/D/9o1pIZAuT8oEFbcbTcVrAjmOLkO
	byCZ11ndIXOnhLK0PaQxuNNAWjpFhlBs9K3uEpE=
X-Google-Smtp-Source: AGHT+IFMMhvo0UXLG0ZiYTVBKNlBFOzu4+8/IBE86EGz3HCuSm5dH5klDBPBkDrPOnjQcEnuE1BWiA==
X-Received: by 2002:a05:6000:144c:b0:385:e5d8:3ef1 with SMTP id ffacd0b85a97d-386453f9e06mr4157831f8f.44.1733847258273;
        Tue, 10 Dec 2024 08:14:18 -0800 (PST)
Message-ID: <6b15ccd8-9525-4a85-9fde-bb53ee34761a@suse.com>
Date: Tue, 10 Dec 2024 17:14:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/FPU: make vcpu_reset_fpu() build again with old gcc
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <da8320f7-1baf-41f5-b7ac-c05b6371e1e4@suse.com>
 <D6838QWBS1OG.37M94XNPN17P7@cloud.com>
 <4e9c0566-bed7-47a6-aa6d-2ac76c0a1bfe@suse.com>
 <D6848HMS6BT5.RX9OAXRM91C8@cloud.com>
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
In-Reply-To: <D6848HMS6BT5.RX9OAXRM91C8@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.12.2024 16:12, Alejandro Vallejo wrote:
> On Tue Dec 10, 2024 at 2:34 PM GMT, Jan Beulich wrote:
>> On 10.12.2024 15:25, Alejandro Vallejo wrote:
>>> On Mon Dec 9, 2024 at 3:13 PM GMT, Jan Beulich wrote:
>>>> Fields of anonymous structs/unions may not be part of an initializer for
>>>> rather old gcc.
>>>
>>> Can you add the specific version for tracking purposes?
>>
>> It's all the same as before, and I really didn't want to waste time on
>> once again figuring out which exact version it was that the behavior
>> changed to the better.
> 
> Just checked on Godbolt. 4.7.1 works and 4.6.4 doesn't. Adding that data point
> to the commit message really helps when navigating git-blame, even if it's not
> as precise as it could be. Particularly if one wants to understand exactly
> which quirk of which version of which compiler is being dealt with.

Well, thanks for sorting that out. I've added that info.

> With the commit message adjusted with the offending GCC version (i.e: <4.7.1):
> 
>   Acked-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Thanks here as well. Any chance though you would be willing to upgrade that
to R-b? Only that would allow me to put in the patch without waiting for yet
another tag.

Jan

