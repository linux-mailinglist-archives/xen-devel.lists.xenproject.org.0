Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3A587D75
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 15:51:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379352.612739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsIx-0000uE-VQ; Tue, 02 Aug 2022 13:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379352.612739; Tue, 02 Aug 2022 13:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIsIx-0000sQ-Sc; Tue, 02 Aug 2022 13:51:27 +0000
Received: by outflank-mailman (input) for mailman id 379352;
 Tue, 02 Aug 2022 13:51:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MHYI=YG=suse.com=dfaggioli@srs-se1.protection.inumbo.net>)
 id 1oIsIw-0000sI-UF
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 13:51:26 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 336a204c-126a-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 15:51:25 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7930F2067D;
 Tue,  2 Aug 2022 13:51:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40C4313AE4;
 Tue,  2 Aug 2022 13:51:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pU1ODd0r6WKrZAAAMHmgww
 (envelope-from <dfaggioli@suse.com>); Tue, 02 Aug 2022 13:51:25 +0000
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
X-Inumbo-ID: 336a204c-126a-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1659448285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KiMi83si29Us4N0Nx/4qO1/vQ3UtoLtVb7UiFacV218=;
	b=EMck58Kvvnb5OJeIhsuqw46AuRMPRpQAXfzxDY3+fvMetPVtf+ZgaRnWHKz3RktJovPTsm
	ABL6JZOizCarmj7NVVwaHFGuDTSs35z3SYwykGTKFo+ji3XJCUGp08Cx9I+nLVidpUGHWw
	/zp/9Lpreuyxiga/yvBXNv0gH/4UH8U=
Subject: [PATCH 0/2] xen: credit2: fix boot hangs if dom0_nodes is used
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Olaf Hering <ohering@suse.de>
Date: Tue, 02 Aug 2022 15:51:22 +0200
Message-ID: <165944775952.3531.14547627248752689801.stgit@tumbleweed.Wayrath>
User-Agent: StGit/1.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Currently, if the dom0_nodes parameter is used, to limit the hard or
soft affinity of dom0's vCPUs, the boot hangs. This is because the vCPU
affinity is set in two steps, and is only correct after we've done both.
Credit2, however, manages to see and use the result of the first one and
vCPUs are put on pCPUs where they can't run.

This has been reported here:
https://bugzilla.suse.com/show_bug.cgi?id=1197081

And a fix has been discussed in the thread of this message:
https://lore.kernel.org/xen-devel/e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com/

The solution adopted in this series is to change the vCPU affinity
setting code in such a way that it happens alltogether and in one place
(patch 2).

While there, make the dom0_vcpus_pin boot parameter more precise, by
making sure that it is applied only to actual dom0's vCPUs, and not to
the vCPUs of the hardware domain, which may or may not be dom0 itself
(patch 2).

Regards
---
Dario Faggioli (2):
      xen: sched: dom0_vcpus_pin should only affect dom0
      xen/sched: setup dom0 vCPUs affinity only once


 xen/common/sched/core.c | 63 +++++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 24 deletions(-)
--
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


