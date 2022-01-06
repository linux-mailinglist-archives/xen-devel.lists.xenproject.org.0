Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C290F486873
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 18:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254185.435792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5WYB-0004I9-Gn; Thu, 06 Jan 2022 17:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254185.435792; Thu, 06 Jan 2022 17:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5WYB-0004Ft-DM; Thu, 06 Jan 2022 17:27:43 +0000
Received: by outflank-mailman (input) for mailman id 254185;
 Thu, 06 Jan 2022 17:27:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xiBy=RW=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1n5WY9-0004Fn-UO
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 17:27:41 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f333c908-6f15-11ec-81c0-a30af7de8005;
 Thu, 06 Jan 2022 18:27:40 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id j11so6459567lfg.3
 for <xen-devel@lists.xenproject.org>; Thu, 06 Jan 2022 09:27:40 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id bx39sm247241ljb.21.2022.01.06.09.27.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jan 2022 09:27:39 -0800 (PST)
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
X-Inumbo-ID: f333c908-6f15-11ec-81c0-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=6fQtBFlelzNvP94J1wnQ15C4wf9pReQr7LeXBGFOy/8=;
        b=eR3inorkUkhf/YIs7UEXunWXQ+3qt/3nfnsz6tW6Dl56JDuWUSjCiPTDmekeM5Msi3
         gzy+O9fF4wkBq3L6+uiSP5FHif8DXKY2OFW5Ixx9TDXJ/BlbKpA8PLQW1OSezJQ412wU
         JGu3qL0NaoBQZWP2Ti8DklDHQhY7RYtJybicXaawMepKcxIx7IGI68GUR69Sr7MQegjt
         h8KzFfO20RPN2OJI13D8Awd5B9kHtXIK8ZUrTfJZAhxbTU3DBLYH9ULckM4KjpEM8x2a
         84FHc2HoYv+D0ShwGkyc/OnzrH1f0V19VdOxbS1H6ae5o/8bTdQEyUWCIJIfjX9rtUCD
         qGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=6fQtBFlelzNvP94J1wnQ15C4wf9pReQr7LeXBGFOy/8=;
        b=I1h8cfzSuNub/7Laqma7xKmR+jis0chFY8Z7O6/uEnNCfyPy1OZGIii2UlL72EYSE1
         oVn3FtQ1vgpj2znBj3z8U0fzjBmXCDGcLSfv6GagWaCzTAbqP3oMFi1DUOfxsxoixZo6
         G8hsTCQjVBtdA0Zn8Fb3/wktLMn3iWo3GdJ1938ZJi74GViOg2qXUSS4Dxz7CR2N3u0a
         9AzV+dvZRORyWpPfKJi6TTHDpra6IRgrc+2wPJJPK+eXkp4TvGmKYyC5wvHeWD+39HYX
         24hvdDSyU7DCEIz17dNCR1udM5tH0qN58upQIS7mYt872mJYHomMea0FcwPDOGHUgFwm
         0ufQ==
X-Gm-Message-State: AOAM532X/7HoMd1KX+RBiBz8yvOnQE2PyHk2ekM1qDA5nDH7/Sb/7xAD
	d2G1a6Wa1tzwOHFVIaBGz2l4aTiAZ/4=
X-Google-Smtp-Source: ABdhPJywQyUN/DCSw+n1KQLNH9yTTt2fDpRVa5pkeN6hT3b2R5/S60vqJ4hYyuYeBF9hPxc8C/J/Uw==
X-Received: by 2002:a19:7b1d:: with SMTP id w29mr52372115lfc.674.1641490060205;
        Thu, 06 Jan 2022 09:27:40 -0800 (PST)
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
 <acfd7034-367c-4654-1e9c-49bd1f0da475@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7bf0ec95-21f6-e19d-836c-cdf010fba872@gmail.com>
Date: Thu, 6 Jan 2022 19:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <acfd7034-367c-4654-1e9c-49bd1f0da475@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 06.01.22 18:50, Jan Beulich wrote:

Hi Jan

> On 06.01.2022 17:30, Oleksandr wrote:
>> In case you don't have any other objections shall I re-push v5.1 with
>> proposed adjustments now?
> I'd suggest you wait for feedback by others. After all there may also
> be opposition to what I have said (in which case you'd go back and
> forth).

You are right.


>
> Jan
>
-- 
Regards,

Oleksandr Tyshchenko


