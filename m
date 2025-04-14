Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9AA87E7A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949714.1346225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgf-0001NB-Hs; Mon, 14 Apr 2025 11:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949714.1346225; Mon, 14 Apr 2025 11:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Hgf-0001JY-Ds; Mon, 14 Apr 2025 11:09:13 +0000
Received: by outflank-mailman (input) for mailman id 949714;
 Mon, 14 Apr 2025 11:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4Hgd-0000MT-Vn
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:09:11 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3e1a086-1920-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 13:09:10 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so44840465e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 04:09:10 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f205ecb8dsm176820405e9.7.2025.04.14.04.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 04:09:09 -0700 (PDT)
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
X-Inumbo-ID: e3e1a086-1920-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744628949; x=1745233749; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6OWKMegtcc/0rp9IBds/PhWoddbHwcZW0/uLjS/za0=;
        b=DkHRHtgFjFnFG7JIRxAqr9LgkWq6+kO7OeNPXn0KnezZjYAvdkDS4NrmK57tElfm46
         vlVQRLQnZ26udef+UO2zR98b/WNSm1EfUvA6sc/0Uasfry3RTPbXrInNXjvJ0oQyFPFG
         XXRHMFrduUsIS8BR8dOVFmQg2Ere9kIpL6xac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744628949; x=1745233749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6OWKMegtcc/0rp9IBds/PhWoddbHwcZW0/uLjS/za0=;
        b=d4uC+p+do7keC3bW9Ipuw5/gtCcZn/jOTRZaknD1wEQ+xKKQ8x/sf2WR2NzPqfwbCK
         aLs/o2Sc5uPQDunZ6yVwM4GsDJqrlH0eyJOd0Vk+2KAPMsSFKpjI++NUQpKThwaGXV1p
         YIya7jDIZMlS0DofjJVT/2Atc56/flMjIFnlZH0dyyns2opXkRci88XzRvQHxw81nj88
         r6N1PzqDu2n336/ebsbwyqcNtEw6bQIAti+AMZ8M6Ge69g7D6apQPUA2n82uMbUZYj/s
         Y8YKlUb970MN9U7kWSvLIZqLv0N02igNBe6Jh30/FMi2pYgMrzEM4UOK7/PHgU8YPP/Y
         Iwxw==
X-Gm-Message-State: AOJu0Yxac0ogS5gKwVnC/ogrNo8bSGA0/h2/KZDqI4SU1bhIpadORP8r
	+6Wx0bZn7uXzE3aMWtTgoyt5+DvIQUQd9nItY1Oyup2h3muvh0LQj9XMu+nuhqVgJScGQ8tCEAY
	r8XU=
X-Gm-Gg: ASbGncviCcgfVwQ9kOWLGf4x2hKtGjui9OPcxDrCH0gTBlc2LF4MMxBke+q0qKCasMe
	inBfMaxs2LHBh0EvJ4dTEFJOTHtmvIyYZcxcZPR3vHeq2YhXlm/0+3pSiR0Q02bCVHmWsksV7oB
	iq6ZPiI2dmjhBgltU02BpDVE2q3+w7wGYmzUtMv5yUb1IyF48o9GPKO2tGEmIShqztFXz/D+KYh
	9qy1dnYdqydWlPwlE2t/j5q8qo7F7w1f/zCY6v6Tqv3AMAC2B1ovJGh7V4wE5239llWLgW5wokZ
	XeKwvombmumRmcbcYutGfyYjSCTgdkPgk0c7kojEcbdaXy/YDG+luDN/ev03TrGfNACMCvXsRLw
	MQBN49StEi6ESWg==
X-Google-Smtp-Source: AGHT+IGtaACpohKN8NRqicAByAmOnMVvrogHealXG+qY91ryDFjecviPNuDE7Y7Pl6koWR/XwJnLwQ==
X-Received: by 2002:a05:600c:46d0:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-43f3a9afc34mr85923695e9.20.1744628949499;
        Mon, 14 Apr 2025 04:09:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v3 4/6] CI: Switch to new argo artefact
