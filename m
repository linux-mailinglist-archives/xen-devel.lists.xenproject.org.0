Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FB7AD6416
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 01:59:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012240.1390758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPVLU-0005BG-Am; Wed, 11 Jun 2025 23:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012240.1390758; Wed, 11 Jun 2025 23:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPVLU-00058c-82; Wed, 11 Jun 2025 23:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1012240;
 Wed, 11 Jun 2025 23:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6lgg=Y2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uPVLS-00058W-Pp
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 23:59:02 +0000
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [2a00:1450:4864:20::342])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09060573-4720-11f0-a307-13f23c93f187;
 Thu, 12 Jun 2025 01:58:56 +0200 (CEST)
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4531e146a24so2080645e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Jun 2025 16:58:56 -0700 (PDT)
Received: from localhost.localdomain ([90.250.112.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4532e184724sm3566455e9.39.2025.06.11.16.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 16:58:55 -0700 (PDT)
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
X-Inumbo-ID: 09060573-4720-11f0-a307-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1749686336; x=1750291136; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h6MWbAKcuk3fHPEz4Zkywxz3C8dCusIunQU56r3S87Q=;
        b=hIMCFokR6XhjjAW1C/5Z9qeG7A+XNyknFNVezULULgK6iVcbNKN54w6ICj4U80SbKX
         aoh3TahK726BK/V5pOrdSA992bqsbnI4iaDFLa7rKD60ehmDfigYh4kXvfgtxHJiSGGD
         8svIxrNle3pzzeVqVUwHeEvLvbuPqbt7dZx9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749686336; x=1750291136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6MWbAKcuk3fHPEz4Zkywxz3C8dCusIunQU56r3S87Q=;
        b=WCkCAVi6QWgny7L9cyc5s6BllSLQ6WIG5kY8NjUpoDpuubXInvOwBDAMH26Z+aODzH
         OpylcN7r0PLSTqZatNWax6bdLMcJ4IYMOJWuGDkBIvkGgodyBpd24bEC59PLjhH7G1uT
         Mgk/7hMChJaIYZCUEi1Pb46YnXjmXbCgIU4RMCwwFzU2CdKtKzG/zagBR4D++PB7qiRg
         2h0dmwRUvD8eMvcFuLQFjVT5msRPY3UZPTqA9+zMoV8Ot5dKEwM9QkwpVd5wn242gSEI
         0s4Pgg6710QKtGF87Z8Byv5R4esoj+DBVc2rHu/Zg1DhIvczHN22ubSO02gEknNd+3pw
         49/g==
X-Gm-Message-State: AOJu0YzGgfRKJ+EiiVGjXqFpqMFTxv1Vc3GBfkyU+8clmg4zuKV5wO53
	EAXXRQgJxd5wPK42PSzvHP2KKX3vBPWeRRFenQMqviEjq8AGO4diLqN/Zo9i5KRZwS51P7R7AXa
	D4xkcYqPmpNWM
X-Gm-Gg: ASbGncuBq5EkFmbI9pNstp+SYRfIUST4k5wvjktX85WXKSVMxSU62+V30VIIS5WiIxt
	W4TbJZ7aaNuV1Qlm5sTK/X3HqFSyHVm8ergY87YAT5gItdKSsHbfBOUshKdKwP5VMzFXpa55PIa
	MPDLuE9SE958AH1VOMlGmOn0sxMmyTHClSQ+ohLfh5WExJ9ZA1EWl5AN3cb2x2/L/oINIch88MC
	Zq0PiNMXvldTG/qIUbWtDRglUsMLZ7udnZ0OqOSixOBABmNfSuMkLVqz1+cLSuGKqeehHcN4tsi
	ZT70LDIu2sZbR5txzDbw8h7o4epwrVcqLLUOhTbVts7icdjaNXrUyVegnAe2y83BqjoZJaCxttI
	5de4Aqso=
X-Google-Smtp-Source: AGHT+IHGSsasnW3ayYfKHZVjqaJI0vtLfeRe1eWojD+3nXo40OV8Njzni2DEnjyp2Qvg01fCdmNbeg==
X-Received: by 2002:a05:600c:6612:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-4532487b346mr54028405e9.14.1749686335749;
        Wed, 11 Jun 2025 16:58:55 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	security@xen.org,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Trammell Hudson <hudson@trmm.net>,
	Ross Lagerwall <ross.lagerwall@cloud.com>,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Kevin Lampis <kevin.lampis@cloud.com>
Subject: [PATCH] docs: UEFI Secure Boot security policy
Date: Thu, 12 Jun 2025 00:58:51 +0100
Message-Id: <20250611235851.167385-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Written to be solution and deployment neutral in order to focus on the
technology itself.  This policy is intended to work as well for UKI as for the
"classic server setup" approach.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: security@xen.org
CC: Juergen Gross <jgross@suse.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Trammell Hudson <hudson@trmm.net>
CC: Ross Lagerwall <ross.lagerwall@cloud.com>
CC: Frediano Ziglio <frediano.ziglio@cloud.com>
CC: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
CC: Kevin Lampis <kevin.lampis@cloud.com>

A rendered version is available at:
  https://andrewcoop-xen.readthedocs.io/en/docs-secureboot/admin-guide/uefi-secure-boot.html

Obviously RFC at this point.  It's worth saying that XenServer is intending to
use Shim and get a signature from Microsoft, retaining all exiting features
such as Livepatching and Kexec crash reporting.

This trails off into more TODOs towards the end.  Individual tasks should
expand on the start made and resulting conversation from this thread.  As a
reminder, the target audience for this doc is an administrator running a Xen
deployment, but who is not necesserily a developer.

Several things are hard to express and want further discussion.  Suggestions
welcome:

1) Content of CONFIG_CMDLINE and the various CONFIG_*_DEFAULT options.  Xen is
not going to be issuing XSAs for "downstream chose an unsafe configuration,
then signed and deployed the result", yet Xen probably should be on the hook
for bad "default ..." settings in Kconfig.

2) Pre-boot DMA Protection.  Microsoft consider this a platform feature
requiring OEM enablement, and do not consider its absence to be a Secure Boot
vulnerability.  But, it is less clear what the policy ought to be for Xen
booting on a capable system and failing to do a correct live-handover of the
IOMMU across ExitBootServices().

