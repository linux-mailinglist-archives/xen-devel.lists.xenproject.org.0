Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B165A890B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 00:36:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396080.636072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWJ6-00023Y-62; Wed, 31 Aug 2022 22:35:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396080.636072; Wed, 31 Aug 2022 22:35:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTWJ6-00020h-2X; Wed, 31 Aug 2022 22:35:36 +0000
Received: by outflank-mailman (input) for mailman id 396080;
 Wed, 31 Aug 2022 22:35:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6oq=ZD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oTWJ4-00020a-BC
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 22:35:34 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38d891c5-297d-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 00:35:32 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 932EF61BD4;
 Wed, 31 Aug 2022 22:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74484C433D6;
 Wed, 31 Aug 2022 22:35:30 +0000 (UTC)
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
X-Inumbo-ID: 38d891c5-297d-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661985331;
	bh=DC1VEGygDCcJUfXuJEXvJIXN8QbELugtbZwVIq1aMyA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FqiTM34wFZakiXFoPjxxxOEG8N7qnpapxM1gaQ2rnbqKhFChmvkaEPYVJRcIj2hYv
	 duEhxrVEkDlrq5Cz0qUJLhJ0HCgMLOxcEPVVUF1GQ1L0NxI54j6xeDCNWCYjW4emp1
	 oe0dqqS200f0k+WkSh0dHmw8iIGARO3XqqMcwD3aRT3n1nsF8q003YrhjliXJWJV0R
	 Lvb5fiFNvL7sM5aWIhp311bb/J1egAcmRDXfDxX0w8yprtb+yGuP1ek+8x5C5kvNAm
	 rsyWeKa5LFNXboGkysktafLQVSncRUcvmaxAcMHcRGMqw+r4NsokRr+h+6U/ksqJoE
	 qGbo8YwfxfKPg==
Date: Wed, 31 Aug 2022 15:35:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH 0/7] Fix MISRA C 2012 Rule 20.7 violations
In-Reply-To: <20220819194359.1196539-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208311534070.2375071@ubuntu-linux-20-04-desktop>
References: <20220819194359.1196539-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Patches 1, 4, and 6 are already committed. I plan to commit patches 2, 3
and 5 in the next couple of days.

Patch 7 needs further discussions and it is best addressed during the
next MISRA C sync-up.


On Fri, 19 Aug 2022, Xenia Ragiadakou wrote:
> Xenia Ragiadakou (7):
>   xen/arm: gic_v3_its: Fix MISRA C 2012 Rule 20.7 violations
>   xsm/flask: sidtab: Fix MISRA C 2012 Rule 20.7 violations
>   xen/elf: Fix MISRA C 2012 Rule 20.7 violations
>   xen/vgic: Fix MISRA C 2012 Rule 20.7 violation
>   xen/rbtree: Fix MISRA C 2012 Rule 20.7 violation
>   xen/arm: processor: Fix MISRA C 2012 Rule 20.7 violations
>   xen/device_tree: Fix MISRA C 2012 Rule 20.7 violations
> 
>  xen/arch/arm/include/asm/gic_v3_its.h | 10 +++++-----
>  xen/arch/arm/include/asm/new_vgic.h   |  2 +-
>  xen/arch/arm/include/asm/processor.h  |  4 ++--
>  xen/include/xen/device_tree.h         |  6 +++---
>  xen/include/xen/elfstructs.h          |  4 ++--
>  xen/lib/rbtree.c                      |  2 +-
>  xen/xsm/flask/ss/sidtab.c             |  8 ++++----
>  7 files changed, 18 insertions(+), 18 deletions(-)
> 
> -- 
> 2.34.1
> 

