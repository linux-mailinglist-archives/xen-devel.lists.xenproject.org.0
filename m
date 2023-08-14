Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA8977B7E7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 13:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583569.913820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWAl-0003da-Nf; Mon, 14 Aug 2023 11:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583569.913820; Mon, 14 Aug 2023 11:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVWAl-0003al-Jq; Mon, 14 Aug 2023 11:55:47 +0000
Received: by outflank-mailman (input) for mailman id 583569;
 Mon, 14 Aug 2023 11:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6hq=D7=suse.de=tiwai@srs-se1.protection.inumbo.net>)
 id 1qVWAj-0003af-Px
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 11:55:45 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e0a2445-3a99-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 13:55:41 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 17ED721995;
 Mon, 14 Aug 2023 11:55:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A12A1138EE;
 Mon, 14 Aug 2023 11:55:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id POobJjwW2mRnMAAAMHmgww
 (envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:40 +0000
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
X-Inumbo-ID: 7e0a2445-3a99-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1692014141; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XQeGJoZiwS+WxYkVBoqLRdA0cljITB4QdfMyE6lbFFs=;
	b=kFp/+CRCPGtee7m/HHJG6RlkE9iBkGLiItLiaZXJaSHCOFJVefxmV49Io8esHULi2dSTmx
	dkZvny408ZbpCYDNUxDK9iduT8PasgOnmWZQrRNzDBf6v/T2EKwgDtULSDfIPCePUN7veC
	W7/6+AabVtw/UyAbvOPTJ0Q5KJVfFP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014141;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=XQeGJoZiwS+WxYkVBoqLRdA0cljITB4QdfMyE6lbFFs=;
	b=J0FDoDKgkoTfK6W8B1m8B3Sq8+mKHrYih3FmIaCWeumyUMJoNkdmZeZPdu1jqCS3GM1WoU
	/fQKa10s4LX6IjCQ==
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-media@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 00/25] ALSA: Generic PCM copy ops using iov_iter
Date: Mon, 14 Aug 2023 13:54:58 +0200
Message-Id: <20230814115523.15279-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

this is a revised patch set for cleaning up the PCM copy ops using
iov_iter to deal with kernel / user-space pointers consistently.

The previous patch set was based on sockptr_t:
  https://lore.kernel.org/r/20230731154718.31048-1-tiwai@suse.de
But this approach was NAK'ed as iov_iter is a preferred way for
achieving the purpose:
  https://lore.kernel.org/r/87edkce118.wl-tiwai@suse.de

The patch set starts with the missing export of import_ubuf()
function, followed by the new copy_ops using iov_iter, extensions of
some helpers and replacements of the existing code.  It resulted in a
good amount of code reduction.


Takashi

===

Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrey Utkin <andrey_utkin@fastmail.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Banajit Goswami <bgoswami@quicinc.com>
Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: Mark Brown <broonie@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: xen-devel@lists.xenproject.org

===

Takashi Iwai (25):
  iov_iter: Export import_ubuf()
  ALSA: pcm: Add copy ops with iov_iter
  ALSA: core: Add memory copy helpers between iov_iter and iomem
  ALSA: dummy: Convert to generic PCM copy ops
  ALSA: gus: Convert to generic PCM copy ops
  ALSA: emu8000: Convert to generic PCM copy ops
  ALSA: es1938: Convert to generic PCM copy ops
  ALSA: korg1212: Convert to generic PCM copy ops
  ALSA: nm256: Convert to generic PCM copy ops
  ALSA: rme32: Convert to generic PCM copy ops
  ALSA: rme96: Convert to generic PCM copy ops
  ALSA: hdsp: Convert to generic PCM copy ops
  ALSA: rme9652: Convert to generic PCM copy ops
  ALSA: sh: Convert to generic PCM copy ops
  ALSA: xen: Convert to generic PCM copy ops
  ALSA: pcmtest: Update comment about PCM copy ops
  media: solo6x10: Convert to generic PCM copy ops
  ASoC: component: Add generic PCM copy ops
  ASoC: mediatek: Convert to generic PCM copy ops
  ASoC: qcom: Convert to generic PCM copy ops
  ASoC: dmaengine: Convert to generic PCM copy ops
  ASoC: dmaengine: Use iov_iter for process callback, too
  ALSA: doc: Update description for the new PCM copy ops
  ASoC: pcm: Drop obsoleted PCM copy_user ops
  ALSA: pcm: Drop obsoleted PCM copy_user and copy_kernel ops

 .../kernel-api/writing-an-alsa-driver.rst     | 58 ++++-------
 drivers/media/pci/solo6x10/solo6x10-g723.c    | 38 +-------
 include/sound/dmaengine_pcm.h                 |  2 +-
 include/sound/pcm.h                           | 13 ++-
 include/sound/soc-component.h                 | 14 +--
 lib/iov_iter.c                                |  1 +
 sound/core/memory.c                           | 56 +++++++++--
 sound/core/pcm_lib.c                          | 95 ++++++++++---------
 sound/core/pcm_native.c                       |  2 +-
 sound/drivers/dummy.c                         | 12 +--
 sound/drivers/pcmtest.c                       |  2 +-
 sound/isa/gus/gus_pcm.c                       | 23 +----
 sound/isa/sb/emu8000_pcm.c                    | 74 ++++-----------
 sound/pci/es1938.c                            | 30 +-----
 sound/pci/korg1212/korg1212.c                 | 50 +++-------
 sound/pci/nm256/nm256.c                       | 42 ++------
 sound/pci/rme32.c                             | 50 +++-------
 sound/pci/rme96.c                             | 42 ++------
 sound/pci/rme9652/hdsp.c                      | 42 ++------
 sound/pci/rme9652/rme9652.c                   | 46 ++-------
 sound/sh/sh_dac_audio.c                       | 25 +----
 sound/soc/atmel/mchp-pdmc.c                   |  2 +-
 sound/soc/mediatek/common/mtk-btcvsd.c        | 23 ++---
 sound/soc/qcom/lpass-platform.c               | 13 +--
 sound/soc/soc-component.c                     | 10 +-
 sound/soc/soc-generic-dmaengine-pcm.c         | 18 ++--
 sound/soc/soc-pcm.c                           |  4 +-
 sound/soc/stm/stm32_sai_sub.c                 |  2 +-
 sound/xen/xen_snd_front_alsa.c                | 55 ++---------
 29 files changed, 263 insertions(+), 581 deletions(-)

-- 
2.35.3


