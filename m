Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNK1LwRAqGl6rQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:21:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37F41201410
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 15:21:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245448.1544824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxn6e-0005ay-LQ; Wed, 04 Mar 2026 14:21:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245448.1544824; Wed, 04 Mar 2026 14:21:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxn6e-0005ZM-Ho; Wed, 04 Mar 2026 14:21:44 +0000
Received: by outflank-mailman (input) for mailman id 1245448;
 Wed, 04 Mar 2026 14:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4oGM=BE=gmail.com=chakrabortyshubham66@srs-se1.protection.inumbo.net>)
 id 1vxn2M-0004Pj-8n
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 14:17:18 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8a99161-17d4-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 15:17:17 +0100 (CET)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-c70bfef17a4so4076246a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 06:17:17 -0800 (PST)
Received: from localhost.localdomain
 ([2409:40e5:116b:88d4:1c32:f854:c933:d139])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae3d1b2c51sm128138145ad.19.2026.03.04.06.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 06:17:12 -0800 (PST)
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
X-Inumbo-ID: d8a99161-17d4-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633835; x=1773238635; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2HHesXUFzgL5YUe0UTlW0VJee6vfQ7EH/6Wc6oNHvRQ=;
        b=nMjgPhRWUKxGrzQT5Qp9yNEplTHI/0csGHlezhLeCJx0XV81ps7sWHcF1bTW+8ynWw
         ndv9spFEiIiqnNKloVkr/iKjSCbE0J4CQB4b6q9Trg8o4nZ4gNUrQ/gjiDkVhbhVj/5K
         T4WVXejGW193IJP3yPmmGe+L2Kp4b/jPzU5IKZuGN8Wz+HKdVGacRXh/lmoNZzWskE9U
         OIegLwgu1ZCYAlWqPKxUitjnZo2aVomHkvMztdzuenxzV49ze3n3eGfstdu4e5oxGVtf
         L673IEgqyTGpy9hi87jyQBsQDqIlgNfLS7pNQhCulffDaMHPEXyAaFgzvwwUtyJB46LW
         n88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633835; x=1773238635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HHesXUFzgL5YUe0UTlW0VJee6vfQ7EH/6Wc6oNHvRQ=;
        b=QrhmaCSWG5X/lpUZri0y5SxLxgkiwvQ6Z+jVblwqWu/dr6k1+7Qq2Qv9rmybY1sZwu
         6Lhp//IIQSz7W2gyxaK9VdYNXTfcOBM+7dT2T8z+jG4rTWSB/XnZV1orW0uTNlj75bFk
         bo0c1I3tok2UUFsygbyD2Fdt0rK6Qwp8zMrrBiQ2TJCC9cu8yuTWUVa+wJl2PU3aBPHb
         kJ2ASKXxfako0Ia+9SiHKwLqWwphCrvTb1eKTUJx30UFnl5HV+3MMjijrdutZi7F4WDR
         ryhoih89FuDVdQ68XcD2VH3c7MS6SHUqhr8djJbDvZK24NVSy42VRyUQkKzvsjxIOLBO
         9MBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCqle0CJuIKOKa7HNFKJWjRRUwzdAkuFDZHBB4zHESekeTwDs8+IuOcy2GijCU7j8GSUZK5FrlZWM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxaL4ffy7lQohwwjImd81LzuJw51cFSjup4xJwcFvCnw/l8gMRj
	JuxNNi6/2VODHCheq8ca/Vx2VUqqkevpJVaD4bTmrVNoX1GxNJ0G1NoD
