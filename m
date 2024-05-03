Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9418BAAC7
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 12:33:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716351.1118478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2qDc-0002Rp-4C; Fri, 03 May 2024 10:32:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716351.1118478; Fri, 03 May 2024 10:32:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2qDc-0002Q5-1C; Fri, 03 May 2024 10:32:44 +0000
Received: by outflank-mailman (input) for mailman id 716351;
 Fri, 03 May 2024 10:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wM3W=MG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s2qDa-0002Pz-R2
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 10:32:42 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 786de246-0938-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 12:32:41 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-51ab4ee9df8so11029494e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 03:32:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d10-20020a05600c3aca00b00418e4cc9de7sm8897606wms.7.2024.05.03.03.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 May 2024 03:32:40 -0700 (PDT)
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
X-Inumbo-ID: 786de246-0938-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714732361; x=1715337161; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LwtdhgJMCWtx/g+IZW/rcdUO2Tt5I4SDONdXJl8gls=;
        b=IdYAUaPl1ee7/ma2Cw/G78dR9WoO99uWR0atMb60xXi1IaeNdt1LgCn6MJ6AuzHVRB
         TiA/FMoDwz8GDuC2OIs/Pk5D0K0rVgx6InAwTCL80Ta+9wAAADOaQYb5vXbjBgBko2Lu
         PUuMRkFKQ7X84EhethCVYmOE3RPJgtXDBWtdqcPg+ZeF0AZkLfhP0w/HoIv1v0NOJ+4q
         lnAOdF5tHlQC+mnSOjLYgoihma59nbN+E4gFIxN8JTjGUNj67ImV93RGV+00H4DVgq0t
         cZx8Etubcx9JX2Rjd1FFFVWf9MkrqHouwIa5ZgE2t9TEP5OjrJG9dusWN8XYTqjSWeXS
         YKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714732361; x=1715337161;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LwtdhgJMCWtx/g+IZW/rcdUO2Tt5I4SDONdXJl8gls=;
        b=cUdOxT0BIuOiuuveJ67zn3jJecfNJKdEd6/GqDjf5V4J3lWjyGyOn+IQD2wzaC5YKS
         G7dOXnBuzP7uY//FueUmMi6+egXp+ub/uX+sWIUGyAxuuKint8l3Rb4yE2F5z+1HSds9
         zivLQj/ikAYuneC1UoeAcq8rLTwzRX/OiAE4aPhBk/nLJpPsBjNYXMI1izd5TSn2WvYx
         r7YJuTJ0KoZIG7wvzxetdzt8QHaYZ2HYzIFVbFpiUaWDTY9W1+QY5kcCH3+ozfgNlEeY
         g81QwphzVJgvvWZpZRk9P1FyNuhwD2OQNx0zAwg4+6LH5iTqzgj7OfUBAr3eVCuIEhke
         EguQ==
X-Gm-Message-State: AOJu0Yxb/gPiQILL7eBrugvWEiPOY98kcf4pEik6F93CbEgo5H6JvgRl
	IjS13564oM8Eksl3GIAa8hhDLwJiduWNKrCSdSGxXQAcwIpBnYAbUWO4nZRhZQ==
X-Google-Smtp-Source: AGHT+IGCjl/51ZWB5mk+Di29fz92dVWfq3PJlYg8rEjSRXj/Y2Udv2M72vv5Mohlz8rvMiRfBs8DLg==
X-Received: by 2002:ac2:522c:0:b0:51c:d876:710c with SMTP id i12-20020ac2522c000000b0051cd876710cmr1404026lfl.37.1714732361014;
        Fri, 03 May 2024 03:32:41 -0700 (PDT)
Message-ID: <b965ee57-c6fc-459f-a5fd-fae47dc6ea9d@suse.com>
Date: Fri, 3 May 2024 12:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Referencing domain struct from interrupt handler
Content-Language: en-US
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
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
In-Reply-To: <CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4SmTy4eWhyN+F+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.05.2024 09:45, Jens Wiklander wrote:
> Hi Xen maintainers,
> 
> In my patch series [XEN PATCH v4 0/5] FF-A notifications [1] I need to
> get a reference to a domain struct from a domain ID and keep it from
> being destroyed while using it in the interrupt handler
> notif_irq_handler() (introduced in the last patch "[XEN PATCH v4 5/5]
> xen/arm: ffa: support notification"). In my previous patch set [2] I
> used get_domain_by_id(), but from the following discussion
> rcu_lock_live_remote_domain_by_id() seems to be a better choice so
> that's what I'm using now in the v4 patch set. The domain lock is held
> during a call to vgic_inject_irq() and unlocked right after.
> 
> While we're reviewing the patch set in [1] I'd like to check the
> approach with rcu_lock_live_remote_domain_by_id() here.
> 
> What do you think? Is using rcu_lock_live_remote_domain_by_id() the
> best approach?

Is it guaranteed that the IRQ handler won't ever run in the context of a
vCPU belonging to the domain in question? If not, why the "remote" form
of the function?

Furthermore, is it guaranteed that the IRQ handler won't interrupt code
fiddling with the domain list? I don't think it is, since
domlist_update_lock isn't acquired in an IRQ-safe manner. Looks like
you need to defer the operation on the domain until softirq or tasklet
context.

Jan

> [1] https://patchew.org/Xen/20240502145645.1201613-1-jens.wiklander@linaro.org/
> [2] https://patchew.org/Xen/20240426084723.4149648-1-jens.wiklander@linaro.org/
> 
> Thanks,
> Jens


