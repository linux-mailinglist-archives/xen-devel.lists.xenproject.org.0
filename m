Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3D190B283
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 16:41:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742386.1149190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDXg-0007JN-NO; Mon, 17 Jun 2024 14:41:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742386.1149190; Mon, 17 Jun 2024 14:41:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJDXg-0007Gh-Km; Mon, 17 Jun 2024 14:41:08 +0000
Received: by outflank-mailman (input) for mailman id 742386;
 Mon, 17 Jun 2024 14:41:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>) id 1sJDXf-0007Gb-K5
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 14:41:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sJDXf-0000Fc-1u; Mon, 17 Jun 2024 14:41:07 +0000
Received: from lfbn-gre-1-246-234.w90-112.abo.wanadoo.fr ([90.112.203.234]
 helo=l14.home) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <anthony@xenproject.org>)
 id 1sJDXe-0003hN-NF; Mon, 17 Jun 2024 14:41:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=PuC0rrmLqc+ryhwI3RIlUNKMT7nejiT7aD4KbDKVFzk=; b=HSfljoc5uhBLD9x1pLkduKHPQ+
	gEHWqCYCLOUcKDmamdaIAlAzkRdwGfBa8i7cfm58YwWilPOjNXZk8ZfPSbs7KeNhoEtCM4GJI6PXw
	uklLIQybxhZGn01WHmJ8+oALmUQZaPEmtdBbpBtU9mHnKcRukXk1Vc/O0dQkyiVMWePU=;
From: Anthony PERARD <anthony@xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Luca Fancellu <luca.fancellu@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [OSSTEST PATCH] preseed_base: Use "keep" NIC NamePolicy when "force-mac-address"
Date: Mon, 17 Jun 2024 16:40:51 +0200
Message-Id: <20240617144051.29547-1-anthony@xenproject.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Anthony PERARD <anthony.perard@vates.tech>

