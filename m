Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5912A708304
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 15:43:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536357.834623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdug-0007E7-8o; Thu, 18 May 2023 13:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536357.834623; Thu, 18 May 2023 13:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzdug-00076t-0k; Thu, 18 May 2023 13:43:26 +0000
Received: by outflank-mailman (input) for mailman id 536357;
 Thu, 18 May 2023 13:43:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cezo=BH=bombadil.srs.infradead.org=BATV+e1e315a83c1522261844+7207+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1pzdue-0006XN-Oo
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 13:43:24 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f361b9a3-f581-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 15:43:21 +0200 (CEST)
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduC-00D6Qd-2E; Thu, 18 May 2023 13:42:57 +0000
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
X-Inumbo-ID: f361b9a3-f581-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=piFrG5IdL4hzL74U9vzU8Q8FkrcebDa8Lvd7CJSzX1k=; b=CsnQ9kgCBYwe6gnaRylmDTM7Wg
	VjmAGMjJNouFmojoa2PViZy7KmCYkXfDItlxSiGdMRAKa4u6bzwnXH4xPbITOvKi46E/e8j1923vR
	u9Qj20fH+4Jugzi8umtd5H2NCKBNNKBIBV0dxSh72+mq7t83yJrzFx7FLxqhbec1O5OZi/yVN98fM
	bMfK/BLvhmvFSMgRRzB1zl6hg7RjhlcD4Ba8FO3xlDIUmySBgiGGVXbnu2ZFgjv2AQpplWQ2Swsa/
	jUTX+NHAV9OEu62r3wgbLMxWNseWs9tNZ5xv/HXPufF4KzJy/mSF0tCwCSPpD5y/XE2Ohl7NFw+0f
	4i0qXJRg==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: unexport swiotlb_active
Date: Thu, 18 May 2023 15:42:49 +0200
Message-Id: <20230518134253.909623-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this little series removes the last swiotlb API exposed to modules.

Diffstat:
 arch/x86/include/asm/xen/swiotlb-xen.h |    6 ------
 arch/x86/kernel/pci-dma.c              |   28 ++++------------------------
 drivers/gpu/drm/nouveau/nouveau_ttm.c  |   10 +++-------
 drivers/pci/xen-pcifront.c             |    6 ------
 kernel/dma/swiotlb.c                   |    1 -
 5 files changed, 7 insertions(+), 44 deletions(-)

