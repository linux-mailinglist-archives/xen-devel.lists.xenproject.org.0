Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434014DEC3
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:16:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCT8-00050a-L8; Thu, 30 Jan 2020 16:15:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwoG=3T=merlin.srs.infradead.org=batv+f9651308fc69d1c188a8+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCT6-0004zM-Oq
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:15:00 +0000
X-Inumbo-ID: 78caef0e-437b-11ea-a933-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78caef0e-437b-11ea-a933-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmmRLb0NdTnw1b2mbJsYwt47rxkECNQNxPoVyBberGo=; b=Ly+2Ete9oEEq6xuSf8WUSJoHg1
 yI3+YrqQJmxvKaUy/TDj/ee/TX5jCtfPanff4H89hrLiCSc4KuuJ8yoQGdMiK7a1THuF8UAlb//lc
 Z/LCDyOghyXNJYEytQi0rMSpCy5mMfOJpBfv7bc703Yb6VQm7QhCKTHstiteTyOQQLbw0s9+caHZS
 gXu2woPTzxMwm29gvGkBXbwdDDI+kxJZbbI/ELVN3CQyEMQ6UF3W7mRavGnpdjQHn5QkpSTR6bcB6
 1sAfEVjTrDc9XpMwe9dl2U2JjA9EBthh4AuTWx4mbLnvcjf9ru1FGDenSVMUk0IBuC7N5rrb3FWif
 XKBbf/ZA==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-0005Tg-42; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kd9-AK; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:13 +0000
Message-Id: <20200130161330.2324143-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 05/22] Add KEXEC_TYPE_LIVE_UPDATE
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Varad Gautam <vrd@amazon.de>,
 paul@xen.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Hongyan Xia <hongyxia@amazon.com>, Amit Shah <aams@amazon.de>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgaXMgaWRlbnRp
