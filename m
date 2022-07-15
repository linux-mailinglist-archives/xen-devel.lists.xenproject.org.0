Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 074DF57659E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368355.599588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOim-0002YD-5h; Fri, 15 Jul 2022 17:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368355.599588; Fri, 15 Jul 2022 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOim-0002VF-2I; Fri, 15 Jul 2022 17:03:20 +0000
Received: by outflank-mailman (input) for mailman id 368355;
 Fri, 15 Jul 2022 17:03:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOik-0002V3-40
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:03:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOij-0001Ef-Px; Fri, 15 Jul 2022 17:03:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOij-0007gg-HY; Fri, 15 Jul 2022 17:03:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=09GQn0LINaeqQf4APUPgbQ6Hh70i4IAy8Q6zOjVfr9g=; b=nfPUoe
	JhHcd7NAMFmQt8Nj/+L1Ykhareh3XuABnLpPC9jA4eZDIc2rHCsjhIhtwpMojhkNNyDVKiKBqpEAt
	mnPndFKutLV7KSEGUo9PqZNR+7M4q6GbXjWUJnJetALQ/0upd7oCwLKpLf6gIU0wAVcKklydaLSrl
	e/12lZobtPk=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/3] xen/mm: Optimize init_heap_pages()
Date: Fri, 15 Jul 2022 18:03:09 +0100
Message-Id: <20220715170312.13931-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

As part of the Live-Update work, we noticed that a big part Xen boot
is spent to add pages in the heap. For instance, on when running Xen
in a nested envionment on a c5.metal with 90GB, it takes ~1.4s.

This small series is reworking init_heap_pages() to give the pages
to free_heap_pages() by chunk rather than one by one.

With this approach, the time spent to init the heap is down
to 96 ms in the setup mention above.

There is potentially one more optimization possible that would
allow to further reduce the time spent. The new approach is accessing
the page information multiple time in separate loop that can potentially
be large.

Cheers,

Julien Grall (2):
  xen: page_alloc: Don't open-code IS_ALIGNED()
  xen/heap: Split init_heap_pages() in two
  xen/heap: pass order to free_heap_pages() in heap init

 xen/common/page_alloc.c | 106 ++++++++++++++++++++++++++++++----------
 1 file changed, 79 insertions(+), 27 deletions(-)

-- 
2.32.0


