Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799B8B06EA
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 12:06:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711300.1111154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZVq-00089B-Az; Wed, 24 Apr 2024 10:06:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711300.1111154; Wed, 24 Apr 2024 10:06:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzZVq-00086l-7f; Wed, 24 Apr 2024 10:06:02 +0000
Received: by outflank-mailman (input) for mailman id 711300;
 Wed, 24 Apr 2024 10:06:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9EIa=L5=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1rzZVo-00086f-CK
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 10:06:00 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7faec8-0222-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 12:05:59 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-343c7fae6e4so5869181f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 03:05:59 -0700 (PDT)
Received: from [192.168.1.102] (mon75-h03-176-184-51-42.dsl.sta.abo.bbox.fr.
 [176.184.51.42]) by smtp.gmail.com with ESMTPSA id
 j13-20020a056000124d00b0034b7906c716sm3564205wrx.106.2024.04.24.03.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 03:05:58 -0700 (PDT)
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
X-Inumbo-ID: 3f7faec8-0222-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713953158; x=1714557958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJeq6fIxiiTYHpTB+2A2F57sm5CMyZXLKrdNd8XZ0VU=;
        b=ot+OASrB1RS265/oVZ9gZT92maOt4lH7R2y+5+iiCKhZpz3ED06qh8GkOrU8pZI3dB
         i/SidvUSxaHpkKZrjgmsM/bXqLpfIHaFQDpDcK6wzUCGFGlWNxeUDH/KjUZff0BEr8gI
         wpIOW79X5cknd1pd/2WgMAmf5snal37CrL5LE4E8J03QpdfaUalH/1VPgCMyY6NvsbN4
         JdNu1OUMkbjiexRtssO+ibnfjv0OfTeytrpnzotw9QmAQ13rsWyMBQssWP7pfS4AfOPU
         Uoza1W0BZ/PczjNcC3kmy5PAh6PmnP02SxU4xlHe1gt74p7vcpvHaNCQxT0cGw/qtYwG
         ql3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713953158; x=1714557958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJeq6fIxiiTYHpTB+2A2F57sm5CMyZXLKrdNd8XZ0VU=;
        b=Qwa/seVhyF9wB8IHPAFCpgMVgiHK9P8UNzmqyrACfXxNoRgzkpXV+ZmLECVeEjrz0O
         u1FFWTw4u5+a5eHEG3iJzHTSps5ThSIMfQvIhgUFnlqxnE+Hhj+GD4YDsFFK6v7j+98k
         rAND9uRlufPi8B2aL+cWJJXsonO1upuXET4IL3ZlGdFnsi8OM31VIuuS28xUPKx8ABik
         w7lnTUqEkaUJoW5N/QZlSLn5YluU8cYY4qvaCI4O4D143m6X/EqlQZBJqyBH+QEEgy7e
         GnoggDAxySdNu56ERbRVzD0Fh0F2iwhY/yjpRO4fi3wq8fXQSmtxYyGs1/JDSNTHz7NH
         pzdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH0Lo1GPpaLxJeFySd44URsMm9o20aHKfNljICji9OeOLqaBOvReGeM4V8GpAdRUwYOOlgsIMZ25nq6l8kgGBQLi2AgSi+M4R/MbnQURo=
X-Gm-Message-State: AOJu0YwtuKXgC43OudmKxlMesyM+xLqNxdoUcSUXF6cnS92rU9CmQpRI
	EXq6ahfu8cfnVW2PvbhPW3l5ZH8obJPvRvvOsI9Q3jtdgptczMk3r/1tQ966MHE=
X-Google-Smtp-Source: AGHT+IGRwoNvywezgAtvjGv1mnC+Z4/ri35VrWRJslP2OcATQLz8PEMyGT2jE+F1RXzBdZ9zsCTNAw==
X-Received: by 2002:adf:f809:0:b0:33e:7f51:c2f8 with SMTP id s9-20020adff809000000b0033e7f51c2f8mr1482384wrp.36.1713953158508;
        Wed, 24 Apr 2024 03:05:58 -0700 (PDT)
Message-ID: <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
Date: Wed, 24 Apr 2024 12:05:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
To: P J P <pj.pandit@yahoo.co.in>, Mauro Matteo Cascella
 <mcascell@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
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
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20230601031859.7115-2-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 1/6/23 05:18, Akihiko Odaki wrote:
> Recently MemReentrancyGuard was added to DeviceState to record that the
> device is engaging in I/O. The network device backend needs to update it
> when delivering a packet to a device.
> 
> In preparation for such a change, add MemReentrancyGuard * as a
> parameter of qemu_new_nic().

An user on IRC asked if this patch is related/fixing CVE-2021-20255,
any clue?

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   include/net/net.h             | 1 +
>   hw/net/allwinner-sun8i-emac.c | 3 ++-
>   hw/net/allwinner_emac.c       | 3 ++-
>   hw/net/cadence_gem.c          | 3 ++-
>   hw/net/dp8393x.c              | 3 ++-
>   hw/net/e1000.c                | 3 ++-
>   hw/net/e1000e.c               | 2 +-
>   hw/net/eepro100.c             | 4 +++-
>   hw/net/etraxfs_eth.c          | 3 ++-
>   hw/net/fsl_etsec/etsec.c      | 3 ++-
>   hw/net/ftgmac100.c            | 3 ++-
>   hw/net/i82596.c               | 2 +-
>   hw/net/igb.c                  | 2 +-
>   hw/net/imx_fec.c              | 2 +-
>   hw/net/lan9118.c              | 3 ++-
>   hw/net/mcf_fec.c              | 3 ++-
>   hw/net/mipsnet.c              | 3 ++-
>   hw/net/msf2-emac.c            | 3 ++-
>   hw/net/mv88w8618_eth.c        | 3 ++-
>   hw/net/ne2000-isa.c           | 3 ++-
>   hw/net/ne2000-pci.c           | 3 ++-
>   hw/net/npcm7xx_emc.c          | 3 ++-
>   hw/net/opencores_eth.c        | 3 ++-
>   hw/net/pcnet.c                | 3 ++-
>   hw/net/rocker/rocker_fp.c     | 4 ++--
>   hw/net/rtl8139.c              | 3 ++-
>   hw/net/smc91c111.c            | 3 ++-
>   hw/net/spapr_llan.c           | 3 ++-
>   hw/net/stellaris_enet.c       | 3 ++-
>   hw/net/sungem.c               | 2 +-
>   hw/net/sunhme.c               | 3 ++-
>   hw/net/tulip.c                | 3 ++-
>   hw/net/virtio-net.c           | 6 ++++--
>   hw/net/vmxnet3.c              | 2 +-
>   hw/net/xen_nic.c              | 4 ++--
>   hw/net/xgmac.c                | 3 ++-
>   hw/net/xilinx_axienet.c       | 3 ++-
>   hw/net/xilinx_ethlite.c       | 3 ++-
>   hw/usb/dev-network.c          | 3 ++-
>   net/net.c                     | 1 +
>   40 files changed, 75 insertions(+), 41 deletions(-)


