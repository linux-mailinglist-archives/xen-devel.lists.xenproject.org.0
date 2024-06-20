Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB81910E68
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 19:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744879.1152009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKLX1-0000kr-Jo; Thu, 20 Jun 2024 17:25:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744879.1152009; Thu, 20 Jun 2024 17:25:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKLX1-0000iE-Gm; Thu, 20 Jun 2024 17:25:07 +0000
Received: by outflank-mailman (input) for mailman id 744879;
 Thu, 20 Jun 2024 17:25:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WCyn=NW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKLWz-0000i8-V4
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 17:25:05 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0848e5ae-2f2a-11ef-90a3-e314d9c70b13;
 Thu, 20 Jun 2024 19:25:04 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52bc121fb1eso1307790e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jun 2024 10:25:04 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0c5485sm33668255e9.21.2024.06.20.10.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jun 2024 10:25:03 -0700 (PDT)
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
X-Inumbo-ID: 0848e5ae-2f2a-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718904304; x=1719509104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+srNgqOpyZPQeIGgcEP91HDSa9FPf0wXz9vM3R4iSmc=;
        b=k3BKAzpopEbJCv0J8sEqX0r1ukY6dNZnRNuKNs3xaUeHBRZ3o+pAiAMm7l/rvN4uLU
         AZHgmzRp7LBn9SRznUuCW1yyPzKDAmwUFj2UsKsxoU6wJnHvVisF43FD6DvwagoLzC4Y
         Vlpl8ltYAMz907KxuSXUvuj5LDfx+GEyG738A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718904304; x=1719509104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+srNgqOpyZPQeIGgcEP91HDSa9FPf0wXz9vM3R4iSmc=;
        b=maeXMKetUrZvFNpknouX2AsBnQaZm7r+QVackqG+AgcEH2uzyobztRYVAU44H/GzAD
         1q569Mgk8YAAxQTTquwSadbo+mQ9XbaTGgoIKu7MklAmOxCxv1zPiohXUgA59/qbZDyp
         jvSH2Hy3vMc0g5Un4yMGL1TlJUPcFOT5MRfi9a3hyFUVDbcBjinzhJlva2vuHJ7wgD3x
         6VsQeTK3njyMqUiwccGvdOB5BhSnt+GR4W9QhCoRDRhF2D7Jsx+9YBNpJfY83dDtOu4t
         dv/0cjJUM83R+PwUyecPxL73uky59iW3b8gpbmEYLX5CLLFX76kTrPpB8mK6gY6EvdOl
         7OsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVj0OdbPGzhpkQfsh/M8efJnejsm37qYb6LrfQfI4/pMJnz+Rry2ReCkMRSIdZ+5pce4I8ctS0IgavUf6FEttbeKcdHkrHqfFvzuc53Dy0=
X-Gm-Message-State: AOJu0YyV46Cp3J5QaBCGsBGQDKRaiR9FHAiYfbmuLFOl6Jax0ASFKkbv
	khn9z4B8xEs6Bd9wwXjwRi5clMvKIV4XD7QQ79JvymciG6/tg7P8jRwq1LZHL3Q=
X-Google-Smtp-Source: AGHT+IFq5xtRCyUb3CtNFRYFi8vTVoJcX4HmYiVQNDSTx3XuVVLwMH9XqPeSj6QHeJnhLl5InZjHCg==
X-Received: by 2002:a05:6512:ac2:b0:52c:8fe4:b153 with SMTP id 2adb3069b0e04-52ccaa376aemr4415579e87.32.1718904304162;
        Thu, 20 Jun 2024 10:25:04 -0700 (PDT)
Message-ID: <3574b89c-d13e-4624-9fd9-4ff641eee80e@citrix.com>
Date: Thu, 20 Jun 2024 18:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arch: Centralise __read_mostly and
 __ro_after_init
To: Shawn Anastasio <sanastasio@raptorengineering.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240614124950.1557058-1-andrew.cooper3@citrix.com>
 <0460ce5d-0fcc-4f9d-9548-6e86bfb8bc4b@raptorengineering.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0460ce5d-0fcc-4f9d-9548-6e86bfb8bc4b@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/06/2024 6:22 pm, Shawn Anastasio wrote:
> On 6/14/24 7:49 AM, Andrew Cooper wrote:
>> These being in cache.h is inherited from Linux, but is an inappropriate
>> location to live.
>>
>> __read_mostly is an optimisation related to data placement in order to avoid
>> having shared data in cachelines that are likely to be written to, but it
>> really is just a section of the linked image separating data by usage
>> patterns; it has nothing to do with cache sizes or flushing logic.
>>
>> Worse, __ro_after_init was only in xen/cache.h because __read_mostly was in
>> arch/cache.h, and has literally nothing whatsoever to do with caches.
>>
>> Move the definitions into xen/sections.h, which in paritcular means that
>> RISC-V doesn't need to repeat the problematic pattern.  Take the opportunity
>> to provide a short descriptions of what these are used for.
>>
>> For now, leave TODO comments next to the other identical definitions.  It
>> turns out that unpicking cache.h is more complicated than it appears because a
>> number of files use it for transitive dependencies.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> This seems like a reasonable approach, and removing usage of the old
> cache.h __read_mostly from the PPC tree should be a relatively simple
> follow up patch from my end.
>
> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Thanks.

And funnily enough, I have a patch doing that which I'm just about to
post, because RISC-V needs exactly the same treatment.  x86 and ARM are
a different story.

~Andrew

