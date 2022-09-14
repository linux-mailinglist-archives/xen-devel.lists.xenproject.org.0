Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4F15B8EC8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 20:19:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407046.649482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYWyj-0002e9-5K; Wed, 14 Sep 2022 18:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407046.649482; Wed, 14 Sep 2022 18:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYWyj-0002bW-0p; Wed, 14 Sep 2022 18:19:17 +0000
Received: by outflank-mailman (input) for mailman id 407046;
 Wed, 14 Sep 2022 18:19:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vw1X=ZR=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1oYWyh-0002bO-GJ
 for xen-devel@lists.xenproject.org; Wed, 14 Sep 2022 18:19:15 +0000
Received: from MTA-06-3.privateemail.com (mta-06-3.privateemail.com
 [198.54.127.59]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbe80951-3459-11ed-a31c-8f8a9ae3403f;
 Wed, 14 Sep 2022 20:19:14 +0200 (CEST)
Received: from mta-06.privateemail.com (localhost [127.0.0.1])
 by mta-06.privateemail.com (Postfix) with ESMTP id 1ADB418000AE
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 14:19:12 -0400 (EDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by mta-06.privateemail.com (Postfix) with ESMTPA id E9CD018000AD
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 14:19:11 -0400 (EDT)
Received: by mail-yb1-f182.google.com with SMTP id t184so24089157yba.4
 for <xen-devel@lists.xenproject.org>; Wed, 14 Sep 2022 11:19:11 -0700 (PDT)
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
X-Inumbo-ID: bbe80951-3459-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=tklengyel.com;
	s=default; t=1663179552;
	bh=8VjHqIchoQhw5vAXHOw6gSHzk+jCMGPckOt+hm/6P+U=;
	h=From:Date:Subject:To:Cc:From;
	b=PK8/sbLsygojnjF+9blC90vGWp8ND4fmTrtB/dKC0XnMotdzTIm5E+BkaPbphuggz
	 7aZ6tircspcAXQ0Mworjof0UaJS0y8JDjoztBOid/hAOyBd67D5u9801wMSFfgE1sr
	 PcLJ78xA5EBBRlPxhOC0zNHjqG0OSc8SCmvP2pXRTCjhIxWwkLtzb4IwR06gDfXJGr
	 BtlGknUGwkO8HBhxsVzOrAJcohkr44+T4tLkdNDqGJLEHHHQ6GpS1E7ojtwF/77wxj
	 TU8vuODa11Sn4jsr5qRHcCYWj15pFdOQ5zChfpurveLCVDLf7R7eJbMg6uk4IG4yz4
	 G6iDBSj8iozzg==
X-Gm-Message-State: ACrzQf2klE5TqyzJ4Qvp/7zKcZqR9bdWhEw7y3Ef48V34xvGRfxSIvT+
	i125UwzDmZPC03oGO+rYrit2JKz26mQe3W1PVjE=
X-Google-Smtp-Source: AMsMyM6CB2hfruwQNOtZ80Xg0l8faoT6gDvpHaXXppMu5zRkJ13zWk6NVmUvJTb6fDSa4nVfdFusWKGWZeKSwXRATi8=
X-Received: by 2002:a25:a563:0:b0:6b0:297e:1e7b with SMTP id
 h90-20020a25a563000000b006b0297e1e7bmr1640301ybi.443.1663179550457; Wed, 14
 Sep 2022 11:19:10 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 14 Sep 2022 14:18:34 -0400
X-Gmail-Original-Message-ID: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
Message-ID: <CABfawhmXWouFVRVrtX82Dh+8maaJqnDSDL=Me7_fzBGdM4oE2Q@mail.gmail.com>
Subject: Console output stops on dbgp=xhci
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-Virus-Scanned: ClamAV using ClamSMTP

Hi Marek,
I'm testing the latest Xen master git branch
(942ac5fc15ecc2f7ef1d9331c76d89d2cef10e5c) with the now merged xue
patches.  My current boot command line includes dbgp=xhci@pci00:14.0
console=dbgp and this works in that the Xen boot log shows up on the
other side of the debug cable:

...

(XEN) Dom0 has maximum 8 VCPUs

(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82c5cdac

(XEN) ELF: phdr 1 at 0xffffffff82e00000 -> 0xffffffff831a1000

(XEN) ELF: phdr 2 at 0xffffffff831a1000 -> 0xffffffff831d5000

(XEN) ELF: phdr 3 at 0xffffffff831d5000 -> 0xffffffff84000000

However, debug output on the USB3 port stops at this point. I would
expect to see the same as xl dmesg shows:

(XEN) Dom0 has maximum 8 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff82c5cdac
(XEN) ELF: phdr 1 at 0xffffffff82e00000 -> 0xffffffff831a1000
(XEN) ELF: phdr 2 at 0xffffffff831a1000 -> 0xffffffff831d5000
(XEN) ELF: phdr 3 at 0xffffffff831d5000 -> 0xffffffff84000000
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 2048kB init memory
...

Do you have any idea what might be going on and preventing the output
from showing over USB3 afterwards? The /dev/ttyUSB0 device is still
present on the receiving side, just nothing is being received over it.

Thanks,
Tamas

