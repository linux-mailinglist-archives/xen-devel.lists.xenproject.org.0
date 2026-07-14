Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DIEPH0NZVmoc3wAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 17:44:03 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5197568D4
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2026 17:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yandex-team.ru header.s=default header.b=OD8W5Yad;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=yandex-team.ru
Received: from list by lists.xenproject.org with outflank-mailman.1362425.1614244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjfHe-0001Im-B6; Tue, 14 Jul 2026 15:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1362425.1614244; Tue, 14 Jul 2026 15:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wjfHe-0001GB-69; Tue, 14 Jul 2026 15:42:58 +0000
Received: by outflank-mailman (input) for mailman id 1362425;
 Tue, 14 Jul 2026 15:42:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <vsementsov@yandex-team.ru>) id 1wjfHc-0001G5-BR
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 15:42:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wjfHb-00Bzoz-3d
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2026 17:42:55 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a5658df-bab6-0a2a0a5309dd-0a2a4507c830-46
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 17:42:54 +0200
Received: from [178.154.239.136] (helo=forwardcorp1b.mail.yandex.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <vsementsov@yandex-team.ru>)
 id 6a5658fc-b4ea-0a2a45070019-b29aef8883a0-3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jul 2026 17:42:53 +0200
Received: from mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c1b:16:0:640:bc52:0])
 by forwardcorp1b.mail.yandex.net (postfix) with ESMTPS id 7553980B02;
 Tue, 14 Jul 2026 18:42:52 +0300 (MSK)
