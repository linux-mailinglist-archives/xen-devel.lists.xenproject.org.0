Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AA454B03F
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jun 2022 14:16:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.348869.575118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15TA-0001YN-8y; Tue, 14 Jun 2022 12:16:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 348869.575118; Tue, 14 Jun 2022 12:16:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o15T9-0001Ru-U6; Tue, 14 Jun 2022 12:16:27 +0000
Received: by outflank-mailman (input) for mailman id 348869;
 Tue, 14 Jun 2022 12:16:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hf0K=WV=redhat.com=kraxel@srs-se1.protection.inumbo.net>)
 id 1o15T7-0008Ek-0Q
 for xen-devel@lists.xenproject.org; Tue, 14 Jun 2022 12:16:25 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cda789d3-ebdb-11ec-bd2c-47488cf2e6aa;
 Tue, 14 Jun 2022 14:16:23 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-uS3o44O8OS2SpFNP5fHGSA-1; Tue, 14 Jun 2022 08:16:18 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AE9C1C05149;
 Tue, 14 Jun 2022 12:16:18 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4E17416164;
 Tue, 14 Jun 2022 12:16:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5832B1800622; Tue, 14 Jun 2022 14:16:11 +0200 (CEST)
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
X-Inumbo-ID: cda789d3-ebdb-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655208981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iypp4lhP0vK8zaOIYv4YGS15C6hr5eRaL+NEXu7qlj4=;
	b=ByYhOQoGo5lpU9WjWTlMduyw18WYF4e8z/qeOlNrQSXqGj0pdYvao7zwETV0qNFZqJAapL
	El5go6ddDPML3GUGREhmEgSfjiTV6HNhmgh46JQoopiMjoGwIY1Pu8305Mtf1vZbF65r7j
	a2oqAjOjNSM9TP9uBU2aOYy4rIfggsQ=
X-MC-Unique: uS3o44O8OS2SpFNP5fHGSA-1
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"Hongren (Zenithal) Zheng" <i@zenithal.me>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"Canokeys.org" <contact@canokeys.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PULL 07/15] docs: Add CanoKey documentation
Date: Tue, 14 Jun 2022 14:16:02 +0200
Message-Id: <20220614121610.508356-8-kraxel@redhat.com>
In-Reply-To: <20220614121610.508356-1-kraxel@redhat.com>
References: <20220614121610.508356-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10

From: "Hongren (Zenithal) Zheng" <i@zenithal.me>

Signed-off-by: Hongren (Zenithal) Zheng <i@zenithal.me>
Message-Id: <YoY6ilQimrK+l5NN@Sun>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 docs/system/device-emulation.rst |   1 +
 docs/system/devices/canokey.rst  | 168 +++++++++++++++++++++++++++++++
 2 files changed, 169 insertions(+)
 create mode 100644 docs/system/devices/canokey.rst

diff --git a/docs/system/device-emulation.rst b/docs/system/device-emulation.rst
index 3b729b920d7c..05060060563f 100644
--- a/docs/system/device-emulation.rst
+++ b/docs/system/device-emulation.rst
@@ -92,3 +92,4 @@ Emulated Devices
    devices/vhost-user.rst
    devices/virtio-pmem.rst
    devices/vhost-user-rng.rst
