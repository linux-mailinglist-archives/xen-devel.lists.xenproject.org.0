Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275EC648D9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Nov 2025 15:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1163965.1490997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzsC-0005nc-GX; Mon, 17 Nov 2025 14:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1163965.1490997; Mon, 17 Nov 2025 14:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vKzsC-0005lf-DS; Mon, 17 Nov 2025 14:06:28 +0000
Received: by outflank-mailman (input) for mailman id 1163965;
 Mon, 17 Nov 2025 14:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Jhw=5Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vKzsA-0005lZ-MD
 for xen-devel@lists.xenproject.org; Mon, 17 Nov 2025 14:06:26 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a2ae6b6-c3be-11f0-980a-7dc792cee155;
 Mon, 17 Nov 2025 15:06:24 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-b73161849e1so747492966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Nov 2025 06:06:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fad41cesm1069832766b.16.2025.11.17.06.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Nov 2025 06:06:22 -0800 (PST)
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
X-Inumbo-ID: 9a2ae6b6-c3be-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763388384; x=1763993184; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SsMybJeNLcUHgJongywDT624v6pbOOCP6TG9WWFzqrY=;
        b=YFMcX4hOkV3CDnWq0OQUyg6wRhBdPf/pb3BFlNf3fMX7HxrHjfO+oe75ddBvVB4vxt
         N+epha6QUTV2q8oCcY9t2haoDPeg5IAAjqvS2hAiJFFC7T1miUdzLf949xq33nLQn7Sk
         AOqeMJCO55yzzoCjXHS63/4BZvnfZzexkTcP7FczMiD9Im3KG9WGc+NxdpZjXNZA2psD
         xG6ri6GvtBJE1aQRg8zWVnUAsqbmn533plhQjXocZCJbO6b2+0ufRbUpvmLtDaQQWJ2X
         encSehO72znsnVBGf1HHeAYVya+T4LmgPKPtK3qAnaaWeXExlJdqWB74FyaeMEOuAVx/
         Y3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763388384; x=1763993184;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsMybJeNLcUHgJongywDT624v6pbOOCP6TG9WWFzqrY=;
        b=rrOd/SD3ykJpQ/bui06WBO9sJssA9IJYi1P5j16xiF+upaCalQiP6LzBOtf7/2AkI0
         p94pqBUQAXOLmgtZGVarS4y+b0/GPr8FQdpjaTNPH9VRk+f9txfIvR/NDmA94kV9Tekm
         6Q4MH5rapA/P/Net61h1Eu7d7WE/o+SywJWJofpfS+o90PQfqu/JxxaDYeQE+30BbJlt
         usAqp4I5algiR4iGcsI1u/VEOXrpBlBYG21EypDo4o2PmezAOqkBoqZlxegZnccYuy+A
         gkr/sagC2Os4bqUwCkIR5er+rhv4mBfrQLNwD/NKq/GQrM4bqyncEb44CwY7cSWhzCpr
         kYEA==
X-Forwarded-Encrypted: i=1; AJvYcCUjQnoSmTZ8Jr4hexIdiZNZLGFiamXoOXGd6Xpq2yLh6jIpMhjob1Za2YEk53MH0OmK3kCf8HVXAuY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwzsENdLej50jfm4a5OunUW5r1Ju+eZ4OZIb9vKXBckMCbeSUlg
	rW/F4gPKGAQ/zd4CYRxmj0e6Q/xtAnL5E26wY/Mhnj1vvS1VMmV6ZVFsLEpQMpAmsQ==
X-Gm-Gg: ASbGncuxGpNq7GbEMrRaR3mPci95qTQ7Mz2YHpH1u39ilho9g2QzLJHFEUUWU41CyGn
	ao/7HeJHpqbKKJbc8K6vM6pg23BvXAcCXI8OstAs9KVLa3aatB0rTokPNWQvKou9W3p+zOkxVyW
	aNU7SXUBhK6e9jC5iBCH5Pjb0Ra4fKQj0FnCynGKQmP80dQOti+Ec9ROw6MKw/dF6wSMQcH7o7N
	5qlEkh+pbXKV3THfBxUuFA2Nz1zhCnhvqnyFLR2WLJqL0DoWSP4ZieDX2+owKdy7MnRIcdi90Ba
	hwoufrWVqfI3AYr3PF31q+usuhh+8Byu190cp3wHUfm9gbcdxSUVXyFBKMd0hBVqrsNUc8mo2a1
	Nj5pLMCH1ih5aLw6RfpgKtvefFMopIrqQ3FR89JupFzbW6R99AvCrzkCKkJdulfob5975WLHXKE
	fPpE6rGgrAWWb+L0nNzYRSwNk8kd3V76QKwLpzsTCgcvSpP+X7zXtgumF/v9QHEbBMWcmq6Ilry
	bCVpUW4zigCqOArvqxro7Ku
X-Google-Smtp-Source: AGHT+IHuAWQxWa3dxctrAGzh/VvFciAKb/DIQ4hrRph25Oi7F9Zgy5Us7kirYd+2aQcCpOeXd5bwAg==
X-Received: by 2002:a17:907:6d2a:b0:b50:a389:7aa4 with SMTP id a640c23a62f3a-b73677eea3bmr1315555066b.13.1763388384054;
        Mon, 17 Nov 2025 06:06:24 -0800 (PST)
Message-ID: <401757d0-643d-4901-9859-9ac110888883@suse.com>
Date: Mon, 17 Nov 2025 15:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] docs: replace @xxx@ markers at build time
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20251114113238.9279-1-jgross@suse.com>
 <20251114113238.9279-3-jgross@suse.com>
 <7e24823f-cce1-4430-83f1-ebde6986efa4@citrix.com>
 <2de93313-9f1b-46a7-99c8-618281aff2f1@suse.com>
 <e4d19c4e-8eac-400f-8e3a-83684a290da6@suse.com>
 <0ed9b152-6465-4736-be59-352d68b77e6f@suse.com>
 <45c6d3dd-3901-4609-918b-ba6b685d6496@suse.com>
 <d0f7a82a-b3f9-4716-a5a0-a8605da65243@suse.com>
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
In-Reply-To: <d0f7a82a-b3f9-4716-a5a0-a8605da65243@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.11.2025 14:17, Jürgen Groß wrote:
> And using $(wildcard <path>/*.in) is not an option, as that would reintroduce
> the need to distinguish the configure-time and build-time *.in files,

Hmm, yes, if there's a mix of them in any one directory, that wouldn't work.

Jan

> which
> I solved in V1 of my series by renaming the build-time ones to *.src.
> 
> 
> Juergen


