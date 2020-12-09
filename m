Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C17902D4688
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 17:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48483.85754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28d-0004Sl-UF; Wed, 09 Dec 2020 16:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48483.85754; Wed, 09 Dec 2020 16:16:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn28d-0004SL-Qw; Wed, 09 Dec 2020 16:16:23 +0000
Received: by outflank-mailman (input) for mailman id 48483;
 Wed, 09 Dec 2020 16:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn28c-0004SF-30
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 16:16:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9df0cea8-afcc-49b6-af09-42760f289216;
 Wed, 09 Dec 2020 16:16:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A563AD89;
 Wed,  9 Dec 2020 16:16:20 +0000 (UTC)
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
X-Inumbo-ID: 9df0cea8-afcc-49b6-af09-42760f289216
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607530580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7s9j1vgacL/VeYC8XNsPbPiTS/jgKwiYvgvAIn7vv54=;
	b=QcZkxZTk7UGUGFqMCbQamAhJN1V4YBtEt/LtVovw4IxWwJT8omY1neYr40jx1LqOTJoZO6
	Z2c/rdy0yNKF+lw/9Nsa1iVKWmGTHAwfMf8k+p3ZEHkN3MUnHcYI2grPS4ZvmvLYbnSCLz
	+sHMC/q++H7W2sdAkmAlKEY9WlVulCc=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: paul@xen.org,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH RFC 0/3] xen: add hypfs per-domain abi-features
Date: Wed,  9 Dec 2020 17:16:15 +0100
Message-Id: <20201209161618.309-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series is meant as an example how to add further dynamical
directories to hypfs. It can be used to replace Paul's current approach
to specify ABI-features via domain create flags and replace those by
hypfs nodes.

The related libxl part could just use libxenhypfs to set the values.

This series is meant to be applied on top of my series:

  xen: support per-cpupool scheduling granularity

Juergen Gross (3):
  xen/hypfs: add support for bool leafs in dynamic directories
  xen/domain: add domain hypfs directories
  xen/domain: add per-domain hypfs directory abi-features

 docs/misc/hypfs-paths.pandoc |  10 ++
 xen/common/Makefile          |   1 +
 xen/common/hypfs.c           |  53 +++++++++--
 xen/common/hypfs_dom.c       | 176 +++++++++++++++++++++++++++++++++++
 xen/include/xen/hypfs.h      |   7 ++
 xen/include/xen/sched.h      |   4 +
 6 files changed, 244 insertions(+), 7 deletions(-)
 create mode 100644 xen/common/hypfs_dom.c

-- 
2.26.2


