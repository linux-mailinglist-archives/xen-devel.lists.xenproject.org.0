Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 483F922F1FE
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 16:37:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k04EU-0000VE-Av; Mon, 27 Jul 2020 14:36:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iIX7=BG=whatever-company.com=a.perdaens@srs-us1.protection.inumbo.net>)
 id 1k04ET-0000V5-4Y
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 14:36:01 +0000
X-Inumbo-ID: 7d144f24-d016-11ea-8ac7-bc764e2007e4
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d144f24-d016-11ea-8ac7-bc764e2007e4;
 Mon, 27 Jul 2020 14:36:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id l2so4577579wrc.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jul 2020 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elium.com; s=google;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=w3mAClGwbtL4eYyuh3YjOyz5SaSi3M232OPbxlO7Kvg=;
 b=kT72GXLm2QqoL/vDo+BLIyBKHBSxH1/IxHn9AYUELKo9gaNGI73Xyxavmlk+lz8K8P
 W667GDaOvzg3Qs5qc7JOnGWhqzETUk3J1fUcFEoAFAUJehbKLNDfxnlOjAcZduqMqriu
 vjAQCeB1sQi2VJMRiWGQyt2Hp6qBzFvMI6hPhXqGSCKe8OU1R9uzrbat71uTlfpDc4BR
 RxrSEF+fHps0mMA0rK3PvwVLzqrkox8gqtlWfkqn/MHbSEzB8aDwEbj397tHNyr2OZbP
 ehcpum0fA4GEYnrWGICcD6vs25ChDjP10ZlEaxG2XNSc7p/4LdL3bxA13YUmdeTQm2TM
 swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=w3mAClGwbtL4eYyuh3YjOyz5SaSi3M232OPbxlO7Kvg=;
 b=smqvysUWr7cYz3oq0GOhxjNi4/nyNvFfdZyfosejGeDM44y7Zh7j4gkaajWU/+RFyx
 VgPF75D5wgOfQv5sYCfvBFheirhIiW1bpr9uW9O5+UzlHSliQy1pJ4h4O0f1KPXCf7dA
 i8qzZ5UXh/IgI1/7fds6Y4XP4KMf/8etz7rMp8xVWzLckJF3LVXD72ai3UOmbQfBePel
 yMlHtk37vXtaZx/d2malL7he0prNk14HoaHluKrdvAgkeGGFUyqV2r50EBZtT9TBFf36
 k1FOxFqkrFf6FVnxpk/Vq6vGoIoQpG8PI603XHC9ylimlWwUeTtffJUI6oqjQiITIbgb
 TmUA==
X-Gm-Message-State: AOAM533ZrXyAKZq2AbCj9ORwe3dfZn0gzS+yDHAsBRCoXn+CKfxqdOz7
 OMYmbhxU3Lk7fypE4BpCKJNP76E5PoI=
X-Google-Smtp-Source: ABdhPJxzLq5vJ7Jr1p6TwHVhtJA6qMvI6HL5i6AkAOwIuNEE+vwZA/I8Y7J8RL3SimpZcOyBqWvOfQ==
X-Received: by 2002:a5d:6990:: with SMTP id g16mr20072972wru.131.1595860558537; 
 Mon, 27 Jul 2020 07:35:58 -0700 (PDT)
Received: from [10.192.1.211] ([37.19.15.130])
 by smtp.gmail.com with ESMTPSA id f9sm12631505wru.47.2020.07.27.07.35.57
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 27 Jul 2020 07:35:58 -0700 (PDT)
From: Antoine Perdaens <a.perdaens@elium.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: qdisk error with rbd
Message-Id: <81E74684-4758-4647-BCE5-8C881067ABC9@elium.com>
Date: Mon, 27 Jul 2020 16:35:56 +0200
To: xen-devel@lists.xenproject.org
X-Mailer: Apple Mail (2.3608.80.23.2.2)
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello all,

Our current setup is based on Xen 4.11 + Qemu 3.1 with rbd disks, an =
example of a disk that works : =
"vdev=3Dxvda1,backendtype=3Dqdisk,target=3Drbd:rbd-pool/disk-02-root:id=3D=
rbd=E2=80=9D.

The same setup with Qemu 5.0 gives this error in /var/log/xen/qemu-dm-* =
: "qemu-system-i386: failed to create 'qdisk' device '51713': failed to =
create drive: Could not open 'rbd:rbd-pool/disk-02-root:id=3Drbd': No =
such file or directory=E2=80=9D


Looking at the source in xen-block.c it looks like the driver is forced =
to =E2=80=9Cfile=E2=80=9D which wouldn=E2=80=99t work for other type of =
block devices.

It looks like a regression with the xen-disk introduction.

Regards,
Antoine=

