Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8C32B91A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Mar 2021 17:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92904.175192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU64-0007y4-4m; Wed, 03 Mar 2021 16:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92904.175192; Wed, 03 Mar 2021 16:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lHU64-0007xe-10; Wed, 03 Mar 2021 16:11:36 +0000
Received: by outflank-mailman (input) for mailman id 92904;
 Wed, 03 Mar 2021 16:11:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU62-0007xX-Fg
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:11:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU62-000438-Ec
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:11:34 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1lHU62-0005ys-Dh
 for xen-devel@lists.xenproject.org; Wed, 03 Mar 2021 16:11:34 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1lHU5z-0002WO-2f; Wed, 03 Mar 2021 16:11:31 +0000
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
	bh=lHQe29hLqTsq8OcNFbc6CpPeVV9UP9J37niA80Iu3ZE=; b=DSV3oQQvAtEXVGwmgUy7OtWSHa
	yvHe2ovTRj3qJ4tn4ejqWvwaZUdiqAeHWLSqlFeMtLHz5fQspSNjdIieuCa9IfzBOhtQqAiFiHiSz
	RbhPn4gW7UKQbrSfO6zJgepMGUKCZxqvRcUmDvUYwu/KIfElriLqokbRk1SaTT6JMo2Y=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24639.46386.759552.737449@mariner.uk.xensource.com>
Date: Wed, 3 Mar 2021 16:11:30 +0000
To: Norbert Manthey <nmanthey@amazon.de>
Cc: <xen-devel@lists.xenproject.org>,
    Juergen Gross <jgross@suse.com>,
    Wei Liu <wl@xen.org>,
    Julien Grall <jgrall@amazon.co.uk>,
    Michael Kurth <mku@amazon.de>
Subject: [PATCH XENSTORE v1 07/10] xenstore: handle do_mkdir and do_rm failure
In-Reply-To: <20210226144144.9252-8-nmanthey@amazon.de>
References: <20210226144144.9252-1-nmanthey@amazon.de>
	<20210226144144.9252-8-nmanthey@amazon.de>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Norbert Manthey writes ("[PATCH XENSTORE v1 07/10] xenstore: handle do_mkdir and do_rm failure"):
> In the out of memory case, we might return a NULL pointer when
> canonicalizing node names. This NULL pointer is not checked when
> creating a directory, or when removing a node. This change handles
> the NULL pointer for these two cases.
> 
> This bug was discovered and resolved using Coverity Static Analysis
> Security Testing (SAST) by Synopsys, Inc.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reviewed-by: Thomas Friebel <friebelt@amazon.de>
> Reviewed-by: Julien Grall <jgrall@amazon.co.uk>

Release-Acked-by: Ian Jackson <iwj@xenproject.org>

