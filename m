Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3C9B13BBA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 15:45:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061541.1427143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOA7-0001QW-H7; Mon, 28 Jul 2025 13:45:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061541.1427143; Mon, 28 Jul 2025 13:45:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugOA7-0001NT-DN; Mon, 28 Jul 2025 13:45:07 +0000
Received: by outflank-mailman (input) for mailman id 1061541;
 Mon, 28 Jul 2025 13:45:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ScRH=2J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ugOA5-0001NN-8U
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 13:45:05 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1030ffc6-6bb9-11f0-b895-0df219b8e170;
 Mon, 28 Jul 2025 15:45:03 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so43516f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 06:45:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fbe53b546sm54866495ad.177.2025.07.28.06.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jul 2025 06:45:02 -0700 (PDT)
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
X-Inumbo-ID: 1030ffc6-6bb9-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753710303; x=1754315103; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YVsphEC5JdIWxv/8cktEWFCLHoNxupdeWCqu94sM0jE=;
        b=fkrYzT5WoLMEm3RSg5vpxXvmsh7i1B8rctDfV1cPcrDz/oYRimUszSTpfyomcEECBX
         89p5Lmqi+l3iCWRf/W7bk0sVozlRmAiJyJ58OT27oAHVQ1DQ/ICaPP3fGGwJhBMPaeAW
         gPC0iQJDLT4CfyXRG6OcS93CRBZb/aK1Tm2ameMUvvvfkVV5PaOP68iMWCC03Xzy9UK9
         OeuPKK8VBFXhGtS6opzIPPtZUsn0Z2KJF/7/65/vHgXY+9quayo1lHCM2LgifQ9tr0mX
         VN9saEdqcOQpPIWCchDJh6nWwFZOr+9wSamFwesVUo8hsblsoFJiXRNcPl28S7Ha1/oh
         2e8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710303; x=1754315103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVsphEC5JdIWxv/8cktEWFCLHoNxupdeWCqu94sM0jE=;
        b=GpxmiVmSlcobmm8UIKJM4ofVO92U3IQwGdJS8r6O0rDP9c7KXM9hvmaDjKr9GkDC2R
         02Cm6vrmfzMKlBhsAmTIDFXIGhDlaq7dky5I6iWMjbbtl5R2MFN0rUeK1S4emlHRti/m
         uaamke5EmqHvV8DSkXHJrTRyaa4MlHX7v7rY53yrG8DimmS79tyPSE46YRs3iP3l6agK
         oWl2em/7eV+PbFl3VYA29nowjil+ylkV/cSC00pDk2adJpr68674eOMzakqz94pJ6cKK
         Epu5V3HcMrjb2vbUGPwQ4pHPmqoE5DpP7AGkaLCZmNouSv3/GHBN+n4NGdE+my9tlm99
         u+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXq1V95FK1LtCmTjfQt+VOikGMythu/3qhL/15gHcUlYog6uxBu/M/J17d3mWL4S2GiyleftZU943s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx4nto4/33TLSusvVSqdBr3EmsuNnlSU/ZNHZL+parbsStBSWtO
	sF2Rus4dwRRICYLN/V3j0ymM6wiqphH9JgSue2qYFLJmSCd3aBqPesmhLvnV18YRGg==
X-Gm-Gg: ASbGncsW6es8v4x9Ea+bClYfBv9DWm+91OHSTpaB3qda2qe9ZiTkbztgVYMsilOEoiC
	aSEySldc/zLC8zn3XTq47NYWfTvhAoIhKQLI3C2OXyws5WTZurtxkVbW3gqY3Irk+Z2i7dPNOXt
	Vims67wRW2xaRtenyWNRbyLmn7euubTac8KTG92UgCexQNmOtB2qiFewJmK9+hLyKVawYJhnQFV
	n3XjpEJ5pP/cP2CqjjXsbIYBVcVbmhyxOLgNa4MEI79xyhv5NKb9x3ZlnHPWEjM7/a+vO4q0F6H
	JLZqQytP2t9ZFghl37yx6Hrk8DZBI8D67WeCrUGT+gop4VFGFJ2oxNU5zmWipe2Q1y4DLaoFE3N
	LR5h7hm2+AjUjfha9yJiz0fxywJJclYOPbKSk9Y3uSevaZfB6GA+ukMbpzG7+hntoeLle5Ae1QP
	0kKqbJjbE=
X-Google-Smtp-Source: AGHT+IGgdAQVbgDDtQgywHFuDtSOnLmbKS79CS28NBZ+tpkMBVMY/xVz4lFDKY3SSoAolRTdIsoDJw==
X-Received: by 2002:a5d:5f92:0:b0:3b4:9721:2b31 with SMTP id ffacd0b85a97d-3b77671595cmr9764320f8f.5.1753710302662;
        Mon, 28 Jul 2025 06:45:02 -0700 (PDT)
Message-ID: <ba9c3caa-11ed-4b84-ae28-d55bb9ca6a86@suse.com>
Date: Mon, 28 Jul 2025 15:44:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Update vendor/family/model logic
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250728134215.3183214-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250728134215.3183214-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.07.2025 15:42, Andrew Cooper wrote:
> Switch to the new fields.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


