Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F86E775728
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 12:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.580829.909260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVg-0006g8-5u; Wed, 09 Aug 2023 10:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 580829.909260; Wed, 09 Aug 2023 10:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTgVg-0006do-3F; Wed, 09 Aug 2023 10:33:48 +0000
Received: by outflank-mailman (input) for mailman id 580829;
 Wed, 09 Aug 2023 10:33:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qTgVe-0006di-4v
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 10:33:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVd-0005GD-Rr; Wed, 09 Aug 2023 10:33:45 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qTgVd-0000jc-Iu; Wed, 09 Aug 2023 10:33:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=gqsPc6Dj+x+vL8iP4OcWHmHCsnEFSblX9PTtCumU6Hw=; b=Lmrh2S
	AJX525aTBZP1t4wkTfJhtb1SeoM1OvjLmrf1khQRebh3cm/e3F+pkbDebXAD8UFLvwaCNqiHy8GJm
	f5RogIeW6hzfNHq6+milDX4w/JMoxrme4xLlFqe1+Zqi/2tQsI/+vMnMECk8kDvFQwFDWMHUpICXO
	3tvmV6LPVC4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2]  Revoke IOMEM/IO port/IRQ permissions on PCI detach for HVM guest
Date: Wed,  9 Aug 2023 11:33:03 +0100
Message-Id: <20230809103305.30561-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Hi all,

This small series is looking to revoke properly IOMEM/IO port/IRQ
permissions on PCI detach for HVM guest. For more details, see
patch #2.

Cheers,

Julien Grall (2):
  tools/libs: light: Remove the variable 'domainid' do_pci_remove()
  tools/light: Revoke permissions when a PCI detach for HVM domain

 tools/libs/light/libxl_pci.c | 146 +++++++++++++++++++----------------
 1 file changed, 81 insertions(+), 65 deletions(-)

--  
2.40.1


