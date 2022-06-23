Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB4C5576F4
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 11:46:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354726.581980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPi-0008NZ-Kg; Thu, 23 Jun 2022 09:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354726.581980; Thu, 23 Jun 2022 09:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4JPi-0008Li-HZ; Thu, 23 Jun 2022 09:46:14 +0000
Received: by outflank-mailman (input) for mailman id 354726;
 Thu, 23 Jun 2022 09:46:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4JPh-0008LX-BP
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 09:46:13 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 503ee856-f2d9-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 11:46:11 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 14A8F1FD8A;
 Thu, 23 Jun 2022 09:46:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AED21133A6;
 Thu, 23 Jun 2022 09:46:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XCAtKWI2tGLmLwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 09:46:10 +0000
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
X-Inumbo-ID: 503ee856-f2d9-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655977571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=IIvicZRTKlJOBgOc3++ZHzJfG9P22jzec6L0MnajaIo=;
	b=HPHaGgfyCZ84QyQjmgfwZPXBbLogxmzAtQTOZqyOqAI/F39MK0TO4DKhXNYcJSj4jo+eX1
	4LEt8gm8/e7JyZ+Gah81gPbuDHtiUtkXXTogbdVwTdSRavynFnglvqajH+3ROrBcVj3ETO
	NGKDudBRBG152w3cUPz/VLCVqB1q+AE=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v2 0/3] x86: fix brk area initialization
Date: Thu, 23 Jun 2022 11:46:05 +0200
Message-Id: <20220623094608.7294-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The brk area needs to be zeroed initially, like the .bss section.
At the same time its memory should be covered by the ELF program
headers.

Juergen Gross (3):
  x86/xen: use clear_bss() for Xen PV guests
  x86: fix setup of brk area
  x86: fix .brk attribute in linker script

 arch/x86/include/asm/setup.h  |  3 +++
 arch/x86/kernel/head64.c      |  4 +++-
 arch/x86/kernel/vmlinux.lds.S |  2 +-
 arch/x86/xen/enlighten_pv.c   |  8 ++++++--
 arch/x86/xen/xen-head.S       | 10 +---------
 5 files changed, 14 insertions(+), 13 deletions(-)

-- 
2.35.3


