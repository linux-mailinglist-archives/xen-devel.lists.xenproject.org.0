Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B064C2ED3B4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 16:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62956.111713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXTO-0004nL-CP; Thu, 07 Jan 2021 15:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62956.111713; Thu, 07 Jan 2021 15:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxXTO-0004mw-9A; Thu, 07 Jan 2021 15:45:14 +0000
Received: by outflank-mailman (input) for mailman id 62956;
 Thu, 07 Jan 2021 15:45:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c2+O=GK=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kxXTM-0004mr-NT
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 15:45:12 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a42fa11-f76b-46af-9552-8e5e470f8053;
 Thu, 07 Jan 2021 15:45:11 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id l11so15687248lfg.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Jan 2021 07:45:11 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t3sm1217401lfe.263.2021.01.07.07.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 07:45:09 -0800 (PST)
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
X-Inumbo-ID: 4a42fa11-f76b-46af-9552-8e5e470f8053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=OnS5rTIyKAoe/Q+H/eVLqBUtownc6+MH3ifL+Uvmbh0=;
        b=Hw/Rmo4bl9/GTizBwVGJ4zl8ZM7ky3eNI5Tt9PNJLGEzhXEwfLsprIR14RY2hW6XTL
         Wpfdbh6JeszAc7wi6q1gqUEonyRNAB8j7xa+6/JVQpulyqWANpVmxiuPGUwj8dtcY0m+
         rqBS4HRraB/XMDucEMBWavVc0j8HlDNWcX78TezmfxHj7a8OwPTjRR+A+4ROwiQJm/b2
         PWN+b6U6nWFwqp4hsJcnv3OW22eJuJ7osvWb9SuGaq8qmG9sEW2bIqh2bIV7RoO4bF+9
         w6FA7H3cL4xCy1NkJDNVvh09kq6pNWSIdEFl2lZ0xPnuOI+VKB9uSblcTlY8P5yWVmRm
         F2/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=OnS5rTIyKAoe/Q+H/eVLqBUtownc6+MH3ifL+Uvmbh0=;
        b=NG0Ls373mJPUks1siFDcmMxTN7oSEZvVomEBVFAoOXgVNQRoqjE8mHaBftoTLuFbVN
         ZuI2nUNEYeWQXC5bf8sTPcECEq40HTTPXm6zkOLu/L/ukWk4PpCZXRZ0o3Q21S0/j+Z3
         ClipCctJ/NLYV98LQ8OmrOI7JtrWiFcF+snM+vmEETTIoxJLzxAhftvpR1vEoDZME3oV
         57ZEQYDMTTNAWxQdPgzeCpYSGlfylNUWJ65PG2fruZWZ9XdNp4h4PfpdC7IxGzQRdP8+
         ua1xLgyoEoEwvG0+kGLYEu9pw64kGCPgQZMA1uxcI3i4hnErWDRMZKkFIXw/GA3BVV0Y
         Y8bA==
X-Gm-Message-State: AOAM532ducf5vZfVr5p2c+oHHhtk0qEzgeahB2/YIDPfRStw0UEZf3QX
	HrsAUQf+1jjGRH35vFRPxKPf0TVwkoc=
X-Google-Smtp-Source: ABdhPJw+xR/HWSfJ1h/WY2o5ZCDmJwFZ/kron8pssoF8T84/eUYlbp27gpfv/WL0V50pHshkTDyhcQ==
X-Received: by 2002:a2e:2f16:: with SMTP id v22mr4263707ljv.198.1610034310109;
        Thu, 07 Jan 2021 07:45:10 -0800 (PST)
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6f5a592f-10a5-059b-7d63-bf86764e3fbb@gmail.com>
Date: Thu, 7 Jan 2021 17:45:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24567.7198.846779.557032@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 07.01.21 16:35, Ian Jackson wrote:

Hi Ian

> Hi.  As the Release Manage for Xen 4.15 I am going to start tracking
> the status of features which people are looking to get into Xen 4.15.
>
> NB that the Last Posting Date is just over a week from now.
>
> If you are working on a feature you want in 4.15 please let me know
> about it.

I work on virtio-mmio on Arm which involves x86's IOREQ/DM features.
Currently I am working on making the said features common, implementing 
missing bits, code cleanup an hardening, etc.
I don't think the virtio-mmio is a 4.15 material, but it would be great 
have at least "common" IOREQ/DM in 4.15.


> Ideally I'd like a little stanza like this:
>
> S: feature name


The corresponding thread named:
IOREQ feature (+ virtio-mmio) on Arm
https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg87002.html

> O: feature owner (proponent) name
> E: feature owner (proponent) email address

Julien as initiator of this activity, me as a person who continues this 
activity and tries to get it upstreamed:
Julien Grall <julien@xen.org>
Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>


> P: your current estimate of the probability it making 4.15, as a %age

Difficult to say, it depends ...
RFC was posted Aug 3, 2020, The last posted version is V3. Currently I 
am in the middle of preparing v4, still need to find a common ground for 
few bits.


>
> But free-form text is OK too.  Please reply to this mail.
>
> NB the primary responsibility for driving a feature's progress to meet
> the release schedule, lies with the feature's proponent(s).
>
> As a reminder, here is the release schedule:
>
>   Friday 15th January    Last posting date
>
>       Patches adding new features should be posted to the mailing list
>       by this cate, although perhaps not in their final version.
>
>   Friday 29th January    Feature freeze
>    
>       Patches adding new features should be committed by this date.
>       Straightforward bugfixes may continue to be accepted by
>       maintainers.
>
>   Friday 12th February **tentatve**   Code freeze
>
>       Bugfixes only, all changes to be approved by the Release Manager.
>
>   Week of 12th March **tentative**    Release
>       (probably Tuesday or Wednesday)
>
> Any patches containing substantial refactoring are to treated as
> new features, even if they intent is to fix bugs.
>
> Freeze exceptions will not be routine, but may be granted in
> exceptional cases for small changes on the basis of risk assessment.
> Large series will not get exceptions.  Contributors *must not* rely on
> getting, or expect, a freeze exception.
>
> The codefreeze and release dates are very much provisional and will be
> adjusted in the light of apparent code quality etc.
>
> If as a feature proponent you feel your feature is at risk and there
> is something the Xen Project could do to help, please consult me or
> the Community Manager.  In such situations please reach out earlier
> rather than later.
>
> Ian.
>
-- 
Regards,

Oleksandr Tyshchenko


