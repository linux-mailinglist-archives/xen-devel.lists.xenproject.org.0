Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 410F2D19EAF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 16:33:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1201954.1517580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgNy-0000r1-KL; Tue, 13 Jan 2026 15:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1201954.1517580; Tue, 13 Jan 2026 15:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfgNy-0000oc-Gr; Tue, 13 Jan 2026 15:32:46 +0000
Received: by outflank-mailman (input) for mailman id 1201954;
 Tue, 13 Jan 2026 15:32:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfgNw-0000hn-TS
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 15:32:44 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19efce51-f095-11f0-9ccf-f158ae23cfc8;
 Tue, 13 Jan 2026 16:32:42 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so4361585e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Jan 2026 07:32:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f69e13bsm416535935e9.7.2026.01.13.07.32.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:32:41 -0800 (PST)
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
X-Inumbo-ID: 19efce51-f095-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768318362; x=1768923162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kQFGthPvhhaDl4fJbDZWvrToOoUtZp50V1V3UduJxAk=;
        b=BtzhzR5lzT+bIGaV1DJ/4z/buorg0RmiuLxafS639+mxoCOcadklP7iVjNgUSZD2EJ
         RAQ0zZPzClDECh7Pofn/rWcHNvIAHMh/lWwGMMW+l1zuZq6smmUv1ROlBeUKPKa08oXO
         VJjzNSrjo0zKHNvizy3aNi1N0/w2qyuyFrJ3kYs0Td7fTJWeVfXNgkcAcu2YITnOLH6b
         NN2SwABbuhOAcrPIRUXw+EYl7vSLRqUy6vKmU9HZAVSS7eB2FL514EImuUIv/9DPIclx
         Blv3+e8CsNdWB8sBzNxDxr5QUJ5w99SV2KHzYpIAgYIQiMEQ7OxfqxS+vhXMP9jy9yLu
         2HLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768318362; x=1768923162;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQFGthPvhhaDl4fJbDZWvrToOoUtZp50V1V3UduJxAk=;
        b=sKpJXm54vQvtjcTrs3BGdZuwh2BEzKpEvTe6LrGxSQtbXnoxGs1VpqgDC3UZt76Tez
         5RyCvEqxsjK8oG4+nyRENnIbWq+rNFgGEc0hYx9ZQUF6KtH6ED0SSXq1j3On4C5YgHld
         JD2buFn0MJO7pnWw/wv2mbUuWnAEh2uqO4vDdBzvmCwiXp1RHWcAXaElKW4FfK+d1qrm
         foy9rx9tC2lp0GV7JeiwIV0hAdcoT1Po2qQGqBQ9H623VhVd//SFdN+f8JNWJ0WMN0BT
         VZ4Le+iMJrb5kHWocgvsspSzP9ZAxhM7Tw3uX69WNxUFipl0BW5E8xeGvsNETMCK7ZIH
         2Bng==
X-Forwarded-Encrypted: i=1; AJvYcCXPVNh8NYg4oUto4cxyGV5AxNCgXXADmBXE7PVr0md6cB2YenHPHoSBzjvOlbizMP/QYuj5WsrfI7Y=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSIngXj41as/FCF/8Ngza7QzzEYOf7iRZmaT98jEDy2WbMjIk7
	3chNM0rdk3ilqcvDG9GVnLn6fb6+ecziusuSC2ZaW0X7DjC8q/HAjTkVv+Zy2M90+w==
X-Gm-Gg: AY/fxX5s9kh2qZ3SbdftY9R9IA6ehqcgt/FrRbz3Rm1w/MuT7LVb/a4GT0XT+Buf9TE
	TT4hqhx71diY2QDABnbBeFCo4h4preH7erh3m0q2kynI9JXPTff/alCcOLw5adVtQJoTh9BFyrf
	uD14/FTgceL1iu5JpztqsdAoQosGwI+Z+jco14okHKFH/qO+5jlTISwk3vYZRWLpnA5S9HOeQav
	adu6WlayB4gciTUhw5hsn4DcIB2vlCbY7jCE6HQOqI/5XfxwQXgmazltnIFM59HXx4WfBVrC3t1
	t9BjjJaUjfnda9bG6wB9JChxxcNE68N1lRqr6T1anZ48++lnJqUhkxZT8DxU3Ik8PK/2t7sEOWe
	LQ7cVyl3MlyTJoF5AImAtXfq0BVXJgdJ3DVD/JONZLy1RGZSBl0aQz7DvbgF1/jI0mxIQQHibHV
	RmkqDWTMkOJiu6jb8sd/S9Pnt2sJQKi+ZEJ7FuvDnN9ev8BOlQmm6fqwBjrkAIW5u8DRxdMdMmj
	F58dknTo5bnWA==
