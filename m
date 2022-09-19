Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6535BCDBB
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408749.651592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHGx-0005I5-Vp; Mon, 19 Sep 2022 13:57:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408749.651592; Mon, 19 Sep 2022 13:57:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaHGx-0005F7-SJ; Mon, 19 Sep 2022 13:57:19 +0000
Received: by outflank-mailman (input) for mailman id 408749;
 Mon, 19 Sep 2022 13:57:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cq+0=ZW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oaHGw-0005F1-B8
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:57:18 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8b1ae1d-3822-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 15:57:17 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AB410222C5;
 Mon, 19 Sep 2022 13:57:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5C50413ABD;
 Mon, 19 Sep 2022 13:57:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d2X0FDx1KGNMUwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 19 Sep 2022 13:57:16 +0000
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
X-Inumbo-ID: f8b1ae1d-3822-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1663595836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/5pLYXZNjCGOsvALaYTumY4Dq6WSSAQIzCShFqFyEVM=;
	b=nvvPo21K5WC+i8QCzIWLt+aE6wLWb0xYrUwtf/ApDwvqfDw8ZWTlgZxMSu1+t7BlV1Rhee
	xrAg1k8Kk4T30G/T+6+TgnRtV3Xpkuy7nciEHWIQdjkHGKnwIrnIxmTaY5gyy4PXGhkYDu
	OYtJnXdSK/WOwJCwf87rVNUNhOmUpqk=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/2] xen/gnttab: reduce size of struct active_grant_entry
Date: Mon, 19 Sep 2022 15:57:11 +0200
Message-Id: <20220919135713.16577-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While looking at the grant table code I thought it should be possible
to have a smaller struct active_grant_entry. This approach should only
hit transitive grants with some negative performance effect, "normal"
grants should be not affected.

Juergen Gross (2):
  xen: add knownalive_domain_from_domid() helper
  xen/gnttab: reduce size of struct active_grant_entry

 xen/common/domain.c      | 53 +++++++++++++++++++++++++---------------
 xen/common/grant_table.c | 13 +++++-----
 xen/include/xen/sched.h  |  4 +++
 3 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.35.3


