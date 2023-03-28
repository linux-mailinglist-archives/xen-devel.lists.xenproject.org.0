Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE96CC042
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:11:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515800.798984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph96I-0005JN-Bl; Tue, 28 Mar 2023 13:10:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515800.798984; Tue, 28 Mar 2023 13:10:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph96I-0005Ge-7e; Tue, 28 Mar 2023 13:10:58 +0000
Received: by outflank-mailman (input) for mailman id 515800;
 Tue, 28 Mar 2023 13:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WLKu=7U=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1ph96H-0005GX-Da
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:10:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9a02d2f-cd69-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:10:56 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C97D51F8B8;
 Tue, 28 Mar 2023 13:10:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38C4F1390D;
 Tue, 28 Mar 2023 13:10:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Hvl+DF/nImQ1TQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Mar 2023 13:10:55 +0000
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
X-Inumbo-ID: f9a02d2f-cd69-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1680009055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Nw57r4ThzP515ds3lDpYM7Hl3NRvlAaDQvtIsIkfIz8=;
	b=U8xR4NYPd2oP+KbbTf12uNbuGqeSVqFfLMHH0GBM/KMkNT3J5snWac7d4OGQTjxYnVFdPQ
	RbPIwQRUfohMt2xNvpyu01g7plm7JWEbOl+56ODRgJkUR0QROehYIJ6SiuguGF05Xwdqu1
	GKSMTzHmwsnosUyZOYm29qhE/zMEgVw=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wei.liu@kernel.org>,
	Paul Durrant <paul@xen.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	xen-devel@lists.xenproject.org,
	stable@vger.kernel.org
Subject: [PATCH v2 0/3] xen/netback: fix issue introduced recently
Date: Tue, 28 Mar 2023 15:10:44 +0200
Message-Id: <20230328131047.2440-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix for XSA-423 introduced a bug which resulted in loss of network
connection in some configurations.

The first patch is fixing the issue, while the second one is removing
a test which isn't needed. The third patch is making error messages
more uniform.

Changes in V2:
- add patch 3
- comment addressed (patch 1)


Juergen Gross (3):
  xen/netback: don't do grant copy across page boundary
  xen/netback: remove not needed test in xenvif_tx_build_gops()
  xen/netback: use same error messages for same errors

 drivers/net/xen-netback/common.h  |  2 +-
 drivers/net/xen-netback/netback.c | 37 ++++++++++++++++++++++---------
 2 files changed, 28 insertions(+), 11 deletions(-)

-- 
2.35.3


