Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A52C298935
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 10:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12077.31632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZ8-0004fb-6s; Mon, 26 Oct 2020 09:13:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12077.31632; Mon, 26 Oct 2020 09:13:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZ7-0004fB-WB; Mon, 26 Oct 2020 09:13:21 +0000
Received: by outflank-mailman (input) for mailman id 12077;
 Mon, 26 Oct 2020 09:13:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZ6-0004ev-F0
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7ee1994-9d37-4c0e-b1db-66ba1b788599;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E2543AD09;
 Mon, 26 Oct 2020 09:13:18 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZ6-0004ev-F0
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:20 +0000
X-Inumbo-ID: a7ee1994-9d37-4c0e-b1db-66ba1b788599
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a7ee1994-9d37-4c0e-b1db-66ba1b788599;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WPHkwaEWfDmd0odQcx9LNDu44X1lNTuYJeY875Uf7Qk=;
	b=Qgn2ng78n2EdKBNLg80HBa9KEs1RO+4k9e8NvY8ZVXNbtnGYkPP0B1sHTudpLgvMh4e6xo
	oyGeGxRJSBiL8XfeAbZZG7stq98Cw77nY8+X6VQ9Rf06HwKGWOf04p1ou4kiPHf/7Nf/7C
	zeOECLuVR7Obc314stQ8LuXm9R2WLJU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E2543AD09;
	Mon, 26 Oct 2020 09:13:18 +0000 (UTC)
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
Subject: [PATCH 00/12] xen: support per-cpupool scheduling granularity
Date: Mon, 26 Oct 2020 10:13:04 +0100
Message-Id: <20201026091316.25680-1-jgross@suse.com>
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

Juergen Gross (12):
  xen/cpupool: add cpu to sched_res_mask when removing it from cpupool
  xen/cpupool: add missing bits for per-cpupool scheduling granularity
  xen/sched: support moving a domain between cpupools with different
    granularity
  xen/sched: sort included headers in cpupool.c
  docs: fix hypfs path documentation
  xen/hypfs: move per-node function pointers into a dedicated struct
  xen/hypfs: pass real failure reason up from hypfs_get_entry()
  xen/hypfs: support dynamic hypfs nodes
  xen/hypfs: add support for id-based dynamic directories
  xen/hypfs: add cpupool directories
  xen/hypfs: add scheduling granularity entry to cpupool entries
  xen/cpupool: make per-cpupool sched-gran hypfs node writable

 docs/misc/hypfs-paths.pandoc |  18 ++-
 xen/common/hypfs.c           | 233 +++++++++++++++++++++++++++--------
 xen/common/sched/core.c      | 122 +++++++++++++-----
 xen/common/sched/cpupool.c   | 213 +++++++++++++++++++++++++++++---
 xen/common/sched/private.h   |   1 +
 xen/include/xen/hypfs.h      | 106 +++++++++++-----
 xen/include/xen/param.h      |  15 +--
 7 files changed, 567 insertions(+), 141 deletions(-)

-- 
2.26.2


