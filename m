Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E923E93934B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 19:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762318.1172475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVx7K-00035k-Hg; Mon, 22 Jul 2024 17:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762318.1172475; Mon, 22 Jul 2024 17:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVx7K-00033E-F5; Mon, 22 Jul 2024 17:46:34 +0000
Received: by outflank-mailman (input) for mailman id 762318;
 Mon, 22 Jul 2024 17:46:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQNa=OW=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sVx7J-00031q-9u
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 17:46:33 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542d005d-4852-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 19:46:31 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a77cb7c106dso459262366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 10:46:31 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785d4esm446531966b.31.2024.07.22.10.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 10:46:30 -0700 (PDT)
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
X-Inumbo-ID: 542d005d-4852-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721670390; x=1722275190; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8YZVraIpH+q388nSbjeibaIor+b8SzymxVYUh0Dr7KU=;
        b=C31/7mSbH9qKaZohJvHk+0jDbeB/Hhd3Gh3ugu4pThRdzwV5pMZGvw6zmjA+DLAOp2
         JLZCio9G2bP3zPKkuaRV3HDRhN0E/+H7ysSEamTZEh8LBvtMhDlLq+cBRlavduklFkQn
         g5MMYnQ9i7q2p9TH5Qa1BevnwqaidkcyO09+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721670390; x=1722275190;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YZVraIpH+q388nSbjeibaIor+b8SzymxVYUh0Dr7KU=;
        b=UxnMLKc9ubbT+oLuaF8iCMwchbDaHNe4ogFqyD05wecxA7wxcN6PyR4hHIzaPGeur5
         tY4iGsdhDsdbNeyblNKm4d0bGMwO6t+q+GiAPFygSFNGDxLZ+yPcm7QjfvcslTvuPwdq
         kttW5Mo+f4b2cwgWCckWU/ousPu0uB/ciSkUEmctHesCSl0Ql/zyBeM9BGBSgx3niEps
         7iEqvGFeWuvl6voRZwtGPzai1pQm5uSSpjFA4GTOCAXnRmrw0k8VqDmofhCKsJjHkgLq
         d9+yck0Kyg7WI6ZL0zGPot3gxl3UC3R5cRoc+wh0feLkJehx8CvRGU4jGcF1QDvIHjiK
         EQrA==
X-Forwarded-Encrypted: i=1; AJvYcCU669BpwUl63KDmACg+uWmr0LXR86pN14xC7i6m5PesW/TVbOg25LIujjRaqxHnluzo//uyal2/Hkoa9bygcGV2bC8y6A8fyyCKHMlnDoc=
X-Gm-Message-State: AOJu0YzI8eJEpmJ/jcYaZ6BoSh/WEJNgRbtrEt4FJHGvf2x6kZcyTUyq
	daxabbcUi1IRqmFDBbCj//EKcWM62b4I7BwFxPtxNuU1NclV1x0yaPpCOhWloV0=
X-Google-Smtp-Source: AGHT+IFbiY8Cq89rZrJzzzk4eo/hpnS3wYvi6+qmZilASq5bUyRz2lp4LdxxoqYvT7TmHh3S19FsEQ==
X-Received: by 2002:a17:907:7d86:b0:a77:dbf0:d30 with SMTP id a640c23a62f3a-a7a4c10350cmr536006966b.41.1721670390438;
        Mon, 22 Jul 2024 10:46:30 -0700 (PDT)
Message-ID: <e3f64d67-75eb-4c7b-97fb-ca39edb5ddb9@citrix.com>
Date: Mon, 22 Jul 2024 18:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arch/domain: Clean up the idle domain remnants in
 arch_domain_create()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240718215744.3892072-1-andrew.cooper3@citrix.com>
 <20240718215744.3892072-5-andrew.cooper3@citrix.com>
 <be94ac73-cb8f-4bb3-a529-4c3b47a939b3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <be94ac73-cb8f-4bb3-a529-4c3b47a939b3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/07/2024 8:23 am, Jan Beulich wrote:
> On 18.07.2024 23:57, Andrew Cooper wrote:
>> --- a/xen/arch/x86/domain.c
>> +++ b/xen/arch/x86/domain.c
>> @@ -791,23 +791,6 @@ int arch_domain_create(struct domain *d,
>>  
>>      spin_lock_init(&d->arch.e820_lock);
>>  
>> -    /* Minimal initialisation for the idle domain. */
>> -    if ( unlikely(is_idle_domain(d)) )
>> -    {
>> -        arch_init_idle_domain(d);
>> -
>> -        d->arch.cpu_policy = ZERO_BLOCK_PTR; /* Catch stray misuses. */
> This line looks to be lost in the process. Already in an earlier patch it
> should move to arch_init_idle_domain(), shouldn't it? With that adjustment
> for the entire series:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

It was semi-intentional.  cpu_policy is just one of many pointers, and I
don't see a good reason for it to be treated specially.

It's been around for years now, and never one triggered, not to mention
the fact that there's a dwindling set of machines where a dereference of
0 isn't instantly fatal anyway.

~Andrew