Received: from i115954770.yandex-team.ru (unknown [2a02:6bf:8080:c5a::1:8])
 by mail-nwsmtp-smtp-corp-canary-81.sas.yp-c.yandex.net (smtpcorp) with ESMTPSA
 id lgRdV71YDKo0-yjZTDoCd; Tue, 14 Jul 2026 18:42:51 +0300
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
	s=default; t=1784043771;
	bh=8IBno91zziUb/fdDS9K9Wa1s/YUk+db4puIIa61K9LM=;
	h=Cc:Message-ID:References:Date:In-Reply-To:Subject:To:From;
	b=OD8W5Yad/qB98ASEgLzXI4OGC/Ofal7KTdsGtoMKbIVzXm4YWRfpAp97Q8dm6ZYJU
	 I8B1yuvzZv6GdYn22Jd3+wzMdVJZwHJvaCXcyrWSkiAgutwIMuqjM9xkjpc9A0cnY8
	 fb+6SJ3Y9B6Ii0b0Uj6UNwM/nmci6FM5RSwtbTa0=
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
Subject: [PATCH v19 03/15] net/tap: deprecate "no" as special value for script/downscript
Date: Tue, 14 Jul 2026 18:42:31 +0300
Message-ID: <20260714154246.1242856-4-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714154246.1242856-1-vsementsov@yandex-team.ru>
References: <20260714154246.1242856-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1784043773-374D3AE4-C4AF2963/0/0
X-purgate-type: clean
X-purgate-size: 12601
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.69 / 15.00];
	WHITELIST_DMARC(-7.00)[yandex-team.ru:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[yandex-team.ru,none];
	R_DKIM_ALLOW(-0.20)[yandex-team.ru:s=default];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[redhat.com,suse.de,gmail.com,akamai.com,yandex-team.ru,nongnu.org,nutanix.com,oss.qualcomm.com,intel.com,kernel.org,xenproject.org,wdc.com,dabbelt.com,lists.libvirt.org,lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:jasowang@redhat.com,m:mst@redhat.com,m:armbru@redhat.com,m:peterx@redhat.com,m:farosas@suse.de,m:raphael.s.norwitz@gmail.com,m:bchaney@akamai.com,m:vsementsov@yandex-team.ru,m:qemu-devel@nongnu.org,m:berrange@redhat.com,m:pbonzini@redhat.com,m:yc-core@yandex-team.ru,m:mark.caveayland@nutanix.com,m:pierrick.bouvier@oss.qualcomm.com,m:slp@redhat.com,m:zhao1.liu@intel.com,m:sstabellini@kernel.org,m:anthony@xenproject.org,m:edgar.iglesias@gmail.com,m:shentey@gmail.com,m:Alistair.Francis@wdc.com,m:palmer@dabbelt.com,m:jasowangio@gmail.com,m:eblake@redhat.com,m:devel@lists.libvirt.org,m:xen-devel@lists.xenproject.org,m:qemu-ppc@nongnu.org,m:qemu-riscv@nongnu.org,m:raphaelsnorwitz@gmail.com,m:edgariglesias@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[yandex-team.ru:from_mime,yandex-team.ru:mid,yandex-team.ru:email,yandex-team.ru:dkim];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vsementsov@yandex-team.ru,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[yandex-team.ru:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF5197568D4

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
 docs/about/deprecated.rst                  | 18 ++++++++++++++
 docs/system/i386/microvm.rst               |  4 +--
 docs/system/i386/xenpvh.rst                |  2 +-
 docs/system/ppc/ppce500.rst                |  4 +--
 docs/system/riscv/microchip-icicle-kit.rst |  2 +-
 docs/system/riscv/sifive_u.rst             |  2 +-
 net/tap.c                                  | 29 ++++++++++++++--------
 qapi/net.json                              | 12 ++++++---
 qemu-options.hx                            |  7 ++++--
 9 files changed, 56 insertions(+), 24 deletions(-)

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
index fedd48c48d2..2e94b4015f6 100644
--- a/net/tap.c
+++ b/net/tap.c
@@ -92,34 +92,40 @@ static void launch_script(const char *setup_script, const char *ifname,
 static void tap_send(void *opaque);
 static void tap_writable(void *opaque);
 
-static bool tap_is_explicit_no_script(const char *script_arg)
+static bool tap_is_explicit_no_script(const char *script_arg_name,
+                                      const char *script_arg_value)
 {
-    if (!script_arg) {
+    if (!script_arg_value) {
         return false;
     }
 
-    if (script_arg[0] == '\0') {
+    if (script_arg_value[0] == '\0') {
         return true;
     }
 
-    if (strcmp(script_arg, "no") == 0) {
+    if (strcmp(script_arg_value, "no") == 0) {
+        warn_report("%s=no is deprecated; use %s= instead "
+                    "(empty string instead of 'no')",
+                    script_arg_name, script_arg_name);
         return true;
     }
 
     return false;
 }
 
-static char *tap_parse_script(const char *script_arg, const char *default_path)
+static char *tap_parse_script(const char *script_arg_name,
+                              const char *script_arg_value,
+                              const char *default_path)
 {
-    if (tap_is_explicit_no_script(script_arg)) {
+    if (tap_is_explicit_no_script(script_arg_name, script_arg_value)) {
         return NULL;
     }
 
-    if (!script_arg) {
+    if (!script_arg_value) {
         return get_relocated_path(default_path);
     }
 
-    return g_strdup(script_arg);
+    return g_strdup(script_arg_value);
 }
 
 static void tap_update_fd_handler(TAPState *s)
@@ -740,7 +746,7 @@ static bool net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
         qemu_set_info_str(&s->nc, "helper=%s", tap->helper);
     } else {
         qemu_set_info_str(&s->nc, "ifname=%s,script=%s,downscript=%s", ifname,
-                          script ?: "no", downscript ?: "no");
+                          script ?: "", downscript ?: "");
 
         if (downscript) {
             snprintf(s->down_script, sizeof(s->down_script), "%s", downscript);
@@ -946,9 +952,10 @@ int net_init_tap(const Netdev *netdev, const char *name,
         }
     } else {
         g_autofree char *script =
-            tap_parse_script(tap->script, DEFAULT_NETWORK_SCRIPT);
+            tap_parse_script("script", tap->script, DEFAULT_NETWORK_SCRIPT);
         g_autofree char *downscript =
-            tap_parse_script(tap->downscript, DEFAULT_NETWORK_DOWN_SCRIPT);
+            tap_parse_script("downscript", tap->downscript,
+                             DEFAULT_NETWORK_DOWN_SCRIPT);
 
         if (tap->ifname) {
             pstrcpy(ifname, sizeof ifname, tap->ifname);
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


