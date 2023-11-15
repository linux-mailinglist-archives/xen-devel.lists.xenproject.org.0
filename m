Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FC27EC9A7
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 18:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633810.988878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jg0-0003Il-0v; Wed, 15 Nov 2023 17:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633810.988878; Wed, 15 Nov 2023 17:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Jfz-0003Gt-Sh; Wed, 15 Nov 2023 17:27:43 +0000
Received: by outflank-mailman (input) for mailman id 633810;
 Wed, 15 Nov 2023 17:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ynSk=G4=desiato.srs.infradead.org=BATV+a72437c23eaab18a7e37+7388+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1r3Jfx-00031s-FT
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 17:27:42 +0000
Received: from desiato.infradead.org (desiato.infradead.org
 [2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ac0529-83dc-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 18:27:38 +0100 (CET)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1r3Jfi-004Bc0-25; Wed, 15 Nov 2023 17:27:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96.2 #2 (Red
 Hat Linux)) id 1r3Jfh-004sFA-0O; Wed, 15 Nov 2023 17:27:25 +0000
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
X-Inumbo-ID: 44ac0529-83dc-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=xZ0wYBocgdl60a2Ke1KkDB2txC+xjHjAaO8lJ+NcfrU=; b=XVzGDFHvHAQS7pHVQQYtQa/lLp
	2UoxL3xy8yAGaXIpD3HnYS1Nexe0T24xp6GGBlvQ7XnNUTTstfnTk6JlEbkW5tWd+k2do+YX/362E
	DR5UB6NSCYhGk+b+vs5WIXsgrFrJDP7bLVsNGhATvHJ5BhcEdIqcKo6n8SZfmYmTNktVgO9yvE0To
	lL4uY0PRJ2LnFAT8Taclm5kj3ZIOvAhgMiso1mBHsxWMEw3yskvBkxdFtKIfnJX9zYIOmdsjOjaet
	wboDj3DcmL97sWedEbN1B8S2cnCwgMANT5vxhwvHjC9jx+OdXSY0/Ve02cQI9oX+Z9PYILTBqBQBr
	baiYoa1A==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org
Subject: [PATCH 0/3] Misc fixes for 8.2
Date: Wed, 15 Nov 2023 17:24:34 +0000
Message-ID: <20231115172723.1161679-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

Fix a use-after-free (or double-free) due to net_cleanup() freeing NICs
that don't belong to it, fix a newly-introduced launch failure with a
documented command line, and clean up code to avoid a Coverity warning.

David Woodhouse (3):
      net: do not delete nics in net_cleanup()
      vl: disable default serial when xen-console is enabled
      hw/xen: clean up xen_block_find_free_vdev() to avoid Coverity false positive

 hw/block/xen-block.c | 24 +++++++++++++++++++++---
 net/net.c            | 28 ++++++++++++++++++++++------
 system/vl.c          |  1 +
 3 files changed, 44 insertions(+), 9 deletions(-)



