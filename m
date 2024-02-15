Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8AEB855F5D
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 11:35:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681575.1060416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ53-0004cg-Ng; Thu, 15 Feb 2024 10:35:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681575.1060416; Thu, 15 Feb 2024 10:35:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZ53-0004b0-Ki; Thu, 15 Feb 2024 10:35:01 +0000
Received: by outflank-mailman (input) for mailman id 681575;
 Thu, 15 Feb 2024 10:35:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4dJ3=JY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1raZ53-0004Za-10
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 10:35:01 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id def2eeb9-cbed-11ee-8a4d-1f161083a0e0;
 Thu, 15 Feb 2024 11:35:00 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d09bdddfc9so8612081fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Feb 2024 02:35:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f22-20020a7bcd16000000b00411d1ce4f9dsm4644475wmj.34.2024.02.15.02.34.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 02:34:59 -0800 (PST)
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
X-Inumbo-ID: def2eeb9-cbed-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707993300; x=1708598100; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wKsi8CBTAI9tRK9RHuD9QGScWsRlkRXV09da/jZ+0Ho=;
        b=WpOOLWiTwjJgWQyEXwaXj5mSjXaCJICFQ8C5qOZZqr6RvfX2dCFWoF6Qsp9Hl36bDj
         xkuKGcQCn4SA3rQJHhCH/AUk59TWYbi4NwzF18TdjS7jkvtzR5AT06UAljK/3mo/glqz
         jaL0VJHpaNpmKn695x0cfI9hrEF4O3AM57Kz//zHVNyw127T5EVr2kY+V1wsInaH8CiR
         t//TksEkJ4iY2eUhCsx4geFeBnjFhE8YTBEnPYE3xGvJANs3cDNwa0BjWLwYqC5b1PHA
         SQ99BIHxEvtbKS+N2iDUDS3vup2107ULId/k4zZM/QZTKWP3FRJHv4flXlGe3CwKAvIq
         9OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707993300; x=1708598100;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wKsi8CBTAI9tRK9RHuD9QGScWsRlkRXV09da/jZ+0Ho=;
        b=Qb4CMCEQhlNPrwy9k+iCMY3Oxb4TGp1wYMqunjTe9JKjdCfWEeJZg7IQJkHULBi7/g
         87BIHi5WOk6xlu3VDWexF2qdyrd3LMGB+kNoqIR+mp3Qt+0//pDBaXWD1oYPhNdV6DGa
         XBfeJcsxC4JsEUSXYqlGCLDZ3uviXpDehgvrMlyIbT2WnwSlWFvBZmtWCMurdw/VL7rE
         xmW/xn17PqASmYmHre1uGzmSNqHKCQ7xIImSawWFbnEvOV/3KtVOq4MJyF0Ind2MJ49T
         cd2wOxQXZPJdJ3MOubGRuunkP+Zob7LQAqkO3j2jepX9BwdqtFBXRC7geA5JNuT0lxjk
         smYQ==
X-Gm-Message-State: AOJu0YzE2pP1Xa9RSjWexsuCqD7jYL4U3yel2ygPJl3e2iu98MTIcUSJ
	j45vOHy5Jd6xO2FlurTJgT2zsr24O3zGlKvSMOkBqe/rGWTJjlfMFbxKu2rLIw==
X-Google-Smtp-Source: AGHT+IGPOwozDd5h0x+SY3lRZfpc3enWyUNrxg0PNommVup7Xy/GhvvHiWsxGxXze83HFTIxM3HiiQ==
X-Received: by 2002:a19:2d16:0:b0:511:aae2:e5e8 with SMTP id k22-20020a192d16000000b00511aae2e5e8mr1059876lfj.52.1707993299863;
        Thu, 15 Feb 2024 02:34:59 -0800 (PST)
Message-ID: <58c754ab-287f-46ac-87ac-6870358d0885@suse.com>
Date: Thu, 15 Feb 2024 11:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] build/xen: fail to rebuild if Kconfig fails
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <20240215093002.23527-1-roger.pau@citrix.com>
 <23f82e89-d5b5-4b95-bbf9-be0a76a15cc1@perard>
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
In-Reply-To: <23f82e89-d5b5-4b95-bbf9-be0a76a15cc1@perard>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.02.2024 11:32, Anthony PERARD wrote:
> On Thu, Feb 15, 2024 at 10:30:02AM +0100, Roger Pau Monne wrote:
>> When doing a rebuild with an xen/include/config/auto.conf already present in
>> the tree, failures from Kconfig are ignored since the target is present:
>>
>> gmake -C xen install
>> gmake[1]: Entering directory '/root/src/xen/xen'
>> tools/kconfig/conf  --syncconfig Kconfig
>> common/Kconfig:2: syntax error
>> common/Kconfig:1: invalid statement
>> gmake[2]: *** [tools/kconfig/Makefile:73: syncconfig] Error 1
>>   UPD     include/xen/compile.h
>>  Xen 4.19-unstable
>> gmake[3]: Nothing to be done for 'all'.
>> gmake[2]: 'arch/x86/include/asm/asm-offsets.h' is up to date.
>>
>> Ultimately leading to a successful build despite the Kconfig error.
>>
>> Fix this by first removing xen/include/config/auto.conf before attempting to
>> regenerate, and then also make xen/include/config/auto.conf a hard dependency
>> of the build process (ie: drop the leading '-') and reordering so the .cmd
>> target is executed before including the configuration file.
> 
> Could you try to revert commit 8d4c17a90b0a ("xen/build: silence make
> warnings about missing auto.conf*") instead? With a much shorter message
> like "Don't ignore Kconfig error anymore".

But that'll introduce the problem that was addressed there, won't it?

Jan

