Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBFB158EB5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 13:41:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1UnR-0007i3-PO; Tue, 11 Feb 2020 12:37:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zfJQ=37=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j1UnR-0007hy-08
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 12:37:45 +0000
X-Inumbo-ID: 4c784308-4ccb-11ea-8bf0-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c784308-4ccb-11ea-8bf0-bc764e2007e4;
 Tue, 11 Feb 2020 12:37:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9131CB1F1;
 Tue, 11 Feb 2020 12:37:42 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 11 Feb 2020 13:37:40 +0100
Message-Id: <20200211123740.17082-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen: remove empty softirq_init()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

c29mdGlycV9pbml0KCkgaXMgZW1wdHkgc2luY2UgU2VuIDQuMS4gUmVtb3ZlIGl0IHRvZ2V0aGVy
IHdpdGggaXRzIGNhbGwKc2l0ZXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jv
c3NAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICB8IDIgLS0KIHhlbi9h
cmNoL3g4Ni9zZXR1cC5jICAgICAgfCAxIC0KIHhlbi9jb21tb24vc29mdGlycS5jICAgICAgfCA0
IC0tLS0KIHhlbi9pbmNsdWRlL3hlbi9zb2Z0aXJxLmggfCAxIC0KIDQgZmlsZXMgY2hhbmdlZCwg
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9h
cmNoL2FybS9zZXR1cC5jCmluZGV4IDNjOGFlMTFiNzMuLjc5NjhjZWU0N2QgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL2FybS9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCkBAIC04NzYs
OCArODc2LDYgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgYm9vdF9waHlz
X29mZnNldCwKIAogICAgIGdpY19pbml0KCk7CiAKLSAgICBzb2Z0aXJxX2luaXQoKTsKLQogICAg
IHRhc2tsZXRfc3Vic3lzX2luaXQoKTsKIAogICAgIGlmICggeHNtX2R0X2luaXQoKSAhPSAxICkK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3NldHVwLmMK
aW5kZXggZTUwZTFmODZiMy4uM2ZiYWVlMTU2ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3Nl
dHVwLmMKKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKQEAgLTE1MzMsNyArMTUzMyw2IEBAIHZv
aWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcgbWJpX3ApCiAgICAg
Y29uc29sZV9pbml0X3JpbmcoKTsKICAgICB2ZXNhX2luaXQoKTsKIAotICAgIHNvZnRpcnFfaW5p
dCgpOwogICAgIHRhc2tsZXRfc3Vic3lzX2luaXQoKTsKIAogICAgIHBhZ2luZ19pbml0KCk7CmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL3NvZnRpcnEuYyBiL3hlbi9jb21tb24vc29mdGlycS5jCmlu
ZGV4IDJkNjYxOTMyMDMuLmI4M2FkOTZkNmMgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc29mdGly
cS5jCisrKyBiL3hlbi9jb21tb24vc29mdGlycS5jCkBAIC0xMzIsMTAgKzEzMiw2IEBAIHZvaWQg
cmFpc2Vfc29mdGlycSh1bnNpZ25lZCBpbnQgbnIpCiAgICAgc2V0X2JpdChuciwgJnNvZnRpcnFf
cGVuZGluZyhzbXBfcHJvY2Vzc29yX2lkKCkpKTsKIH0KIAotdm9pZCBfX2luaXQgc29mdGlycV9p
bml0KHZvaWQpCi17Ci19Ci0KIC8qCiAgKiBMb2NhbCB2YXJpYWJsZXM6CiAgKiBtb2RlOiBDCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc29mdGlycS5oIGIveGVuL2luY2x1ZGUveGVuL3Nv
ZnRpcnEuaAppbmRleCBkNzI3M2IzODliLi5iNDcyNGY1YzhiIDEwMDY0NAotLS0gYS94ZW4vaW5j
bHVkZS94ZW4vc29mdGlycS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9zb2Z0aXJxLmgKQEAgLTI1
LDcgKzI1LDYgQEAgdHlwZWRlZiB2b2lkICgqc29mdGlycV9oYW5kbGVyKSh2b2lkKTsKIAogdm9p
ZCBkb19zb2Z0aXJxKHZvaWQpOwogdm9pZCBvcGVuX3NvZnRpcnEoaW50IG5yLCBzb2Z0aXJxX2hh
bmRsZXIgaGFuZGxlcik7Ci12b2lkIHNvZnRpcnFfaW5pdCh2b2lkKTsKIAogdm9pZCBjcHVtYXNr
X3JhaXNlX3NvZnRpcnEoY29uc3QgY3B1bWFza190ICosIHVuc2lnbmVkIGludCBucik7CiB2b2lk
IGNwdV9yYWlzZV9zb2Z0aXJxKHVuc2lnbmVkIGludCBjcHUsIHVuc2lnbmVkIGludCBucik7Ci0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
