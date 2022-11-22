Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B4C6341AB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 17:39:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447261.703284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxWHr-00045Y-Eb; Tue, 22 Nov 2022 16:38:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447261.703284; Tue, 22 Nov 2022 16:38:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxWHr-00042I-Bi; Tue, 22 Nov 2022 16:38:19 +0000
Received: by outflank-mailman (input) for mailman id 447261;
 Tue, 22 Nov 2022 16:38:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rKVg=3W=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oxWHp-00042C-AU
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 16:38:17 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fa83139-6a84-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 17:38:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6F80021EE0;
 Tue, 22 Nov 2022 16:38:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EEFFB13AA1;
 Tue, 22 Nov 2022 16:38:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id K5PhOPX6fGMNPgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 22 Nov 2022 16:38:13 +0000
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
X-Inumbo-ID: 0fa83139-6a84-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1669135094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2HaFudDaMDVTnrq9g6vTYOKijFH6XNF8q+9ygX8nBYA=;
	b=fakECqQAM0jXiY64Wp3MlDxQ0wrI17FsjJs9aBXR4mPgmulrLathoVy4tvMr6JxJ+MqkMI
	qZ1FWS9pVQJr8Bc6fK6I/LZSTDe6x3x1PB3wTv72Scma9KVfatS2oZDDQ+P+n6sZua5thx
	lBeotURNkC+lOLawZpZRsFK3RlSaTq0=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	Andy Shevchenko <andy@infradead.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/3] x86/realmode: use a dummy trampoline for Xen PV guests
Date: Tue, 22 Nov 2022 17:38:07 +0100
Message-Id: <20221122163810.29752-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A Xen PV guests can't run in realmode, so the realmode trampoline can
omitted.

Changes in V2:
- complete new approach

Juergen Gross (3):
  x86/realmode: test real_mode_header outside of real_mode_size_needed()
  x86/realmode: add trampoline reference structure
  x86/xen: add a dummy trampoline for Xen PV guests

 arch/x86/include/asm/realmode.h | 15 +++++++++++----
 arch/x86/platform/efi/quirks.c  |  3 ++-
 arch/x86/realmode/init.c        | 25 ++++++++++++++++++++-----
 arch/x86/xen/enlighten_pv.c     | 17 +++++++++++++++++
 4 files changed, 50 insertions(+), 10 deletions(-)

-- 
2.35.3


