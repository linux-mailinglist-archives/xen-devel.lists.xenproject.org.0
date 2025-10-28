Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7DC16A85
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 20:46:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152373.1482841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDpde-0000KI-NP; Tue, 28 Oct 2025 19:45:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152373.1482841; Tue, 28 Oct 2025 19:45:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDpde-0000Hp-Kc; Tue, 28 Oct 2025 19:45:50 +0000
Received: by outflank-mailman (input) for mailman id 1152373;
 Tue, 28 Oct 2025 19:45:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUly=5F=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vDpdc-0000Hg-EV
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 19:45:48 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b07edb64-b436-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 20:45:43 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-4710a1f9e4cso52020965e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 12:45:43 -0700 (PDT)
Received: from localhost.localdomain (host-78-149-11-196.as13285.net.
 [78.149.11.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771e196b27sm9405855e9.8.2025.10.28.12.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 12:45:41 -0700 (PDT)
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
X-Inumbo-ID: b07edb64-b436-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1761680742; x=1762285542; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lxiCxRY8d4eGtW/Qi4B/sJKi4SxqOMGS2SmQxzLiI1U=;
        b=rDcxmIPCW8Bki9rvn2wLv2dbCrzTlOAs0dfTqBbzq5Me6eZeqcToT9V8kbxhGRraG8
         ASepgV2xqu1qbZKEIBw0z5sFncnMj216D240bctYWP6fWUYAlst2jgzs4BCrRj5Lo6XL
         RKiIrZOHEwa3CPI5ZR2Z09PV5TCndvj4EMoQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761680742; x=1762285542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lxiCxRY8d4eGtW/Qi4B/sJKi4SxqOMGS2SmQxzLiI1U=;
        b=OSSpe/fnPzuTVslKosijSsmqEG/NOA29MAxq/uwN8vRdGlxkTviAs1Zc6U7Z7mICs/
         /TsyE56EQlkGx5qXuZJiQTQClppXpmPXafKRQlnnW9SES4bxccUr/XZz23lhOgjQxn2S
         HabfJdsO7dwKiOemQchTQVv3MUdnxGqpcPcJEyVNyCve/4TxDKwg4hpIoAoHPxyj9h+p
         hmca8ecQ6dNekqlnzVcQ/a8zqo/VmAahkf/8hWkmq8bqfSUIBNE66wI0pZiWqxTTjQSw
         1bpbHjpznIENRCOnN6d/GvthCTLYaxMjb9QaZV+B0P9eOm136Z5CWxuRrb+5zecGuoFn
         lYvQ==
X-Gm-Message-State: AOJu0Yzwcg/ygaNSYZDJ6gHVpFbgn/I+wo+NSAQh0JpNx4w9csJ9ZHFx
	iwCF5hvkB98FcnoozY7DsdHze0TDNEGeX2orYjFKhp95U8aCSkgHhk86l7qvxCD9/d+cPsT2BrE
	O+KPWTNQgtzr5
X-Gm-Gg: ASbGncvo0miaZvDS7BfoC5aEJi0C+3OB5up6pH6CE/ccrmqDkkWniKsubFMdNv92ncQ
	Pm/SDQfMG0ad9Mc/iJtbl0yNJ1jOozFct1Ll+WgV3D6gZMKEOwA2OCVGJSKvr9K6WV9FmrNd3+k
	qzmesG8SSW1B8FLEp0MqPE6oU0wF4gFYYk64J9dYNqjzh6HGJ9yhYKfqblNmL9OjEfhYVsjCY7B
	A1yLJ8+REStXMl79AavdASmUPyZXUGdebXAA2EtqEL+6gAB5w00yV5Vndmp6pFDN9DwABuQ9+dI
	98fU/k4uQoNq1C3SuZWzgBX19IdJEfR/LVM/BPWP/Wok6ycpuC4D7s7TwBNwpOJtauNQxMY6u/O
	PWB3JoTn/N9H2pu/SM+aSnriyoYXr4+BeEYWlN0blZSCwJyWazPvSbmcz7a0Qc4NCoAh00Scpq7
	qONUUmVCYOMaI3MVfd+vbbeAg6SvlWagsCwsMeRksx9WPaEJtEI3I=
X-Google-Smtp-Source: AGHT+IGhuzE6q6qlyaXNO5btIwar6Uz/izMsx74DPM4TXWAWYqkL3y8JQniGJQxliBnQ0on0gCyHrA==
X-Received: by 2002:a05:600c:8714:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-4771e1196f0mr5955025e9.0.1761680742225;
        Tue, 28 Oct 2025 12:45:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.20] CI: Fix microcode loading on Xen 4.20 and earlier
Date: Tue, 28 Oct 2025 19:45:39 +0000
Message-Id: <20251028194539.3668470-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CONFIG_UCODE_SCAN_DEFAULT only exists in Xen 4.21.  In older versions of xen,
use ucode=scan on the command line.

Fixes: 690655a511cd ("CI: Include microcode for x86 hardware jobs")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Jan Beulich <JBeulich@suse.com>

The fixes tag is the 4.20 backport, not the original patch.  Found while
trying to test the microcode loading backports.  (At least the XenServer
testing has proved more useful).

4.20 is the oldest branch that tries to load microcode in Gitlab CI, so this
does not need backporting further.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2126131501
---
 automation/gitlab-ci/build.yaml                | 1 -
 automation/scripts/qubes-x86-64.sh             | 4 ++--
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 5d382bcd246e..5f0acda942ac 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -306,7 +306,6 @@ alpine-3.18-gcc-debug:
       CONFIG_ARGO=y
       CONFIG_UBSAN=y
       CONFIG_UBSAN_FATAL=y
-      CONFIG_UCODE_SCAN_DEFAULT=y
       CONFIG_XHCI=y
 
 debian-12-x86_64-gcc-debug:
diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index e20a38e4f396..7a8b12cca483 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -247,14 +247,14 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot ucode=scan $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
 
-kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts || reboot
+kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot ucode=scan $extra_xen_opts || reboot
 module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
 module /gitlab-ci/initrd-dom0 || reboot
 boot
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index e68b0ce61faf..468143376df5 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -15,7 +15,7 @@ WORKDIR="${PWD}"
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
 XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
-XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
+XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot ucode=scan"
 XEN_CMD_EXTRA=""
 DOM0_CMD=""
 DOMU_CMD=""

base-commit: 3324a6dbb25bb2975c35f4f2b20c6725f2a7724b
prerequisite-patch-id: 9d3f448db19cd78efd8ff7a82f1e3e19d3fc53e3
prerequisite-patch-id: 041eb4352fbc857fbad3a29bf9b0ed04f31c31be
prerequisite-patch-id: 35e1edd03c25f555fdf0f6eb1d71e80fa9ef77eb
prerequisite-patch-id: 20c59be6b65c2aa61e2a364db27edcce2477f6f5
prerequisite-patch-id: 70359f42f93eeb549f0fcbcbf39a5df99ebeffc0
-- 
2.39.5


