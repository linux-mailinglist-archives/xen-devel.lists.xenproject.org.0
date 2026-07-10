Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GMmANZtFUWqaBgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 21:18:51 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C11A73DA85
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 21:18:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex-team.ru header.s=default header.b=Huru2vOh;
	dmarc=pass (policy=none) header.from=yandex-team.ru;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1359816.1613198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGk2-0004WX-0e; Fri, 10 Jul 2026 19:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359816.1613198; Fri, 10 Jul 2026 19:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiGk1-0004U3-Tg; Fri, 10 Jul 2026 19:18:29 +0000
Received: by outflank-mailman (input) for mailman id 1359816;
 Fri, 10 Jul 2026 19:18:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vsementsov@yandex-team.ru>) id 1wiGk0-0004Tw-61
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 19:18:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiGjy-007y69-CJ
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 21:18:26 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a514579-e002-0a2a0a5209dd-0a2a450be1b2-6
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 21:18:25 +0200
Received: from [178.154.239.200] (helo=forwardcorp1d.mail.yandex.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a514580-b7da-0a2a450b0019-b29aefc8cd14-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 21:18:25 +0200
Received: from mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:94a9:0:640:a3fa:0])
 by forwardcorp1d.mail.yandex.net (postfix) with ESMTPS id 84770808B9;
 Fri, 10 Jul 2026 22:18:24 +0300 (MSK)
Received: from i115954770.yandex-team.ru (unknown [2a02:6bf:8080:c7d::1:20])
 by mail-nwsmtp-smtp-corp-main-68.klg.yp-c.yandex.net (smtpcorp) with ESMTPSA
 id AIRXsO0a8eA0-gmOl9KC0; Fri, 10 Jul 2026 22:18:23 +0300
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; t=1783711103;
	bh=XU6rFdMa6qjuR/yF7DSa18zwJcjKZIiGNqq4ynL/1x8=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=Huru2vOhEY5FtAh3de7SS4ROuzpqxri8ELZL2ZgVKslOnDU0DfKT5P+IwqV4USFGL
	 CvZLpUZro8P/Zgi3ps9C+mqz0Pc30RJOFPDxFJt15QMj4aX1tSTvuE4ybn2GgV/p6X
	 SisTpLxIrfspR/+wKaBJUCssDt0CSapYm9zxq/u4=
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: jasowang@redhat.com,
	mst@redhat.com
Cc: armbru@redhat.com,
	peterx@redhat.com,
	farosas@suse.de,
	raphael.s.norwitz@gmail.com,
	bchaney@akamai.com,
	vsementsov@yandex-team.ru,
	qemu-devel@nongnu.org,
	berrange@redhat.com,
	pbonzini@redhat.com,
	yc-core@yandex-team.ru,
	mark.caveayland@nutanix.com,
	Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
	Sergio Lopez <slp@redhat.com>,
	Zhao Liu <zhao1.liu@intel.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Bernhard Beschow <shentey@gmail.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eric Blake <eblake@redhat.com>,
	devel@lists.libvirt.org (open list:Incompatible changes),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs),
	qemu-ppc@nongnu.org (open list:e500),
	qemu-riscv@nongnu.org (open list:Microchip PolarFi...)
