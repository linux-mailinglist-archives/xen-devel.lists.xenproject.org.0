Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE09B0A607
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 16:18:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048834.1419028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclur-0004Kf-Ks; Fri, 18 Jul 2025 14:18:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048834.1419028; Fri, 18 Jul 2025 14:18:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uclur-0004IH-Hc; Fri, 18 Jul 2025 14:18:25 +0000
Received: by outflank-mailman (input) for mailman id 1048834;
 Fri, 18 Jul 2025 14:18:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RNMk=Z7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uclup-0004I9-RK
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 14:18:23 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f35a95f-63e2-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 16:18:21 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4563cfac19cso6735505e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 07:18:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b5e3d37sm14016595ad.16.2025.07.18.07.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 07:18:20 -0700 (PDT)
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
X-Inumbo-ID: 0f35a95f-63e2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752848301; x=1753453101; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aMZH2YxHlsH0XSlNeX0UZ6zA1jCMIRp7HV/F8iZ2BxU=;
        b=ghq218R05EivY/JV7DDsK3dkuANMMGfLAlkUj1rJAMXm7MVAFxi0vsPcopWoCPTfas
         LfpR1S121itraV3cyzKpe7vOjLzR3LwQGz9XbMfsh9CxDe1AERC2lQK3hd6monf2ZH1F
         YE487IoSWWKuEJH5DCx6cVcIyVBJwaYDI0Oyl8nT8MiPfG2PkiFbUzX0IpLtxphmWKbi
         6//G5xQGWHcnZxH/cDMZqJ7914b+0OrcBMkj1oLjod8fe+HSqSQlpGQ00HlqEwRFMbjx
         7hD211ZdUAm6GwO2upcZCslxxXjyDAsaz0ajml4LWP1uXixVoE8lNs/rAN5QgimAZnt6
         Iz5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752848301; x=1753453101;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aMZH2YxHlsH0XSlNeX0UZ6zA1jCMIRp7HV/F8iZ2BxU=;
        b=BrmAaS8e/gYvO7B9j/F9bfSp+jDgKyCxN3iwlN/NrDkegnInUHYgYb/4rK894Eb+Ut
         QLzl7F3GYc67j7g/+lcMr7VtHTdsGRXq+o1s6yoQpb3IdzCV/8tQBm4mYKiVzPqvszKi
         bbCyLBKV2/I40mNAtDjHBIJ5/l+u0WkKqxsHqxFFwTBMZNQk9tr/ORJRaJuCQtl+TZvW
         e4IHT3eBA2p/fI7V0nnj+dTN7fN0cRfcCJmjUXx/ixlnHtNJ7x7A2SvM9OtEPDX4r+RG
         SgBxVTzSKzHBKBxc/PFsmxBNBJ5JFe2iK5t3bmF4e6sRhzd5FS0PSrQkyck14RcqFI2A
         WwYw==
X-Forwarded-Encrypted: i=1; AJvYcCUS6CRNv92iaW6vpNgd3vifGhlT6Sz8RjyWn8zip87ZQr//19wbgLyvn8ANH4ma7y/zKEUCsmLzPL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzbzl66915S3kqL82DGkVSaecl1Ypm2UDR2tAfWjPsPX6YoFn7b
	v2QI0amQB4B/ulA7bnR3HI4dN6R6PQhsk2BhLNO+UU6+NDiD1MfZlxJt0WcUUV+NxQ==
X-Gm-Gg: ASbGncvCcIwkcqMs300Wht9NB/cgOctgznE5w8cTu97sabUEc5UGEXCzVGAfBYEjNE4
	W+p3ce5eIiI9+sI6+K8KNoZ5DqopDcRnRPf0itGiXRXboa4Jwk41qvBb/K0Ei2g59pNdM63ytAb
	bSFl9EuRZglgRXHUYyZ331slIXcrDDJMxSOSOyT3iKdFGUKSnGWHnFhtqF5jbfev3GF8AwNIiA3
	Er8xdvTAlIo1gbDMC3c3Ttpz/zhFiZO0J55N9rzuwYrmke4NlB5C7xMHeFKFNJTL4kwg14LNPFX
	HOinFtm7v9XnjeeGqSjo7cCBze4XfWQcvPOjGph/nD8hvuSgS0oBarWv1HIcxqfmUp3CXtULKVQ
	U7s0kfWNaaGB1Gw0331TFFZz3jGvYFjFsSxuNX1wCT+7Qx4jHUcaaFwFb7602ikB1//66ESahQv
	DbfOlF2yE=
X-Google-Smtp-Source: AGHT+IG0ijR8mgn5YYzvHmQFMxtOpE8HK6JSEzaO/KcgXCz5tJ0HM1AIbvw5gGF9jo090EmxkHfApw==
X-Received: by 2002:a05:6000:290d:b0:3a4:d53d:be23 with SMTP id ffacd0b85a97d-3b60dd731cfmr9774863f8f.30.1752848301226;
        Fri, 18 Jul 2025 07:18:21 -0700 (PDT)
Message-ID: <e1bc92c2-1a07-4c91-90ee-162cdb879ad6@suse.com>
Date: Fri, 18 Jul 2025 16:18:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/2] xen/arm: irq: drop unreachable pirq callbacks
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Ayan Kumar Halder
 <ayankuma@amd.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250718101149.3107110-1-grygorii_strashko@epam.com>
 <20250718101149.3107110-2-grygorii_strashko@epam.com>
 <fd215aae-fd68-4ea6-bc67-33e908ef6c7c@suse.com>
 <8b600c93-b8cc-4828-9a20-90b9245da026@epam.com>
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
In-Reply-To: <8b600c93-b8cc-4828-9a20-90b9245da026@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.07.2025 13:47, Grygorii Strashko wrote:
> 
> 
> On 18.07.25 13:22, Jan Beulich wrote:
>> On 18.07.2025 12:11, Grygorii Strashko wrote:
>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>
>>> Hence all common PIRQ code is under CONFIG_HAS_PIRQ idefs corresponding Arm
>>> arch callbacks become unreachable, so drop them.
>>>
>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>> ---
>>>   xen/arch/arm/irq.c | 29 -----------------------------
>>>   1 file changed, 29 deletions(-)
>>
>> Can this really be a separate change? That is, aren't we going to have transient
>> Misra violations (for Arm only) between the two changes?
> 
> The violation exist even before this series, and applies to arm/ppc/riscv actually
> 
> alloc_pirq_struct - unreachable
> pirq_guest_bind - unreachable
> pirq_guest_unbind - unreachable
> pirq_set_affinity - "reachable" at least from compiler point of view.
> 
> Would you like to have cumulative, cross-arch change to drop above arch callbacks and
> squash it in previous patch?

If the issue is pre-existing, then it doesn't need squashing and the order
isn't important. But it would indeed be desirable to have the cleanup done
across the board.

Jan

