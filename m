Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F436F6A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:05:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoHs-0006XF-RR; Thu, 06 Jun 2019 09:02:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoHr-0006Wr-51
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:19 +0000
X-Inumbo-ID: c76e8164-8839-11e9-86be-0b792235856e
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c76e8164-8839-11e9-86be-0b792235856e;
 Thu, 06 Jun 2019 09:02:15 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ee5vBmnecD5es/pP4+OFNVRB2hk2PcaX3jCUW5m24ElcrAKFtbhsFR784BBkDA0VNebmwr6pyW
 d3Y9lAOmWHEtoFVgaz0zStMH94Qkui/CsxkjELeGh0uFuBSwsUIuYPWoznvqXQJ3hQxNgdxJ52
 Pco4aQimCb1qxYbx5xCsr8KMjONaP08QrLJMKU53cBqxzy5M/YWaP6N6vsCIycXB54E8TyHce7
 Ci4tnS/9GrePffFvVwbh6AQ7n5QWDwLYKF5mfv15jehqNYxn7RwZVUqKkqiKzHmIo6D7thk02H
 bx8=
X-SBRS: -0.9
X-MesageID: 1364742
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1364742"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:37 +0200
Message-ID: <20190606090146.77381-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190606090146.77381-1-roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kIGZpeCBpdCdzIG9ubHkgY2FsbGVyLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpD
YzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGlt
QHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToK
IC0gTmV3IGluIHRoaXMgdmVyc2lvbi4KLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
ZG1hci5jIHwgMyArKy0KIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgICAgICAgfCAzICsr
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKaW5kZXggOWNjODYyM2U1My4uNTlhNDZjZDFjNiAxMDA2
NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCkBAIC0xMTE1LDcgKzExMTUsOCBAQCBzdGF0aWMg
aW50IF9faW5pdCBwYXJzZV9ybXJyX3BhcmFtKGNvbnN0IGNoYXIgKnN0cikKIAogICAgICAgICAg
ICAgLyogS2VlcCBzYmRmJ3MgZXZlbiBpZiB0aGV5IGRpZmZlciBhbmQgbGF0ZXIgcmVwb3J0IGFu
IGVycm9yLiAqLwogICAgICAgICAgICAgZGV2X2NvdW50ID0gdXNlcl9ybXJyc1tucl9ybXJyXS5k
ZXZfY291bnQ7Ci0gICAgICAgICAgICB1c2VyX3JtcnJzW25yX3JtcnJdLnNiZGZbZGV2X2NvdW50
XSA9IFBDSV9TQkRGKHNlZywgYnVzLCBkZXYsIGZ1bmMpOworICAgICAgICAgICAgdXNlcl9ybXJy
c1tucl9ybXJyXS5zYmRmW2Rldl9jb3VudF0gPQorICAgICAgICAgICAgICAgUENJX1NCREYoc2Vn
LCBidXMsIGRldiwgZnVuYykuc2JkZjsKIAogICAgICAgICAgICAgdXNlcl9ybXJyc1tucl9ybXJy
XS5kZXZfY291bnQrKzsKICAgICAgICAgICAgIHMgPSBzdG1wOwpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IGY0OTA4YWJkOGIu
LjllYTQxNzg5ZDAgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vcGNpLmgKQEAgLTM0LDcgKzM0LDggQEAKICNkZWZpbmUgUENJX0RFVkZOMihi
ZGYpICgoYmRmKSAmIDB4ZmYpCiAjZGVmaW5lIFBDSV9CREYoYixkLGYpICAoKCgoYikgJiAweGZm
KSA8PCA4KSB8IFBDSV9ERVZGTihkLGYpKQogI2RlZmluZSBQQ0lfQkRGMihiLGRmKSAgKCgoKGIp
ICYgMHhmZikgPDwgOCkgfCAoKGRmKSAmIDB4ZmYpKQotI2RlZmluZSBQQ0lfU0JERihzLGIsZCxm
KSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8IFBDSV9CREYoYixkLGYpKQorI2RlZmluZSBQQ0lf
U0JERihzLGIsZCxmKSBcCisgICAgKChwY2lfc2JkZl90KSB7IC5zYmRmID0gKCgocykgJiAweGZm
ZmYpIDw8IDE2KSB8IFBDSV9CREYoYixkLGYpIH0pCiAjZGVmaW5lIFBDSV9TQkRGMihzLGJkZikg
KCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCAoKGJkZikgJiAweGZmZmYpKQogI2RlZmluZSBQQ0lf
U0JERjMocyxiLGRmKSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8IFBDSV9CREYyKGIsIGRmKSkK
IAotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
