Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2252D8D05
	for <lists+xen-devel@lfdr.de>; Sun, 13 Dec 2020 13:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51588.90598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC2-000152-Ok; Sun, 13 Dec 2020 12:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51588.90598; Sun, 13 Dec 2020 12:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC2-00013r-CY; Sun, 13 Dec 2020 12:09:38 +0000
Received: by outflank-mailman (input) for mailman id 51588;
 Sun, 13 Dec 2020 11:34:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Nq2=FR=gmail.com=ttoukan.linux@srs-us1.protection.inumbo.net>)
 id 1koPdi-0006Bt-El
 for xen-devel@lists.xenproject.org; Sun, 13 Dec 2020 11:34:10 +0000
Received: from mail-ej1-x644.google.com (unknown [2a00:1450:4864:20::644])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fc9ef54-38a7-43ef-b2ce-9294d4b6af47;
 Sun, 13 Dec 2020 11:34:09 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id ce23so18611951ejb.8
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 03:34:09 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id r21sm1242331eds.91.2020.12.13.03.34.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:34:08 -0800 (PST)
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
X-Inumbo-ID: 3fc9ef54-38a7-43ef-b2ce-9294d4b6af47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=32JDNSeqhHqyIaOh/qzFvhnj5b/m+w8QZFr6dtEN8Bw=;
        b=dTA8b5OUH5yKZKYvrwD8FPaAH1qo6ziTqTgli2eWV/QQwwjrj5RItxhiVtWCYn5J4r
         iU5u2+H3CEqrvgOG4ifSiMinjtA03OpWth2tg99EZKrbp/XHweTnJDEVAsFXw8BEi/2k
         62/n48qL7LWG8Lg/TWLV8Ekvi2YV2XdqZDT6dMQ7h03xg9aGRIuNRGCnlY5Zc5d3YnN9
         nNHTJNN2xuMH7nQvu9FSiVhtrlE/Mw87dMJ3GteW8ox/7IYneqfAWtuLpskhNM3GN80O
         a83qBHYHs8rA5sz+ldeezNiCzs60YSlz4P6KTdIerqBLo/hvBarQx+UVsAPAPvEcyL2G
         H9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=32JDNSeqhHqyIaOh/qzFvhnj5b/m+w8QZFr6dtEN8Bw=;
        b=rUlC+0T/RWlO6cPdXx6eva7Dcjdw75EJ2gAfM7taCYhiSEn44PfrLJfxRVXVfzwSi3
         8UeUfBa9amnMb8oGGYpWNSOmQXGsRh3rqoOLswLxBgg9zDOazhK4IARuyzLa+M5p92AP
         6ulpTcpnXOetZ2FRNHFuoRfGL3xPoMDZFCmPwStZ9aBmvHImFn0yL+73mfAPfcbu5Arx
         2fFJplneKPbHi7Wz40wWGlhsj66CKnli7JJrKHuAtg5miJEGyXRckSaUpNousxlS/E0P
         Rz39yE+Pj1Gd+++04r3Ct96wxeqKVXS72pSpmiW8GGhVn7GfXeqdgt3u6EZz62tpaGBb
         5usQ==
X-Gm-Message-State: AOAM531Sa0Blfw1s52tSk6P5hZzYYyWkkOSY5owFLTtbpWMRQ89G5oJb
	9pWHW9sajEX9KBEWSJRW2J3cv8w4yqrQeg==
X-Google-Smtp-Source: ABdhPJy0f+aRaj1FvtAzME5ZsGleR5z0tMVYyWtlz18MxubIwHyo0udN2mZLmYeJ/0XwIck0k7j0dQ==
X-Received: by 2002:a17:906:85cf:: with SMTP id i15mr10621618ejy.373.1607859248729;
        Sun, 13 Dec 2020 03:34:08 -0800 (PST)
Subject: Re: [patch 22/30] net/mlx5: Replace irq_to_desc() abuse
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.769458162@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <02be0e10-f2b5-7cbb-3271-4d872616ffd4@gmail.com>
Date: Sun, 13 Dec 2020 13:34:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.769458162@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/10/2020 9:25 PM, Thomas Gleixner wrote:
> No driver has any business with the internals of an interrupt
> descriptor. Storing a pointer to it just to use yet another helper at the
> actual usage site to retrieve the affinity mask is creative at best. Just
> because C does not allow encapsulation does not mean that the kernel has no
> limits.
> 
> Retrieve a pointer to the affinity mask itself and use that. It's still
> using an interface which is usually not for random drivers, but definitely
> less hideous than the previous hack.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en.h      |    2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>   drivers/net/ethernet/mellanox/mlx5/core/en_txrx.c |    6 +-----
>   3 files changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.

