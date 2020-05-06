Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9377A1C795D
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 20:26:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWOjK-0003UM-Dr; Wed, 06 May 2020 18:25:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RiaG=6U=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jWOjI-0003UE-Qr
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 18:25:12 +0000
X-Inumbo-ID: ec357f26-8fc6-11ea-ae69-bc764e2007e4
Received: from mail-ed1-x534.google.com (unknown [2a00:1450:4864:20::534])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec357f26-8fc6-11ea-ae69-bc764e2007e4;
 Wed, 06 May 2020 18:25:12 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id k22so2866499eds.6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 11:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=oasTas5SRun+aE61FbdyG8rxUBcdLQkbJe3EILiKuFA=;
 b=OWWI0gJSHVXEniK2Ck3fD+cZzXy/D6U6ajZdJvVyeYgBLDNium4fuqly8EKmlPcwUm
 UdISgKXSF+urLKFpN5n45G7eAz1ABEeBKd/aGVbeI519WdIVaDXOxT5wYYtqx+Tka3Qp
 oAnw8Dm+CDfsxCc7vqnsildX+AcxYXyfBn4qHeYhcaxhYKrWgt0SDhE+70Zb2cvRRU4P
 PgVWCLPvT3uFkij9ask+wZHJe/8N6ehE5xwjq0uhg3QSyyP9zmur/e1a8GXUGRlPIu8Z
 TaaGhjsNBweCpdQMjLZMU4yv6uX4qS1q790n/rf9IjKKH4GYgkWo54gBfgBv2sEaDLXF
 I32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=oasTas5SRun+aE61FbdyG8rxUBcdLQkbJe3EILiKuFA=;
 b=uPogLHpmuvXVXVcYrG6FHRL4cDc/MspfWHr8j9S3yDmfVzI/MF9e9dbjxl6Z0kaHnA
 YHWU5WtqdYQGKnP8RfgyRoX2gwYQNxuX//MCvIgZJnJl6aEOoPwAuMbNE4fKy2dFMLJj
 ccB7kLVYznRFt0UhHsTnqyz1AP+vkj+rTfg6LsMSR74wlBE8jOoSznmCiiBc5QnbO1vC
 x9y3wQ4Aiuu+ycyDyX39N/srF8gY4KdidpnE5uS9JAToNz7ZQMwQD3wa7jV3hwUVNA0K
 WLuH4jg6Xjy3jpvxEibmMr58Ut5GcYweSd6PpUlxVxFEwZcaWisntcOgMtVvia5X1hx2
 epgA==
X-Gm-Message-State: AGi0Puabkeejo9A5ML2lEDBAS2IAXz2wrNbkoq2Vi2PVafkgkkUdfrcJ
 HjmgrCMCtZt9dja8PHu55E1L0y/K4Ig=
X-Google-Smtp-Source: APiQypKyT+dVcCjn3awEHVi92/W8H1k47Hq5m0vZrmE2m1K2ji/qKHTlxPyo7QH6tLBgI7HKrO0nIw==
X-Received: by 2002:a05:6402:1052:: with SMTP id
 e18mr8595892edu.63.1588789511241; 
 Wed, 06 May 2020 11:25:11 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com.
 [209.85.128.41])
 by smtp.gmail.com with ESMTPSA id co22sm283330edb.30.2020.05.06.11.25.10
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 11:25:10 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id v4so5571062wme.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2020 11:25:10 -0700 (PDT)
X-Received: by 2002:a7b:cdfa:: with SMTP id p26mr5732409wmj.186.1588789510571; 
 Wed, 06 May 2020 11:25:10 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 6 May 2020 12:24:34 -0600
X-Gmail-Original-Message-ID: <CABfawhkhL3e9zzpyTtU6N1fF6tPQ7BrF6cpRTu2EJntbjPia3Q@mail.gmail.com>
Message-ID: <CABfawhkhL3e9zzpyTtU6N1fF6tPQ7BrF6cpRTu2EJntbjPia3Q@mail.gmail.com>
Subject: QEMU-Xen build failure
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,
on a recent checkout of the Xen staging source I ran into the
following build error with QEMU upstream:

tools/qemu-xen-dir-remote/slirp/src/ip_input.c:330:5: error: ISO C90
forbids mixed declarations and code
[-Werror=declaration-after-statement]
     int delta = (char *)q - (m->m_flags & M_EXT ? m->m_ext : m->m_dat);

Tamas

