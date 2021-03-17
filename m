Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77BC33EA55
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 08:01:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98565.187045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMQAy-0002t0-Fw; Wed, 17 Mar 2021 07:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98565.187045; Wed, 17 Mar 2021 07:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMQAy-0002sb-Cc; Wed, 17 Mar 2021 07:01:04 +0000
Received: by outflank-mailman (input) for mailman id 98565;
 Wed, 17 Mar 2021 07:01:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bC41=IP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lMQAw-0002sK-FV
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 07:01:02 +0000
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:400:100::b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c7d2328b-98dc-4a87-8758-b16c388084dc;
 Wed, 17 Mar 2021 07:01:01 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.21.0 SBL|AUTH)
 with ESMTPSA id u08c13x2H70o88o
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 17 Mar 2021 08:00:50 +0100 (CET)
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
X-Inumbo-ID: c7d2328b-98dc-4a87-8758-b16c388084dc
ARC-Seal: i=1; a=rsa-sha256; t=1615964450; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=QhJziYMy38tKBzT+jnW2C4YmGZ1LpnM1yOXvawVOjXRBFWX8xjgf2Yc130VDLvcvQP
    iaEdu9J+cagSPiEUt6y4FiNaE9Mt7V+UfKRWG+/6CtWlSmYzkRY5hajvM6f1Wx+mShpd
    u0MfiP0I1K4TJ5WRfOiPNxAql3NaezGb51GKtNlVt1PX4p+EvQf7tGzbWDMzDVFVLjwN
    r/WbxGEzgi+Tv/lkEHfTSL4BeWpXnQwNGXe0f3NPQhmVnxay8/GPYv15egHhFQ7CSS/m
    62b8dyr11AaIkhKRvBd+O8gPMMIaK2FDKAwF+Vu5F5kpvXfkd8mtoBYVwvFeT89crnK+
    Xrnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615964450;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=F5gsroM5N4Gb38oAx76awNUeg6mdAvkdztZJQE8rvpw=;
    b=bD5n6UEJ0IumSyeyLQRM+en8Q2cd3gGFofEVOxEgpzMq4oF/jWSY7zYcuwLTkySv2v
    i4ayvCeg67oMz7cu1ssPYNMeSOCFa5pOXDvpg1Xj/7ETx6rzoIPJC5zNOmdu7YvLUNmk
    uAMhA0K7zghET97gJVGvHOehvZ5ZpSrpAI54FnAbb5aJVvsSZ6Z0wD/EyZ1TjJCF2FkP
    yfyqVWbIzdrQmCPSxmZGgEQfahwQa0jdEEXSU+/SN2eLJWWL0TJs3yajIiQkznW4SHzO
    vvOXxkiolOEWMAo9NWmmslcEoPQhcJhDEqNeDRg7hmlxD+2fxIRdbhUXdAv7wk5OxE+m
    INvw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615964450;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=F5gsroM5N4Gb38oAx76awNUeg6mdAvkdztZJQE8rvpw=;
    b=mzzd+qADwgwU7fgLB7cnhPrFYNn4DwI6ai1ZXd9r2AvGg3mLnzScIIjHwb5aUB+3tq
    QnnYZd29ov7wQXeDwT0nHVAmoedYK3Ux7SMCdoU7gC5bvt5IPqn2/scQqDiqsPGl8MD2
    ZK7Pt4IFRWWkDGP3RnYT8P12z/ds47aiTV046FGB0vr8tZKwoeC2vbxu7jaqrbl3j6QF
    z4V9eVPR78NAPlzwyg3hItqK3Z5a2BJ52qtTryktJRpBiST/WsdYyF+WDgICcKGOWjio
    ZwNcKxIatwSJcmD2oPJNu1H6E9J63C48tfSsPNRaEivaMQp7q+UPvh50GqnGWONBUafW
    bRpg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS325Pjw=="
X-RZG-CLASS-ID: mo00
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org,
	qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v2] piix: fix regression during unplug in Xen HVM domUs
Date: Wed, 17 Mar 2021 08:00:46 +0100
Message-Id: <20210317070046.17860-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ee358e919e385fdc79d59d0d47b4a81e349cd5c9 causes a regression in
Xen HVM domUs which run xenlinux based kernels.

If the domU has an USB device assigned, for example with
"usbdevice=['tablet']" in domU.cfg, the late unplug of devices will
kill the emulated USB host. As a result the khubd thread hangs, and as
a result the entire boot process.

For some reason this does not affect pvops based kernels. This is
most likely caused by the fact that unplugging happens very early
during boot.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 hw/ide/piix.c        | 5 +++++
 include/hw/ide/pci.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index b9860e35a5..7f1998bf04 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -109,6 +109,9 @@ static void piix_ide_reset(DeviceState *dev)
     uint8_t *pci_conf = pd->config;
     int i;
 
+    if (d->xen_unplug_done == true) {
+        return;
+    }
     for (i = 0; i < 2; i++) {
         ide_bus_reset(&d->bus[i]);
     }
@@ -151,6 +154,7 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
 
+    d->xen_unplug_done = false;
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
     bmdma_setup_bar(d);
@@ -170,6 +174,7 @@ int pci_piix3_xen_ide_unplug(DeviceState *dev, bool aux)
     BlockBackend *blk;
 
     pci_ide = PCI_IDE(dev);
+    pci_ide->xen_unplug_done = true;
 
     for (i = aux ? 1 : 0; i < 4; i++) {
         idebus = &pci_ide->bus[i / 2];
diff --git a/include/hw/ide/pci.h b/include/hw/ide/pci.h
index d8384e1c42..9e71cfec3b 100644
--- a/include/hw/ide/pci.h
+++ b/include/hw/ide/pci.h
@@ -50,6 +50,7 @@ struct PCIIDEState {
     IDEBus bus[2];
     BMDMAState bmdma[2];
     uint32_t secondary; /* used only for cmd646 */
+    bool xen_unplug_done;
     MemoryRegion bmdma_bar;
     MemoryRegion cmd_bar[2];
     MemoryRegion data_bar[2];

