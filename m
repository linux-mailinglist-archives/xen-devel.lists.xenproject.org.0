Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB93D32EBFB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Mar 2021 14:23:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.93686.176755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAPG-0006Ng-N6; Fri, 05 Mar 2021 13:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93686.176755; Fri, 05 Mar 2021 13:22:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAPG-0006NK-Iy; Fri, 05 Mar 2021 13:22:14 +0000
Received: by outflank-mailman (input) for mailman id 93686;
 Fri, 05 Mar 2021 13:22:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0006NF-Pg
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0006fT-ML
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lIAPF-0001eF-J9
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:22:13 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lIAPC-0008NU-06; Fri, 05 Mar 2021 13:22:10 +0000
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
	bh=U+oSM8NTf2wdmz90OwMqDCXJpXj1kjl1csmbly+z8YA=; b=UofpYBbIXLshve0XJcezXUiSvc
	tDmbJA4zNzlQRwP7FI9h3pR/falPcbTa29C7tUV/hMnlbuAvE6/tvb6qHsD9sMK3s6TmSpYe+ixLC
	nuruCWwe9DtFvIiAHtRbiIGNxinkFA+B18swjn5JUewTqhfW07y3mewKEddoOroofnlk=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24642.12417.651929.972294@mariner.uk.xensource.com>
Date: Fri, 5 Mar 2021 13:22:09 +0000
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
    raphning@amazon.co.uk,
    iwj@xenproject.org,
    Julien Grall <jgrall@amazon.com>,
    Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters
In-Reply-To: <20210305121029.7047-1-julien@xen.org>
References: <20210305121029.7047-1-julien@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Julien Grall writes ("[PATCH for-4.15] tools/xenstored: liveupdate: Increase the maximum number of parameters"):
> From: Julien Grall <jgrall@amazon.com>
> 
> The longest possible command line for LiveUpdate is:
> 
>   liveupdate -s -t <timeout> -F
> 
> This is 5 parameters. However, the maximum is currently specified to 4.
> This means the some of the parameters will get ignored.

Why are the extra parameters ignored rather than treated as errors ?
This seems like an invitation to making code with bad behaviour
(perhaps bad security-relevant behaviour).

CC Juergen who seems to have written the code...

> Update the field max_pars to 5 so and admin can specify the timeout and
> force at the same time.

Anyway, for this patch,

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

