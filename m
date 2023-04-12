Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC26DFE01
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 20:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520311.807758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYs-0001sv-WF; Wed, 12 Apr 2023 18:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520311.807758; Wed, 12 Apr 2023 18:51:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmfYs-0001qZ-Sw; Wed, 12 Apr 2023 18:51:18 +0000
Received: by outflank-mailman (input) for mailman id 520311;
 Wed, 12 Apr 2023 18:51:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LfV=AD=casper.srs.infradead.org=BATV+9719990f4703cc1bc73b+7171+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1pmfYr-0001qS-9T
 for xen-devel@lists.xenproject.org; Wed, 12 Apr 2023 18:51:17 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00c3d2ca-d963-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 20:51:16 +0200 (CEST)
Received: from [2001:8b0:10b:5::ebe] (helo=i7.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pmfYf-0077lB-4g; Wed, 12 Apr 2023 18:51:05 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1pmfYe-001r1B-1f; Wed, 12 Apr 2023 19:51:04 +0100
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
X-Inumbo-ID: 00c3d2ca-d963-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=FAopztqETbo2fPeQeCNjHsbWvQfvN+qB27Usma2Ee8w=; b=j2olmn1su4XXnixX5a0dl5WOQs
	tGYDDng0Lu+7HnGPetpa5EKtx3Lh/D8nFMhXglOuKJzqlsQwOBDoQXWNtMljZQblzaKOV87EDsLRZ
	pKAmiO3JtQ1YIlqJfjTzOZJaXMkA3Nl6WPyaJbSPv7KJzgTV/r5skMbPF4geX7HCxRpVQQGcyuob5
	qZVUs4cPDm0csrie7Ly5YZ8Zxr7tQbe/0n/V2YJDDMijpRdLW9YQCRiOI/yknWTPT3OPM1/KBR/r7
	4gA+a3Oju3jyc4FeBjWcLFL9ogJsiMqaX7dvj6CqYVHCf7rGfp9punMadb1R04bsjxcg2Z8OxJDKY
	NA37yTRg==;
From: David Woodhouse <dwmw2@infradead.org>
To: qemu-devel@nongnu.org
Cc: no Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH for-8.0 0/5] Xen emulation build/Coverity fixes
Date: Wed, 12 Apr 2023 19:50:57 +0100
Message-Id: <20230412185102.441523-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Some Coverity fixes and minor cleanups. And most notably, dropping
support for Xen libraries older than 4.7.1.

I believe there are two issues that remain to be fixed. The x32 build
fails, and I've seen patches which attempt to detect x32 and disable
the Xen emulation. Along with assertions that we just shouldn't care.
I don't have a strong opinion either way but it seems to be in hand.

The other is the question of what Xen *actually* does if you try to
unmap an IRQ_MSI_EMU PIRQ. I don't think Linux guests try that, and
I'm fairly sure Windows doesn't even use MSI→PIRQ mappings in the
first place, and I doubt any other guests care either. I'd like to
establish the 'correct' behaviour and implement it, ideally before
the 8.0 release, but it's going to take me a few days more.

David Woodhouse (5):
      hw/xen: Simplify emulated Xen platform init
      hw/xen: Fix memory leak in libxenstore_open() for Xen
      xen: Drop support for Xen versions below 4.7.1
      hw/xen: Fix double-free in xen_console store_con_info()
      hw/xen: Fix broken check for invalid state in xs_be_open()

 hw/char/xen_console.c       |  13 ++----
 hw/i386/kvm/xen_evtchn.c    |  40 ++++++++---------
 hw/i386/kvm/xen_evtchn.h    |   3 +-
 hw/i386/kvm/xen_xenstore.c  |   2 +-
 hw/i386/pc.c                |  13 ++----
 hw/xen/xen-operations.c     |  59 +-----------------------
 include/hw/xen/xen_native.h | 107 +-------------------------------------------
 meson.build                 |   5 +--
 scripts/xen-detect.c        |  60 -------------------------
 9 files changed, 33 insertions(+), 269 deletions(-)




