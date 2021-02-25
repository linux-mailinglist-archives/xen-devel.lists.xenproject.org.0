Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 885BA3254AA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 18:42:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89890.169782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeU-00068x-EQ; Thu, 25 Feb 2021 17:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89890.169782; Thu, 25 Feb 2021 17:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFKeU-00068c-BG; Thu, 25 Feb 2021 17:42:14 +0000
Received: by outflank-mailman (input) for mailman id 89890;
 Thu, 25 Feb 2021 17:42:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFKeT-00068X-Ba
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 17:42:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeS-0005qf-CD; Thu, 25 Feb 2021 17:42:12 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFKeR-00032g-Vg; Thu, 25 Feb 2021 17:42:12 +0000
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
	bh=hMmY1pZlwkcpsLVU2u7EXJeXlw3MMy5FmKya1ob/Nqw=; b=3ZDz04sUXadIkRDEJ3JECubTga
	O7Dpg4WwmkgBYmTLytupZgVj54glxTTx/Yjgi3SP+u4h0vomepH0uw1uKONXZefI2rwdeuDKs0ogS
	cb44sLI61Ul1TIdbOWeVRrZCnbQasYF5CBAKaHA/tUyA0j1TAY1mwR5jpYfVu0IEFzag=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH for-4.15 0/5] xenstore: Address coverity issues in the LiveUpdate code
Date: Thu, 25 Feb 2021 17:41:26 +0000
Message-Id: <20210225174131.10115-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

The AWS coverity instance spotted a few issues that could either
leak memory and derefence NULL pointer.

All the patches are candidate for 4.15 as they are hardening XenStored
code. The changes are low risks.

Cheers,

Julien Grall (5):
  tools/xenstored: Avoid unnecessary talloc_strdup() in do_control_lu()
  tools/xenstored: Avoid unnecessary talloc_strdup() in do_lu_start()
  tools/xenstored: control: Store the save filename in lu_dump_state
  tools/xenstore-control: Don't leak buf in live_update_start()
  tools/xenstored: Silence coverity when using xs_state_* structures

 tools/xenstore/include/xenstore_state.h |  6 +++---
 tools/xenstore/xenstore_control.c       |  4 +++-
 tools/xenstore/xenstored_control.c      | 26 +++++++++++--------------
 3 files changed, 17 insertions(+), 19 deletions(-)

-- 
2.17.1


