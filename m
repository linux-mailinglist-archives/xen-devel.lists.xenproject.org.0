Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B4D934C58
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 13:23:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760406.1170254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPEZ-0006Y4-1g; Thu, 18 Jul 2024 11:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760406.1170254; Thu, 18 Jul 2024 11:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUPEY-0006WZ-VK; Thu, 18 Jul 2024 11:23:38 +0000
Received: by outflank-mailman (input) for mailman id 760406;
 Thu, 18 Jul 2024 11:23:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUPEX-0006WT-Rx
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 11:23:37 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cd418f1-44f8-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 13:23:36 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2eedea0fd88so9132271fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 04:23:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7ecc9965sm9778385b3a.199.2024.07.18.04.23.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 04:23:35 -0700 (PDT)
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
X-Inumbo-ID: 2cd418f1-44f8-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721301816; x=1721906616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BQkhRiJhmlIyT8KpzqkTFOqSCn6RIZmXHNiKYpe3CdU=;
        b=UCPBw7ZTZyl6X50INqMccQFQt8cyyYahOChpYRPNK7/5OxBVBBC6OWDWWXkF08Hr2b
         YU+YOQEg966jFxGv3G4H79AeKw+CVdbTIdWOH4bngGmAHylEpnyBek1AYC6C++MICtH0
         VckEWGQyTEoahcNKq537H6HpwAT269UlpSNSV1tuUmBAo+cI9RsEZ9uhn2X+dW+FD0jr
         Yg4cV5c+lfgIQ55D3UGiKt/Uo7nzhJhYxnL4Aysncojj7RXii+xMunL/ZT41FdPcYIT1
         lqV62I7MhYQx2lzlDgzMUH9sJ6DNzb7Y+SWWPjt3wxZcUIRZaiFBCUQeWTyhxTEViV8d
         cNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721301816; x=1721906616;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BQkhRiJhmlIyT8KpzqkTFOqSCn6RIZmXHNiKYpe3CdU=;
        b=FuAMsLCKSTzkCBqfof0SVuwRWN0Lr74yJu/a2nANQzriGzx/HtlhImYGtd4X3AGcOn
         +513gow/3ad80HR4c3AwZ5rP8o3VJBSgWESwtHx/UkAkacEK/BzyyLCydwhUNVV/B808
         nnGksqCnuE6R+aI8mghxSdjvDQYE+rzjlwyS/D3tKlIsZZ7TafUK1GZ9ocC9lbk1Kvxy
         3jyKcxeGL32l+anyEB0F8DKq+wjnxJM1ALLtuWMPu34RU0+dUxhGwO3JJ5sAant+2286
         HxPU4DWbB2qT6UMD+D4tFq1Lt7dCe4HbeAnFKrHhLcDYBNSKiFHMjfUDWECO0/w9qdti
         CL4g==
X-Forwarded-Encrypted: i=1; AJvYcCV6u7Tp4rIMrtXzpVTWhOh74T8MuBuj5l9ohKXrA98f1sythJoYtaKsKbMNElxL6zl9+zbpIUqjHJFjFbIIjSMYgyYbQLCaJsw1RIP/2h0=
X-Gm-Message-State: AOJu0YznEL0XtpQWCosg7tHgjcUWALmCXO4QW9+yWv/IS1W/V8KX1xHB
	L/UT002/KTpxJM2tgOOd0d8htMR1abOkP4PongJVnAVOgCay7b/jbcZUeJ2vLzAbsWJ0s+P6QSo
	=
X-Google-Smtp-Source: AGHT+IGWEJU6pFAL6aYsOcQzXbuvYKc+74p8AlucKU19FpzyVkApAUbsdBLeqatCRCO4ooaqExrLtw==
X-Received: by 2002:a2e:bc13:0:b0:2ea:7d8f:8d12 with SMTP id 38308e7fff4ca-2ef05d6214dmr15176891fa.48.1721301816213;
        Thu, 18 Jul 2024 04:23:36 -0700 (PDT)
Message-ID: <ac986849-7041-4b1c-89a8-bdf1c4ad29cc@suse.com>
Date: Thu, 18 Jul 2024 13:23:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20 2/4] x86/fpu: Create a typedef for the x87/SSE
 area inside "struct xsave_struct"
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <cover.1720538832.git.alejandro.vallejo@cloud.com>
 <2e2763f4980c98cca0e2c3be057b2299295bb616.1720538832.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <2e2763f4980c98cca0e2c3be057b2299295bb616.1720538832.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.07.2024 17:52, Alejandro Vallejo wrote:
> Making the union non-anonymous causes a lot of headaches,

Maybe better "would cause", as that's not what you're doing here?

> because a lot of code
> relies on it being so, but it's possible to make a typedef of the anonymous
> union so all callsites currently relying on typeof() can stop doing so directly.
> 
> This commit creates a `fpusse_t` typedef to the anonymous union at the head of
> the XSAVE area and uses it instead of typeof().
> 
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


