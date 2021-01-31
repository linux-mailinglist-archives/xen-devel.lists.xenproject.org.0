Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6A6309E43
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 20:07:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79402.144519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6I3j-0004ga-SP; Sun, 31 Jan 2021 19:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79402.144519; Sun, 31 Jan 2021 19:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6I3j-0004gB-Ow; Sun, 31 Jan 2021 19:06:55 +0000
Received: by outflank-mailman (input) for mailman id 79402;
 Sun, 31 Jan 2021 19:06:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQWc=HC=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6I3j-0004g6-3J
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 19:06:55 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc9b2626-883d-4149-a9a5-94e1a3a583ec;
 Sun, 31 Jan 2021 19:06:54 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z6so14231047wrq.10
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 11:06:54 -0800 (PST)
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
X-Inumbo-ID: cc9b2626-883d-4149-a9a5-94e1a3a583ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Iycj1EIA33IGU8QU0AcXWp7UsjUbYELmutzpQtrUK08=;
        b=N2LdFtopi7+rh5AmrB3dCT55DauBOsqH7g466K/KcpsMAwXPzDnC9wR6K2ycQHkQ5s
         AFg65ruTWZlub/z8GR7HNZ4871KbMfTtUyx9h/y/Gm4fDhiMjOiXngX5Q4Q/4EZg3RGE
         75KfM7ieNpB63UgmcvbxUyZMtpWl2NPCQ/AVTdNWELydLB6NF4EZMAMwsED4fZ5jremA
         KITHkFYRZ7fB9uTFMElBRVqKJRdtq3N8urUfnzRFwB+peyzLO1Pkbdprd3LPgOAkyeEI
         obrbayicDBA/uBe6uZgSWIKKBaqCiVdfznbuAP9H4ly0MruiF9Ooc1r6qYDxqxtt16go
         dA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Iycj1EIA33IGU8QU0AcXWp7UsjUbYELmutzpQtrUK08=;
        b=aGz3jTsMO6+h819z61y3GcvEpzvRkoWU7KnvYCjsR9PfT2s0GUnFqF/6Y7bB7f+aZi
         CIImfISj1md+axV/uIOji70la5mXtLKxymPkmS817q/Zzw0NeBQYw2el6hZKOXz15Z0E
         Qh4hLUReaHPR6YIDNJKmq4TTrPL70YFRXhRoX+pkf+KkNuMtwfdweU0q7V4h6uxZBM9Y
         kRah4faNpHp45ikfCeNQ2XfutCJX4FKzIZh3DAchrH+BnCu+3dgOmYlCEOypEXIyKXjx
         IHALLxvq+vrsoA5w4SQqxCQyXFcl8SYCqcTKi1CMT+avModGWs63SWO2hxbGXvXCRB8b
         4UzQ==
X-Gm-Message-State: AOAM531DDB8eykrr1m+g2xUR56ihVaYAJ4FkLY2Vx7svuoqFAgR/Wqn7
	JZTrlRGRgp49Fab72mWR0gJGzXBnTki+2f9GPYOI06txooOcIg==
X-Google-Smtp-Source: ABdhPJylykS4dI/yOc2Xpjo0WHTuGd2NFUzOc2SFx39t40v/sRxBMfiKJm8g+lEPnPRJkkBCPkUZuQVrk38NK0PzZK0=
X-Received: by 2002:a05:6000:1547:: with SMTP id 7mr14767169wry.301.1612120013082;
 Sun, 31 Jan 2021 11:06:53 -0800 (PST)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 14:06:17 -0500
Message-ID: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
Subject: Xen 4.14.1 on RPI4: device tree generation failed
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,
I'm trying to boot Xen 4.14.1 on my RPI4 with the 5.10 kernel, built
using https://github.com/tklengyel/xen-rpi4-builder/tree/update.
Everything builds fine and Xen boots but then I get this error:

(XEN) *** LOADING DOMAIN 0 ***
(XEN) Loading d0 kernel from boot module @ 0000000000480000
(XEN) Allocating 1:1 mappings totalling 2048MB for dom0:
(XEN) BANK[0] 0x00000008000000-0x00000028000000 (512MB)
(XEN) BANK[1] 0x00000030000000-0x00000038000000 (128MB)
(XEN) BANK[2] 0x00000080000000-0x000000c0000000 (1024MB)
(XEN) BANK[3] 0x000000d8000000-0x000000f0000000 (384MB)
(XEN) Grant table range: 0x00000000200000-0x00000000240000
(XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
(XEN) Device tree generation failed (-22).
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) Could not set up DOM0 guest OS
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...


Does anyone have an idea what might be going wrong here? I tried
building the dtb without using the dtb overlay but it didn't seem to
do anything.

Thanks,
Tamas

