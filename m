Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F127E9C56
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 13:44:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631558.984982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHe-0008CR-Qo; Mon, 13 Nov 2023 12:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631558.984982; Mon, 13 Nov 2023 12:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2WHe-00089q-Nm; Mon, 13 Nov 2023 12:43:18 +0000
Received: by outflank-mailman (input) for mailman id 631558;
 Mon, 13 Nov 2023 12:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2WHc-00089i-Nu
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 12:43:16 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35c650bb-8222-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 13:43:14 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 19323218F0;
 Mon, 13 Nov 2023 12:43:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D30A11358C;
 Mon, 13 Nov 2023 12:43:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m7U8Mt8ZUmUxcQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 12:43:11 +0000
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
X-Inumbo-ID: 35c650bb-8222-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699879392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/i7F/3V1P35hT3ryFbqU0Rs6SXpDXF2WAcpIooZ2yhM=;
	b=Ozctk0MTVUBYStq2zh/HLFE44LghRR2q0mTnNV6zv0U/IBSsjGIwgzzVUyDf6yOK2rrveT
	YEiUSLcT98r4V3kK2uSdwAYi7SQE2W3WKLA8yGe64UIykgi51malyE3ZItHGOV0IqQkuRa
	1KaE1CKLpm6QTdqKTjkD1drhAqQenVU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 0/5] tools/xenstored: remove some command line options
Date: Mon, 13 Nov 2023 13:43:04 +0100
Message-Id: <20231113124309.10862-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove some command line options which have no real use case.

Juergen Gross (5):
  tools/xenstored: remove "-D" command line parameter
  tools/xenstored: remove "-V" command line option
  tools/xenstored: remove the "-P" command line option
  tools/xenstored: remove "-N" command line option
  tools/xenstored: remove the "-R" command line option

 tools/xenstored/core.c | 81 +++++++-----------------------------------
 1 file changed, 12 insertions(+), 69 deletions(-)

-- 
2.35.3