Date: Mon, 14 Apr 2025 12:09:01 +0100
Message-Id: <20250414110903.2355303-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
References: <20250414110903.2355303-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The argo artefact is now a cpio archive and can be appended to dom?-rootfs
directly, rather than being part of of the overlay.  Drop the
copy_dom?_files() functions.

xen-argo.ko has moved into the standard location, so update the insmod path.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jason Andryuk <jason.andryuk@amd.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>

v3:
 * Rebase over change to rootfs handling

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/1766180593
---
 automation/gitlab-ci/test.yaml                |  2 +-
 .../scripts/xilinx-smoke-dom0-x86_64.sh       | 22 +++++++------------
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 51229cbe561d..d46da1c43d05 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -242,7 +242,7 @@ xilinx-smoke-dom0-x86_64-gcc-debug-argo:
   needs:
     - alpine-3.18-gcc-debug
     - project: xen-project/hardware/test-artifacts
-      job: x86_64-kernel-linux-6.6.56
+      job: linux-6.6.56-x86_64
       ref: master
     - project: xen-project/hardware/test-artifacts
       job: alpine-3.18-x86_64-rootfs
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 1fc52d78db16..85007dcc290a 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -28,8 +28,6 @@ extra = "root=/dev/ram0 console=hvc0"
 memory = 512
 '
 DOMU_CFG_EXTRA=""
-copy_domU_files () { :; }
-copy_dom0_files () { :; }
 
 # Select test variant.
 if [ "${TEST}" = "ping" ]; then
@@ -66,7 +64,7 @@ then
     PASS_MSG="TEST: Message from DOMU"
     XEN_CMD_EXTRA="argo=1,mac-permissive=1"
     DOMU_CMD="
-insmod /root/xen-argo.ko
+insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
 until false
 do
   echo \"${PASS_MSG}\"
@@ -74,24 +72,19 @@ do
 done | argo-exec -p 28333 -d 0 -- /bin/echo
 "
     DOM0_CMD="
-insmod /root/xen-argo.ko
+insmod /lib/modules/\$(uname -r)/updates/xen-argo.ko
 xl -vvv create /etc/xen/domU.cfg
 argo-exec -l -p 28333 -- /bin/echo
 "
-copy_dom0_files ()
-{
-    mkdir -p root usr/local/lib usr/local/bin
-    cp "${WORKDIR}/binaries/xen-argo.ko" "root/"
-    cp -ar "${WORKDIR}/binaries/lib/"* "usr/local/lib/"
-    cp "${WORKDIR}/binaries/argo-exec" "usr/local/bin/"
-}
-copy_domU_files () { copy_dom0_files; }
 else
     fatal "Unknown test: ${TEST}"
 fi
 
 # DomU rootfs
 cp binaries/rootfs.cpio.gz binaries/domU-rootfs.cpio.gz
+if [[ "${TEST}" == argo ]]; then
+    cat binaries/argo.cpio.gz >> binaries/domU-rootfs.cpio.gz
+fi
 
 # test-local configuration
 mkdir -p rootfs
@@ -108,13 +101,15 @@ echo "domU Welcome to Alpine Linux
 Kernel \r on an \m (\l)
 
 " > etc/issue
-copy_domU_files
 find . | cpio -H newc -o | gzip >> ../binaries/domU-rootfs.cpio.gz
 cd ..
 rm -rf rootfs
 
 # Dom0 rootfs
 cp binaries/rootfs.cpio.gz binaries/dom0-rootfs.cpio.gz
+if [[ "${TEST}" == argo ]]; then
+    cat binaries/argo.cpio.gz >> binaries/dom0-rootfs.cpio.gz
+fi
 
 # test-local configuration
 mkdir -p rootfs
@@ -134,7 +129,6 @@ echo "QEMU_XEN=/bin/false" >> etc/default/xencommons
 mkdir -p var/log/xen/console
 cp ../binaries/bzImage boot/vmlinuz
 cp ../binaries/domU-rootfs.cpio.gz boot/initrd-domU
-copy_dom0_files
 find . | cpio -H newc -o | gzip >> ../binaries/dom0-rootfs.cpio.gz
 cd ..
 
-- 
2.39.5


