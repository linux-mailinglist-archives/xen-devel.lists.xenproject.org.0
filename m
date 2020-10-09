Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6027C288EFE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Oct 2020 18:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.4843.12702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQvL9-00062j-IK; Fri, 09 Oct 2020 16:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4843.12702; Fri, 09 Oct 2020 16:33:55 +0000
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
	id 1kQvL9-00062K-FB; Fri, 09 Oct 2020 16:33:55 +0000
Received: by outflank-mailman (input) for mailman id 4843;
 Fri, 09 Oct 2020 16:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2c2X=DQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kQvL7-00062F-BR
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 16:33:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f1892fc-18ba-47f6-974b-dd71bea30ff5;
 Fri, 09 Oct 2020 16:33:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57BBA22280;
 Fri,  9 Oct 2020 16:33:51 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2c2X=DQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kQvL7-00062F-BR
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 16:33:53 +0000
X-Inumbo-ID: 2f1892fc-18ba-47f6-974b-dd71bea30ff5
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2f1892fc-18ba-47f6-974b-dd71bea30ff5;
	Fri, 09 Oct 2020 16:33:52 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 57BBA22280;
	Fri,  9 Oct 2020 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602261231;
	bh=WKdJ1VOpMjQrC+6IyJVrHwUYIe6GzX5YhmHEQTDw0Mw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=0T7qB4CjvKJ1NLKLfuaY11dPutqryz2wEvQoXh+xPgmwkisMP5Lyi/1RLW4GTyHXo
	 EYN88PQn33e3KChc7cUKN+gtyxP1HR86u0w0XpDjcF5yMX1FrG4mwFik29W3L4xaUw
	 lyHdnghvxKLPFd75NrerlTQWhOeUgYNLwQc6oxxo=
Date: Fri, 9 Oct 2020 09:33:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "open list:X86" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    "roman@zededa.com" <roman@zededa.com>
Subject: Re: [PATCH v3] xen/rpi4: implement watchdog-based reset
In-Reply-To: <B196761E-78D7-4891-A28E-E04E0B85A202@arm.com>
Message-ID: <alpine.DEB.2.21.2010090933240.23978@sstabellini-ThinkPad-T480s>
References: <20201007223813.1638-1-sstabellini@kernel.org> <1A694341-33AC-41E1-B216-2D3E1A6C45B4@arm.com> <alpine.DEB.2.21.2010081103110.23978@sstabellini-ThinkPad-T480s> <B196761E-78D7-4891-A28E-E04E0B85A202@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Oct 2020, Bertrand Marquis wrote:
> > On 8 Oct 2020, at 19:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > 
> > On Thu, 8 Oct 2020, Bertrand Marquis wrote:
> >>> On 7 Oct 2020, at 23:38, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >>> 
> >>> The preferred method to reboot RPi4 is PSCI. If it is not available,
> >>> touching the watchdog is required to be able to reboot the board.
> >>> 
> >>> The implementation is based on
> >>> drivers/watchdog/bcm2835_wdt.c:__bcm2835_restart in Linux v5.9-rc7.
> >>> 
> >>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> >>> Acked-by: Julien Grall <jgrall@amazon.com>
> >> 
> >> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> 
> >> Maybe a printk if reset was not successful ?
> > 
> > That not quite platform specific but we could add a printk to
> > xen/arch/arm/shutdown.c:machine_restart if we are still alive after
> > 100ms.
> 
> Even nicer :-)
> Definitely usefull to see something if for one reason reset/restart did
> not succeed for whatever reason.
> 
> > 
> > I'll commit this patch as is and maybe send another one for
> > machine_restart.
> 
> Please tell me if you want me to handle that one (at the end I did request
> that so not really fare to ask you to do it:-) ).

Since you are volunteering, yes please :-)

