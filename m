Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D7447DF9
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:29:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223205.385804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1tT-0004lK-UL; Mon, 08 Nov 2021 10:28:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223205.385804; Mon, 08 Nov 2021 10:28:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1tT-0004jD-RQ; Mon, 08 Nov 2021 10:28:51 +0000
Received: by outflank-mailman (input) for mailman id 223205;
 Mon, 08 Nov 2021 10:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B9hq=P3=suse.de=tzimmermann@srs-se1.protection.inumbo.net>)
 id 1mk1tS-0004iw-Ir
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:28:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8817c81-407e-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 11:28:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7500A21B01;
 Mon,  8 Nov 2021 10:28:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1D7FC13B37;
 Mon,  8 Nov 2021 10:28:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y+crBuD7iGHPHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 10:28:48 +0000
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
X-Inumbo-ID: a8817c81-407e-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1636367328; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/iioiyH4Q966bbevxkXK56U3XXUi7baEWWvNDv45N6I=;
	b=y2mnRHjthYiK1CtCkk4q71zzlkNuHVsebrPumY2Fu7DDVSrRnyO5GaTNtLwTi2xWYb/BSb
	Rn69kVxMfbCSXHyInCxS9JxJMQIiUWfoMW5FhckULdu7fjBZqCfQJ/lUzBzsWz9gwqMxp3
	lTFCBh6nknNSMYVqqqvdqFAhESuSw4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1636367328;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=/iioiyH4Q966bbevxkXK56U3XXUi7baEWWvNDv45N6I=;
	b=EwpwY9IHQCBU7TChVkU3KtD5D8ovEskvbAZPMYTuu+tpo3oPg6W7WVj2uxGV29yONBwiA5
	uYgsfCzhBUU0XvBw==
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@linux.ie,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	inki.dae@samsung.com,
	jy0922.shim@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	krzysztof.kozlowski@canonical.com,
	oleksandr_andrushchenko@epam.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RESEND PATCH 0/3] drm/{exynos,xen}: Implement gem_prime_mmap with drm_gem_prime_mmap()
Date: Mon,  8 Nov 2021 11:28:43 +0100
Message-Id: <20211108102846.309-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(Resending the patchset from [1]. Most drivers have already been updated and
only two drivers are left.)

Replace all remaining implementations of struct drm_driver.gem_prime_mmap
with use drm_gem_prime_mmap(). For each affected driver, put the mmap code
into struct drm_gem_object_funcs.mmap. With the latter change in place,
create struct file_operations via DEFINE_DRM_GEM_FOPS().

As next steps, drivers can be converted to use drm_gem_prime_mmap() and
drm_gem_mmap() (e.g., Tegra). The default mmap code in drm_gem_prime_mmap()
can be pushed into affected drivers or a helper function. The gem_prime_mmap
hook can probably be removed at some point.

[1] https://lore.kernel.org/dri-devel/20210609112012.10019-1-tzimmermann@suse.de/

Thomas Zimmermann (3):
  drm/exynox: Implement mmap as GEM object function
  drm/xen: Implement mmap as GEM object function
  drm: Update documentation and TODO of gem_prime_mmap hook

 Documentation/gpu/todo.rst                |  11 ---
 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |  20 +---
 drivers/gpu/drm/exynos/exynos_drm_gem.c   |  43 ++-------
 drivers/gpu/drm/exynos/exynos_drm_gem.h   |   5 -
 drivers/gpu/drm/xen/xen_drm_front.c       |  16 +---
 drivers/gpu/drm/xen/xen_drm_front_gem.c   | 108 +++++++++-------------
 drivers/gpu/drm/xen/xen_drm_front_gem.h   |   7 --
 include/drm/drm_drv.h                     |  11 ++-
 9 files changed, 64 insertions(+), 170 deletions(-)


base-commit: 215295e7b0a3deb2015c6d6b343b319e4f6d9a1d
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
--
2.33.1


