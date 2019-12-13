Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077A11DCDF
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 05:12:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifcFz-0007RQ-Is; Fri, 13 Dec 2019 04:08:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xLeZ=2D=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ifcFy-0007RJ-3r
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 04:08:46 +0000
X-Inumbo-ID: 3fa4c008-1d5e-11ea-88e7-bc764e2007e4
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fa4c008-1d5e-11ea-88e7-bc764e2007e4;
 Fri, 13 Dec 2019 04:08:44 +0000 (UTC)
Received: from ws19.umd.com.au (2407-e400-b000-202-0-0-0-3-cpe.spintel.net.au
 [IPv6:2407:e400:b000:202::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id BE2CC2001C1;
 Fri, 13 Dec 2019 15:08:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1576210120; bh=CufguGy8ZeEKrbDl8s/ZRAQqjvUwJPjmKtkxkjLmTFE=;
 h=From:To:Cc:Subject:Date;
 b=WezB1vs5V6gB2MpxaPLHSpf8AeWksWKkiS9sCX3GzhGHw6XV2xVAYdK2LT07EOpaf
 glu2mqjBKEJZsa/IjtQ7wmO9kLpUjz510gHsE1TUQ+XJWqsPZNeE9CspezlZSvQQxT
 qIq7yJelhMEQ8kpkJG5PCeGQPbUl0/JiA9sLTp3U=
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org
Date: Fri, 13 Dec 2019 15:08:33 +1100
Message-Id: <cover.1576209614.git.netwiz@crc.id.au>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 0/2] [PATCH-for-4.13] Work towards removing
 brctl
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RhcnQgdXBkYXRpbmcgc2NyaXB0cyBmb3IgbmV0d29yayBmdW5jdGlvbmFsaXR5CgooUmVzZW5k
aW5nIGFzIHRoZSBwYXRjaCBlbWFpbHMgc2VlbSB0byBoYXZlIGJlZW4gZWF0ZW4gc29tZXdoZXJl
KQoKVGhlIHNjcmlwdHMgZm9yIG5ldHdvcmtpbmcgaW4gWGVuIGhhdmUgYSBtaXh0dXJlIG9mIGZv
cm1hdHRpbmcsCnRhYiBzcGFjaW5nLCBzcGFjZSBzcGFjaW5nIGluY29uc2lzdGVuY2llcy4KCldl
IGFsc28gaGF2ZSBpc3N1ZXMgd2hlcmUgQ2VudE9TIDggZG9lcyBub3QgaGF2ZSBicmN0bCAtIGJl
aW5nCnJlcGxhY2VkIHdpdGggaXAgLyBicmlkZ2UgY29tbWFuZHMuCgpUaGlzIHNlcmllcyBzdGFy
dHMgY2xlYW5pbmcgdXAgd2hpdGVzcGFjZSBhbmQgZm9ybWF0dGluZywgYXMgd2VsbAphcyBzdGFy
dHMgYWRkaW5nIGNvbmRpdGlvbmFscyBmb3IgdXNpbmcgYnJjdGwgKGlmIHByZXNlbnQpIGJ1dCB1
c2luZwppcCBpZiAvdXNyL3NiaW4vYnJjdGwgaXMgbm90IGluc3RhbGxlZC4KCkNoYW5nZXMgc2lu
Y2UgdjEKICAqIEZpeGVkIHJlZmVyZW5jZSB0byAvdXNyL2Jpbi9icmN0bCBpbnN0ZWFkIG9mIC91
c3Ivc2Jpbi9icmN0bAoKU3RldmVuIEhhaWdoICgyKToKICBUaWR5IHVwIHdoaXRlc3BhY2UgYW5k
IGZvcm1hdHRpbmcgaW4gZmlsZSB0byBiZSBjb25zaXN0ZW50LgogIFVzZSBpcCBmb3IgYnJpZGdl
IHJlbGF0ZWQgZnVuY3Rpb25zIHdoZXJlIGJyY3RsIGlzIG5vdCBwcmVzZW50CgogdG9vbHMvaG90
cGx1Zy9MaW51eC9jb2xvLXByb3h5LXNldHVwICAgICAgfCAgMzAgKysrLS0KIHRvb2xzL2hvdHBs
dWcvTGludXgvdmlmLWJyaWRnZSAgICAgICAgICAgIHwgIDE5ICsrLQogdG9vbHMvaG90cGx1Zy9M
aW51eC92aWYyICAgICAgICAgICAgICAgICAgfCAgMTIgKy0KIHRvb2xzL2hvdHBsdWcvTGludXgv
eGVuLW5ldHdvcmstY29tbW9uLnNoIHwgMTUxICsrKysrKysrKysrLS0tLS0tLS0tLS0KIDQgZmls
ZXMgY2hhbmdlZCwgMTIxIGluc2VydGlvbnMoKyksIDkxIGRlbGV0aW9ucygtKQoKLS0gCjIuMjQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
