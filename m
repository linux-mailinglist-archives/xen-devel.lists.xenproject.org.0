Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B4FABECF9
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 09:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991567.1375404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdkO-0005ZX-9Q; Wed, 21 May 2025 07:20:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991567.1375404; Wed, 21 May 2025 07:20:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHdkO-0005XS-65; Wed, 21 May 2025 07:20:16 +0000
Received: by outflank-mailman (input) for mailman id 991567;
 Wed, 21 May 2025 07:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHdkM-0005XM-HA
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 07:20:14 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09510780-3614-11f0-a2fa-13f23c93f187;
 Wed, 21 May 2025 09:20:13 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-ac2bb7ca40bso1080747166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 May 2025 00:20:13 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d04772dsm851807966b.3.2025.05.21.00.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 May 2025 00:20:12 -0700 (PDT)
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
X-Inumbo-ID: 09510780-3614-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747812013; x=1748416813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jxvm6IcmIUDIP+aplbWZYaDXzlC2kGeTNNoKsfuqaY=;
        b=gnt3gcVwe187vBIetFnMjvfcSfwFrOinJyhnyIfVMHARw2HqIC4yo/7Mgc6oF6NWC0
         tylXmX2byNDRyuVob0QauJHtIdaadBjWvPEOBaYL8cNnCKDGasHZ6GDI63an+5OFGZnD
         nID1/MStif9d834CFA+a+qUXFjLkCZLHsCyX9Xd3Gvegauan8qgVq7NbKtWIiEGtiIm8
         Q6cbz2cFMbPHbLC4Hb9RVDdKjBPj4DPxRTLBknEBs2206GP30g/XZ+l3OyacWagyCGiI
         CqoIzw9UBiqna48SINsgswNCWTYeOy+5GCOJNrsALtEc1EV44acqr0P8hu6fgDvkz7bh
         7rnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747812013; x=1748416813;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jxvm6IcmIUDIP+aplbWZYaDXzlC2kGeTNNoKsfuqaY=;
        b=LSZr+1uRRbucuzdE1rfCuN0CriGgcEIS3sBmqSfXeZEoWzMkw4GMsagkPtQjvd48tE
         t4IEcIItn0GfvK169cuILHUtp/agoEWktsjLf+MFawJf+Nf8OPvQOLEDzdZGS7x6gais
         Gur4cP4gAuAUKj2FvIFvYWVegAsU6ibpHxsKAiv3VM9mLdLOGTGtg8ERzPgWBoSMQicC
         1P45CzAmIiDsEzv/8uut6SPafkOwihfy3cZ3T5GTBBEqSONNnAQSxgpuTT/M4fcm4bvc
         4b705GbQMOM98VJ3vIVxxye+H3AExhpfGZeTTnaJJ9RYTQW3eC3sl+MR+yaBrp3EcEQb
         cBIg==
X-Forwarded-Encrypted: i=1; AJvYcCXlxgrNu6r3gLLVm/Wf9RkeMa4gmR9W6YgCwkqfhbsRdWiRIeA+ng84YHHkqQlHRq2yHOA1J9TsR6E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNBpMvHc8crSDRkFNzwTY2WR5lH71bx2100PylaQn+Ssyu3XKc
	c1T35vlQl5p8+A51yxLJ3o6gVWzBBQgnTn5avbsRawcFQCioM+7KQVchT7YmoNHdug==
X-Gm-Gg: ASbGncsSrOxzl/aQkgp8AEcDS1jHH6go4j/7uhGsUGPRLrPfyBOxKVGY60pltcBESrF
	sBWBN2PRaoMFxWZcI17RVVbRar1amquaSasLkYl+2RKvsxZj76IzX03aJhRPm/IX63u3DUlepza
	hcYFGEX3giz22xLVTNHQpLr0htVWisc8erv/27HANVloJUTZM+NHOkHsr2ETr+feeH/2CjB4wdq
	zz9IWY9umYFMrhYYQDwnylxw5FTcXJbmdH9r2nLu47kc3pFuAuK6WO5UC/qQIBvx7q2mLcZ1aN6
	O9wGvW6GbBrQull2eQ3Nqc+bAbw2p4ZSM8XrgauXwGokfzSM+dUIv6/1vHCAEg==
X-Google-Smtp-Source: AGHT+IGhrMMvnm5iCBosWgs/2cS8yrw1x4bluqd9yizzr0PH7R6+pt7UH8V0OpUtO4jHnRuyblN3Yg==
X-Received: by 2002:a17:907:7da9:b0:ad5:a215:7271 with SMTP id a640c23a62f3a-ad5a2157651mr275200366b.17.1747812012834;
        Wed, 21 May 2025 00:20:12 -0700 (PDT)
Message-ID: <150cbc21-9d7b-43d8-9204-417e9d5f5dbe@suse.com>
Date: Wed, 21 May 2025 09:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] SUPPORT.md: add xenstore stubdom as supported
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250521044634.11361-1-jgross@suse.com>
 <20250521044634.11361-2-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250521044634.11361-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 06:46, Juergen Gross wrote:
> SUPPORT.md is missing a suupport statement for Xenstore stubdom.
> 
> As SUSE is using it in production since several years now, it should
> be added as "supported". This covers the PV and the PVH variant.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


