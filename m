Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7E4CFD72
	for <lists+xen-devel@lfdr.de>; Mon,  7 Mar 2022 12:54:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.285878.485155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwT-0004O5-6K; Mon, 07 Mar 2022 11:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 285878.485155; Mon, 07 Mar 2022 11:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRBwT-0004M6-1k; Mon, 07 Mar 2022 11:54:21 +0000
Received: by outflank-mailman (input) for mailman id 285878;
 Mon, 07 Mar 2022 11:54:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7T3K=TS=amazon.de=prvs=058ff0969=doebel@srs-se1.protection.inumbo.net>)
 id 1nRBwP-0004Lv-L8
 for xen-devel@lists.xenproject.org; Mon, 07 Mar 2022 11:54:18 +0000
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4eb831d2-9e0d-11ec-8eba-a37418f5ba1a;
 Mon, 07 Mar 2022 12:54:15 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-6001.iad6.amazon.com with ESMTP; 07 Mar 2022 11:54:02 +0000
Received: from EX13D44EUB004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-iad-1a-2d7489a4.us-east-1.amazon.com (Postfix) with
 ESMTPS id 8CFBDA2774; Mon,  7 Mar 2022 11:54:01 +0000 (UTC)
Received: from EX13MTAUWA001.ant.amazon.com (10.43.160.58) by
 EX13D44EUB004.ant.amazon.com (10.43.166.198) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Mon, 7 Mar 2022 11:54:00 +0000
Received: from dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (10.13.240.106)
 by mail-relay.amazon.com (10.43.160.118) with Microsoft SMTP Server
 id
 15.0.1497.28 via Frontend Transport; Mon, 7 Mar 2022 11:53:59 +0000
Received: by dev-dsk-doebel-1c-c6d5f274.eu-west-1.amazon.com (Postfix,
 from userid 3160037)
 id 8CA8E4E7F; Mon,  7 Mar 2022 11:53:58 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 4eb831d2-9e0d-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646654055; x=1678190055;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mNz9Q4f0IrIKfF872XTy4kRaP42K2/1c23e5EBuxuL8=;
  b=fzmeKN65tLTBJAnno4f3STFXLLC8+O1jeZxreiBwKj1EZb5o71qmaCn6
   U66mnp5a+XUNbJRBP1k13AYY8cbAEHUy6N82tod9oeM/O5w00BR196FTX
   Prg0hG0gX8hCdmpHMw76lFlu8wGU13JviQb1aXMgnMxAA1mkjjCTpj3Y3
   g=;
X-IronPort-AV: E=Sophos;i="5.90,162,1643673600"; 
   d="scan'208";a="183654532"
From: Bjoern Doebel <doebel@amazon.de>
To: <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Bjoern Doebel <doebel@amazon.de>
Subject: [PATCH 0/2] Livepatch: support for livepatching CET functions
Date: Mon, 7 Mar 2022 11:53:51 +0000
Message-ID: <cover.1646653825.git.doebel@amazon.de>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Precedence: Bulk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series enables support for livepatching functions compiled with
Intel CET support where we have to make sure we leave a potential
leading ENDBR64 instruction intact on livepatch application.

The series also requires a change to generic livepatching code: we need
to make sure that the address of the patched function is known at the
time Xen tries to verify the livepatch for applicability, hence we need
to resolve this address before verifying the patch.

Bjoern Doebel (2):
  Livepatch: resolve old address before function verification
  xen/x86: Livepatch: support patching CET-enhanced functions

 xen/arch/x86/livepatch.c | 63 +++++++++++++++++++++++++++++++++++-----
 xen/common/livepatch.c   |  4 +--
 2 files changed, 57 insertions(+), 10 deletions(-)

-- 
2.32.0




Amazon Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 149173 B
Sitz: Berlin
Ust-ID: DE 289 237 879




