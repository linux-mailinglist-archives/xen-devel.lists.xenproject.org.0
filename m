Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A8141463B
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192461.342915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzWx-0001te-2e; Wed, 22 Sep 2021 10:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192461.342915; Wed, 22 Sep 2021 10:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzWw-0001rz-SM; Wed, 22 Sep 2021 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 192461;
 Wed, 22 Sep 2021 10:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U2Du=OM=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSzWv-0001rn-59
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:31:09 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 56283d78-3dcf-4d95-bc83-5e1c85586042;
 Wed, 22 Sep 2021 10:31:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FD44201DD;
 Wed, 22 Sep 2021 10:31:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AD9CA13D69;
 Wed, 22 Sep 2021 10:31:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id D6lWJ+oFS2GHWAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 22 Sep 2021 10:31:06 +0000
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
X-Inumbo-ID: 56283d78-3dcf-4d95-bc83-5e1c85586042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632306667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s1H6Hgf+92X5PDjWMvrW0ZAWQ57zgmauDgvkDjzNQEw=;
	b=YYfv4ClZEZvhsiD2N/MbxWAvzX1c20MHJQVGK2jzgdzcUQ4rvnnCJ+VZbLjoNGliQ1Hb30
	8ZdrIT9YZ1uZE6muO7O2brCrMzr8OTocfoMsuQATPSy1psgRUzeaRVcsEAIGE6FyRDvKMv
	2q13TFoSLgeO1fYkP0yDUOsUSWy/oFI=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: peterz@infradead.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH v2 0/2] x86/xen: simplify irq pvops
Date: Wed, 22 Sep 2021 12:31:00 +0200
Message-Id: <20210922103102.3589-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pvops function for Xen PV guests handling the interrupt flag are
much more complex than needed.

With the supported Xen hypervisor versions they can be simplified a
lot, especially by removing the need for disabling preemption.

Juergen Gross (2):
  x86/xen: remove xen_have_vcpu_info_placement flag
  x86/xen: switch initial pvops IRQ functions to dummy ones

 arch/x86/include/asm/paravirt_types.h |   2 +
 arch/x86/kernel/paravirt.c            |  13 ++-
 arch/x86/xen/enlighten.c              | 116 ++++++--------------------
 arch/x86/xen/enlighten_hvm.c          |   6 +-
 arch/x86/xen/enlighten_pv.c           |  28 ++-----
 arch/x86/xen/irq.c                    |  61 +-------------
 arch/x86/xen/smp.c                    |  24 ------
 arch/x86/xen/xen-ops.h                |   4 +-
 8 files changed, 53 insertions(+), 201 deletions(-)

-- 
2.26.2


