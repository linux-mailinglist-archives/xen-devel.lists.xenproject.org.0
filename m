Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D642604F9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Sep 2020 21:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFMNa-0001f2-LV; Mon, 07 Sep 2020 19:00:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFMNZ-0001ex-6M
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 19:00:37 +0000
X-Inumbo-ID: ffc6b678-e30e-4327-ac8e-495f91597644
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc6b678-e30e-4327-ac8e-495f91597644;
 Mon, 07 Sep 2020 19:00:35 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 087J0Y4h028411
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:34 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor
 denied by domain of hudson@trmm.net) receiver=ame7.swcp.com;
 client-ip=62.251.112.184; helo=diamond.fritz.box;
 envelope-from=hudson@trmm.net;
 x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with
 libspf2-1.2.10; 
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 087J0RtK061615
 for <xen-devel@lists.xenproject.org>; Mon, 7 Sep 2020 13:00:28 -0600 (MDT)
 (envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl
 [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 0/4] efi: Unified Xen hypervisor/kernel/initrd images
Date: Mon,  7 Sep 2020 15:00:23 -0400
Message-Id: <20200907190027.669086-1-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by
 milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]);
 Mon, 07 Sep 2020 13:00:29 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
 version=3.4.2
X-Spam-Level: 
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Trammell hudson <hudson@trmm.net>

This patch series adds support for bundling the xen.efi hypervisor,
the xen.cfg configuration file, the Linux kernel and initrd, as well
as the XSM, and architectural specific files into a single "unified"
EFI executable.  This allows an administrator to update the components
independently without requiring rebuilding xen, as well as to replace
the components in an existing image.

The resulting EFI executable can be invoked directly from the UEFI Boot
Manager, removing the need to use a separate loader like grub as well
as removing dependencies on local filesystem access.  And since it is
a single file, it can be signed and validated by UEFI Secure Boot without
requring the shim protocol.

It is inspired by systemd-boot's unified kernel technique and borrows the
function to locate PE sections from systemd's LGPL'ed code.  During EFI
boot, Xen looks at its own loaded image to locate the PE sections for
the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
(`.initrd`), and XSM config (`.xsm`), which are included after building
xen.efi using objcopy to add named sections for each input file.

Trammell hudson (4):
  x86/xen.lds.S: Work around binutils build id alignment bug
  efi/boot.c: add file.need_to_free and split display_file_info()
  efi: Enable booting unified hypervisor/kernel/initrd images
  efi: Do not use command line if secure boot is enabled.

 .gitignore                  |   1 +
 docs/misc/efi.pandoc        |  47 ++++++++++++
 xen/arch/arm/efi/efi-boot.h |  22 ++++--
 xen/arch/x86/efi/Makefile   |   2 +-
 xen/arch/x86/efi/efi-boot.h |   7 +-
 xen/arch/x86/xen.lds.S      |   1 +
 xen/common/efi/boot.c       | 139 ++++++++++++++++++++++++++---------
 xen/common/efi/efi.h        |   3 +
 xen/common/efi/pe.c         | 141 ++++++++++++++++++++++++++++++++++++
 9 files changed, 317 insertions(+), 46 deletions(-)
 create mode 100644 xen/common/efi/pe.c

-- 
2.25.1


