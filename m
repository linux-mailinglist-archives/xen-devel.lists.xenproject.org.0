Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D431D6E78
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUMm-0008Sk-RK; Mon, 18 May 2020 01:14:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUMl-0008Se-RE
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:14:51 +0000
X-Inumbo-ID: f5e58d7c-98a4-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x841.google.com (unknown [2607:f8b0:4864:20::841])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5e58d7c-98a4-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 01:14:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id c24so6841869qtw.7
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RY6wcLegoM0K/cf+d7rR6BE972Bl6q9Nr9kajAEhtQU=;
 b=Y02XyqZCQf5DLoJ5ElPAZ2MbegdUvKWWpK9lCJ29Jt4Dla/rcJbRwaS9Gh84iCq2dA
 HvpkN8a/fYMOj/GGBEqWI9VUXBur/WfE7ErzGalgmEx3wIP3Fm4s9mZrBNGXm/QtBoFl
 89JudLtlhhnFHAV3VGRPcUSeX0OPMwCRQwX/6hhELdrfoDfHfUlEJIEky3SPHrkSJIkE
 fcFbrd+A2rnQwQl0W8c1A/E+YhSuRZztA/+A2/1GeNtaPs4BqEKmPgOFFxdb2wkHHPoa
 tTbF4+S4zq+k751AE6Zh8f8GAKTRxUbVEzb5oH3OR8Zjy25T7GqdXomwQuSxEJJ3/GnP
 2nyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RY6wcLegoM0K/cf+d7rR6BE972Bl6q9Nr9kajAEhtQU=;
 b=lwpX/qaiod5D2b/cBFKSOZl36sVooKYBPs2nM2VH7LnTOUwEZeyJAFpYqFNDlh7MnX
 ccpekIbMi04IAft6pNOI/ycYntTmIY/qrtvrlPnpvPoIzumJJL95Hz041jEkDsr5F+Z8
 lATEJwbd/L7bEi9kyyMiVE3Zm5y13GebZ9kQT3VjeIg3IA16EMoFHFFZbMzx9d7/7BX3
 ZOu34AwPivFZpVTPBWpvmjCu3ooqIvqLgt7KxR0YCPfM1A89ItQuWUf9m+70vro2ki0/
 rU9awtVVKd5f4eha27GImSaV+0+SPZ7yxKCmxhiOmdauoQVnFpmOpJYcsC1W6f4svFrd
 GMgg==
X-Gm-Message-State: AOAM531w3J3FkdpS+o0D0KYkotz97Ig7rUCDYx0NSgZf/ajuTV7zxMCy
 LU7EbdyNpbduAZtnV7dk2nmNw2IZ
X-Google-Smtp-Source: ABdhPJw1F6kcO9qa+k5fZ7Ybw7yoA8SWCDZD/hUIbl2y1ONpTodcDDReNplNurbDBVW7EbBXUW6a7w==
X-Received: by 2002:ac8:4f4e:: with SMTP id i14mr14313161qtw.167.1589764484950; 
 Sun, 17 May 2020 18:14:44 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:44 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 02/18] Document ioemu Linux stubdomain protocol
Date: Sun, 17 May 2020 21:13:37 -0400
Message-Id: <20200518011353.326287-3-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200518011353.326287-1-jandryuk@gmail.com>
References: <20200518011353.326287-1-jandryuk@gmail.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Add documentation for upcoming Linux stubdomain for qemu-upstream.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
 - Replace dmargs with dm-argv for xenstore directory
 - Explain $STUBDOM_RESTORE_INCOMING_ARG for -incoming restore argument
---
 docs/misc/stubdom.txt | 52 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index 64c77d9b64..c717a95d17 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -75,6 +75,58 @@ Defined commands:
    - "running" - success
 
 
+Toolstack to Linux ioemu stubdomain protocol
+--------------------------------------------
+
+This section describe communication protocol between toolstack and
+qemu-upstream running in Linux stubdomain. The protocol include
+expectations of both stubdomain, and qemu.
+
+Setup (done by toolstack, expected by stubdomain):
+ - Block devices for target domain are connected as PV disks to stubdomain,
+   according to configuration order, starting with xvda
+ - Network devices for target domain are connected as PV nics to stubdomain,
+   according to configuration order, starting with 0
+ - [not implemented] if graphics output is expected, VFB and VKB devices are set for stubdomain
+   (its backend is responsible for exposing them using appropriate protocol
+   like VNC or Spice)
+ - other target domain's devices are not connected at this point to stubdomain
+   (may be hot-plugged later)
+ - QEMU command line is stored in
+   /vm/<target-uuid>/image/dm-argv xenstore dir, each argument as separate key
+   in form /vm/<target-uuid>/image/dm-argv/NNN, where NNN is 0-padded argument
+   number
+ - target domain id is stored in /local/domain/<stubdom-id>/target xenstore path
+?? - bios type is stored in /local/domain/<target-id>/hvmloader/bios
+ - stubdomain's console 0 is connected to qemu log file
+ - stubdomain's console 1 is connected to qemu save file (for saving state)
+ - stubdomain's console 2 is connected to qemu save file (for restoring state)
+ - next consoles are connected according to target guest's serial console configuration
+
+Environment exposed by stubdomain to qemu (needed to construct appropriate qemu command line and later interact with qmp):
+ - target domain's disks are available as /dev/xvd[a-z]
+ - console 2 (incoming domain state) must be connected to an FD and the command
+   line argument $STUBDOM_RESTORE_INCOMING_ARG must be replaced with fd:$FD to
+   form "-incoming fd:$FD"
+ - console 1 (saving domain state) is added over QMP to qemu as "fdset-id 1" (done by stubdomain, toolstack doesn't need to care about it)
+ - nics are connected to relevant stubdomain PV vifs when available (qemu -netdev should specify ifname= explicitly)
+
+Startup:
+1. toolstack starts PV stubdomain with stubdom-linux-kernel kernel and stubdom-linux-initrd initrd
+2. stubdomain initialize relevant devices
+3. stubdomain starts qemu with requested command line, plus few stubdomain specific ones - including local qmp access options
+4. stubdomain starts vchan server on /local/domain/<stubdom-id>/device-model/<target-id>/qmp-vchan, exposing qmp socket to the toolstack
+5. qemu signal readiness by writing "running" to /local/domain/<stubdom-id>/device-model/<target-id>/state xenstore path
+6. now device model is considered running
+
+QEMU can be controlled using QMP over vchan at /local/domain/<stubdom-id>/device-model/<target-id>/qmp-vchan. Only one simultaneous connection is supported and toolstack needs to ensure that.
+
+Limitations:
+ - PCI passthrough require permissive mode
+ - only one nic is supported
+ - at most 26 emulated disks are supported (more are still available as PV disks)
+ - graphics output (VNC/SDL/Spice) not supported
+
 
                                    PV-GRUB
                                    =======
-- 
2.25.1


