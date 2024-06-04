Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D58FAA98
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 08:19:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735148.1141309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENVo-0000GL-46; Tue, 04 Jun 2024 06:19:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735148.1141309; Tue, 04 Jun 2024 06:19:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sENVo-0000EG-1V; Tue, 04 Jun 2024 06:19:12 +0000
Received: by outflank-mailman (input) for mailman id 735148;
 Tue, 04 Jun 2024 06:19:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N7N6=NG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sENVn-0000EA-9J
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 06:19:11 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a17bba3-223a-11ef-b4bb-af5377834399;
 Tue, 04 Jun 2024 08:19:08 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4213870aafdso21192515e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 03 Jun 2024 23:19:08 -0700 (PDT)
Received: from [172.31.7.231] ([62.48.184.126])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35dd04c0f1fsm10602145f8f.15.2024.06.03.23.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jun 2024 23:19:08 -0700 (PDT)
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
X-Inumbo-ID: 5a17bba3-223a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717481948; x=1718086748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QWhBIDjFB2cJed97y5VSa5+LQ85Jjx4F0A+xGMtaYGk=;
        b=V88azQRygEC2xNWy5GymbSwacV7X3Skwt0bfM+K2FKjMmAi6I7pWpcFc642k6aFSOA
         j1jnnnf+21ZBPe1dv81DjUNWTasRmqwM16JCjkojK2qDM5fNBI27JlyvpwY3tYigWYjs
         JPNc684plu/8KTi96Qxh0WD2CXfzwJhsW50xpJ5ivtwdaqf1x6zrJ8ZXpt7q0YbBD4yf
         RSPGBPtA0PudblNSTSgauXFQXZm9Op3HlafuoO/Nwj9OCjMmpNd12p40ixjkxN2PCc6u
         RZtySDCwvq1wDIboTiwsDu27SWNBt6ynhHTgxqn8ZUdupNyOnukv1jgWG/lpeEUP6gwL
         GLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717481948; x=1718086748;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QWhBIDjFB2cJed97y5VSa5+LQ85Jjx4F0A+xGMtaYGk=;
        b=oVhqbHk2/3oLQ31nV0KbVDxOvZJSR9Y+24sGkmIKUYt936G4u2TusDe3NrD75G0sfW
         uGxheTCB2PyheqCX44/zbBr1flVjxd3DYh/mUWdzUnj2+3MW4jtACVk1gxF7y1MqBh4H
         lASnpS41GTbTZl/otGZAITgoXROyE/WyMxef49AYRW6Yf8WgDVZL2RU0EkMmuGZIZf8Y
         mEkvvKFntensLDZrgHO6CtB0mChI9+C3r/gmgexLYvm5d2eIP97BGZeosObfmTQYgzj4
         8mUa9YIxjb5o9ws/rXn3zeJTcr5vBiVXC3yiXVYDzGQMYXelMozJpbdr56ROQnv0dRwP
         NRmA==
X-Forwarded-Encrypted: i=1; AJvYcCW/hM/SwWVAiG5/dhuoj3xLE7yMOr1dkPchBfkTLZcrWKzsvPPgezVmb1lOdpSbzh2bszOMWwWnbJ/QIgJ5UjZoiLdTWoaprp5veHiJyck=
X-Gm-Message-State: AOJu0YyGik5fJ1+2wz+NOFGi1CvMU+0tALrJycI6rDOvSwoIjUZ13aFj
	lSDxPcBrJU0au7X/J6VLVEWqNC+HbzuQRPYeb5airZaQ8sKxZIAKxWEq1lsDOQ==
X-Google-Smtp-Source: AGHT+IFcoCc4w7IWJu1AGN60jlTdVqCaAg3IvX5Onv3zpGad1/Jf/2EqGUJKk7kzLc97n8FmnDhFFw==
X-Received: by 2002:a05:600c:4683:b0:421:4786:eb0c with SMTP id 5b1f17b1804b1-4214786f0e0mr15858305e9.33.1717481948276;
        Mon, 03 Jun 2024 23:19:08 -0700 (PDT)
Message-ID: <d70988d0-88fe-4bc3-a68d-d72981f78d9d@suse.com>
Date: Tue, 4 Jun 2024 08:19:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC XEN PATCH v8 5/5] domctl: Add XEN_DOMCTL_gsi_permission to
 grant gsi
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>
References: <20240516095235.64128-1-Jiqian.Chen@amd.com>
 <b10e68e2-3279-471d-a089-c40934050737@suse.com>
 <BL1PR12MB58491A32C32C33545AC71AB7E7EE2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4b311c82-b252-413a-bb64-0a36aa97680a@suse.com>
 <BL1PR12MB5849333D416160492A7475E2E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <70c86c74-3ed6-4b22-9ba6-3f927f81bcd0@suse.com>
 <BL1PR12MB584922B0352AA2F4A359FD66E7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <7cdff236-bb7d-4dad-9a83-47faaa6dc15f@suse.com>
 <BL1PR12MB58493D3365CC451F36DB554FE7F22@BL1PR12MB5849.namprd12.prod.outlook.com>
 <fbaf7086-85d8-4433-91d9-ef8f74512685@suse.com>
 <BL1PR12MB58494B521CB40BAEA30CB412E7F32@BL1PR12MB5849.namprd12.prod.outlook.com>
 <677e564e-4702-4a37-83df-8d47135b62ff@suse.com>
 <BL1PR12MB58494C3B7032B8BEFECF057DE7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
 <4a421aa5-b4c5-43f3-85cb-68c2021f13dd@suse.com>
 <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <BL1PR12MB58492BA224EBCE98549A0349E7F82@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.06.2024 08:01, Chen, Jiqian wrote:
> So, how do I process for gsi >= 16?

Oh, and to answer this as well: Isn't it as simple as treating
as 1:1 mapped any (valid) GSI you can't find in mp_irqs[]? You
only care about the mapping, not e.g. polarity or trigger mode
here, iirc.

Jan


