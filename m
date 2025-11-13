Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B041EC58F71
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 18:02:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161948.1489759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaiF-0002uS-V4; Thu, 13 Nov 2025 17:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161948.1489759; Thu, 13 Nov 2025 17:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJaiF-0002s4-RN; Thu, 13 Nov 2025 17:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1161948;
 Thu, 13 Nov 2025 17:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJaiD-0002ry-VO
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 17:02:21 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83c31063-c0b2-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 18:02:19 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-b6d402422c2so162939466b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 09:02:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fda8a86sm194019366b.52.2025.11.13.09.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 09:02:18 -0800 (PST)
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
X-Inumbo-ID: 83c31063-c0b2-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763053339; x=1763658139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie1q//RtipQx+cOa4gaCmoTXh04HnvyXTLEd6YBSnOY=;
        b=LCbqmVZoxmgJbSLcjVJxzKrun33Kkv+nb38ua5iErYGiAc8ZWZpNisZ6ibCfqgGwhX
         GDfYC3wzJ+zcu6O1DUCVVxwbxsUICNook767s3XqdTtfjMjZFprzY1kVTyNCOq3RgMHE
         feOkt9LXpaYlAOxnHYmmLli0nv7LL3BvcUnXLW2lds46kZbcdugZCU+I4s7wn9yGNJvb
         epeD6zfiA6s8QgYV6KGpBWtXeSB/DxkSDyxSeK6C4j3Yr6zaSska2pzEVpJZv7HziPkS
         RtG+Gnxz1lhfNeq7mArcgO05L20zHconAx6Ih09R+MsNFXd8WWYIJuedUvI6TMrgvLZ7
         IO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763053339; x=1763658139;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie1q//RtipQx+cOa4gaCmoTXh04HnvyXTLEd6YBSnOY=;
        b=OvVYgtcFF+2cWZCg9KwtEr0T+ItXk7y+y3JyGLG5ksDAJXy5m+XlqDmCIP5Oa7hZHy
         vBfYhZMeNEmHTa8a3fP72MlJXec17H2qStANiGwps7WswwFgKIa4wxqhTxb5+qh4AYZM
         ZztECuFL4Cpv0Viot0g7V9CH2U+iySfIotg11OI8DD50w2tji4NTEPL6qq6R4bLDIP1S
         M7C2kLaieXMfwFqysd1+szy8rf0GCikJDCX/4nmvI+Lz3qrrgk+L7Cm1irpD2YBzdQBn
         xZJ8RVQNpxfLZzyDWjH4Ba2b9hLvO2MBPNl4zda4LqPCtVhh32gQRWXVL8Jbpi5aLxr3
         XOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFG0yF4r70CjETB7nI14U3fK+rdcVSDFlc44ka+DDQ5yZw2L6WhNpMH5mXA+EsdYIrfeU/plUxNV8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzHogVTgJu/FJrR7C70q/Peou3W50LR+aQ5NCtES5doLLlPjUWM
	pLKiHKEQ8UqaqLZA3leLPRfdqO06N2nda65jg1TZprnomo14N5v3bNsqrmoTuNnaYw==
X-Gm-Gg: ASbGncsgNNMe35eFmSZg4EPueIdsnaIKYjAhAhisuniLehj9DXteSmfQEPYiTuXl8Ja
	1jtbVukWB7PvDnKU2/cjAReZOnAxKa2MHv6ELxi1EZz/6Ns/dxI0vo1O+DIc16Kw/Fnk1hO9d8e
	jgGJNyYeYrEgTf3I38iI15sC76VmQLZtnZoSGQgAWYyYwTTw6oVLyHMvO+K4t1EuD9uHhBZ3/Jm
	vt0ZfAz/oT9iXWlNPiJXC1OiaKGhbD3TgDfDHWLmOH9oTKtPQS0QQ7G4AeQJIJ63JkrKhRUFErS
	wUyWghgn8NblR1/QdTcrFHUL3suG++19hQGYWElyvj88NqNE3kFhdnfj5N83jklWRad6noCzm2+
	B7G1suIZkRkzVDbi1XLDcM876GJxbrL/2ebgTfZYXI16ifVwJQzCtH8zs08mpjjhuw5EzGn897J
	mEOLwOCF2pAdCuMVr8LjBEWm4MLQszNpt4wXKG0WHhGtzSakXNYvD9qmzhMxuxeFI1
X-Google-Smtp-Source: AGHT+IF6evj/9e6K9SSXRYny56NQ/PHCpbaX6+Sh4GXyOTHqg7O009fXPrtMCuawFA/urCgEkACeyg==
X-Received: by 2002:a17:907:6d0d:b0:b60:18d5:4293 with SMTP id a640c23a62f3a-b733196076amr764646066b.9.1763053339054;
        Thu, 13 Nov 2025 09:02:19 -0800 (PST)
Message-ID: <5bb5c2d8-53bd-4669-9238-6ae8ab8d349c@suse.com>
Date: Thu, 13 Nov 2025 18:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] config: remove unused paths from config/Paths.mk.in
From: Jan Beulich <jbeulich@suse.com>
To: Juergen Gross <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>, xen-devel@lists.xenproject.org
References: <20251111161959.13667-1-jgross@suse.com>
 <20251111161959.13667-5-jgross@suse.com>
 <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
Content-Language: en-US
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
In-Reply-To: <4cfc4f5b-1d7e-4f69-9bfd-99ac0f65ac97@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.11.2025 17:59, Jan Beulich wrote:
> On 11.11.2025 17:19, Juergen Gross wrote:
>> --- a/config/Paths.mk.in
>> +++ b/config/Paths.mk.in
>> @@ -20,10 +20,7 @@ libexecdir               := @libexecdir@
>>  datarootdir              := @datarootdir@
>>  mandir                   := @mandir@
>>  docdir                   := @docdir@
>> -dvidir                   := @dvidir@
>>  htmldir                  := @htmldir@
>> -pdfdir                   := @pdfdir@
> 
> Question is whether we're mistakenly not respecting in particular this one,
> for the *.pdf we create. For all the others I agree there's no (present or
> potential) use. I notice though that docs/Makefile cleans e.g. *.dvi
> nevertheless.

Actually, I can't spot a use of htmldir either, when likely we should respect
that one, too.

Jan

