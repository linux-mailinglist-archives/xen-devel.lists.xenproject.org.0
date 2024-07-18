Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC1934AD9
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 11:25:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760318.1170124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNO7-0000kO-3n; Thu, 18 Jul 2024 09:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760318.1170124; Thu, 18 Jul 2024 09:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUNO7-0000hs-0S; Thu, 18 Jul 2024 09:25:23 +0000
Received: by outflank-mailman (input) for mailman id 760318;
 Thu, 18 Jul 2024 09:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUNO6-0000hm-6k
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 09:25:22 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a707ecf2-44e7-11ef-bbfd-fd08da9f4363;
 Thu, 18 Jul 2024 11:25:20 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2eedec7fbc4so7515861fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 02:25:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70b7eb9e1f9sm9521797b3a.44.2024.07.18.02.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 02:25:19 -0700 (PDT)
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
X-Inumbo-ID: a707ecf2-44e7-11ef-bbfd-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721294720; x=1721899520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EurgUxlYhaAI8y9cnRLb2B+YuA+juv/H3Qd9TpCrQwk=;
        b=cYg07m+G1r+GEnF0BXRzJm6xdIKerSTRNaYIzYaLLZErOmKzZ8emd8bWKiCf049c+H
         20i3F5LttFs2RR3V4RqKz39Rpr5oP16BOCNHHhYBk1w/4UNrODJNFCgtkwJb2MLAs7X/
         UlBUV+7r/V3OXm8SLgTQT93Jee4NgwhN6puLMSN/dqMqwajuH1G3DfoFXOZ0ntnkTy7f
         eND5970chkHPFz3Sndrsgvb9f7kVnp1Eh2Je4OEAYkiSpJzefOFn8bmIsb91QD83JpGy
         Ul9vbCo6tV3AE4tdqY5wWJl1c9iCaOxaZCbCtDnSOOkAl5QNP5VsA9FnmRQx4NZSJ4HI
         BNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721294720; x=1721899520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EurgUxlYhaAI8y9cnRLb2B+YuA+juv/H3Qd9TpCrQwk=;
        b=F9EU3z2HeT9PBzaXRwIQ5PFpYTUuVvMRDSS6+VrzBy8wC/fiCNhgCfTx5SIMmWZYq4
         WB6Um3e126wqOu3MmtgvDtVB+ys0IWmNhgzuvN8sIasxQzic9z6N4LmMnLYm87Mtzw3Y
         0PGERp2b5dOyNlECvSv6FiMCC9sWL/beyxn0kxGdhdCEvXxZ1kKwCnveVej0V2K85g/z
         pR3R6pMlIKeuxGwhp1lO19bxIes1nkcE3/wHOrqhgWGqAyNpLp9gCKeS9TovrSMQsfxx
         SckLm2M+QntHGnLo2EacNX6n6qCWk7LYdMEZ0v6NJIp0xw0a5xqgbmDhKxo+C/CzHVAB
         OdvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzI69k/hFHnydFSIwqVAHdqV9S50zjRt+LK33hwic591qYkhCHCgKGNJAzCgkQZ9k5B4yF/DPM6edlTTcpH3u4b8mCtL+gXuAfiuZQDPM=
X-Gm-Message-State: AOJu0Yzm/JG8U9XW5rcJQ3CSMi95sforneWSyU/CU6+CFFerPMz0VhdG
	TZhkePQsDUajspUnea8YafGP6uz4Ig3vAX3Zkr+SpB3uKTZRnP5JxreejEGnJA==
X-Google-Smtp-Source: AGHT+IGZev0VZvslKR6HhFbiNe1IUefBtAvmqvrcML2UowJ5xbOZbnDE8RGVpcxeeKScr+ELt53sIg==
X-Received: by 2002:a05:651c:1052:b0:2ee:4f93:ae25 with SMTP id 38308e7fff4ca-2ef05ca1e53mr12741581fa.29.1721294719637;
        Thu, 18 Jul 2024 02:25:19 -0700 (PDT)
Message-ID: <b90ae2d3-35f4-4bf4-a498-43c0fa920fae@suse.com>
Date: Thu, 18 Jul 2024 11:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/mm: Drop duplicate l1_disallow_mask() calls
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240717161415.3586195-1-andrew.cooper3@citrix.com>
 <20240717161415.3586195-2-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240717161415.3586195-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2024 18:14, Andrew Cooper wrote:
> Even in release builds, gdprintk() evalues its parameters for side effects,
> and l1_disallow_mask() is full of them.
> 
> Calculate the disallow mask once and reuse the variable.  This improves code
> generation in release builds:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-207 (-207)
>   Function                                     old     new   delta
>   mod_l1_entry                                1947    1860     -87
>   get_page_from_l1e                           1391    1271    -120
> 
> Also, render the bad flags message with a 0x prefix.
> 
> No practical change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



