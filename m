Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC43428111B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 13:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1955.5804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOJ5C-00022o-Of; Fri, 02 Oct 2020 11:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1955.5804; Fri, 02 Oct 2020 11:18:38 +0000
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
	id 1kOJ5C-00022P-L9; Fri, 02 Oct 2020 11:18:38 +0000
Received: by outflank-mailman (input) for mailman id 1955;
 Fri, 02 Oct 2020 11:18:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kOJ5B-00022K-BG
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:37 +0000
Received: from mx1a.swcp.com (unknown [216.184.2.64])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f100fe75-2bff-446d-a52f-5d082d97d84c;
 Fri, 02 Oct 2020 11:18:35 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
 by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIWU5016902;
 Fri, 2 Oct 2020 05:18:32 -0600
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
 by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXn008607;
 Fri, 2 Oct 2020 05:18:29 -0600 (MDT) (envelope-from hudson@trmm.net)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=U/dH=DJ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kOJ5B-00022K-BG
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 11:18:37 +0000
X-Inumbo-ID: f100fe75-2bff-446d-a52f-5d082d97d84c
Received: from mx1a.swcp.com (unknown [216.184.2.64])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f100fe75-2bff-446d-a52f-5d082d97d84c;
	Fri, 02 Oct 2020 11:18:35 +0000 (UTC)
Received: from ame7.swcp.com (ame7.swcp.com [216.184.2.70])
	by mx1a.swcp.com (8.14.4/8.14.4/Debian-4) with ESMTP id 092BIWU5016902;
	Fri, 2 Oct 2020 05:18:32 -0600
Received-SPF: neutral (ame7.swcp.com: 62.251.112.184 is neither permitted nor denied by domain of hudson@trmm.net) receiver=ame7.swcp.com; client-ip=62.251.112.184; helo=diamond.fritz.box; envelope-from=hudson@trmm.net; x-software=spfmilter 2.001 http://www.acme.com/software/spfmilter/ with libspf2-1.2.10;
Received: from diamond.fritz.box (62-251-112-184.ip.xs4all.nl [62.251.112.184])
	by ame7.swcp.com (8.15.2/8.15.2) with ESMTP id 092BIOXn008607;
	Fri, 2 Oct 2020 05:18:29 -0600 (MDT)
	(envelope-from hudson@trmm.net)
X-Authentication-Warning: ame7.swcp.com: Host 62-251-112-184.ip.xs4all.nl [62.251.112.184] claimed to be diamond.fritz.box
From: Trammell Hudson <hudson@trmm.net>
To: xen-devel@lists.xenproject.org
Cc: roger.pau@citrix.com, jbeulich@suse.com, andrew.cooper3@citrix.com,
        wl@xen.org
Subject: [PATCH v9 0/4] efi: Unified Xen hypervisor/kernel/initrd images
Date: Fri,  2 Oct 2020 07:18:18 -0400
Message-Id: <20201002111822.42142-1-hudson@trmm.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.83
X-Greylist: Message whitelisted by DRAC access database, not delayed by milter-greylist-4.6.2 (ame7.swcp.com [216.184.2.128]); Fri, 02 Oct 2020 05:18:30 -0600 (MDT)
X-Virus-Scanned: clamav-milter 0.100.2 at ame7
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ame7.swcp.com
X-Spam-Status: No, hits=0.7 tests=NO_RECEIVED,NO_RELAYS,SPF_NEUTRAL
	version=3.4.2
X-Spam-Level: 

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
(`.ramdisk`), and XSM config (`.xsm`), which are included after building
xen.efi using objcopy to add named sections for each input file.

Trammell Hudson (4):
  efi/boot.c: add file.need_to_free
  efi/boot.c: add handle_file_info()
  efi: Enable booting unified hypervisor/kernel/initrd images
  efi: Do not use command line if unified config is included

 .gitignore                  |   1 +
 docs/misc/efi.pandoc        |  49 ++++++++++++
 xen/arch/arm/efi/efi-boot.h |  36 ++++++---
 xen/arch/x86/efi/Makefile   |   2 +-
 xen/arch/x86/efi/efi-boot.h |  13 ++-
 xen/common/efi/boot.c       | 140 ++++++++++++++++++++++++---------
 xen/common/efi/efi.h        |   3 +
 xen/common/efi/pe.c         | 152 ++++++++++++++++++++++++++++++++++++
 8 files changed, 347 insertions(+), 49 deletions(-)
 create mode 100644 xen/common/efi/pe.c

-- 
2.25.1


