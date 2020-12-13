Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE192D8D03
	for <lists+xen-devel@lfdr.de>; Sun, 13 Dec 2020 13:09:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51583.90577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC1-000135-PE; Sun, 13 Dec 2020 12:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51583.90577; Sun, 13 Dec 2020 12:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC1-00012g-M1; Sun, 13 Dec 2020 12:09:37 +0000
Received: by outflank-mailman (input) for mailman id 51583;
 Sun, 13 Dec 2020 11:24:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Nq2=FR=gmail.com=ttoukan.linux@srs-us1.protection.inumbo.net>)
 id 1koPU3-0005D3-AJ
 for xen-devel@lists.xenproject.org; Sun, 13 Dec 2020 11:24:11 +0000
Received: from mail-ej1-x642.google.com (unknown [2a00:1450:4864:20::642])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6f4dcfac-4207-437f-a444-4abf79e277e2;
 Sun, 13 Dec 2020 11:24:10 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id g20so18639388ejb.1
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 03:24:10 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id de12sm12533753edb.82.2020.12.13.03.24.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:24:08 -0800 (PST)
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
X-Inumbo-ID: 6f4dcfac-4207-437f-a444-4abf79e277e2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=IW66fMc7VTs1PtxS+22ry7ms1/9mizOXCdVTfKV5hpo=;
        b=bQn+oB1JoyeFOF0nG/mlAluMS+9oNaqRxA17ZBM9Oe3AOE8/JG6goH/EB1c4QkEda4
         T1lTzWqlfslNfkdjp202c07yMWPNGbIBbpqQZ+AzfJmqs+Kgj+dLxGZ+wWZGA5mc0NdB
         BijFlgEZnvzEJb3MGQPxQa2/dgeJuYhDvxuwz6QAxAIoRHfwl22d5quEoZXOhJp6a+qE
         ETivnglunAiRLTbK3ng7taHfwUqrNTJL3Mef8dDWPaAGgN2enm8bDppfomcBBDdM6fOw
         jt/C5/9LwS2YQBDgMwgsJ0z4C3ZaAE2+qiQJ4375nfTotPFrKA5zulfu7Q8I9D/Awk7+
         1yaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IW66fMc7VTs1PtxS+22ry7ms1/9mizOXCdVTfKV5hpo=;
        b=fYuwQNwZpAFqycgRUxR3vGff2Pbk4h7lh+vUcQwXP2j1HaAWxLN7o39qw6Oadyke1y
         E2K2G+sE4GBaJPm3ioUT+/sdhHW/yEQD11g5hdR/RmEQ9rXEQkVg2N17e27hyqFSh485
         AwRhh4W/fcRCRmPGSSihCI3aR0OXufBzOZFfcprt/Pn1pAaSfvswdwKTytyRf9j2aSHK
         4vWfjrZXdZptzOddR/DSKudShAyHTA6R65l34wXGD2xeL4QCI88WmcfjJq9L016eHZtg
         Bnu7CtmR8nccXbwvMaLL7zRZuZH+89N1P3c+mqgvWM37oNMJgmmbcqvFyqQ8r1crxNkL
         XHPg==
X-Gm-Message-State: AOAM532OUATXIkkDxQvthKow/a0sZYcnT3ffF0TEpqe1cLrF96J9U0Ra
	QqFPguek1PzHWLqQ87Ytd8OIlmSB/DvZ8w==
X-Google-Smtp-Source: ABdhPJynlxi2QKNBVsllMFmw4nuD/o/QttB0CiO5OzyzZ7oeGscU5QYtBXumKqp3eM2r1PK4665luQ==
X-Received: by 2002:a17:906:a2d0:: with SMTP id by16mr18015254ejb.207.1607858649230;
        Sun, 13 Dec 2020 03:24:09 -0800 (PST)
Subject: Re: [patch 20/30] net/mlx4: Replace irq_to_desc() abuse
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
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
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.580936243@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <01e427f9-7238-d6a8-25ec-8585914d32df@gmail.com>
Date: Sun, 13 Dec 2020 13:24:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.580936243@linutronix.de>
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
> Cc: Tariq Toukan <tariqt@nvidia.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>   drivers/net/ethernet/mellanox/mlx4/en_cq.c   |    8 +++-----
>   drivers/net/ethernet/mellanox/mlx4/en_rx.c   |    6 +-----
>   drivers/net/ethernet/mellanox/mlx4/mlx4_en.h |    3 ++-
>   3 files changed, 6 insertions(+), 11 deletions(-)
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks for your patch.