3) The AMD microcode signature vulnerability.  While it's not Xen's bug per
say, it's clearly a Secure Boot bypass because we do offer microcode loading
capabilties to userspace, and malicious userspace can load an unauthorised
microcode which allows them to read/write physical memory and bypass further
signature checks.

4) Userspace Hypercalls.  To anyone who isn't already aware, /dev/xen/privcmd
in the various Unicies is a giant priv-esc hole, as root userspace can
e.g. issue direct memory hypercalls behind the back of an (intentionally)
oblivious kernel, and cannot be handwaved away as "it's fine because it's
root" under Secure Boot.  It's not a Xen vuln (Xen *does* audit pointers in
guest hypercalls), but it is a guest kernel vuln because of failing to
correctly audit hypercall parameters.  However, it does require substantial
changes in Xen in order to allow guest kernels to do something half-way safe.
---
 docs/admin-guide/index.rst            |   1 +
 docs/admin-guide/uefi-secure-boot.rst | 134 ++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 docs/admin-guide/uefi-secure-boot.rst

diff --git a/docs/admin-guide/index.rst b/docs/admin-guide/index.rst
index 54e6f65de347..e7895ee95001 100644
--- a/docs/admin-guide/index.rst
+++ b/docs/admin-guide/index.rst
@@ -5,4 +5,5 @@ Admin Guide
 
 .. toctree::
    introduction
+   uefi-secure-boot
    microcode-loading
