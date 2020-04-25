Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A18001B8565
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 11:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSHU6-00029Z-2g; Sat, 25 Apr 2020 09:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fCYS=6J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jSHU4-00029Q-2U
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 09:52:28 +0000
X-Inumbo-ID: 787038b4-86da-11ea-9e09-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 787038b4-86da-11ea-9e09-bc764e2007e4;
 Sat, 25 Apr 2020 09:52:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e26so13871145wmk.5
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2020 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mhiwjUVO3pvs9LohGSC/ZEgeoDI0uOiNlhznjfKLXb0=;
 b=n+WwkRDrGZvAc4dwegFPqwcnTq7llv6oSb5+I+Uv+dW/aWNaajD9FX9gwyEc1UVckh
 xsnbjJexxF0zOOchIA6AR0L4oz9dOxP6MXoW4DA1dkGyCPquWh7lJD5UYVHC6scHr+Fv
 6M7ICHjALapfAMZCpwnNtRah3K5Lo7F5+qpUtUYhP8Td2muj8VDuSnK3rXZ5N+XmFzjz
 OVBhA8kO2Nf1YWhJMwPzJ+jxa4IwRlRkAVd+E9/40FuLNdtUUXWZxj2X67WiVJDK9aVr
 vKnFg28ydnaFzpR1YfigpMsiPGpNkG4PIQMDz1i/sxD49cFswb17TFS2RLgmenD/1G7d
 QKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mhiwjUVO3pvs9LohGSC/ZEgeoDI0uOiNlhznjfKLXb0=;
 b=H1/1cUoIpwPkgPzeHDpnngf63jN4h/gf5rXamDAkiJJYVRCvaGR/qG/enIfKpe4g1r
 mHD9o9ya6YJ1OaHKcXOawNslrLDOuBP7QctRBqkTXJeDz9ehnjxG5nXOxjoirMrsc6j7
 U6wFonKNUSRdTPqHeHf1qcLjvrqQZJqUr+sb4URYmXQqLII63o4XOl2S5VoE3tvLPim+
 5U5nxVnnoJumSgJe14MtgN2l+hHpSgb4dVmaJu19n3h+BGL7/Lx0oCpNji1Ur0r99slV
 tmAowayPl9VuCQOg8d99nAl33qEF598ssnEZzSLYNp5+0Q+GWulsbGx0eIGcpYnTF6Eo
 CvmA==
X-Gm-Message-State: AGi0PuZ5J8rCDENw3VbiWGnyJSLMGhL508F+zejFRi4/uTZDXA9zEIsX
 GocufCtOQ9Jz05OgC+c7Ci7XZUUpGx8ulc+8pu4=
X-Google-Smtp-Source: APiQypKLdMR3b4cQH7v+TUtu9GDqHaPnB2anQehT+zego9pgV2TWlKpftI4p1rSdS8BWCCAr2IXRJgJTJ6gjn1Q5IcI=
X-Received: by 2002:a05:600c:28e:: with SMTP id
 14mr16005273wmk.79.1587808346645; 
 Sat, 25 Apr 2020 02:52:26 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR04MB505620B32C8289C6106D0B2AF9D00@VI1PR04MB5056.eurprd04.prod.outlook.com>
 <alpine.DEB.2.21.2004241443570.7982@sstabellini-ThinkPad-T480s>
 <CAJ=z9a284froER_-dNQKWwzXkPJ5S0yodY1vyqukqDywxWtCXg@mail.gmail.com>
In-Reply-To: <CAJ=z9a284froER_-dNQKWwzXkPJ5S0yodY1vyqukqDywxWtCXg@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 25 Apr 2020 10:52:15 +0100
Message-ID: <CAJ=z9a0s-KGyP--kFzBdohzf509toZBq6qHrnt8JQEaLAaQ7=Q@mail.gmail.com>
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

On Sat, 25 Apr 2020 at 10:49, Julien Grall <julien.grall.oss@gmail.com> wrote:
>
> On Sat, 25 Apr 2020 at 03:01, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > [   86.900974] ------------[ cut here ]------------
> > [   86.905134] Interrupt for port 6, but apparently not enabled; per-user (____ptrval____)
> > [   86.913228] WARNING: CPU: 0 PID: 2437 at drivers/xen/evtchn.c:167 evtchn_interrupt+0xfc/0x108
>
> The implementation of the evtchn_interrupt() is relying to be called
> in the top-half. On RT, interrupts handlers are forced to be threaded
> and use the IRQF_ONESHOT semantics if they were not threaded before.
>
> However, IRQF_ONESHOT is completely broken for event channels (this is
> not RT's fault) and hence why you see the warning here.
>
> Note that you can't force to run evtchn_interrupt() in the top-half
> because it relies on functions that may sleep.
>
> See https://lkml.org/lkml/2019/2/19/642.

Here at better link with the full conversation:

https://lore.kernel.org/lkml/5e256d9a-572c-e01e-7706-407f99245b00@arm.com/

>
> Cheers,
>
> --
> Julien Grall

