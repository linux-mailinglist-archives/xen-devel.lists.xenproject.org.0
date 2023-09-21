Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E8D7A91F5
	for <lists+xen-devel@lfdr.de>; Thu, 21 Sep 2023 09:16:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606122.943867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjDvH-00021V-Kj; Thu, 21 Sep 2023 07:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606122.943867; Thu, 21 Sep 2023 07:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjDvH-0001zp-HC; Thu, 21 Sep 2023 07:16:27 +0000
Received: by outflank-mailman (input) for mailman id 606122;
 Thu, 21 Sep 2023 07:16:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vX/=FF=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qjDvG-0001zj-0n
 for xen-devel@lists.xenproject.org; Thu, 21 Sep 2023 07:16:26 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b4dcd0-584e-11ee-878a-cb3800f73035;
 Thu, 21 Sep 2023 09:16:21 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so4904415ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Sep 2023 00:16:21 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 jk12-20020a170903330c00b001bc930d4517sm688691plb.42.2023.09.21.00.16.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Sep 2023 00:16:20 -0700 (PDT)
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
X-Inumbo-ID: c3b4dcd0-584e-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1695280580; x=1695885380; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:to:references:cc
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtZnJWNLETty86cmt5G3BLku52AJOJobMcOTxivz8yE=;
        b=Q9i0zM6hhYtFwsRoMB1oOG4a8RkOxYpxA8ysF1Nj+0KrfnD+hjWkO51GsJHc/N1K4i
         HO3w06REnySAH0QC2tMBweuT3ItOMIHLEh8mPs360PVSoSSdedJlSpjNBDmOSLY0cwbR
         E5vUkkeEzONlENY8mBiYD8fJSvZ8u1Vg425orZh+I6aY7jcE+DaHD+zP4AaeHN+TqAr3
         y/0E7fDuYPXGHbePe5gwwoQvzugAnxpkcE0uBlgYqqmHlRlmSvqhI1uEoVqq2fvgguT+
         sU/pCT03qo5f2ZSs8Z0HFvpiXWcFPXYcQEcRrmJCmMm6y9gOYhczZC9y/7XLG8ItvYn5
         D/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695280580; x=1695885380;
        h=content-transfer-encoding:in-reply-to:from:to:references:cc
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gtZnJWNLETty86cmt5G3BLku52AJOJobMcOTxivz8yE=;
        b=KAqIq796S5T3/52UgGFCfXdXQzIGhP2zmth+OKq0Os4APmVXb8QQ2VcOq67IsdKMgf
         hvVSPTVXmgcEXTmFimO+jpxYXjk+pgdWT8c5aKdEM6zp9o+4sBbQNHFlRltz1KKZ7lDx
         XUYqEsNV4ujxIOc6vJBVSCOimaHSKGxZlGfo154rYvoOJzcE7jl9V2pFr1Q6zeDX4WsU
         AuDjwuwXdE/3pGM1f4ubVqYW4op9OrB7x9qgXHplHt7+yzHOoXEqZzQgXeBAq60hiQpe
         D6zY4xyP9wqtSGWY5dg5526VhD98l8BjlDaIUTH+tKsWkNr8TPEMPJxLUQH3tQLo3net
         IQOg==
X-Gm-Message-State: AOJu0YziWsZ8snHZXls+c7N8GBw5FhmCUERdrdNGoHUtvPclu8CoQ1my
	M9nAHoobsFvf7NMFiCDfPuTs3g==
X-Google-Smtp-Source: AGHT+IFp8SmlgBP8c+mRMAyR0w6VTD2Eh6KSEGcXkimXFn/Frnpi2Y+TlrFoKGccEOT8tgcZe9KSJQ==
X-Received: by 2002:a17:902:dac4:b0:1c3:fa9a:1e41 with SMTP id q4-20020a170902dac400b001c3fa9a1e41mr5409577plx.45.1695280580336;
        Thu, 21 Sep 2023 00:16:20 -0700 (PDT)
Message-ID: <a2cb6356-18b1-44d1-90a8-d137e8a25227@daynix.com>
Date: Thu, 21 Sep 2023 16:16:12 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] net: Update MemReentrancyGuard for NIC
Content-Language: en-US
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P
 <pj.pandit@yahoo.co.in>, Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 xen-devel@lists.xenproject.org
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
To: Jason Wang <jasowang@redhat.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230601031859.7115-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/06/01 12:18, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> This implementation follows what bottom half does, but it does not add
> a tracepoint for the case that the network device backend started
> delivering a packet to a device which is already engaging in I/O. This
> is because such reentrancy frequently happens for
> qemu_flush_queued_packets() and is insignificant.
> 
> This series consists of two patches. The first patch makes a bulk change to
> add a new parameter to qemu_new_nic() and does not contain behavioral changes.
> The second patch actually implements MemReentrancyGuard update.
> 
> V1 -> V2: Added the 'Fixes: CVE-2023-3019' tag
> 
> Akihiko Odaki (2):
>    net: Provide MemReentrancyGuard * to qemu_new_nic()
>    net: Update MemReentrancyGuard for NIC
> 
>   include/net/net.h             |  2 ++
>   hw/net/allwinner-sun8i-emac.c |  3 ++-
>   hw/net/allwinner_emac.c       |  3 ++-
>   hw/net/cadence_gem.c          |  3 ++-
>   hw/net/dp8393x.c              |  3 ++-
>   hw/net/e1000.c                |  3 ++-
>   hw/net/e1000e.c               |  2 +-
>   hw/net/eepro100.c             |  4 +++-
>   hw/net/etraxfs_eth.c          |  3 ++-
>   hw/net/fsl_etsec/etsec.c      |  3 ++-
>   hw/net/ftgmac100.c            |  3 ++-
>   hw/net/i82596.c               |  2 +-
>   hw/net/igb.c                  |  2 +-
>   hw/net/imx_fec.c              |  2 +-
>   hw/net/lan9118.c              |  3 ++-
>   hw/net/mcf_fec.c              |  3 ++-
>   hw/net/mipsnet.c              |  3 ++-
>   hw/net/msf2-emac.c            |  3 ++-
>   hw/net/mv88w8618_eth.c        |  3 ++-
>   hw/net/ne2000-isa.c           |  3 ++-
>   hw/net/ne2000-pci.c           |  3 ++-
>   hw/net/npcm7xx_emc.c          |  3 ++-
>   hw/net/opencores_eth.c        |  3 ++-
>   hw/net/pcnet.c                |  3 ++-
>   hw/net/rocker/rocker_fp.c     |  4 ++--
>   hw/net/rtl8139.c              |  3 ++-
>   hw/net/smc91c111.c            |  3 ++-
>   hw/net/spapr_llan.c           |  3 ++-
>   hw/net/stellaris_enet.c       |  3 ++-
>   hw/net/sungem.c               |  2 +-
>   hw/net/sunhme.c               |  3 ++-
>   hw/net/tulip.c                |  3 ++-
>   hw/net/virtio-net.c           |  6 ++++--
>   hw/net/vmxnet3.c              |  2 +-
>   hw/net/xen_nic.c              |  4 ++--
>   hw/net/xgmac.c                |  3 ++-
>   hw/net/xilinx_axienet.c       |  3 ++-
>   hw/net/xilinx_ethlite.c       |  3 ++-
>   hw/usb/dev-network.c          |  3 ++-
>   net/net.c                     | 15 +++++++++++++++
>   40 files changed, 90 insertions(+), 41 deletions(-)
> 

Hi Jason,

Can you review this series?

Regards,
Akihiko Odaki