diff --git a/docs/admin-guide/uefi-secure-boot.rst b/docs/admin-guide/uefi-secure-boot.rst
new file mode 100644
index 000000000000..0e0f50143892
--- /dev/null
+++ b/docs/admin-guide/uefi-secure-boot.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+UEFI Secure Boot
+================
+
+UEFI Secure Boot is a verification mechanism, intended to ensure that only
+code trusted by the platform can run.  This is to prevent malicious code from
+hijacking the system.  Secure Boot requires that all privileged code be
+signed, and that there is a trust relationship with the platform; i.e. code
+which is not signed by a key enrolled in platform must not run privileged.
+
+Within the Xen architecture, Xen, the :term:`control domain` and
+:term:`hardware domain` share responsibility for running and administering the
+platform.  This makes their kernels privileged as far as Secure Boot is
+concerned.
+
+When Secure Boot is active in the platform, privileged code is required to not
+run any untrusted code (i.e. not run any code for which there is not a good
+signature), and is required not to allow this restriction to be bypassed
+(e.g. by command line request).
+
+
+Support in Xen
+--------------
+
+There are multiple ways to achieve this security goal, with differing
+tradeoffs for the eventual system.
+
+On one end of the spectrum is the Unified Kernel Image.  e.g. Xen is bundled
+with the dom0 kernel and init-ramdisk, with an embedded command line, and with
+livepatching and kexec compiled out, and suitably signed.  The signature is
+checked by the bootloader and, as this covers all the privileged code, Xen
+doesn't need to perform further checks itself.
+
+On the other end of the spectrum is maintaining the features of existing
+deployments.  e.g. Xen needs signature checking capabilities for the dom0
+kernel, livepatches and kexec kernels, and needs to allow the use of safe
+command line options while disallowing unsafe ones.
+
+It is important to remember that Xen is one piece of the larger platform,
+where every piece depends on the correct functioning of all earlier pieces.  A
+product supporting Secure Boot requires a holistic approach involving all
+components in the system.  It is not sufficient to consider Xen in isolation.
+
+.. TODO: Move "In Progress" tasks here as they become ready
+
+Security Scope
+--------------
+
+Vulnerabilities impacting Secure Boot require a fixed component to be produced
+and distributed, the vulnerable component to be revoked, and the revocation
+distributed to platforms.
+
+The following principles and guidelines indicate where Secure Boot differs
+from more traditional security models, and the situations in which extra
+remediation may be necessary.
+
+Principles
+^^^^^^^^^^
+
+ * Privileged code shall include Xen and the kernel(s) of the control and
+   hardware domain (both, if they're split).  While there is a privilege split
+   here in Xen's regular security model, they are equal from Secure Boot's
+   point of view.
+
+ * Root or ADMIN in userspace is unprivileged from Secure Boot's point of
+   view, and must not be able to alter the enforcement policy or load unsigned
+   code even by e.g. editing a configuration file and rebooting.
+
+Within Scope
+^^^^^^^^^^^^
+
+The following types of issue require remediation and revocation of vulnerable
+binaries.
+
+ * Any failure to apply enforcements even against traditionally-privileged
+   userspace, including failure to authenticate new code to run and failure to
+   handle revocations properly.
+
+ * Any Out-of-Bounds write capable of altering the enforcement policy, or
+   capable of bypassing enforcement, e.g. by corrupting the running code.
+
+Out of Scope
+^^^^^^^^^^^^
+
+While typically a security issue in their own rights, these issues do not
+constitute a Secure Boot vulnerability, and do not require special
+remediation.
+
+ * Denial of Service vulnerabilities.
+
+ * Out-of-Bounds reads.
+
+The Xen Security Team will endeavour to produce XSAs for all violations of
+this security policy, including identifying them specifically as requiring
+further remediation by downstreams.
+
+
+In Progress
+-----------
+
+.. warning::
+
+   The following work is still in progress.  It is provisional, and not
+   security supported yet.
+
+
+Secure Boot Advanced Targeting
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+SBAT is a recovation scheme for Secure Boot enabled components, using a
+generation based scheme.  See `Shim SBAT.md
+<https://github.com/rhboot/shim/blob/main/SBAT.md>`_ for full details.
+
+Upstream Xen provides the infrastructure to embed SBAT metadata in
+``xen.efi``, but does not maintain a generation number itself.  Downstreams
+are expected to maintain their own generation numbers.
+
+
+Lockdown Mode
+^^^^^^^^^^^^^
+
+A mode which causes the enforcement of the properties necessary to conform to
+the Secure Boot specification.  Lockdown Mode is forced active when Secure
+Boot is active in the platform, but may be activated independently too for
+development purposes with the ``lockdown`` command line option.
+
+TODO
+^^^^
+
+ * Command Line
+ * Livepatching
+ * Kexec
+ * Userspace hypercalls
-- 
2.39.5


