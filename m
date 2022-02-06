Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5A4AB1A7
	for <lists+xen-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266313.459986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDJ-0001a6-Dt; Sun, 06 Feb 2022 19:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266313.459986; Sun, 06 Feb 2022 19:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGnDJ-0001XG-AJ; Sun, 06 Feb 2022 19:28:45 +0000
Received: by outflank-mailman (input) for mailman id 266313;
 Sun, 06 Feb 2022 19:28:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGnDI-0001XA-6a
 for xen-devel@lists.xenproject.org; Sun, 06 Feb 2022 19:28:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDH-0005se-Ah; Sun, 06 Feb 2022 19:28:43 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGnDH-0007Ok-0w; Sun, 06 Feb 2022 19:28:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=/H8pFttg2YhVccQhF2eKBXnyu08W1Blzbzg94oHYGZE=; b=dbLT13
	zvRYgytuSSGw4njvzoHeMF/vCt94opKMqDIv7vQRnoyzFjoLnFs5tAi0Tft2nHej37TrN3sSkTd0H
	eU/0M5caSh5IwP1xBl8yJU3gDAOABBZTOcFJqCpmCRG6OYHaVKvzsyBmWoaAruCGOTUX2MUQaN5+K
	zbXefrgKI0Y=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: ehem+xen@m5p.com,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH RFC 0/3] xen/arm: Allow dom0 to use the EFI framebuffer
Date: Sun,  6 Feb 2022 19:28:36 +0000
Message-Id: <20220206192839.75711-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This is a follow-up of the discussion [1].

When booting using EFI on Raspberry Pi 4, the graphical output will
be using the EFI framebuffer.

On baremetal, the information for the graphic output is retrieved
using the boot services. However, under Xen, dom0 has no access
to the EFI boot services. So we need to a different way to inform Dom0.

For x86 PV dom0, this is using the start_info. On Arm we have no such
thing, so this patch will introduce a new hypercall. This will
require a change in Linux [2] (Based on the 5.17-rc2) to issue the
hypercall and fill-up screen info.

I will properly send the Linux patch once we agree on the interface
between Xen and dom0.

With this series + Linux, I am able to use XFCE in dom0 on the
RPi 4 when booting using UEFI + ACPI.

Looking through the dmesg, there are still a few TODOs to handle:
    - Linux is not able to use the BGRT (Invalid address). This is
      because the driver checks the Image address is part of the UEFI
      Boot Services Area. Such area is not exposed to dom0 (yet).
      By-passing the check doesn't much help because all the EFI Boot
      Services area are given to the normal allocator. So we would
      need to reserve them.
    - The Wifi driver is crashing because it is dereferencing a NULL
      pointer (only seem to happen on Xen).
    - There are error messages of drivers trying to access the EFI
      runtime services (e.g. to fetch firmware for a device) but fails.
      This is expected as Xen doesn't yet expose the EFI runtimes
      services yet.

/!\ This has only been tested on Arm. I will sanity test x86 for the
next version.

Cheers,

[1] https://lore.kernel.org/xen-devel/YY3tSAFTCR4r2FaI@mattapan.m5p.com/
[2] https://pastebin.com/ztUm9Bf3

Julien Grall (3):
  xen/efi: Always query the console information and get GOP
  xen/arm: efi: Introduce and fill the vga_console_info
  xen: Introduce a platform sub-op to retrieve the VGA information

 xen/arch/arm/efi/efi-boot.h       |  6 --
 xen/arch/arm/platform_hypercall.c | 15 +++++
 xen/arch/arm/setup.c              |  4 ++
 xen/arch/x86/efi/efi-boot.h       | 72 -----------------------
 xen/common/efi/boot.c             | 96 +++++++++++++++++++++++++++----
 xen/include/public/platform.h     |  2 +
 xen/include/xen/vga.h             |  2 +-
 7 files changed, 106 insertions(+), 91 deletions(-)

-- 
2.32.0


