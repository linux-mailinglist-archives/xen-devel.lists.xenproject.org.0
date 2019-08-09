Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB4387201
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 08:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvy49-0006be-OI; Fri, 09 Aug 2019 06:07:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yG4W=WF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvy48-0006bO-Fx
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 06:07:52 +0000
X-Inumbo-ID: 0454d113-ba6c-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0454d113-ba6c-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 06:07:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CB01FB052;
 Fri,  9 Aug 2019 06:07:48 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  9 Aug 2019 08:07:39 +0200
Message-Id: <20190809060744.8985-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2 0/5] enhance lock debugging
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
CgpNYWtpbmcgdXNlIG9mIHRoZSBhbHJlYWR5IGxvY2sgcHJvZmlsaW5nIGFuZCBlbmhhbmNpbmcg
aXQgYSBsaXR0bGUKYml0IHByb2R1Y2VzIHNvbWUgcmVhbGx5IHZhbHVhYmxlIGRpYWdub3N0aWMg
ZGF0YSBlLmcuIHdoZW4gYSBOTUkKd2F0Y2hkb2cgaXMgdHJpZ2dlcmluZyBhIGNyYXNoLgoKQ2hh
bmdlcyBpbiBWMjoKLSBtdWx0aXBsZSBjb21tZW50cyBhZGRyZXNzZWQKLSBhZGRlZCBwYXRjaCA1
CgpKdWVyZ2VuIEdyb3NzICg1KToKICB4ZW4vc3BpbmxvY2tzOiBpbiBkZWJ1ZyBidWlsZHMgc3Rv
cmUgY3B1IGhvbGRpbmcgdGhlIGxvY2sKICB4ZW46IGFkZCBuZXcgQ09ORklHX0RFQlVHX0xPQ0tT
IG9wdGlvbgogIHhlbjogcHJpbnQgbG9jayBwcm9maWxlIGluZm8gaW4gcGFuaWMoKQogIHhlbjog
bW9kaWZ5IGxvY2sgcHJvZmlsaW5nIGludGVyZmFjZQogIHhlbjogbW9kaWZ5IHNldmVyYWwgc3Rh
dGljIGxvY2tzIHRvIHVuaXF1ZSBuYW1lcwoKIHRvb2xzL2xpYnhjL3hjX21pc2MuYyAgICAgICB8
ICAgMSArCiB0b29scy9taXNjL3hlbmxvY2twcm9mLmMgICAgfCAgMTcgKystLS0KIHhlbi9LY29u
ZmlnLmRlYnVnICAgICAgICAgICB8ICAxMCArKy0KIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgICAg
ICB8ICAxMyArKy0tCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgfCAgIDIgKy0KIHhlbi9h
cmNoL3g4Ni9pcnEuYyAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gveDg2L3RpbWUuYyAgICAg
ICAgIHwgICA2ICstCiB4ZW4vYXJjaC94ODYveGVuLmxkcy5TICAgICAgfCAgMTMgKystLQogeGVu
L2NvbW1vbi9kb21haW4uYyAgICAgICAgIHwgICA0ICstCiB4ZW4vY29tbW9uL2tleWhhbmRsZXIu
YyAgICAgfCAgIDggKy0tCiB4ZW4vY29tbW9uL3BlcmZjLmMgICAgICAgICAgfCAgIDYgKy0KIHhl
bi9jb21tb24vc3BpbmxvY2suYyAgICAgICB8IDE2MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLQogeGVuL2NvbW1vbi9zeXNjdGwuYyAgICAgICAgIHwgICAyICst
CiB4ZW4vY29tbW9uL3RyYWNlLmMgICAgICAgICAgfCAgIDYgKy0KIHhlbi9kcml2ZXJzL2NoYXIv
Y29uc29sZS5jICB8ICAxMCArLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaCB8ICAxMSAr
Ky0KIHhlbi9pbmNsdWRlL3hlbi9zcGlubG9jay5oICB8ICA2MCArKysrKysrKysrLS0tLS0tLQog
MTcgZmlsZXMgY2hhbmdlZCwgMjA2IGluc2VydGlvbnMoKyksIDEzMCBkZWxldGlvbnMoLSkKCi0t
IAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
