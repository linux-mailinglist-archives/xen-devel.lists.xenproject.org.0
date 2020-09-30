Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B604C27F0D5
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.860.2991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgHG-0005s4-Ak; Wed, 30 Sep 2020 17:52:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860.2991; Wed, 30 Sep 2020 17:52:30 +0000
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
	id 1kNgHG-0005rM-53; Wed, 30 Sep 2020 17:52:30 +0000
Received: by outflank-mailman (input) for mailman id 860;
 Wed, 30 Sep 2020 17:52:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1kNgHE-0005QF-PL
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:28 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f6f9659-0d07-4c54-97ec-383d34969184;
 Wed, 30 Sep 2020 17:51:57 +0000 (UTC)
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNgGM-0001Ax-Rh; Wed, 30 Sep 2020 17:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=m0D6=DH=casper.srs.infradead.org=batv+fa6e45c137c1199df5c4+6247+infradead.org+hch@srs-us1.protection.inumbo.net>)
	id 1kNgHE-0005QF-PL
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:52:28 +0000
X-Inumbo-ID: 2f6f9659-0d07-4c54-97ec-383d34969184
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2f6f9659-0d07-4c54-97ec-383d34969184;
	Wed, 30 Sep 2020 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=07YiCh12zxNb+LfRUHOuc0cOw1/oVX+fVA/5cFMfxTE=; b=S0V1ilHwkGgbbTo2M350wdoI3C
	7lLk66poahAwcksIO1u1LSSIxtPdZ4ajUF7mmZOuiAy4VKWO2BOkh4jmJEgoz+vYl+pxKKmn1L62/
	cR5OxZR0ZcX8CtFM/89ZjqDZ90kkZgAZeV5ujQjb8OMvbUfBgu6ZTJ+NIRxRgtKUnqSF7fUiBFUNQ
	fR4r0qk8dSD+qYuIsfTRM+UXKnS/TE4Da87IJGDT47CsLpsTEzDQLDabopXoZRINzBGFNcHo0bZYh
	hOkxAjzXXVDPEnTyi8auHmOSpSvIRbGjcSC4yKDNp4s2Ir9GCQHS7afLyB8VzQkH75/ca3S3ZtESd
	mLLKt94A==;
Received: from [2001:4bb8:180:7b62:c70:4a89:bc61:4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNgGM-0001Ax-Rh; Wed, 30 Sep 2020 17:51:35 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Chris Wilson <chris@chris-wilson.co.uk>,
	Matthew Auld <matthew.auld@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Minchan Kim <minchan@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Nitin Gupta <ngupta@vflare.org>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-mm@kvack.org
Subject: remove alloc_vm_area v3
Date: Wed, 30 Sep 2020 19:51:23 +0200
Message-Id: <20200930175133.1252382-1-hch@lst.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Hi Andrew,

this series removes alloc_vm_area, which was left over from the big
vmalloc interface rework.  It is a rather arkane interface, basicaly
the equivalent of get_vm_area + actually faulting in all PTEs in
the allocated area.  It was originally addeds for Xen (which isn't
modular to start with), and then grew users in zsmalloc and i915
which seems to mostly qualify as abuses of the interface, especially
for i915 as a random driver should not set up PTE bits directly.

A git tree is also available here:

    git://git.infradead.org/users/hch/misc.git alloc_vm_area

Gitweb:

    http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/alloc_vm_area

Changes since v2:
 - add another missing i initialization
 - rebased to mainline instead of drm-tip again

Changes since v1:
 - fix a bug in the zsmalloc changes
 - fix a bug and rebase to include the recent changes in i915
 - add a new vmap flag that allows to free the page array and pages
   using vfree
 - add a vfree documentation updated from Matthew

Diffstat:
 arch/x86/xen/grant-table.c                |   27 ++++--
 drivers/gpu/drm/i915/Kconfig              |    1 
 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  131 +++++++++++++-----------------
 drivers/gpu/drm/i915/gt/shmem_utils.c     |   76 ++++-------------
 drivers/xen/xenbus/xenbus_client.c        |   30 +++---
 include/linux/vmalloc.h                   |    7 -
 mm/Kconfig                                |    3 
 mm/memory.c                               |   16 ++-
 mm/nommu.c                                |    7 -
 mm/vmalloc.c                              |  123 ++++++++++++++--------------
 mm/zsmalloc.c                             |   10 +-
 11 files changed, 200 insertions(+), 231 deletions(-)

