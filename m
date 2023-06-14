Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B0D72F673
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548504.856471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L27-0007Lj-PQ; Wed, 14 Jun 2023 07:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548504.856471; Wed, 14 Jun 2023 07:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9L27-0007K4-MG; Wed, 14 Jun 2023 07:35:11 +0000
Received: by outflank-mailman (input) for mailman id 548504;
 Wed, 14 Jun 2023 07:35:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8JF=CC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1q9L26-0007Jv-FM
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 07:35:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fd3b4439-0a85-11ee-b232-6b7b168915f2;
 Wed, 14 Jun 2023 09:35:09 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B0FB8224BD;
 Wed, 14 Jun 2023 07:35:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F49D1391E;
 Wed, 14 Jun 2023 07:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ptTrEaxtiWQoHwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 14 Jun 2023 07:35:08 +0000
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
X-Inumbo-ID: fd3b4439-0a85-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1686728108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DKwEXvQ/TjIOVrDCEZt6GgF/0TeYMetCURbmcH31IcQ=;
	b=g0lEzuk3UgE0XT4LICu9CQ8Y7UU4W868WxIWRYK3LfzxvongqDRrplMWTOJ0lsvMcEKsgQ
	pQwij1boQIpk+NBk2wUrrNHBk0WoBx+9hjvNwDIltkt8JLAXBBtcgC6EfctPN/AUPFX5Kj
	XrWGUQNod2rx8BHiEBf3fk6ZQaUr63U=
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH v4 0/2] x86: xen: add missing prototypes
Date: Wed, 14 Jun 2023 09:34:59 +0200
Message-Id: <20230614073501.10101-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid missing prototype warnings.

Arnd Bergmann (1):
  x86: xen: add missing prototypes

Juergen Gross (1):
  x86/xen: add prototypes for paravirt mmu functions

 arch/x86/xen/efi.c     |  2 ++
 arch/x86/xen/mmu_pv.c  | 16 ++++++++++++++++
 arch/x86/xen/smp.h     |  4 ++++
 arch/x86/xen/smp_pv.c  |  1 -
 arch/x86/xen/xen-ops.h |  3 +++
 include/xen/xen.h      |  3 +++
 6 files changed, 28 insertions(+), 1 deletion(-)

-- 
2.35.3


