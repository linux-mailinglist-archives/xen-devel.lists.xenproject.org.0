Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6839E72C859
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547176.854448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUn-0001ZZ-Ld; Mon, 12 Jun 2023 14:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547176.854448; Mon, 12 Jun 2023 14:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUn-0001U5-IE; Mon, 12 Jun 2023 14:26:13 +0000
Received: by outflank-mailman (input) for mailman id 547176;
 Mon, 12 Jun 2023 14:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcHT=CA=bombadil.srs.infradead.org=BATV+33f57c12507318cbaa86+7232+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q8iUl-0001S1-5V
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:26:12 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ff6084a-092d-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:26:05 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8iUN-004I84-13; Mon, 12 Jun 2023 14:25:47 +0000
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
X-Inumbo-ID: 0ff6084a-092d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=f6jpt7lo8djdkscLPVrkqv8ySzbiCW/dI5HE2X2RneY=; b=D++FS2n3NbokanCiRHuXrRYJFB
	1O4lDTnE+D1HQHO2AKpMGQ9+FQIFYTJSb0lQt3XrPAm08Tq6mnTZq+kgtFT44f8tGewYEwfIZHO/h
	YBgrsdTbfjZ9Y1XMZSrXDLROWWaZstFQitWpEw7rmifT7IYuYN6djDb3d/YRnetzhSJJqpJELxqq2
	czIJi68GIT2zYuBVMka5Tl6uYHkD99z8M5hudtG6z1deEZxdxZHfnXeCQXVwyr8sGMxDTDg/oQrBa
	qITv89Zql2Si0e2SXoNmdtiN/FNHvISQbH03beP0rj+2N5MP2tb9B/fKR/5zmT67+j6MAscZFdmih
	9rBheVNA==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: unexport swiotlb_active v2
Date: Mon, 12 Jun 2023 16:25:39 +0200
Message-Id: <20230612142542.111581-1-hch@lst.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Hi all,

this little series removes the last swiotlb API exposed to modules.

Changes since v1:
 - add a patch from Juergen to export if the e820 table indicates Xen PV
   PCI is enabled
 - slightly reorganize the logic to check if swiotlb is needed for
   Xen/x86
 - drop the already merged nouveau patch

Diffstat:
 arch/x86/include/asm/xen/swiotlb-xen.h |    6 ------
 arch/x86/kernel/pci-dma.c              |   29 +++++++----------------------
 arch/x86/xen/setup.c                   |    6 ++++++
 drivers/pci/xen-pcifront.c             |    6 ------
 include/xen/xen.h                      |    6 ++++++
 kernel/dma/swiotlb.c                   |    1 -
 6 files changed, 19 insertions(+), 35 deletions(-)

