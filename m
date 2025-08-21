Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF71DB2F784
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 14:07:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088598.1446340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up44H-0002BR-F0; Thu, 21 Aug 2025 12:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088598.1446340; Thu, 21 Aug 2025 12:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up44H-00028t-CH; Thu, 21 Aug 2025 12:06:57 +0000
Received: by outflank-mailman (input) for mailman id 1088598;
 Thu, 21 Aug 2025 12:06:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up44G-00028n-IP
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 12:06:56 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54bcfdfc-7e87-11f0-a32b-13f23c93f187;
 Thu, 21 Aug 2025 14:06:55 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c2f0eso509703f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 05:06:55 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c077c56454sm11508119f8f.58.2025.08.21.05.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 05:06:54 -0700 (PDT)
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
X-Inumbo-ID: 54bcfdfc-7e87-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755778015; x=1756382815; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TEfwe2KafUbx5r9PX7TgTBX7JjSkwM5I5H+xupXG1Bs=;
        b=jRA3YyCVP8uH5UoDrwOJ+eYUhLTnIpi/FybMtM5SX6SJOICq2xRnH7xaU7GVEtv5Fp
         eJe1kTY/UWEK+oWbur8MRlBdxsXuehiuoguTOXg1nWDy2DrWPRE8QVojS/8qo18Agb0T
         LBn4nOOOzHZL7BWYeGu+JWOGmf21+JKCgNGCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755778015; x=1756382815;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEfwe2KafUbx5r9PX7TgTBX7JjSkwM5I5H+xupXG1Bs=;
        b=X87+RC56XV1UDxT686JkXzl2BttPOTN6AGNRMMpMR4jsdVwa4uiODGQYf0KvP90Poy
         itWtI8WlLHsaINrx6XzhEOytWk+Gmc208uHqfek7Uu9JrJWF8hZLPhyhuMbbCI4FIYt+
         cnndoG+YbwQ0ddlpNS3ppm8JlMA3pESPjwceGLdy6g2bsCSwp/E61N6yWmO8VM1LaF/Y
         LCxod7+58G0CFjv1GFE1DMKkLfRxBv3zQ1zDlpWxIQhrbbY4c+oavzbJMQzld4M2Jp42
         PZv4EviddkuxV+M7QgNSK+VwiqHJwpXFrm8lgjXWHSERBoopCM0ut8qWDbzTMCHv+PjQ
         O8ww==
X-Gm-Message-State: AOJu0YywuvIkWSDlSPxyAgtVCVVW3ZTXXDDTEVuoHu3I+edYpCgaQjwB
	TfEB2+16VFhoeYxCsMETWGvGB2ETZ+SY/9oXRPjpFK+BKkCMyFv8K2oSM4kwrAsydpHPN4LMyut
	6doL8
X-Gm-Gg: ASbGncs/XXdk9T4d6f+F3cemEnbdeyaP/RmbwWoeB1qLppGAM6IFsbajpq6NRbo7k45
	/AOMWggmH1JGbJhsjq9a2GgxkUYdH9yWZ8NyvOOo634Gt5IR5fnOmf84ttcIVrlI2yYJjEVLPDf
	/qNeMVAFOq5Y8GHBP6rkU7vjMpWOIDeuyw3mlbK0JqldzNDe39Z7fdY9nGKaXsJeEmu1XwCh6lO
	pVZwS2wLme1WL6+L+2qnxht/YWemQpa2R0AAypmMt69fSEOuN7x0pIIkI7pGILwEeFjZvsGFPro
	hyijeRaVrvEq2imI7EjyPaa9HAhHL95a+NTWzpfiEMgHqAAB05dTsxF1bvOqkQa7Vaw9jqTNblu
	ZcsMaVGmBkSHWJwImrya3bl8ojaZBcQ0xkv/xtXZHffs4nFNzkPeMpZI0dFazsSHaS8uCBmnu7b
	mhGC73Cfo1S60=
X-Google-Smtp-Source: AGHT+IEArblKoV1dTLpF45sNMC15Epps/32sqh+48MjSB9xx3/5LvEUT1jIdnKyEunheRp/fdj5mBw==
X-Received: by 2002:a5d:5f56:0:b0:3b8:d337:cc33 with SMTP id ffacd0b85a97d-3c4949fadcfmr2216631f8f.28.1755778014653;
        Thu, 21 Aug 2025 05:06:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] CI: Use 'watchdog' for x86 hardware
Date: Thu, 21 Aug 2025 13:06:52 +0100
Message-Id: <20250821120652.3910926-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This detects various hangs and turns them into a crash with backtrace.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Jan Beulich <JBeulich@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/scripts/qubes-x86-64.sh             | 4 ++--
 automation/scripts/xilinx-smoke-dom0-x86_64.sh | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qubes-x86-64.sh
index 2750d24eba17..b49a44c5b1ab 100755
--- a/automation/scripts/qubes-x86-64.sh
+++ b/automation/scripts/qubes-x86-64.sh
@@ -260,14 +260,14 @@ TFTP=/scratch/gitlab-runner/tftp
 CONTROLLER=control@thor.testnet
 
 echo "
-multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts
+multiboot2 (http)/gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts
 module2 (http)/gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen
 module2 --nounzip (http)/gitlab-ci/initrd-dom0
 " > $TFTP/grub.cfg
 
 echo "#!ipxe
 
-kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot $extra_xen_opts || reboot
+kernel /gitlab-ci/xen $CONSOLE_OPTS loglvl=all guest_loglvl=all dom0_mem=4G console_timestamps=boot watchdog $extra_xen_opts || reboot
 module /gitlab-ci/vmlinuz console=hvc0 root=/dev/ram0 earlyprintk=xen || reboot
 module /gitlab-ci/initrd-dom0 || reboot
 boot
diff --git a/automation/scripts/xilinx-smoke-dom0-x86_64.sh b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
index 6970a8658d5f..0ad8f658e396 100755
--- a/automation/scripts/xilinx-smoke-dom0-x86_64.sh
+++ b/automation/scripts/xilinx-smoke-dom0-x86_64.sh
@@ -15,7 +15,7 @@ WORKDIR="${PWD}"
 TEST="$1"
 PASS_MSG="Test passed: ${TEST}"
 XEN_CMD_DOM0="dom0=pvh dom0_max_vcpus=4 dom0_mem=4G"
-XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot"
+XEN_CMD_XEN="sched=null loglvl=all guest_loglvl=all console_timestamps=boot watchdog"
 XEN_CMD_EXTRA=""
 DOM0_CMD=""
 DOMU_CMD=""

base-commit: 97f9db488a48d5f7c41681ac3bde7047dcfca899
-- 
2.39.5


