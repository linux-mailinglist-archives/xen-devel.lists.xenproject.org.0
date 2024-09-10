Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B001E973129
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:09:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795232.1204460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoC-000709-QY; Tue, 10 Sep 2024 10:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795232.1204460; Tue, 10 Sep 2024 10:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxoC-0006xB-Ma; Tue, 10 Sep 2024 10:09:16 +0000
Received: by outflank-mailman (input) for mailman id 795232;
 Tue, 10 Sep 2024 10:09:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hUAX=QI=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1snxoB-0006hI-2c
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:09:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bacea9e2-6f5c-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 12:09:13 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-37-206-90.retail.telecomitalia.it [79.37.206.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 1C2E44EE07A5;
 Tue, 10 Sep 2024 12:09:12 +0200 (CEST)
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
X-Inumbo-ID: bacea9e2-6f5c-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1725962952; bh=G0jdHtZed4xaMPD2WIEk/H/LWyB972FH9uIOpA1QYoU=;
	h=From:To:Cc:Subject:Date:From;
	b=W5WjVn2r8H2s88QVK5XZacvOWcxkMe7H7xswAKGMRpqMmVVK03AUhg5fw47Z9iNSn
	 VLFP13zCz34ekITqYAROLk0ml88dqxZE/GkOXzTVTMBAjYdvaRmJqjKCEkMKPWWITG
	 rndAqgCOvSZse5SFPQ6vjSDlBjK6obLGA7yW08FXJkNJgB/n+G09x79upPZuUKKlQX
	 BVB11Fcm3xHj3JxViJJBGM6rKzOD4uTEyg+Fjn/Bf9b8ImQEkkShiDp0xe5hRCF2uQ
	 Il0NRpILEbFqS+pWDt5G6TSBFq1scaaXizftVx91/PpvCfJeKV3hddp7zZts5NGPt5
	 rPTDj48KB+uTQ==
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [XEN PATCH 00/12] x86: address violations of MISRA C Rule 16.3
Date: Tue, 10 Sep 2024 12:08:52 +0200
Message-Id: <cover.1725958416.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses violations of Rule 16.3 on the x86 code.

If all the 12 patches will be committed, only 4 violations will be left:
these are under x86_emulate and involve some fallthrough cases.
I'll wait for instructions from x86 maintainers about the right "format" to make
the fallthrough intention explicit (i.e., a comment or the fallthrough keyword
that is not defined in x86-emulate.h at the moment).

Federico Serafini (12):
  x86/psr: address violation of MISRA C Rule 16.3
  x86/time: address violations of MISRA C Rule 16.3
  x86/vm_event: address violation of MISRA C Rule 16.3
  x86/hypercall: address violations of MISRA C Rule 16.3
  x86/monitor: address violation of MISRA C Rule 16.3
  x86/mm: address violations of MISRA C Rule 16.3
  x86/mmcfg: address violation of MISRA C Rule 16.3
  x86/emul: add defensive code
  x86/emul: address violations of MISRA C Rule 16.3
  efi: address violation of MISRA C Rule 16.3
  xen/vpci: add defensive code
  xen/pci: address a violation of MISRA C Rule 16.3

 xen/arch/x86/include/asm/hypercall.h   | 4 ++--
 xen/arch/x86/include/asm/monitor.h     | 1 +
 xen/arch/x86/mm/guest_walk.c           | 1 +
 xen/arch/x86/mm/hap/hap.c              | 2 +-
 xen/arch/x86/mm/hap/nested_hap.c       | 1 +
 xen/arch/x86/mm/paging.c               | 2 +-
 xen/arch/x86/psr.c                     | 1 +
 xen/arch/x86/time.c                    | 2 ++
 xen/arch/x86/vm_event.c                | 1 +
 xen/arch/x86/x86_64/mmconfig-shared.c  | 1 +
 xen/arch/x86/x86_emulate/fpu.c         | 4 ++++
 xen/arch/x86/x86_emulate/x86_emulate.c | 5 +++++
 xen/common/efi/runtime.c               | 2 +-
 xen/drivers/passthrough/pci.c          | 4 +++-
 xen/drivers/vpci/msix.c                | 4 ++++
 15 files changed, 29 insertions(+), 6 deletions(-)

-- 
2.34.1


