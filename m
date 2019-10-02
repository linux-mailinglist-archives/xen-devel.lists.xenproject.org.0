Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31411C8734
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 13:23:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFcg6-000189-Fv; Wed, 02 Oct 2019 11:20:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFcg4-00017k-BC
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 11:20:16 +0000
X-Inumbo-ID: 977f0c9c-e506-11e9-9713-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 977f0c9c-e506-11e9-9713-12813bfff9fa;
 Wed, 02 Oct 2019 11:20:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1244B02C;
 Wed,  2 Oct 2019 11:20:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 13:19:58 +0200
Message-Id: <20191002112004.25793-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/6] Add hypervisor sysfs-like support
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gdGhlIDIwMTkgWGVuIGRldmVsb3BlciBzdW1taXQgdGhlcmUgd2FzIGFncmVlbWVudCB0aGF0
IHRoZSBYZW4KaHlwZXJ2aXNvciBzaG91bGQgZ2FpbiBzdXBwb3J0IGZvciBhIGhpZXJhcmNoaWNh
bCBuYW1lLXZhbHVlIHN0b3JlCnNpbWlsYXIgdG8gdGhlIExpbnV4IGtlcm5lbCdzIHN5c2ZzLgoK
VGhpcyBpcyBhIGZpcnN0IGltcGxlbWVudGF0aW9uIG9mIHRoYXQgaWRlYSBhZGRpbmcgdGhlIGJh
c2ljCmZ1bmN0aW9uYWxpdHkgdG8gaHlwZXJ2aXNvciBhbmQgdG9vbHMgc2lkZS4gVGhlIGludGVy
ZmFjZSB0byBhbnkKdXNlciBwcm9ncmFtIG1ha2luZyB1c2Ugb2YgdGhhdCAieGVuLWh5cGZzIiBp
cyBhIG5ldyBsaWJyYXJ5CiJsaWJ4ZW5oeXBmcyIgd2l0aCBhIHN0YWJsZSBpbnRlcmZhY2UuCgpD
aGFuZ2VzIGluIFYyOgotIGFsbCBjb21tZW50cyB0byBWMSBhZGRyZXNzZWQKLSBhZGRlZCBtYW4t
cGFnZSBmb3IgeGVuaHlwZnMgdG9vbAotIGFkZGVkIHJ1bnRpbWUgcGFyYW1ldGVyIHJlYWQgYWNj
ZXNzIGZvciBzdHJpbmcgcGFyYW1ldGVycwoKQ2hhbmdlcyBpbiBWMToKLSByZW5hbWVkIHhlbmZz
IC0+eGVuaHlwZnMKLSBhZGRlZCB3cml0YWJsZSBlbnRyaWVzIHN1cHBvcnQgYXQgdGhlIGludGVy
ZmFjZSBsZXZlbCBhbmQgaW4gdGhlCiAgeGVuaHlwZnMgdG9vbAotIGFkZGVkIHJ1bnRpbWUgcGFy
YW1ldGVyIHJlYWQgYWNjZXNzIChpbnRlZ2VyIHR5cGUgb25seSBmb3Igbm93KQotIGFkZGVkIGRv
Y3MvbWlzYy9oeXBmcy1wYXRocy5wYW5kb2MgZm9yIHBhdGggZGVzY3JpcHRpb25zCgpKdWVyZ2Vu
IEdyb3NzICg2KToKICBkb2NzOiBhZGQgZmVhdHVyZSBkb2N1bWVudCBmb3IgWGVuIGh5cGVydmlz
b3Igc3lzZnMtbGlrZSBzdXBwb3J0CiAgeGVuOiBhZGQgYmFzaWMgaHlwZXJ2aXNvciBmaWxlc3lz
dGVtIHN1cHBvcnQKICBsaWJzOiBhZGQgbGlieGVuaHlwZnMKICB0b29sczogYWRkIHhlbmZzIHRv
b2wKICB4ZW46IGFkZCAvYnVpbGRpbmZvL2NvbmZpZyBlbnRyeSB0byBoeXBlcnZpc29yIGZpbGVz
eXN0ZW0KICB4ZW46IGFkZCBydW50aW1lIHBhcmFtZXRlciByZWFkaW5nIHN1cHBvcnQgdG8gaHlw
ZnMKCiAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyArCiBkb2NzL2Zl
YXR1cmVzL2h5cGVydmlzb3Jmcy5wYW5kb2MgICB8ICA4NyArKysrKysrKysrCiBkb2NzL21hbi94
ZW5oeXBmcy4xLnBvZCAgICAgICAgICAgICB8ICA2MSArKysrKysrCiBkb2NzL21pc2MvaHlwZnMt
cGF0aHMucGFuZG9jICAgICAgICB8IDExMyArKysrKysrKysrKysKIHRvb2xzL1J1bGVzLm1rICAg
ICAgICAgICAgICAgICAgICAgIHwgICA2ICsKIHRvb2xzL2xpYnMvTWFrZWZpbGUgICAgICAgICAg
ICAgICAgIHwgICAxICsKIHRvb2xzL2xpYnMvaHlwZnMvTWFrZWZpbGUgICAgICAgICAgIHwgIDE0
ICsrCiB0b29scy9saWJzL2h5cGZzL2NvcmUuYyAgICAgICAgICAgICB8IDI1MiArKysrKysrKysr
KysrKysrKysrKysrKysrKysKIHRvb2xzL2xpYnMvaHlwZnMvaW5jbHVkZS94ZW5oeXBmcy5oIHwg
IDYwICsrKysrKysKIHRvb2xzL2xpYnMvaHlwZnMvbGlieGVuaHlwZnMubWFwICAgIHwgICA5ICsK
IHRvb2xzL2xpYnMvaHlwZnMveGVuaHlwZnMucGMuaW4gICAgIHwgIDEwICsrCiB0b29scy9taXNj
L01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgNiArCiB0b29scy9taXNjL3hlbmh5cGZzLmMg
ICAgICAgICAgICAgICB8IDE2MCArKysrKysrKysrKysrKysrKwogeGVuL2FyY2gvYXJtL3RyYXBz
LmMgICAgICAgICAgICAgICAgfCAgIDEgKwogeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyAg
ICAgICAgfCAgIDEgKwogeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jICAgICAgICAgICAgfCAgIDEg
KwogeGVuL2FyY2gveDg2L3B2L2h5cGVyY2FsbC5jICAgICAgICAgfCAgIDEgKwogeGVuL2NvbW1v
bi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgMTAgKysKIHhlbi9jb21tb24vaHlwZnMuYyAg
ICAgICAgICAgICAgICAgIHwgMzM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgICAgICAgICAgICAgfCAgMzkgKysrKysKIHhlbi9p
bmNsdWRlL3B1YmxpYy9lcnJuby5oICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL3B1Ymxp
Yy9oeXBmcy5oICAgICAgICAgIHwgMTIzICsrKysrKysrKysrKysKIHhlbi9pbmNsdWRlL3B1Ymxp
Yy94ZW4uaCAgICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL3hlbi9oeXBlcmNhbGwuaCAg
ICAgICAgIHwgICA4ICsKIHhlbi9pbmNsdWRlL3hlbi9oeXBmcy5oICAgICAgICAgICAgIHwgIDQw
ICsrKysrCiB4ZW4vaW5jbHVkZS94ZW4va2VybmVsLmggICAgICAgICAgICB8ICAgMiArCiB4ZW4v
dG9vbHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgOSArLQogeGVuL3Rvb2xzL2JpbjJj
LmMgICAgICAgICAgICAgICAgICAgfCAgMjggKysrCiAyOCBmaWxlcyBjaGFuZ2VkLCAxMzgwIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9mZWF0
dXJlcy9oeXBlcnZpc29yZnMucGFuZG9jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZG9jcy9tYW4veGVu
aHlwZnMuMS5wb2QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFu
ZG9jCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy9oeXBmcy9NYWtlZmlsZQogY3JlYXRl
IG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvaHlwZnMvY29yZS5jCiBjcmVhdGUgbW9kZSAxMDA2NDQg
dG9vbHMvbGlicy9oeXBmcy9pbmNsdWRlL3hlbmh5cGZzLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy9saWJzL2h5cGZzL2xpYnhlbmh5cGZzLm1hcAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L2xpYnMvaHlwZnMveGVuaHlwZnMucGMuaW4KIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9taXNj
L3hlbmh5cGZzLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vY29tbW9uL2h5cGZzLmMKIGNyZWF0
ZSBtb2RlIDEwMDY0NCB4ZW4vaW5jbHVkZS9wdWJsaWMvaHlwZnMuaAogY3JlYXRlIG1vZGUgMTAw
NjQ0IHhlbi9pbmNsdWRlL3hlbi9oeXBmcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL3Rvb2xz
L2JpbjJjLmMKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
