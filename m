Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DC1ADA74
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 11:52:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNfa-0000LG-Bc; Fri, 17 Apr 2020 09:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lM+k=6B=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jPNfY-0000LB-4z
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 09:52:20 +0000
X-Inumbo-ID: 1fe8cef8-8091-11ea-8c9b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fe8cef8-8091-11ea-8c9b-12813bfff9fa;
 Fri, 17 Apr 2020 09:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gV81cHJB3NZq+lqurKfDaoiAVy854Zr2arns+wuToNI=; b=mhZSOZ4IwsHnwFLpOcCVHtmPrr
 aHY6Op4ptWnC/wlWbnydJa0nYfDC6VJElOIKbkXRHTmVWriF0f3akPKWfOrSgd3F3S+hh0eRk36qc
 oB29a46rh8ZF783cNUP1vnkkRN/7fwk3IE0WaiMezwB9vcmOrzPFvH3+7J22H9uZt36E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfV-0002fY-QD; Fri, 17 Apr 2020 09:52:17 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jPNfV-000304-FW; Fri, 17 Apr 2020 09:52:17 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/6] convert more Xen page table code to the new API
Date: Fri, 17 Apr 2020 10:52:02 +0100
Message-Id: <cover.1587116799.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Basically just rewriting functions using the new API to map and unmap
PTEs. Each patch is independent.

Apart from mapping and unmapping page tables, no other functional change
intended.

Wei Liu (6):
  x86_64/mm: map and unmap page tables in cleanup_frame_table
  x86_64/mm: map and unmap page tables in subarch_init_memory
  x86_64/mm: map and unmap page tables in subarch_memory_op
  x86/smpboot: map and unmap page tables in cleanup_cpu_root_pgt
  x86/pv: map and unmap page tables in mark_pv_pt_pages_rdonly
  x86/pv: map and unmap page table in dom0_construct_pv

 xen/arch/x86/pv/dom0_build.c | 38 ++++++++++++++++++++++++------------
 xen/arch/x86/smpboot.c       | 25 ++++++++++++++++--------
 xen/arch/x86/x86_64/mm.c     | 32 +++++++++++++++---------------
 3 files changed, 58 insertions(+), 37 deletions(-)

-- 
2.24.1.AMZN


