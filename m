Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7383087D9
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:34:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77920.141481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R6R-0006rp-EU; Fri, 29 Jan 2021 10:34:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77920.141481; Fri, 29 Jan 2021 10:34:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5R6R-0006rQ-BK; Fri, 29 Jan 2021 10:34:11 +0000
Received: by outflank-mailman (input) for mailman id 77920;
 Fri, 29 Jan 2021 10:34:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5R6Q-0006rL-DZ
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:34:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5R6Q-0003Pq-C0
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:34:10 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l5R6Q-00035l-BA
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:34:10 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l5R6L-00075h-Hz; Fri, 29 Jan 2021 10:34:05 +0000
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
	bh=mgHKHA1GFWjM0bqlXQBxkMLD0bttjh+doVCF/BfCW00=; b=Nt1qtLElqd0DP7RV281gfNv882
	xJHURZkznTpnkyLLVe/rwFsXhuMivH+FURXkuHhDBPEeiULUGkyUUGUCYb4EpopLDmuhuZ7t2ie0x
	mpLR3+zGuwnyb4b4ygH7YNF4r/3BEm8ggctB4ha2y07Sj9RTPtu/azzP2/rOkh3rcev0=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24595.58525.350480.293258@mariner.uk.xensource.com>
Date: Fri, 29 Jan 2021 10:34:05 +0000
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
    Julien Grall <julien.grall@arm.com>
Subject: [TOOLS ACK needed] Re: [PATCH V6 18/24] xen/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <7bffd24d-e30b-ecad-4725-721523036a5d@xen.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
	<1611884932-1851-19-git-send-email-olekstysh@gmail.com>
	<7bffd24d-e30b-ecad-4725-721523036a5d@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[TOOLS ACK needed] Re: [PATCH V6 18/24] xen/dm: Introduce xendevicemodel_set_irq_level DM op"):
> On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> > From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > 
> > This patch adds ability to the device emulator to notify otherend
...
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> > Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> > Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> > [On Arm only]
> > Tested-by: Wei Chen <Wei.Chen@arm.com>
> 
> @Ian, @Wei, can we get an ack for the tools part?

Indeed, for the tools part:

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

Thanks,
Ian.

