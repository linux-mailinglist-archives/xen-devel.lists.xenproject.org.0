Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6263214CF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 12:10:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.87968.165238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE96d-0006PN-Gb; Mon, 22 Feb 2021 11:10:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 87968.165238; Mon, 22 Feb 2021 11:10:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lE96d-0006Oy-D3; Mon, 22 Feb 2021 11:10:23 +0000
Received: by outflank-mailman (input) for mailman id 87968;
 Mon, 22 Feb 2021 11:10:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE96c-0006Ot-Ic
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:10:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE96c-0006fj-GD
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:10:22 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lE96c-0005Z3-EV
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 11:10:22 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lE96Z-0000iu-6C; Mon, 22 Feb 2021 11:10:19 +0000
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
	bh=Gn3ncHkmdy8iMJV2ipgldzvFX6Ln7JH5odnom5ookYc=; b=gFwa+jkUZIseff/QPpcFeo3M8k
	4hl8LsRcL0zfdihSzQ6iGmW3SE5itszcdQi2fJEN4MliHwUhVfnmHKk36ev9Ysh5Kw2CQYD0YOl9D
	Lv99ISAJX8RmSHxDzjV9jexT5JchQ6WBDRl9ouvjshCYmAPjweRZ5X1M4WAB2wrC2BVc=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24627.37145.647801.601857@mariner.uk.xensource.com>
Date: Mon, 22 Feb 2021 11:10:17 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    bertrand.marquis@arm.com,
    Julien Grall <jgrall@amazon.com>,
    Stefano Stabellini <sstabellini@kernel.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2, 3}
In-Reply-To: <20210220140412.31610-1-julien@xen.org>
References: <20210220140412.31610-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2, 3}"):
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, Xen will send a data abort to a guest trying to write to the
> ISPENDR.
> 
> Unfortunately, recent version of Linux (at least 5.9+) will start
> writing to the register if the interrupt needs to be re-triggered
> (see the callback irq_retrigger). This can happen when a driver (such as
> the xgbe network driver on AMD Seattle) re-enable an interrupt:

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

