Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1217ABAEC1
	for <lists+xen-devel@lfdr.de>; Sun, 18 May 2025 10:23:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.988850.1373251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZJ1-0006UC-2X; Sun, 18 May 2025 08:23:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 988850.1373251; Sun, 18 May 2025 08:23:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uGZJ0-0006Si-WB; Sun, 18 May 2025 08:23:34 +0000
Received: by outflank-mailman (input) for mailman id 988850;
 Sun, 18 May 2025 08:23:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uGZJ0-0006Sa-7X
 for xen-devel@lists.xenproject.org; Sun, 18 May 2025 08:23:34 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 627c8202-33c1-11f0-9ffb-bf95429c2676;
 Sun, 18 May 2025 10:23:32 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a361b8a664so1949347f8f.3
 for <xen-devel@lists.xenproject.org>; Sun, 18 May 2025 01:23:32 -0700 (PDT)
Received: from [172.18.118.114] (ip-185-104-138-24.ptr.icomera.net.
 [185.104.138.24]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442fd583f71sm95197565e9.27.2025.05.18.01.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 May 2025 01:23:31 -0700 (PDT)
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
X-Inumbo-ID: 627c8202-33c1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747556612; x=1748161412; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49j93buoqoZ+Qpg3aRYmy1EreytZ446wBKdsnMPO7xM=;
        b=R+2BUwujsfIrpD2HrvuHO5ndLTq/FCqGHgxV6BF0BtWxyXStLIr5HTx05ZPLYAWjIx
         QisMVXlkrz00jB/uqdFc8pYICjF1b/1l8LzF57N5Ur562UzpJcWD00B/HwF2utXDpjx9
         9BWFoUTM6iCvOsvnalPpiNck6SPSTE8k1ZQO6fjEeFp8V58VMDOGOyN2xqwB0cqI9QGx
         aUMyETHFMaOeMtmjSpeJ8OQr8L3vYTmDuA3aFRgFX6Jkb2zvwB1OSi3ODlRAbg3j9KMu
         zfJcmhU0Yumn+kxPiDxj9A8xQHrWoskLbftqETY3IxJObSY21w3NSy0GsW6pk/WYu5lX
         CK8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747556612; x=1748161412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=49j93buoqoZ+Qpg3aRYmy1EreytZ446wBKdsnMPO7xM=;
        b=BysDCo1x2VOCmclFNbwYCbsyztenL+PUfemCWPpjPJV/GdUw5INF/rCipbbsITraDk
         68fizlj1SRRTBeXiK+2jHo1pC3u0CPO8wXTRQvXk6ZnpYXtqnscZ+2aSCqWFm/PrgLQi
         qHrgNQYtTMKnuz4hbY46nn8FvwxBQpMSKzBbpXdRqdiO4M/4lhoJ4fpIaU2dhQkezd6n
         gwQK3T3LTJjiRqfCtjrtyKJgTcFZmsxQq4Esq5M2BAq0GPUXpvdDaPkYoNJioJ9hmbX9
         P2sgOgFLkyTvemDHXpEVCQajWA/3dAwl85eWZA+u1KmFwuozbl17ZUbqJmg15v8nw9sc
         /tGA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Qj1jCc0B0bjpVvo1mueIY89XKyJUT22+oYjx+XJP6pifmQOdEC58cQ2nhLP4B3zArgZsb4WCJrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxbe4vlRLOxadp2QHLybyYeP469FXRsqoPH9eUcsMbOG28ndJKl
	+oFpTuUGVM1lYl38AUzws1ozdNbfe+KOWLqVrp6GIwiWcream5hy3YDaKlGUh+v/fw==
X-Gm-Gg: ASbGncuBoTtq5M+m0g67IQbac0KBhTPwvH7JwneTT3SYMLqK7KPyL3W6THzi/gwtE3u
	nO/iVS59pgDAmitVM+Xf+Hd+ZpurB9+G7DJPsooswkzMn7/TNv7sudgHjyLVxgch6lcDCb0QTw8
	6iC8TUkntAhAem5vRjbqijP0GK8BMYQKkDHZzIfJpXaJHfqch2PusWYXFfNamo1pdNlysaZ0i2J
	nprkvHrSWALIpqCFGTbEZD6IXKdQ6pjbiF6dy+6idSMBULhrptwz84rsi1sQZkxRzPJKGDyuzp8
	Euz06OvPMpX4wVM48hngWhREGMJyCpTDeBso+wv8P8RbjOXwtbhmOuaQMWI9Vki5ZBVuK8tUhB0
	5K4uDs10npEmmp6joV2dVZH6b
X-Google-Smtp-Source: AGHT+IH1lN2al6JTw5QQsQ9qpNP6cxNTDsWTacqoyv01lc/4DCqB4SHp9Th/paa5zzUapLHOMA1Qdw==
X-Received: by 2002:a5d:4ec8:0:b0:3a3:62fa:fb85 with SMTP id ffacd0b85a97d-3a362fafcb2mr5203658f8f.28.1747556611850;
        Sun, 18 May 2025 01:23:31 -0700 (PDT)
Message-ID: <b981b51d-afbc-4f49-8e44-2cd1a669bf6a@suse.com>
Date: Sun, 18 May 2025 10:23:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/16] xen/riscv: introduce platform_get_irq()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <a6198571b19be1f10b549e68a1b712a6653429e6.1746530883.git.oleksii.kurochko@gmail.com>
 <f2d61436-739c-4e41-95a5-22a5176d9415@suse.com>
 <e6aea8e0-cf70-40ff-8729-24be0f432aeb@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e6aea8e0-cf70-40ff-8729-24be0f432aeb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 16:04, Oleksii Kurochko wrote:
> 
> On 5/15/25 9:33 AM, Jan Beulich wrote:
>>> +int platform_get_irq(const struct dt_device_node *device, int index)
>>> +{
>>> +    struct dt_irq dt_irq;
>>> +    int ret;
>>> +
>>> +    if ( (ret = dt_device_get_irq(device, index, &dt_irq)) != 0 )
>>> +        return ret;
>>> +
>>> +    if ( (ret = irq_set_type(dt_irq.irq, dt_irq.type)) != 0 )
>>> +        return ret;
>>> +
>>> +    return dt_irq.irq;
>> What guarantees the value to be at most INT_MAX (i.e. no silent conversion to
>> a negative value, signaling an error to the caller)? Actually, looking at
>> irq_set_type(), what guarantees irq_to_desc() there to not overrun irq_desc[]?
>> There are no bounds checks in aplic_irq_xlate().
> 
> I'm afraid that both aren't guaranteed. I think to have the following in platform_get_irq()
> should be enough:
>      BUILD_BUG_ON(NR_IRQS > INT_MAX);
> 
>      if ( dt_irq.irq >= NR_IRQS )
>          panic("irq%d is bigger then NR_IRQS(%d)\n", dt_irq.irq, NR_IRQS);
> 
> Probably, the first could be dropped as I'm not sure that anyone will use such big
> number for NR_IRQS.

I'd say better keep it, even if largely for doc purposes.

Jan

