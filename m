Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D018956F7
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:37:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700172.1092869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfGF-0005lH-Jr; Tue, 02 Apr 2024 14:37:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700172.1092869; Tue, 02 Apr 2024 14:37:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfGF-0005j0-H8; Tue, 02 Apr 2024 14:37:15 +0000
Received: by outflank-mailman (input) for mailman id 700172;
 Tue, 02 Apr 2024 14:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfGE-0005is-3i
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:37:14 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e85de9e-f0fe-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 16:37:13 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41551500a7eso25584945e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:37:13 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l41-20020a05600c1d2900b0041562a58b75sm7823558wms.13.2024.04.02.07.37.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:37:12 -0700 (PDT)
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
X-Inumbo-ID: 7e85de9e-f0fe-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712068632; x=1712673432; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q5q0QiQ4WmL4gl68yAGoMWoGDDZ7DDVhGUn1x7Lp9/Y=;
        b=MWvYyDoQFdSPeQ948BCUSNMqbFzQkC89RvtLCPC5icfkqdguPc5Pn/xjAFxCi6DYWW
         dtXRBWwJs1UYiztUeLBTrnpKakZ7hj7E9dW7n91urxri9iNL3mk1K+CWCK+fVHWOW+OA
         KgZJdPPRjJSqRktUZb8INH+MXT8I+1IKjZ5uiW+zpjhm9owvCX81qWkGwLA6C3EwMfFD
         rmfKCiSMoXkrYZTGKtSTA7qVfPrk9WEjrbwU5wqcjg+LXfi+iMrS0KvV0isw9KoHG0/t
         LBfy3QcPZSOFxCIpBm8iHAZsGzfcCsX6TgQsXASO8w7Wd4fK6kUqE6k37cPVC2tH8sts
         5WJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068632; x=1712673432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5q0QiQ4WmL4gl68yAGoMWoGDDZ7DDVhGUn1x7Lp9/Y=;
        b=goF5CW3zpILIs1xzaNSc3CM/l7IrvCLQMDN5nQenT+IQx0gPM3x1xB3HoVHYNRSpl/
         kM1zyDJ2MwmhNxg5AUOBacPpWrXrdI8GJJGLA8FlyWJ2M4z09CFCtO5HtHJpZ2nWECxu
         h+Xe+xiwTcted2GZmldMf9jNiiVCWARcr8YUtzmSo75OrWnhUt9ExWX6E2wNA33fv0g8
         E9E3F2olJMBdJqipB76uQycopheVBW0xLZZ4TOOHE158hM3nl4Yw9gJkOtrDeVwIhkQH
         ycKvcxa59DB2XfdzzNZvTZjwiCwVCiEgXqGaxGFoZ2F9+3Z2UoTz9VwmJUCHNGrFI1Ln
         p51w==
X-Forwarded-Encrypted: i=1; AJvYcCW6AamTpi88wqiVOLXCP4WNWMcLonhEg22izvPFKw0yeJd/ls86C4xQ0LnfJrLATvODkqda1W2l33LdmNrUoQkxjrZxhl4FY3slYpz62Tc=
X-Gm-Message-State: AOJu0Ywhr4cwFFGxAS8KkIdn2aE6os4+RDeM4ozj5+A8RGoMPXpcCwrg
	9BOv6p8WxqbYbG2ho9rZ16WHWhMuOo+9tbc8r8ZmDZe/TpzXYh1+EBcVnyN/Pg==
X-Google-Smtp-Source: AGHT+IFlDUklR6p5lScuL8EjrjIDc7UBw4/OBqrXqMczj6SJ1AY93hRGrpiAFixNOWCxU3aMUsyJ2A==
X-Received: by 2002:a05:600c:3502:b0:414:8065:2d25 with SMTP id h2-20020a05600c350200b0041480652d25mr9619665wmq.38.1712068632681;
        Tue, 02 Apr 2024 07:37:12 -0700 (PDT)
Message-ID: <d8d0a23d-3f00-4bad-9c3d-f81c0d172d95@suse.com>
Date: Tue, 2 Apr 2024 16:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] xen/spinlock: add missing rspin_is_locked() and
 rspin_barrier()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240327152229.25847-1-jgross@suse.com>
 <20240327152229.25847-4-jgross@suse.com>
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
In-Reply-To: <20240327152229.25847-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 16:22, Juergen Gross wrote:
> Add rspin_is_locked() and rspin_barrier() in order to prepare differing
> spinlock_t and rspinlock_t types.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



