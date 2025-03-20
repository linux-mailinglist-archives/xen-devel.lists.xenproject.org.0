Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B444BA6A081
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 08:36:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.921355.1325207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvASJ-0001s7-2c; Thu, 20 Mar 2025 07:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 921355.1325207; Thu, 20 Mar 2025 07:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvASI-0001qf-W4; Thu, 20 Mar 2025 07:36:42 +0000
Received: by outflank-mailman (input) for mailman id 921355;
 Thu, 20 Mar 2025 07:36:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvASI-0001qZ-Hv
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 07:36:42 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102003ed-055e-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 08:36:40 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cebe06e9eso2682725e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 00:36:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395c7df385bsm22678415f8f.4.2025.03.20.00.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 00:36:39 -0700 (PDT)
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
X-Inumbo-ID: 102003ed-055e-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742456200; x=1743061000; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfv/ZNcx5p2eqD491bJHqt0Y0XP1RyuxRwcFrFdmgUA=;
        b=MB/eYIt4Sn1bmmvdxCnNKWsYWeYhxuUgUpgS/tQcYqqzPvqtyNOtxzYHdqKOayGrfd
         GBtXQqcvSXLTfRibNSycjrRt3QHC11dlRrouiEDsyz3Rh+8yddCYJFgeq3SGe4Ug3BBW
         jRld4DqE9AeLAyNNLJXkCmSzUrR6v/bq4uSwYr1kimeu+dLAMXB6BJJUmsKzDVSEuNTj
         iYxSU5nR0rU23nWBcnZ8sekmPVbnzBZnsJ7DEgaDv3+xvxyGqOzObqUg/z+IVQerS08f
         kCj+IFler21Y/KcJVzYHNFNW6E7lDQBfM3L7sa/M19fGF0qauN6T+l9YVJND4jL1NvWV
         CujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456200; x=1743061000;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wfv/ZNcx5p2eqD491bJHqt0Y0XP1RyuxRwcFrFdmgUA=;
        b=P+n3CSwiOPlFcIyaj8Of0hzzv80fte3ZhcgCbs6rIEJ8ZD1e0ZNwUEwhphBGILxKRp
         sMWtYsA+k9Lau00Tmo8dnZdeSVczZnkBF6WdRvW1RXHM+Gw1u/xlNYU3zRKxURgNYQkP
         BIJ3hBOVnjYpAnOs6HdRZh8Nxoq+jVgrMwv/ebjTv00d9eystuIiLcNEVwYs3VKVZ0Or
         NiQeINnTMH9TR0sK4mbsbFVWEByF1t4UGHvPSVypCwF+ky6DPbaIhKk4h8f/CZMvTDAE
         vugV4EKFlbOY76a+y56AyX4ovcDYvv66ng2lieRyGEAGz5hpTABoa0o3luF9CN1WGmAg
         RLjg==
X-Forwarded-Encrypted: i=1; AJvYcCUg6Ct24/HE/M/2MnknfQz2ie4E/AnZstuG46r16Pow7+omsGKz/KLBG1vq59xjQ5NOdq8e21mz3jY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+36uCse5DjNpL9j4LClfctvJ/QRIDR+MQSEhKWkxA4pp05ViM
	kDqknbPtnCWDUR+O+Mdc0g7quIL3MwwkXPxiFjCwsIHhm7+btNuUyqhqEPYiwg==
X-Gm-Gg: ASbGnctoQtWqd564j+IAVIjzEHdv8lbs4FBQWyujhsSG3q5kZHQswNFI10FQuRqAXC5
	yGSy05ZvSpK3ptS8UhrtyB502v0bRx7Q2ky2LL4Mj0pZsO/lQCN0vJcGSKd31L9nMYT/8X/VmSu
	7AICIawi6FgX539+pexjssXcKqLxRGJsMd2wGYtdiTvzHLgCUkYQNJnCO+oKMkfvDZ65RNgyS8E
	YCquzuPUvODAHBzCJcM+o+FN/orGWRDf/krgc5Mte9sLqXlPu94jePL5sYa5tOYXY2kcg4sv6dj
	DjoARalMthkNK1AE44uFBOx5/kurGvmOmmAf9T7fXHgQhPwb2KXjVcQV8vCRiQym/EaFS+G79OM
	rA+RSkyXuJ0p5HCj8GPMMBlVs3Gm/ZQ==
X-Google-Smtp-Source: AGHT+IFl9Wur7m+SB+BKuBtSs3xxhUSveDycfuS1QB4orz022zG1F+bYJfipML3fGdUVjOA4PFt+rg==
X-Received: by 2002:a05:6000:1844:b0:391:31c8:ba58 with SMTP id ffacd0b85a97d-399739b64fcmr5002290f8f.10.1742456199860;
        Thu, 20 Mar 2025 00:36:39 -0700 (PDT)
Message-ID: <630f216a-10fa-4828-a64e-651dd7f70242@suse.com>
Date: Thu, 20 Mar 2025 08:36:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] xen/riscv: introduce preinit_xen_time()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <3152c755e31367370f3e1d955253a9d4fc095f68.1741709885.git.oleksii.kurochko@gmail.com>
 <f633e10b-2bde-4574-ab87-fec5a2a52b07@suse.com>
 <27dc3481-1f48-46c5-a827-e0a44c17686d@gmail.com>
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
In-Reply-To: <27dc3481-1f48-46c5-a827-e0a44c17686d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 18:29, Oleksii Kurochko wrote:
> 
> On 3/17/25 4:24 PM, Jan Beulich wrote:
>> On 11.03.2025 17:19, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/riscv/time.c
>>> @@ -0,0 +1,38 @@
>>> +#include <xen/device_tree.h>
>>> +#include <xen/init.h>
>>> +#include <xen/lib.h>
>>> +#include <xen/sections.h>
>>> +
>>> +unsigned long __ro_after_init cpu_khz; /* CPU clock frequency in kHz. */
>>> +unsigned long __read_mostly boot_count;
>> Why not also __ro_after_init? And what is this variable actually needed
>> for? Common code doesn't use it, so a better name (describing what it
>> really holds) might be desirable, even if this then means not being in
>> sync with Arm code.
> 
> To calculate more accurate amount of time since boot.

Okay. But how does the name of the variable reflect that? I.e. what it
is that the count of is being stored? The only meaning I could associate
to a variable of this name is the number of boot cycles a system went
through. I.e. nothing that an OS (or hypervisor) would normally count.

Jan

> I think it can be __ro_after_init as it is going to be initialized once.
> 
>>
>> Furthermore, I can't spot a declaration of this variable. Was it meant
>> to be static?
> 
> It is going to be used for vtimer functionality and in repogram_timer()
> so it can't be static.
> 
> I will add a declaration to asm/time.h:
> ```
>    /* Counter value at boot time */
>    extern uint64_t boot_count;
> ```
> 
> Thanks.
> 
> ~ Oleksii
> 


