Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B74A1D6E73
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 03:15:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jaUMh-0008SL-Is; Mon, 18 May 2020 01:14:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLm=7A=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jaUMg-0008SG-QU
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 01:14:46 +0000
X-Inumbo-ID: f47536d6-98a4-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x842.google.com (unknown [2607:f8b0:4864:20::842])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f47536d6-98a4-11ea-b9cf-bc764e2007e4;
 Mon, 18 May 2020 01:14:43 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p12so6807444qtn.13
 for <xen-devel@lists.xenproject.org>; Sun, 17 May 2020 18:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y63NCLIHxjj8BP4Xs3EPNGxMJKsqwIK/ULA13gyh9ao=;
 b=eSkNWqdbswfyDAji7MFKscHPl69O8wGmYPQmhFSpff0pcoiWJUbVrg3VRBpFW2kfno
 8fZ3kAE2AWhyj5m0TZtbB0rKrLY1fgkIYUTdAhbYERSdsuuTYDCCdYNiUTl/F/2RlEL9
 nYyXOAgv3bXQRJPCfjLMejeteMUjOa8l/BDh5IT/16ory2Gw7B5Mhd6uyy9R0gSTqrC/
 ZZz6L8Honi6qGiqsvGJSLRLnT8ssqbBU853PdYXFMbTcEMQlZ4ED4Sh5QQI1NzCXRgQv
 PLH1mEAN5TSG6VAVZDHjJpaSZfu1WP7QMObtk3hEJXwV3dfQbjSfkBLuvQ6BFeEOT7i1
 N7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y63NCLIHxjj8BP4Xs3EPNGxMJKsqwIK/ULA13gyh9ao=;
 b=TFTKogHbyLbDdvhcTEpxTzGsSxeQMNd/X+oM9oYOPF+zSI6yHepB8AYE8rqEvz42J0
 2EDv1S1K4z4LxuQA4tewOYQIcMX1tBdYR8hep32a1IHDxzqS7usjNHyYNrQdubq7g49j
 0ms2k/Mqr4/7N0NTOwIaLkury+w1NnfMCAcS27AKfGXu38CnVLpYlPxaxhZAr6i3ZzOs
 1s2IxoJZmZ+MMUuLeEkMKpXcChC4qQv8yajDTDLrL34RoEVuUSxa8TUN3EY3PtW8kK46
 QTL1dnAPnEeGrDZjUajfWWvhaqj06PmPUSpjJkZxNGOLpKEqpTnyf+jTzJ3Xd8lbf7fu
 +xQw==
X-Gm-Message-State: AOAM530dPUCuT+rUPgA0icMg6+q4wEJ1UTXGBgG8w6XdOOn/KDe6wdjd
 s5ITgKxUJIMAcM3XRl7omLrAdsQu
X-Google-Smtp-Source: ABdhPJzgBKtNE4UuZ+JccVPVxVfMOGB9LaK0mJCPZqbJO7XGSDTxnkecYW5ina97e/LH7ZQzpeVZoQ==
X-Received: by 2002:ac8:4741:: with SMTP id k1mr14158535qtp.250.1589764482565; 
 Sun, 17 May 2020 18:14:42 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:ec68:c92e:af5a:2d3a])
 by smtp.gmail.com with ESMTPSA id l2sm7072864qkd.57.2020.05.17.18.14.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 18:14:41 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v6 01/18] Document ioemu MiniOS stubdomain protocol
Date: Sun, 17 May 2020 21:13:36 -0400
Message-Id: <20200518011353.326287-2-jandryuk@gmail.com>
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

Add documentation based on reverse-engineered toolstack-ioemu stubdomain
protocol.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>

---
Changes in v6:
 - Add Acked-by: Ian Jackson
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
2.25.1


