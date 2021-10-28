Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC7D43DCC6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 10:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217721.377863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WR-00043v-Pd; Thu, 28 Oct 2021 08:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217721.377863; Thu, 28 Oct 2021 08:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg0WR-000426-Ll; Thu, 28 Oct 2021 08:12:27 +0000
Received: by outflank-mailman (input) for mailman id 217721;
 Thu, 28 Oct 2021 08:12:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mg0WQ-00041u-4A
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 08:12:26 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fa1a8677-4a17-4393-b02a-b061a7bfd820;
 Thu, 28 Oct 2021 08:12:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0749421969;
 Thu, 28 Oct 2021 08:12:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 94FC613B7D;
 Thu, 28 Oct 2021 08:12:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cAz8ImdbemE/MQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 08:12:23 +0000
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
X-Inumbo-ID: fa1a8677-4a17-4393-b02a-b061a7bfd820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635408744; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=MAdAn9lpXksqynEY71tU+xB36Uh2pHZMgZIOmXx5QU4=;
	b=oHPcT2FRTlfOw5yijkWBtet9X2gojCMg6OeMHOToEdrwFfsTjLhzRvqSpw0D2tQG0a8pa0
	xcIGS5u++8uvD2Qxr75dbGuvqfKHVXNd/W2R1qKUMFHthtVP3ocDnuubBMr3ywbae33Rwr
	d1iPp8Gg8fKtI8iVlvKc+O1Bw939tn4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/4] xen: do some cleanup
Date: Thu, 28 Oct 2021 10:12:17 +0200
Message-Id: <20211028081221.2475-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some cleanups, mostly related to no longer supporting 32-bit PV mode.

Juergen Gross (4):
  x86/xen: remove 32-bit pv leftovers
  xen: allow pv-only hypercalls only with CONFIG_XEN_PV
  xen: remove highmem remnants
  x86/xen: remove 32-bit awareness from startup_xen

 arch/arm/xen/enlighten.c             |   1 -
 arch/arm/xen/hypercall.S             |   1 -
 arch/arm64/xen/hypercall.S           |   1 -
 arch/x86/include/asm/xen/hypercall.h | 233 ++++++++++++---------------
 arch/x86/xen/enlighten_pv.c          |   7 -
 arch/x86/xen/mmu_pv.c                |   1 -
 arch/x86/xen/xen-head.S              |  12 +-
 drivers/xen/mem-reservation.c        |  27 ++--
 include/xen/arm/hypercall.h          |  15 --
 9 files changed, 118 insertions(+), 180 deletions(-)

-- 
2.26.2


