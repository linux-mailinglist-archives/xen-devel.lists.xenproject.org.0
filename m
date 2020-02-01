Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B614F570
	for <lists+xen-devel@lfdr.de>; Sat,  1 Feb 2020 01:35:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixgj7-0006Ls-Bd; Sat, 01 Feb 2020 00:33:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YQT+=3V=merlin.srs.infradead.org=batv+14355fafd9c313d768ee+6005+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ixgj5-0006Ke-3M
 for xen-devel@lists.xenproject.org; Sat, 01 Feb 2020 00:33:31 +0000
X-Inumbo-ID: 6aebf9fe-448a-11ea-ad98-bc764e2007e4
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6aebf9fe-448a-11ea-ad98-bc764e2007e4;
 Sat, 01 Feb 2020 00:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lqMSMeVhKSgPkcVvfREuVIy712hBBzMUz6KHWtaUJ6o=; b=VNjT65H8BTvvScEhCYnSNWyjs8
 s7+jsssKumAgt3XOQJL3P4rgH6yuyixBpBxIFNrAsAu+peJme8cPwMz3wL9KP1ianREkmyxnWGC02
 qxbJT/Ke3Hrrr1rhg0nS266EO3nwAqFPKNt6GQH83sFFY+2OppMSDBziSRPZG0qV4YrsqvqYI0UWO
 yLo/IytfJkHcgtvpt+ZfakHECZN+VF6lMgo4B5UZb/QWG7qrFL2QSzI4uTUj7bIoccpxqkw+OUgcz
 o+RkYlFO0FAymArBv8+5IFzk6049nD4eUGnXCUXM6mgbhuQHyGQ+gQpPnp+vE+y6oBvXqDt0U9KlX
 +NiPQpYw==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixgie-0007nw-0B; Sat, 01 Feb 2020 00:33:04 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1ixgid-009uks-6M; Sat, 01 Feb 2020 00:33:03 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: xen-devel@lists.xenproject.org
Date: Sat,  1 Feb 2020 00:32:56 +0000
Message-Id: <20200201003303.2363081-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
References: <8a95f787ca93b23ee8d8c0b55fcc63d22a75c5f3.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 merlin.infradead.org. See http://www.infradead.org/rpr.html
Subject: [Xen-devel] [PATCH 1/8] x86/smp: reset x2apic_enabled in
 smp_send_stop()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Hongyan Xia <hongyxia@amazon.com>,
 Paul Durrant <pdurrant@amazon.co.uk>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogRGF2aWQgV29vZGhvdXNlIDxkd213QGFtYXpvbi5jby51az4KCkp1c3QgYmVmb3JlIHNt
