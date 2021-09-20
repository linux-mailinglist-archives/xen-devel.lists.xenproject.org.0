Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EB04112EC
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:34:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190676.340464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGcy-0007Iw-RR; Mon, 20 Sep 2021 10:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190676.340464; Mon, 20 Sep 2021 10:34:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGcy-0007H9-OO; Mon, 20 Sep 2021 10:34:24 +0000
Received: by outflank-mailman (input) for mailman id 190676;
 Mon, 20 Sep 2021 10:34:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0007H3-9r
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0004jd-95
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mSGcx-0006d7-8I
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:34:23 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mSGcu-0005Tu-33; Mon, 20 Sep 2021 11:34:20 +0100
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
	bh=+tKE82eIy0f699InwlfCUc6vRoD1PpPgEdrGJLTDL3Q=; b=srY2peH1G4gWpRNhrcbl3TxKwr
	XqCJ1IyJoUhsxqtscvX2dhVZswsK14I+U6PQP7fp2qV4oBTjCITS5AfAj16U4daPwI8uUwoOt8+Mx
	hP0pCXSHlIq1P4AUjh5KJFjAMSOJc0W5Wj+RgcxSUSJlFm1t0lXw828ZgSYP/LdhX8PA=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24904.25515.842754.402625@mariner.uk.xensource.com>
Date: Mon, 20 Sep 2021 11:34:19 +0100
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: <xen-devel@lists.xenproject.org>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>
Subject: Re: [PATCH 4/6] tools/xenstored: use atexit to close interfaces
In-Reply-To: <20210917154625.89315-5-roger.pau@citrix.com>
References: <20210917154625.89315-1-roger.pau@citrix.com>
	<20210917154625.89315-5-roger.pau@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Roger Pau Monne writes ("[PATCH 4/6] tools/xenstored: use atexit to close interfaces"):
> Exploiting the talloc clean up routines to close the Xen interfaces
> is cumbersome, specially when atexit can be used to the same effect.

Wait, what ?  Why do we need to do this at all ?  xenstored can't be
restarted so if it exits we might as well leave whatever wreckage.

AIUI the live update doesn't end up calling atexit ?

Ian.

