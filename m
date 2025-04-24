Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C53A9A09E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 07:48:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.965799.1356215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pRK-0006PA-0g; Thu, 24 Apr 2025 05:48:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 965799.1356215; Thu, 24 Apr 2025 05:48:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7pRJ-0006Nn-UD; Thu, 24 Apr 2025 05:48:01 +0000
Received: by outflank-mailman (input) for mailman id 965799;
 Thu, 24 Apr 2025 05:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IaUl=XK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u7pRH-0006NZ-JO
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 05:47:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa9cd4b8-20cf-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 07:47:54 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso5470265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Apr 2025 22:47:54 -0700 (PDT)
Received: from ?IPV6:2003:ca:b734:b408:9d23:e5d:de25:e110?
 (p200300cab734b4089d230e5dde25e110.dip0.t-ipconnect.de.
 [2003:ca:b734:b408:9d23:e5d:de25:e110])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4409d2a2e43sm6397755e9.10.2025.04.23.22.47.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Apr 2025 22:47:53 -0700 (PDT)
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
X-Inumbo-ID: aa9cd4b8-20cf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745473674; x=1746078474; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MWw0jIbaX++oyedOfJGt/DHHL+/zPCP8Pz46b3GcsO0=;
        b=CkD0hB3JDXmjccTe8Hhcqp7h+R7xmqcunL5Ks03Eyc1IDy9/28iR5lUkm5bHPQOo//
         5howIKVl6YuiQAJMuRrHU+BUBJEaaGoF0SwYVOZ2gFjYPFfjFScXZeeccH+3fZ2W9xSu
         mK10xbusxsLPwWMWe24nE++p5pwoz6Cw7W8PS7w5tbk4hYQKCU0NCFlBXecC8MnsI7aV
         o7r/vVkh+wcN/jXtFPcz3OjnFonwHjsrZvVwKyW9XqEhT1qJw1dK+gKuLQvQ2HEHHUTX
         jE67Sc5iNu8zpj9D12S+dMZGGCJjjeNoDQnNgNjTz00Gj9MiaU5+xuVZfSL0DGieqYsw
         WMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745473674; x=1746078474;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWw0jIbaX++oyedOfJGt/DHHL+/zPCP8Pz46b3GcsO0=;
        b=mii64J7QiMZpixTuNRr2Bhzv7yUvhGUtMRZRRLgnrZ2/x1cE2qGxhIKSShzltqUxrt
         I2x3dadr3ODxyocFGg9UjDUEBkAvCXNjZhq5yohgcJIz1ugEue0XjrYzb38tQCOeimez
         tJSn7Qda90taxzS+P+J6EzWKdmhT3/wV35ugLzRsbuj3voFYhJsAHZJjiIK5CSdjrw8V
         3zjgCMQro2RpDxkNd0zsBFvBQkY6NJxADxxCupud03yXm1mAcHw/UJsBzhwibs2DrlqY
         8Ntud5O4f4tToEEwaG4rU8X0WR+OrPzaWVUMjyp4UA9CgDjMqBYNHSuGo/7mcYRV8T/a
         Fbag==
X-Forwarded-Encrypted: i=1; AJvYcCXzFStH2cOM1ronIrgnFHUJiksMFF/VKsKNe5oNJmF6I04LUoxPe1QsFcz2eArXji3+7/GA57XUyGI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnCIMiEQjTpn/M5zBVkLDtdWGcOT5oDzeegwID06X2e9up/MgD
	/07Bhtb31VmtQURv5aT7YKhcoCygjMGWYXIc+8DHcuazoWNf+ek6Nd/tm5JmUg==
X-Gm-Gg: ASbGnctwGzDWjklHOJgEGVtOWotoHx1Whov+otid44nM96b0i160D1O+8yEaRbPxSrx
	79K83B3jaGoa12LJvrAaeWwEjGt401uK8k3ExMVJcN0M980BF6ji0CxI4QwipSVu447NjZy/CEo
	lxtMrW6vFqfhA/bw55E6oDVHVKWhneGzlcETGnbNaNJ3jfU/w4Hh6UkSSsTB0Q0MnfrS6E7Ncll
	AseM7N8aZPyWyIBrkddASa1xxShrB0LAhVOh3qKkK6SnKUXyZzLeGxRUMAY7lNXdPfABVbAGRAd
	siCrA34tWHYmNoHC8M874V4nIAIzhFfwFMBTRyEzXcf2MRXjIZzyBjNdvlwxgVhrZYmYWgvdC0C
	ofqro9vHN4tUT0PoICle2mT5IyiGNFr4vuv14flXHa36vtNKrSVvXmd8J9XwO7UZm0VEbLPCs
X-Google-Smtp-Source: AGHT+IH+Bx0WGCxVe9Iu9eoc6DrCj7Mw2uEwY68zMOaNCowO4J/N7qhNb7qWtJL9j0VdgOWGMrRXjQ==
X-Received: by 2002:a05:600c:4e0a:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-4409bd20a55mr10741525e9.15.1745473673571;
        Wed, 23 Apr 2025 22:47:53 -0700 (PDT)
Message-ID: <6c9c731d-2697-46c7-9ac6-4eb68d59d0ad@suse.com>
Date: Thu, 24 Apr 2025 07:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] misra: add deviation for rules 21.1 and 21.2
To: Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: victorm.lira@amd.com, Federico Serafini <federico.serafini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <790f9cae9a75b9f29554943c08abb6537647644e.1745364478.git.victorm.lira@amd.com>
 <20989ef0-a906-4ad2-818b-e52dd49b868d@suse.com>
 <alpine.DEB.2.22.394.2504231337240.785180@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2504231337240.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2025 22:37, Stefano Stabellini wrote:
> On Wed, 23 Apr 2025, Jan Beulich wrote:
>> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
>>> From: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>
>>> MISRA C Rules 21.1 ("#define and #undef shall not be used on a
>>> reserved identifier or reserved macro name") and R21.2 ("A reserved
>>> identifier or reserved macro name shall not be declared") violations
>>> are not problematic for Xen, as it does not use the C or POSIX
>>> libraries.
>>
>> In the course of all the Misra discussions it was pointed out more than
>> once that it's not just the titles which matter, but also the
>> "Amplification" text. While the latter two of the three bullet points
>> applying to both rules clearly are library-centric, the first one isn't.
>> In that light it's entirely unclear to me how ...
>>
>>> Xen uses -fno-builtin and -nostdinc to ensure this, but there are still
>>> __builtin_* functions from the compiler that are available so
>>> a deviation is formulated for all identifiers not starting with
>>> "__builtin_".
>>>
>>> The missing text of a deviation for Rule 21.2 is added to
>>> docs/misra/deviations.rst.
>>>
>>> To avoid regressions, tag both rules as clean and add them to the
>>> monitored set.
>>
>> ... our code base could be anywhere near clean towards these two rules.
> 
> 
> Given the section these two rules belong to "Standard libraries" and
> given the rest of the rule description, it is clear to me that the
> conflicts and undefined behaviors the two rules are trying to prevent
> are conflicts with C or POSIX libraries. Nicola is the original author
> of the patch and he has more experience with MISRA and I would trust
> his interpretation.

Then is there _another_ rule dealing with the remaining reserved
identifier space?

Jan