cF9zZW5kX3N0b3AoKSByZS1lbmFibGVzIGludGVycnVwdHMgd2hlbiBzaHV0dGluZyBkb3duCmZv
ciByZWJvb3Qgb3Iga2V4ZWMsIGl0IGNhbGxzIF9fc3RvcF90aGlzX2NwdSgpIHdoaWNoIGluIHR1
cm4gY2FsbHMKZGlzYWJsZV9sb2NhbF9BUElDKCksIHdoaWNoIHB1dHMgdGhlIEFQSUMgYmFjayBp
biB0byB0aGUgbW9kZSBYZW4gZm91bmQKaXQgaW4gYXQgYm9vdC4KCklmIHRoYXQgbWVhbnMgdHVy
bmluZyB4MkFQSUMgb2ZmIGFuZCBnb2luZyBiYWNrIGludG8geEFQSUMgbW9kZSwgdGhlbgphIHRp
bWVyIGludGVycnVwdCBvY2N1cnJpbmcganVzdCBhZnRlciBpbnRlcnJ1cHRzIGNvbWUgYmFjayBv
biB3aWxsCmxlYWQgdG8gYSBHUCMgd2hlbiBhcGljX3RpbWVyX2ludGVycnVwdCgpIGF0dGVtcHRz
IHRvIGFjayB0aGUgSVJRCnRocm91Z2ggdGhlIEVPSSByZWdpc3RlciBpbiB4MkFQSUMgTVNSIDB4
ODBiOgoKKFhFTikgRXhlY3V0aW5nIGtleGVjIGltYWdlIG9uIGNwdTAKKFhFTikgLS0tLVsgWGVu
LTQuMTQtdW5zdGFibGUgIHg4Nl82NCAgZGVidWc9biAgIE5vdCB0YWludGVkIF0tLS0tCihYRU4p
IENQVTogICAgMAooWEVOKSBSSVA6ICAgIGUwMDg6WzxmZmZmODJkMDgwMjZjMTM5Pl0gYXBpY190
aW1lcl9pbnRlcnJ1cHQrMHgyOS8weDQwCihYRU4pIFJGTEFHUzogMDAwMDAwMDAwMDAxMDA0NiAg
IENPTlRFWFQ6IGh5cGVydmlzb3IKKFhFTikgcmF4OiAwMDAwMDAwMDAwMDAwMDAwICAgcmJ4OiAw
MDAwMDAwMDAwMDAwMGZhICAgcmN4OiAwMDAwMDAwMDAwMDAwODBiCuKApgooWEVOKSBYZW4gY29k
ZSBhcm91bmQgPGZmZmY4MmQwODAyNmMxMzk+IChhcGljX3RpbWVyX2ludGVycnVwdCsweDI5LzB4
NDApOgooWEVOKSAgYzAgYjkgMGIgMDggMDAgMDAgODkgYzIgPDBmPiAzMCAzMSBmZiBlOSAwZSBj
OSBmYiBmZiAwZiAxZiA0MCAwMCA2NiAyZSAwZgrigKYKKFhFTikgWGVuIGNhbGwgdHJhY2U6CihY
RU4pICAgIFs8ZmZmZjgyZDA4MDI2YzEzOT5dIFIgYXBpY190aW1lcl9pbnRlcnJ1cHQrMHgyOS8w
eDQwCihYRU4pICAgIFs8ZmZmZjgyZDA4MDI4MzgyNT5dIFMgZG9fSVJRKzB4OTUvMHg3NTAK4oCm
CihYRU4pICAgIFs8ZmZmZjgyZDA4MDJhMGFkMj5dIFMgc21wX3NlbmRfc3RvcCsweDQyLzB4ZDAK
CldlIGNhbid0IGNsZWFyIHRoZSBnbG9iYWwgeDJhcGljX2VuYWJsZWQgdmFyaWFibGUgaW4gZGlz
YWJsZV9sb2NhbF9BUElDKCkKaXRzZWxmIGJlY2F1c2UgdGhhdCBydW5zIG9uIGVhY2ggQ1BVLiBJ
bnN0ZWFkLCBjb3JyZWN0IGl0IChieSB1c2luZwpjdXJyZW50X2xvY2FsX2FwaWNfbW9kZSgpKSBp
biBzbXBfc2VuZF9zdG9wKCkgd2hpbGUgaW50ZXJydXB0cyBhcmUgc3RpbGwKZGlzYWJsZWQgaW1t
ZWRpYXRlbHkgYWZ0ZXIgY2FsbGluZyBfX3N0b3BfdGhpc19jcHUoKSBmb3IgdGhlIGJvb3QgQ1BV
LAphZnRlciBhbGwgb3RoZXIgQ1BVcyBoYXZlIGJlZW4gc3RvcHBlZC4KCmNmOiBkNjM5YmRkOWJi
ZSAoIng4Ni9hcGljOiBEaXNhYmxlIHRoZSBMQVBJQyBsYXRlciBpbiBzbXBfc2VuZF9zdG9wKCki
KQogICAgLi4uIHdoaWNoIGRpZG4ndCBxdWl0ZSBmaXggaXQgY29tcGxldGVseS4KClNpZ25lZC1v
ZmYtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Ci0tLQogeGVuL2FyY2gv
eDg2L3NtcC5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvc21wLmMgYi94ZW4vYXJjaC94ODYvc21wLmMKaW5kZXggNjVlYjdj
YmRhOC4uZmFjMjk1ZmE2ZiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCisrKyBiL3hl
bi9hcmNoL3g4Ni9zbXAuYwpAQCAtMzU0LDYgKzM1NCw3IEBAIHZvaWQgc21wX3NlbmRfc3RvcCh2
b2lkKQogICAgICAgICBkaXNhYmxlX0lPX0FQSUMoKTsKICAgICAgICAgaHBldF9kaXNhYmxlKCk7
CiAgICAgICAgIF9fc3RvcF90aGlzX2NwdSgpOworICAgICAgICB4MmFwaWNfZW5hYmxlZCA9IChj
dXJyZW50X2xvY2FsX2FwaWNfbW9kZSgpID09IEFQSUNfTU9ERV9YMkFQSUMpOwogICAgICAgICBs
b2NhbF9pcnFfZW5hYmxlKCk7CiAgICAgfQogfQotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
