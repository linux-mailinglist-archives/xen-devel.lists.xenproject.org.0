Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBCB561309
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 09:15:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358235.587327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6oNz-0003bZ-By; Thu, 30 Jun 2022 07:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358235.587327; Thu, 30 Jun 2022 07:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6oNz-0003Yp-8l; Thu, 30 Jun 2022 07:14:47 +0000
Received: by outflank-mailman (input) for mailman id 358235;
 Thu, 30 Jun 2022 07:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gQTH=XF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o6oNx-0003Yc-Pt
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 07:14:45 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 512bc2b1-f844-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 09:14:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3549C1F910;
 Thu, 30 Jun 2022 07:14:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC6F913A5C;
 Thu, 30 Jun 2022 07:14:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C4qFMGNNvWKvKgAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Jun 2022 07:14:43 +0000
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
X-Inumbo-ID: 512bc2b1-f844-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1656573284; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=w8JobtSvpzNoUpwJIImS2sf/s9H6qdugYtbCVXRzcT0=;
	b=JFb6EH83ripqdvoD961Q5CiVgMh8sDno1KZ5b6pIW5+KAGWd8xoxWWwBT1Of6BlatnmRl4
	vBiV4qmXv1K8NCPocoxFmfwWwn7DfVydWr2H4jUJLimfFQt4AVBxKY1VELUuG0TTjmjfD0
	oTfF+bbPZeE2ZmvbSfI4g1OX4OExjtY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: jpoimboe@kernel.org,
	Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v3 0/3] x86: fix brk area initialization
Date: Thu, 30 Jun 2022 09:14:38 +0200
Message-Id: <20220630071441.28576-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brk area needs to be zeroed initially, like the .bss section.
At the same time its memory should be covered by the ELF program
headers.

Juergen Gross (3):
  x86/xen: use clear_bss() for Xen PV guests
  x86: clear .brk area at early boot
  x86: fix .brk attribute in linker script

 arch/x86/include/asm/setup.h  |  3 +++
 arch/x86/kernel/head64.c      |  4 +++-
 arch/x86/kernel/vmlinux.lds.S |  2 +-
 arch/x86/xen/enlighten_pv.c   |  8 ++++++--
 arch/x86/xen/xen-head.S       | 10 +---------
 5 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.35.3


