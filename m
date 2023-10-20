Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A057D13D3
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 18:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619872.965653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtsA0-0004Fj-18; Fri, 20 Oct 2023 16:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619872.965653; Fri, 20 Oct 2023 16:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qts9z-0004Dh-U3; Fri, 20 Oct 2023 16:15:39 +0000
Received: by outflank-mailman (input) for mailman id 619872;
 Fri, 20 Oct 2023 16:15:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjAU=GC=casper.srs.infradead.org=BATV+5f4592396010e9e3c002+7362+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qts9y-0004Db-8G
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 16:15:38 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7211ad1-6f63-11ee-98d5-6d05b1d4d9a1;
 Fri, 20 Oct 2023 18:15:36 +0200 (CEST)
Received: from [2001:8b0:10b:1::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qts9u-00E44D-7G; Fri, 20 Oct 2023 16:15:34 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1qts9s-001UOT-0R; Fri, 20 Oct 2023 17:15:32 +0100
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
X-Inumbo-ID: e7211ad1-6f63-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=+yckRkFG8qkJeHSM7gJpLJWXmYYcv8nGS7sjBbidu2o=; b=T0zKb6Qe+rPgKfDjqH/Yy6akUz
	iPqrhSFIqIkEL5Zx1lo+Xf8Ln6ZtkAldLanYm/TC+BiWcrLRUcQ7aYSs2pLWZ2YieCBlAIb/k7M/7
	t3T+lTc5eljToOU5aSM5pXsfSvxK9Kqe9iVLwwl353CI80nUZL3HYDGXD5o3LdUX5/eNgvAIVv7EA
	h8ATW3NHs8MGFwvwj64DIAwyJQi8A56iiBnF2Cp+Iyh66H0pPzt8sPBJ35utrpRCrdTMTH1lXlnPa
	PQqmwpaCOZlnPANH8XpVwHB5IUUFp0nTpjJIVqMv813nea7BnGnAGOxQKOJKJmeEKBsRlybO9JZKq
	ftfzAo2Q==;
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dawei Li <set_pte_at@outlook.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 0/3] hvc/xen: Xen console fixes.
Date: Fri, 20 Oct 2023 17:15:26 +0100
Message-Id: <20231020161529.355083-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

It started out relatively simple, fixing the fact that the secondary
consoles didn't work at *all* due to bugs in the IRQ setup. There were
one or two other simple fixes that I snuck into the same patch in v1.

But it's much more broken than that, so split the fixes out, especially
the last one for hot-unplug.

Preserving the Reviewed-by: from Jürgen on the first two seems fair;
the third patch is new and exciting but *does* fix the case of removing
the console while userspace is spamming it.

And all I really wanted to do this week was spin up a PV guest under KVM 
so I could play with its SMEP behaviour...

David Woodhouse (3):
      hvc/xen: fix event channel handling for secondary consoles
      hvc/xen: fix error path in xen_hvc_init() to always register frontend driver
      hvc/xen: fix console unplug

 drivers/tty/hvc/hvc_xen.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)



