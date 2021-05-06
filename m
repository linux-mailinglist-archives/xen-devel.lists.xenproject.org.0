Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AE437528A
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 12:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123417.232759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebTM-0004O5-5Z; Thu, 06 May 2021 10:43:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123417.232759; Thu, 06 May 2021 10:43:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lebTM-0004M9-26; Thu, 06 May 2021 10:43:12 +0000
Received: by outflank-mailman (input) for mailman id 123417;
 Thu, 06 May 2021 10:43:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lebTK-0004M2-NY
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 10:43:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lebTF-00064f-KY; Thu, 06 May 2021 10:43:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lebTF-0002l1-At; Thu, 06 May 2021 10:43:05 +0000
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
	bh=680kVgfT7Oe/mttQMr/p0AciRnNxgeCFuFajL/iBUTw=; b=22Q4OSMth/CnR9cTEE5rrgwhhS
	N+c7qFFwhWFbavfnKHE2U8YL0vmUZb5Ox45FDPJOuT/5lsrq/oY6ZOG4WAPEOfLgzOlFqGSgAaRh2
	Gq0ACotRudXndGp3qHOeykINX4lTk/1p9P6a+jstnd3IL6HplMQAnDIPpWgmmpfWVBEs=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org,
	paul@xen.org,
	hongyxia@amazon.com,
	raphning@amazon.com,
	maghul@amazon.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 0/2] Add a design document for Live Updating Xen
Date: Thu,  6 May 2021 11:42:57 +0100
Message-Id: <20210506104259.16928-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

A couple of years ago, AWS presented at Xen Summit [1] a new method called
"Live  Update" to replace the underlying the hypervisor without
rebooting/migrating VMs.

Since then we worked on implementing the feature in Xen and now have
a working PoC. This series is a split of David's series sent last year [1]
focusing on the design of the feature. We will start sending the code soon.

We will give an update and demonstrate the feature working during the
new Xen Summit.

More details on the feature can be found in the first patch #1 which
introduces the design document.

Best regards,

[1] https://www.youtube.com/watch?v=ANaDS9BUhuA
[2] <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>

Julien Grall (2):
  docs/design: Add a design document for Live Update
  xen/kexec: Reserve KEXEC_TYPE_LIVEUPDATE and KEXEC_RANGE_MA_LIVEUPDATE

 docs/designs/liveupdate.md | 254 +++++++++++++++++++++++++++++++++++++
 xen/include/public/kexec.h |  13 +-
 2 files changed, 264 insertions(+), 3 deletions(-)
 create mode 100644 docs/designs/liveupdate.md

-- 
2.17.1