+   devices/canokey.rst
diff --git a/docs/system/devices/canokey.rst b/docs/system/devices/canokey.rst
new file mode 100644
index 000000000000..169f99b8eb82
--- /dev/null
+++ b/docs/system/devices/canokey.rst
@@ -0,0 +1,168 @@
+.. _canokey:
+
+CanoKey QEMU
+------------
+
+CanoKey [1]_ is an open-source secure key with supports of
+
+* U2F / FIDO2 with Ed25519 and HMAC-secret
+* OpenPGP Card V3.4 with RSA4096, Ed25519 and more [2]_
+* PIV (NIST SP 800-73-4)
+* HOTP / TOTP
+* NDEF
+
+All these platform-independent features are in canokey-core [3]_.
+
+For different platforms, CanoKey has different implementations,
+including both hardware implementions and virtual cards:
+
+* CanoKey STM32 [4]_
+* CanoKey Pigeon [5]_
+* (virt-card) CanoKey USB/IP
+* (virt-card) CanoKey FunctionFS
+
+In QEMU, yet another CanoKey virt-card is implemented.
+CanoKey QEMU exposes itself as a USB device to the guest OS.
+
+With the same software configuration as a hardware key,
+the guest OS can use all the functionalities of a secure key as if
+there was actually an hardware key plugged in.
+
+CanoKey QEMU provides much convenience for debuging:
+
+* libcanokey-qemu supports debuging output thus developers can
+  inspect what happens inside a secure key
+* CanoKey QEMU supports trace event thus event
+* QEMU USB stack supports pcap thus USB packet between the guest
+  and key can be captured and analysed
+
+Then for developers:
+
+* For developers on software with secure key support (e.g. FIDO2, OpenPGP),
+  they can see what happens inside the secure key
+* For secure key developers, USB packets between guest OS and CanoKey
+  can be easily captured and analysed
+
+Also since this is a virtual card, it can be easily used in CI for testing
+on code coping with secure key.
+
+Building
+========
+
+libcanokey-qemu is required to use CanoKey QEMU.
+
+.. code-block:: shell
+
+    git clone https://github.com/canokeys/canokey-qemu
+    mkdir canokey-qemu/build
+    pushd canokey-qemu/build
+
+If you want to install libcanokey-qemu in a different place,
+add ``-DCMAKE_INSTALL_PREFIX=/path/to/your/place`` to cmake below.
+
+.. code-block:: shell
+
+    cmake ..
+    make
+    make install # may need sudo
+    popd
+
+Then configuring and building:
+
+.. code-block:: shell
+
+    # depending on your env, lib/pkgconfig can be lib64/pkgconfig
+    export PKG_CONFIG_PATH=/path/to/your/place/lib/pkgconfig:$PKG_CONFIG_PATH
+    ./configure --enable-canokey && make
+
+Using CanoKey QEMU
+==================
+
+CanoKey QEMU stores all its data on a file of the host specified by the argument
+when invoking qemu.
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file
+
+Note: you should keep this file carefully as it may contain your private key!
+
+The first time when the file is used, it is created and initialized by CanoKey,
+afterwards CanoKey QEMU would just read this file.
+
+After the guest OS boots, you can check that there is a USB device.
+
+For example, If the guest OS is an Linux machine. You may invoke lsusb
+and find CanoKey QEMU there:
+
+.. code-block:: shell
+
+    $ lsusb
+    Bus 001 Device 002: ID 20a0:42d4 Clay Logic CanoKey QEMU
+
+You may setup the key as guided in [6]_. The console for the key is at [7]_.
+
+Debuging
+========
+
+CanoKey QEMU consists of two parts, ``libcanokey-qemu.so`` and ``canokey.c``,
+the latter of which resides in QEMU. The former provides core functionality
+of a secure key while the latter provides platform-dependent functions:
+USB packet handling.
+
+If you want to trace what happens inside the secure key, when compiling
+libcanokey-qemu, you should add ``-DQEMU_DEBUG_OUTPUT=ON`` in cmake command
+line:
+
+.. code-block:: shell
+
+    cmake .. -DQEMU_DEBUG_OUTPUT=ON
+
+If you want to trace events happened in canokey.c, use
+
+.. parsed-literal::
+
+    |qemu_system| --trace "canokey_*" \\
+        -usb -device canokey,file=$HOME/.canokey-file
+
+If you want to capture USB packets between the guest and the host, you can:
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file,pcap=key.pcap
+
+Limitations
+===========
+
+Currently libcanokey-qemu.so has dozens of global variables as it was originally
+designed for embedded systems. Thus one qemu instance can not have
+multiple CanoKey QEMU running, namely you can not
+
+.. parsed-literal::
+
+    |qemu_system| -usb -device canokey,file=$HOME/.canokey-file \\
+         -device canokey,file=$HOME/.canokey-file2
+
+Also, there is no lock on canokey-file, thus two CanoKey QEMU instance
+can not read one canokey-file at the same time.
+
+Another limitation is that this device is not compatible with ``qemu-xhci``,
+in that this device would hang when there are FIDO2 packets (traffic on
+interrupt endpoints). If you do not use FIDO2 then it works as intended,
+but for full functionality you should use old uhci/ehci bus and attach canokey
+to it, for example
+
+.. parsed-literal::
+
+   |qemu_system| -device piix3-usb-uhci,id=uhci -device canokey,bus=uhci.0
+
+References
+==========
+
+.. [1] `<https://canokeys.org>`_
+.. [2] `<https://docs.canokeys.org/userguide/openpgp/#supported-algorithm>`_
+.. [3] `<https://github.com/canokeys/canokey-core>`_
+.. [4] `<https://github.com/canokeys/canokey-stm32>`_
+.. [5] `<https://github.com/canokeys/canokey-pigeon>`_
+.. [6] `<https://docs.canokeys.org/>`_
+.. [7] `<https://console.canokeys.org/>`_
-- 
2.36.1


