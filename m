Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C83DBC577B
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 16:42:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139850.1475071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VMv-0008Cg-V6; Wed, 08 Oct 2025 14:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139850.1475071; Wed, 08 Oct 2025 14:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6VMv-0008B5-ST; Wed, 08 Oct 2025 14:42:17 +0000
Received: by outflank-mailman (input) for mailman id 1139850;
 Wed, 08 Oct 2025 14:42:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6VMv-00080W-3N
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 14:42:17 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb7a9f56-a454-11f0-9809-7dc792cee155;
 Wed, 08 Oct 2025 16:42:15 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fc0b7bf62so11466421a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 07:42:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9bf1sm1662469266b.13.2025.10.08.07.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 07:42:14 -0700 (PDT)
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
X-Inumbo-ID: fb7a9f56-a454-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759934535; x=1760539335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Luy1ueRU0RKrMIoXZiGIyGL/fb+hOgSgtgWOZjuo1Cw=;
        b=Yw5wwF5HrZeuOgAhry0K6plNnh8WTZq3H2wCRdUQbMAdPqoZzGsfXuTPxlOxE/cLHT
         HmaedSF6nuoBoVhgl84XF7DVPYYFe1Cvl8dTj5iPBFd9OkQ8pcPnSGT9LcW9G2lw7RzT
         UkiR1mY6NXNY9ZNDuO2hN6W6eLrV43QjhO4dDSdZ0G/hzyH9incmqu1xkOsfLeO0iKr7
         vQ67q/KhNESKPf4oeeubi3PjjUZuf8QupNPc157VOL3lE46jeMAsODwD80/iKxuTKOOQ
         ibb74fVX0Dl2LZeEBomk6vibHeufaJIRbHGzxFUrwoK617KemUPjwdWlow6aUW58Pl47
         Ypww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934535; x=1760539335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Luy1ueRU0RKrMIoXZiGIyGL/fb+hOgSgtgWOZjuo1Cw=;
        b=TEvApIpWUmX3VyKlU+UdWAm16/2dolsV6z4wbpia/jKrmTAEejs/gHCbN8/dHy/NoD
         In1DITW7DuTBcp/WT0RIg4ZZ7kO080bQ+40PL0HMBpn1k3ph3X/xXaw8+02zn6BUAuhN
         9DibWrJTvZRhnKmr1r9ucGG8gnQtH33Gl2lTqpE5p11f3157WYWOlvmCm3oaeENVCjOB
         VR9pKjb6IUYcT4gQTyJ0ulKwOyc2+q6EcJqY27K9/or9402GNc0bcJnv7e5nNN3riTmz
         aSL7Is9a/9AGb4fpuDB3VAMtSLBnTW51cBKO+T8d9HcpofJoIXSe1FuKiSWFyyqM8o4j
         dgQQ==
X-Gm-Message-State: AOJu0YzEOtmii1kNsCVJ5fRimHGh+uudrJo2lbESTMdHIXij8cw/X9V2
	eoa/uvRPQzx+n41AJs/Liu6P4z5P65GIJMcBeFStfJtao3LgOKpXF4ezI8W+57pEAA==
X-Gm-Gg: ASbGncs7bZEIOjuoB+ROzPbjGjiYbht0ba9F+oaA2ZWXqL3voECj5eQa5I8i4NTcQCM
	jlBUx1oVA3W6iBJUCPAlQL798xoISS9zSH/sstYBZ2klc7VRl+SDdB/1HVY6tO5jRn0DyfJdrbz
	lVsliyk/xgejydpZ7xfNeCDzhsbld0LudaGMN1RfRqN4ybCmD29bB+6ZXwBFglgVV16S78SHs9p
	QMQf76JvMk0v5sK9HZeu+dRbeFUB5uucMb+tVJxnmdanAJ7uG3wC1pDZVfLU4UZAFE0tjWNE4ZT
	wFbsBDmGPIgfjUa9Mi7BX7U3Fgq8yCsRi+lbFBI2yKqvm6FdAdpkjvvuJ5gAhjlgv/aBhH7aYh5
	Y0xIcJzmxyLjdWD32j0QNuN5+7iu1pOQaCp1WJxCiX0vfGSI4zF8iEEoK1aAoYK7pTJKKFMxrWW
	B7bdW/YYRM4hXO4Bi+M4uNRYxeeoRQecmjlhpEo+LipQ==
X-Google-Smtp-Source: AGHT+IEpCb7+wu04RYJ7iSRu+bkvRgb0sDxumd0fBZaIi+QIiQbcYLAQ23epi+XL/Xpox/icWRhmNQ==
X-Received: by 2002:a17:907:c05:b0:b3e:fe8f:764 with SMTP id a640c23a62f3a-b50ac0cc05fmr428444366b.32.1759934534659;
        Wed, 08 Oct 2025 07:42:14 -0700 (PDT)
Message-ID: <dd1f9a5f-fc45-4ffe-b541-6f250b74dfb6@suse.com>
Date: Wed, 8 Oct 2025 16:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21] tools/tests: don't pass -E to sed
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <4d985a6f-59e2-45ea-bc3d-ecd2da032a17@suse.com>
 <aOZ1nneO_4-KvvVK@Mac.lan>
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
In-Reply-To: <aOZ1nneO_4-KvvVK@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.10.2025 16:30, Roger Pau Monné wrote:
> On Wed, Oct 08, 2025 at 11:47:05AM +0200, Jan Beulich wrote:
>> Even the 2018 edition of The Open Group Base Specifications Issue 7 [1]
>> doesn't name -E as a standard option; only Issue 8 [2] does. As there's
>> nothing "extended" about the expression used, simply drop the -E.
>>
>> [1] https://pubs.opengroup.org/onlinepubs/9699919799/
>> [2] https://pubs.opengroup.org/onlinepubs/9799919799/
>>
>> Fixes: cb50e4033717 ("test/pdx: add PDX compression unit tests")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

>> ---
>> In principle the -e could be dropped too, for being redundant.
>>
>> Hitting the problem with an older sed pointed out another problem here as
>> well: The failed invocation left a 0-byte pdx.h, which upon re-invocation
>> of make was (obviously) deemed up-to-date, thus causing the build to fail
>> again (until the bad file was actually removed).
> 
> Hm, we could do something like:
> 
> sed -e '/^#[[:space:]]*include/d' <$< >$@ || $(RM) $@

As is that would hide failure of the sed invocation from make. I was first
thinking to sed into a temporary file, to then rename that file. But this
won't cover the more general case of the issue either. Meanwhile I think
that the Makefile itself should become a dependency of the of the target
header. That way, if the sed expression changes, the file will be rebuilt.
(Of course this still builds on an assumption, specifically that any
failure here would be dealt with by an adjustment to the rule. So possibly
we need a combination of both.)

Jan

