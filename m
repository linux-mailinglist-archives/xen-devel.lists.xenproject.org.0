Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD929693E
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 06:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10647.28560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVp6C-00008J-6A; Fri, 23 Oct 2020 04:54:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10647.28560; Fri, 23 Oct 2020 04:54:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVp6C-00007u-2f; Fri, 23 Oct 2020 04:54:44 +0000
Received: by outflank-mailman (input) for mailman id 10647;
 Thu, 22 Oct 2020 20:56:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r7k1=D5=gmail.com=mshivam2196@srs-us1.protection.inumbo.net>)
 id 1kVhd7-00086e-Dk
 for xen-devel@lists.xen.org; Thu, 22 Oct 2020 20:56:13 +0000
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c27bbc4e-7323-4c87-802c-bf410cbb119e;
 Thu, 22 Oct 2020 20:56:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id u62so3137198iod.8
 for <xen-devel@lists.xen.org>; Thu, 22 Oct 2020 13:56:11 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=r7k1=D5=gmail.com=mshivam2196@srs-us1.protection.inumbo.net>)
	id 1kVhd7-00086e-Dk
	for xen-devel@lists.xen.org; Thu, 22 Oct 2020 20:56:13 +0000
X-Inumbo-ID: c27bbc4e-7323-4c87-802c-bf410cbb119e
Received: from mail-io1-xd2f.google.com (unknown [2607:f8b0:4864:20::d2f])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c27bbc4e-7323-4c87-802c-bf410cbb119e;
	Thu, 22 Oct 2020 20:56:11 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id u62so3137198iod.8
        for <xen-devel@lists.xen.org>; Thu, 22 Oct 2020 13:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=O9q7hsrq3YScP3PTnwo78McfYdpUs5BdfpImePRXR6w=;
        b=h2fAMiUz/1bM0XB3aF8r5m5jsHr4gxph+aWlCXvxbILScT7zxIO3uPIGXAnsZFQQH/
         ACvWokJU5zR3gTj2lArhTM7QkEHbi6eZu5bVc8CoU1oWoBvfVBkDBeXU6jx+da82iflp
         8i3Kmrk8X1+xlBIPV2wv3vkYJLWBxkIpmADBvJYDBE/rtA47yg7ybR5lH67udKRvBMI8
         Lzewp/rapMRz/eomP/DAomSLg7Mr4gFQ35ujEl+j4xezx7u1IEy1XFc7mYx4YP8llxjo
         IZmB0mtwmNzlZK7SKciGqZ7SrXufEGHfS9ZXOxuxvqKUno+TbIMk/+bc3ON69ntwxSCG
         bXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=O9q7hsrq3YScP3PTnwo78McfYdpUs5BdfpImePRXR6w=;
        b=fsMfveaMOF9zHeV4oJ36LOLyKcW51BKGRMleoRNmUSlK+o+q+OwPQEUlZlr0xDyD2Z
         H63hNu/+1Xo5ktgm7HU2zBih0KEAIlDljw68Ydwy51g4Odn7OQIBvU1cv1851I0O439h
         Vvn6RgypeK8k2YSmmYvG3msw6Juht99S7obWRhN0MVySP2MkrnqzVX3CIb/WV5I7pIo7
         Pc3eQMYRQNp+pjBmjsuL5MNeMEmqE9kXefv2JG/YZ7FxTgN2yKgKHv3I2QjxCg/3jyPv
         gcs+RR9RBR2HSCf4kYDAWbCTP+qHYSyAQt5WzqmKZLuFrBjQuuWV2mzdkBQbJMQJWU8i
         1bBQ==
X-Gm-Message-State: AOAM532xZu9qzpzkumsSLtglwFh8NLUveDfJrQoH9r5Mi1BR18Bra6Ye
	BoheKQ+9BuK1EV081/Rbqb/vHfmg2TrzeFQsgr5f8EEN640=
X-Google-Smtp-Source: ABdhPJyNebN4HW/x7tsIIRIFUsPKtsIq6t7GVJhsrYW0JRm+cMXr3i6jHxlzQWGPU1LXwWX30ysgQg5unN+nXxjavb4=
X-Received: by 2002:a02:7817:: with SMTP id p23mr3193520jac.57.1603400171351;
 Thu, 22 Oct 2020 13:56:11 -0700 (PDT)
MIME-Version: 1.0
From: Shivam Mehra <mshivam2196@gmail.com>
Date: Fri, 23 Oct 2020 02:26:00 +0530
Message-ID: <CANp2S65q-w7s9gBgE7bkx9v=z9DpzCeJXGN8Jc0EKcmMERV1Ow@mail.gmail.com>
Subject: urgent
To: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000a5710c05b248b1b5"

--000000000000a5710c05b248b1b5
Content-Type: text/plain; charset="UTF-8"

I want to know a few things like how have you implemented the repeated
migration of VM checkpoints from primary to backup, whenever backup
receives the checkpoint, it sends an acknowledgement, the primary receives
this acknowledgement and send a output release signal, Can you shed some
light on how these things are implemented. how the backup detects that t
received a checkpoint and it send an acknowledgement now?

--000000000000a5710c05b248b1b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I want to know a few things like how have you implemented =
the repeated migration of VM checkpoints from primary to backup, whenever b=
ackup receives the checkpoint, it sends an acknowledgement, the primary rec=
eives this acknowledgement and send a output release signal, Can you shed s=
ome light on how these things are implemented. how the backup detects that =
t received a checkpoint and it send an acknowledgement now?<br></div>

--000000000000a5710c05b248b1b5--

