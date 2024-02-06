Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DD384B1AF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676725.1052965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXICR-0000qU-2I; Tue, 06 Feb 2024 09:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676725.1052965; Tue, 06 Feb 2024 09:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXICQ-0000nd-Vu; Tue, 06 Feb 2024 09:57:06 +0000
Received: by outflank-mailman (input) for mailman id 676725;
 Tue, 06 Feb 2024 09:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXICP-0000mt-Os
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:57:05 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14161715-c4d6-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:57:03 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-337d05b8942so4123185f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:57:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i9-20020adfe489000000b0033b45bdb2a1sm1414894wrm.4.2024.02.06.01.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:57:03 -0800 (PST)
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
X-Inumbo-ID: 14161715-c4d6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707213423; x=1707818223; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuNrHofBsjzXnwInvms5nbhtrurzzvQIMsoyTqKEL3s=;
        b=LJgFrex/qMMVYFbmBgiBP11EYNHGqzamUQvYggzk5D9BEVz5BbLcsfulbnL3tnI6/v
         k3JhZObXynOGzjuUS2k/PH/MbH15bRWfC/GXaoepYOpvt2Y5P0Vhe8Qxv/Fn8Ojm1ZP/
         iPb0HBFfXrL8UZUZq006C/LpUyCNUFytqiC+1GuqRE5IjQJSgG7uIWr+WNssbhaa6+9t
         t+DSTRP7XqrKTh/1O3LVl87KXI2xJEGl0G4pvetuAgKkT8qLkriukocwyp9vZ2hFLNN2
         kLmLdOlTvtHfTu905PsarecG0fYtkjDFkC3BnK/pjpgJ3IMxdhzM7JRI8oo1OWqJGqda
         +zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707213423; x=1707818223;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JuNrHofBsjzXnwInvms5nbhtrurzzvQIMsoyTqKEL3s=;
        b=wlH1U8dY8BBCJVTx8ztSLVBkMQhbDiMMGh6ah6HRsDJtrpuL0+Fu2VHegL1gfA3R/G
         Mav00KWnyk5uEdq3tHQfor88Iyltom6FRdGVVGTmEYU58p1Ix94Xmd3gPjgnE8VXEBfW
         PlTixJsGJL+07DrwXlNgUtjLR7dc1XYRzyvqoEWUZkhxI9W/xDwdUQtm7GT6K8BRkC07
         50+wgs4feHcRvEJKX9OfZaK5FsCIyQwfsTJ/GuJyv+gy8EbJpZhNZlnwQcuCAzPbIwew
         RAl2Njsw+S++uJbIAqH27TYIfR7QDTy88HMQrjLLRp6X31jEFFl9BuQkFRrzrBFM50eU
         m2iw==
X-Gm-Message-State: AOJu0Ywj5DxNGd0I3VAHyTeMA9xA+8fSHLf42n+jR721e3I/oBuZyuj4
	knxA+iRKSIPS3sY2aZZHZAuavdm/KWST6LFuCmdhM34FN9wpjy+oqBjEf2rCOA==
X-Google-Smtp-Source: AGHT+IFGFOknQLwiTJwHI3pjFWjOgNX5xBqOSSWFBhusWxv21BDKMed9ETxdTRNxoQaspFkCJX6S/w==
X-Received: by 2002:adf:cd08:0:b0:33b:2fac:6a44 with SMTP id w8-20020adfcd08000000b0033b2fac6a44mr941929wrm.34.1707213423579;
        Tue, 06 Feb 2024 01:57:03 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXYNn3TtvTz+MhHHut/Loqb38D7QNw/gyUp0W8DqiFe8VRot61YSm2LMKclJoLQ2Ugw9WFFu4we3Ukzm1m95EMesz6E6kHFNb/3nSYykBlg/IF65gaLuJGz5R7FJmoZ6hztlgf3cLFJfyjFyOoMVftc8Kl321UP+Q08zJAqayEMBdRVIBG/eQTasjYwK4W6MfoNrR2I4tZXPY1f88bLnmnzpGpGzN15RZ7TOrHaD4urcq81XbK9IsY=
Message-ID: <1179f656-5205-4d62-80fc-3338f3e9bedb@suse.com>
Date: Tue, 6 Feb 2024 10:57:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] Constify some parameters
Content-Language: en-US
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240205104504.14830-1-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240205104504.14830-1-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 11:45, Frediano Ziglio wrote:
> Make clean they are not changed in the functions.

s/clean/clear/ ?

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



