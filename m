Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24914B08542
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 08:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046218.1416488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucINd-0001Nu-70; Thu, 17 Jul 2025 06:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046218.1416488; Thu, 17 Jul 2025 06:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucINd-0001M8-3r; Thu, 17 Jul 2025 06:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1046218;
 Thu, 17 Jul 2025 06:46:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kd8q=Z6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ucINc-000126-A3
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 06:46:08 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6dfe5cb-62d9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 08:46:06 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-454f428038eso5407145e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 23:46:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31caf7aa71csm832799a91.8.2025.07.16.23.45.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 23:46:05 -0700 (PDT)
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
X-Inumbo-ID: b6dfe5cb-62d9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752734766; x=1753339566; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCeZGXYHqA5R2HGfoD4db7/VwCFssAu7wxJMKIldbyM=;
        b=Hv1Y+Y53iH3mrElaxIhT8+QYP0KKPbOo0Z0oGGKoYSJKWm/URMFZNuYXf9QeZ7r+8M
         KreMjoq3rTxVufy1BUrHLcbawOYZ6PSrwnD/o/KGpWSdJoWMxBw3YJa67jwt70Z2eXmp
         c2xxvWNMpJiIIjAXdawrSlE0H59AP9OjdXS7tZtlRoSLM/fyLKiTU2ODyDqMJb4IZMvw
         PPD7zt70zllOf626lgzxIVftLFGp+HdiiOoogAzj6HFStJlcpMNHYL4tj2t+IFOYJcdn
         iKCH8xDQjCa6OOQVf2DyDEqttw2HBIr5nJR4rQLadYpvhkaM9S7WiXBgp8h7OjomUiGH
         txAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752734766; x=1753339566;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCeZGXYHqA5R2HGfoD4db7/VwCFssAu7wxJMKIldbyM=;
        b=fh5GY73rt4PyNNTBqZUo+QxnBE3yLQE71XzcnwdMlB193DCPULxa8HswDoPUKsKpje
         PDT//1e6q3i+iCtUq1CywU5j0YZwejlJJE4vxOuVKqyL9ZjEGqkvfsbL99OZJhukcUOt
         4V+tyaksSl2M5k94pqIWyyxUM8fVZDsfVqDdv8Mnv0ssjsYcv00QMu+G7lLd5xO8GHZW
         ODkE202PYItH3pNjNPmCKQvHebHxosb3mRKFx0BEpCS4gFtXOCd4rGIQgiLoH2103STh
         b0dMO9NcyiEZ0CGT8Df4tWOi6jQqjMVepM0J3UptTsx/wS+4Gumhru8K9TzT658ta8G6
         gkIA==
X-Gm-Message-State: AOJu0YyAIhmt6HPD8wWr0T9lCSjv1D3Ug7f3Qae2YufiD5bSCjO1Usnj
	k/4wuorFQziYHPMum/CoxVAf5+h3Ett3HLXbGp7vz5p74NQnQVktrLuB8GgKXi67zQ==
X-Gm-Gg: ASbGncv/CVOVfI9j3Fm4UerjMnECm9NdXBQzwisHonKXgabpOhae5CEgPgM/JWDGcmd
	ojlXh5ZSzYc2DIn2NzxXKaxUC0BUUJzRNPHSQq5CubFy88nQDnEC2HmY+sIEy8kZm2aduDW3Cgb
	KcU796peQTLXYXYDycL4As4JRa206g3IwCjXzucl0TbfiJ4D9Up2z8SRXZEd1JKKooRQ8+VYrcy
	KQWE8w0lhbVgXmXAryKFU6oyW21BkFsW1p4UJh4WHuelSTuwuJ6/YSj9ENKaaeaIelKABg3cGtF
	W83U+kHWkaV+5ChZlb1cilhOM8yLNn/Iw7B/5W7frPt23QdjKS1Asv7s01YLP9rKY7J8M/Zo7q4
	r865aVV59qyUGZCMeyYmXSzJE2Ha0I23vZesU7QjRnQ/EhtrEi9Oti2ZYD9Sh7yGwm+QKnWwwKx
	t50vmUMsU=
X-Google-Smtp-Source: AGHT+IHXRIFLAzUu8h8dJYiz5aBAbjHfhfT2CSSX7CzaLVGkaZPpInzBg6yLUzSgvElwLbY2gZ6QFw==
X-Received: by 2002:a05:6000:20ca:b0:3b6:1175:b62b with SMTP id ffacd0b85a97d-3b61175b62emr1598475f8f.41.1752734766111;
        Wed, 16 Jul 2025 23:46:06 -0700 (PDT)
Message-ID: <a6fcdb51-8bd1-4595-8f28-deafcc15ef86@suse.com>
Date: Thu, 17 Jul 2025 08:45:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: tailor the definition of Rule 12.2 to C standard
 types
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f486aa4ac823085afb7e068f6e84ea6be3cab19b.1752667611.git.dmytro_prokopchuk1@epam.com>
 <alpine.DEB.2.22.394.2507161809120.15546@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2507161809120.15546@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 03:09, Stefano Stabellini wrote:
> On Wed, 16 Jul 2025, Dmytro Prokopchuk1 wrote:
>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> The definition of MISRA C Rule 12.2 ("The right hand operand of a shift
>> operator shall lie in the range zero to one less than the width in bits
>> of the essential type of the left hand operand") is concerned with the
>> essential type of an expression, while the C Undefined Behaviour is
>> related to C standard types, which may be wider but not narrower than
>> the MISRA C essential type. For this reason, it is safe to consider the
>> C standard type, rather than the essential type when checking the rule.
>>
>> To avoid regressions, tag the rule as clean and add it to the
>> monitored set.
>>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I was about to commit this, but Dmytro - your S-o-b is missing.

Jan

