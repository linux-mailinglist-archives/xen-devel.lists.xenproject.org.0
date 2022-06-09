Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F535445BA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 10:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.344764.570369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ4-0001E8-PQ; Thu, 09 Jun 2022 08:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 344764.570369; Thu, 09 Jun 2022 08:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzDZ4-0001CG-M8; Thu, 09 Jun 2022 08:30:50 +0000
Received: by outflank-mailman (input) for mailman id 344764;
 Thu, 09 Jun 2022 08:30:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzDZ3-0001CA-5J
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 08:30:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ2-0002Mb-SA; Thu, 09 Jun 2022 08:30:48 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzDZ2-0001qx-HE; Thu, 09 Jun 2022 08:30:48 +0000
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
	Subject:Cc:To:From; bh=bP2JcB/LIDxgF1FeJGcHxrQnobjWYEcKaQQDMM+Bw+8=; b=3VdsdL
	hjxXUUKU0Yia/jxq61CgSoOrjEWSBbE122ilmqISlFIyOPx1+mqR/ISeEeSm8nAbRBxCYXerNQ5xY
	dHZZMN0HnKXwzOf15N08uTnOP3hcX3fA7xD4aNhqThQfdjfKSRdDIn0CodKApLjxSOODoYxgCiW0D
	q+jMVjyEGqE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/2] xen/mm: Optimize init_heap_pages()
Date: Thu,  9 Jun 2022 09:30:37 +0100
Message-Id: <20220609083039.76667-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

As part of the Live-Update work, we noticed that a big part Xen boot
is spent to add pages in the heap. For instance, on when running Xen
in a nested envionment on a c5.metal, it takes ~1.5s.

This small series is reworking init_heap_pages() to give the pages
to free_heap_pages() by chunk rather than one by one.

With this approach, the time spent to init the heap is down
to 166 ms in the setup mention above.

There is potentially one more optimization possible that would
allow to further reduce the time spent. The new approach is accessing
the page information multiple time in separate loop that can potentially
be large.

Cheers,

Hongyan Xia (1):
  xen/heap: pass order to free_heap_pages() in heap init

Julien Grall (1):
  xen/heap: Split init_heap_pages() in two

 xen/common/page_alloc.c | 109 ++++++++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 27 deletions(-)

-- 
2.32.0


