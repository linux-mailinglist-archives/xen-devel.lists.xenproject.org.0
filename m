Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6151BB4EA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 06:06:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTHV2-0000Mm-NR; Tue, 28 Apr 2020 04:05:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vxmr=6M=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jTHV2-0000Mg-0q
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 04:05:36 +0000
X-Inumbo-ID: 819d7a8c-8905-11ea-b07b-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 819d7a8c-8905-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 04:05:33 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id e17so12874799qtp.7
 for <xen-devel@lists.xenproject.org>; Mon, 27 Apr 2020 21:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ft2YmkVf5v7GMI2mzGT4dRGSFWsB0nPaCI36YbESKr8=;
 b=sVEVcVYnKPJjrq4/ke5l41TPF1bRBUxnpkdzKAAetypbH0YtLcJQfHzW4NDxQAlx8h
 g9t6gKVPkzCGtikIs9K85o/VTn+0tHtOIL/Scau0Zo8w2c69prN9PuxxVPC29KIwEEBm
 TaQYvFGz1Q1o4hUuo+xgJOj8bGzEguc27tsBfGSGsq6NuRMhJa7rV3uB3UQbGdOI5RCz
 4OXA25r3L2vAh2jTju3c2wkRc8tK3JcLSA3ffp2PGO/tglR8yStVqVXB/ZVSvRHFMWBc
 Oh1qCTOATZCBSDG3qWpaguqb7Pr36twkJwsWMThmVOKtBzHUnOMCH3DDNrORrh2DEIhb
 rO/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ft2YmkVf5v7GMI2mzGT4dRGSFWsB0nPaCI36YbESKr8=;
 b=DhsrpUoKiNHTthpiy8lucpuD3NoupMI7ObKqaQ+JB2MOuOyXRwqPxBh+VH7NTv7VW1
 gIraHEg9ZHGCDwLx2PLJAVhPwU4buOO0z4jvcIFX8FNEVmznBde56F9TwLrE+YmNym2H
 jM++ReA8gkik06i/CfNYdqyme9nu+U5xgaibSjlMZqacIIA5r9s+L77poPLLNvFhdbJz
 KpPDt87qyblipgtZd0gDlJ77tbBUZz9Sc60fAZpqnc7SN3kznOmGqqtR2BC6XkhDD+Kf
 NF8Nn9I3CproDr5+nyXKbydso5QwTbT683rKHwxyQQARud6sz4EzXl8GG88YxTxz4ikI
 y48g==
X-Gm-Message-State: AGi0Pub961nj07KQU4R56aTsfsiBwIgQoVZl7gS8J0f4IUsKYprz36k3
 avgauVeoWomRT0DS7N9LVf5hc+vOVno=
X-Google-Smtp-Source: APiQypIc5wyrWf8cCdgYHLVkj8RK8dV3U2UUDijNgtYbDYWMSmDJzl1Q9Dxovh2ORFbNzTqUnBk3rA==
X-Received: by 2002:ac8:4818:: with SMTP id g24mr15395296qtq.377.1588046732407; 
 Mon, 27 Apr 2020 21:05:32 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:f1d1:23b9:fc94:a1a9])
 by smtp.gmail.com with ESMTPSA id v2sm13445480qth.66.2020.04.27.21.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 21:05:31 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v5 02/21] Document ioemu Linux stubdomain protocol
Date: Tue, 28 Apr 2020 00:04:14 -0400
Message-Id: <20200428040433.23504-3-jandryuk@gmail.com>
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

Add documentation for upcoming Linux stubdomain for qemu-upstream.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
 docs/misc/stubdom.txt | 50 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/docs/misc/stubdom.txt b/docs/misc/stubdom.txt
index 64c77d9b64..bb5e87dfb9 100644
--- a/docs/misc/stubdom.txt
+++ b/docs/misc/stubdom.txt
@@ -75,6 +75,56 @@ Defined commands:
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
+   /vm/<target-uuid>/image/dmargs xenstore dir, each argument as separate key
+   in form /vm/<target-uuid>/image/dmargs/NNN, where NNN is 0-padded argument
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
+ - console 2 (incoming domain state) is connected with FD 3
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
2.20.1


