Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BA1303966
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74718.134304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kz7-0000hG-PV; Tue, 26 Jan 2021 09:50:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74718.134304; Tue, 26 Jan 2021 09:50:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4Kz7-0000gI-L2; Tue, 26 Jan 2021 09:50:05 +0000
Received: by outflank-mailman (input) for mailman id 74718;
 Tue, 26 Jan 2021 09:50:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4Kz5-0000Np-JL
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:50:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b2e6df6-4c61-46f2-902c-5c3df5f833ac;
 Tue, 26 Jan 2021 09:50:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C730AC4F;
 Tue, 26 Jan 2021 09:50:02 +0000 (UTC)
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
X-Inumbo-ID: 2b2e6df6-4c61-46f2-902c-5c3df5f833ac
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RCJANwvw1+ZBF+eonfJAxK5yWWsPMdyFkF5XXFdTgPQ=;
	b=dPgtXdyHwIe1DQUaCMLbHLqIVXdmGdIIb118m0vpM63HOVUPP0ppUbxH1oN4C8i81X/PSw
	FPF6RhF9n4f82ECBsPWu+7M1YvsxxtyaYn6WgUZOiA+QPwA5Gsr9uDUgJid6svvuCDwwnq
	k3/X4sx7ZMF6tla9mcsurCTq1YSIkvU=
Subject: [PATCH v3 05/15] libxenguest: drop redundant decompression
 declarations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <c68935a7-cb1a-5529-dd83-37c6f8560622@suse.com>
Date: Tue, 26 Jan 2021 10:50:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The ones in xg_dom_decompress_unsafe.h suffice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Wei Liu <wl@xen.org>
---
v2: New.

--- a/tools/libs/guest/xg_dom_bzimageloader.c
+++ b/tools/libs/guest/xg_dom_bzimageloader.c
@@ -673,13 +673,6 @@ static int xc_try_zstd_decode(
 
 #endif
 
-#else /* __MINIOS__ */
-
-int xc_try_bzip2_decode(struct xc_dom_image *dom, void **blob, size_t *size);
-int xc_try_lzma_decode(struct xc_dom_image *dom, void **blob, size_t *size);
-int xc_try_lzo1x_decode(struct xc_dom_image *dom, void **blob, size_t *size);
-int xc_try_xz_decode(struct xc_dom_image *dom, void **blob, size_t *size);
-
 #endif /* !__MINIOS__ */
 
 struct setup_header {


