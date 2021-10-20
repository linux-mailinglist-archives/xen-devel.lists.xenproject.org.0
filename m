Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753D9434C1C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 15:30:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213936.372313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBfY-0004Ut-4T; Wed, 20 Oct 2021 13:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213936.372313; Wed, 20 Oct 2021 13:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBfY-0004S0-0h; Wed, 20 Oct 2021 13:30:12 +0000
Received: by outflank-mailman (input) for mailman id 213936;
 Wed, 20 Oct 2021 13:30:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdBfW-0004Qu-6T
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:30:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdBfW-0005s2-0t
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:30:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mdBfV-0007du-VQ
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:30:09 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mdBfR-0003n4-1v; Wed, 20 Oct 2021 14:30:05 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=eZ6MegWRPSGQaG9q3EkdReaPvzP+i7ivEkeHV7d9fJk=; b=Ai5UmBROqeBFDABOBTuArF7Hfx
	Ed8rbYDp7Fwec2JAOMV5eKYCNJpbiuXK8Sqh0Um6O63cDYk2E3qUjkCBqCaZDp2WlRw8K4uBVOgow
	QqXtKTzU6jQsKzv4DMUBkLwTQ2zUG224bH3bImrHMwqDCRaEpw2XXpxpW9mb3XLivtYo=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24944.6620.647052.30281@mariner.uk.xensource.com>
Date: Wed, 20 Oct 2021 14:30:04 +0100
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Hongda Deng <Hongda.Deng@arm.com>,
    Xen-devel <xen-devel@lists.xenproject.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Julien Grall <julien@xen.org>,
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access
In-Reply-To: <87512F00-48DA-4E66-B3A8-47F48B9C6A87@arm.com>
References: <20211020101021.9793-1-Hongda.Deng@arm.com>
	<87512F00-48DA-4E66-B3A8-47F48B9C6A87@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

~Bertrand Marquis writes ("Re: [PATCH v3] xen/arm: vgic to ignore GICD ICPENDRn registers access"):
> [+Ian]
> > On 20 Oct 2021, at 11:10, Hongda Deng <Hongda.Deng@arm.com> wrote:
> > 
> > Currently, Xen will return IO unhandled when guests access GICD ICPENRn
> > registers. This will raise a data abort inside guest. For Linux Guest,
> > these virtual registers will not be accessed. But for Zephyr, in its
> > GIC initialization code, these virtual registers will be accessed. And
> > zephyr guest will get an IO data abort in initilization stage and enter
> > fatal error. Emulating ICPENDR is not easy with the existing vGIC, so
> > we currently ignore these virtual registers access and print a message
> > about whether they are already pending instead of returning unhandled.
> > More details can be found at [1].
> > 
> > [1] https://github.com/zephyrproject-rtos/zephyr/blob/eaf6cf745df3807e6e
> > cc941c3a30de6c179ae359/drivers/interrupt_controller/intc_gicv3.c#L274
> > 
> > Signed-off-by: Hongda Deng <hongda.deng@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Ian this is fixing a bug in the vgic implementation which is preventing to run
> Zephyr as a guest on top of Xen. Xen support has now been merged in Zephyr
> so this is required to use it.
> 
> Could we consider adding this patch into the 4.16 release ?

Hi.  I'm definitely open to the idea, especially if it goes in soon.

I think this needs an ARM maintainer review, still ?

It doesn't seem entirely straightforward.  I'd like to hear from the
maintainer, to confirm that they agree it's a bugfix, and to get an
idea of the risks vs benefits of this patch.

Thanks,
Ian.

