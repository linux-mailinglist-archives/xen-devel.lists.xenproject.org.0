Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03016C9E02
	for <lists+xen-devel@lfdr.de>; Mon, 27 Mar 2023 10:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515067.797577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiLU-0006nR-0B; Mon, 27 Mar 2023 08:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515067.797577; Mon, 27 Mar 2023 08:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pgiLT-0006lj-TV; Mon, 27 Mar 2023 08:36:51 +0000
Received: by outflank-mailman (input) for mailman id 515067;
 Mon, 27 Mar 2023 08:36:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J70X=7T=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1pgiLT-0006ld-AY
 for xen-devel@lists.xenproject.org; Mon, 27 Mar 2023 08:36:51 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 842fdc77-cc7a-11ed-85db-49a42c6b2330;
 Mon, 27 Mar 2023 10:36:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1ABE321AB2;
 Mon, 27 Mar 2023 08:36:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B2EA313329;
 Mon, 27 Mar 2023 08:36:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id g+hAKqBVIWShSAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Mar 2023 08:36:48 +0000
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
X-Inumbo-ID: 842fdc77-cc7a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1679906209; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=v6oIQCvPsK0b+etSaaLmHyST9of/SZHXfQgb0QAgenE=;
	b=Oi3uElNpMUuOMeDRymfgAwa5c2IqAibwS3mTpkTLizw999HdkXOS1GW5XUH67WRrnwYWOU
	nLAcy9zmDB1SV1j49URJEljBGckKUPgkvNJ7DHnQ4UkIdIFCMAfCoO/3Xl0gi6AjTx2bfZ
	UEV7dQkypnhgOwx26R9vDO7b/jyncC0=
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
Subject: [PATCH 0/2] xen/netback: fix issue introduced recently
Date: Mon, 27 Mar 2023 10:36:44 +0200
Message-Id: <20230327083646.18690-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fix for XSA-423 introduced a bug which resulted in loss of network
connection in some configurations.

The first patch is fixing the issue, while the second one is removing
a test which isn't needed.

Juergen Gross (2):
  xen/netback: don't do grant copy across page boundary
  xen/netback: remove not needed test in xenvif_tx_build_gops()

 drivers/net/xen-netback/common.h  |  2 +-
 drivers/net/xen-netback/netback.c | 29 +++++++++++++++++++++++------
 2 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.35.3


