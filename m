Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 264AB63EF41
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 12:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450497.707798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hZ7-00064W-S0; Thu, 01 Dec 2022 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450497.707798; Thu, 01 Dec 2022 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0hZ7-00062Z-PC; Thu, 01 Dec 2022 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 450497;
 Thu, 01 Dec 2022 11:08:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ED7C=37=chromium.org=ribalda@srs-se1.protection.inumbo.net>)
 id 1p0hQt-0004EZ-Mj
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 11:08:47 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 862ce7e7-7168-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 12:08:46 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id s12so1862600edd.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Dec 2022 03:08:46 -0800 (PST)
Received: from alco.roam.corp.google.com ([2620:0:1059:10:f554:724a:f89a:73db])
 by smtp.gmail.com with ESMTPSA id
 v17-20020a170906293100b0078e0973d1f5sm1663824ejd.0.2022.12.01.03.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Dec 2022 03:08:44 -0800 (PST)
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
X-Inumbo-ID: 862ce7e7-7168-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=lGm4cyBDbhcC+E+E+8rSuqE3igb1lprN1pN6/M3QLys=;
        b=ZRHyoajEwFC4By5LI1rVbOp/xLGzBq//9Xi/KMCz0lo8z9Pc1kxGrZQGSfdmpQmaMd
         1GnniREAshZoCU4tyHuy1piJbRVEDqwJVixje9ZJzJ77PtUXKFFljT/b8/IV0BWReOGd
         SqBdcc0wshVkJyGCE+uvwuRmeLcgRNVAq9pdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGm4cyBDbhcC+E+E+8rSuqE3igb1lprN1pN6/M3QLys=;
        b=VSr059CcQP5NrigepbWCFS2gM1X+4c6zceIkbfoAT+we4SCacKTmFeu8Vf+bpNicNt
         kDd8oLi/vkwILE4w7UoSfSFFlT+uPoeXYV8JWcERWVcaQDrA2YhGDf1EkmKW7+ZX52BJ
         miuPLhF9JeSQaPmuzjkvQKeab4WtKMoq1WfCFhVxScnWk9jbXUrrSbTNQZV63BeitaAx
         37ubVF/nJAf3Q3z2yw971Xu9D9sEf9P2cbOQce4GiGEGYBC0siSLG2xIj+hrxymudvIP
         UrIes3P76Rnbf4+Og4/yQEBNkY8/lPi0tuUsw6te8Z0C9e9un0vnozoKo+0MwRtaGC2W
         0rDA==
X-Gm-Message-State: ANoB5plqGK1TXOdgieHmkjDXM+awkkv1o3EK96WZZnnanpMWXJCVAcMB
	ZkLK82jWbuMmXt2p4bzFTXFNeg==
X-Google-Smtp-Source: AA0mqf5zzNn9de5BfFPh0J6RLCpw0dw9HFYWDLvw7kVxPfSHwhQH5HyYQ8cKCqwRv03JB5G51Q4CsA==
X-Received: by 2002:a05:6402:4516:b0:467:b88c:f3af with SMTP id ez22-20020a056402451600b00467b88cf3afmr43151776edb.24.1669892925587;
        Thu, 01 Dec 2022 03:08:45 -0800 (PST)
Subject:
 [PATCH v8 0/3] ASoC: SOF: Fix deadlock when shutdown a frozen userspace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSLiGMC/3XPzWrDMAwA4FcpPs8jln/b095j7CA7SmNoHbDXwF
 by7tN2HDY6CAk+/TxFo5qpicvpKSrtueWtcBFeTiKtWK4k88y1gAlAKfCylVkuleibpCJSRgMEDU
 4wiNhIxoolrUzK43bj5prb51a//hbsitN7d9au5CStN06hdo4SvKW1bvf8uL9u9So+eNIOYw2s54
 AGLOHZOd3Reqw1awSa0WuVUJmONmNtfi9n50z0C2DsaDvWlrWhmSNOIeLU0W6sHWtN58lavTiDtq
 P9WHvW3Es2wMIP/P/7OI4f/KJYEyACAAA=
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 01 Dec 2022 12:08:20 +0100
Message-Id: <20221127-snd-freeze-v8-0-3bc02d09f2ce@chromium.org>
To: Juergen Gross <jgross@suse.com>, Mark Brown <broonie@kernel.org>,
 Chromeos Kdump <chromeos-kdump@google.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Len Brown <len.brown@intel.com>, Ard Biesheuvel <ardb@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Eric Biederman <ebiederm@xmission.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Joel Fernandes <joel@joelfernandes.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Pavel Machek <pavel@ucw.cz>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ingo Molnar <mingo@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Dexuan Cui <decui@microsoft.com>, Takashi Iwai <tiwai@suse.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org
Cc: kexec@lists.infradead.org, alsa-devel@alsa-project.org,
 Ricardo Ribalda <ribalda@chromium.org>, stable@vger.kernel.org,
 sound-open-firmware@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-hyperv@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-efi@vger.kernel.org, xen-devel@lists.xenproject.org
