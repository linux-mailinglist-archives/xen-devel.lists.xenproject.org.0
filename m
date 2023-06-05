Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5797223D5
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 12:51:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543663.848822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67nH-00014c-Es; Mon, 05 Jun 2023 10:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543663.848822; Mon, 05 Jun 2023 10:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q67nH-00012Q-CE; Mon, 05 Jun 2023 10:50:35 +0000
Received: by outflank-mailman (input) for mailman id 543663;
 Mon, 05 Jun 2023 10:50:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qd4T=BZ=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1q67nF-00012K-Ao
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 10:50:33 +0000
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [2607:f8b0:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca6d12d0-038e-11ee-b232-6b7b168915f2;
 Mon, 05 Jun 2023 12:50:32 +0200 (CEST)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-656923b7c81so667991b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jun 2023 03:50:32 -0700 (PDT)
Received: from [157.82.204.254] ([157.82.204.254])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a170902e54d00b001ae4d4d2676sm6272139plf.269.2023.06.05.03.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jun 2023 03:50:30 -0700 (PDT)
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
X-Inumbo-ID: ca6d12d0-038e-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1685962230; x=1688554230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmUHC2X/5xgeg9Gp980CrWFXAoMRAZPv1CuhMek7zw8=;
        b=0dV4P4UTF5Q9yhG8Hcohc/pMx65ZG0pFLoodIBIwdU7YR1KI+oCKxZLQBQzjifRaOt
         CZiEKevZTADYkyKdFk+fKfogs1dWS5XtTTDbkhLbJqijkAfCvnBtzJei68AtyDWvea05
         kXrJhzcWwrhuqS3YhL1OEkUmUoAXm9nUZIB+7zZ7P92Ei0uBYlQRmUyQIXo0MlrZPZtl
         OQ878Y6um7CVdX47wxqKGytWFIh1kB3otMqkKZt20H9d72RLdohJ97dTufOKMsGiDcT7
         dY1zbzUdGXQXlsi/1w8L+Rqq+gXpRE3xxXKCWSE8h3geqyw6TBSrAAr6M9PCXYP6O/rM
         xqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685962230; x=1688554230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmUHC2X/5xgeg9Gp980CrWFXAoMRAZPv1CuhMek7zw8=;
        b=ZM/Ta3UXQMzTwtKoFjRjfMPR0/xQmIqtUYQhCdvbS6qdh6ZcXKluBKEdedsPIihAbK
         akSatj9fFyZFVh4anvB0A6P240qiPAa+751lM42IvpTm6NVHakbVcbtGKrGRQNAi1swY
         PSQQcTnqzfVHQRsbUkgf3IjNZotFFaNB8on6bnXY4jNqS8F37iBA8ijxCoNByZwqTNap
         8HIfM3b1mtvMpr3pWJieQ/bt3wBhZ8eEbWAnEuSchvlmr7MonqS/k7cVh9HC5OIQsUHd
         064ifHsYc4UGu59NAIqsPHdhcAtZTq4ldDnD4xf3fWPQoLu/mpA/ikAKqT486tKbRKqm
         DXBA==
X-Gm-Message-State: AC+VfDxWeE1ZjCSIfLw+ezcMzz7Ygmx7c+by0jqz0XFEZAyHoVRveguU
	7+fGaBUNGX6v6VJxBVuId4crkg==
X-Google-Smtp-Source: ACHHUZ4myq9SjYxBNw1DV8NVHWzyARqbiII86IsZDfKi4SnI6xYxVtrB50TdMEoqePj+nqbLx8E0AQ==
X-Received: by 2002:a05:6a20:3d81:b0:10c:4ff5:38b7 with SMTP id s1-20020a056a203d8100b0010c4ff538b7mr2290285pzi.6.1685962230533;
        Mon, 05 Jun 2023 03:50:30 -0700 (PDT)
Message-ID: <231083f0-9813-abfc-8e2a-61deca9ca68d@daynix.com>
Date: Mon, 5 Jun 2023 19:50:21 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
To: Alexander Bulekov <alxndr@bu.edu>
Cc: Mauro Matteo Cascella <mcascell@redhat.com>, P J P
 <pj.pandit@yahoo.co.in>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
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
 <20230605080616.ooanu5pk2pvs57yi@mozz.bu.edu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230605080616.ooanu5pk2pvs57yi@mozz.bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/06/05 17:06, Alexander Bulekov wrote:
> On 230601 1218, Akihiko Odaki wrote:
>> Recently MemReentrancyGuard was added to DeviceState to record that the
>> device is engaging in I/O. The network device backend needs to update it
>> when delivering a packet to a device.
>>
>> In preparation for such a change, add MemReentrancyGuard * as a
>> parameter of qemu_new_nic().
>>
>> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> 
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> One minor comment below.
> 
>> ---
>>   include/net/net.h             | 1 +
>>   hw/net/allwinner-sun8i-emac.c | 3 ++-
>>   hw/net/allwinner_emac.c       | 3 ++-
>>   hw/net/cadence_gem.c          | 3 ++-
>>   hw/net/dp8393x.c              | 3 ++-
>>   hw/net/e1000.c                | 3 ++-
>>   hw/net/e1000e.c               | 2 +-
>>   hw/net/eepro100.c             | 4 +++-
>>   hw/net/etraxfs_eth.c          | 3 ++-
>>   hw/net/fsl_etsec/etsec.c      | 3 ++-
>>   hw/net/ftgmac100.c            | 3 ++-
>>   hw/net/i82596.c               | 2 +-
>>   hw/net/igb.c                  | 2 +-
>>   hw/net/imx_fec.c              | 2 +-
>>   hw/net/lan9118.c              | 3 ++-
>>   hw/net/mcf_fec.c              | 3 ++-
>>   hw/net/mipsnet.c              | 3 ++-
>>   hw/net/msf2-emac.c            | 3 ++-
>>   hw/net/mv88w8618_eth.c        | 3 ++-
>>   hw/net/ne2000-isa.c           | 3 ++-
>>   hw/net/ne2000-pci.c           | 3 ++-
>>   hw/net/npcm7xx_emc.c          | 3 ++-
>>   hw/net/opencores_eth.c        | 3 ++-
>>   hw/net/pcnet.c                | 3 ++-
>>   hw/net/rocker/rocker_fp.c     | 4 ++--
>>   hw/net/rtl8139.c              | 3 ++-
>>   hw/net/smc91c111.c            | 3 ++-
>>   hw/net/spapr_llan.c           | 3 ++-
>>   hw/net/stellaris_enet.c       | 3 ++-
>>   hw/net/sungem.c               | 2 +-
>>   hw/net/sunhme.c               | 3 ++-
>>   hw/net/tulip.c                | 3 ++-
>>   hw/net/virtio-net.c           | 6 ++++--
>>   hw/net/vmxnet3.c              | 2 +-
>>   hw/net/xen_nic.c              | 4 ++--
>>   hw/net/xgmac.c                | 3 ++-
>>   hw/net/xilinx_axienet.c       | 3 ++-
>>   hw/net/xilinx_ethlite.c       | 3 ++-
>>   hw/usb/dev-network.c          | 3 ++-
>>   net/net.c                     | 1 +
>>   40 files changed, 75 insertions(+), 41 deletions(-)
>>
>> diff --git a/include/net/net.h b/include/net/net.h
>> index 1448d00afb..a7d8deaccb 100644
>> --- a/include/net/net.h
>> +++ b/include/net/net.h
>> @@ -157,6 +157,7 @@ NICState *qemu_new_nic(NetClientInfo *info,
>>                          NICConf *conf,
>>                          const char *model,
>>                          const char *name,
>> +                       MemReentrancyGuard *reentrancy_guard,
>>                          void *opaque);
> 
> Does it make sense to roll *reentrancy_guard into NICConf here?

Probably no. All members of NICConf are device properties the user 
configure, but reentrancy_guard is an internal state. Similarly, the 
opaque parameter is an internal state and not included in NICConf.

