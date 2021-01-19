Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DA72FBADA
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 16:17:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70484.126540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1skb-0004Ow-GH; Tue, 19 Jan 2021 15:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70484.126540; Tue, 19 Jan 2021 15:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1skb-0004OP-CQ; Tue, 19 Jan 2021 15:16:57 +0000
Received: by outflank-mailman (input) for mailman id 70484;
 Tue, 19 Jan 2021 15:16:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=U8Ox=GW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1skZ-0004O9-G3
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 15:16:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7cb3896-b73a-4eff-b42d-a121aeae42ce;
 Tue, 19 Jan 2021 15:16:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0580B28A;
 Tue, 19 Jan 2021 15:16:53 +0000 (UTC)
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
X-Inumbo-ID: d7cb3896-b73a-4eff-b42d-a121aeae42ce
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611069414; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kJ7Pv7Jlp4SzB+Vj6j3PgkJrnOZngDatZK/keb5brzA=;
	b=aESMWS1bCx1OzsfWZ32pOll2X7pfJjyaEXPeVFxov0T+WkPjlIHWxC+j3JFcDCIDkvSJl4
	wYxDLNzrEHYB2bGYCd3XR3nldCCt5XD63CuZZzOl4UbB/KVfl9qALhHZzHwajMQdDOYiwC
	75omETs/Efqk8gUm12YbvARk6xg9cfs=
Subject: [PATCH v2 4/5] libxenguest: drop redundant decompression declarations
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Message-ID: <17147e8a-2c5d-ac96-db16-8db4f4e87bbd@suse.com>
Date: Tue, 19 Jan 2021 16:16:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <aab9e3e6-5125-6b0a-6cd4-960fd783b1b2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

The ones in xg_dom_decompress_unsafe.h suffice.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
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


