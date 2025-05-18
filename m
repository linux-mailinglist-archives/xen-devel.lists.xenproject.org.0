Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A069ABB093
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 16:44:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989238.1373473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGfFj-0004Fx-Au; Sun, 18 May 2025 14:44:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989238.1373473; Sun, 18 May 2025 14:44:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGfFj-0004Da-7f; Sun, 18 May 2025 14:44:35 +0000
Received: by outflank-mailman (input) for mailman id 989238;
 Sun, 18 May 2025 14:44:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGfFh-0004DE-Ts
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 14:44:33 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ba69a39-33f6-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 16:44:31 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-601ab204085so1524534a12.1
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 07:44:31 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-68.ptr.icomera.net.
 [185.104.138.68]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d502742sm4411497a12.28.2025.05.18.07.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 07:44:30 -0700 (PDT)
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
X-Inumbo-ID: 9ba69a39-33f6-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747579471; x=1748184271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jmx9eHqBzJfkMWv/xrYB1jNarUNibcAJ2ihHyuYo4tM=;
        b=GCQ8+M1uRFF7U0900UmwOJCFnxbQ9L28F7IAZTk7AD+/VNcM5s4PRflJbjjmQI0qdQ
         4b9dO4yzRWvq8ZuDBONEdmE4KQgl1+yX/SpMCWLnacI50f0gvLhCDUU7rRf5cdRrA5xF
         k1b6GbZA29ylyJw3+beuxAMq8tWdtl4u+PoV9xq1FN5MXoWUfzBXLosbt+lWDKROYyVd
         8XElFh0dpzbakAu+C0JDEV7KqyvUSYF8/yhnHCCzpkrGf3ba/LjeS0e8xtWRVuccLEsp
         kwN7R9zXtLVbkuf7sMy8pH6W9a1IPq/lgagXZ1751kBTL99cgaj57YfTJfSyhYHtbXBi
         2aTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747579471; x=1748184271;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jmx9eHqBzJfkMWv/xrYB1jNarUNibcAJ2ihHyuYo4tM=;
        b=dCfuAw16ee150wOKUP12Pjne2onHsAdZj7QzwKUV/XOjK+UsU3PHfJVwRt+5v2Ss0B
         XPKnZNnTHxrLiYNXGHwFWyE7MNEjShU809O1Yp2AhO6A3MX14rXCn7o99k43NNYFxRf2
         MoI7zuykaQb7lKwsT7yRtGnZqKp1Y0BSnYfP+9Um+v2+JfEpscMzcqxMzQkcx8ZW79t1
         L1tZodYcYkbYPPKJW0v7zz0Cfq8BusE+n18lEGdSHQDcD8bdWWUYhsxXk0Z5tPVVOJIA
         t4TC47q13S38QUnH1NDsiZL8K4CbqiKqHTIHkTNoZ95kx4NvPMtOdtKRIpJr4d6HYOLJ
         iesA==
X-Forwarded-Encrypted: i=1; AJvYcCV4lDggA8epcRjLg7Y4yide6V2bjBdbWUQg8G8KAExyqX8cxy1H6XwdQfR6FIpKn0hYuIEpkVJ0z2E=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzdnbWVy0mkMHeetBk2j+7pRyvWq4PxK4RmA+XZnv/aDJouZbjv
	vchZN0qESCpFHt06jjdj1qWUa0hrhpzagipIc/SsEZhMiKnQo0NIvrCv34mEnZu+/g==
X-Gm-Gg: ASbGncsosPvEXQMZADWflTgBoqH4u+6G4dR+NbTr4Xd+XR0dCVdPOQe+iKXCIfz0LbL
	8Y1ZCLReEMc/GIG2AjNR+Y6/CvkUQ+BwZ2KnlY9qWnQ9VC851otzaWHI2vQ71tIXojhLas1BP1V
	SNq0jEJ2qSm5wAyl9JEedHjRx5PRm+YTCfJ97jIXj5qQd9JVM6GRAq/0LR5qRrQVjMzVo44OHeF
	Jtrt+OuPlPQWOpUGXOxULt2jl+h3MNB0cikdXoAxLEiE2qiXuHH4waBe8X/C1OuJs/UoU0UXmwX
	RTtS9xuzOMkUnGn09QPEDlfPUwbx8/1KsZSlutUHZ2cHrhlrRLNTvysdW87pAvAZTo2NS7odTnw
	AJ88EVpmxOFNQ/AQRyWbnLdWX
X-Google-Smtp-Source: AGHT+IGXMVzgPMKBTtXsKyiA4dulSIokIKe9XzJ1/BtnTVTJoaL8s/cksIt+mEGoxzt/ywfHv8u6pA==
X-Received: by 2002:a17:907:9690:b0:ad5:5086:c2c7 with SMTP id a640c23a62f3a-ad55086cfa6mr490564666b.15.1747579471083;
        Sun, 18 May 2025 07:44:31 -0700 (PDT)
Message-ID: <76d58a17-90aa-46eb-bbe8-c6d9400c489f@suse.com>
Date: Sun, 18 May 2025 16:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/10] vpci: Hide legacy capability when it fails to
 initialize
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250509090542.2199676-1-Jiqian.Chen@amd.com>
 <20250509090542.2199676-6-Jiqian.Chen@amd.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20250509090542.2199676-6-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.05.2025 11:05, Jiqian Chen wrote:
> @@ -83,6 +99,100 @@ static int assign_virtual_sbdf(struct pci_dev *pdev)
>  
>  #endif /* CONFIG_HAS_VPCI_GUEST_SUPPORT */
>  
> +static struct vpci_register *vpci_get_register(struct vpci *vpci,
> +                                               unsigned int offset,
> +                                               unsigned int size)
> +{
> +    const struct vpci_register r = { .offset = offset, .size = size };
> +    struct vpci_register *rm;
> +
> +    ASSERT(spin_is_locked(&vpci->lock));
> +    list_for_each_entry ( rm, &vpci->handlers, node )
> +    {
> +        int cmp = vpci_register_cmp(&r, rm);
> +
> +        if ( !cmp && rm->offset == offset && rm->size == size )

What's the point of using vpci_register_cmp() when you need to do
the "exact match" check here anyway?

> +static int vpci_capability_mask(struct pci_dev *pdev, unsigned int cap)

What's the word "mask" indicating here? The function doesn't return any
mask afaics. Do you perhaps mean "hide"?

Jan

