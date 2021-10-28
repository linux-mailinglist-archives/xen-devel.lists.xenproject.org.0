Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D55B43DC01
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 09:28:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.217682.377808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpQ-0004X9-5B; Thu, 28 Oct 2021 07:28:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 217682.377808; Thu, 28 Oct 2021 07:28:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfzpQ-0004UB-0w; Thu, 28 Oct 2021 07:28:00 +0000
Received: by outflank-mailman (input) for mailman id 217682;
 Thu, 28 Oct 2021 07:27:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vfrR=PQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mfzpN-0004Ty-RQ
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 07:27:57 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3086f298-831e-47fa-a994-02350b070050;
 Thu, 28 Oct 2021 07:27:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A67AA1FD4B;
 Thu, 28 Oct 2021 07:27:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 503A013ABD;
 Thu, 28 Oct 2021 07:27:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FZtpEvtQemEmGwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 28 Oct 2021 07:27:55 +0000
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
X-Inumbo-ID: 3086f298-831e-47fa-a994-02350b070050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635406075; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=s1H6Hgf+92X5PDjWMvrW0ZAWQ57zgmauDgvkDjzNQEw=;
	b=W6sS9Lg3HJmDdeEnNjwpHBIHJr/K64x8BNLpRXk/C/7c9+zWtPK6+QSuBu3FbHknmNGgQ0
	wUFQFbZw0q/2YD74L4zQkU3/V5NQJ4bXt2Dkn84gWMIONgCBnwcyZ8DlE+MNbAYEruXC4A
	xLF/3abL2rn8eOCFSEFfKQHiiBjrzec=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH v3 0/2] x86/xen: simplify irq pvops
Date: Thu, 28 Oct 2021 09:27:46 +0200
Message-Id: <20211028072748.29862-1-jgross@suse.com>
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


