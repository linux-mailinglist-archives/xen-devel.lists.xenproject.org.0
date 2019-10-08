Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E14CF055
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 03:18:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHe5b-0001Oh-A2; Tue, 08 Oct 2019 01:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M61b=YB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iHe5a-0001Oc-2w
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 01:14:58 +0000
X-Inumbo-ID: 0acce5b4-e969-11e9-80e3-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0acce5b4-e969-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 01:14:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CCB7720867;
 Tue,  8 Oct 2019 01:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1570497297;
 bh=drbyu915BkKTw5/Vewhs2UN4p+PteQiYw2njuNhmVwg=;
 h=Date:From:To:cc:Subject:From;
 b=FMW0uY9yN9vOr/i5KMYsiCBvIq8RHnjZuQcqjp/knJn2ufhGTGRVbmYLF8Cg+SXgC
 si/EMBCz0ea2XBlemSaDsCzF4BdoNkTRdCGGKRjfhr56PfvPgwxQo4zyWwRGwvrnhD
 SQvV9waRRKqtQXzaI8ogR3izL02yi+9bP4BDwycg=
Date: Mon, 7 Oct 2019 18:14:56 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien.Grall@arm.com
Message-ID: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH for-4.13 v2 0/3] fixes for make_[memory/cpu]_node
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBpcyBhIHNtYWxsIGNvbGxlY3Rpb24gb2YgZml4ZXMgZm9yIG1ha2VfbWVt
b3J5X25vZGUgYW5kCm1ha2VfY3B1c19ub2RlIGZvciA0LjEzLgoKQ2hlZXJzLAoKU3RlZmFubwoK
ClN0ZWZhbm8gU3RhYmVsbGluaSAoMyk6CiAgICAgIHhlbi9hcm06IGZpeCBidWYgc2l6ZSBpbiBt
YWtlX2NwdXNfbm9kZQogICAgICB4ZW4vYXJtOiBtYWtlX21lbW9yeV9ub2RlIHJldHVybiBlcnJv
ciBvbiBucl9iYW5rcyA9PSAwCiAgICAgIHhlbi9hcm06IGZpeCBkdXBsaWNhdGUgbWVtb3J5IG5v
ZGUgaW4gRFQKCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgfCAyMiArKysrKysrKysrKysr
KystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
