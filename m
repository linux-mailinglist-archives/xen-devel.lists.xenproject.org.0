Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A2A3A9DEE
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 16:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143279.264116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlP-00052t-44; Wed, 16 Jun 2021 14:43:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143279.264116; Wed, 16 Jun 2021 14:43:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltWlP-00050A-0e; Wed, 16 Jun 2021 14:43:31 +0000
Received: by outflank-mailman (input) for mailman id 143279;
 Wed, 16 Jun 2021 14:43:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ltWlN-0004zz-Ao
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 14:43:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlL-0004CW-Px; Wed, 16 Jun 2021 14:43:27 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ltWlL-0007D0-Fu; Wed, 16 Jun 2021 14:43:27 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=fZA6YmLD+LYE4dV/8CG4YJOfv9OzLD5ZRPfM2lCkh+Q=; b=xd8PGOKz5NX1zZk2AA7OGBohAG
	KQ34FbO6P//4gZUvN1fDjPNp3As2KeTEmCniNx/n1MmGUQskevFqpZv4Cy/qZ04As8RUmUjUMg6t+
	C9LKzjME2NR13uAeXHm2eE8IIxrvZg/I6OVJiSGNXvkRdWD9XW7IrfPneYYKfbW8rZd0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	doebel@amazon.de,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 00/10] tools/xenstored: Bug fixes + Improve Live-Update
Date: Wed, 16 Jun 2021 15:43:14 +0100
Message-Id: <20210616144324.31652-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

At the moment, Live-Update will, by default, not proceed if there are
in-flight transactions. It is possible force it by passing -F but this
will break any connection with in-flight transactions.

There are PV drivers out that may never terminate some transaction. On
host running such guest, we would need to use -F. Unfortunately, this
also risks to break well-behaving guests (and even dom0) because
Live-Update will happen as soon as the timeout is hit.

This series aims to allow to Live-Update more safely even when the option
-F is used.

The first part of the series contains a few fixes for bug found while
testing Live-Update.

Cheers,

Julien Grall (10):
  MAINTAINERS: Add myself as reviewers for tools/xenstore
  tools/xenstored: Introduce lu_get_connection() and use it
  tools/xenstore: Don't assume conn->in points to the LU request
  tools/xenstored: Limit the number of requests a connection can delay
  tools/xenstored: xenstored_core.h should include fcntl.h
  tools/xenstored: Introduce a wrapper for conn->funcs->can_{read,
    write}
  tools/xenstored: delay_request: don't assume conn->in == in
  tools/xenstored: Extend restore code to handle multiple input buffer
  tools/xenstored: Dump delayed requests
  tools/xenstored: Delay new transaction while Live-Update is pending

 MAINTAINERS                        |   1 +
 tools/xenstore/xenstored_control.c |  66 +++++++++-
 tools/xenstore/xenstored_control.h |   7 ++
 tools/xenstore/xenstored_core.c    | 196 +++++++++++++++++++++++------
 tools/xenstore/xenstored_core.h    |   8 +-
 tools/xenstore/xenstored_domain.c  |  46 +++----
 tools/xenstore/xenstored_domain.h  |   6 +-
 7 files changed, 255 insertions(+), 75 deletions(-)

-- 
2.17.1


