Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A6B42ABD1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 20:24:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207622.363509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMQN-0004BA-Py; Tue, 12 Oct 2021 18:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207622.363509; Tue, 12 Oct 2021 18:22:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maMQN-00049N-MT; Tue, 12 Oct 2021 18:22:51 +0000
Received: by outflank-mailman (input) for mailman id 207622;
 Tue, 12 Oct 2021 18:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P4MT=PA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1maMQM-00049H-Ro
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 18:22:50 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a670779-b422-481e-846e-22db4d041820;
 Tue, 12 Oct 2021 18:22:50 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id j5so693051lfg.8
 for <xen-devel@lists.xenproject.org>; Tue, 12 Oct 2021 11:22:49 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a6sm1182377ljd.67.2021.10.12.11.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Oct 2021 11:22:48 -0700 (PDT)
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
X-Inumbo-ID: 0a670779-b422-481e-846e-22db4d041820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1sRuanqPDnAouqY4cGCjF1ATT7nCyQH8JV9jvCp8Cqo=;
        b=jO2XfnYWO7GB159UFynHxNSjWlacymT5Nq/9MWp/KBmj7bRBUgYbVqKR27EKqA4hps
         P3pL5P96VdFXU9mYOrzj03SOCpsnkevpbkysyCrY0xPnf6lA2DTehUNcPH0D3qyX4aWd
         b1DdjcMb2QgkDrOagmyI2STzMHE3U37yx/eLt0GzRV9I2bp8KgqqNBiM4W+wiJPUYLWj
         2fJ9tRB2tQFcRr0yWf39D2HOGWC8br5hKUsVcBuqqAIdOQHymNSeiJnsbKDdzuKHS/DY
         Rwkfqeb5e62R0tRYNa2GFBN2vkxFDycgigif2h4HEfJrJvg+mtf/+D1mul25H0ldmvw2
         2gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1sRuanqPDnAouqY4cGCjF1ATT7nCyQH8JV9jvCp8Cqo=;
        b=o1YpV7swHKobB1y0lvkXmRT8x23VD3FPfC8U12YU41+1ckvXBGWAzfwXa1+qbDAA0W
         ARFrSOXcxb5fotwdOb/88uaHKR9PQUjZK9OzOKCCGa//R5uudLrs3hueUyS4tDbQ4zj9
         KPjfb/ZWsN6Ld9aW/SFQV4WUnA2L6CFj93lteDB02irPV5SgUczKwUOHrUOYJcPnT6Bx
         OoAEIzMMiTqRaAgF2mw9DhL7UlKMtROe14JD5Zy7OwLlMumr4v+ejXhabfuxlaBxOMba
         1hMVmL+KDBOv/2VQPOxXm8arZOVfWmXguZHZ23IqzghoOGxj8uQdu21UKJvj/xKAsu+Y
         tKPA==
X-Gm-Message-State: AOAM530EekjorEXsd4VIVs/A+rTGhKwKtu0Im3bwV/Ry7W5Nkq6L2jgv
	ouepcSO+M6tgKssz/X/S0WE=
X-Google-Smtp-Source: ABdhPJyeaOhoVJJVy6NUV/D4SIv1JjeGDjVYj3cuk6FZJ5Q2VLeB+/twvR/qGl/ExJZ+hts7QHtlBA==
X-Received: by 2002:a2e:a443:: with SMTP id v3mr22873367ljn.101.1634062968943;
        Tue, 12 Oct 2021 11:22:48 -0700 (PDT)
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <24933.42667.311553.565032@mariner.uk.xensource.com>
 <60541d52-4b44-e212-cc06-bb41e9ce67f9@gmail.com>
 <24933.46428.243423.112077@mariner.uk.xensource.com>
 <0392bca6-4eb1-bc07-ecc9-fa1def156bfa@gmail.com>
 <24933.52939.127687.784369@mariner.uk.xensource.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <9e6e1378-7ee3-b692-b57d-29b597160661@gmail.com>
Date: Tue, 12 Oct 2021 21:22:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <24933.52939.127687.784369@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.10.21 21:07, Ian Jackson wrote:

Hi Ian

> Oleksandr writes ("Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct xen_domctl_getdomaininfo"):
>> Please note, it is going to be a new version of this patch based on
>> today's discussion with Jan.
> OK.  Please retain my R-b if you don't change any of the tools parts.

Sure, thanks for confirming. There won't be no new changes for the tools.


>
> Ian.

-- 
Regards,

Oleksandr Tyshchenko


