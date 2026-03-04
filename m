Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yADjIS9KqGnysQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:05:19 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9D4202332
	for <lists+xen-devel@lfdr.de>; Wed, 04 Mar 2026 16:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1245560.1544917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnmb-0007Kt-Px; Wed, 04 Mar 2026 15:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1245560.1544917; Wed, 04 Mar 2026 15:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vxnmb-0007IP-NG; Wed, 04 Mar 2026 15:05:05 +0000
Received: by outflank-mailman (input) for mailman id 1245560;
 Wed, 04 Mar 2026 15:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4oGM=BE=gmail.com=chakrabortyshubham66@srs-se1.protection.inumbo.net>)
 id 1vxnma-0007IH-F0
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2026 15:05:04 +0000
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [2607:f8b0:4864:20::1030])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f786a4-17db-11f1-b164-2bf370ae4941;
 Wed, 04 Mar 2026 16:05:03 +0100 (CET)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-358ed696623so2866382a91.0
 for <xen-devel@lists.xenproject.org>; Wed, 04 Mar 2026 07:05:03 -0800 (PST)
Received: from localhost.localdomain ([47.30.254.178])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-359aa3eb916sm516439a91.11.2026.03.04.07.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 07:05:00 -0800 (PST)
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
X-Inumbo-ID: 84f786a4-17db-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772636701; x=1773241501; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fqTYOMIsNClRzqswixiS8WEm00nS5ICygdS6xEi4uwI=;
        b=VASiVr9TJfSCmlBbui+D2U8h3fGQRVLqUznS5XuKhKnVc7e1YCX149X15UkWBHz6DI
         L4sh5bQ0lMBiEQ5JLtXuTxGz/8fcvSdTmEdaoqs/215PGAlkUkdrZzyyHV1AHlX1U+/T
         n/VJX5qbrQm1y3NoXkO1DfFHrlqTYsbmkWQwdhOHMEP0VD726Bffj1e8IGVZSgMZ+8Rl
         StLS2+y8+cbJeZ/YoeJU2FM+59KQVMPrTtNTTT1nwbJJSbeRgwq3LyCylpQVsq415p1C
         ix2WAEikNCX6nHFj49+cIKYnYBFTMyFqa1JiP8M69sze7qI5Nm716UzEjIImtIdjHmrr
         SSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636701; x=1773241501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqTYOMIsNClRzqswixiS8WEm00nS5ICygdS6xEi4uwI=;
        b=RnlhaKopr+ItG4uZAc+JogYxzaorAXaHwmsHb9VG1+851gebQQ4585pgB3ebfE8UnA
         FeaiyRyJE8rbgaIPBWwE6oPNrj6WHkVRinMVt3hpFHXDpD6XkiqmRpfE7j/fLR/4KL06
         qDT17z87GW7yJJ9rEJVesiO6A1P7FnwI/NOcjejaRldDAqwLpcL5700rrI0UQLi/si5Y
         bqA/JCdXJkz/5mRRmwSVkNtQKrgoDe1aLdmZPy71GEmdIh3BrCJl7i5QV9cVfjKrU8iV
         wkLGSmprPFKac/Vmf8ZxP0MX7p2pYSj5z2pATbWGNBiOtsYyFV8JggoWSeLl/BDfvKEM
         AF4g==
X-Forwarded-Encrypted: i=1; AJvYcCUvGnnzrt7xPsJdIsdDiISWKyiS45W0FjNALRQhtZ7rDPYzXi2nMlSEDnAJckAfZpTRa5t5tDiPTMA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYyvhvmhFbqoqpVM79XbqZGs2Wfo6ukEhwCPgNlCnXF98EsZIr
	ZxU3hWYT6Yk6WVjk03+qfh4zJORiURUoH6xy+l+2ok7N3sgXrwzLENFI
X-Gm-Gg: ATEYQzzJLBiBYf6/qls/40d6Bpst28G8afoGIPXMdCwQK60I/LUjgg6XmMxLxGm8Kgu
	wqfONbSnvRHNBJn/DEJaJdydgV579LoP/fKa7z+fmN+eibjmeeL6YBoUaBNttFTFJ6GEV+24yaP
	bmw5qOkcY3lbedefe7ki0Xc+Tae6VpwTV1HTOT41jXvZ/llhYJkjYk9n4Ob6d95yWk40VWZQg1v
	hJ52C9G5P0PzTAoaVtSnf+l7AZQs2YQo7C1n97PGajd6jQ0Fm242WMzfVECoRV7nt/Pi2wiM/3G
	J1DjZMerZmp9r4V2LnW8bu1GEcIYUan8RsvO5k2/bR9azqSiUxX+xKQyU9P58U4JVafaJOvd5/L
	c3ocN8DQRGfeUuWf8ACH8KpGqRJPvCOYlpYq/i3J5PpY5d1Lye46dAjn+kD/ihFmLy/1ps7LwMD
	tGh9/Y9zj/b4IELsLR5clfeJTaH7Gj+GVrcXyPdCAKHrATx2KRl4819x7b5M1vtA==
X-Received: by 2002:a17:90b:48cd:b0:34a:8c77:d37b with SMTP id 98e67ed59e1d1-359a6a21536mr2121281a91.16.1772636701366;
        Wed, 04 Mar 2026 07:05:01 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: corbet@lwn.net,
	jgross@suse.com
Cc: sstabellini@kernel.org,
	boris.ostrovsky@oracle.com,
	linux-doc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2] docs: sysctl: Add documentation for /proc/sys/xen/
Date: Wed,  4 Mar 2026 20:34:19 +0530
Message-Id: <20260304150419.16738-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: DD9D4202332
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,vger.kernel.org,lists.xenproject.org,gmail.com];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:jgross@suse.com,m:sstabellini@kernel.org,m:boris.ostrovsky@oracle.com,m:linux-doc@vger.kernel.org,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,m:chakrabortyshubham66@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chakrabortyshubham66@gmail.com,xen-devel-bounces@lists.xenproject.org];
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
 Documentation/admin-guide/sysctl/index.rst |  3 ++-
 Documentation/admin-guide/sysctl/xen.rst   | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
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
index 000000000000..6c5edc3e5e4c
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/xen.rst
@@ -0,0 +1,31 @@
+===============
+/proc/sys/xen/
+===============
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+------------------------------------------------------------------------------
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
-- 
2.39.5


