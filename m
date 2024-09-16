Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C288979B3F
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 08:41:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799163.1209015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5QT-0003ew-Qa; Mon, 16 Sep 2024 06:41:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799163.1209015; Mon, 16 Sep 2024 06:41:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq5QT-0003bo-Nx; Mon, 16 Sep 2024 06:41:33 +0000
Received: by outflank-mailman (input) for mailman id 799163;
 Mon, 16 Sep 2024 06:41:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OuWe=QO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sq5QS-0003bi-CH
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 06:41:32 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4bd1431-73f6-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 08:41:30 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d2daa2262so375972966b.1
 for <xen-devel@lists.xenproject.org>; Sun, 15 Sep 2024 23:41:30 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9061096aa2sm270160666b.35.2024.09.15.23.41.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Sep 2024 23:41:29 -0700 (PDT)
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
X-Inumbo-ID: b4bd1431-73f6-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726468890; x=1727073690; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7C8K8sWZxmQkYNe8Lb+e74SygEpeM4lNPHRADc2uSU=;
        b=TZQT0pxNtdAWpi0w9T+B/Xh5y66v5YmYKfGFQw0KytJn3uemWbz8noZUI3Qx9D0O6D
         kkXX15aGVDT4UJwAq7+9opav6LLX0UmZGS2ItwVWLeyNbR/tfpIEQ1WLRpEJYhCsE6Em
         ZFoARccUWOdpQN6z6jGrEd1i1VYtRnpQXLCK49JBTxnPEaBdpYRVpEeCvPmvIyKSaGb1
         Zme6UJRwhYR9cP9mxt+Vha8pXch+L/Z+9pmr9oHDz9+bIwmulkIoCFev21P3JLNCM1Qx
         16gxgVRScB8wtIp6HIJSwTGUXoY8fjD36qnkclF+Y0nstAHMAU2WgMX+WZJE7SpR49XX
         KNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726468890; x=1727073690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7C8K8sWZxmQkYNe8Lb+e74SygEpeM4lNPHRADc2uSU=;
        b=mz9uOz8wYBIn1Kw43BccLGWqP+ff9uHvOSu25MDsX8dSh0LnqDbNxmBFouZtcwfz7y
         pQXU+7FTswHVlRpSC7FXytAgAHR3ughd7HqBJ0LqaBom9n6Ngi5cBsqJQiwq4xc2ShkA
         iHuqeCEIORE6i9URvOxC5PqSoKgkM43I7xEH7STFDKgoh3YbljgrM+seYkAZMhYL89ip
         LooZrHsi9g9nIsevM0cyihc0nfKwyz754IrtyDghCLfqd4aAziW4MqocDsIlypXrtCZs
         YMuO9WO+MrWOe4MzsFh00E/d5baTZMKAANSunMrwMJDLtV3WOAKRj/RNOeSqKsEk+Zvb
         ygHQ==
X-Gm-Message-State: AOJu0YwYS9dUV9U5mIGEWgGBxDPX8V9VU5G+5lz4mYkstyythrsApDmx
	gMNz72h2dELIXQctsNQqFOaC61qzszN/ZkvCKpo/pTVeOSYUKYcWg2qmxvCuzA==
X-Google-Smtp-Source: AGHT+IEMJdvoT5VE6UaD1ZxlYSIFAveZmLR7Wwu3jGaCR1zmKFvZkBXYlQcXfvjfeHfdLCzZ02h3sg==
X-Received: by 2002:a17:907:3e1f:b0:a8d:5288:f48d with SMTP id a640c23a62f3a-a9047d1ade9mr1008940166b.32.1726468889701;
        Sun, 15 Sep 2024 23:41:29 -0700 (PDT)
Message-ID: <dcc3683e-dea5-4620-ab8c-0a27971b9543@suse.com>
Date: Mon, 16 Sep 2024 08:41:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/hvm: make stdvga support optional
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240912085709.858052-1-Sergiy_Kibrik@epam.com>
 <ZuKxEVsbV0MqLrtb@macbook.local>
 <0f256ef4-2059-4068-a38d-1293efbb35ca@epam.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0f256ef4-2059-4068-a38d-1293efbb35ca@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.09.2024 08:37, Sergiy Kibrik wrote:
> 12.09.24 12:14, Roger Pau Monné:
>> Shouldn't Xen report an error if a user attempts to create a domain
>> with X86_EMU_VGA set in emulation_flags, but stdvga has been built
>> time disabled?
> 
> I'm afraid this can accidentally render the system unbootable, because 
> it looks like toolstack always sets X86_EMU_VGA flag.

Which would mean that further toolstack side changes are needed, if you
really want to pursue this route. The toolstack ought to be put in a
position to figure out whether the hypervisor has stdvga support for
HVM guests.

Jan

