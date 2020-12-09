Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8022D4662
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48426.85635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22U-0002XV-TE; Wed, 09 Dec 2020 16:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48426.85635; Wed, 09 Dec 2020 16:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn22U-0002V1-Mf; Wed, 09 Dec 2020 16:10:02 +0000
Received: by outflank-mailman (input) for mailman id 48426;
 Wed, 09 Dec 2020 16:10:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn22T-0002Or-AP
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:10:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c52ac2eb-1082-4d1d-abf1-6da9345f8552;
 Wed, 09 Dec 2020 16:09:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E0678AC9A;
 Wed,  9 Dec 2020 16:09:58 +0000 (UTC)
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
X-Inumbo-ID: c52ac2eb-1082-4d1d-abf1-6da9345f8552
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530199; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kGF6k6YkBY0gTxGsY3A9nBmvv9dZFk8vYQw5QGMKns4=;
	b=cun1VRxXKh7JgT/oHY6u4CCjqg0nEQWdUSFinkqtDGYDBGFz6RytW2fYHX9VFiTH2M6eQg
	sVxXc4m4HnNQtuo68EwCwvGcu7Oq6K8kH+P6CfU3d2zsHffiVm54MPboR+tO63snEKU/74
	i92YGAp0Gi765jlRim3x3boOcJQ4Hpk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/8] xen: support per-cpupool scheduling granularity
Date: Wed,  9 Dec 2020 17:09:48 +0100
Message-Id: <20201209160956.32456-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support scheduling granularity per cpupool. Setting the granularity is
done via hypfs, which needed to gain dynamical entries for that
purpose.

Apart from the hypfs related additional functionality the main change
for cpupools was the support for moving a domain to a new granularity,
as this requires to modify the scheduling unit/vcpu relationship.

I have tried to do the hypfs modifications in a rather generic way in
order to be able to use the same infrastructure in other cases, too
(e.g. for per-domain entries).

The complete series has been tested by creating cpupools with different
granularities and moving busy and idle domains between those.

Changes in V3:
- Patches 1-6 and 8-11 of V2 have been committed already
- New patch 2
- Addressed all comments
- Added a data pointer to struct hypfs_dyndir

Changes in V2:
- Added several new patches, especially for some further cleanups in
  cpupool.c.
- Completely reworked the locking scheme with dynamical directories:
  locking of resources (cpupools in this series) is now done via new
  callbacks which are called when traversing the hypfs tree. This
  removes the need to add locking to each hypfs related cpupool
  function and it ensures data integrity across multiple callbacks.
- Reordered the first few patches in order to have already acked
  patches in pure cleanup patches first.
- Addressed several comments.

Juergen Gross (8):
  xen/cpupool: support moving domain between cpupools with different
    granularity
  xen/hypfs: switch write function handles to const
  xen/hypfs: add new enter() and exit() per node callbacks
  xen/hypfs: support dynamic hypfs nodes
  xen/hypfs: add support for id-based dynamic directories
  xen/cpupool: add cpupool directories
  xen/cpupool: add scheduling granularity entry to cpupool entries
  xen/cpupool: make per-cpupool sched-gran hypfs node writable

 docs/misc/hypfs-paths.pandoc   |  16 +++
 xen/common/hypfs.c             | 226 ++++++++++++++++++++++++++++++-
 xen/common/sched/core.c        | 121 ++++++++++++-----
 xen/common/sched/cpupool.c     | 240 +++++++++++++++++++++++++++++++--
 xen/include/xen/guest_access.h |   5 +
 xen/include/xen/hypfs.h        |  66 ++++++---
 6 files changed, 610 insertions(+), 64 deletions(-)

-- 
2.26.2


