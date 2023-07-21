Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9074D75D720
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jul 2023 00:07:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567708.887108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyGp-0004Hm-Oc; Fri, 21 Jul 2023 22:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567708.887108; Fri, 21 Jul 2023 22:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMyGp-0004GA-Lt; Fri, 21 Jul 2023 22:06:43 +0000
Received: by outflank-mailman (input) for mailman id 567708;
 Fri, 21 Jul 2023 22:06:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BzSz=DH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qMyGo-0004G4-Bp
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 22:06:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dca6022f-2812-11ee-b23a-6b7b168915f2;
 Sat, 22 Jul 2023 00:06:40 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 411F761DA8;
 Fri, 21 Jul 2023 22:06:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D07EBC433C7;
 Fri, 21 Jul 2023 22:06:34 +0000 (UTC)
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
X-Inumbo-ID: dca6022f-2812-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689977195;
	bh=pJgkglgc3pvqlVFwe/HeY4tVAnp+vBrGU7p9CGFxkHQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m1RB3xQgBom9XHwmpwD/P23lA0iPsN9L7RTmmkZG0HmCNvCYoBsOnkiU5k8QkdpCx
	 KDg+hjmMT+RIjGRQ+c27h0sKFu+G8jHOjwDHBlLBiX51hTRK+25rswXFS9a+RL7Ziq
	 K34IMyLp1H51U/EmHw/i8MYDTs6uxFFDQQSSl7owTvg+Qu7VFHjcxDcRwF03pbXdR0
	 i0vzCRXHuhkOG6UysDrkMTJ4d2OjSKBpS0lb6ohLBkVDa9EVPkiFYHJ2r8fTG7oIfd
	 d7MmyaK7QP65laQOfl6vLNnNJMOQL9Y1ciiQAGKb+tUEJWGFrwdW1Ey5YD06fXB0DM
	 iNlplp1uyrfyQ==
Date: Fri, 21 Jul 2023 15:06:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    xen-devel@lists.xenproject.org, george.mocanu@nxp.com, 
    Juergen Gross <jgross@suse.com>
Subject: Re: [ARM][xencons] PV Console hangs due to illegal ring buffer
 accesses
In-Reply-To: <d7f16516-a009-27a2-497a-2c48eab3df3e@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2307211506110.3118466@ubuntu-linux-20-04-desktop>
References: <62eeff72-c1fb-6932-6797-1b0058c97b03@oss.nxp.com> <048266d6-a32f-5f4e-984a-8b74de01a1fc@xen.org> <alpine.DEB.2.22.394.2307201609030.3118466@ubuntu-linux-20-04-desktop> <d7f16516-a009-27a2-497a-2c48eab3df3e@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 21 Jul 2023, Andrei Cherechesu (OSS) wrote:
> > I am really confused. I would try with regular Linux instead of Linux RT
> > and also would try to replace all the barriers in
> > drivers/tty/hvc/hvc_xen.c with their virt_* version to see if we can
> > narrow down the problem a bit.
> > 
> 
> Unfortunately, we do not normally run regular Linux and we do not have a
> stable regular Linux version with our HW support ported on it. We've been running
> Linux RT since 4.14 (or even earlier I think), but this issue has started to happen
> since we upgraded to Xen 4.17 (from 4.14), with both Linux RT 5.15 and 5.10.

I saw that George tried both suggestions without making progress.

This is a very difficult bug. If Xen 4.14 works and the issue starts
with Xen 4.17, then I would try to bisect it (try Xen 4.15, 4.16, etc.
until you narrow down the commit).

