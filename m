Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 779EFA9EBA6
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 11:18:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.970379.1359094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kcr-0004P0-6N; Mon, 28 Apr 2025 09:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 970379.1359094; Mon, 28 Apr 2025 09:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Kcr-0004Mf-3q; Mon, 28 Apr 2025 09:18:09 +0000
Received: by outflank-mailman (input) for mailman id 970379;
 Mon, 28 Apr 2025 09:18:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9Kco-0004MZ-Uz
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 09:18:06 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1663413-2411-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 11:18:05 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so23392865e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Apr 2025 02:18:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a1544sm153213475e9.11.2025.04.28.02.18.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Apr 2025 02:18:04 -0700 (PDT)
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
X-Inumbo-ID: b1663413-2411-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745831885; x=1746436685; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eU535nLgarq31uT7ifyaQ4E66eUkdn1uDhnoKHZOstk=;
        b=IMVr68Y0jQax8oMMyoFlG1r3MNDI6X2d/NEfgB7qLJ+2Q0DouYlXiK6gBCXTadpTt6
         zKy0noyAfohOhRnNIpR9HsBEyHagN6eeq5G3LJVuRyI5wu1fP0Qco4LDon3D80t/SQ9c
         WD5k8mDRsiwG4/hmMbLR4ZPkPof6BJonwF+zCsgB+uePccNmTERrLBiNdZ7z/ggRODX9
         RuLyvwhwENQxdmf/fSX97gCxJZ7pL0XWpbVx3VzexVPjRRrT2h5xfcaPonGYe15GuS0d
         N3767sO1Ak6TyjFj2ey2czosQq+5b2qcMulVegcICbdv8n6qVFrI9AJalZilyrIn4Gbi
         ww4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745831885; x=1746436685;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eU535nLgarq31uT7ifyaQ4E66eUkdn1uDhnoKHZOstk=;
        b=ChJXIoMeRcQiyqvHjAHQ8NyIn5FlAHsMBfe01/bAsc03lr3Ck5Kb9sgqMFWKOl1lTK
         p+rE//OyDfGhSGT9vPhBL7vjOGvXODkGKVcd+r6+z+xw+DHi4VHkrKqUz5fP8gAhkGc7
         PLAXCErzgd0ti7dDacHGBWAmimtd0tiRmtBOtbGHC0EgvPwzjmnDz1XCIHUrwfDmGCQn
         Q+/mpNYIpxhT3m8B+1yQIAjD964o57keCWiVsDuWISXfeJ7jV9SfpR8nXUWMZEsdZjuH
         J17XRU1b/HuTH7LdN0oAPKm8k0xuF3/Bmhnvb2WIdzicboTVH30tXJStFaBXbggFZGmb
         cgiw==
X-Forwarded-Encrypted: i=1; AJvYcCXHeuE99fiu+1ckbm4cSZbVWLEUpX+n0WkzjfZFBsr/IVJB0gFm1RfhIL7C0h8jfT7aHGJrViznRCY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwZqR+8TtS1k7wFgvZthWz1OMz1xiXINldxlder7GaBQa3KX00z
	7O4iu2JuObPa3KszFoLNZhKkl7IWNWplv62tojdWwKwCHvHfryinYbjofwlq4Q==
X-Gm-Gg: ASbGncvrstUrf4t7dCUlrAW70PNPpnuls2yAW3Pn3KbsImHBDN9gXgYeyLLa8lkGlQe
	EP/hzqSpVjzvTmvAwnVVe54po1d227KWmUjsewCm0KraSLrJQ1WaUri1v/UOavZ7drJvd25J4VY
	sPkmhTdxn82zRRJt3kS+M4vJW6Q0RSMT4/fmEUmXhEwRna6IO2lPob2pOn8Zl1tNHl8p6heAROb
	MQ/B7ugPOX6w3gglUcW7IiPP5hMN0KWgbdvWeTREaGzDuFfIac4uQSOYuAKJjV0S3BNtGA/wE3h
	SywsjJcC939C8Bqd7p9hGlsEoPXOCE9sTvaLkYLI1iMqvVbtiSoE5Bk+Jzpbk/vRZNu7EwhWApw
	R51b0Rsok0RzyxW8UjW70WhgBpl2ie5qgDyWW
X-Google-Smtp-Source: AGHT+IGQyVzicKqqLmRiWYXjWY50j4VYFsu8faydFZgGMysCJj4KqEwLDPn4FrZjktcetOvu37F+FA==
X-Received: by 2002:a05:600c:8109:b0:43d:7413:cb3f with SMTP id 5b1f17b1804b1-440a65ce030mr91160535e9.5.1745831885234;
        Mon, 28 Apr 2025 02:18:05 -0700 (PDT)
Message-ID: <a77e92a8-a7b4-4b22-8fab-e3093258b2d2@suse.com>
Date: Mon, 28 Apr 2025 11:18:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] x86/vmx: Introduce vmread()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, dmukhin@ford.com,
 xen-devel@lists.xenproject.org
References: <20250426072720.39317-1-dmukhin@ford.com>
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
In-Reply-To: <20250426072720.39317-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2025 09:27, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> The current implementation of __vmread() returns the result via pointer
> argument which leads to excess code in some places.
> 
> Introduce a new vmread() function as suggested in [1].
> 
> [1] https://lore.kernel.org/xen-devel/c452a1d7-4a57-4c5f-8a83-36a74ff228ec@citrix.com/
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



