Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 116BC447DB9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:20:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223197.385794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1kb-0003Ge-1Y; Mon, 08 Nov 2021 10:19:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223197.385794; Mon, 08 Nov 2021 10:19:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1ka-0003Er-Ub; Mon, 08 Nov 2021 10:19:40 +0000
Received: by outflank-mailman (input) for mailman id 223197;
 Mon, 08 Nov 2021 10:19:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk1kQ-0003ER-2Z
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:19:40 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b3b6381-407d-11ec-9787-a32c541c8605;
 Mon, 08 Nov 2021 11:19:28 +0100 (CET)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 295D81EC04E0;
 Mon,  8 Nov 2021 11:19:28 +0100 (CET)
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
X-Inumbo-ID: 5b3b6381-407d-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636366768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CDGB0dpLCqhyN2VLkOyFdq64uDUd6G/RUsDL3dC+Ipo=;
	b=OmXDZQiNXAykW6msgQxQV2D3jyNeh8L8Ur0LKSqcBbS8Z5Dq+lMoh+uc1KE9lZoNFhTNi5
	HSfl5kEDRsOkXKmO9qqEW67WUQUsv5GaQK9Erwx9IjY3o31Y8ehQnIfkizrSs0P3bzV/5j
	Fq9nLmulJEIgHjmCW/c8QaecUsrUi0U=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ayush Sawal <ayush.sawal@chelsio.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rohit Maheshwari <rohitm@chelsio.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
	alsa-devel@alsa-project.org,
	bcm-kernel-feedback-list@broadcom.com,
	intel-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-remoteproc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v0 00/42] notifiers: Return an error when callback is already registered
Date: Mon,  8 Nov 2021 11:19:24 +0100
Message-Id: <20211108101924.15759-1-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@suse.de>

Hi all,

this is a huge patchset for something which is really trivial - it
changes the notifier registration routines to return an error value
if a notifier callback is already present on the respective list of
callbacks. For more details scroll to the last patch.

Everything before it is converting the callers to check the return value
of the registration routines and issue a warning, instead of the WARN()
notifier_chain_register() does now.

Before the last patch has been applied, though, that checking is a
NOP which would make the application of those patches trivial - every
maintainer can pick a patch at her/his discretion - only the last one
enables the build warnings and that one will be queued only after the
preceding patches have all been merged so that there are no build
warnings.

Due to the sheer volume of the patches, I have addressed the respective
patch and the last one, which enables the warning, with addressees for
each maintained area so as not to spam people unnecessarily.

If people prefer I carry some through tip, instead, I'll gladly do so -
your call.

And, if you think the warning messages need to be more precise, feel
free to adjust them before committing.

Thanks!

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Ayush Sawal <ayush.sawal@chelsio.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rohit Maheshwari <rohitm@chelsio.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Vinay Kumar Yadav <vinay.yadav@chelsio.com> 
Cc: alsa-devel@alsa-project.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-edac@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-leds@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linux-pm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-remoteproc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-scsi@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: linux-um@lists.infradead.org
Cc: linux-usb@vger.kernel.org
Cc: linux-xtensa@linux-xtensa.org
Cc: netdev@vger.kernel.org
Cc: openipmi-developer@lists.sourceforge.net
Cc: rcu@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org

