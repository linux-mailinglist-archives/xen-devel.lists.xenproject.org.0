Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95FE442ECC
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 14:06:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220227.381410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtUX-0002GA-Es; Tue, 02 Nov 2021 13:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220227.381410; Tue, 02 Nov 2021 13:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhtUX-0002DH-BD; Tue, 02 Nov 2021 13:06:17 +0000
Received: by outflank-mailman (input) for mailman id 220227;
 Tue, 02 Nov 2021 13:06:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cNKe=PV=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mhtUV-0002DB-NA
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 13:06:15 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62743ae3-6210-4ac2-b66c-0b0e72dc62f0;
 Tue, 02 Nov 2021 13:06:14 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bu18so25672624lfb.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Nov 2021 06:06:14 -0700 (PDT)
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
X-Inumbo-ID: 62743ae3-6210-4ac2-b66c-0b0e72dc62f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=WGEcGTNaPHyBp9AFLVzdDpRNCxqF7driYhfw6Pjd9CE=;
        b=Jv1++kwCJIiOxvq49iQyHz43OoAowtT6oLvF2e0cWGpxnwRbNOv+8RjVibWaqOVvO/
         aSnPniRiWrjXTQhktfk6VGkeUzlz4JwmJylGB+YBQxPtoSWeFJlTzQHqjn9yCpzkeu6P
         96YPSyF75A3+Ma7SorfkP34yfmhe6DWXzu9v9Srr3jCitdTAwXSe7G4GaXuokhtHmAx8
         42fjuYwZGjSPfdNh9ZF6QCxlrcGr7qpiFTOMkh2TwDBG2SjOWnVbeopnpIcQ5+G8tDJy
         Kl3iQ/uUTZ7Z8GJpyRAqvZg1oNenV5sL8+OPT/zxWFEvmYAn3IfoY1pVUlgia/59y624
         l3gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=WGEcGTNaPHyBp9AFLVzdDpRNCxqF7driYhfw6Pjd9CE=;
        b=OoH9/7TZeXJLx8HY+byUcaRaPhOMdW1hCgb3I3JODk9PVL1505beAZVg2rIiAAIQAS
         NrDXEszSElEtrw+GYs/VPCQGcQKvBwRDRAr7Txn0bP+QlORXWPsBUJUOFNmbXglshKet
         YZf3SMPLqA+H8Z/ZXp5Z4Dd8jAYmbCyum9VG/D1cmFllInjmiB3yTl3T/is/MebnaRoH
         KI7/iXJ3Cq8cRyPY4DpoO3lNM+/vMXrrC6/XBcBrqARitgoAdDw0z+BDxBp+CAoUjKYC
         1EDqk0viYFM+ITp0foxtAAHdkaAhmnq1qlC+posqhX105A2tO3kUAhcSKVjIqze+033M
         uRIQ==
X-Gm-Message-State: AOAM533SAma8gLwm+hGRa0/f+Xddh7dQjfrXKMbTnxR9MFGSaPQkf22W
	oXW3dwZ+cDfwxN99LQUJh7SpHKllSxzcgi5SKEI=
X-Google-Smtp-Source: ABdhPJzXvkw7kypcTGklS21q2NJ+dyotldJmjicL5wGcnV76g3ZVfxHlTXnnCu+YH7zAxg7CWaPPOryJ3Xbc16VuSxM=
X-Received: by 2002:ac2:488e:: with SMTP id x14mr9010363lfc.250.1635858362865;
 Tue, 02 Nov 2021 06:06:02 -0700 (PDT)
MIME-Version: 1.0
References: <osstest-165982-mainreport@xen.org>
In-Reply-To: <osstest-165982-mainreport@xen.org>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 2 Nov 2021 09:05:51 -0400
Message-ID: <CAKf6xpvBMJnJVe1pxcxMf-6v64vCsZsXQve6MVTOgYTtmaNMEg@mail.gmail.com>
Subject: Re: [qemu-mainline test] 165982: regressions - FAIL
To: osstest service owner <osstest-admin@xenproject.org>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021 at 7:20 AM osstest service owner
<osstest-admin@xenproject.org> wrote:
>
> flight 165982 qemu-mainline real [real]
> http://logs.test-lab.xenproject.org/osstest/logs/165982/
>
> Regressions :-(
>
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  build-i386                    6 xen-build                fail REGR. vs. 165682
>  build-i386-xsm                6 xen-build                fail REGR. vs. 165682
>  build-armhf                   6 xen-build                fail REGR. vs. 165682

This patch should fix the build issue, and it will hopefully land in qemu soon:
https://lore.kernel.org/qemu-devel/20211101234358.582487-2-mst@redhat.com/

Regards,
Jason

