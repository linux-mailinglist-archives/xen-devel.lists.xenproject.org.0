Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957D2C9907
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 09:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41624.74947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uo-0004c9-Vb; Tue, 01 Dec 2020 08:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41624.74947; Tue, 01 Dec 2020 08:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk0uo-0004aa-Nb; Tue, 01 Dec 2020 08:21:38 +0000
Received: by outflank-mailman (input) for mailman id 41624;
 Tue, 01 Dec 2020 08:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UECe=FF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kk0un-0004Uj-Il
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 08:21:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3a9bb8f-12bc-44f7-ab8c-f8e9dabb0d80;
 Tue, 01 Dec 2020 08:21:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0963DAD71;
 Tue,  1 Dec 2020 08:21:31 +0000 (UTC)
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
X-Inumbo-ID: e3a9bb8f-12bc-44f7-ab8c-f8e9dabb0d80
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606810891; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=b421o4gqnXLovgEu9WEC6gmhWCRJ1CZH3fbnZ3VWOko=;
	b=XMg1+DsoO/GET8yTF8cQ33YvA+LOsnb6vddawc7zcfiWqsaUDz9B5rQSLDbyJOHgqgM7ve
	3JcDOzhdpXJG0q1BCOnbQdUSUsiFDRxm/LdwYCwWzO6De+SN+OEyRWCNs9qHsR0A5PCRdp
	mTZWRxE0VlDs+oz8gJlrMpm/PeJkLx8=
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
Subject: [PATCH v2 00/17] xen: support per-cpupool scheduling granularity
Date: Tue,  1 Dec 2020 09:21:11 +0100
Message-Id: <20201201082128.15239-1-jgross@suse.com>
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

Juergen Gross (17):
  xen/cpupool: add cpu to sched_res_mask when removing it from cpupool
  xen/cpupool: add missing bits for per-cpupool scheduling granularity
  xen/cpupool: sort included headers in cpupool.c
  xen/cpupool: switch cpupool id to unsigned
  xen/cpupool: switch cpupool list to normal list interface
  xen/cpupool: use ERR_PTR() for returning error cause from
    cpupool_create()
  xen/cpupool: support moving domain between cpupools with different
    granularity
  docs: fix hypfs path documentation
  xen/hypfs: move per-node function pointers into a dedicated struct
  xen/hypfs: pass real failure reason up from hypfs_get_entry()
  xen/hypfs: add getsize() and findentry() callbacks to hypfs_funcs
  xen/hypfs: add new enter() and exit() per node callbacks
  xen/hypfs: support dynamic hypfs nodes
  xen/hypfs: add support for id-based dynamic directories
  xen/cpupool: add cpupool directories
  xen/cpupool: add scheduling granularity entry to cpupool entries
  xen/cpupool: make per-cpupool sched-gran hypfs node writable

 docs/misc/hypfs-paths.pandoc |  18 +-
 xen/common/hypfs.c           | 336 ++++++++++++++++++++++----
 xen/common/sched/core.c      | 137 ++++++++---
 xen/common/sched/cpupool.c   | 446 +++++++++++++++++++++++++++--------
 xen/common/sched/private.h   |  15 +-
 xen/include/xen/hypfs.h      | 140 ++++++++---
 xen/include/xen/param.h      |  15 +-
 xen/include/xen/sched.h      |   4 +-
 8 files changed, 875 insertions(+), 236 deletions(-)

-- 
2.26.2


