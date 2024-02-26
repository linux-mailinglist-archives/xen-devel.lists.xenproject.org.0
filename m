Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A508671FF
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685445.1066176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYa7-00078k-1o; Mon, 26 Feb 2024 10:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685445.1066176; Mon, 26 Feb 2024 10:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYa6-00075v-VN; Mon, 26 Feb 2024 10:51:34 +0000
Received: by outflank-mailman (input) for mailman id 685445;
 Mon, 26 Feb 2024 10:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reYa5-00073t-DV
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:51:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00fdfbe8-d495-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 11:51:32 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3e7f7b3d95so323930766b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:51:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 mb2-20020a170906eb0200b00a4136d1899esm2298073ejb.102.2024.02.26.02.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:51:32 -0800 (PST)
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
X-Inumbo-ID: 00fdfbe8-d495-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708944692; x=1709549492; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jeY+cGEmZnIIAKXDOyKTG+h2GGkHjGO9G7ePqwDf/iw=;
        b=Kbr6AbWZYr1jX1Aaq37EHhzqgGfQSTF//ea65bh4ZzuqqecsZz2n16OyzFFULa+H6w
         1e3BurneHeMb7WmAxN7A/UIaNWf5neSt3IDCS2XxG8CVMqODoA6ljUBJRH4RjX85nv6b
         j16r5bvUS9DP9GzSzm2QB5DpEuHmXnOZbRmecKKTk8ta6ivdWod6MELmZw1EjwkknwYn
         aVq4rvhDi4yRMW9iLo0CH9QDjXrPL1VsttTCu4fBXv4LdmEb+SVHzR+hwhufLmRqehW2
         w/A+Z+gAUHYpZn0VB4n411GdW2JGuBiLSlnMI8+VIp2Y9CKuVwUoXMBizaZtcQrZlv4e
         30/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944692; x=1709549492;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jeY+cGEmZnIIAKXDOyKTG+h2GGkHjGO9G7ePqwDf/iw=;
        b=aUZEG7icRfWFXXgMdqDst+oJv8vo/YF1O95cjzGIrMLdGU5BOy0W4nWS/Xx7jFcILO
         IRyP1yseHYxLFQZnzPXYY9Mq7BZpxyyeuzKWuUU61neurYM9qEwXF2qLmrbZ68ESiFv9
         XxcuMfz5w7H3VuO6MTLiK1DvllLpAcdwCVH7VUwXvy8+opDtZfqiwOOhLhHTlyHTESo/
         dU5/yzHmVVZXee34TMGWikxvEkl1/XXWjtSHt/pc6yuCCqZz0u8BxOEeQ51h18FTdDwE
         o8SMDwtcOuMTZS87eODkW6StyrnsMw17iVEYTIB6aOHkD51Uefw6GASysbL4J4yuAyLy
         3J6w==
X-Forwarded-Encrypted: i=1; AJvYcCVqQEJwIiVpC26bnebn/eHkrHptA/emV5xa0TaPIRB2lbBhVi9CKYM6TUVozMyFFzPTUC09UM5457Y8zps5iJZPsAzgjPeT+F0WRMwh1zU=
X-Gm-Message-State: AOJu0YwYQj4ma7ReHUXDcDADC0Q3PBTby8NrIF0u+m5guhSguKxyQMOs
	gR2pMeaU+YwYD8TQmOaDpglDQbojkPz8XU7Al5g2SsWNkFOPbN1xbOWn/IMpSg==
X-Google-Smtp-Source: AGHT+IERsG3lulKGVYn6CVq3pqUdaCJBcRLfAIhmYvwVCYgUaC6XlWNLQBBr0vsYCWz+a0fDqEziBg==
X-Received: by 2002:a17:906:6d50:b0:a43:4613:3689 with SMTP id a16-20020a1709066d5000b00a4346133689mr1830854ejt.49.1708944692360;
        Mon, 26 Feb 2024 02:51:32 -0800 (PST)
Message-ID: <b8bb4534-b11c-4fa6-a617-0460f494a626@suse.com>
Date: Mon, 26 Feb 2024 11:51:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] xen: cache clearing and invalidation helpers
 refactoring
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cc6bf44701c808645c69bacaf4463295e2cb0fba.1708354388.git.nicola.vetrini@bugseng.com>
 <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
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
In-Reply-To: <4f3b3d52a3ba20b05ecfa068b916b804@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.02.2024 08:58, Nicola Vetrini wrote:
> On 2024-02-19 16:14, Nicola Vetrini wrote:
>> The cache clearing and invalidation helpers in x86 and Arm didn't
>> comply with MISRA C Rule 17.7: "The value returned by a function
>> having non-void return type shall be used". On Arm they
>> were always returning 0, while some in x86 returned -EOPNOTSUPP
>> and in common/grant_table the return value is saved.
>>
>> As a consequence, a common helper arch_grant_cache_flush that returns
>> an integer is introduced, so that each architecture can choose whether 
>> to
>> return an error value on certain conditions, and the helpers have 
>> either
>> been changed to return void (on Arm) or deleted entirely (on x86).
>>
>> Signed-off-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> ---
>> The original refactor idea came from Julien Grall in [1]; I edited that 
>> proposal
>> to fix build errors.
>>
>> I did introduce a cast to void for the call to flush_area_local on x86, 
>> because
>> even before this patch the return value of that function wasn't checked 
>> in all
>> but one use in x86/smp.c, and in this context the helper (perhaps 
>> incidentally)
>> ignored the return value of flush_area_local.
>>
>> [1] 
>> https://lore.kernel.org/xen-devel/09589e8f-77b6-47f7-b5bd-cf485e4b60f1@xen.org/
>> ---
>>  xen/arch/arm/include/asm/page.h     | 33 ++++++++++++++++++-----------
>>  xen/arch/x86/include/asm/flushtlb.h | 23 ++++++++++----------
>>  xen/common/grant_table.c            |  9 +-------
>>  3 files changed, 34 insertions(+), 31 deletions(-)
>>
> 
> I'll put this patch in the backlog at the moment: too many intricacies 
> while trying to untangle xen/flushtlb from xen/mm.h, and there are 
> easier cases that can be done faster. If someone is interested I can 
> post the partial work I've done so far, even though it doesn't
> build on x86.

This
https://lists.xen.org/archives/html/xen-devel/2024-02/msg01513.html
may be of interest to you in the context here.

Jan

