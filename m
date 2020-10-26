Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679B4298FF5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 15:53:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12377.32232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX3rf-0005DS-Gt; Mon, 26 Oct 2020 14:52:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12377.32232; Mon, 26 Oct 2020 14:52:51 +0000
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
	id 1kX3rf-0005D3-DY; Mon, 26 Oct 2020 14:52:51 +0000
Received: by outflank-mailman (input) for mailman id 12377;
 Mon, 26 Oct 2020 14:52:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cOiY=EB=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
 id 1kX3rd-0005Cu-R9
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:49 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e9d222-4b93-4956-936a-306462ed313d;
 Mon, 26 Oct 2020 14:52:48 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kX3rc-0006AX-Hp
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:48 +0000
Received: from iwj (helo=mynotebook.example.org)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1kX3rc-000431-Fv
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1kX3rZ-0008BG-91; Mon, 26 Oct 2020 14:52:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=cOiY=EB=xenproject.org=iwj@srs-us1.protection.inumbo.net>)
	id 1kX3rd-0005Cu-R9
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:49 +0000
X-Inumbo-ID: a3e9d222-4b93-4956-936a-306462ed313d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a3e9d222-4b93-4956-936a-306462ed313d;
	Mon, 26 Oct 2020 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=J4t3I45qo0MSJRdxlzUiS2RCquAvBHxQiIf0rb90sLg=; b=FYbVfupl8uBi97NgkR99qB8aby
	WkTOazNURWGuR3U/eIudK1E1jec3QA5GEJkUFKA01eCxWu2mtdna8B0erG8+KBsCGuEbmdiDsXFkM
	P+wpZuYifnJwMWr87KEK4VoyNg3A9Ft/7x8wlNM6jBdIUMQGuA2EGiPeifU2g+oh1JZc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kX3rc-0006AX-Hp
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:48 +0000
Received: from iwj (helo=mynotebook.example.org)
	by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
	(envelope-from <iwj@xenproject.org>)
	id 1kX3rc-000431-Fv
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 14:52:48 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
	(envelope-from <iwj@xenproject.org>)
	id 1kX3rZ-0008BG-91; Mon, 26 Oct 2020 14:52:45 +0000
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24470.58045.89332.837032@mariner.uk.xensource.com>
Date: Mon, 26 Oct 2020 14:52:45 +0000
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel\@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH] ts-xen-build-prep: Install ninja
In-Reply-To: <20201020093549.270000-1-anthony.perard@citrix.com>
References: <20201020093549.270000-1-anthony.perard@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Anthony PERARD writes ("[OSSTEST PATCH] ts-xen-build-prep: Install ninja"):
> QEMU upstream now requires ninja to build. (Probably since QEMU commit
> 09e93326e448 ("build: replace ninjatool with ninja"))
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

and pushed, thanks.

Ian.

