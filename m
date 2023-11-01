Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979D17DE346
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 16:36:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626506.976784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGC-0007RX-NP; Wed, 01 Nov 2023 15:36:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626506.976784; Wed, 01 Nov 2023 15:36:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyDGC-0007PS-Io; Wed, 01 Nov 2023 15:36:00 +0000
Received: by outflank-mailman (input) for mailman id 626506;
 Wed, 01 Nov 2023 15:35:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qFMy=GO=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qyDGA-0007ME-OV
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 15:35:58 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 582483fc-78cc-11ee-9b0e-b553b5be7939;
 Wed, 01 Nov 2023 16:35:54 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D35BC21A43;
 Wed,  1 Nov 2023 15:35:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 913451348D;
 Wed,  1 Nov 2023 15:35:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d25aIVlwQmVyKgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 01 Nov 2023 15:35:53 +0000
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
X-Inumbo-ID: 582483fc-78cc-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1698852953; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Y3nMQB/2EuWKzt9fVn+90T3VAa1xYa9oEmc2anTsj2w=;
	b=Na47X+iCoWLZSIOMRvXuLjEDHJlVtpzoGBcl/2b8YOSHI5oLOndHoNrQTKsQhfFs7cLUxS
	baeAVTjk9YX2yrgTsY1+uxnulfV0jnS5IIbZH0TeLYR6UKbio4AvZIXZF7CFzGSxCQoVS7
	X8saiIiUed1Hw7ITZvkoUnXUpdK35cM=
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org,
	wl@xen.org,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] Mini-OS: hide mini-os internal symbols
Date: Wed,  1 Nov 2023 16:35:49 +0100
Message-Id: <20231101153551.11733-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to avoid conflicts due to symbols with the same name when
linking Mini-OS with an application, hide all Mini9-OS internal symbols
from the application by linking the Mini-OS kernel individually and
then removing all symbols which should be used internally only.

Juergen Gross (2):
  Mini-OS: link kernel separately
  Mini-OS: keep a positive list of externally visible symbols

 Makefile    |   8 ++-
 mini-os.map | 187 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+), 2 deletions(-)
 create mode 100644 mini-os.map

-- 
2.35.3


