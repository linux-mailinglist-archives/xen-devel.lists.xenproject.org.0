Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AE1324030
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 16:26:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89395.168342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw2w-0005zQ-Hy; Wed, 24 Feb 2021 15:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89395.168342; Wed, 24 Feb 2021 15:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEw2w-0005z1-Ea; Wed, 24 Feb 2021 15:25:50 +0000
Received: by outflank-mailman (input) for mailman id 89395;
 Wed, 24 Feb 2021 15:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0005yt-OH
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0008VU-L5
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lEw2u-0002KD-II
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 15:25:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lEw2r-0007FN-DC; Wed, 24 Feb 2021 15:25:45 +0000
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
	bh=vT0V/nBbFysqrIXy7cxIeUMkTZqRkdZEUb07V9dNfbA=; b=y9Cxd9Wm863VTIvOMtaGunzOMn
	rmk9Ohrwiwr1I1KxwxWAmy5hgeRetU0c1PiMDzj2p3YcGr8S2RhiwpZOB4gjBMQkVEseoS+Owy9Ov
	q1sZZ6BFVJmk03kfY6meUPMNs+nLvyJRJWqpY/T8dAngCzfCBbMU7N9ti6WQe0/XEwog=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <24630.28665.162235.719938@mariner.uk.xensource.com>
Date: Wed, 24 Feb 2021 15:25:45 +0000
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Andrew Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH for-4.15] elfstructs: add relocation defines for i386
In-Reply-To: <20210224145856.94465-1-roger.pau@citrix.com>
References: <20210224145856.94465-1-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH for-4.15] elfstructs: add relocation defines for i386"):
> Those are need by the rombios relocation code in hvmloader. Fixes the
> following build error:
> 
> 32bitbios_support.c: In function 'relocate_32bitbios':
> 32bitbios_support.c:130:18: error: 'R_386_PC32' undeclared (first use in this function); did you mean 'R_X86_64_PC32'?
>              case R_386_PC32:
>                   ^~~~~~~~~~
>                   R_X86_64_PC32
> 32bitbios_support.c:130:18: note: each undeclared identifier is reported only once for each function it appears in
> 32bitbios_support.c:134:18: error: 'R_386_32' undeclared (first use in this function)
>              case R_386_32:
>                   ^~~~~~~~
> 
> Only add the two defines that are actually used, which seems to match
> what we do for amd64.
> 
> Fixes: 81b2b328a26c1b ('hvmloader: use Xen private header for elf structs')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

