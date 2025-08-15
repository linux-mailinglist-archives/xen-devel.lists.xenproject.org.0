Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CBCB27AA4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:12:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082900.1442589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpXb-0008O8-GY; Fri, 15 Aug 2025 08:11:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082900.1442589; Fri, 15 Aug 2025 08:11:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpXb-0008Lp-DW; Fri, 15 Aug 2025 08:11:59 +0000
Received: by outflank-mailman (input) for mailman id 1082900;
 Fri, 15 Aug 2025 08:11:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umpXZ-0008Lj-MQ
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:11:57 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 823d4522-79af-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 10:11:56 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b7c72so2277910a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:11:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b01ae6b1sm904242a12.33.2025.08.15.01.11.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:11:55 -0700 (PDT)
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
X-Inumbo-ID: 823d4522-79af-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755245516; x=1755850316; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/7wJAb18ZbFup88taCz0Ci3UqtvdykWsRuNCo8SXl0U=;
        b=XYqH1p+PAA9g89zmGNtYmv30sGoigsBgFZiPcz/3M7B+ePuQBJB9K9KLEXlmm4RwlP
         4jTC2RN0Chd4bHWZ68pwzeS4Tbg8cAee81BoeSHWStbs1/p+08scFjtotu/D/5ivqkS4
         1hitTac4AJ/Pq50aOg8RSa3RPNvE5tx+VGwiRRjcFRw6q98FBw6ebkzTEBqL+zQKKyti
         ask01pnVvJy1QPHFU4H6FQH6ejFu4KI4Pr1v9FUU/RB8XFWN+1OCBhnC9N6sifC7IMbo
         02vUotLo249dDPdpGWWNSFSaBVJ9NxxH+CKARCKALlMU8i+F99o8clLsOTXmZh/vWng/
         gbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755245516; x=1755850316;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/7wJAb18ZbFup88taCz0Ci3UqtvdykWsRuNCo8SXl0U=;
        b=hwGvoOE8xif3U6EBdPGpOS/5hw/2Mk38CwgN9OSUE5kMIboGZeGoCKAfvla5+6UhSN
         yO4laMic1Zym/uTsH3qekUs+u6hE7nZIcRmbZkXFxSXd3yztq3mjXgk/pJavuYPlEK6j
         7n6FcdobQMnhsoHLvOE1N46DFu6ZlSELYMbpqGKfoU8ZEHvEQOmPWfnnfDPKlg/RUzes
         Xq6rF9e7DhV1GNq5OntsOMnTouwifhYGU5YQlssC4qngBG2nh8+Q53SFY92JSrM9IpAJ
         lVBOss0kKhbG9EdapV0/zdRZbKhrulaMYbyAPz0cMajHEhsJF1mMI0ULZOxeraiP4p+w
         QRmg==
X-Forwarded-Encrypted: i=1; AJvYcCXYXJWuchIq7Qe1DSbEqp6Z+bE8jVPGUxUWoqLdiXL7I1hGlUrelE1W/l24YwrvWyasycRtEPoVqwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDIpZCXfI595o8qoRttdl8ZdNo7qaOB8PdACjnSXPZ4T2ZgiJ5
	InPAfLh85u7qGny1qqnLHalK1kNhTD67Zdoy6bcy0PUDQN47ZUOompVma7jbNCvjWg==
X-Gm-Gg: ASbGnctY0odlAxFhizu52b88gWmzdo0Is4j9/ESCA96Fthuv8LssEFAbAApgHDBIOaM
	Q0dOAWXlZWuCIiQivYOR2/gdP2+qauTX3PBJgCXfKpUXwbH+edK8PW2SnCCgkVpUey2EDoqYyDY
	duvuSAMDpd10kQKHBjAK+Fjkx7UFmR8052bn6U/LcUnDPhqIyd2uQ92wDpnKmL4JDHZO2ucI4fr
	58J2YxujkNgQwMIN/GRIhJguaByk8a8wtruFSdUB/fVSHUtFwnoSlOeLQgBvaE/VwoYiUr44BqN
	o+S6lwORvUWEVmcd/sSm4jwDGzIjqjlzsQUYTg5qvt1qj7LjOlmQsYtZb1HbFKal5P7UkTgcnFq
	j6podKoi81vBkW3+H0W6V+1qOOefDH74fCoG0XjI3oPbaKyG4Mj53dAzp/4+hVPe02uS4sD5Wgy
	M/5C6yVNk=
