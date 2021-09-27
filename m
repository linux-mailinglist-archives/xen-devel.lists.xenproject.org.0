Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D4541979C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 17:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197077.350029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUsPd-00029e-B9; Mon, 27 Sep 2021 15:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197077.350029; Mon, 27 Sep 2021 15:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUsPd-000279-8B; Mon, 27 Sep 2021 15:19:25 +0000
Received: by outflank-mailman (input) for mailman id 197077;
 Mon, 27 Sep 2021 15:19:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsPb-000273-JD
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:19:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsPb-0002Dn-DB
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:19:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mUsPb-0000yv-B4
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 15:19:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mUsPW-0000t9-Hb; Mon, 27 Sep 2021 16:19:18 +0100
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
	bh=C0Jllf5TlpxccxZtyP4hirSV3tpXHtXnYRJGy/CTvKs=; b=s8Y35rwq5XWlojd5YXj/FEBGsu
	bSunfPlrX4KqOlk+gsxeQJ51BYgQrPRpDU9c1TosUgRVqlKlnd6eE7L4fiarQ83a8Hp0kmSCFRfBQ
	hZPnszH95rtyuzuU/sv7/tnYBfQ7kS08Gk8jAJ4l4x0ChMMg6CX72BoIOjZ1zjivF6qc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24913.57590.165404.759779@mariner.uk.xensource.com>
Date: Mon, 27 Sep 2021 16:19:18 +0100
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
    xen-devel@lists.xenproject.org,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
In-Reply-To: <e56b9881-5a82-0180-765a-102fafab13ed@suse.com>
References: <20210927104813.19772-1-jgross@suse.com>
	<20210927104813.19772-3-jgross@suse.com>
	<f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
	<20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
	<9076ecc3-8509-f687-df11-82a561cb5b2d@citrix.com>
	<825e7a37-c39d-4cea-0992-268945ad118e@suse.com>
	<8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>
	<e56b9881-5a82-0180-765a-102fafab13ed@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Juergen Gross writes ("Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for xenstored"):
> Should I send out another version, or can this be done when committing?

In any case I think you should send another version.

If you don't agree with my suggestion to check /proc/sys/fs/nr_open,
then you could usefully explain in the commit message why we're not
doing that.  If you do agree please include the links from my mail.

Ian.

