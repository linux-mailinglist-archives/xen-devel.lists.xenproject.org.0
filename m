Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B63A93F1
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 09:30:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142737.263309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ0A-00072r-Uz; Wed, 16 Jun 2021 07:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142737.263309; Wed, 16 Jun 2021 07:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltQ0A-0006zm-R9; Wed, 16 Jun 2021 07:30:18 +0000
Received: by outflank-mailman (input) for mailman id 142737;
 Wed, 16 Jun 2021 07:30:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=my07=LK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltQ09-0006Rp-2F
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 07:30:17 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 857ad28a-75a5-4017-a0fc-28718caeb760;
 Wed, 16 Jun 2021 07:30:11 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A261A21A24;
 Wed, 16 Jun 2021 07:30:10 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 53A0511A98;
 Wed, 16 Jun 2021 07:30:10 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id kOVJE4KoyWBfZAAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 16 Jun 2021 07:30:10 +0000
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
X-Inumbo-ID: 857ad28a-75a5-4017-a0fc-28718caeb760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1r1xotAufgSrJxoO6eVl3GT9o9kmdrAP0fb2+09k/Y=;
	b=rrtxG4a3oZRTeuM96PmrvNJ9mDw4s3FGu3Lt679kjarEpkWxfo+hWYdS4X+u3TqylaZlJr
	V3FSb3/rS3kXEauOsaW7c5pXjxS4O9eIryIAQc0InNovNDrA6RZm3/l8q7+i88EsnXV6QY
	Gm6m0edAK5fEt0Xzp2IcFUvrAYJKM+w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623828610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S1r1xotAufgSrJxoO6eVl3GT9o9kmdrAP0fb2+09k/Y=;
	b=rrtxG4a3oZRTeuM96PmrvNJ9mDw4s3FGu3Lt679kjarEpkWxfo+hWYdS4X+u3TqylaZlJr
	V3FSb3/rS3kXEauOsaW7c5pXjxS4O9eIryIAQc0InNovNDrA6RZm3/l8q7+i88EsnXV6QY
	Gm6m0edAK5fEt0Xzp2IcFUvrAYJKM+w=
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
	"H. Peter Anvin" <hpa@zytor.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] xen: fix setting of max_pfn in shared_info
Date: Wed, 16 Jun 2021 09:30:06 +0200
Message-Id: <20210616073007.5215-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210616073007.5215-1-jgross@suse.com>
References: <20210616073007.5215-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen PV guests are specifying the highest used PFN via the max_pfn
field in shared_info. This value is used by the Xen tools when saving
or migrating the guest.

Unfortunately this field is misnamed, as in reality it is specifying
the number of pages (including any memory holes) of the guest, so it
is the highest used PFN + 1. Renaming isn't possible, as this is a
public Xen hypervisor interface which needs to be kept stable.

The kernel will set the value correctly initially at boot time, but
when adding more pages (e.g. due to memory hotplug or ballooning) a
real PFN number is stored in max_pfn. This is done when expanding the
p2m array, and the PFN stored there is even possibly wrong, as it
should be the last possible PFN of the just added P2M frame, and not
one which led to the P2M expansion.

Fix that by setting shared_info->max_pfn to the last possible PFN + 1.

Fixes: 98dd166ea3a3c3 ("x86/xen/p2m: hint at the last populated P2M entry")
Cc: stable@vger.kernel.org
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/x86/xen/p2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index ac06ca32e9ef..5e6e236977c7 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -618,8 +618,8 @@ int xen_alloc_p2m_entry(unsigned long pfn)
 	}
 
 	/* Expanded the p2m? */
-	if (pfn > xen_p2m_last_pfn) {
-		xen_p2m_last_pfn = pfn;
+	if (pfn >= xen_p2m_last_pfn) {
+		xen_p2m_last_pfn = ALIGN(pfn + 1, P2M_PER_PAGE);
 		HYPERVISOR_shared_info->arch.max_pfn = xen_p2m_last_pfn;
 	}
 
-- 
2.26.2