We have a few machine (arndale-*) that have a nic without mac address,
so the kernel assign a random one. For those there's a flags
"force-mac-address" which tells osstest to make it so that the machine
changes the mac address to a predefined one at boot. This normally
tells systemd rules to not use the mac address to rename the network
interface as it a temporary mac, but that doesn't always work.
(Machine installed by osstest should use the mac namepolicy otherwise,
since 367166c32329 ("preseed_base, ts-host-install: Change NIC
NamePolicy to "mac"")).

Often, on the branch "linux-linus", so with more recent version of
Linux, the network interface gets renamed sometime with the "mac"
namepolicy which break networking. These are the kernel messages when
the rename happen:

> usb 1-3.2.4: new high-speed USB device number 4 using exynos-ehci
> asix 1-3.2.4:1.0 (unnamed net_device) (uninitialized): invalid hw address, using random
> asix 1-3.2.4:1.0 (unnamed net_device) (uninitialized): PHY [usb-001:004:10] driver [Asix Electronics AX88772A] (irq=POLL)
> asix 1-3.2.4:1.0 eth0: register 'asix' at usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet, 06:85:e5:95:f0:7c
> usbcore: registered new device driver onboard-usb-dev
> usb 1-3.2.4: USB disconnect, device number 4
> asix 1-3.2.4:1.0 eth0: unregister 'asix' usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet
> hub 1-3.2:1.0: USB hub found
> hub 1-3.2:1.0: 4 ports detected
> hub 1-3.2:1.0: USB hub found
> hub 1-3.2:1.0: 4 ports detected
> usb 1-3.2.4: new high-speed USB device number 5 using exynos-ehci
> asix 1-3.2.4:1.0 (unnamed net_device) (uninitialized): PHY [usb-001:005:10] driver [Asix Electronics AX88772A] (irq=POLL)
> Asix Electronics AX88772A usb-001:005:10: attached PHY driver (mii_bus:phy_addr=usb-001:005:10, irq=POLL)
> asix 1-3.2.4:1.0 eth0: register 'asix' at usb-12110000.usb-3.2.4, ASIX AX88772 USB 2.0 Ethernet, 06:85:e5:95:f0:7c
> asix 1-3.2.4:1.0 enx0685e595f07c: renamed from eth0

The "xenbr0" bridge is setup to use "eth0", because that was the name
of the nic during setup, so with a new name for the main interface the
bridge doesn't work.

In order to avoid the issue, we will use the NamePolicy "keep" when
there is a flag "force-mac-address", which keep the original name of
the interface (eth0). That flags only works if there's a single
network interface, so we can expect "eth0" to always be the same
interface.

Even if the problem so far exhibit only at runtime after rebooting
under Xen (which is fixed by a change in preseed_base()), we will also
add the policy change to the installer (change in ts-host-install), to
be future proof.

(The filename of the policy is to have it apply before
"73-usb-net-by-mac.link" that is installed on the system.)

Signed-off-by: Anthony PERARD <anthony.perard@vates.tech>
---

Notes:
    CCing people mostly FYI rather than for review.
    
    I would wait until the release of Xen before pushing that as the issue
    doesn't prevent progress of the xen-unstable branch, it just slow down a
    bit linux-linus, with maybe unnecessary retry.
    
    I did run that, with config which hopefully replicates linux-linus
    branch and xen-unstable branch:
    
    linux-linus:
        http://logs.test-lab.xenproject.org/osstest/logs/186363/
        no regression
    
    xen-unstable:
        http://logs.test-lab.xenproject.org/osstest/logs/186366/
        Just one regression (test-amd64-amd64-qemuu-freebsd12-amd64) but
        isn't caused by the new patch.

 Osstest/Debian.pm | 14 +++++++++++++-
 ts-host-install   | 16 +++++++++++++++-
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/Osstest/Debian.pm b/Osstest/Debian.pm
index 3545f3fd..d974fea5 100644
--- a/Osstest/Debian.pm
+++ b/Osstest/Debian.pm
@@ -972,7 +972,19 @@ END
         # is going to be added to dom0's initrd, which is used by some guests
         # (created with ts-debian-install).
         preseed_hook_installscript($ho, $sfx,
-            '/usr/lib/base-installer.d/', '05ifnamepolicy', <<'END');
+            '/usr/lib/base-installer.d/', '05ifnamepolicy',
+            $ho->{Flags}{'force-mac-address'} ? <<'END' : <<'END');
+#!/bin/sh -e
+linkfile=/target/etc/systemd/network/70-eth-keep-policy.link
+mkdir -p `dirname $linkfile`
+cat > $linkfile <<EOF
+[Match]
+Type=ether
+Driver=!vif
+[Link]
+NamePolicy=keep
+EOF
+END
 #!/bin/sh -e
 linkfile=/target/etc/systemd/network/90-eth-mac-policy.link
 mkdir -p `dirname $linkfile`
diff --git a/ts-host-install b/ts-host-install
index 0b6aaeea..fbbfeecc 100755
--- a/ts-host-install
+++ b/ts-host-install
@@ -248,7 +248,21 @@ END
     print CANARY "\n# - canary - came via initramfs\n" or die $!;
     close CANARY or die $!;
 
-    if ($ho->{Suite} !~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
+    if ($ho->{Flags}{'force-mac-address'}) {
+        # When we have to set a MAC address, make sure that the interface keep
+        # the original name that the kernel give, "eth0". There should only be
+        # one interface in the ysstem in this case, so no risk of mixup.
+        system_checked(qw(mkdir -p --), "$initrd_overlay.d/lib/systemd/network");
+        file_simple_write_contents
+            ("$initrd_overlay.d/lib/systemd/network/70-eth-keep-policy.link",
+                <<END);
+[Match]
+Type=ether
+Driver=!vif
+[Link]
+NamePolicy=keep
+END
+    } elsif ($ho->{Suite} !~ m/lenny|squeeze|wheezy|jessie|stretch|buster/) {
         # Switch to more predictale nic name based on mac address, instead of the
         # policy "onboard" which can try to set the same name ("eno1") to two
         # differents nic, or "slot". New names are "enx$mac".
-- 
Anthony PERARD


