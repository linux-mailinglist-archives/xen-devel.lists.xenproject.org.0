Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 402893EECA3
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 14:41:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167826.306383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyOd-0003ER-2o; Tue, 17 Aug 2021 12:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167826.306383; Tue, 17 Aug 2021 12:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFyOc-0003C1-UU; Tue, 17 Aug 2021 12:40:46 +0000
Received: by outflank-mailman (input) for mailman id 167826;
 Tue, 17 Aug 2021 12:40:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyOb-0003Bv-Aq
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:40:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyOb-0005bP-8Q
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:40:45 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mFyOb-0003gU-7O
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 12:40:45 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mFyOX-00041S-Ub; Tue, 17 Aug 2021 13:40:41 +0100
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
	bh=jptwKW6gHB9qUK7dXWcMKuxzHbYUFvhXn6ufoZROtgY=; b=3dVjpvcUhqRPeXK7SU1N/bG9zR
	YeSqdjj+7wHlo7kMj3H0ERYH2r/biglIxfprNBt9pz/TX68IjqkfinMkQxh4ZwX+JvnE1zmMd5cf+
	A/8pqpOxJWzOlT4/Bz4VW+H4mhk+dhPHLls/MDKueS7JvWbBFT5LhqER0M+4r8IeVqHQ=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24859.44617.658107.36709@mariner.uk.xensource.com>
Date: Tue, 17 Aug 2021 13:40:41 +0100
To: Jason Andryuk <jandryuk@gmail.com>,
    xen-devel@lists.xenproject.org,
    pdurrant@amazon.com,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
    Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>,
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2] libxl: Fix stubdom PCI passthrough
In-Reply-To: <24859.43747.87671.739214@mariner.uk.xensource.com>
References: <20210812005700.3159-1-jandryuk@gmail.com>
	<24859.43747.87671.739214@mariner.uk.xensource.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

> I looked through the git history.

Also there are some doc comments in libxl_internal.h.

In particular "Algorithm for handling device removal"
(near l.2844 in my tree) and the following

I don't think that diagram has been modified since I drew it, so it
may well be out of date.  Indeed I hope at least the new QMP
arrangements aren't racy...

And, "As of Xen 4.5 we maintain various information"
which describes the various locks and has a proof
sketch for correct operation.

Ian.

