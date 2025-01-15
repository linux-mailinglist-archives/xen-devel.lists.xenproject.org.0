Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0604A1228B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2025 12:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872335.1283293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY1Yi-0000Jd-2R; Wed, 15 Jan 2025 11:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872335.1283293; Wed, 15 Jan 2025 11:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tY1Yh-0000Hv-Vm; Wed, 15 Jan 2025 11:27:39 +0000
Received: by outflank-mailman (input) for mailman id 872335;
 Wed, 15 Jan 2025 11:27:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCnP=UH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tY1Yg-0000Hn-L5
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2025 11:27:38 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b770b583-d333-11ef-99a4-01e77a169b0f;
 Wed, 15 Jan 2025 12:27:34 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385dece873cso3247769f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2025 03:27:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38c7aesm17684196f8f.53.2025.01.15.03.27.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2025 03:27:33 -0800 (PST)
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
X-Inumbo-ID: b770b583-d333-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736940454; x=1737545254; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HvkUa5uLY3YQ3D0vXDKbpRMD1APss4Lft9Dt22j368c=;
        b=BIzDcUQW1wE3cya7rMFvN2dPzyT2Sfd6nNS4QPurnl9gi6CmCRwFHMaA5kaanFFOgR
         w6kS5vOtwdjGmwDDta2lgu84AEUkfa8n0wF105Z8Sh3F6Ua8mdm/HFDrkj6XY8IAbvwr
         BqqCXtNOE/sOKUJ0L4RTGP1E06vZY9BuoJc7Wv/s2UVuRsp4MMbzMrd1k+6Ge0qBzqKo
         pHQgNq4B6Nur/Wu7tlGX5+JsufW2Y+rjkIDnuEvVy3EoGLj0NwauEeY6+y6aTTbE/epJ
         9cIuccpAvWNO28nNOsyPkx/3mR/5+5FMqIlFw7gDou3O+YMQxsYeNomBEby1N8/fsDp0
         63GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736940454; x=1737545254;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvkUa5uLY3YQ3D0vXDKbpRMD1APss4Lft9Dt22j368c=;
        b=VE4dbKIZF3jq49Y4nxtYPs6FwVZjJVgWnlszr/W5UtMYHWqjj5Fv2LqWk6b41DK7iZ
         XaGzl3rUwFXk4NhK9gnd45ezSSkpDhs23BWKPIs9yJ35R5Wws66VlxuoLRwn+AfJ5AgU
         xs/UqPYk/9/Djj9VpvuDNM1l237uu4iWTWYuy6TuzKSKJWmUcZBpk979Uc52nXxhM4gg
         d/RuSNkTX8dxh4Wucea8fji3t0+fQtIFbrf4VCPSwZLTeuHKbmQMtaL77ARHg2UGv/4d
         9sNnKA1pj1C19HzHVHG3NzOjlyZrcLW/JZOWllQsxqWDOBaTdbD2qU88IS9GTWVJxQgB
         T4Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVetJxF5daLIApfBxhQh/gro0bRaN8CEnxrbqJK7uJITXoxEgeVXNoCvpqLnYv2x6vdU41tUT+7Ar8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzm7mWGq7KkaWE1NCBRMC3dclgxpmK506q4cBFKB6VdXf+p1UT7
	ZcYVPFQKZGyeqam9eQS8NQzwyscQLwlgCHWpG7nFy0SmR9E6xT0Uey8HjoWtKA==
X-Gm-Gg: ASbGnctgOsPh5sJWUmmDCIby+KQhFOXIbdEAqePzxI6fWDtoRU7Mrw2GkZa+eR+sfS5
	MxPjvHrR2VZKp4VrFOhXPavbPAd0Y4hZhSMAXhXuJrliDrXL/3tbZLdYoqBrVEjyDEZFG4UIKN9
	PlXVymmk7L/6RB2uqceTHayD6hf7xOme7rlfETXchjLQf14Zq+jOe7xJxxKZi1x7EShVXGKy4i6
	GV1Ja4Xwu0jVXVd0lAI7jvBO0QDpA/gtVa29oFvlbdsrloAejpBGGgAv1VqCyMZj6nzTc6wvilO
	SSOMEBGgOfGOU4Vea7DjLU8Rpva2uMfacXDvft9p+Q==
X-Google-Smtp-Source: AGHT+IGvoFT1TYXP+jF4uviKjArsdzgjKC/XtpYsjOqHZlLgt3z4fpgkbk7UHrIctiSwyWtK98vGuA==
X-Received: by 2002:a5d:47c4:0:b0:385:f892:c8fe with SMTP id ffacd0b85a97d-38a87306ddcmr30536352f8f.21.1736940454207;
        Wed, 15 Jan 2025 03:27:34 -0800 (PST)
Message-ID: <2658a15b-16dc-4953-97c0-94bec5283f10@suse.com>
Date: Wed, 15 Jan 2025 12:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Improve spelling of few cases in the documentation
To: Bernhard Kaindl <bernhard.kaindl@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <504170a4a195551072c14141e28ef554ac1cad2c.1736937491.git.bernhard.kaindl@cloud.com>
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
In-Reply-To: <504170a4a195551072c14141e28ef554ac1cad2c.1736937491.git.bernhard.kaindl@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 11:42, Bernhard Kaindl wrote:
> --- a/docs/admin-guide/microcode-loading.rst
> +++ b/docs/admin-guide/microcode-loading.rst
> @@ -20,7 +20,7 @@ distro guidance for microcode loading.
>  Microcode can make almost arbitrary changes to the processor, including to
>  software visible features.  This includes removing features (e.g. the Haswell
>  TSX errata which necessitated disabling the feature entirely), or the addition
> -of brand new features (e.g. the Spectre v2 controls to work around speculative
> +of brand-new features (e.g. the Spectre v2 controls to work around speculative
>  execution vulnerabilities).

This having been written by a native speaker, I'm uncertain of the strict need
for a dash (also in one or two further places you touch).

> @@ -40,7 +40,7 @@ Xen will report during boot if it performed a microcode update::
>    (XEN) microcode: CPU6 updated from revision 0x1a to 0x25, date = 2018-04-02
>  
>  The exact details printed are system and microcode specific.  After boot, the
> -current microcode version can obtained from with dom0::
> +current microcode version can be obtained from with dom0::

Pretty certainly then also s/with/within/ ?

Jan

