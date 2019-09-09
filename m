Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55CD2ADB41
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 16:34:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Khl-0001PJ-US; Mon, 09 Sep 2019 14:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=m/oR=XE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7Khj-0001OK-TC
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 14:31:43 +0000
X-Inumbo-ID: 8804fb51-d30e-11e9-ac0d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8804fb51-d30e-11e9-ac0d-12813bfff9fa;
 Mon, 09 Sep 2019 14:31:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45FB3B65C;
 Mon,  9 Sep 2019 14:31:37 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  9 Sep 2019 16:31:29 +0200
Message-Id: <20190909143134.15379-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v4 0/5] enhance lock debugging
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpbGUgaHVudGluZyBhIGxvY2tpbmcgcHJvYmxlbSBpbiBteSBjb3JlIHNjaGVkdWxpbmcgc2Vy
aWVzIEkgaGF2ZQphZGRlZCBzb21lIGRlYnVnZ2luZyBhaWRzIHRvIHNwaW5sb2NrIGhhbmRsaW5n
IG1ha2luZyBpdCBlYXNpZXIgdG8KZmluZCB0aGUgcm9vdCBjYXVzZSBmb3IgdGhlIHByb2JsZW0u
CgpNYWtpbmcgdXNlIG9mIHRoZSBhbHJlYWR5IGV4aXN0aW5nIGxvY2sgcHJvZmlsaW5nIGFuZCBl
bmhhbmNpbmcgaXQgYQpsaXR0bGUgYml0IHByb2R1Y2VzIHNvbWUgcmVhbGx5IHZhbHVhYmxlIGRp
YWdub3N0aWMgZGF0YSBlLmcuIHdoZW4gYQpOTUkgd2F0Y2hkb2cgaXMgdHJpZ2dlcmluZyBhIGNy
YXNoLgoKQ2hhbmdlcyBpbiBWNDoKLSBzb21lIGNvbW1lbnRzIGJ5IEphbiBCZXVsaWNoIGFkZHJl
c3NlZAotIHJlcGxhY2VkIHBhdGNoIDUgd2l0aCBhbm90aGVyIGFwcHJvYWNoIHRvIG1ha2UgbG9j
ayBuYW1lcyB1bmlxdWUKCkNoYW5nZXMgaW4gVjM6Ci0gcmViYXNlIHRvIGN1cnJlbnQgc3RhZ2lu
ZyAoYWZ0ZXIgcmVhbGl6aW5nIHRoYXQgcGF0Y2ggNCBzdGlsbAogIGFwcGxpZWQsIGJ1dCByZXN1
bHRpbmcgaW4gcGF0Y2hpbmcgYSB3cm9uZyBmdW5jdGlvbikKCkNoYW5nZXMgaW4gVjI6Ci0gbXVs
dGlwbGUgY29tbWVudHMgYWRkcmVzc2VkCi0gYWRkZWQgcGF0Y2ggNQoKSnVlcmdlbiBHcm9zcyAo
NSk6CiAgeGVuL3NwaW5sb2NrczogaW4gZGVidWcgYnVpbGRzIHN0b3JlIGNwdSBob2xkaW5nIHRo
ZSBsb2NrCiAgeGVuOiBhZGQgbmV3IENPTkZJR19ERUJVR19MT0NLUyBvcHRpb24KICB4ZW46IHBy
aW50IGxvY2sgcHJvZmlsZSBpbmZvIGluIHBhbmljKCkKICB4ZW46IG1vZGlmeSBsb2NrIHByb2Zp
bGluZyBpbnRlcmZhY2UKICB4ZW46IGFkZCBmdW5jdGlvbiBuYW1lIHRvIGxvY2sgcHJvZmlsaW5n
IGRhdGEKCiB0b29scy9saWJ4Yy94Y19taXNjLmMgICAgICAgfCAgIDEgKwogdG9vbHMvbWlzYy94
ZW5sb2NrcHJvZi5jICAgIHwgIDE3ICstLS0KIHhlbi9LY29uZmlnLmRlYnVnICAgICAgICAgICB8
ICAxMCArKy0KIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICB8ICAxMyArKy0tCiB4ZW4vYXJj
aC94ODYvZG9tYWluLmMgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAg
ICB8ICAxMyArKy0tCiB4ZW4vY29tbW9uL2RvbWFpbi5jICAgICAgICAgfCAgIDQgKy0KIHhlbi9j
b21tb24va2V5aGFuZGxlci5jICAgICB8ICAgMiArLQogeGVuL2NvbW1vbi9zcGlubG9jay5jICAg
ICAgIHwgMTg1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiB4
ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL2NoYXIvY29u
c29sZS5jICB8ICAgNCArLQogeGVuL2luY2x1ZGUvcHVibGljL3N5c2N0bC5oIHwgIDExICstLQog
eGVuL2luY2x1ZGUveGVuL3NwaW5sb2NrLmggIHwgIDc1ICsrKysrKysrKysrLS0tLS0tLQogMTMg
ZmlsZXMgY2hhbmdlZCwgMjIxIGluc2VydGlvbnMoKyksIDExOCBkZWxldGlvbnMoLSkKCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
