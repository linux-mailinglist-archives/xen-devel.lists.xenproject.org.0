Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D04F22B4914
	for <lists+xen-devel@lfdr.de>; Mon, 16 Nov 2020 16:23:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28411.57540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegLf-00027E-KC; Mon, 16 Nov 2020 15:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28411.57540; Mon, 16 Nov 2020 15:23:19 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kegLf-00025w-Bc; Mon, 16 Nov 2020 15:23:19 +0000
Received: by outflank-mailman (input) for mailman id 28411;
 Mon, 16 Nov 2020 15:23:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zhvb=EW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kegLe-00021y-ES
 for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:23:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f5713986-34fd-471c-a68c-c89fdd80742b;
 Mon, 16 Nov 2020 15:23:12 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 30619AF37;
 Mon, 16 Nov 2020 15:23:11 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Zhvb=EW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kegLe-00021y-ES
	for xen-devel@lists.xenproject.org; Mon, 16 Nov 2020 15:23:18 +0000
X-Inumbo-ID: f5713986-34fd-471c-a68c-c89fdd80742b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f5713986-34fd-471c-a68c-c89fdd80742b;
	Mon, 16 Nov 2020 15:23:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605540191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=hXDPxLHhf2Wu81S1L0YOGGDmDdav6QELXVfWLp0Wriw=;
	b=OVr7yeWC1WJ/1YNfjLfTDpzLFPM5irXSm+vTpdhhYWW0gyPttx4RWUmJDusvFHgGnUjA1f
	6B9Q3UEWCc9Hfdns2tdN/wn130OzGduOD18wLIaCKu3fqq2TgVhL4IToyZS54mNBwyfRQD
	XslVTZ7zthwQfSWOk5zXiuWG4F7uhpA=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 30619AF37;
	Mon, 16 Nov 2020 15:23:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Deep Shah <sdeep@vmware.com>,
	"VMware, Inc." <pv-drivers@vmware.com>
Subject: [PATCH 0/4] x86/xen: do some paravirt cleanup
Date: Mon, 16 Nov 2020 16:22:57 +0100
Message-Id: <20201116152301.24558-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the usergs_sysret64 paravirt call completely and switch
the swapgs one to use ALTERNATIVE instead. This requires to fix the
IST based exception entries for Xen PV to use the same mechanism as
NMI and debug exception already do.

Juergen Gross (4):
  x86/xen: use specific Xen pv interrupt entry for MCE
  x86/xen: use specific Xen pv interrupt entry for DF
  x86/pv: switch SWAPGS to ALTERNATIVE
  x86/xen: drop USERGS_SYSRET64 paravirt call

 arch/x86/entry/entry_64.S             | 32 ++++++++++++---------------
 arch/x86/include/asm/idtentry.h       |  6 +++++
 arch/x86/include/asm/irqflags.h       | 26 +++++++---------------
 arch/x86/include/asm/paravirt.h       | 25 ---------------------
 arch/x86/include/asm/paravirt_types.h | 10 ---------
 arch/x86/kernel/asm-offsets_64.c      |  3 ---
 arch/x86/kernel/paravirt.c            |  6 +----
 arch/x86/kernel/paravirt_patch.c      |  7 ------
 arch/x86/xen/enlighten_pv.c           | 28 ++++++++++++++++++-----
 arch/x86/xen/xen-asm.S                | 24 ++------------------
 arch/x86/xen/xen-ops.h                |  2 --
 11 files changed, 53 insertions(+), 116 deletions(-)

-- 
2.26.2


