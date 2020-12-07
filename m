Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2452D14E4
	for <lists+xen-devel@lfdr.de>; Mon,  7 Dec 2020 16:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.46756.82882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIby-00047s-VJ; Mon, 07 Dec 2020 15:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 46756.82882; Mon, 07 Dec 2020 15:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmIby-00047T-S6; Mon, 07 Dec 2020 15:39:38 +0000
Received: by outflank-mailman (input) for mailman id 46756;
 Mon, 07 Dec 2020 15:39:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=exIY=FL=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kmIbx-00047O-PM
 for xen-devel@lists.xenproject.org; Mon, 07 Dec 2020 15:39:37 +0000
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a979d995-7a8b-4c4f-b09a-f4d4cc27bccc;
 Mon, 07 Dec 2020 15:39:36 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id u19so18736448lfr.7
 for <xen-devel@lists.xenproject.org>; Mon, 07 Dec 2020 07:39:36 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id m16sm2901440lfa.57.2020.12.07.07.39.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 07:39:35 -0800 (PST)
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
X-Inumbo-ID: a979d995-7a8b-4c4f-b09a-f4d4cc27bccc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wseb78LRFeCqaji/N+Aaw/+SO46gGnyHXNM5KDvRA14=;
        b=vEbYw9whoKJjyz8CQJsQ8UIvpW/Y8J8FN4pwYIRZ7z5MDPK4vAeZ2xTQZnn8idKQHy
         kxUZ5oEbDYxjHRs6HTKeNq7Hl2ZeydMIp//qM2YzEDWTTpIBEjRCxDEnX5//wkL6bHf+
         1xM629ZIVdRDQ4tK8Jh80TbbrxUCPF1XgIOGBiyzI6KpFkGyMol0LrEUrO85XevvlJsn
         I4DWNb9QrLSngotrdu9nglkVz5LomIiM90G+LsCueSJCIWhwC9qb2Yve4+gtkSE6BhWs
         UrMA8V6me75mztDAJwN3C00n6cr6UJCPGDbRBMYXSKbjZvyGodgFUhu4uAz2zn9mdA54
         d7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wseb78LRFeCqaji/N+Aaw/+SO46gGnyHXNM5KDvRA14=;
        b=X/0geVKDvASccOzKxOlK8t6W4oreLNuIoe9+i+ZbfZTCbxUsBJ6xtVk+9+5D0zCl86
         kMlhyM1SvcNqXCoW8RJUYnjhzJMrJDyjRy8MGmjLhOcpK+3MeaW9O7k2HstRKdJObzlJ
         y/vn0ltbagfRQF6Unqr1K3MZQ8W0N9hjyihlulvl/ys47e5m9WwUo++Re+EnwK0B3GYe
         3hNFw5xln2BRdg3nXtqFt1ox0yjvTc6kmqeH/XHDJIW+fwlP2bZDqtgbcbsE5nZOD0eJ
         Klvg311FeEG+v6fI2X/XkZUso39zkLSKezslBVVE2corCXF9uE08ftL24e3tQUzT29B0
         /u/Q==
X-Gm-Message-State: AOAM532PtHPEte+CR256HHUIcs5Wauw2MwtCG4C7R2GwqJ/qfCw4i7iL
	5CYN5zdHjHtOTzM/iM/BS1mEqRKHi37RbQ==
X-Google-Smtp-Source: ABdhPJz0r6Pry8excVDnCT1GdUGlNv0EP9Z6Dk9YVgFrH3TRRpYwL//zcP2BdR+aVicLsL3pTp2apA==
X-Received: by 2002:a05:6512:33a8:: with SMTP id i8mr639176lfg.5.1607355575564;
        Mon, 07 Dec 2020 07:39:35 -0800 (PST)
Subject: Re: [PATCH V3 03/23] x86/ioreq: Provide out-of-line wrapper for the
 handle_mmio()
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-4-git-send-email-olekstysh@gmail.com>
 <a12313a8-4e74-02a0-f849-72c6ed9b6161@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <ec151ff1-f1e0-4978-69ef-29b62ab71aaf@gmail.com>
Date: Mon, 7 Dec 2020 17:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a12313a8-4e74-02a0-f849-72c6ed9b6161@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.12.20 13:27, Jan Beulich wrote:

Hi Jan

> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>> --- a/xen/arch/x86/hvm/ioreq.c
>> +++ b/xen/arch/x86/hvm/ioreq.c
>> @@ -36,6 +36,11 @@
>>   #include <public/hvm/ioreq.h>
>>   #include <public/hvm/params.h>
>>   
>> +bool ioreq_complete_mmio(void)
>> +{
>> +    return handle_mmio();
>> +}
> As indicated before I don't like out-of-line functions like this
> one; I think a #define would be quite fine here, but Paul as the
> maintainer thinks differently. So be it. However, shouldn't this
> function be named arch_ioreq_complete_mmio() according to the
> new naming model, and then ...
>
>> --- a/xen/include/asm-x86/hvm/ioreq.h
>> +++ b/xen/include/asm-x86/hvm/ioreq.h
>> @@ -74,6 +74,8 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered);
>>   
>>   void hvm_ioreq_init(struct domain *d);
>>   
>> +bool ioreq_complete_mmio(void);
> ... get declared next to the other arch_*() hooks? With this

sounds reasonable, will update


> Reviewed-by: Jan Beulich <jbeulich@suse.com>
Thank you

-- 
Regards,

Oleksandr Tyshchenko


