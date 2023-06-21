Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEC9738499
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552720.862940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdl-0001EI-I0; Wed, 21 Jun 2023 13:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552720.862940; Wed, 21 Jun 2023 13:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdl-0001CK-EU; Wed, 21 Jun 2023 13:12:53 +0000
Received: by outflank-mailman (input) for mailman id 552720;
 Wed, 21 Jun 2023 13:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1p5=CJ=suse.com=petr.pavlu@srs-se1.protection.inumbo.net>)
 id 1qBxdk-0000hv-En
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:12:52 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 535f8259-1035-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 15:12:51 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01D411FE58;
 Wed, 21 Jun 2023 13:12:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C2B45134B1;
 Wed, 21 Jun 2023 13:12:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NxZ0LlL3kmQKYQAAMHmgww
 (envelope-from <petr.pavlu@suse.com>); Wed, 21 Jun 2023 13:12:50 +0000
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
X-Inumbo-ID: 535f8259-1035-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687353171; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=dSMeF9skFmtCn8hLggDS/2RupwvwvzyY4wh88cjmpM4=;
	b=AEBk+VKsouIEGMeIlFU05Rw/AfKxlJeP1JCeS/fyO3wICryTAb6Qc+ubGBrmnQMTpr3EUG
	IBjQZ2XuvxJtNeDkxrCOVtYX3TzJZW//o6S/5VDNxKmmwULOf7dDRaKXoV0e/MaH1ZPu2L
	cboQc8Xya1NJoEfTVHQR87RGo+ysnQo=
From: Petr Pavlu <petr.pavlu@suse.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 0/2] Fix Linux dom0 boot on a QEMU/KVM virtual machine
Date: Wed, 21 Jun 2023 15:12:12 +0200
Message-Id: <20230621131214.9398-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix two problems that prevent booting Linux dom0 on a QEMU/KVM virtual
machine, which is sometimes useful for testing purposes.

Petr Pavlu (2):
  xen/virtio: Fix NULL deref when a bridge of PCI root bus has no parent
  xen/virtio: Avoid use of the dom0 backend in dom0

 drivers/xen/grant-dma-ops.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.35.3


