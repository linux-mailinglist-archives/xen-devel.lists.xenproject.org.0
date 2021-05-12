Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E537D427
	for <lists+xen-devel@lfdr.de>; Wed, 12 May 2021 22:18:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126370.237898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJ5-0004hw-QY; Wed, 12 May 2021 20:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126370.237898; Wed, 12 May 2021 20:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgvJ5-0004f5-Ms; Wed, 12 May 2021 20:18:11 +0000
Received: by outflank-mailman (input) for mailman id 126370;
 Wed, 12 May 2021 20:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=codm=KH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lgvJ4-0004ez-Hh
 for xen-devel@lists.xenproject.org; Wed, 12 May 2021 20:18:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 521fd89b-72bd-4620-adb4-c21c4fb473f0;
 Wed, 12 May 2021 20:18:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A30C461420;
 Wed, 12 May 2021 20:18:08 +0000 (UTC)
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
X-Inumbo-ID: 521fd89b-72bd-4620-adb4-c21c4fb473f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620850689;
	bh=fP9Wxr+4cvV2QEABqz6APIe0wf2Nt2QzccyCNr1aPQE=;
	h=Date:From:To:cc:Subject:From;
	b=Iub85i9N4PogdaaRJ1b5DUmjrHqhoIUgjXookWh7V1QaUHlarkcZ9Et/kzUg3IpU/
	 9hYSmO3DpmPCJvQXNAqKhpsWTpHpBo2+9ajqKeAbpXi6xR2jCGoL7liHb5fI/u2aNJ
	 4BJ0yPDlK7/RkwpR1aIgaiACiPp2VsJqMzmzO9bnKI+mnjwqX/xqFihgFpARJxmK2O
	 ZyoTdyARq/XnZSTIbt5WmFCh5YtfN6t4AH4NI4Yq8HeuEPZPyDXeH/BhAw/qab0EuD
	 THrMu77hwEn+1+TqJaRixF3VsYxfrHs4Qust+JkcFtQxWCsJVw+O/5OXlNl0EVeW0x
	 E6VR7zXWWGbAQ==
Date: Wed, 12 May 2021 13:18:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com, 
    hch@lst.de
Subject: [PATCH v2 0/3] swiotlb-xen init fixes
Message-ID: <alpine.DEB.2.21.2105121313060.5018@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi all,

This short patch series comes with a preparation patch and 2 unrelated
fixes to swiotlb-xen initialization.


Christoph Hellwig (1):
      arm64: do not set SWIOTLB_NO_FORCE when swiotlb is required

Stefano Stabellini (2):
      xen/arm: move xen_swiotlb_detect to arm/swiotlb-xen.h
      xen/swiotlb: check if the swiotlb has already been initialized

 arch/arm/xen/mm.c             | 20 +++++++-------------
 arch/arm64/mm/init.c          |  3 ++-
 drivers/xen/swiotlb-xen.c     |  5 +++++
 include/xen/arm/swiotlb-xen.h | 15 ++++++++++++++-
 4 files changed, 28 insertions(+), 15 deletions(-)

