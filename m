Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFA2881465
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 16:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695995.1086460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxkN-0002Bv-S0; Wed, 20 Mar 2024 15:20:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695995.1086460; Wed, 20 Mar 2024 15:20:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmxkN-00029T-OT; Wed, 20 Mar 2024 15:20:55 +0000
Received: by outflank-mailman (input) for mailman id 695995;
 Wed, 20 Mar 2024 15:20:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FoSn=K2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmxkM-00029L-CP
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 15:20:54 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70bf8469-e6cd-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 16:20:53 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-696499bd61eso189686d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 08:20:53 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 z17-20020a056214041100b0068ff8d75a90sm7993670qvx.19.2024.03.20.08.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Mar 2024 08:20:51 -0700 (PDT)
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
X-Inumbo-ID: 70bf8469-e6cd-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710948052; x=1711552852; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vOTF6kZ6FBZD7tJjnyTBwctBC1Fk5qrha5m3WONRLsY=;
        b=tOHkJk/25oHwluShufOOseob1bwId5MOXuE1tPZd95uEFOm8dcxBW3wDeQNRvW9/Dd
         l/A3Jkx0ZnfEy6Znw+CSvHyFTgNxrZDWX0UXLph69fDjJheBo1vWJ9UmtF9W/jMpMs/X
         DwxRUnImKqjxNTGoz57bcluzu0AqSQxfTxJyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710948052; x=1711552852;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vOTF6kZ6FBZD7tJjnyTBwctBC1Fk5qrha5m3WONRLsY=;
        b=Kuov6weloAxHexOrM5wXsf8f4ndUlJ/rtyUH40ArIxTM4GLzr9ya7VwPvsGAkb9YoC
         iRL2LGHDomhr0HL9JalTWSSLPQpraK/cvKypIXijIoriSb0B4Si/La4aOqkf2q+y/fnt
         wbt5AAX8E/H2aVgwBFenRMp5zv0vvkul8k3SWpBKTXpAnf4ghtzXx9Xk/eeGY+uAWtnk
         UAOhn9v7+dYAKAY599L1S7Bk/hEEOifyqx6/5VWl5Gw7ZhO6l9W1NlI1gYWcDDVgD7cy
         PyLsvOloDAH6tWEwNo/1UCKjIe/StLptf72t0kMv7mFYRPNn7cNo4aAfPYJkwXfZFD/R
         FaKg==
X-Forwarded-Encrypted: i=1; AJvYcCWh6d6Mj13JoRTp/Noh5c8G/86/xRazlj/HyrOoYzB/zycl7jlaUB2SKYjojiQk+0liHAsNTqZJ8akJAQHFpd2AD1ebhfhYSbAyzt3F67E=
X-Gm-Message-State: AOJu0YzyLbgeRlI0OA1z3Yph8rQ46Ol0wDbCIYf79YAB7Bov23sj6MSj
	Gwm/0NM3X1vcVhm397AnIXUuo/4rTSOYsGRNNIEj/ieliSgDbuUWJmKwIWoGBY8=
X-Google-Smtp-Source: AGHT+IE4GloOEz89snQBSYYTt9HxFold1Das25+/WLQUyu+o/v20u8saDBzrzBs+z+S2KLgxnrV96w==
X-Received: by 2002:a0c:dc14:0:b0:696:22ae:eb67 with SMTP id s20-20020a0cdc14000000b0069622aeeb67mr5462127qvk.33.1710948052418;
        Wed, 20 Mar 2024 08:20:52 -0700 (PDT)
Message-ID: <aec3917b-cda8-40ec-97d5-fe4ffb73c90d@citrix.com>
Date: Wed, 20 Mar 2024 15:20:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vcpu: relax VCPUOP_initialise restriction for non-PV
 vCPUs
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240320135720.68894-1-roger.pau@citrix.com>
 <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <73314dc5-0145-4aa7-a3cd-23c943235392@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/03/2024 3:09 pm, Jan Beulich wrote:
> On 20.03.2024 14:57, Roger Pau Monne wrote:
>> There's no reason to force HVM guests to have a valid vcpu_info area when
>> initializing a vCPU, as the vCPU can also be brought online using the local
>> APIC, and on that path there's no requirement for vcpu_info to be setup ahead
>> of the bring up.  Note an HVM vCPU can operate normally without making use of
>> vcpu_info.
> While I'd agree if you started with "There's no real need to force ...", I
> still think there is a reason: If one wants to use paravirt interfaces (i.e.
> hypercalls), they would better do so consistently. After all there's also
> no need to use VCPUOP_initialise, yet you're not disabling its use.

I firmly disagree.

There are good reasons to use VCPUOP_initialise over INIT-SIPI-SIPI
(like avoiding 16bit mode - in the case we want it here, to fix APIC_ID
enumeration in a way that doesn't involve putting more complexity into
HVMLoader), and forcing us to set up a useless structure before we can
boot vCPU number 32 is just wrong.

It was dumb to design a hypercall like this in the first place for PV
guests, and it definitely isn't OK to keep guests broken because of it.

~Andrew