Y2FsIHRvIHRoZSBkZWZhdWx0IGNhc2UuLi4gZm9yIG5vdy4KClNpZ25lZC1vZmYtYnk6IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2NvbW1vbi9rZXhlYy5jICAg
ICAgICAgfCAxOCArKysrKysrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5o
IHwgMTIgKysrKysrKystLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9rZXhlYy5jIGIveGVuL2NvbW1v
bi9rZXhlYy5jCmluZGV4IGEyNjJjYzVhMTguLmE3OGFhNGY1YjAgMTAwNjQ0Ci0tLSBhL3hlbi9j
b21tb24va2V4ZWMuYworKysgYi94ZW4vY29tbW9uL2tleGVjLmMKQEAgLTQwNCw2ICs0MDQsMTkg
QEAgc3RhdGljIGxvbmcga2V4ZWNfcmVib290KHZvaWQgKl9pbWFnZSkKICAgICByZXR1cm4gMDsK
IH0KIAorc3RhdGljIGxvbmcga2V4ZWNfbGl2ZV91cGRhdGUodm9pZCAqX2ltYWdlKQoreworICAg
IHN0cnVjdCBrZXhlY19pbWFnZSAqaW1hZ2UgPSBfaW1hZ2U7CisKKyAgICBrZXhlY2luZyA9IFRS
VUU7CisKKyAgICBrZXhlY19jb21tb25fc2h1dGRvd24oKTsKKyAgICBtYWNoaW5lX3JlYm9vdF9r
ZXhlYyhpbWFnZSk7CisKKyAgICBCVUcoKTsKKyAgICByZXR1cm4gMDsKK30KKwogc3RhdGljIHZv
aWQgZG9fY3Jhc2hkdW1wX3RyaWdnZXIodW5zaWduZWQgY2hhciBrZXkpCiB7CiAgICAgcHJpbnRr
KCInJWMnIHByZXNzZWQgLT4gdHJpZ2dlcmluZyBjcmFzaGR1bXBcbiIsIGtleSk7CkBAIC03MzYs
NiArNzQ5LDcgQEAgc3RhdGljIGludCBrZXhlY19sb2FkX2dldF9iaXRzKGludCB0eXBlLCBpbnQg
KmJhc2UsIGludCAqYml0KQogICAgIHN3aXRjaCAoIHR5cGUgKQogICAgIHsKICAgICBjYXNlIEtF
WEVDX1RZUEVfREVGQVVMVDoKKyAgICBjYXNlIEtFWEVDX1RZUEVfTElWRV9VUERBVEU6CiAgICAg
ICAgICpiYXNlID0gS0VYRUNfSU1BR0VfREVGQVVMVF9CQVNFOwogICAgICAgICAqYml0ID0gS0VY
RUNfRkxBR19ERUZBVUxUX1BPUzsKICAgICAgICAgYnJlYWs7CkBAIC04MzcsNiArODUxLDEwIEBA
IHN0YXRpYyBpbnQga2V4ZWNfZXhlYyhYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIHVhcmcp
CiAgICAgICAgIGltYWdlID0ga2V4ZWNfaW1hZ2VbYmFzZSArIHBvc107CiAgICAgICAgIHJldCA9
IGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwga2V4ZWNfcmVib290LCBpbWFnZSk7CiAgICAg
ICAgIGJyZWFrOworICAgIGNhc2UgS0VYRUNfVFlQRV9MSVZFX1VQREFURToKKyAgICAgICAgaW1h
Z2UgPSBrZXhlY19pbWFnZVtiYXNlICsgcG9zXTsKKyAgICAgICAgcmV0ID0gY29udGludWVfaHlw
ZXJjYWxsX29uX2NwdSgwLCBrZXhlY19saXZlX3VwZGF0ZSwgaW1hZ2UpOworICAgICAgICBicmVh
azsKICAgICBjYXNlIEtFWEVDX1RZUEVfQ1JBU0g6CiAgICAgICAgIGtleGVjX2NyYXNoKCk7IC8q
IERvZXMgbm90IHJldHVybiAqLwogICAgICAgICBicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9rZXhlYy5oIGIveGVuL2luY2x1ZGUvcHVibGljL2tleGVjLmgKaW5kZXggMjk4
MzgxYWY4ZC4uZjUyMzAyODZkMyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2tleGVj
LmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2tleGVjLmgKQEAgLTcxLDE4ICs3MSwyMiBAQAog
ICovCiAKIC8qCi0gKiBLZXhlYyBzdXBwb3J0cyB0d28gdHlwZXMgb2Ygb3BlcmF0aW9uOgorICog
S2V4ZWMgc3VwcG9ydHMgdGhyZWUgdHlwZXMgb2Ygb3BlcmF0aW9uOgogICogLSBrZXhlYyBpbnRv
IGEgcmVndWxhciBrZXJuZWwsIHZlcnkgc2ltaWxhciB0byBhIHN0YW5kYXJkIHJlYm9vdAogICog
ICAtIEtFWEVDX1RZUEVfREVGQVVMVCBpcyB1c2VkIHRvIHNwZWNpZnkgdGhpcyB0eXBlCiAgKiAt
IGtleGVjIGludG8gYSBzcGVjaWFsICJjcmFzaCBrZXJuZWwiLCBha2Ega2V4ZWMtb24tcGFuaWMK
ICAqICAgLSBLRVhFQ19UWVBFX0NSQVNIIGlzIHVzZWQgdG8gc3BlY2lmeSB0aGlzIHR5cGUKICAq
ICAgLSBwYXJ0cyBvZiBvdXIgc3lzdGVtIG1heSBiZSBicm9rZW4gYXQga2V4ZWMtb24tcGFuaWMg
dGltZQogICogICAgIC0gdGhlIGNvZGUgc2hvdWxkIGJlIGtlcHQgYXMgc2ltcGxlIGFuZCBzZWxm
LWNvbnRhaW5lZCBhcyBwb3NzaWJsZQorICogLSBMaXZlIHVwZGF0ZSBpbnRvIGEgbmV3IFhlbiwg
cHJlc2VydmluZyBhbGwgcnVubmluZyBkb21haW5zCisgKiAgIC0gS0VYRUNfVFlQRV9MSVZFX1VQ
REFURSBpcyB1c2VkIHRvIHNwZWNpZnkgdGhpcyB0eXBlCisgKiAgIC0gWGVuIHBlcmZvcm1zIGd1
ZXN0LXRyYW5zcGFyZW50IGxpdmUgbWlncmF0aW9uIGFuZCBzdG9yZXMgbGl2ZQorICogICAgIHVw
ZGF0ZSBzdGF0ZSBpbiBtZW1vcnksIHBhc3NpbmcgaXQgdG8gdGhlIG5ldyBYZW4uCiAgKi8KIAot
I2RlZmluZSBLRVhFQ19UWVBFX0RFRkFVTFQgMAotI2RlZmluZSBLRVhFQ19UWVBFX0NSQVNIICAg
MQotCisjZGVmaW5lIEtFWEVDX1RZUEVfREVGQVVMVCAgICAgICAgICAwCisjZGVmaW5lIEtFWEVD
X1RZUEVfQ1JBU0ggICAgICAgICAgICAxCisjZGVmaW5lIEtFWEVDX1RZUEVfTElWRV9VUERBVEUg
ICAgICAyCiAKIC8qIFRoZSBrZXhlYyBpbXBsZW1lbnRhdGlvbiBmb3IgWGVuIGFsbG93cyB0aGUg
dXNlciB0byBsb2FkIHR3bwogICogdHlwZXMgb2Yga2VybmVscywgS0VYRUNfVFlQRV9ERUZBVUxU
IGFuZCBLRVhFQ19UWVBFX0NSQVNILgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
