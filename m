Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016971D8D5A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 03:56:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jarU2-00008q-75; Tue, 19 May 2020 01:55:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jarU0-00008l-Kv
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 01:55:52 +0000
X-Inumbo-ID: dd8b8de2-9973-11ea-b9cf-bc764e2007e4
Received: from mail-qt1-x843.google.com (unknown [2607:f8b0:4864:20::843])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd8b8de2-9973-11ea-b9cf-bc764e2007e4;
 Tue, 19 May 2020 01:55:50 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id z18so9945223qto.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 May 2020 18:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y63NCLIHxjj8BP4Xs3EPNGxMJKsqwIK/ULA13gyh9ao=;
 b=qhM4TcnwPR1z6ZqEH726/8IqkiIt05I778AInSF2R9Li+XAu2lZQ6aQc6e7qRus2Dg
 hVWPSFIOvL8OidZwX9cF8XaLrh0QqMYNtbiQ500czIMn/E51Yxn+YpKAPv7htylJ6FTw
 sB6nVaxnEt73V/5np44lGRQe/omkFbB0XHLkEDDJbGW01A6Dp98326iIWRjO1lXGff5j
 1IiM3+IZiqKuHRt3absnwz6rboTVXCj3I8yZkEFFhtB6N4Bn35HBpYDhbhJjhJlx74eF
 Kfyb9a50ZdNICE4r2gB/GndIjtizCqQQ10ovk/uFtNz7FFtoGkCK2BR9DNQEuyT1XBsG
 Rvgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y63NCLIHxjj8BP4Xs3EPNGxMJKsqwIK/ULA13gyh9ao=;
 b=tFWBTw1teYDUOl9Ulu3cmMk+Qt7/NDpsKifaZmLeSEUvulsM4W6hW5n97ytQjT9WKM
 QcNnMtnkWN7zMqvHMRb4AG9d7oaEh0pdufCRROk/Ohb5+fXLzaRQAIPOvj5U3G+ZxkeN
 9XceI8by/62SXd2aOcNGXtJoju9Q+P34paFJPsfLka8k6wLczhEx1HEQWs9uO0l5w1Fv
 17gXoNw44BoFxH6lstHEaU1AuHj0FI/jFivnLi9iCg/vxJKdEiCwV5RF1sZZEFLG+EhC
 BXzq94w+qF1kcgmbK4koARSzYEXEJuc0Cn7r/71bf89SSLGJjXL+Fe7YIQuJO/z8TUmh
 twkw==
X-Gm-Message-State: AOAM531fLmNsn9/VT5Q1fCH1q742GU7lXfbj5fYnFVm73/z4dmgmYtip
 t2hBmE2cmo8f3ESHbjO5cc8IhW2d
X-Google-Smtp-Source: ABdhPJwbA5DIpZgKjkbW5v4VN0dDPLh8ElqMeZzUOatVchhLG9bG4zbM0npXKWlBud0eQGmNYyEONA==
X-Received: by 2002:ac8:36c8:: with SMTP id b8mr18131242qtc.212.1589853349593; 
 Mon, 18 May 2020 18:55:49 -0700 (PDT)
Received: from shine.lan ([2001:470:8:67e:e463:db9c:c6eb:4544])
 by smtp.gmail.com with ESMTPSA id q2sm9731898qkn.116.2020.05.18.18.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 18:55:48 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v7 01/19] Document ioemu MiniOS stubdomain protocol
Date: Mon, 18 May 2020 21:54:45 -0400
Message-Id: <20200519015503.115236-2-jandryuk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200519015503.115236-1-jandryuk@gmail.com>
References: <20200519015503.115236-1-jandryuk@gmail.com>
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


