Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D20024497E0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 16:12:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223447.386175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6JE-0000rg-Jn; Mon, 08 Nov 2021 15:11:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223447.386175; Mon, 08 Nov 2021 15:11:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk6JE-0000oD-FH; Mon, 08 Nov 2021 15:11:44 +0000
Received: by outflank-mailman (input) for mailman id 223447;
 Mon, 08 Nov 2021 15:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6JD-0000nq-Qg
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:11:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6JD-0006gT-Pc
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:11:43 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mk6JD-000564-Os
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 15:11:43 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mk6JA-0001E6-7m; Mon, 08 Nov 2021 15:11:40 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:To:Date:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=VPYDy8yFVDD+iYmPD3vH5SEJudGLcubOYDdAYdGaoio=; b=x+7vLyZP3IPy4p5f3WA2idxU1M
	62RFF5F4WshofJuZBFuEPwAtm8Kylf7g5KP4xdpuoOWDEED6MgW5NRh5Pbdu62Cs9+N2AhW9WczwJ
	GgdTw6VspcQpjqMh3HQTSehXndCPpDbULY4hkcQaEpJhYTUrA+mt0qXPl/0Lr8c1cuq4=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24969.15915.743915.85438@mariner.uk.xensource.com>
Date: Mon, 8 Nov 2021 15:11:39 +0000
To: Roger Pau Monne <roger.pau@citrix.com>,
    <xen-devel@lists.xenproject.org>,
    Wei Liu <wl@xen.org>,
    Andrew  Cooper <andrew.cooper3@citrix.com>,
    George Dunlap <george.dunlap@citrix.com>,
    Jan Beulich <jbeulich@suse.com>,
    Julien Grall <julien@xen.org>,
    Stefano  Stabellini <sstabellini@kernel.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Christian  Lindig <christian.lindig@citrix.com>,
    David Scott <dave@recoil.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain
In-Reply-To: <24963.52367.786659.412345@mariner.uk.xensource.com>
References: <20211104104834.10977-1-roger.pau@citrix.com>
	<24963.52367.786659.412345@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

I have collected the acks and pushed these.

While doing so I found this in the thread:

Ian Jackson writes ("Re: [PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> Roger Pau Monne writes ("[PATCH for-4.16 v6] gnttab: allow setting max version per-domain"):
> > NB: the stubdom max grant version is cloned from the domain one. Not
> > sure whether long term we might want to use different options for the
> > stubdom and the domain. In any case the attack surface will always be
> > max(stubdom, domain), so maybe it's just pointless to allow more fine
> > grained settings.
> 
> ^ I think maybe this should go into a comment or commit message or
> something, not just a tail note ?

Maybe this should go into a code comment ?

Ian.

