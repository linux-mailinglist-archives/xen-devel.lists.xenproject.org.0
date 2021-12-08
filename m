Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 256E546CF72
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 09:48:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242080.418740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muscA-0001Mt-Mf; Wed, 08 Dec 2021 08:47:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242080.418740; Wed, 08 Dec 2021 08:47:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muscA-0001KH-HK; Wed, 08 Dec 2021 08:47:50 +0000
Received: by outflank-mailman (input) for mailman id 242080;
 Wed, 08 Dec 2021 08:47:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J2Or=QZ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1musc9-0001K1-E8
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 08:47:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84fb7f72-5803-11ec-a831-37629979565c;
 Wed, 08 Dec 2021 09:47:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7BEF2190C;
 Wed,  8 Dec 2021 08:47:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9C5BF13BE9;
 Wed,  8 Dec 2021 08:47:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zopjJDNxsGGzdQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Dec 2021 08:47:47 +0000
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
X-Inumbo-ID: 84fb7f72-5803-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638953267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nONTjQtEDZwEnfXvIv2PD1YRqDCnal2EIeR8/qddBCw=;
	b=Uc02aJvS7O4M8f4iGChtJKVL8L5pSWzLaH1hf9FRvV0wEEgwSLKckAtbLD7zR3kKew6Kl7
	FAeaAHUMSiXBe3saskqjrw/0DDUWeDZYIdIV7ufg5KnFxb4+HupFCi6g+cH/LfkNtbIYcB
	ebDNwFiV8RCz+svdfBS1iO8OloRoHwo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v3 0/2] tools/helpers: PVH xenstore-stubdom console fixes
Date: Wed,  8 Dec 2021 09:47:43 +0100
Message-Id: <20211208084745.31082-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The console parameters for a PVH Xenstore-stubdom have been missing
or were just wrong.

Juergen Gross (2):
  tools/helpers: fix PVH xenstore-stubdom console parameters
  tools: set event channel HVM parameters in libxenguest

 tools/helpers/init-xenstore-domain.c |  8 +++++---
 tools/libs/guest/xg_dom_x86.c        |  6 ++++++
 tools/libs/light/libxl_dom.c         | 15 ++++++---------
 3 files changed, 17 insertions(+), 12 deletions(-)

-- 
2.26.2