X-Google-Smtp-Source: AGHT+IHrKqLwh88xf5/yJLZX5jajlv91B5ENLDzhzlxtdKbdfkB9MLU2GJIO6eOfCmTWbScfs76iZA==
X-Received: by 2002:a05:600c:1d14:b0:477:97c7:9be7 with SMTP id 5b1f17b1804b1-47d84b0a7bdmr239498635e9.1.1768318361921;
        Tue, 13 Jan 2026 07:32:41 -0800 (PST)
Message-ID: <cd4f0d9e-08bc-4948-8e6f-59d2475ffd3c@suse.com>
Date: Tue, 13 Jan 2026 16:32:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] earlycpio: lib-ify earlycpio.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 xen-devel@lists.xenproject.org
References: <20260113122109.62399-1-alejandro.garciavallejo@amd.com>
 <20260113122109.62399-4-alejandro.garciavallejo@amd.com>
 <b28be78e-2d26-4d9d-8288-7130a64deb5d@citrix.com>
 <DFNJUME4L1XB.3AUTF02P2QZ9T@amd.com>
 <e0c53bc2-f441-450c-bbd6-b070db25a504@citrix.com>
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
In-Reply-To: <e0c53bc2-f441-450c-bbd6-b070db25a504@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.01.2026 16:19, Andrew Cooper wrote:
> On 13/01/2026 3:00 pm, Alejandro Vallejo wrote:
>> On Tue Jan 13, 2026 at 3:24 PM CET, Andrew Cooper wrote:
>>> On 13/01/2026 12:21 pm, Alejandro Vallejo wrote:
>>>> It's only used for microcode loading on x86. By lib-ifying it we can make
>>>> it go away automatically when microcode loading becomes an optional
>>>> feature in follow-up patches.
>>>>
>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>> ---
>>>> v3:
>>>>   * New patch. Subsumes earlier conditionalisation of earlycpio.c on
>>>>     CONFIG_MICROCODE_LOADING.
>>>> ---
>>>>  docs/misra/exclude-list.json    | 8 ++++----
>>>>  xen/common/Makefile             | 2 +-
>>>>  xen/lib/Makefile                | 1 +
>>>>  xen/{common => lib}/earlycpio.c | 0
>>>>  4 files changed, 6 insertions(+), 5 deletions(-)
>>>>  rename xen/{common => lib}/earlycpio.c (100%)
>>>>
>>>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
>>>> index 388397dd3b..2b874dfd3b 100644
>>>> --- a/docs/misra/exclude-list.json
>>>> +++ b/docs/misra/exclude-list.json
>>>> @@ -121,10 +121,6 @@
>>>>              "rel_path": "common/bunzip2.c",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>>          },
>>>> -        {
>>>> -            "rel_path": "common/earlycpio.c",
>>>> -            "comment": "Imported from Linux, ignore for now"
>>>> -        },
>>>>          {
>>>>              "rel_path": "common/gzip/*",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>> @@ -225,6 +221,10 @@
>>>>              "rel_path": "include/xen/decompress.h",
>>>>              "comment": "Imported from Linux, ignore for now"
>>>>          },
>>>> +        {
>>>> +            "rel_path": "lib/earlycpio.c",
>>>> +            "comment": "Imported from Linux, ignore for now"
>>>> +        },
>>>>          {
>>>>              "rel_path": "lib/find-next-bit.c",
>>>>              "comment": "Imported from Linux, ignore for now"
>>> Honestly, I think this needs simply dropping.  "ignore for now" isn't
>>> going to cut it with any competent evaluators.
>> That would depend on justifications and such. But regardless clearing the
>> exclusion list is a different matter aside from removing microcode loading.
>>
>>> By libryfing it, it's no longer part of the AMD target build, but it
>>> does want covering by *-allcode.
>>>
>>> Given that you noticed it for v2, I presume there's something in the
>>> file that Eclair doesn't like?
>> I didn't run Eclair on it. It's ignored as part of common, and the build
>> fails in CI if the file in common is absent. That's how I noticed it.
>>
>> I'd rather not gate this particular change on earlycpio playing ball with
>> Eclair.
> 
> I'm explicitly not gating it.  *-allcode is non-blocking, but I want
> earlycpio being scanned.

In fairness to Alejandro - you're asking for an entirely unrelated change.
If it was really just ...

> Simply omitting the second hunk should do this, and not explode the AMD
> target build.  (Once this patch is reordered to the end of the series.)

... this, then probably okay(ish). But afaict MICROCODE_LOADING needs to
then be turned off for *-amd, which patch 4 doesn't do (yet) afaics.

Jan

