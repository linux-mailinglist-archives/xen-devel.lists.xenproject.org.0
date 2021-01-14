Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A0A2F69C5
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 19:41:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67480.120491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07YX-0001mZ-SW; Thu, 14 Jan 2021 18:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67480.120491; Thu, 14 Jan 2021 18:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l07YX-0001m8-Ob; Thu, 14 Jan 2021 18:41:13 +0000
Received: by outflank-mailman (input) for mailman id 67480;
 Thu, 14 Jan 2021 18:41:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0pGa=GR=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l07YW-0001ly-AM
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 18:41:12 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc72d694-982a-451d-ae97-28bf90d074a5;
 Thu, 14 Jan 2021 18:41:11 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id n16so6052036wmc.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Jan 2021 10:41:11 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id r20sm13389477wrg.66.2021.01.14.10.41.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 10:41:09 -0800 (PST)
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
X-Inumbo-ID: cc72d694-982a-451d-ae97-28bf90d074a5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=WwEY/vU2V94bNacnIqagq/uytof9Zlp3qUk/q3DXgP4=;
        b=M1hWdIwJuhyh3xGBsVEaXtGP/yQ5DpuNjXCMx38YCHjqRxIM0Ru42kNCyADXaW7x/K
         FLi85LRNjlzr3hZosxd9C+tK7TzjKg9g+xjPRfRrHAnI7SJmEES5Dwcr6/iZs7pthN6W
         hweH3E1CNb4IbAxjtY/66i2LN2VKJrN3L4v85v1wlbKF6n6YH2CWCQEDIej6cyvkiIbS
         bV9DI6iiMNFnmLL4uZ5qI0TalawD2/UwWV8u7b0Qex7v5iqnI91ryZDt9vHs5rpz66dT
         3AXa9THUqJrLj3Pcd6BqyDtZDFKcBeugDYzWHgkqRmTsAxD6kmBi+UIbX2LdyHGluMC8
         p9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WwEY/vU2V94bNacnIqagq/uytof9Zlp3qUk/q3DXgP4=;
        b=lttJ55m7ArCy1nQHEgfr2irk/Wh8TzKxw21IzyF/pjAi0WgYJ/pC3Sl5XkEKMNCMiF
         AIx9p/Fw9SnHSzbaUInN6fVVeYi+fL0dpzxvL/v94agNgb5ejCtM2KhBtOin9Wce6MGr
         YHvniXehq+kTTaK6Z/pn2t0udm22GbvG7DkSTOFfMWoAXyYcTpU2kiqyPzcpNyVOKyxz
         ESY/ImpT8hMSxX9Qo3hTSiYPwW514Yipt9D14osTCLQcB83e5uqiUL5ZQt5VONJXLEb8
         6z7IvOT8OxbqzGeMKcXuaAToh5EmNdQ1+LhhyVQrTB6M0jg5sWGZMRRPSE6XSh/KRTb+
         LACg==
X-Gm-Message-State: AOAM530LJZNOiLShDDmCG/fxclmPyDP/bSLBTDLSp7qoE1wGEbHe7KOO
	egQFPg7YeeKJwy+cJlA9D4B+cbQTtH86ng==
X-Google-Smtp-Source: ABdhPJxVjpqxRYNni8G3d3xNdo2RW64+O+Fr49p93w9fpEbHCiHZaiPzSj8QO3EeO6XqfVYqa/T6+A==
X-Received: by 2002:a1c:68d6:: with SMTP id d205mr5249415wmc.154.1610649670168;
        Thu, 14 Jan 2021 10:41:10 -0800 (PST)
Subject: Re: [PATCH V4 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <AM0PR08MB37471AF1CDF1B930A919C3449EA80@AM0PR08MB3747.eurprd08.prod.outlook.com>
 <d88f8dc5-da96-0efa-09f2-fb7884f2f703@gmail.com>
 <24567.7198.846779.557032@mariner.uk.xensource.com>
 <6f5a592f-10a5-059b-7d63-bf86764e3fbb@gmail.com>
 <24576.27952.975905.92719@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <28be223f-32b6-8be2-ca57-618c230743ed@gmail.com>
Date: Thu, 14 Jan 2021 20:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24576.27952.975905.92719@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 14.01.21 18:11, Ian Jackson wrote:

Hi Ian

> Hi, thanks for giving this update.
>
> Since you were the only person who took the time to send such an
> update I feel I can spend some time on trying to help with any
> obstacles you may face.

Thank you.


>    
> Hence this enquiry:
>
> Oleksandr writes ("Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking"):
>> I work on virtio-mmio on Arm which involves x86's IOREQ/DM features.
>> Currently I am working on making the said features common, implementing
>> missing bits, code cleanup an hardening, etc.
>> I don't think the virtio-mmio is a 4.15 material, but it would be great
>> have at least "common" IOREQ/DM in 4.15.
> ..
>>> P: your current estimate of the probability it making 4.15, as a %age
>> Difficult to say, it depends ...
>> RFC was posted Aug 3, 2020, The last posted version is V3. Currently I
>> am in the middle of preparing v4, still need to find a common ground for
>> few bits.
> So, I'm replying to V4 here.  Did you resolve your issues ?

I think, yes. I hope, I addressed all review сomments/requests for V3.


> What are the major outstanding risks to this series and do you need
> any help from the Xen Project (eg from me as Release Manager) ?

I would like to get the review for V4 for me to be able to make the 
required changes in time.
Last 2 patches could be skipped for now, I don't expect the VirtIO to be 
in 4.15
(I keep these patches for visibility reason and test purposes):
- libxl: Introduce basic virtio-mmio support on Arm
- [RFC] libxl: Add support for virtio-disk configuration
But, first 22 patches (IOREQ/DM) I would like to see in 4.15.

Also what worries me the most is that a quite big series hasn't been 
fully tested on x86 (only build tested).


>
> NB I have not been following this series in detail - I'm just looking
> at your mail and your 00/ posting and so on.  So if there is some
> blocker or risk I am probably unaware of it.
>
> I notice that there's one libxl RFC patch in there.  Since that's in
> my bailiwick I will try to review it soon.
Thank you, please note, this RFC patch is not a target for 4.15, no rush)
For the next version I will drop these VirtIO related patches.


-- 
Regards,

Oleksandr Tyshchenko


