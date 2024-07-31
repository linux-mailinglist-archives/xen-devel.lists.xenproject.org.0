Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28398942D7C
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2024 13:50:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.768508.1179340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7qo-0005bF-0J; Wed, 31 Jul 2024 11:50:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 768508.1179340; Wed, 31 Jul 2024 11:50:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZ7qn-0005Ze-Tg; Wed, 31 Jul 2024 11:50:37 +0000
Received: by outflank-mailman (input) for mailman id 768508;
 Wed, 31 Jul 2024 11:50:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q60C=O7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sZ7qm-0005ZY-18
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2024 11:50:36 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15aad5b0-4f33-11ef-8776-851b0ebba9a2;
 Wed, 31 Jul 2024 13:50:29 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7aa212c1c9so757264666b.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jul 2024 04:50:34 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7acab23132sm761589166b.27.2024.07.31.04.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jul 2024 04:50:32 -0700 (PDT)
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
X-Inumbo-ID: 15aad5b0-4f33-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722426633; x=1723031433; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=as6cTdAxPWJdN3y1dR34Y3IW8D8JvbJT3/8CyOZ9NMM=;
        b=Rsob2xuNOUwGaQYEDEzssR4IlupG6r4PTqU5dkUzCUybxxkW/KIcLsVBZXBjsgjYlX
         Tr2/febxQd6c3e8O/c0lQkS3ofSx8IAGibTCMqtK5h8AgHbEMYrYTCp8oD1BxV3l/25r
         bEy0kAC6brBtN8lCucEJn5JX32/WmXPRpwD/6aQimx4iVnoMKJVW+od9G0cCiRbRhsKf
         In5n3ZD2aEXgEi/bw31c19+CSp1m2Le4Se4Q8pWjVpGLrFEIORPjLSPgO5TPE8cdFj4H
         eTomubrCburOpVexgJFzvi3gR51MW++UHRXlbYtgc6JMAzQ4lOsDXAktLqU9c5TR8Ujg
         G0IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722426633; x=1723031433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=as6cTdAxPWJdN3y1dR34Y3IW8D8JvbJT3/8CyOZ9NMM=;
        b=QznPDRb+Mqw2f70Wg4gkRL0fWjLOZGeryjeOBwJmwSnXlm8/03bdaZoF/XgRpDTgJV
         mXHWAHPnh7XPTciz6NPop3ziShziJ5mOyR6MNf5RKMaiYevrZ69Pp8AfWpGOqk8zvzcX
         luE8Qujrz6vBkOTCLaHQ/TEeg0hF60KI0gdegNU6me4pQRt6Y4ab13Gl93fLXTGIBn6O
         ocyYENdAjZykRbVgsjV+rKdXF3wNb0kN5kxSq79r65AZFh6QsCXIFF/WX2NLMgQxG3cn
         Tj5G8UaH1qkvZl3FxyQsanyS4gNgJYCYxW5l6qvtjkVH36X7qlECTA2wKei0dzjGKC2g
         KPXA==
X-Forwarded-Encrypted: i=1; AJvYcCWbJdm4iNVr8Y4UbysZryTE/8FYJgTvPM8U1wr4EcbivBRqoZKO08NL35jY8vXyuNJU6Qa/jhXU0mU72I/5DTyE3VnT0m6fFRc20NpQNmc=
X-Gm-Message-State: AOJu0YyIzrUJL11WaxdGnMw0WwWsmiEoWhb6BvBfIObOtw/sASytDkEK
	Tx5iGN1Y6KwH9x2nssh6oM1ahz5fPXbxdrGkYnFMc8SNrJeaNm8g15pVzV7F/Gc=
X-Google-Smtp-Source: AGHT+IGn1I/u+qhM8cgPbHZbTeCjje78dxVLrPXK57TYteliLT6GwiMOsqob2MlVT9TLmW/uCcUdsw==
X-Received: by 2002:a17:907:d17:b0:a7a:9ca6:528 with SMTP id a640c23a62f3a-a7d3ffa4f39mr963806866b.11.1722426633327;
        Wed, 31 Jul 2024 04:50:33 -0700 (PDT)
Message-ID: <a397829f-a190-435e-b6d1-8734800939ce@suse.com>
Date: Wed, 31 Jul 2024 13:50:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init-dom0less: Weird use of cpupool in xl dominfo
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20240731100359.529751-1-a-singh21@ti.com>
 <3ca84670-9201-49a5-9643-1cfbcaefb830@citrix.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <3ca84670-9201-49a5-9643-1cfbcaefb830@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.07.24 12:08, Andrew Cooper wrote:
> On 31/07/2024 11:03 am, Amneesh Singh wrote:
>> Hello, I was going through the source code for init-dom0less as I was
>> facing some issue after applying this patchset. Feel free to ignore it
>> however, as it seems unrelated to the issue I am encountering.
>>
>> https://lists.xenproject.org/archives/html/xen-devel/2024-05/msg01825.html
>>
>> One peculiar thing I noticed was that the "cpupool" field is being used
>> as a bitfield to check individual vCPUs. However afaik, "cpupool" is
>> supposed to be the cpupool *ID*. That matches the fact that the cpupool
>> value for all my VMs is 0, as I only have a single cpupool (id = 0). Am
>> I overlooking something, or am I correct? Here is the relevant code:
>>
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=tools/helpers/init-dom0less.c;h=fee93459c4b9da59446a2f8dfcf5cbfc4d95aeab;hb=HEAD#l176
> 
> CC'ing relevant people.
> 
> But yes - that looks distinctly wrong.

It _is_ wrong.


Juergen


