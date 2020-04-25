Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53D91B8563
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 11:51:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSHRn-0001zO-Le; Sat, 25 Apr 2020 09:50:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCYS=6J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jSHRl-0001lg-Oh
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 09:50:05 +0000
X-Inumbo-ID: 23572df6-86da-11ea-b4f4-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23572df6-86da-11ea-b4f4-bc764e2007e4;
 Sat, 25 Apr 2020 09:50:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id z6so14508781wml.2
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2020 02:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P83MWiJLspWz5CoTkxUlVDfhmogvMWXyi7+fA//NOl8=;
 b=Ivw39+wz+G0NFLwkZeySIBfjvyqGspHWjCwteL3UMdVMLgM5RDKW1mqLozbYLxLJXv
 FK9w8XzyPk0JdRxKxStQwAj1X02cj08LvVpHYVMfZZGOQPVhY1IE1EHVl9eQKK/kNnxd
 uxlbVKJ5naU8t187ACEBDWEQnjHkl5a6Opf62MI7jF4gRSTK01oXPfWNutPNfdV9o+8O
 zWZf1BU66X0Bwf44DG8SJcDxeDMH2jVVOT8ECw3Mt9n8MSak28tI5VdLGPOQKmhXGcuU
 ZMtlx0Q3dddswhf3Wa5b/WfMG25AOQKE57xLs9OsSEiSvtuuq4K5vTBMcdmpr3rA6wIJ
 W+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P83MWiJLspWz5CoTkxUlVDfhmogvMWXyi7+fA//NOl8=;
 b=mJJPa2bVIJVSwe1VxVMbxwSx2LVVYk0tluteSmm2LP9hIYrL0kHhUDvKlOYdZ0G9QW
 +eK1Jd/Q0KO+OG0gb20TNAMr5fbhnUyyvvE+igCnOIPM3IRW1VaYSlhvzBiAa/1q2rf2
 YfZPf2ZBvQkG4qhC7aA9ir6dr6ebVv4duv/iuhUBFyBp2oCVLeeUSBLDNw4ndFDjERNP
 y1osRrxRat728XBpmW5SYu69+RUUkGd8ybX/emSIA8IVwkwj7xTbqeYd26eZYZqq/0x4
 daUlvhW5X+e5FQHuImnfmYYUAbrusCLQW14qzGyLwAplM+uyL5MwmpnkQHqA2nyRePEY
 YUGw==
X-Gm-Message-State: AGi0PuYm37sLcyOj1HipoeYQgAHBN6sDWXiNJ2X2on+FmAzR2I1HNioL
 CZyc6DCqgXpsaarQo3EvQ09CFXtEdcg0hGPAlDc=
X-Google-Smtp-Source: APiQypKpGphSRhwcDztpS/ydi7slLsT+Xvor8/o0Jx6Ed5n5mZ+n8z6UNpnFyzmcpsoSeoS0Hgw6xtZEsyV7h8hnT5w=
X-Received: by 2002:a05:600c:28e:: with SMTP id
 14mr15994809wmk.79.1587808203851; 
 Sat, 25 Apr 2020 02:50:03 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.2004241443570.7982@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2004241443570.7982@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 25 Apr 2020 10:49:52 +0100
Message-ID: <CAJ=z9a284froER_-dNQKWwzXkPJ5S0yodY1vyqukqDywxWtCXg@mail.gmail.com>
Subject: Re: arm: DomU Networking enable leads to Dom0 kernel oops
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 25 Apr 2020 at 03:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> [   86.900974] ------------[ cut here ]------------
> [   86.905134] Interrupt for port 6, but apparently not enabled; per-user (____ptrval____)
> [   86.913228] WARNING: CPU: 0 PID: 2437 at drivers/xen/evtchn.c:167 evtchn_interrupt+0xfc/0x108

The implementation of the evtchn_interrupt() is relying to be called
in the top-half. On RT, interrupts handlers are forced to be threaded
and use the IRQF_ONESHOT semantics if they were not threaded before.

However, IRQF_ONESHOT is completely broken for event channels (this is
not RT's fault) and hence why you see the warning here.

Note that you can't force to run evtchn_interrupt() in the top-half
because it relies on functions that may sleep.

See https://lkml.org/lkml/2019/2/19/642.

Cheers,

-- 
Julien Grall

