Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F611BB4E7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHUy-0000MP-EU; Tue, 28 Apr 2020 04:05:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHUx-0000MK-0Y
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:31 +0000
X-Inumbo-ID: 7f625486-8905-11ea-ae69-bc764e2007e4
Received: from mail-qk1-x741.google.com (unknown [2607:f8b0:4864:20::741])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f625486-8905-11ea-ae69-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:29 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id l78so20534399qke.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SSkRhzb3hdUii5pdYsRs72uZgeElz9D/Us23IyrCwco=;
 b=lyDTN0WquyldQiEzSG09jVte+I38DXlC/EnL+OdK9omxTuORBc/Hqxq/pN45kk5GAN
 ff/9+l+GyOze/OyT1f4wCNYdT9kHHJitgJ+hDUhMlBdrSWaujt6w+neRAZ4nxPfgWCxB
 fr+bh0EVwr6cNRy38e4YgxMR7JNtDpCbZRBKlT24/ZLtLJYTguL2xmaA4UD2BDl2vWj8
 MuVFDn+TJP67ed2DFHXs/dYnFdgjY8uqNKrz3pkscz19JQMZLZprmP2ae7CcI9CSxMaY
 xBtF+FA4p7FJ94Ktb8JqmR5wKFuWVbMFfYyb362UjIZkzuJVF3JkD9Tbd27HrLRSJ+6G
 aF7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SSkRhzb3hdUii5pdYsRs72uZgeElz9D/Us23IyrCwco=;
 b=E+f2c3fj3cCSvD4mmejR70F9OS8KftxTKbbbhnYuNthCNXJS5eQFknj+tNmyBe9dcj
 rOj0fWzgSNSKf+CohUK/2lsi6Q2pPvYDY73oMh1VJNBUTi3xipUgb7ZnTX7bIuGdNyxC
 ZE893S8tBtWKgQmSTj7KZLJQ92pXa5WTGQ7sjSCTlWNv+3oNVbL6F+CCKZPaCfvoPFDC
 jxZIN8DKcMXSoeTLSY7f3hCBs/BYxD+pzbXmHiPrfH97KZZDHajvTw3qNVQS7p2NEmpE
 j2riPvmrUJSE1I7Fu0JnCEMquJaPgJEwka/8nnyEP2DLKmq1sUY40Eb6bLKmRr9keP2g
 KURg==
X-Gm-Message-State: AGi0PubaUh58JmN1Tv92/O26s8Z4Fqa26i75fCTLg4DOTtA6liLlHVNz
 z8pvEkypKVIRuS2AbAc+g0H3TYUNZL8=
X-Google-Smtp-Source: APiQypJVEZhagpxazMsT4JZtYimyUeczpPaKVzJ3ppbhvW3zQ1eD9vYf5HId9dbCYWMnlgdu7Mzz0A==
X-Received: by 2002:a37:638d:: with SMTP id
 x135mr23666881qkb.366.1588046728656; 
 Mon, 27 Apr 2020 21:05:28 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:27 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 01/21] Document ioemu MiniOS stubdomain protocol
Date: Tue, 28 Apr 2020 00:04:13 -0400
Message-Id: <20200428040433.23504-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200428040433.23504-1-jandryuk@gmail.com>
References: <20200428040433.23504-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Add documentation based on reverse-engineered toolstack-ioemu stubdomain
protocol.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/misc/stubdom.txt | 53 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index 882a18cab4..64c77d9b64 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -23,6 +23,59 @@ and https://wiki.xen.org/wiki/Device_Model_Stub_Domains for more
 information on device model stub domains
 
 
+Toolstack to MiniOS ioemu stubdomain protocol
+---------------------------------------------
+
+This section describe communication protocol between toolstack and
+qemu-traditional running in MiniOS stubdomain. The protocol include
+expectations of both qemu and stubdomain itself.
+
+Setup (done by toolstack, expected by stubdomain):
+ - Block devices for target domain are connected as PV disks to stubdomain,
+   according to configuration order, starting with xvda
+ - Network devices for target domain are connected as PV nics to stubdomain,
+   according to configuration order, starting with 0
+ - if graphics output is expected, VFB and VKB devices are set for stubdomain
+   (its backend is responsible for exposing them using appropriate protocol
+   like VNC or Spice)
+ - other target domain's devices are not connected at this point to stubdomain
+   (may be hot-plugged later)
+ - QEMU command line (space separated arguments) is stored in
+   /vm/<target-uuid>/image/dmargs xenstore path
+ - target domain id is stored in /local/domain/<stubdom-id>/target xenstore path
+?? - bios type is stored in /local/domain/<target-id>/hvmloader/bios
+ - stubdomain's console 0 is connected to qemu log file
+ - stubdomain's console 1 is connected to qemu save file (for saving state)
+ - stubdomain's console 2 is connected to qemu save file (for restoring state)
+ - next consoles are connected according to target guest's serial console configuration
+
+Startup:
+1. PV stubdomain is started with ioemu-stubdom.gz kernel and no initrd
+2. stubdomain initialize relevant devices
+3. stubdomain signal readiness by writing "running" to /local/domain/<stubdom-id>/device-model/<target-id>/state xenstore path
+4. now stubdomain is considered running
+
+Runtime control (hotplug etc):
+Toolstack can issue command through xenstore. The sequence is (from toolstack POV):
+1. Write parameter to /local/domain/<stubdom-id>/device-model/<target-id>/parameter.
+2. Write command to /local/domain/<stubdom-id>/device-model/<target-id>/command.
+3. Wait for command result in /local/domain/<stubdom-id>/device-model/<target-id>/state (command specific value).
+4. Write "running" back to /local/domain/<stubdom-id>/device-model/<target-id>/state.
+
+Defined commands:
+ - "pci-ins" - PCI hot plug, results:
+   - "pci-inserted" - success
+   - "pci-insert-failed" - failure
+ - "pci-rem" - PCI hot remove, results:
+   - "pci-removed" - success
+   - ??
+ - "save" - save domain state to console 1, results:
+   - "paused" - success
+ - "continue" - resume domain execution, after loading state from console 2 (require -loadvm command argument), results:
+   - "running" - success
+
+
+
                                    PV-GRUB
                                    =======
 
-- 
2.20.1