Borislav Petkov (42):
  x86: Check notifier registration return value
  xen/x86: Check notifier registration return value
  impi: Check notifier registration return value
  clk: renesas: Check notifier registration return value
  dca: Check notifier registration return value
  firmware: Check notifier registration return value
  drm/i915: Check notifier registration return value
  Drivers: hv: vmbus: Check notifier registration return value
  iio: proximity: cros_ec: Check notifier registration return value
  leds: trigger: Check notifier registration return value
  misc: Check notifier registration return value
  ethernet: chelsio: Check notifier registration return value
  power: reset: Check notifier registration return value
  remoteproc: Check notifier registration return value
  scsi: target: Check notifier registration return value
  USB: Check notifier registration return value
  drivers: video: Check notifier registration return value
  drivers/xen: Check notifier registration return value
  kernel/hung_task: Check notifier registration return value
  rcu: Check notifier registration return value
  tracing: Check notifier registration return value
  net: fib_notifier: Check notifier registration return value
  ASoC: soc-jack: Check notifier registration return value
  staging: olpc_dcon: Check notifier registration return value
  arch/um: Check notifier registration return value
  alpha: Check notifier registration return value
  bus: brcmstb_gisb: Check notifier registration return value
  soc: bcm: brcmstb: pm: pm-arm: Check notifier registration return
    value
  arm64: Check notifier registration return value
  soc/tegra: Check notifier registration return value
  parisc: Check notifier registration return value
  macintosh/adb: Check notifier registration return value
  mips: Check notifier registration return value
  powerpc: Check notifier registration return value
  sh: Check notifier registration return value
  s390: Check notifier registration return value
  sparc: Check notifier registration return value
  xtensa: Check notifier registration return value
  crypto: ccree - check notifier registration return value
  EDAC/altera: Check notifier registration return value
  power: supply: ab8500: Check notifier registration return value
  notifier: Return an error when callback is already registered

 arch/alpha/kernel/setup.c                     |  5 +--
 arch/arm64/kernel/setup.c                     |  6 ++--
 arch/mips/kernel/relocate.c                   |  6 ++--
 arch/mips/sgi-ip22/ip22-reset.c               |  4 ++-
 arch/mips/sgi-ip32/ip32-reset.c               |  4 ++-
 arch/parisc/kernel/pdc_chassis.c              |  5 +--
 arch/powerpc/kernel/setup-common.c            | 12 ++++---
 arch/s390/kernel/ipl.c                        |  4 ++-
 arch/s390/kvm/kvm-s390.c                      |  7 ++--
 arch/sh/kernel/cpu/sh4a/setup-sh7724.c        | 11 +++---
 arch/sparc/kernel/sstate.c                    |  6 ++--
 arch/um/drivers/mconsole_kern.c               |  6 ++--
 arch/um/kernel/um_arch.c                      |  5 +--
 arch/x86/kernel/cpu/mce/core.c                |  3 +-
 arch/x86/kernel/cpu/mce/dev-mcelog.c          |  3 +-
 arch/x86/kernel/setup.c                       |  7 ++--
 arch/x86/xen/enlighten.c                      |  4 ++-
 arch/xtensa/platforms/iss/setup.c             |  3 +-
 drivers/bus/brcmstb_gisb.c                    |  6 ++--
 drivers/char/ipmi/ipmi_msghandler.c           |  3 +-
 drivers/clk/renesas/clk-div6.c                |  4 ++-
 drivers/clk/renesas/rcar-cpg-lib.c            |  4 ++-
 drivers/crypto/ccree/cc_fips.c                |  4 ++-
 drivers/dca/dca-core.c                        |  3 +-
 drivers/edac/altera_edac.c                    |  6 ++--
 drivers/firmware/arm_scmi/notify.c            |  3 +-
 drivers/firmware/google/gsmi.c                |  6 ++--
 drivers/gpu/drm/i915/gvt/scheduler.c          |  6 ++--
 drivers/hv/vmbus_drv.c                        |  4 +--
 .../iio/proximity/cros_ec_mkbp_proximity.c    |  3 +-
 drivers/leds/trigger/ledtrig-activity.c       |  6 ++--
 drivers/leds/trigger/ledtrig-heartbeat.c      |  6 ++--
 drivers/leds/trigger/ledtrig-panic.c          |  4 +--
 drivers/macintosh/adbhid.c                    |  4 +--
 drivers/misc/ibmasm/heartbeat.c               |  3 +-
 drivers/misc/pvpanic/pvpanic.c                |  3 +-
 .../chelsio/inline_crypto/chtls/chtls_main.c  |  5 ++-
 drivers/parisc/power.c                        |  5 +--
 drivers/power/reset/ltc2952-poweroff.c        |  6 ++--
 drivers/power/supply/ab8500_charger.c         |  8 ++---
 drivers/remoteproc/qcom_common.c              |  3 +-
 drivers/remoteproc/qcom_sysmon.c              |  4 ++-
 drivers/remoteproc/remoteproc_core.c          |  4 ++-
 drivers/s390/char/con3215.c                   |  5 ++-
 drivers/s390/char/con3270.c                   |  5 ++-
 drivers/s390/char/sclp_con.c                  |  4 ++-
 drivers/s390/char/sclp_vt220.c                |  4 ++-
 drivers/s390/char/zcore.c                     |  4 ++-
 drivers/soc/bcm/brcmstb/pm/pm-arm.c           |  5 +--
 drivers/soc/tegra/ari-tegra186.c              |  7 ++--
 drivers/staging/olpc_dcon/olpc_dcon.c         |  4 ++-
 drivers/target/tcm_fc/tfc_conf.c              |  4 ++-
 drivers/usb/core/notify.c                     |  3 +-
 drivers/video/console/dummycon.c              |  3 +-
 drivers/video/fbdev/hyperv_fb.c               |  5 +--
 drivers/xen/manage.c                          |  3 +-
 drivers/xen/xenbus/xenbus_probe.c             |  8 +++--
 include/linux/notifier.h                      |  8 ++---
 kernel/hung_task.c                            |  3 +-
 kernel/notifier.c                             | 36 ++++++++++---------
 kernel/rcu/tree_stall.h                       |  4 ++-
 kernel/trace/trace.c                          |  4 +--
 net/core/fib_notifier.c                       |  4 ++-
 sound/soc/soc-jack.c                          |  3 +-
 64 files changed, 222 insertions(+), 118 deletions(-)

-- 
2.29.2


