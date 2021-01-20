Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8932FD6C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 18:19:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71653.128477 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8c-00024j-TN; Wed, 20 Jan 2021 17:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71653.128477; Wed, 20 Jan 2021 17:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2H8c-00024K-QP; Wed, 20 Jan 2021 17:19:22 +0000
Received: by outflank-mailman (input) for mailman id 71653;
 Wed, 20 Jan 2021 17:19:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-00023w-Cx
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-0005mD-9Q
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l2H8b-0006EE-5H
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 17:19:21 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l2H8W-0006Wq-EB; Wed, 20 Jan 2021 17:19:16 +0000
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
	bh=lkoJsajRTqjuaapzrzmjxAR0UBpZZkSuxjJ7ke69Nps=; b=IOAAIdzsrn7sprxSUbQB4y3bKv
	WdB6vN/lFSJ0sxjuv20EjirvkDIrSjeWSvns8v5iq+H9xnbAx0/3OLOHrAP5/Rg7MjMJ7N9HVbvPM
	7CEOsrm3U3s++fkdo5T/ljLNdtoPzSY+P2Cy38BChUkaYw0AadmB+BjKYR2L6C8tSGeA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24584.26132.215376.983496@mariner.uk.xensource.com>
Date: Wed, 20 Jan 2021 17:19:16 +0000
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 05/24] Introduce locking functions for block device setup
 on NetBSD
In-Reply-To: <20210120165923.GC5035@antioche.eu.org>
References: <20201214163623.2127-1-bouyer@netbsd.org>
	<20201214163623.2127-6-bouyer@netbsd.org>
	<20201229112909.kprjtysxkg4p6y2i@Air-de-Roger>
	<20210104102037.GA2005@antioche.eu.org>
	<24584.18578.623201.789017@mariner.uk.xensource.com>
	<20210120155900.GA5035@antioche.eu.org>
	<24584.22125.355284.48139@mariner.uk.xensource.com>
	<20210120165923.GC5035@antioche.eu.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("Re: [PATCH 05/24] Introduce locking functions for block device setup on NetBSD"):
> Right, thanks. Then it would need to be done with 2 different calls
> but I don't think that's a problem (even with the linux version it would
> not be atomic anyway).

Sorry, I forgot to reply to this.  Yes, it would need to invocations
of stat(1).  You are correct that the Linux version is not atomic in
that sense.

Ian.