X-Mailer: b4 0.11.0-dev-696ae
X-Developer-Signature: v=1; a=openpgp-sha256; l=4368; i=ribalda@chromium.org;
 h=from:subject:message-id; bh=Rud9IUdbPKIRkkkE6G4uaTZbcmuiccX+lZS5manvrHM=;
 b=owEBbQKS/ZANAwAKAdE30T7POsSIAcsmYgBjiIsuiQZl7CGQiKdplkqC0gHCzURIkJXoavQjeFfS
 sEPmEE6JAjMEAAEKAB0WIQREDzjr+/4oCDLSsx7RN9E+zzrEiAUCY4iLLgAKCRDRN9E+zzrEiIaWD/
 9SLVqH6ELG3Nj4DmzbcOc+YbsFvyvs/zS4DGTKOm4a1dsJ6EojOhIs9fpuGLT8o3p3+9VsWHC0In/y
 k6Iuhsi7YI2K91jtIDrxVIf4dUlmsglcYsc4qe5s+tqH0tWT7y7OlpaNM4+W605lNX2FMTKjGgKfHe
 jHVMfBfB0ebLbt7OhLXieR55yYucbmtChn3v49MHNc8u6oY5Zy9bC4bNkMJDJtd+ce/qqb8Bp4QeMA
 rOQjtJMeieO5qtXaDb8EfsUc4gu1PYL42HfoTN2sr18FL9SKNzVejr4Jq0RhUCNg/rf+Oqoqn7EEmV
 sjud45VDHbBcOD8OQJa/GQAuRwLJQYje6ycI76nIB/gnEiR08+uB3nK3tlAkKMMWbb4wS5vuWnCX2U
 3YF/ZK8xWASICm+G0JmfVBdajYCKUxaboXr7DPbP7oCUFU3bLEQqtBpNgeyfU46D4Q0gnTD8/frbVt
 UgY++3lpoKK+Pxg3zbTIKOvN4fumazPJdSB+a586EbWiw7LhOtWns3EsiPZqFybXoW0BptbVq0Aqan
 TLmIsVZkJSOl85YER762XGxsWyl9LeYioTLO/h4ozDLEbfseFlKxfz67nGgS7NBgsHBJDuc7Pu2/XP
 dfaTOEkimDz87TdwqvVEa5v67H9Ve4p2lif6Z3g7ymf71PA6yB0dtq2z/ZqQ==
X-Developer-Key: i=ribalda@chromium.org; a=openpgp;
 fpr=9EC3BB66E2FC129A6F90B39556A0D81F9F782DA9

Since: 83bfc7e793b5 ("ASoC: SOF: core: unregister clients and machine drivers in .shutdown")
we wait for all the workloads to be completed during shutdown. This was done to 
avoid a stall once the device is started again.

Unfortunately this has the side effect of stalling kexec(), if the userspace
is frozen. Let's handle that case.

To: Joel Fernandes <joel@joelfernandes.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Eric Biederman <ebiederm@xmission.com>
To: Chromeos Kdump <chromeos-kdump@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
To: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "K. Y. Srinivasan" <kys@microsoft.com>
To: Haiyang Zhang <haiyangz@microsoft.com>
To: Wei Liu <wei.liu@kernel.org>
To: Dexuan Cui <decui@microsoft.com>
To: Thomas Gleixner <tglx@linutronix.de>
To: Ingo Molnar <mingo@redhat.com>
To: Borislav Petkov <bp@alien8.de>
To: Dave Hansen <dave.hansen@linux.intel.com>
To: x86@kernel.org
To: "H. Peter Anvin" <hpa@zytor.com>
To: Juergen Gross <jgross@suse.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: Ard Biesheuvel <ardb@kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
To: Len Brown <len.brown@intel.com>
Cc: stable@vger.kernel.org
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-hyperv@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: linux-efi@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v8:
- Wrap pm_freezing and kexec_inprogress in functions.
- Do not run snd_sof_machine_unregister(sdev, pdata) during kexec (Thanks Kai).
- Link to v7: https://lore.kernel.org/r/20221127-snd-freeze-v7-0-127c582f1ca4@chromium.org

Changes in v7:
- Fix commit message (Thanks Pierre-Louis).
- Link to v6: https://lore.kernel.org/r/20221127-snd-freeze-v6-0-3e90553f64a5@chromium.org

Changes in v6:
- Check if we are in kexec with the userspace frozen.
- Link to v5: https://lore.kernel.org/r/20221127-snd-freeze-v5-0-4ededeb08ba0@chromium.org

Changes in v5:
- Edit subject prefix.
- Link to v4: https://lore.kernel.org/r/20221127-snd-freeze-v4-0-51ca64b7f2ab@chromium.org

Changes in v4:
- Do not call snd_sof_machine_unregister from shutdown.
- Link to v3: https://lore.kernel.org/r/20221127-snd-freeze-v3-0-a2eda731ca14@chromium.org

Changes in v3:
- Wrap pm_freezing in a function.
- Link to v2: https://lore.kernel.org/r/20221127-snd-freeze-v2-0-d8a425ea9663@chromium.org

Changes in v2:
- Only use pm_freezing if CONFIG_FREEZER .
- Link to v1: https://lore.kernel.org/r/20221127-snd-freeze-v1-0-57461a366ec2@chromium.org

---
Ricardo Ribalda (3):
      kexec: Refactor kexec_in_progress into a function
      freezer: refactor pm_freezing into a function.
      ASoC: SOF: Fix deadlock when shutdown a frozen userspace

 arch/powerpc/platforms/pseries/vio.c |  2 +-
 arch/x86/kernel/cpu/mshyperv.c       |  6 +++---
 arch/x86/xen/enlighten_hvm.c         |  2 +-
 drivers/firmware/efi/efi.c           |  2 +-
 drivers/pci/pci-driver.c             |  2 +-
 include/linux/freezer.h              |  3 ++-
 include/linux/kexec.h                |  5 ++---
 kernel/freezer.c                     |  3 +--
 kernel/kexec_core.c                  | 12 ++++++++++--
 kernel/power/process.c               | 24 ++++++++++++++++++++----
 sound/soc/sof/core.c                 |  9 ++++++---
 11 files changed, 48 insertions(+), 22 deletions(-)
---
base-commit: 4312098baf37ee17a8350725e6e0d0e8590252d4
change-id: 20221127-snd-freeze-1ee143228326

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

