Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D13C81479
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:18:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171443.1496450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYK7-0000jQ-KN; Mon, 24 Nov 2025 15:17:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171443.1496450; Mon, 24 Nov 2025 15:17:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYK7-0000hK-HB; Mon, 24 Nov 2025 15:17:51 +0000
Received: by outflank-mailman (input) for mailman id 1171443;
 Mon, 24 Nov 2025 15:17:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNYK5-0000hE-N3
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:17:49 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bbc26e03-c948-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 16:17:47 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-477632b0621so30222165e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:17:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477a96aafb3sm154558105e9.0.2025.11.24.07.17.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:17:46 -0800 (PST)
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
X-Inumbo-ID: bbc26e03-c948-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763997467; x=1764602267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ArqHz0sodrN9/1XZkWAT8LtFl/ca2rGUTkGL28ifyJI=;
        b=CfPI5KD2DR3lBPwqX5q/9S2HBBGjwjEodUjRefJEGztXSJ8io3MnMBUoqR1yUfJPxI
         XQlyH+ARetLIztE+7YZRSbqKRaVhy0x8GBTYYwMfJkqfoZLorZCHwxlo/V3yvpZeDZ8V
         loDXFvEzRnIWA/QWW7RpmjbeTyRsJ5/eozGwgdyHpMZ25rhgclFh4Ck8wrOINMSjcNb+
         n6ftBcp26OGDq1YI1ryR5NqAvY7dQwlYSxOlSim+XbAW8tordiRCPD/UDgei/IwHNbxA
         XOyYWXLNdw3WyT2Hr64i88mbWgCyRkK+2ia8LZTqC56XGFsDiA01/qQP72i37UHgJs4H
         zh1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763997467; x=1764602267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArqHz0sodrN9/1XZkWAT8LtFl/ca2rGUTkGL28ifyJI=;
        b=tJgqLfpMmB+RhjhnkOC2aJQWpGDrqrF/kT7DhtAx5Hy+h3NCO8128rMgtU/7NiVr3k
         R31fu+COPn1bJyQqMMtTDH10E9IDGrIi/BNQCbuBfmKhD7NC67vZjjx5/mXioeZ/uSF3
         2vLHs93wkeyC7S3vb2R0yeAC5T/3LUPQwvNJ5cikPBv1xuhyjl8Y2IYOVFgSptCWnvTm
         wvhv+o5eAiok563W9xwt99m9bN4FgDH2yIqOj8XQdad8gye4Jxg9U0EjFFDtxzT8GGiq
         ImaX/q6bJ4iHG8JNfqoae9frM6Q26LdiTduD8U7danNAsbNJbJJfeRTeXK3FIg8S/hdi
         yy/g==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7OIqgrVP50yTmdlRPrZMYjf2PUTfIHjQdQEJYLevRDmQ5aBliG+ZqDIbLyIuN84l4rJu5LKz2L4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzgpehka9ES6rXWn4blK94Il29zV7NbGi4p41J2qKY5m/NsCFMy
	lPDlgUFuQy5EIs5w8uskIMX5klP86Q0p4zZs5RolrIZD2L6vLNvbpI6m3WxvPsej+A==
X-Gm-Gg: ASbGncv1RDJU84wWndSf+gxGUbuAzI6jwjUSHY9/FQ0LHWqdobH/zkJcoGR8p/Md2h2
	lF588FxPWvcpLCLsTRSGFcrfDrd69djmwthtFnV7Ag5Wt4r1lQ2eM8GUPzAPLsmK4pfdAexLHdr
	BVgo4TLMKPtreuA5QBVaj3Xi+r0BpYAAjfQW+TMEihtZT/G8OcX1gyGNNOF5uAk5fecX/ZTp6+a
	weRcb0EgRevNjc5b7gp5JGq3ZdsEuDzcwTguLJ4iGubhv9ytPQTCLv4X62v0QwwjjcyiQDSVyYS
	RS71CRb/szJ0obYzCrOd3wgfbag+d3KYPqWJ32u8o6qIjG8dmnBqqVNQ1Ba39ONsDipdfLXuLMe
	FkyySA22vTNCH4ZVjZvoPvNQ2I4EKIr0rjIfFtvpubgUUJmn4dYGKeuB5EblHrW8F+waoiiCaBw
	MltsmT0/Fz3muxpuw1+Aio6DtaYujRGhSmqVzvyBi0oHzfO0RiTJTEMqO11lIUWyzK0TdixcogA
	+c=
X-Google-Smtp-Source: AGHT+IHSFeAj6rchL5t1MpwSOl64/lUcOBm5pSneRS9MbNKPmUwXlOB9ujuwOn+G3Ib516zpDjttug==
X-Received: by 2002:a05:600c:a07:b0:477:a219:cdb7 with SMTP id 5b1f17b1804b1-477c10523aamr151717335e9.0.1763997466927;
        Mon, 24 Nov 2025 07:17:46 -0800 (PST)
Message-ID: <7a206e59-9ab1-49b9-a2af-dbd380566962@suse.com>
Date: Mon, 24 Nov 2025 16:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/intel: Resync intel-family.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Kevin Lampis <kevin.lampis@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251124150837.654354-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251124150837.654354-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 16:08, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

> I'm unsure about the Intel CPU Core types, but it's probably better to keep
> them than strip them from our copy.

Did you mean "pre-Core" here? In any event, as we're meaning to stay in sync,
we can as well do so properly.

> @@ -152,9 +174,9 @@
>  #define INTEL_ATOM_SILVERMONT		IFM(6, 0x37) /* Bay Trail, Valleyview */
>  #define INTEL_ATOM_SILVERMONT_D		IFM(6, 0x4D) /* Avaton, Rangely */
>  #define INTEL_ATOM_SILVERMONT_MID	IFM(6, 0x4A) /* Merriefield */
> +#define INTEL_ATOM_SILVERMONT_MID2	IFM(6, 0x5A) /* Anniedale */
>  
>  #define INTEL_ATOM_AIRMONT		IFM(6, 0x4C) /* Cherry Trail, Braswell */
> -#define INTEL_ATOM_AIRMONT_MID		IFM(6, 0x5A) /* Moorefield */

Interesting, there's one entry changing the group it belongs to. We don't
use the constant anywhere, so right now this is purely a cosmetic change.

Jan