X-Gm-Gg: ATEYQzwnsl1AGSHnQaZFav+BZdUqvbFeQ6Yw029lqZHVlqBUJtxt10XLN3b9PYni0e0
	Wx7oaIeI0KzeoD/vryvjDnHIPigrTMOiMqHsOsPNAyYULp8ygXAKJoTR66anbnHpl62GFT4ezcD
	nSW1v9xUeO7haJLuUq6LTv3EORtUw322PJKG0McoRCGuVLpkqrn3wSV9uSsnGmUbz/SyCoGwMA7
	FPmwwVNmwJi9v5WosZGh3ENzkT0ZIiY9CHSj8DWawOKBxIA4god3Jp20ImZYegmo+cwLYq/zFzt
	vISBt7ScOU+9tMWAMjTQL5/8wp/HNjCeEM6X9B3YZvl6R2H/+BwzV6YHTzgv8SHQHurbSW/l8lt
	Bi0KrLFGiBPIUZDHFHmPKPGADFg8cC5LvWMFe+cv4N0kgTWFZv2zAEZeOVFYsogGLB041c+/zhU
	PKrSJtlmoVBJTSz2kV3NLMgzuxuHniW3U7mLCG2emP5WM2/ma1MZjJ
X-Received: by 2002:a17:902:e5c6:b0:2ae:50ec:fa35 with SMTP id d9443c01a7336-2ae6aa36151mr22864825ad.24.1772633835197;
        Wed, 04 Mar 2026 06:17:15 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: corbet@lwn.net,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
Date: Wed,  4 Mar 2026 19:46:44 +0530
Message-Id: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 37F41201410
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,vger.kernel.org,lists.xenproject.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:jgross@suse.com,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:linux-doc@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:chakrabortyshubham66@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chakrabortyshubham66@gmail.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Add documentation for the Xen hypervisor sysctl controls in
/proc/sys/xen/balloon/.

Documents the hotplug_unpopulated tunable (available when
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG is enabled) which controls
whether unpopulated memory regions are automatically hotplugged
when the Xen balloon driver needs to reclaim memory.

The documentation is based on source code analysis of
drivers/xen/balloon.c.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/admin-guide/sysctl/index.rst |  3 +-
 Documentation/admin-guide/sysctl/xen.rst   | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/admin-guide/sysctl/xen.rst

diff --git a/Documentation/admin-guide/sysctl/index.rst b/Documentation/admin-guide/sysctl/index.rst
index 4dd2c9b5d752..aae68373902f 100644
--- a/Documentation/admin-guide/sysctl/index.rst
+++ b/Documentation/admin-guide/sysctl/index.rst
@@ -84,7 +84,7 @@ sunrpc/		SUN Remote Procedure Call (NFS)
 user/		Per user namespace limits
 vm/		memory management tuning
 		buffer and cache management
-xen/		<undocumented>
+xen/		Xen hypervisor controls
 =============== ===============================================================
 
 These are the subdirs I have on my system or have been discovered by
@@ -102,3 +102,4 @@ it :-)
    sunrpc
    user
    vm
+   xen
diff --git a/Documentation/admin-guide/sysctl/xen.rst b/Documentation/admin-guide/sysctl/xen.rst
new file mode 100644
index 000000000000..957febd6bab9
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/xen.rst
@@ -0,0 +1,33 @@
+===============
+/proc/sys/xen/
+===============
+
+These files show up in ``/proc/sys/xen/``, depending on the
+kernel configuration:
+
+.. contents:: :local:
+
+balloon/hotplug_unpopulated
+===========================
+
+This flag controls whether unpopulated memory ranges are automatically
+hotplugged as system RAM.
+
+- ``0``: Unpopulated ranges are not hotplugged (default).
+- ``1``: Unpopulated ranges are automatically hotplugged.
+
+When enabled, the Xen balloon driver will add memory regions that are
+marked as unpopulated in the Xen memory map to the system as usable RAM.
+This allows for dynamic memory expansion in Xen guest domains.
+
+This option is only available when the kernel is built with
+``CONFIG_XEN_BALLOON_MEMORY_HOTPLUG`` enabled.
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="xen" \
+..         $(git grep -l register_sysctl_)
-- 
2.39.5


