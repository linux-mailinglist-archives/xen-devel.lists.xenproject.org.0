Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C26309577
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jan 2021 14:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78879.143604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qYH-0004DA-1Z; Sat, 30 Jan 2021 13:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78879.143604; Sat, 30 Jan 2021 13:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5qYG-0004Cl-UR; Sat, 30 Jan 2021 13:44:36 +0000
Received: by outflank-mailman (input) for mailman id 78879;
 Sat, 30 Jan 2021 13:44:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbaL=HB=unikie.com=jukka.kaartinen@srs-us1.protection.inumbo.net>)
 id 1l5qYF-0004Cg-4V
 for xen-devel@lists.xenproject.org; Sat, 30 Jan 2021 13:44:35 +0000
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0dc5ba1-d991-4376-a4d6-dc8500df7c6c;
 Sat, 30 Jan 2021 13:44:34 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id f2so13802858ljp.11
 for <xen-devel@lists.xenproject.org>; Sat, 30 Jan 2021 05:44:34 -0800 (PST)
Received: from [192.168.1.76] (91-153-193-91.elisa-laajakaista.fi.
 [91.153.193.91])
 by smtp.gmail.com with ESMTPSA id q190sm2926467ljb.8.2021.01.30.05.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Jan 2021 05:44:32 -0800 (PST)
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
X-Inumbo-ID: b0dc5ba1-d991-4376-a4d6-dc8500df7c6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xfXOO3GL2aLPYrGLEwdVNZPk3WH9JxYwIB1uGaOGMns=;
        b=XhexPhGN26xqQP0bcSXfb3FsE84N1AVjdYUGNLvgY1pUzJ7GvTV2tQGiWwwv6ybYiO
         XkiHly/T90mYefL7l60LrdJ7amXzl5LDe7D+8UlB+A2Fg9xrUFRu3EMqhmdQdWkmsqSp
         MkGZXCgn+9gI3kmD6mYtK/rwsndHUFx56D2N0lVqDLYf6/uQq8a34InrcvKl378s7ot/
         M0JnXVqgganI0c90DriDRGScyIEBKG+mt6mPWQQoftZrXsHlWis/a0oUHD2bJTHX2Y6A
         4Eq6FFPr9ZUv8Fj9SUBnBmAC5Qj4YNoaBP7SWHHCyc6Lb3vhJ2ovjxjqtHWw0dH6gigO
         0X3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xfXOO3GL2aLPYrGLEwdVNZPk3WH9JxYwIB1uGaOGMns=;
        b=LoORnWfwGeXnPO3wXMmWmVntkK0DXId6rMt7QX9iKzrOJScRzi4Zv/a+3/yYYXs2Zv
         FLLVWHoTr/qN7c7ABgOw4cajZGLTeOcKk53egj4Dqokh9mRLB1gDZ4PI3IHTc2WmxcyD
         x0ZEieYaVKpSx9IoZK680apebDG8Rq0fvvPXEPHtrkxq8fihPoBOhDeoVVijcU6LRbc3
         rkhwcfaawEdbateKw1eJ/HC28UAxzHvfLjquuqpjTtwzmDhEL5Mc2OwMUqUPqqwrpJhD
         PiY2PwWTn9o6kLvcGjyZ1AdyjuBDcdqK0ippEaSTvX6FdTJOUNbXfSUJ+yCfLjna9AfM
         QHFw==
X-Gm-Message-State: AOAM5315Js+Lrkl4+0VkJO/ujzsrl9jcdd7klEK50J5XoYqXMO7IauEg
	+010Z6+xQ2GCpsa/orqN0bCO6Q==
X-Google-Smtp-Source: ABdhPJz6UvrGH4vkHI0FXJpoNHUJrYHvLiZu/PxTYd6LRy6n5IKRje6nh9vHQ4YafmS0MR6dPTW1NA==
X-Received: by 2002:a2e:b017:: with SMTP id y23mr5168475ljk.366.1612014272756;
        Sat, 30 Jan 2021 05:44:32 -0800 (PST)
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
 <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <alpine.DEB.2.21.2101271707570.9684@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2101291740190.9684@sstabellini-ThinkPad-T480s>
From: Jukka Kaartinen <jukka.kaartinen@unikie.com>
Message-ID: <404be2c1-79da-acd1-ca04-2e12f65fa664@unikie.com>
Date: Sat, 30 Jan 2021 15:44:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101291740190.9684@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 30.1.2021 3.42, Stefano Stabellini wrote:
> On Wed, 27 Jan 2021, Stefano Stabellini wrote:
>> FYI I have just ordered a micro HDMI cable so I might be able to provide
>> more useful feedback in the following days.
> 
> What did you use to setup the graphic environment? Is it Ubuntu or
> Raspbian? I am having issues setting up a distro with a "startx" that
> works.
> 
I'm using Ubuntu mate. Plain Ubuntu seemed to be quite slow.
Btw. we noticed that cpufreq stays at 600MHz if it is not forced from 
the config.txt

arm_freq=1500
force_turbo=1


This kernel trace might be related.
[    0.746502] cpufreq-dt cpufreq-dt: failed register driver: -19