X-Google-Smtp-Source: AGHT+IGja/EAN4ScOvYCZ8G+MGMP3/VwHe7ivnMWIm3sFW6swkHtx/mORnC6NPLN+IPJHqajRMz05A==
X-Received: by 2002:a05:6402:348e:b0:618:6afb:8cb2 with SMTP id 4fb4d7f45d1cf-618b05041f5mr871397a12.5.1755245515594;
        Fri, 15 Aug 2025 01:11:55 -0700 (PDT)
Message-ID: <de30aca2-1840-473b-8995-fd58f2447c44@suse.com>
Date: Fri, 15 Aug 2025 10:11:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of PV_SHIM_EXCLUSIVE
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "Penny, Zheng" <penny.zheng@amd.com>, "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
 <20250803094738.3625269-2-Penny.Zheng@amd.com>
 <371bc812-acdb-41ef-950b-3c9e5feea48e@suse.com>
 <DM4PR12MB84510F1F89641B672916C055E122A@DM4PR12MB8451.namprd12.prod.outlook.com>
 <3e20688c-c125-4aa4-bc06-1fe634550f70@suse.com>
 <alpine.DEB.2.22.394.2508141604510.10166@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2508141604510.10166@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 01:14, Stefano Stabellini wrote:
> On Tue, 5 Aug 2025, Jan Beulich wrote:
>> On 05.08.2025 05:38, Penny, Zheng wrote:
>>> [Public]
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Monday, August 4, 2025 3:43 PM
>>>> To: Penny, Zheng <penny.zheng@amd.com>
>>>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>>>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>>>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>>>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>>>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH v1 01/25] xen/x86: move domctl.o out of
>>>> PV_SHIM_EXCLUSIVE
>>>>
>>>> On 03.08.2025 11:47, Penny Zheng wrote:
>>>>> In order to fix CI error of a randconfig picking both
>>>>> PV_SHIM_EXCLUSIVE=y and HVM=y results in hvm.c being built, but
>>>>> domctl.c not being built, which leaves a few functions, like
>>>>> domctl_lock_acquire/release() undefined, causing linking to fail.
>>>>> To fix that, we intend to move domctl.o out of the PV_SHIM_EXCLUSIVE
>>>>> Makefile /hypercall-defs section, with this adjustment, we also need
>>>>> to release redundant vnuma_destroy() stub definition and paging_domctl
>>>>> hypercall-defs from PV_SHIM_EXCLUSIVE guardian, to not break
>>>>> compilation Above change will leave dead code in the shim binary
>>>>> temporarily and will be fixed with the introduction of CONFIG_DOMCTL.
>>>>>
>>>>> Fixes: 568f806cba4c ("xen/x86: remove "depends on
>>>>> !PV_SHIM_EXCLUSIVE"")
>>>>> Reported-by: Jan Beulich <jbeulich@suse.com>
>>>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>>>> ---
>>>>> v1 -> v2:
>>>>> - remove paging_domctl hypercall-defs
>>>>
>>>> And you've run this through a full round of testing this time, in isolation?
>>>
>>> This commit shall be committed together with "xen/x86: complement PG_log_dirty wrapping", (I've added in change log, idk why it didn't get delivered in the mail list in the last).
>>
>> And "committed together" still means the two at least build okay independently
>> (i.e. allowing the build-each-commit job to succeed)?
>>
>> As to the missing indication thereof in the submission: Patch 01 has a revlog,
>> so if anything was missing there you must have added it some other way. But
>> the cover letter is lacking that information as well. (As indicated earlier,
>> to increase the chance of such a remark actually being noticed, it's best put
>> in both places.)
>>
>>> As PG_log_dirty is disabled on PV mode, paging_domctl() will still have "undefined reference" on PV mode, which gets fixed in "xen/x86: complement PG_log_dirty wrapping".  I thought it better sits there.
>>> If it doesn't comply with the commit policy, I'll move according fix here.
>>
>> Let me post a pair of patches dealing with part of the problem, in an imo
>> (longer term) more desirable way.
> 
> With this patch https://marc.info/?l=xen-devel&m=175438069103017
> committed, can we go ahead with this patch, to resolve the outstanding
> build problem?

It first needs re-basing, I expect. There were also other anomalies, like a
requirement to commit together with another patch.

Jan

