Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B051DC324
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 01:46:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbYOe-0007w5-FC; Wed, 20 May 2020 23:45:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P2h4=7C=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jbYOd-0007w0-2x
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 23:45:11 +0000
X-Inumbo-ID: f0324c70-9af3-11ea-aaaa-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0324c70-9af3-11ea-aaaa-12813bfff9fa;
 Wed, 20 May 2020 23:45:09 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F189F20748;
 Wed, 20 May 2020 23:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590018308;
 bh=ngrtvfLYBKfv8MQkCaYk8tYirfeqXPlMFjsOE/YFGgk=;
 h=Date:From:To:cc:Subject:From;
 b=aFQEiP489M9V1lc9WQ1OxfNV/2V+7N4zYIpsMfXXKumiUZCXkMtf0oX/l0ZaBRhko
 XXDUqKcjb3djxslDnJAwC1DX+oVg2M4ipvZyxQQ2EMXpfKDr0PuWTiEpSvLXpbWjS3
 1PiciD+5N1v3vJ8I1FAXnL7M5Kig9bCT9MNlgPYI=
Date: Wed, 20 May 2020 16:45:07 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: jgross@suse.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com
Subject: [PATCH 00/10] fix swiotlb-xen for RPi4
Message-ID: <alpine.DEB.2.21.2005201628330.27502@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, tamas@tklengyel.com,
 linux-kernel@vger.kernel.org, roman@zededa.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

This series is a collection of fixes to get Linux running on the RPi4 as
dom0.

Conceptually there are only two significant changes:

- make sure not to call virt_to_page on vmalloc virt addresses (patch
  #1)
- use phys_to_dma and dma_to_phys to translate phys to/from dma
  addresses (all other patches)

In particular in regards to the second part, the RPi4 is the first
board where Xen can run that has the property that dma addresses are
different from physical addresses, and swiotlb-xen was written with the
assumption that phys addr == dma addr.

This series adds the phys_to_dma and dma_to_phys calls to make it work.


Cheers,

Stefano

