Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 671497F3330
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 17:07:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637949.994105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THe-0002bK-Nd; Tue, 21 Nov 2023 16:07:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637949.994105; Tue, 21 Nov 2023 16:07:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5THe-0002Xb-KD; Tue, 21 Nov 2023 16:07:30 +0000
Received: by outflank-mailman (input) for mailman id 637949;
 Tue, 21 Nov 2023 16:07:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MZRi=HC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r5THd-0002HT-0p
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 16:07:29 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 109b63d6-8888-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 17:07:27 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32ddfb38c02so3846201f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Nov 2023 08:07:27 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 d16-20020adfe2d0000000b003316a2aedadsm14407752wrj.36.2023.11.21.08.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 08:07:26 -0800 (PST)
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
X-Inumbo-ID: 109b63d6-8888-11ee-98e1-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700582846; x=1701187646; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iJZficHD89x4cEJe0EHwd87oUHCMM3lzh4Y4wqUEu3Q=;
        b=l9VAqEQpjoB+gyz75WfqPRkoIBG7614lQa0Yc5izp1AjYY8su0stG8vbeexj0vlCcU
         CMPKRcLwDSYR/YqQwS4wtIY6EAS6BTz/p6BdSRNoUGU/5r0HZ/08P5nPnzYaEsEe6y6I
         1GoNJ23NSM9D1A0dLSTcN4R/jIam13rI/ZStc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700582846; x=1701187646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJZficHD89x4cEJe0EHwd87oUHCMM3lzh4Y4wqUEu3Q=;
        b=a1EVC4/MN5CtG1k7661AE6jKvCoHvkwtkcO5ryopcXBRABgWL4OLwSElVx3lN6aZDA
         O5gaTKGHMQer/D3etNELk58XBvE4KtRN5xNUFyay3GaAr88lfwLrznNnSjnNIH0y7Lya
         uEhKwhEPvBQWRNNa5paMXXwSBOCZ1VPafq0hV2yNmfjohd3BGeVd+3v7RoS8Bt08xnt6
         x6gjAXxEFAUJbYckX3jnIC6MgpO30I8XRMMa9s5DVw6GlWrXTPjheXApQjhGznUwLH9c
         e/3KHJFL5CTOP4ww7uUAsiltOdmXfGU8zptealVregu5N4zTyvoi59zEZf8ZAETuV/En
         PomA==
X-Gm-Message-State: AOJu0Yx0HCBs5jVLzGUr7fGWEr4kNOZ4QBhPuO/GZ0bDK2iMDN1xF/BE
	7RcBlp/uaGQdCRhLgAGd8W6CzhUx4UCNfuZT7II=
X-Google-Smtp-Source: AGHT+IH7cKHvp9kQ5KXLOWumVBLQF/PDgqIFuk4ArUeuEBBFhUOM4SrpBmaYA1loyOj3TMHAHnRHrA==
X-Received: by 2002:adf:ce0c:0:b0:331:6c7a:73f with SMTP id p12-20020adfce0c000000b003316c7a073fmr7526716wrn.17.1700582846459;
        Tue, 21 Nov 2023 08:07:26 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/7] automation: remove com1= parameter on QEMU smoke tests
Date: Tue, 21 Nov 2023 17:03:53 +0100
Message-ID: <20231121160358.8080-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121160358.8080-1-roger.pau@citrix.com>
References: <20231121160358.8080-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The serial is already setup by the firmware, be consistent with the rest of the
QEMU tests and don't specify a com1 setup.

Note it's also bogus, as the extra ',' will make the intended DPS argument to
be parsed as the io-base.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes in v2:
 - New in this version
---
 automation/scripts/qemu-smoke-x86-64.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/automation/scripts/qemu-smoke-x86-64.sh b/automation/scripts/qemu-smoke-x86-64.sh
index 188ff8e3d658..3014d07314b9 100755
--- a/automation/scripts/qemu-smoke-x86-64.sh
+++ b/automation/scripts/qemu-smoke-x86-64.sh
@@ -19,8 +19,7 @@ set +e
 timeout -k 1 30 \
 qemu-system-x86_64 -nographic -kernel binaries/xen \
         -initrd xtf/tests/example/$k \
-        -append "loglvl=all com1=115200,,8n1 console=com1 noreboot \
-                 console_timestamps=boot $extra" \
+        -append "loglvl=all console=com1 noreboot console_timestamps=boot $extra" \
         -m 512 -monitor none -serial file:smoke.serial
 set -e
 grep -q 'Test result: SUCCESS' smoke.serial || exit 1
-- 
2.42.0


