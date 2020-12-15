Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7162DB1BB
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 17:46:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.54664.95148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDSx-0001fj-Mj; Tue, 15 Dec 2020 16:46:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54664.95148; Tue, 15 Dec 2020 16:46:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpDSx-0001fH-J9; Tue, 15 Dec 2020 16:46:23 +0000
Received: by outflank-mailman (input) for mailman id 54664;
 Tue, 15 Dec 2020 16:46:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0G7T=FT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kpDK2-000667-IL
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 16:37:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id daa7a249-4b04-4f2e-b2fc-307e7cd90ff9;
 Tue, 15 Dec 2020 16:36:36 +0000 (UTC)
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
X-Inumbo-ID: daa7a249-4b04-4f2e-b2fc-307e7cd90ff9
Date: Tue, 15 Dec 2020 08:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1608050195;
	bh=/ci9mZ+yx/ofabk1Z8BtUgyoxeNEGUxytxqspy+rg6M=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=rlUNJ7Z5XFrkrvkJZsPgmqn9UIAsKotuT1HbiOXLB/zvvh5WtA9efww/8cg9XZ0k9
	 uSdkD7bXpRSQFBnaHRBaJiHDzQLbrTHs4UPh3OoczpGqJLO1doqzK325p0hFt3NIDj
	 Z3z206QE0De+nT3NibZiD75Kch2q2oacCIm1q2bTFGAt2X9L5tZfsuk/iw+OuN1IiE
	 bikvMxx//UanYOjzQaxnhmVHWhAbCqL1ygIWpdCP7QFRBc1CYWhpaFu14A7YBT5vTo
	 IsBtAIFiMyStnP6OeGfJUwSF5x8GNgmwsroe2/I0WmTUiE5K9dLDACvYppIq9+d01r
	 XZTdXJIGm56rQ==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Roman Shaposhnik <roman@zededa.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Oleksandr_Andrushchenko@epam.com, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-ARM DomUs
In-Reply-To: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2012150828170.4040@sstabellini-ThinkPad-T480s>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 14 Dec 2020, Elliott Mitchell wrote:
> Finally getting to the truly productive stages of my project with Xen on
> ARM.
> 
> How many of the OSes which function as x86 DomUs for Xen, function as
> ARM DomUs?  Getting Linux operational was straightforward, but what of
> others?

I know of FreeRTOS, Zephyr, VxWorks.


> The available examples seem geared towards Linux DomUs.  I'm looking at a
> FreeBSD installation image and it appears to expect an EFI firmware.
> Beyond having a bunch of files appearing oriented towards booting on EFI
> I can't say much about (booting) FreeBSD/ARM DomUs.

Running EFI firmware in a domU is possible with both Tianocore and
U-Boot. You should be able to build the firmware and pass it as a
kernel= binary in the xl file. Then the firmware will be able to load
the necessary binaries from the virtual disk.

I ran Tianocore this way years ago. Recently, u-boot has been ported to
be run in a domU by Oleksandr Andrushchenko (CCed).

