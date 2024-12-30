Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127999FEAC9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2024 22:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863548.1274919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMsy-0006ph-10; Mon, 30 Dec 2024 21:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863548.1274919; Mon, 30 Dec 2024 21:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tSMsx-0006nq-Uk; Mon, 30 Dec 2024 21:01:11 +0000
Received: by outflank-mailman (input) for mailman id 863548;
 Mon, 30 Dec 2024 21:01:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rjPe=TX=daemonizer.de=maxi@srs-se1.protection.inumbo.net>)
 id 1tSMsx-0006nk-Ci
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2024 21:01:11 +0000
Received: from mx1.somlen.de (breeze.somlen.de [2a00:1828:a019::100:0])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 317b91b3-c6f1-11ef-99a4-01e77a169b0f;
 Mon, 30 Dec 2024 22:01:09 +0100 (CET)
Received: by mx1.somlen.de with ESMTPSA id C999A5030C1;
 Mon, 30 Dec 2024 22:01:08 +0100 (CET)
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
X-Inumbo-ID: 317b91b3-c6f1-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daemonizer.de;
	s=202303; t=1735592469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kaZsUcyrxauv/BG4fpslcUCmMWSxyvETJhxN2crai+U=;
	b=Lng6gtH+CyHJo0IshZP3FjQQQellK9fvXDMYwV6w3/Gs7o1u5c7UJZU2KTtOPLGUESISYr
	ad+ZMsWY6tQk1lFJanLg3lgCQEXJbQGQR9tGyJmr9yvlS5Sze45gX7xmhZolJ4CEAEWpbM
	0OCTHfiy6wmWqnyYsvNAmIq+187f1eCiXSBTBhexxSJernfg0SUHh1+fibtFqZBPyEiAx/
	UYvOKbDFBqyJJOK3yJHZsk+MYGp1BzP8VRE5JW1vlKGtTVZ+5YtqA5FT9/k1d382sasvTw
	rqGnAG8CdMGp3mqUl4rPBQjcAxDIW6of6ajioHcg6aazPsrSi1HkrcUm6Z2bUg==
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 0/5] Fixes for reproducible builds and other small fixes
Date: Mon, 30 Dec 2024 22:00:28 +0100
Message-Id: <cover.1735585600.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a bunch of fixes we found while packaging Xen in Debian
and we believe they should be best addressed upstream.

We have been carrying the first patch for a long time in Debian, but it
seems it never was applied upstream. It's an addition to
"docs/man: Provide properly-formatted NAME sections"
(commit 423c4def1f7a01eeff56fa70564180640ef3af43).

Patch two and three are fixes for reproducibility issues that I found
using our testing gear in Debian.

The last two patches are trivial fixes correcting two common typos found
by Debian tools.

Thanks


Ian Jackson (1):
  docs/man/xen-vbd-interface.7: Provide properly-formatted NAME section

Maximilian Engelhardt (4):
  docs: set DATE to SOURCE_DATE_EPOCH if available
  xen/arch/x86: make objdump output user locale agnostic
  docs/man: fix typo: hexidecimal -> hexadecimal
  tools: fix typo: subsytem -> subsystem

 docs/Makefile                       | 8 +++++++-
 docs/man/xen-vbd-interface.7.pandoc | 5 +++++
 docs/man/xl-pci-configuration.5.pod | 2 +-
 tools/include/xenctrl.h             | 2 +-
 tools/misc/xen-memshare.c           | 2 +-
 xen/arch/x86/arch.mk                | 2 +-
 6 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.39.5


