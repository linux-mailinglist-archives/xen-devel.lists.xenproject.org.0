Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D557C81B487
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:58:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658822.1028212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGkk-0001oI-RE; Thu, 21 Dec 2023 10:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658822.1028212; Thu, 21 Dec 2023 10:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGkk-0001lp-Nx; Thu, 21 Dec 2023 10:58:10 +0000
Received: by outflank-mailman (input) for mailman id 658822;
 Thu, 21 Dec 2023 10:58:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGGki-0001lj-P0
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:58:08 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d1f7558a-9fef-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:58:06 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40d3bebbf6eso4906785e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:58:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 iv11-20020a05600c548b00b0040b4b2a15ebsm2889175wmb.28.2023.12.21.02.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:58:05 -0800 (PST)
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
X-Inumbo-ID: d1f7558a-9fef-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703156286; x=1703761086; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZFyaS55iy8R1mRl/86DUZC7JWY9E1Rum1CTPCh3Yi8=;
        b=b7XOfl7toGRzSuR5Ct9yd5XLbmO+hPlqBfc9OW8YSHmSMTJFXQwwwDPOSqXkYNPbx8
         9iVC3QE2IPzTq81dniU++8nGmvGw9kMMKEeWhHf9KcWEcQrzDyXrnTfApBt7F6xgMUL6
         vDQSPvJZstim5kkhl3bxPeZH4m7j1VmT86weJSjv41aLo9EZHsy3EYy+lfTGAESQQ4iE
         NPNznSmx/ti13KgfoWF98+ZrJzIyMWUvDVbYmBMVA2hQWlBOYXbS5+VjSqZAy5CHtw3E
         o6M6A42kYcAid8kWK0IIdtdGs4DzOAhFTXjZBIlZZzShwZ+1497YpgAzdQIN89jBYLUJ
         W8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703156286; x=1703761086;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZFyaS55iy8R1mRl/86DUZC7JWY9E1Rum1CTPCh3Yi8=;
        b=R2FccSwtwzbM6FE40eSNCUf2k4qAeDIyWcCT4KAb0vzWImXGFtE/qAEuvV668TAaP2
         gfmWOm1NuBHNM09dTHF7HrU831RGSalzAn8dgzYSrMQ41dIQIvfjRUE3QRIvDtS2SMRS
         wkkn9Sv8UZUQkirYGsqy5UYTAFQXLI/TLjYesONhCqyWa9RgFqkMv79aGlXNZbmPIQhE
         YBjB4Av6iYkt/BX62MWxvc5NhUNbRj2p+dp4xyIVb9dBhPMKi7YMDxNuKfJygwOm+Uux
         /J6PXL7cyz7cig1TkVzM3X6bJUT/wQzpixWMZNM6XiXizyT052JSn39cvNhsJeHuHKqB
         5Dkw==
X-Gm-Message-State: AOJu0YxWKLm8mFLjTNwe3CAgyBAvAISNYyCK7Z4zH270j8cpnEd65HW7
	QhXzs5QchokPGf3YSUCRPo+z
X-Google-Smtp-Source: AGHT+IHRdcsf+l5kL4nLAp14EwbK0CZk2fAVe1NTlMbhlgYXRGQ/Pvssai9wYpGUM1VW/lfeZbKv3g==
X-Received: by 2002:a05:600c:4f93:b0:40b:33c0:a22 with SMTP id n19-20020a05600c4f9300b0040b33c00a22mr667536wmq.28.1703156286125;
        Thu, 21 Dec 2023 02:58:06 -0800 (PST)
Message-ID: <a2050ac1-e205-4d7f-b9b1-aa625136e63a@suse.com>
Date: Thu, 21 Dec 2023 11:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC] x86/uaccess: remove __{put,get}_user_bad()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
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
In-Reply-To: <9cf852da1c03b614bf5010132c58a18adc2a4161.1703155225.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.12.2023 11:53, Federico Serafini wrote:
> Remove declarations of __put_user_bad() and __get_user_bad()
> since they have no definition.
> Replace their uses with a break statement to address violations of
> MISRA C:2012 Rule 16.3 ("An unconditional `break' statement shall
> terminate every switch-clause").
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
> Several violations of Rule 16.3 come from uses of macros
> get_unsafe_size() and put_unsafe_size().
> Looking at the macro definitions I found __get_user_bad() and __put_user_bad().
> I was wondering if instead of just adding the break statement I can also remove
> such functions which seem to not have a definition.

No, you can't. Try introducing a caller which "accidentally" uses the
wrong size. Without your change you'll observe the build failing (in
a somewhat obscure way, but still), while with your change bad code
will silently be generated.

Jan

