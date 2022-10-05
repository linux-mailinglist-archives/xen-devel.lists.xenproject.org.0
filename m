Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 665335F595B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Oct 2022 19:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.416378.661033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8VX-0003ih-CQ; Wed, 05 Oct 2022 17:48:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 416378.661033; Wed, 05 Oct 2022 17:48:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1og8VX-0003fN-9W; Wed, 05 Oct 2022 17:48:35 +0000
Received: by outflank-mailman (input) for mailman id 416378;
 Wed, 05 Oct 2022 17:48:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QTo3=2G=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1og8VV-0003fH-Tr
 for xen-devel@lists.xenproject.org; Wed, 05 Oct 2022 17:48:33 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edf09bb1-44d5-11ed-964a-05401a9f4f97;
 Wed, 05 Oct 2022 19:48:33 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id nb11so37079026ejc.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Oct 2022 10:48:33 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 ee32-20020a056402292000b0044e7862ab3fsm4320697edb.7.2022.10.05.10.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 10:48:31 -0700 (PDT)
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
X-Inumbo-ID: edf09bb1-44d5-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7vmkKrcbukpzojz/C0yPU7kDNmejVOGQprU/+VGjPg=;
        b=dVi25dvodr8t/gBegAqLu+rK8KzgAh4keTp2/KK7+Fje72aOUSQprjCW9gEVTRPyjx
         tAR/dx3QTfQXRA6VPY4wpM3my7uLryBptIJgQEwf488NAfjAoP8LVPe8RNH3JH2nF7sx
         aSCqpz5VQahY6uVL7dwnQMyPVmiXdxxw0KbZxftvRhnAbhmWO/tMzRIJy/UhRt5/60f2
         DCQUCakAm6HPmMzYpnTSZVSIwee3DWyUMQHfzVhPsxXN3b2Nl7nX2LF2JoXdLaGHNfxB
         H+UxR4u7ojJZ444EYA93u8Pv20FyYp56cTV856Mn9ZVwPFmHgjPuzwjeAMe7GKYfUEZZ
         da9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7vmkKrcbukpzojz/C0yPU7kDNmejVOGQprU/+VGjPg=;
        b=x1RFQMx3GNkcezm9QjXQ4mq6JoaNgZUMJVivzY31TYsN7YR2bhxipwmvL4s/e3+V3m
         H0xbT6n/jOt3faKWofCtlyaz5Yt4pDGOYKu7FpaswOoELfbN6l5J5EjFbwwQUKDevY96
         EiJOWzQCZ/oMbL1mSbxaomn1xdGUbj9v2MHe+xdHrciGMl17LN/zX4aTMWIL9P5e7O7e
         QLYBjMrJYu8wObhVs9Px64HQy2ltLu3xBmY3bVDaRceHrvDBaZSiGo7PgzG8tzbxv+3Z
         cHSeVX55U7IyvUel6uDmlDe4S1HhFEhp30gFLIAOq5I70U0vk20SKjZvUDnx2F53kvpk
         BM8A==
X-Gm-Message-State: ACrzQf2g/EYv1SDXOpMzotPtKvuGzctMobyy1bwRO6k4NjwzeN2YU3Fs
	x6Z79851GmUavPHN6DcWjTbUk3DOS20=
X-Google-Smtp-Source: AMsMyM743WLaut2TEDuu9Otx1L5edbBgqf2bI1BtlwsFJAYPKcXauwkgwejLZrQib1lNS1Y2SACG3w==
X-Received: by 2002:a17:907:5c2:b0:77e:def7:65d8 with SMTP id wg2-20020a17090705c200b0077edef765d8mr596533ejb.487.1664992111996;
        Wed, 05 Oct 2022 10:48:31 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] Misc fixes for Xen grant DMA-mapping layer
Date: Wed,  5 Oct 2022 20:48:21 +0300
Message-Id: <20221005174823.1800761-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Hello all.

These are several fixes I collected when playing with virtio-net device
using Xen grant mappings.

Tested with both virtio-blk and virtio-net devices.

Oleksandr Tyshchenko (2):
  xen/virtio: Fix n_pages calculation in xen_grant_dma_map(unmap)_page()
  xen/virtio: Fix potential deadlock when accessing
    xen_grant_dma_devices

 drivers/xen/grant-dma-ops.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

-- 
2.25.1


