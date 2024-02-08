Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C8584DAE3
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 08:50:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678010.1055014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzAs-00018q-B8; Thu, 08 Feb 2024 07:50:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678010.1055014; Thu, 08 Feb 2024 07:50:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzAs-00015l-8E; Thu, 08 Feb 2024 07:50:22 +0000
Received: by outflank-mailman (input) for mailman id 678010;
 Thu, 08 Feb 2024 07:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXzAr-00015f-Ii
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 07:50:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4f33ad2-c656-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 08:50:20 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4101eb5a115so10501255e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 23:50:20 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g2-20020adff3c2000000b00337d5cd0d8asm3019916wrp.90.2024.02.07.23.50.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 23:50:19 -0800 (PST)
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
X-Inumbo-ID: b4f33ad2-c656-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707378619; x=1707983419; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TB1ao47PA2wE8Mgp6SW7hVzOtec7VfK8GjzF9zx5AOw=;
        b=SZ7S/sLzF8cqcVK1AGmoY+N29O3fmO/NzYUA4yoDTsiaFwiLM6B6u1n2UIiOHcs1hR
         sDivILuX+gUMJslpWuCFvcD3Ek4ZghzjuAacZD31dg4Jv9rrPVXzJIZXFyjhYiWh1i9z
         C0Q/Dj4gpOYU4iVO8D6VmbpaDSJAToNiMxFXiBM/FTlJMvqPb2TIjyslpHO3voIgylKS
         qsJAo3u/Ys3QbjU5XtHEtW3vsFPLUiawKolKtPS5vLKQGsXS0+8psCW20E55c8r0fYB4
         XdONoabVLnrXhzpkV9Nj7S68EuTGmzXfTNcxpRCLJu1/jHakIaqTIwhpnqqO7obAGm80
         OEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707378619; x=1707983419;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TB1ao47PA2wE8Mgp6SW7hVzOtec7VfK8GjzF9zx5AOw=;
        b=jWtKLe4a3fTnjXTff7ukIbepNJDuvMfbkhlUBIb1S4jJnrg9fdmQRXYcj82eqyP5Hv
         PnXE9a0CmXM5UYRfZd+OjcI8uXApa6cMkmokv9FDM/ymbnn6dDSnsOl5RsjNSd/r7YH7
         Q5mHLdczFLbP4StmINSk/QVXdfoUQavKBqr84W2/TtqrMZb7sxPyBFcguI9FBsJmTaEH
         LqE6GEo6s3DoWYNV3Zg+Ajgq7201GM+W43GAWWQMn9lGLs2oqvfeuXlujvSGWJhro867
         uCvKp71hWeBTh/vbMsSKLePIXXPbsNYjqKLS32kO+LsDMUbdvsVZEkOSzBhukTtJGdj1
         S5og==
X-Gm-Message-State: AOJu0YzRvYVP2hDx4PwJx369QztX14HRCAUXmgNoPKfxazIDnDT9BRAB
	lI8C2ZlLE61MJhJQ4lP0Q3fHz6WecOgAsuKODrs8Z/kX8rOyKx3lGTSspY+rhQ==
X-Google-Smtp-Source: AGHT+IEDyz92JcyTX/EXoPXoUl5EKBsdtymyMl5gui+p1sB3stm1hUz6TviPwsZKn6bKLy160985Cw==
X-Received: by 2002:a5d:53d1:0:b0:33b:10de:59a2 with SMTP id a17-20020a5d53d1000000b0033b10de59a2mr4818038wrw.15.1707378619603;
        Wed, 07 Feb 2024 23:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXKWRFWgh5pgmEsONn49zqH2KXbv4Ftk0yKkFEnXOC65Jy+W7IN65aQX55aQP5ZM7RVDYyJD6NJnIZ37pgIfj89PQhmr6Ig9/7OMZEpEzmR4l5Gv1CpodvMffA=
Message-ID: <714d7de9-5a6e-4d30-bd2d-5b84ae24f3dd@suse.com>
Date: Thu, 8 Feb 2024 08:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] block-common: Fix same_vm for no targets
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20240201183024.145424-1-jandryuk@gmail.com>
 <20240201183024.145424-2-jandryuk@gmail.com>
 <cd9e0194-5814-4735-bca4-df2577102c19@perard>
 <a0145f9d-654d-4336-b5bb-69883543b919@suse.com>
 <CAKf6xptDuYr2mT0w39Ezb3gTETYoZBpFUQ1Zqe6Kb9UeRQw7EQ@mail.gmail.com>
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
In-Reply-To: <CAKf6xptDuYr2mT0w39Ezb3gTETYoZBpFUQ1Zqe6Kb9UeRQw7EQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.02.2024 03:25, Jason Andryuk wrote:
> On Wed, Feb 7, 2024 at 7:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 06.02.2024 12:45, Anthony PERARD wrote:
>>> On Thu, Feb 01, 2024 at 01:30:21PM -0500, Jason Andryuk wrote:
>>>> same_vm is broken when the two main domains do not have targets.  otvm
>>>> and targetvm are both missing, which means they get set to -1 and then
>>>> converted to empty strings:
>>>>
>>>> ++10697+ local targetvm=-1
>>>> ++10697+ local otvm=-1
>>>> ++10697+ otvm=
>>>> ++10697+ othervm=/vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4
>>>> ++10697+ targetvm=
>>>> ++10697+ local frontend_uuid=/vm/844dea4e-44f8-4e3e-8145-325132a31ca5
>>>>
>>>> The final comparison returns true since the two empty strings match:
>>>>
>>>> ++10697+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o '' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = '' -o '' = '' ']'
>>>>
>>>> Replace -1 with distinct strings indicating the lack of a value and
>>>> remove the collescing to empty stings.  The strings themselves will no
>>>> longer match, and that is correct.
>>>>
>>>> ++12364+ '[' /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o 'No target' = /vm/cc97bc2f-3a91-43f7-8fbc-4cb92f90b4e4 -o /vm/844dea4e-44f8-4e3e-8145-325132a31ca5 = 'No other target' -o 'No target' = 'No other target' ']'
>>>>
>>>> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>>>
>>> Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
>>
>> I've committed this, but I take the absence of a Fixes: tag as indication
>> that this doesn't want/need backporting.
> 
> Hmmm, maybe this should have a Fixes.  Sorry I didn't investigate that
> better before submission.
> 
> Looks like this would be the commit:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=f3a7ca02400d1c416e97451b4aebfaf608fc8192
> 
> f3a7ca02400d1 ("hotplug/Linux: fix same_vm check in block script")
> 
> I need to circle back on this.  IIRC, when I set up a conflicting
> assignment of a writable disk to two VMs with block-tap, it was
> allowed and not denied.  That is what prompted this change.
> 
> I'll have to double check there isn't something in the regular block
> that might prevent that.

Okay, I'll wait for a result here before deciding whether to queue.

Jan

