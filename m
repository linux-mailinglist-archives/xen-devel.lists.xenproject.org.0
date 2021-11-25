Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F9A45D711
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 10:21:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230752.398903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAw9-0007u2-OH; Thu, 25 Nov 2021 09:21:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230752.398903; Thu, 25 Nov 2021 09:21:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqAw9-0007sA-KX; Thu, 25 Nov 2021 09:21:01 +0000
Received: by outflank-mailman (input) for mailman id 230752;
 Thu, 25 Nov 2021 09:20:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ia/m=QM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqAw7-0007rb-Sw
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 09:20:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00248756-4dd1-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 10:20:58 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 92CB81FD37;
 Thu, 25 Nov 2021 09:20:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2278F13F62;
 Thu, 25 Nov 2021 09:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id W5E0B3pVn2FpHwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 25 Nov 2021 09:20:58 +0000
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
X-Inumbo-ID: 00248756-4dd1-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637832058; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=2rT60szHDwJSJ0Rdu5vF9loQpB+Xz94z8PaEQrYROek=;
	b=kKmZxshIgV3vZ3ECtAKuWaCJNPlpUH8AZ9ctZAobT6C2ULIsAI2+rc+d2C5y7eMYSRzUrd
	P78kMxkOpjLFTB12wxirRYnLKsF1h5j5E9oFeiAFk6lp3BprukTTkyUP26Zd/ZsYgbQVx4
	PyJMvP+LjnioPu/lO1MW3OkBQOLDlS8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: peterz@infradead.org,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [PATCH 0/2] xen: make debugreg accessors always_inline
Date: Thu, 25 Nov 2021 10:20:54 +0100
Message-Id: <20211125092056.24758-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Juergen Gross (2):
  xen: make HYPERVISOR_get_debugreg() always_inline
  xen: make HYPERVISOR_set_debugreg() always_inline

 arch/x86/include/asm/xen/hypercall.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.26.2


