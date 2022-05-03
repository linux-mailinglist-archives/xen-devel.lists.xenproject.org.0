Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A05518559
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 15:22:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319642.539956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTo-0007KT-6z; Tue, 03 May 2022 13:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319642.539956; Tue, 03 May 2022 13:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nlsTo-0007IP-3M; Tue, 03 May 2022 13:22:16 +0000
Received: by outflank-mailman (input) for mailman id 319642;
 Tue, 03 May 2022 13:22:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2YGB=VL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1nlsTl-0006lB-Px
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 13:22:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09964a51-cae4-11ec-8fc4-03012f2f19d4;
 Tue, 03 May 2022 15:22:10 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0970D1F74B;
 Tue,  3 May 2022 13:22:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EDF013ABE;
 Tue,  3 May 2022 13:22:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x7ntFYEscWIASAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 03 May 2022 13:22:09 +0000
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
X-Inumbo-ID: 09964a51-cae4-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1651584130; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=OCiFhYZGfRbvpOrr1IR3lhjXORH3jBMETGpB22+cUf4=;
	b=NkSvVU0jzbByPjBn7ogNMnnyej2TuY2z7mt0eVPium+9eD6GxprqRlfTrBS52DctN/QLAB
	t6vFitDNeyXk8vdjBpDcdufkxY558EEEVPi+0w4syg5u6iECR8XV+UsVAWKMZVYwPgtEQD
	Wu33a9malb3HwtZ2ImjJ0txaVGbFhYY=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jbeulich@suse.com,
	Juergen Gross <jgross@suse.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/2] x86/pat: fix querying available caching modes
Date: Tue,  3 May 2022 15:22:05 +0200
Message-Id: <20220503132207.17234-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix some issues with querying caching modes being available for memory
mappings.

This is a replacement for the patch of Jan sent recently:

https://lists.xen.org/archives/html/xen-devel/2022-04/msg02392.html

Juergen Gross (2):
  x86/pat: fix x86_has_pat_wp()
  x86/pat: add functions to query specific cache mode availability

 arch/x86/include/asm/memtype.h           |  2 ++
 arch/x86/include/asm/pci.h               |  2 +-
 arch/x86/mm/init.c                       | 24 ++++++++++++++++++++++--
 drivers/gpu/drm/i915/gem/i915_gem_mman.c |  8 ++++----
 4 files changed, 29 insertions(+), 7 deletions(-)

-- 
2.35.3


