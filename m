Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6F8A703B7
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 15:30:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926562.1329401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5Id-0005MO-Nz; Tue, 25 Mar 2025 14:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926562.1329401; Tue, 25 Mar 2025 14:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx5Id-0005KB-KR; Tue, 25 Mar 2025 14:30:39 +0000
Received: by outflank-mailman (input) for mailman id 926562;
 Tue, 25 Mar 2025 14:30:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RPpQ=WM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tx5Ic-0005CO-9g
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 14:30:38 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7e48aa6-0985-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 15:30:37 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso52626195e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Mar 2025 07:30:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9b4ce9sm14055331f8f.53.2025.03.25.07.30.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Mar 2025 07:30:36 -0700 (PDT)
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
X-Inumbo-ID: b7e48aa6-0985-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742913036; x=1743517836; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4hiG0/x1QNvU/o/hrnR+dFzTICzDdY/BHx+voRbTg+Q=;
        b=OYq/KUibsOEMYIDuVaQZNg2PM/TZXZTaz5Y1kE66hIykGxh4emIJje1MDMcOBpHV/f
         7NgUCLNPnlIwLurlrAV3FOTJpBAyZM114T0PqcOKs/wWzYILhmpLU2HJ7mEeOSQzo7On
         QSMDsRK89bsqzqoOaLM9IRQwWQX0qHa9TJwtQWLO9mLy2lORfTpW6Q6PaA0ouALOtwE6
         6904scljc0dQ0mBCmFBcce52vs4VEh9bqNcYCiUxxNSINJoyDKa5riZBfpVrByADFLU/
         QeXsJYRzo7vrHar+ZuV5F9rgxxNxiZgwL5b5pto5rQphpZAjaTCf2eJtSMUh6pZ5WzjI
         qSwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742913036; x=1743517836;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hiG0/x1QNvU/o/hrnR+dFzTICzDdY/BHx+voRbTg+Q=;
        b=LrxBJDwpu44zDgMxdDlRZ1++J0r23aKEPi4UF1YPBH098y9IvwQpE5UxSD2scLk3JR
         w4KT1WwSX/hxt26j234kAIkNvyzFLK9rfqtECjf6u1e8+Fe7+/P9jsbVy9HRCeqBvMge
         WSD86BYX6Q9PRV1OckMgH4WknGDKOqjG4dzvOIkJca0R6SJjT0Sws/P0Cu3xdUqHdiDr
         C/BkuUs3FeSDPsW5Sre2MaC90qj24iwt8Nb/ok6Iy6eGgAOlewuNe0w/6ABAaG8Fb3Un
         roo+Pxd7n8tS+PCqDT2uOOz79hlN6SRXlbTLoNe9agQc+6rHIRDQNQ32sy10SniqIiVr
         IkIw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ74SnHthOw1qgvJopVZ27e/dMFekzLtAjBsdFyCxWWFD5+UWTnbgxcZtolV66KkXLBvm5ZWf6ncA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+k1EK5l8jbLwlIfC/ueqzFO9zAT48Vdybtj5ITWCfxVXEjA7N
	uIVJMkXl0I3zOF2RenmeS/3h9bj6EaZark2d2p70KSg/DCXSk/GORUKvHJR6Lg==
X-Gm-Gg: ASbGncuPNL1yl4Dx2FivcEelwy3Eqq6rp2SWW8vWW87C20GEf3jvTG2TVLPvXheSMlO
	qAwMMia2IQ3lm7PsMASxMQvW6z3ISi5L3wlhEzeeNv9c9VgvXCzBsqpzqi3dx+l6mdtO2ZtbLDN
	A948h52v4INztSCHvcKl/JsaV0AsTQZBdcEdgbCAovymL6pvIDzCKZk5tq7LukuTR7sbKZM2Twz
	tepoYNyauLbRi41tPQbwEeg4zXou4Z1ZJOCIjbEPElFe/SxzY3fwFberg4iYuTLuu6xx+G29O06
	v3SIGn+hcAoZirlWlTPeFkIPrNOSurMH21u0u1LZfvwOMNWXP9jaML+8/jEUapCR1wKnW0WQnd3
	9t7g79oKnbyJi06p89/ak4DJUi1veww==
X-Google-Smtp-Source: AGHT+IGF+3NF/99eQR9pYjt11RJfg7+AfDLf0bYHSZYrPoNrvK6QSXw5Vl3zqc4BbZthOMSGabUwYw==
X-Received: by 2002:a05:600c:1ca0:b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-43d58c9a7b1mr136260545e9.11.1742913036353;
        Tue, 25 Mar 2025 07:30:36 -0700 (PDT)
Message-ID: <a2cbbd03-b91c-4d64-9392-7db46dc582be@suse.com>
Date: Tue, 25 Mar 2025 15:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xenpm: sanitize allocations in
 show_cpufreq_para_by_cpuid()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Jason Andryuk <jandryuk@gmail.com>, Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d1fca705-bfed-4370-a907-ca090dea58e5@suse.com>
 <fdab048e-3738-4e3a-8865-41af3180bf3c@citrix.com>
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
In-Reply-To: <fdab048e-3738-4e3a-8865-41af3180bf3c@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 15:20, Andrew Cooper wrote:
> On 25/03/2025 12:51 pm, Jan Beulich wrote:
>> malloc(), when passed zero size, may return NULL (the behavior is
>> implementation defined).
> 
> More importantly, this is the Musl behaviour, so is how ~most of Gitlab
> CI behaves.
> 
>>  Extend the ->gov_num check to the other two
>> allocations as well.
> 
> I'm not sure what you mean by this.  Only one of these hunks has a
> ->gov_num check.

Not sure I see a better way of wording this: What I mean to say is that
the ->gov_num check that there is already is being replicated (with "gov"
replaced accordingly) to the other two places where similar allocations
happen. Maybe simply s/Extend/Mirror" would already help?

>>  Don't chance then actually using a NULL in
>> print_cpufreq_para().
>>
>> Fixes: 75e06d089d48 ("xenpm: add cpu frequency control interface, through which user can")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> The code change looks ok, so Acked-by: Andrew Cooper
> <andrew.cooper3@citrix.com> but I'd prefer a clarified commit message.

Thanks.

Jan

