Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1935B53B3
	for <lists+xen-devel@lfdr.de>; Mon, 12 Sep 2022 07:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.405420.647865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOS-0006vc-NU; Mon, 12 Sep 2022 05:54:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 405420.647865; Mon, 12 Sep 2022 05:54:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXcOS-0006t7-KZ; Mon, 12 Sep 2022 05:54:04 +0000
Received: by outflank-mailman (input) for mailman id 405420;
 Mon, 12 Sep 2022 05:54:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oXcOR-0006sx-1P
 for xen-devel@lists.xenproject.org; Mon, 12 Sep 2022 05:54:03 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a7ef5f3-325f-11ed-9760-273f2230c3a0;
 Mon, 12 Sep 2022 07:53:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 680C3227C7;
 Mon, 12 Sep 2022 05:53:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1F519139BE;
 Mon, 12 Sep 2022 05:53:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3GJUBnfJHmMaawAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 12 Sep 2022 05:53:59 +0000
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
X-Inumbo-ID: 4a7ef5f3-325f-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662962039; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dX1Ke72XAo0CL9AdJy6i1EaIYtD9OqqavrqU+iQnLi4=;
	b=PmqEQoNJ9VjJ7K7zyJlJtt5vBNFVyNt7ULvub2QYXQs5lmrGNQeqWiySEAnkdTXR3AXgsE
	65z6RcU3FZKbmci8b5K5XtRNwqrnTwfOt2+NLyJUvrReRJ0jBdwa5EtQszjLqmpdiTDpWy
	SNapBQ/BWPySmbkd5tsbaHfuv7bxLVY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 0/2] xen/gnttab: reduce size of struct active_grant_entry
Date: Mon, 12 Sep 2022 07:53:54 +0200
Message-Id: <20220912055356.24064-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While looking at the grant table code I thought it should be possible
to have a smaller struct active_grant_entry. This approach should only
hit transitive grants with some negative performance effect, "normal"
grants should be not affected.

I'm not sure that the domid_to_domain() helper is something we really
want, though, so I'm sending out the series as RFC.

Juergen Gross (2):
  xen: add domid_to_domain() helper
  xen/gnttab: reduce size of struct active_grant_entry

 xen/common/domain.c      | 54 +++++++++++++++++++++++++---------------
 xen/common/grant_table.c | 13 +++++-----
 xen/include/xen/sched.h  |  4 +++
 3 files changed, 45 insertions(+), 26 deletions(-)

-- 
2.35.3


