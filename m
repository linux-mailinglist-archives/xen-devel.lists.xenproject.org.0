Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2BC14DEB5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 17:15:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixCSA-0004Fr-Ei; Thu, 30 Jan 2020 16:14:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZPhi=3T=bombadil.srs.infradead.org=batv+316c8ce85392a3425e94+6003+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixCS8-0004FI-NM
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 16:14:00 +0000
X-Inumbo-ID: 7576cf8a-437b-11ea-b211-bc764e2007e4
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7576cf8a-437b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 16:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1y2PqV6WbRypv8RR0KrTco7MDDMIC2Om05DEmv5EIF0=; b=ZFwA8WodtpJ3kkyXCPUYsVDM+x
 Kh0FnAgUUUGurXeiBJz67Kahnvj9Y7//nIYEQnN1+bNF2dUZw3d0K6CEdR+otm5giZOiQfoTjAgPA
 /iSZPv1NFzIBh59TJkXMPeaUFVqB3gbjE4WPLeAjqOvdOyIM69TUaT8DWWPEMRaF+RV36YqoHI0Lu
 udXYm7zxlKtsh98nkNxdGbO6OzD4+KmAacWd/Rua0tDqz9Kp3dFqecb6tz9yzHEcdhighY8uNUL3l
 rB8JGpMRA7jYOD361W7Qq68f0ThkkncyyF0lAwP3LjCB9GMpQ664vpXxG53OyFy5E6RkBsJs4p+lK
 X5B6IOYw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixCRf-00059y-Gp; Thu, 30 Jan 2020 16:13:31 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixCRe-009kd4-9n; Thu, 30 Jan 2020 16:13:30 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 30 Jan 2020 16:13:12 +0000
Message-Id: <20200130161330.2324143-4-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200130161330.2324143-1-dwmw2@infradead.org>
References: <a92287c03fed310e08ba40063e370038569b94ac.camel@infradead.org>
 <20200130161330.2324143-1-dwmw2@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [RFC PATCH v3 04/22] Add KEXEC_RANGE_MA_LIVEUPDATE
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

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KClRoaXMgYWxsb3dzIGtl
eGVjIHVzZXJzcGFjZSB0byB0ZWxsIHRoZSBuZXh0IFhlbiB3aGVyZSB0aGUgcmFuZ2UgaXMsCm9u
IGl0cyBjb21tYW5kIGxpbmUuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBXb29kaG91c2UgPGR3bXdA
YW1hem9uLmNvLnVrPgotLS0KIHhlbi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMgfCAxMyArKysr
KysrKysrLS0tCiB4ZW4vaW5jbHVkZS9wdWJsaWMva2V4ZWMuaCAgIHwgIDEgKwogMiBmaWxlcyBj
aGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9tYWNoaW5lX2tleGVjLmMgYi94ZW4vYXJjaC94ODYvbWFjaGluZV9rZXhlYy5j
CmluZGV4IGI3MGQ1YTZhODYuLjI3M2JjMjA2NjQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9t
YWNoaW5lX2tleGVjLmMKKysrIGIveGVuL2FyY2gveDg2L21hY2hpbmVfa2V4ZWMuYwpAQCAtMTg2
LDkgKzE4NiwxNiBAQCB2b2lkIG1hY2hpbmVfa2V4ZWMoc3RydWN0IGtleGVjX2ltYWdlICppbWFn
ZSkKIAogaW50IG1hY2hpbmVfa2V4ZWNfZ2V0KHhlbl9rZXhlY19yYW5nZV90ICpyYW5nZSkKIHsK
LQlpZiAocmFuZ2UtPnJhbmdlICE9IEtFWEVDX1JBTkdFX01BX1hFTikKLQkJcmV0dXJuIC1FSU5W
QUw7Ci0JcmV0dXJuIG1hY2hpbmVfa2V4ZWNfZ2V0X3hlbihyYW5nZSk7CisgICAgc3dpdGNoIChy
YW5nZS0+cmFuZ2UpIHsKKyAgICBjYXNlIEtFWEVDX1JBTkdFX01BX1hFTjoKKyAgICAgICAgcmV0
dXJuIG1hY2hpbmVfa2V4ZWNfZ2V0X3hlbihyYW5nZSk7CisgICAgY2FzZSBLRVhFQ19SQU5HRV9N
QV9MSVZFVVBEQVRFOgorICAgICAgICByYW5nZS0+c3RhcnQgPSBsdV9ib290bWVtX3N0YXJ0Owor
ICAgICAgICByYW5nZS0+c2l6ZSA9IGx1X2Jvb3RtZW1fc2l6ZTsKKyAgICAgICAgcmV0dXJuIDA7
CisgICAgZGVmYXVsdDoKKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisgICAgfQogfQogCiB2b2lk
IGFyY2hfY3Jhc2hfc2F2ZV92bWNvcmVpbmZvKHZvaWQpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS9wdWJsaWMva2V4ZWMuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oCmluZGV4IDNmMmEx
MTgzODEuLjI5ODM4MWFmOGQgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5o
CisrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9rZXhlYy5oCkBAIC0xNTAsNiArMTUwLDcgQEAgdHlw
ZWRlZiBzdHJ1Y3QgeGVuX2tleGVjX2xvYWRfdjEgewogI2RlZmluZSBLRVhFQ19SQU5HRV9NQV9F
RklfTUVNTUFQIDUgLyogbWFjaGluZSBhZGRyZXNzIGFuZCBzaXplIG9mCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKiBvZiB0aGUgRUZJIE1lbW9yeSBNYXAgKi8KICNkZWZp
bmUgS0VYRUNfUkFOR0VfTUFfVk1DT1JFSU5GTyA2IC8qIG1hY2hpbmUgYWRkcmVzcyBhbmQgc2l6
ZSBvZiB2bWNvcmVpbmZvICovCisjZGVmaW5lIEtFWEVDX1JBTkdFX01BX0xJVkVVUERBVEUgNyAv
KiBCb290IG1lbSBmb3IgbGl2ZSB1cGRhdGUgKi8KIAogLyoKICAqIEZpbmQgdGhlIGFkZHJlc3Mg
YW5kIHNpemUgb2YgY2VydGFpbiBtZW1vcnkgYXJlYXMKLS0gCjIuMjEuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
