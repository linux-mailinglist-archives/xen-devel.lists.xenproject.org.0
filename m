Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB32AD689
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 13:42:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23338.50009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcSyQ-0006wk-UO; Tue, 10 Nov 2020 12:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23338.50009; Tue, 10 Nov 2020 12:42:10 +0000
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
	id 1kcSyQ-0006wL-RE; Tue, 10 Nov 2020 12:42:10 +0000
Received: by outflank-mailman (input) for mailman id 23338;
 Tue, 10 Nov 2020 12:42:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P7kS=EQ=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
 id 1kcSyP-0006wG-8X
 for xen-devel@lists.xen.org; Tue, 10 Nov 2020 12:42:09 +0000
Received: from mail-ua1-x92b.google.com (unknown [2607:f8b0:4864:20::92b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e87db3c-004f-4bc0-b247-c349a910c9ea;
 Tue, 10 Nov 2020 12:42:08 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id q68so3881704uaq.3
 for <xen-devel@lists.xen.org>; Tue, 10 Nov 2020 04:42:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=P7kS=EQ=gmail.com=lambert.olivier@srs-us1.protection.inumbo.net>)
	id 1kcSyP-0006wG-8X
	for xen-devel@lists.xen.org; Tue, 10 Nov 2020 12:42:09 +0000
X-Inumbo-ID: 1e87db3c-004f-4bc0-b247-c349a910c9ea
Received: from mail-ua1-x92b.google.com (unknown [2607:f8b0:4864:20::92b])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1e87db3c-004f-4bc0-b247-c349a910c9ea;
	Tue, 10 Nov 2020 12:42:08 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id q68so3881704uaq.3
        for <xen-devel@lists.xen.org>; Tue, 10 Nov 2020 04:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=DwhMxMNv67jD8/9WZVTPnyEUhMbKmpNtaev6tL7Ou+A=;
        b=smyBCrvyXNXYkhIChQPMTH5Y5yquJ5Om+PvG1se+rgAlwtxwoDe6RRHJF4aCyf3s0o
         e5GuSA1D4q+IM+jNS1iTN8SD7nC6wKADmmuuFXmULJarTBu6GgRAQ9FKcn6adZD5p6HE
         TZEg5+4aJQdWXos3Djpu8W/nTOJRQ0rr+kIai/5uqWMQoEsaWfOoV+X3SbjMvTfPXh/H
         mmzQtT1mskOeXqpnl+aVgRzE1GWjLZPkcKOkWFynkYtMbB37Nq/LImQeKf72/urZT2b8
         S8sK/e8pILIoTBTJbG0nahqBjStiLDBpELWtALSdYwHBXRbPE2IVNFlKztS3/oHB29CC
         5uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=DwhMxMNv67jD8/9WZVTPnyEUhMbKmpNtaev6tL7Ou+A=;
        b=O+Y6beMHwMZF9Nqzd+fpr1Iy8PvarC4YqIrbGjvD3rlrvRLWKtDuxTMS3jkEO+fgY/
         daWEbDzgMew7XQ2apWylyUNYfgEmSj1wyxhfZO4Y90fF/FZzUl1SKwsGKGqRQIdKeCUx
         LEIsFm2OsouQrggtVn56UZ7kuC+WumGAUgwVRCepOaSz79EgIJjZUuvg3x9rdsAZlxe5
         Lql28TbtpmtHyt2O1kVBz+XxN36xn2KAMRq2+GpMKcqjUBIHSta9QjOQz812VvJPRkNz
         babjiiuYyhAEjqNBS868k5HV2p0b/5IJ8Qm1b40IX9k70px2L4IGuvyBxoEIFqekBZ58
         HogQ==
X-Gm-Message-State: AOAM5311brbxYCl2jGMl2Ru1KvLcuq+mbVRVbWVkZfpqcEhXMi8VKA+Z
	wspALuvqBXhm3uSKV1DrpOTFsNPehEb3MURw5sSlxHyFFKOosgDf
X-Google-Smtp-Source: ABdhPJxmEKHo5PET9IHJLFqBUKf6tTe4Q9QDAsoNpXv96duiC6eojqmszS8/OplvilIRcREyUxuUTY8XZ8WNwjDERHE=
X-Received: by 2002:ab0:e04:: with SMTP id g4mr3955792uak.68.1605012127520;
 Tue, 10 Nov 2020 04:42:07 -0800 (PST)
MIME-Version: 1.0
From: Olivier Lambert <lambert.olivier@gmail.com>
Date: Tue, 10 Nov 2020 13:41:56 +0100
Message-ID: <CACJ1ZNuJCgDkRHvH2gXqC5gWTJHdUQ9J4G-HBNFwKYZFaWpWuw@mail.gmail.com>
Subject: Schedule for OpenPOWER/Xen meeting
To: "<xen-devel@lists.xen.org>" <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="000000000000b89e1705b3c001c1"

--000000000000b89e1705b3c001c1
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

We got 2 potential dates for the initial tech meeting with at least one
OpenPOWER expert, so we can discuss the effort needed to port Xen on this
architecture.

Because of time zones (on OpenPower side, there's one guy in Australia), we
got 2 possible schedules in November:

1. 3pm CT on this Thursday the 12th (! this week)
2. Or next week Thursday the 19th

I made a doodle-like so everyone can vote on their preferred schedule:
https://framadate.org/QQu5rYEOEYr4ZHc4

Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET). But correct me if I'm
wrong.

Reminder: the Cryptpad of the last Xen Community meeting contains the list
of people interested. If you are aware of someone interested that could
miss this email on this devel list, feel free to forward it. Cryptpad link:
https://cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/

Thank you and see you soon!

Olivier.

--000000000000b89e1705b3c001c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi everyone,</div><div><br></div><div>We got 2 potent=
ial dates for the initial tech meeting with at least one OpenPOWER expert, =
so we can discuss the effort needed to port Xen on this architecture.</div>=
<div><br></div><div>Because of time zones (on OpenPower side, there&#39;s o=
ne guy in Australia), we got 2 possible schedules in November:</div><div><b=
r></div><div>1. 3pm CT on this Thursday the 12th (! this week)<br></div><di=
v>2. Or next week Thursday the 19th</div><div><br></div><div>I made a doodl=
e-like so everyone can vote on their preferred schedule: <a href=3D"https:/=
/framadate.org/QQu5rYEOEYr4ZHc4">https://framadate.org/QQu5rYEOEYr4ZHc4</a>=
</div><div><br></div><div>Note: 3pm CT would mean 9pm UTC, 10pm UTC+1 (CET)=
. But correct me if I&#39;m wrong.</div><div><br></div><div>Reminder: the C=
ryptpad of the last Xen Community meeting contains the list of people inter=
ested. If you are aware of someone interested that could miss this email on=
 this devel list, feel free to forward it. Cryptpad link: <a href=3D"https:=
//cryptpad.fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/">https://cryptpad.=
fr/pad/#/2/pad/edit/k-0Aj+Sxb5SliLWrFRBwx49V/</a></div><div><br></div><div>=
Thank you and see you soon!</div><div><br></div><div>Olivier.<br></div></di=
v>

--000000000000b89e1705b3c001c1--

