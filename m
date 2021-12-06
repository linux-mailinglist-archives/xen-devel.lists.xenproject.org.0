Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05374698E5
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 15:29:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239124.414482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEzm-0005hX-Bj; Mon, 06 Dec 2021 14:29:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239124.414482; Mon, 06 Dec 2021 14:29:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muEzm-0005d8-7W; Mon, 06 Dec 2021 14:29:34 +0000
Received: by outflank-mailman (input) for mailman id 239124;
 Mon, 06 Dec 2021 14:29:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muEzk-0005aS-UF
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 14:29:32 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed62540e-56a0-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 15:29:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AF16C21B3F;
 Mon,  6 Dec 2021 14:29:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EF0213C32;
 Mon,  6 Dec 2021 14:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HcXAHUsermHAOwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 14:29:31 +0000
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
X-Inumbo-ID: ed62540e-56a0-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638800971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=uCgiU0aiQotZBoCIqLTKFsblShz3FTd5ovsiFhY/JnQ=;
	b=TVTW2womoD5iGmE0XxpQy8fsjIKYxBIUc2ZHzwt3L3eGGUupohBYPTe7S8PdO6n0cMascB
	I11VnkMw4SeSU7dskBRYOvHJ0oN2UzoALL+fnF+9+PQzrBy54To0ldKfyW3rRN3gro4DtF
	pBye3dRymXw8fXjX9iW3x9RmYl/uXWE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 0/2] tools/helpers: PVH xenstore-stubdom console fixes
Date: Mon,  6 Dec 2021 15:29:27 +0100
Message-Id: <20211206142929.29105-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The console parameters for a PVH Xenstore-stubdom have been missing
or were just wrong.

Juergen Gross (2):
  tools/helpers: fix PVH xenstore-stubdom console parameters
  tools/helpers: set event channel for PVH xenstore-stubdom console

 tools/helpers/init-xenstore-domain.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.26.2


