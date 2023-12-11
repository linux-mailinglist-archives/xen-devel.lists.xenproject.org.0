Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CA080D067
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 17:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652353.1018148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCikB-00070K-D3; Mon, 11 Dec 2023 16:02:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652353.1018148; Mon, 11 Dec 2023 16:02:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCikB-0006wz-9x; Mon, 11 Dec 2023 16:02:55 +0000
Received: by outflank-mailman (input) for mailman id 652353;
 Mon, 11 Dec 2023 16:02:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mRXB=HW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rCik9-0006vi-8Z
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 16:02:53 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bcec91b8-983e-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 17:02:52 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40c31f18274so40158425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Dec 2023 08:02:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020a056000100400b00333371c7382sm8934252wrx.72.2023.12.11.08.02.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 08:02:42 -0800 (PST)
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
X-Inumbo-ID: bcec91b8-983e-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702310571; x=1702915371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sADWaq4Kq/hlWmdy40m+bAJQhoBVflD3ap33s/h2wOg=;
        b=g3pCNGBZueZPUAXfkKcSNIaoMemI22N3RDQnVeZ/r0WPep1MDgtFhBNvddtInfQN+M
         0NIPdZJWpv0ltLgqQ7ReBWTvuUhzIuqTlADRH05kFJyVGIa9GfyyyMv8jB3douIr/IRM
         MAh49OZLUgZ92yTrhAyX6BoJg4iCv3zaH1zrZ1AzAWSVB4VfzNFZvETOcFncpW44BGk0
         TveWZKjovtgZuQuIN3riWB9ERxg33vDmNR7rQtwh9OQ2q2UhDIVEBLy91un2HtJEujmi
         0fhnLmJOAt/vRoPNi+fEtN+DV/lIJp660Oki2rh1McXWldwYae/mZCtRdt0aKlKjhSlz
         O9yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310571; x=1702915371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sADWaq4Kq/hlWmdy40m+bAJQhoBVflD3ap33s/h2wOg=;
        b=sVv2pX0C5ERd/+rm1jejkTUmqMbrGWHHwRTdZzo8uCknSbcxs2WFuEJPOri2lCGEGb
         GC4tj6Ux0pzmJl0pxB6rNAPDaYjhTl8QAGMs9Fdaf9/82IhCIkTwnnISrPHHLGK/GfU/
         gC1ZQ0ZfWlO2rbfHgMfV84CW3JOSwtEniRwElpsQbiGMDbqh+vxHeh9tkUfRPj8WVXqh
         5q/48Dif3noLnv8tXuhowCPzzcK5EiMWBXQMg4waiDRPhJGJdD/T1+9MT6Qp3aNmMeD5
         ac4aYM6/POl0ps8atmdar9q4QLSZQb2gE5QzaE0aMpuOg2P7h2tlUueC7yB2aKnJtMv9
         AYqg==
X-Gm-Message-State: AOJu0YxEmCX01V9UQgAIU8XAesj0wXVO17f/cS+W3akxD0j8Q/0tmaU5
	ttSPItnb+O8RQquNpzECj0ho
X-Google-Smtp-Source: AGHT+IHGDg2bRqGCCU01HVZRdm4jsWRAi0xa9a1TntRoNxtoX9cjhTByGVEWGZxEmeO7ChiSpgNnnQ==
X-Received: by 2002:a05:600c:3108:b0:40c:426b:fd2b with SMTP id g8-20020a05600c310800b0040c426bfd2bmr1287032wmo.153.1702310571555;
        Mon, 11 Dec 2023 08:02:51 -0800 (PST)
Message-ID: <ed29735f-2d2e-4b29-b5d1-efa78480acd6@suse.com>
Date: Mon, 11 Dec 2023 17:02:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] xen: ifdef inclusion of <asm/grant_table.h> in
 <xen/grant_table.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1701453087.git.oleksii.kurochko@gmail.com>
 <cdc20255540a66ba0b6946ac6d48c11029cd3385.1701453087.git.oleksii.kurochko@gmail.com>
 <050a57f5-7c04-4b4a-848d-fd2f0993a9a7@suse.com>
 <74222b30ec0ab589b18f97032bc8074023c89e2b.camel@gmail.com>
 <18660670-fd9d-4269-b00a-dd4258339a43@suse.com>
 <5af2573e588f76b8df3423fd13a1b4275cc18f33.camel@gmail.com>
 <abb8c26b-4c8c-4fcf-a8c8-4a15a5067fa0@suse.com>
 <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
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
In-Reply-To: <a53707edfac7d8d959cfc858953a1d64c3149596.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 15:43, Oleksii wrote:
> On Mon, 2023-12-04 at 11:39 +0100, Jan Beulich wrote:
>> On 04.12.2023 11:34, Oleksii wrote:
>>> If you ( or anyone else ) don't mind, I'll update the patch with an
>>> introduction of HAS_GRANT_TABLE.
>>
>> I won't NAK such a patch, but unless convincing arguments appear I
>> also
>> won't ACK it.
> I am going to disable GRANT_TABLE config for RISC-V ( and PPC? ) by
> providing a separate YAML file ( riscv-fixed-randconfig.yaml ) with the
> following content:
> .riscv-fixed-randconfig:
>   variables:
>     EXTRA_FIXED_RANDCONFIG:
>       CONFIG_COVERAGE=n
>       CONFIG_GRANT_TABLE=n
>       CONFIG_MEM_ACCESS=n # this I'll add in the next patch where asm-
> geneic for mem_access.h is introduced
> 
> And then for riscv*randconfig jobs do the following:
> archlinux-current-gcc-riscv64-randconfig:
>   extends:
>     - .gcc-riscv64-cross-build
>   variables:
>     CONTAINER: archlinux:current-riscv64
>     KBUILD_DEFCONFIG: tiny64_defconfig
>     RANDCONFIG: y
>     EXTRA_FIXED_RANDCONFIG: !reference [.riscv-fixed-randconfig,
> variables, EXTRA_FIXED_RANDCONFIG]
> 
> For RISC-V, I prefer having a separate file for all the
> EXTRA_FIXED_RANDCONFIG because in another patch series [1], I'll
> introduce a large number of disabled configs for randconfig.
> 
> For PPC, I don't think it's necessary to introduce a separate YAML file
> for EXTRA_FIXED_RANDCONFIG. For the time being, it is only necessary to
> disable two configs: CONFIG_GRANT_TABLE and CONFIG_MEM_ACCESS (in the
> next patch of this series).

Why would this be different for PPC and RISC-V?

> If this solution is acceptable to you, can I retain your 'Suggested-
> by'?"

No, please don't. I've replied to Andrew on the other thread - I don't
see why helping just gitlab-CI is desirable. I'm actually surprised
Linux have no solution ready for use, as the underlying problem of not
all settings necessarily being valid to use ought to affect them as
well. Then again perhaps this really only is a transient issue during
arch bringup ... In which case the approach taken here may be fine, but
it still wouldn't be what I suggested. It may then be Stefano or Andrew
who you could consider for such a tag.

Jan

