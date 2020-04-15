Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EB71AB0D6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 20:38:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOmvF-0000F7-Ah; Wed, 15 Apr 2020 18:38:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lFP+=57=xen.org=hx242@srs-us1.protection.inumbo.net>)
 id 1jOmvE-0000F2-3o
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 18:38:04 +0000
X-Inumbo-ID: 3d46427c-7f48-11ea-8abf-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3d46427c-7f48-11ea-8abf-12813bfff9fa;
 Wed, 15 Apr 2020 18:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w0De8RWsimvi343iFj1mIkaonWnYYRQGzcjR5lnEr8U=; b=676GNLxCC4w4dAJ1sz8YHb3rEr
 p4MZuXT/tzfTWyi+QwsJxcHA1SHTJa7E7s3RYBzom1WjI75uywIPkogA/rp5RSlgMJNYCxbh+0OWq
 pKhozrI6Pgb08hY1YyXjVBaigSmLVhmYpazQQzxF7ePJklabIEbdKl9oOZEhXAPhSEB8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvC-00020U-LN; Wed, 15 Apr 2020 18:38:02 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jOmvC-0005Md-AW; Wed, 15 Apr 2020 18:38:02 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/4] use new API for Xen page tables
Date: Wed, 15 Apr 2020 19:37:48 +0100
Message-Id: <cover.1586975587.git.hongyxia@amazon.com>
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
Changed in v4:
- use _ suffix instead of prefix in macros.
- use normal unmap_domain_page() for variable right before end-of-scope.

Changed in v3:
- address all comments in v2.
- drop patch 4, since other clean-ups will make it unnecessary.

Changed in v2:
- I kept UNMAP_DOMAIN_PAGE() for now in v2, but I if people say
  in some cases it is an overkill and unmap_domain_page() should be
  used, I am okay with that and can make the change.
- code cleanup and style fixes.
- unmap as early as possible.

Wei Liu (4):
  x86/shim: map and unmap page tables in replace_va_mapping
  x86_64/mm: map and unmap page tables in m2p_mapped
  x86_64/mm: map and unmap page tables in share_hotadd_m2p_table
  x86_64/mm: map and unmap page tables in destroy_m2p_mapping

 xen/arch/x86/pv/shim.c     |  9 ++++----
 xen/arch/x86/x86_64/mm.c   | 44 +++++++++++++++++++++-----------------
 xen/include/asm-x86/page.h | 19 ++++++++++++++++
 3 files changed, 48 insertions(+), 24 deletions(-)

-- 
2.24.1.AMZN


