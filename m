Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 218C130E0F4
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:26:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80989.148774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LvW-0007GP-Pf; Wed, 03 Feb 2021 17:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80989.148774; Wed, 03 Feb 2021 17:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7LvW-0007G0-ML; Wed, 03 Feb 2021 17:26:50 +0000
Received: by outflank-mailman (input) for mailman id 80989;
 Wed, 03 Feb 2021 17:26:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LvV-0007Fr-6R
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:26:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LvV-0004p9-5j
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:26:49 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1l7LvV-0000gl-4q
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:26:49 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1l7LvQ-0005Zq-Ca; Wed, 03 Feb 2021 17:26:44 +0000
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
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:CC:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=MvQxSNbrKt2Zb6XufKKBOCD/1HuYdGafTzpPSfhEj3c=; b=AsNCNLLhwzzmwN6qeGfyfW8237
	sUA00NBUyL+FQfM/bhskL7NXdM7SIWFk5QAnp1LTPmKb3xb6Ka1E07+wUKXh6mv3iRapa19zbNI5Y
	VQnrRy2Te3Nf1MzgLJgVw3L1paKFAdNaW617NwZlyVHVdWQciDZzJZSZWcIS/R4t1IAY=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24602.56532.169889.71270@mariner.uk.xensource.com>
Date: Wed, 3 Feb 2021 17:26:44 +0000
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
CC: Manuel Bouyer <bouyer@netbsd.org>,
    xen-devel@lists.xenproject.org,
    Elena Ufimtseva <elena.ufimtseva@oracle.com>,
    Ian Jackson <iwj@xenproject.org>,
    Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3] NetBSD: use system-provided headers
In-Reply-To: <20210203165421.1550-4-bouyer@netbsd.org>
References: <20210203165421.1550-1-bouyer@netbsd.org>
	<20210203165421.1550-4-bouyer@netbsd.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Manuel Bouyer writes ("[PATCH v3] NetBSD: use system-provided headers"):
> +#ifdef __NetBSD__
> +#include <xen/xenio.h>
> +#else
>  #include <xen/sys/privcmd.h>
> +#endif
>  #include <xen/foreign/x86_32.h>
>  #include <xen/foreign/x86_64.h>
Maneul, thanks.  I think this is a bugfix and ought in principle to go
in but I think we probably want to do this with configure rather than
ad-hoc ifdefs.

Roger, what do you think ?  Were you going to add a configure test for
the #ifdef that we put in earlier ?

Thanks,
Ian.

