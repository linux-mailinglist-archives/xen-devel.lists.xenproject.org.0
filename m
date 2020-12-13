Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 148D72D8D06
	for <lists+xen-devel@lfdr.de>; Sun, 13 Dec 2020 13:09:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51590.90611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC3-00016i-DH; Sun, 13 Dec 2020 12:09:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51590.90611; Sun, 13 Dec 2020 12:09:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koQC2-00014x-W2; Sun, 13 Dec 2020 12:09:38 +0000
Received: by outflank-mailman (input) for mailman id 51590;
 Sun, 13 Dec 2020 11:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Nq2=FR=gmail.com=ttoukan.linux@srs-us1.protection.inumbo.net>)
 id 1koPfZ-0006Do-Tn
 for xen-devel@lists.xenproject.org; Sun, 13 Dec 2020 11:36:05 +0000
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd2c99b0-0959-44a4-96e4-bab4bb363a6e;
 Sun, 13 Dec 2020 11:36:05 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cm17so14164755edb.4
 for <xen-devel@lists.xenproject.org>; Sun, 13 Dec 2020 03:36:05 -0800 (PST)
Received: from [192.168.0.107] ([77.127.34.194])
 by smtp.gmail.com with ESMTPSA id ef11sm11222266ejb.15.2020.12.13.03.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Dec 2020 03:36:03 -0800 (PST)
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
X-Inumbo-ID: bd2c99b0-0959-44a4-96e4-bab4bb363a6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=yO3vpR//yJ3KukN+tPfw/ullrK0O2qQE7kKjDuWCMp8=;
        b=c6i+ahBjD9/Rh0qH45as2/C0d/Lv5nDMeI06jod3TPucN2QtiguKTRZxCznQ+jpaBW
         gvv5i+HN/z0qVNmozmLuRxtFAJ9V7+Ekywb7P9Eyni0NfuaKlPKyK+aL+VAfVSMYk6ET
         IsS0+k2gRUdseUfqRF/UdU5bAlwQl7B5WJwI1REXIqN2aaNIVtttoMQkfvNoRFm/NQ/2
         CwmCf0DUfVLjwlDCo2/HXyzoa2xfU2BeyMBSUUM5MgQ4udzSF7fTqhAJZgUGdY3OmduU
         Wly23cmVni7LPdYQgfxlnoj5hfppXocENHNXxV4IuuZv3YXWmfxmP1sbgWNiQqwcc5pM
         VImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yO3vpR//yJ3KukN+tPfw/ullrK0O2qQE7kKjDuWCMp8=;
        b=rGS5RWR64RNyKxhMKd+dGbzve6JJRxxkKmNJBRV1wXsaCHD/nrfxR/mMEXCshgWUxR
         2boDj9o69O0FSo1Z8SETgNx8EpQkD+yBc2C07tzaZH4ODKTPXsok/raQzdyqrO5GINat
         JToIBtV2TMzJN3/5Yx6fRVL0r7KE8BBqzI5Nl2rTP/xryuaXvUQ/L+h0Xd+vX6HGELmU
         bappG7f7TSmyRP66iflYjhvOEVsRwV2X7nQhRzdTgUMSDVexE2UmBAGO2zoIrOW74x0z
         rTLgHQYLXMxqAi4xlvfCh4pD42n+ICv9BYhWNpVPt/17KQzO7Wp1UZt9mr0cEEApRB3A
         Q8lg==
X-Gm-Message-State: AOAM533uTWRLxJIlf7PiJ9fq1g4KCA28rDLCM8/67GOXvUEKYgXhDZlB
	HTkyDBJu0AXZCLMAMXLSqFR4b10zLIqL4A==
X-Google-Smtp-Source: ABdhPJzH+/aSvmgK74NOHKHONm6dhSpADhiv/j9gb2Z3Pv7veSPcdPhRE3SKaG8WhajpgAcAsGPlGw==
X-Received: by 2002:a50:a6c9:: with SMTP id f9mr20130904edc.158.1607859364213;
        Sun, 13 Dec 2020 03:36:04 -0800 (PST)
Subject: Re: [patch 23/30] net/mlx5: Use effective interrupt affinity
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20201210192536.118432146@linutronix.de>
 <20201210194044.876342330@linutronix.de>
From: Tariq Toukan <ttoukan.linux@gmail.com>
Message-ID: <f0a01d6e-0333-e929-eabb-28cb444effe0@gmail.com>
Date: Sun, 13 Dec 2020 13:35:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210194044.876342330@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/10/2020 9:25 PM, Thomas Gleixner wrote:
> Using the interrupt affinity mask for checking locality is not really
> working well on architectures which support effective affinity masks.
> 
> The affinity mask is either the system wide default or set by user space,
> but the architecture can or even must reduce the mask to the effective set,
> which means that checking the affinity mask itself does not really tell
> about the actual target CPUs.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Saeed Mahameed <saeedm@nvidia.com>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: netdev@vger.kernel.org
> Cc: linux-rdma@vger.kernel.org
> ---
>   drivers/net/ethernet/mellanox/mlx5/core/en_main.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
> @@ -1998,7 +1998,7 @@ static int mlx5e_open_channel(struct mlx
>   	c->num_tc   = params->num_tc;
>   	c->xdp      = !!params->xdp_prog;
>   	c->stats    = &priv->channel_stats[ix].ch;
> -	c->aff_mask = irq_get_affinity_mask(irq);
> +	c->aff_mask = irq_get_effective_affinity_mask(irq);
>   	c->lag_port = mlx5e_enumerate_lag_port(priv->mdev, ix);
>   
>   	netif_napi_add(netdev, &c->napi, mlx5e_napi_poll, 64);
> 

Reviewed-by: Tariq Toukan <tariqt@nvidia.com>

Thanks.

