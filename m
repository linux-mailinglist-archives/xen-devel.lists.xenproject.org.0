Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C1B386F8
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 11:25:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZB5m-0002bY-3q; Fri, 07 Jun 2019 09:23:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GsDR=UG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hZB5k-0002ao-23
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 09:23:20 +0000
X-Inumbo-ID: e21882c2-8905-11e9-9937-b3ce5be5ba34
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e21882c2-8905-11e9-9937-b3ce5be5ba34;
 Fri, 07 Jun 2019 09:23:17 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fX+4LGZ+RwwDHXJC1AvP3KvU5cdgDKV5fDd04KS7N3HfMTJjiRxLI4R9FxCeMliAYHcpxS59hP
 uc4R268fUtaKpty71THUZ78PHLGFhPLO45vDqCS5s/mOhxEkG1ShJ5hfkW4rMeZPGfG97kbDpD
 ICjdd4jbMye/Hdc87S9Kr6ptnP7ixKqQlUrt8P9F9iIC7Jp8yYc/rQqSaVsRCF5HAIYmWPRvaC
 ysp3OxVdMQUvufGOMhct09Um3Qq0uhKYb9bVJjR2yoafqbGK8z3hhTq0CRZE+nqPYpxAELaRvn
 pQE=
X-SBRS: -0.9
X-MesageID: 1438396
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,562,1557201600"; 
   d="scan'208";a="1438396"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 11:22:25 +0200
