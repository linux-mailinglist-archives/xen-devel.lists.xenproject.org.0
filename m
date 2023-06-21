Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17548738496
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 15:13:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552721.862950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdn-0001Uz-Q4; Wed, 21 Jun 2023 13:12:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552721.862950; Wed, 21 Jun 2023 13:12:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBxdn-0001S8-MV; Wed, 21 Jun 2023 13:12:55 +0000
Received: by outflank-mailman (input) for mailman id 552721;
 Wed, 21 Jun 2023 13:12:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A1p5=CJ=suse.com=petr.pavlu@srs-se1.protection.inumbo.net>)
 id 1qBxdm-0000hv-EO
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 13:12:54 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54d28229-1035-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 15:12:53 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A60E31FE59;
 Wed, 21 Jun 2023 13:12:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 85CD4134B1;
 Wed, 21 Jun 2023 13:12:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EJfUH1X3kmQKYQAAMHmgww
 (envelope-from <petr.pavlu@suse.com>); Wed, 21 Jun 2023 13:12:53 +0000
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
X-Inumbo-ID: 54d28229-1035-11ee-b236-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1687353173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OH3D5BL2oDz82o2JgztoWpCZ3H7tiujkv+/UGcR2f4o=;
	b=h02yh0HWqzeK9gNj1xtBPEjcJvvwrqcyOr8xi/AVYIcPP7VVzj426Zq8yjXQYSvoDStDRh
	uGkQ5WNDPbel1Arfy3Dec2k2C4xcfJiK5f9uI+PVLqanTSdeSCWuttexj5IaeWRvhkGVmf
	B+sPB9jq9GU+tX1YKGf1ae5vGJtOHvQ=
From: Petr Pavlu <petr.pavlu@suse.com>
To: jgross@suse.com,
	sstabellini@kernel.org,
	oleksandr_tyshchenko@epam.com
Cc: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Petr Pavlu <petr.pavlu@suse.com>
Subject: [PATCH 1/2] xen/virtio: Fix NULL deref when a bridge of PCI root bus has no parent
Date: Wed, 21 Jun 2023 15:12:13 +0200
Message-Id: <20230621131214.9398-2-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230621131214.9398-1-petr.pavlu@suse.com>
References: <20230621131214.9398-1-petr.pavlu@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When attempting to run Xen on a QEMU/KVM virtual machine with virtio
devices (all x86_64), function xen_dt_get_node() crashes on accessing
bus->bridge->parent->of_node because a bridge of the PCI root bus has no
parent set:

[    1.694192][    T1] BUG: kernel NULL pointer dereference, address: 0000000000000288
[    1.695688][    T1] #PF: supervisor read access in kernel mode
[    1.696297][    T1] #PF: error_code(0x0000) - not-present page
[    1.696297][    T1] PGD 0 P4D 0
[    1.696297][    T1] Oops: 0000 [#1] PREEMPT SMP NOPTI
[    1.696297][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.3.7-1-default #1 openSUSE Tumbleweed a577eae57964bb7e83477b5a5645a1781df990f0
[    1.696297][    T1] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.15.0-0-g2dd4b9b-rebuilt.opensuse.org 04/01/2014
[    1.696297][    T1] RIP: e030:xen_virtio_restricted_mem_acc+0xd9/0x1c0
[    1.696297][    T1] Code: 45 0c 83 e8 c9 a3 ea ff 31 c0 eb d7 48 8b 87 40 ff ff ff 48 89 c2 48 8b 40 10 48 85 c0 75 f4 48 8b 82 10 01 00 00 48 8b 40 40 <48> 83 b8 88 02 00 00 00 0f 84 45 ff ff ff 66 90 31 c0 eb a5 48 89
[    1.696297][    T1] RSP: e02b:ffffc90040013cc8 EFLAGS: 00010246
[    1.696297][    T1] RAX: 0000000000000000 RBX: ffff888006c75000 RCX: 0000000000000029
[    1.696297][    T1] RDX: ffff888005ed1000 RSI: ffffc900400f100c RDI: ffff888005ee30d0
[    1.696297][    T1] RBP: ffff888006c75010 R08: 0000000000000001 R09: 0000000330000006
[    1.696297][    T1] R10: ffff888005850028 R11: 0000000000000002 R12: ffffffff830439a0
[    1.696297][    T1] R13: 0000000000000000 R14: ffff888005657900 R15: ffff888006e3e1e8
[    1.696297][    T1] FS:  0000000000000000(0000) GS:ffff88804a000000(0000) knlGS:0000000000000000
[    1.696297][    T1] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.696297][    T1] CR2: 0000000000000288 CR3: 0000000002e36000 CR4: 0000000000050660
[    1.696297][    T1] Call Trace:
[    1.696297][    T1]  <TASK>
[    1.696297][    T1]  virtio_features_ok+0x1b/0xd0
[    1.696297][    T1]  virtio_dev_probe+0x19c/0x270
[    1.696297][    T1]  really_probe+0x19b/0x3e0
[    1.696297][    T1]  __driver_probe_device+0x78/0x160
[    1.696297][    T1]  driver_probe_device+0x1f/0x90
[    1.696297][    T1]  __driver_attach+0xd2/0x1c0
[    1.696297][    T1]  bus_for_each_dev+0x74/0xc0
[    1.696297][    T1]  bus_add_driver+0x116/0x220
[    1.696297][    T1]  driver_register+0x59/0x100
[    1.696297][    T1]  virtio_console_init+0x7f/0x110
[    1.696297][    T1]  do_one_initcall+0x47/0x220
[    1.696297][    T1]  kernel_init_freeable+0x328/0x480
[    1.696297][    T1]  kernel_init+0x1a/0x1c0
[    1.696297][    T1]  ret_from_fork+0x29/0x50
[    1.696297][    T1]  </TASK>
[    1.696297][    T1] Modules linked in:
[    1.696297][    T1] CR2: 0000000000000288
[    1.696297][    T1] ---[ end trace 0000000000000000 ]---

The PCI root bus is in this case created from ACPI description via
acpi_pci_root_add() -> pci_acpi_scan_root() -> acpi_pci_root_create() ->
pci_create_root_bus() where the last function is called with
parent=NULL. It indicates that no parent is present and then
bus->bridge->parent is NULL too.

Fix the problem by checking bus->bridge->parent in xen_dt_get_node() for
NULL first.

Fixes: ef8ae384b4c9 ("xen/virtio: Handle PCI devices which Host controller is described in DT")
Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 drivers/xen/grant-dma-ops.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
index 9784a77fa3c9..76f6f26265a3 100644
--- a/drivers/xen/grant-dma-ops.c
+++ b/drivers/xen/grant-dma-ops.c
@@ -303,6 +303,8 @@ static struct device_node *xen_dt_get_node(struct device *dev)
 		while (!pci_is_root_bus(bus))
 			bus = bus->parent;
 
+		if (!bus->bridge->parent)
+			return NULL;
 		return of_node_get(bus->bridge->parent->of_node);
 	}
 
-- 
2.35.3