Subject: [PATCH v18 03/14] net/tap: deprecate "no" as special value for script/downscript
Date: Fri, 10 Jul 2026 22:17:52 +0300
Message-ID: <20260710191809.721154-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710191809.721154-1-vsementsov@yandex-team.ru>
References: <20260710191809.721154-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1783711105-4857B9ED-10B65025/0/0
X-purgate-type: clean
X-purgate-size: 10175
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.69 / 15.00];
	WHITELIST_DMARC(-7.00)[yandex-team.ru:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex-team.ru,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[yandex-team.ru:s=default];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FREEMAIL_CC(0.00)[redhat.com,suse.de,gmail.com,akamai.com,yandex-team.ru,nongnu.org,nutanix.com,oss.qualcomm.com,intel.com,kernel.org,xenproject.org,wdc.com,dabbelt.com,lists.libvirt.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jasowang@redhat.com,m:mst@redhat.com,m:armbru@redhat.com,m:peterx@redhat.com,m:farosas@suse.de,m:raphael.s.norwitz@gmail.com,m:bchaney@akamai.com,m:vsementsov@yandex-team.ru,m:qemu-devel@nongnu.org,m:berrange@redhat.com,m:pbonzini@redhat.com,m:yc-core@yandex-team.ru,m:mark.caveayland@nutanix.com,m:pierrick.bouvier@oss.qualcomm.com,m:slp@redhat.com,m:zhao1.liu@intel.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:shentey@gmail.com,m:Alistair.Francis@wdc.com,m:palmer@dabbelt.com,m:jasowangio@gmail.com,m:eblake@redhat.com,m:devel@lists.libvirt.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:qemu-riscv@nongnu.org,m:raphaelsnorwitz@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[yandex-team.ru:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1C11A73DA85

The interface is ambiguous, as "no" is valid file name. So,
using "no" as a special value to disable script is deprecated.
Use an empty string ("script=" / "downscript=") instead.

In a future version, "no" will be treated as a plain file name, just
like any other non-empty value.

Document the deprecation in docs/about/deprecated.rst, qapi/net.json,
and qemu-options.hx. Update other docs to use empty string instead of
"no". Add a warning.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 docs/about/deprecated.rst                  | 18 ++++++++++++++++++
 docs/system/i386/microvm.rst               |  4 ++--
 docs/system/i386/xenpvh.rst                |  2 +-
 docs/system/ppc/ppce500.rst                |  4 ++--
 docs/system/riscv/microchip-icicle-kit.rst |  2 +-
 docs/system/riscv/sifive_u.rst             |  2 +-
 net/tap.c                                  |  2 ++
 qapi/net.json                              | 12 ++++++++----
 qemu-options.hx                            |  7 +++++--
 9 files changed, 40 insertions(+), 13 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 0c656a968fc..c4929317e3a 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -71,6 +71,15 @@ flexible enough. The monitor objects have been converted to QOM, so
 ``-mon mode=control`` is replaced by ``-object monitor-qmp``. The
 short convenience options are not deprecated, only ``-mon``.
 
+``script=no`` and ``downscript=no`` for ``-netdev tap`` (since 11.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The special value ``"no"`` for the ``script`` and ``downscript``
+parameters of ``-netdev tap`` disables script execution.  This special
+treatment of ``"no"`` is deprecated.  Use an empty string (``script=``
+or ``downscript=``) to disable script execution instead.  In a future
+version, ``"no"`` will be treated as a plain file name.
+
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
 
@@ -164,6 +173,15 @@ Use ``job-finalize`` instead.
 
 Use ``query-accelerators`` instead.
 
+``"no"`` as value of ``script``/``downscript`` for tap in ``netdev_add`` (since 11.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The special value ``"no"`` for the ``script`` and ``downscript``
+parameters of ``netdev_add`` with ``type=tap`` disables script
+execution.  This special treatment of ``"no"`` is deprecated.  Use an
+empty string instead.  In a future version, ``"no"`` will be treated as
+a plain file name.
+
 Human Machine Protocol (HMP) commands
 -------------------------------------
 
diff --git a/docs/system/i386/microvm.rst b/docs/system/i386/microvm.rst
index 1675e37d3e7..077ea15751e 100644
--- a/docs/system/i386/microvm.rst
+++ b/docs/system/i386/microvm.rst
@@ -79,7 +79,7 @@ legacy ``ISA serial`` device as console::
      -serial stdio \
      -drive id=test,file=test.img,format=raw,if=none \
      -device virtio-blk-device,drive=test \
-     -netdev tap,id=tap0,script=no,downscript=no \
+     -netdev tap,id=tap0,script=,downscript= \
      -device virtio-net-device,netdev=tap0
 
 While the example above works, you might be interested in reducing the
@@ -103,7 +103,7 @@ disabled::
      -device virtconsole,chardev=virtiocon0 \
      -drive id=test,file=test.img,format=raw,if=none \
      -device virtio-blk-device,drive=test \
-     -netdev tap,id=tap0,script=no,downscript=no \
+     -netdev tap,id=tap0,script=,downscript= \
      -device virtio-net-device,netdev=tap0
 
 
diff --git a/docs/system/i386/xenpvh.rst b/docs/system/i386/xenpvh.rst
index 904778e3f5c..862f38830b1 100644
--- a/docs/system/i386/xenpvh.rst
+++ b/docs/system/i386/xenpvh.rst
@@ -42,7 +42,7 @@ case you need to construct one manually:
       -vnc none                                       \
       -display none                                   \
       -device virtio-net-pci,id=nic0,netdev=net0,mac=00:16:3e:5c:81:78 \
-      -netdev type=tap,id=net0,ifname=vif3.0-emu,br=xenbr0,script=no,downscript=no \
+      -netdev type=tap,id=net0,ifname=vif3.0-emu,br=xenbr0,script=,downscript= \
       -smp 4,maxcpus=4                                \
       -nographic                                      \
       -machine xenpvh,ram-low-base=0,ram-low-size=2147483648,ram-high-base=4294967296,ram-high-size=2147483648,pci-ecam-base=824633720832,pci-ecam-size=268435456,pci-mmio-base=4026531840,pci-mmio-size=33554432,pci-mmio-high-base=824902156288,pci-mmio-high-size=68719476736 \
diff --git a/docs/system/ppc/ppce500.rst b/docs/system/ppc/ppce500.rst
index c9fe0915dc5..ec5aaf14fd9 100644
--- a/docs/system/ppc/ppce500.rst
+++ b/docs/system/ppc/ppce500.rst
@@ -158,14 +158,14 @@ interface at PCI address 0.1.0, but we can switch that to an e1000 NIC by:
   $ qemu-system-ppc64 -M ppce500 -smp 4 -m 2G \
                       -display none -serial stdio \
                       -bios u-boot \
-                      -nic tap,ifname=tap0,script=no,downscript=no,model=e1000
+                      -nic tap,ifname=tap0,script=,downscript=,model=e1000
 
 The QEMU ``ppce500`` machine can also dynamically instantiate an eTSEC device
 if “-device eTSEC” is given to QEMU:
 
 .. code-block:: bash
 
-  -netdev tap,ifname=tap0,script=no,downscript=no,id=net0 -device eTSEC,netdev=net0
+  -netdev tap,ifname=tap0,script=,downscript=,id=net0 -device eTSEC,netdev=net0
 
 Root file system on flash drive
 -------------------------------
diff --git a/docs/system/riscv/microchip-icicle-kit.rst b/docs/system/riscv/microchip-icicle-kit.rst
index 9809e94b84b..7fdb96601ad 100644
--- a/docs/system/riscv/microchip-icicle-kit.rst
+++ b/docs/system/riscv/microchip-icicle-kit.rst
@@ -84,7 +84,7 @@ Then we can boot the machine by:
   $ qemu-system-riscv64 -M microchip-icicle-kit -smp 5 -m 2G \
       -sd path/to/sdcard.img \
       -nic user,model=cadence_gem \
-      -nic tap,ifname=tap,model=cadence_gem,script=no \
+      -nic tap,ifname=tap,model=cadence_gem,script= \
       -display none -serial stdio \
       -kernel path/to/u-boot/build/dir/u-boot.bin \
       -dtb path/to/u-boot/build/dir/u-boot.dtb
diff --git a/docs/system/riscv/sifive_u.rst b/docs/system/riscv/sifive_u.rst
index 8f55ae8e313..0e4dcf3e70c 100644
--- a/docs/system/riscv/sifive_u.rst
+++ b/docs/system/riscv/sifive_u.rst
@@ -199,7 +199,7 @@ To boot the VxWorks kernel in QEMU with the ``sifive_u`` machine, use:
 
   $ qemu-system-riscv64 -M sifive_u -smp 5 -m 2G \
       -display none -serial stdio \
-      -nic tap,ifname=tap0,script=no,downscript=no \
+      -nic tap,ifname=tap0,script=,downscript= \
       -kernel /path/to/vxWorks \
       -append "gem(0,0)host:vxWorks h=192.168.200.1 e=192.168.200.2:ffffff00 u=target pw=vxTarget f=0x01"
 
diff --git a/net/tap.c b/net/tap.c
index fedd48c48d2..1ec9e5ebe6f 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -103,6 +103,8 @@ static bool tap_is_explicit_no_script(const char *script_arg)
     }
 
     if (strcmp(script_arg, "no") == 0) {
+        warn_report("script=no/downscript=no is deprecated; "
+                    "use script=/downscript= instead");
         return true;
     }
 
diff --git a/qapi/net.json b/qapi/net.json
index 8f0915c4d86..ada0329ef9d 100644
--- a/qapi/net.json
+++ b/qapi/net.json
@@ -399,15 +399,19 @@
 # @fds: multiple file descriptors of already opened multiqueue capable
 #     tap
 #
-# @script: script to initialize the interface.  An empty string or
-#     "no" disables script execution.  Defaults to
+# @script: script to initialize the interface.  An empty string
+#     disables script execution.  Defaults to
 #     ``<sysconfdir>/qemu-ifup``, where ``<sysconfdir>`` is the
 #     system configuration directory at build time (typically /etc).
+#     Using "no" to disable script execution is deprecated (since
+#     11.2); use an empty string instead.
 #
-# @downscript: script to shut down the interface.  An empty string or
-#     "no" disables script execution.  Defaults to
+# @downscript: script to shut down the interface.  An empty string
+#     disables script execution.  Defaults to
 #     ``<sysconfdir>/qemu-ifdown``, where ``<sysconfdir>`` is the
 #     system configuration directory at build time (typically /etc).
+#     Using "no" to disable script execution is deprecated (since
+#     11.2); use an empty string instead.
 #
 # @br: bridge name (since 2.8)
 #
diff --git a/qemu-options.hx b/qemu-options.hx
index 200949655ea..7b9a14f5b38 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3014,7 +3014,8 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
     "                use network scripts 'file' (default=" DEFAULT_NETWORK_SCRIPT ")\n"
     "                to configure it and 'dfile' (default=" DEFAULT_NETWORK_DOWN_SCRIPT ")\n"
     "                to deconfigure it\n"
-    "                use '[down]script=no' or '[down]script=' to disable script execution\n"
+    "                use '[down]script=' to disable script execution\n"
+    "                ('[down]script=no' is deprecated and will be treated as a file name in future)\n"
     "                use network helper 'helper' (default=" DEFAULT_BRIDGE_HELPER ") to\n"
     "                configure it\n"
     "                use 'fd=h' to connect to an already opened TAP interface\n"
@@ -3553,7 +3554,9 @@ SRST
     ``<sysconfdir>/qemu-ifup`` and the default network deconfigure script is
     ``<sysconfdir>/qemu-ifdown``, where ``<sysconfdir>`` is the system
     configuration directory at build time (typically ``/etc``).
-    Use ``[down]script=no`` or ``[down]script=`` to disable script execution.
+    Use ``[down]script=`` to disable script execution.
+    Using ``[down]script=no`` is deprecated; in a future version it will
+    be treated as a plain file name.
 
     If running QEMU as an unprivileged user, use the network helper
     to configure the TAP interface and attach it to the bridge.
-- 
2.43.0