Message-ID: <20190607092232.83179-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190607092232.83179-1-roger.pau@citrix.com>
References: <20190607092232.83179-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 06/13] pci: make PCI_SBDF3 return a pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGZpeCBpdCdzIGNhbGxlcnMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXgu
Y29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUu
Y29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzog
VGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhl
bi9jb21tb24vY29tcGF0L21lbW9yeS5jICAgIHwgNCArKy0tCiB4ZW4vY29tbW9uL21lbW9yeS5j
ICAgICAgICAgICB8IDQgKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCA0ICst
LS0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgIHwgMyArKy0KIDQgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vY29tcGF0L21lbW9yeS5jIGIveGVuL2NvbW1vbi9jb21wYXQvbWVtb3J5LmMKaW5kZXggMTNm
ZDY0ZGRmNS4uMmViNzllZmE2NSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9jb21wYXQvbWVtb3J5
LmMKKysrIGIveGVuL2NvbW1vbi9jb21wYXQvbWVtb3J5LmMKQEAgLTI3LDggKzI3LDggQEAgc3Rh
dGljIGludCBnZXRfcmVzZXJ2ZWRfZGV2aWNlX21lbW9yeSh4ZW5fcGZuX3Qgc3RhcnQsIHhlbl91
bG9uZ190IG5yLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgaWQs
IHZvaWQgKmN0eHQpCiB7CiAgICAgc3RydWN0IGdldF9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5ICpn
cmRtID0gY3R4dDsKLSAgICB1MzIgc2JkZiA9IFBDSV9TQkRGMyhncmRtLT5tYXAuZGV2LnBjaS5z
ZWcsIGdyZG0tPm1hcC5kZXYucGNpLmJ1cywKLSAgICAgICAgICAgICAgICAgICAgICAgICBncmRt
LT5tYXAuZGV2LnBjaS5kZXZmbik7CisgICAgdWludDMyX3Qgc2JkZiA9IFBDSV9TQkRGMyhncmRt
LT5tYXAuZGV2LnBjaS5zZWcsIGdyZG0tPm1hcC5kZXYucGNpLmJ1cywKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdyZG0tPm1hcC5kZXYucGNpLmRldmZuKS5zYmRmOwogCiAgICAgaWYg
KCAhKGdyZG0tPm1hcC5mbGFncyAmIFhFTk1FTV9SRE1fQUxMKSAmJiAoc2JkZiAhPSBpZCkgKQog
ICAgICAgICByZXR1cm4gMDsKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbWVtb3J5LmMgYi94ZW4v
Y29tbW9uL21lbW9yeS5jCmluZGV4IGI4YmUxOWE4OTAuLjAzZGI3YmZhOWUgMTAwNjQ0Ci0tLSBh
L3hlbi9jb21tb24vbWVtb3J5LmMKKysrIGIveGVuL2NvbW1vbi9tZW1vcnkuYwpAQCAtOTY4LDgg
Kzk2OCw4IEBAIHN0YXRpYyBpbnQgZ2V0X3Jlc2VydmVkX2RldmljZV9tZW1vcnkoeGVuX3Bmbl90
IHN0YXJ0LCB4ZW5fdWxvbmdfdCBuciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdTMyIGlkLCB2b2lkICpjdHh0KQogewogICAgIHN0cnVjdCBnZXRfcmVzZXJ2ZWRfZGV2
aWNlX21lbW9yeSAqZ3JkbSA9IGN0eHQ7Ci0gICAgdTMyIHNiZGYgPSBQQ0lfU0JERjMoZ3JkbS0+
bWFwLmRldi5wY2kuc2VnLCBncmRtLT5tYXAuZGV2LnBjaS5idXMsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgZ3JkbS0+bWFwLmRldi5wY2kuZGV2Zm4pOworICAgIHVpbnQzMl90IHNiZGYgPSBQ
Q0lfU0JERjMoZ3JkbS0+bWFwLmRldi5wY2kuc2VnLCBncmRtLT5tYXAuZGV2LnBjaS5idXMsCisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncmRtLT5tYXAuZGV2LnBjaS5kZXZmbikuc2Jk
ZjsKIAogICAgIGlmICggIShncmRtLT5tYXAuZmxhZ3MgJiBYRU5NRU1fUkRNX0FMTCkgJiYgKHNi
ZGYgIT0gaWQpICkKICAgICAgICAgcmV0dXJuIDA7CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCmluZGV4IDUz
NWM3ZTUxMWIuLmU4ODY4OTQyNWQgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCkBAIC03NjIsOSArNzYy
LDcgQEAgaW50IHBjaV9hZGRfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sCiAgICAg
ICAgICAgICB7CiAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGlkeCA9IHBvcyArIFBDSV9T
UklPVl9CQVIgKyBpICogNDsKICAgICAgICAgICAgICAgICB1MzIgYmFyID0gcGNpX2NvbmZfcmVh
ZDMyKHNlZywgYnVzLCBzbG90LCBmdW5jLCBpZHgpOwotICAgICAgICAgICAgICAgIHBjaV9zYmRm
X3Qgc2JkZiA9IHsKLSAgICAgICAgICAgICAgICAgICAgLnNiZGYgPSBQQ0lfU0JERjMoc2VnLCBi
dXMsIGRldmZuKSwKLSAgICAgICAgICAgICAgICB9OworICAgICAgICAgICAgICAgIHBjaV9zYmRm
X3Qgc2JkZiA9IFBDSV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pOwogCiAgICAgICAgICAgICAgICAg
aWYgKCAoYmFyICYgUENJX0JBU0VfQUREUkVTU19TUEFDRSkgPT0KICAgICAgICAgICAgICAgICAg
ICAgIFBDSV9CQVNFX0FERFJFU1NfU1BBQ0VfSU8gKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUv
eGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IDUzZDc4NmRhNjYuLjA1ZWUx
MTU3MTUgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgKQEAgLTM4LDcgKzM4LDggQEAKICAgICAoKHBjaV9zYmRmX3QpIHsgLnNiZGYg
PSAoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgUENJX0JERihiLGQsZikgfSkKICNkZWZpbmUgUENJ
X1NCREYyKHMsYmRmKSBcCiAgICAgKChwY2lfc2JkZl90KSB7IC5zYmRmID0gKCgocykgJiAweGZm
ZmYpIDw8IDE2KSB8ICgoYmRmKSAmIDB4ZmZmZikgfSkKLSNkZWZpbmUgUENJX1NCREYzKHMsYixk
ZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGMihiLCBkZikpCisjZGVmaW5lIFBD
SV9TQkRGMyhzLGIsZGYpIFwKKyAgICAoKHBjaV9zYmRmX3QpIHsgLnNiZGYgPSAoKChzKSAmIDB4
ZmZmZikgPDwgMTYpIHwgUENJX0JERjIoYiwgZGYpIH0pCiAKIHR5cGVkZWYgdW5pb24gewogICAg
IHVpbnQzMl90IHNiZGY7Ci0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
