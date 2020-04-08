Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFF1A2326
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 15:37:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMAtA-0007Vx-Fe; Wed, 08 Apr 2020 13:37:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+IwF=5Y=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jMAt9-0007Vq-95
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 13:37:07 +0000
X-Inumbo-ID: 0a00489a-799e-11ea-83d8-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a00489a-799e-11ea-83d8-bc764e2007e4;
 Wed, 08 Apr 2020 13:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m4Xjo1WtOaJtxjj9jlr6A8OdmVj3Yp3r3aK1VRe2/Fw=; b=nGUyarFnJF7GarI266T3emtype
 ltusAvzGAe0xJM27gGyBfcphfo9ZEfwSColsY+DROrgCoD+/NUsy8KrN/SqPvgQpPezfgk5St4spX
 NVK5xL4VAR5dCZW4A3Mh4xOeAcCk99twxy4mMc9x1aEZnDF+X2sqsLIgUVkY0aVrzY8E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAt8-00057Z-Gg; Wed, 08 Apr 2020 13:37:06 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jMAt8-0005ee-6p; Wed, 08 Apr 2020 13:37:06 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/5] use new API for Xen page tables
Date: Wed,  8 Apr 2020 14:36:50 +0100
Message-Id: <cover.1586352238.git.hongyxia@amazon.com>
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

This small series is basically just rewriting functions using the new
API to map and unmap PTEs. Each patch is independent.

Apart from mapping and unmapping page tables, no other functional change
intended.

---
Changed in v2:
- I kept UNMAP_DOMAIN_PAGE() for now in v2, but I if people say
  in some cases it is an overkill and unmap_domain_page() should be
  used, I am okay with that and can make the change.
- code cleanup and style fixes.
- unmap as early as possible.

Wei Liu (5):
  x86/shim: map and unmap page tables in replace_va_mapping
  x86_64/mm: map and unmap page tables in m2p_mapped
  x86_64/mm: map and unmap page tables in share_hotadd_m2p_table
  x86_64/mm: map and unmap page tables in destroy_compat_m2p_mapping
  x86_64/mm: map and unmap page tables in destroy_m2p_mapping

 xen/arch/x86/pv/shim.c     |  9 ++++---
 xen/arch/x86/x86_64/mm.c   | 55 ++++++++++++++++++++++----------------
 xen/include/asm-x86/page.h | 13 +++++++++
 3 files changed, 50 insertions(+), 27 deletions(-)

-- 
2.24.1.AMZN


