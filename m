Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE92A15D2
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:22:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HWb-0003a7-SD; Thu, 29 Aug 2019 10:19:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=c8TN=WZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i3HWb-0003a1-A3
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:19:29 +0000
X-Inumbo-ID: 7b84a504-ca46-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7b84a504-ca46-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 10:19:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 34D42B649;
 Thu, 29 Aug 2019 10:18:49 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 29 Aug 2019 12:18:41 +0200
Message-Id: <20190829101846.21369-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v3 0/5] enhance lock debugging
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
YXNoLgoKQ2hhbmdlcyBpbiBWMzoKLSByZWJhc2UgdG8gY3VycmVudCBzdGFnaW5nIChhZnRlciBy
ZWFsaXppbmcgdGhhdCBwYXRjaCA0IHN0aWxsCiAgYXBwbGllZCwgYnV0IHJlc3VsdGluZyBpbiBw
YXRjaGluZyBhIHdyb25nIGZ1bmN0aW9uKQoKQ2hhbmdlcyBpbiBWMjoKLSBtdWx0aXBsZSBjb21t
ZW50cyBhZGRyZXNzZWQKLSBhZGRlZCBwYXRjaCA1CgpKdWVyZ2VuIEdyb3NzICg1KToKICB4ZW4v
c3BpbmxvY2tzOiBpbiBkZWJ1ZyBidWlsZHMgc3RvcmUgY3B1IGhvbGRpbmcgdGhlIGxvY2sKICB4
ZW46IGFkZCBuZXcgQ09ORklHX0RFQlVHX0xPQ0tTIG9wdGlvbgogIHhlbjogcHJpbnQgbG9jayBw
cm9maWxlIGluZm8gaW4gcGFuaWMoKQogIHhlbjogbW9kaWZ5IGxvY2sgcHJvZmlsaW5nIGludGVy
ZmFjZQogIHhlbjogbW9kaWZ5IHNldmVyYWwgc3RhdGljIGxvY2tzIHRvIHVuaXF1ZSBuYW1lcwoK
IHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICB8ICAgMSArCiB0b29scy9taXNjL3hlbmxvY2tw
cm9mLmMgICAgfCAgMTcgKystLS0KIHhlbi9LY29uZmlnLmRlYnVnICAgICAgICAgICB8ICAxMCAr
Ky0KIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAgICB8ICAxMyArKy0tCiB4ZW4vYXJjaC94ODYv
ZG9tYWluLmMgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAgICB8ICAg
NiArLQogeGVuL2FyY2gveDg2L3RpbWUuYyAgICAgICAgIHwgICA2ICstCiB4ZW4vYXJjaC94ODYv
eGVuLmxkcy5TICAgICAgfCAgMTMgKystLQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgIHwg
ICA0ICstCiB4ZW4vY29tbW9uL2tleWhhbmRsZXIuYyAgICAgfCAgIDggKy0tCiB4ZW4vY29tbW9u
L3BlcmZjLmMgICAgICAgICAgfCAgIDYgKy0KIHhlbi9jb21tb24vc3BpbmxvY2suYyAgICAgICB8
IDE2MSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogeGVuL2Nv
bW1vbi9zeXNjdGwuYyAgICAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL3RyYWNlLmMgICAgICAg
ICAgfCAgIDYgKy0KIHhlbi9kcml2ZXJzL2NoYXIvY29uc29sZS5jICB8ICAxMCArLS0KIHhlbi9p
bmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICAxMSArKy0KIHhlbi9pbmNsdWRlL3hlbi9zcGlubG9j
ay5oICB8ICA2MCArKysrKysrKysrLS0tLS0tLQogMTcgZmlsZXMgY2hhbmdlZCwgMjA2IGluc2Vy
dGlvbnMoKyksIDEzMCBkZWxldGlvbnMoLSkKCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
