Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E18A8365E2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 15:54:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669975.1042545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRvgh-0007tN-QS; Mon, 22 Jan 2024 14:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669975.1042545; Mon, 22 Jan 2024 14:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRvgh-0007rF-Ni; Mon, 22 Jan 2024 14:54:11 +0000
Received: by outflank-mailman (input) for mailman id 669975;
 Mon, 22 Jan 2024 14:54:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRvgg-0007r9-Dd
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 14:54:10 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19117a95-b936-11ee-98f2-6d05b1d4d9a1;
 Mon, 22 Jan 2024 15:54:09 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cf0390eddbso4618691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 06:54:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u18-20020a05660229b200b007befaf58e52sm6009200ios.30.2024.01.22.06.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 06:54:08 -0800 (PST)
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
X-Inumbo-ID: 19117a95-b936-11ee-98f2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705935249; x=1706540049; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCx2BfQMNWldXqJA6nt3SgZllYluj7qhSEaZ59J/LV8=;
        b=ENKfKizJh2r8C3/+e0A6S/sG4UnlgHKTpNj5NvDtGZpL/1L4+jqa10fWHX6Wf/0dbR
         k26KdT1ggdbywEOieunqLXvsSY8epoxrlIQTx45XLKiLgu8bfkxwmjguE2jbCuFdbEz/
         7pO0BXQn5u5ZdoBRQlztUSP6XVWFInwvm1Zn0wugJGiq0d1C/P/3fLGmFPilau5rhOpI
         q3x58eS+Zldfp6xjMAK1lrxpq2/qF4lpB40HyU20t18zKS5zmHN8aLGetEW0j7Ce6w2V
         IBkgH8MMRHOx4MrJeKt6F/47B5v4xS5sbPA8tKMyrBw80ZF61fTfqBFrmOMkqugUdqLr
         hMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705935249; x=1706540049;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aCx2BfQMNWldXqJA6nt3SgZllYluj7qhSEaZ59J/LV8=;
        b=V4UYa7Oobk+X6fkUE0raGBmjfh6lb7k4bTuTkZhz8qcaCVJS4KhEH8E7jlC6COXOVe
         ZPk+YptLNGjQWkclBt/YCDa57V4ZOh4p0IvX5gIvo6MJ6MCmKymuH4U+XruHe/Lehtia
         TKqodsLtoFkta9D0pGrx9qpCB5c8mIqubVrGOvJEuCuwzP2lMvmT48nb8wHJ+D2YnXyk
         GI16cqilbiN8r1nihgp9kIPpwfOrSOOF1MdElo0WMnJEFfcyky5dhIk52OctrKQIXSou
         eEE5XJHqlDCMaCWPl6YS1G01PWePaNO4ygj4FlymFEduJO38+41yyrD5UMO8Xoaz9mj5
         wDUA==
X-Gm-Message-State: AOJu0Yz2akVZpDPbuatIH3g4ocT5GS/0dQwfmWAs+lmoxUf1USWNdXjf
	lMdRep9aoRI0Kg1NJtnQnQKp4R6CBFTt953l7AqFIUwY9cltUzkj9v+LvPCcFg==
X-Google-Smtp-Source: AGHT+IF/d6HtjZHe2Ghe6I3vk2DkWR3TmRyK5owNmRnQZA8u2rTWBpnyHo7JTJlC6C6jnyNa8M6pmA==
X-Received: by 2002:a05:651c:1a11:b0:2cc:6ca3:2476 with SMTP id by17-20020a05651c1a1100b002cc6ca32476mr2579297ljb.67.1705935249142;
        Mon, 22 Jan 2024 06:54:09 -0800 (PST)
Message-ID: <0a1dd860-1005-4b39-9e7f-1a15156bb6a8@suse.com>
Date: Mon, 22 Jan 2024 15:54:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] lib{fdt,elf}: move lib{fdt,elf}-temp.o and their deps
 to $(targets)
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20240122113955.45594-1-michal.orzel@amd.com>
 <30468fd2-df76-4d62-b5f5-ff25568c09a8@perard>
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
In-Reply-To: <30468fd2-df76-4d62-b5f5-ff25568c09a8@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.01.2024 15:46, Anthony PERARD wrote:
> On Mon, Jan 22, 2024 at 12:39:55PM +0100, Michal Orzel wrote:
>> At the moment, trying to run xencov read/reset (calling SYSCTL_coverage_op
>> under the hood) results in a crash. This is due to a profiler trying to
>> access data in the .init.* sections (libfdt for Arm and libelf for x86)
>> that are stripped after boot. Normally, the build system compiles any
>> *.init.o file without COV_FLAGS. However, these two libraries are
>> handled differently as sections will be renamed to init after linking.
>>
>> To override COV_FLAGS to empty for these libraries, lib{fdt,elf}.o were
>> added to nocov-y. This worked until e321576f4047 ("xen/build: start using
>> if_changed") that added lib{fdt,elf}-temp.o and their deps to extra-y.
>> This way, even though these objects appear as prerequisites of
>> lib{fdt,elf}.o and the settings should propagate to them, make can also
>> build them as a prerequisite of __build, in which case COV_FLAGS would
>> still have the unwanted flags. Fix it by switching to $(targets) instead.
>>
>> Also, for libfdt, append libfdt.o to nocov-y only if CONFIG_OVERLAY_DTB
>> is not set. Otherwise, there is no section renaming and we should be able
>> to run the coverage.
>>
>> Fixes: e321576f4047 ("xen/build: start using if_changed")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



