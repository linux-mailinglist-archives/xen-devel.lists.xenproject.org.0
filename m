Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8106E728
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:10:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoTXr-0006wL-PP; Fri, 19 Jul 2019 14:07:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RcFV=VQ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hoTXq-0006wB-UL
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:07:34 +0000
X-Inumbo-ID: 8d692d6d-aa2e-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8d692d6d-aa2e-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 14:07:33 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VEeZxOSt3DsDEjd06WYc4rvQNchVKbuFi81D3fEpe1rFGeuC+sFJT8EiGZHY9CbU96XjlH366I
 HNqlWR1cmxUFCaUXOJI4iiXErzvAryWSK3xj0x5becAMoBqnmbyvU5xD7pYivtU8me1JCiFs+h
 /cOq2yoGhTZhEWaHHl8JWDYDqI+N/3DHp71omYdgzE2xpMpzSpVcubz9UQ9DGtQwc+X6TvNGK/
 dOB5XPtlEMv3XhZVfoVAwIFRbTcl/bw976caAZMa0a6zfxRAnQQGGk9K5987LhPPhll+Qpyh00
 7vo=
X-SBRS: 2.7
X-MesageID: 3219931
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,282,1559534400"; 
   d="scan'208";a="3219931"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 19 Jul 2019 16:07:19 +0200
Message-ID: <20190719140724.69596-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190719140724.69596-1-roger.pau@citrix.com>
References: <20190719140724.69596-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 1/6] pci: switch pci_conf_read8 to use
 pci_sbdf_t
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Brian Woods <brian.woods@amd.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyByZWR1Y2VzIHRoZSBudW1iZXIgb2YgcGFyYW1ldGVycyBvZiB0aGUgZnVuY3Rpb24gdG8g
dHdvLCBhbmQKc2ltcGxpZmllcyBzb21lIG9mIHRoZSBjYWxsaW5nIHNpdGVzLgoKU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkFja2VkLWJ5OiBCcmlhbiBXb29kcyA8
YnJpYW4ud29vZHNAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgpDYzogR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpD
YzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBr
ZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBTdXJhdmVlIFN1dGhp
a3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgpDYzogQnJpYW4gV29vZHMg
PGJyaWFuLndvb2RzQGFtZC5jb20+CkNjOiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNv
bT4KLS0tCkNoYW5nZXMgc2luY2UgdjM6CiAtIERyb3Agc3RyYXkgY2hhbmdlIHRvIG9uZSBwY2lf
Y29uZl93cml0ZTggaW5zdGFuY2UuCi0tLQogeGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgICAgICAg
ICAgICAgICAgICB8ICAyICstCiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMgICAgICAgICAgICAgICAgfCAy
NSArKysrKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL2NoYXIvZWhjaS1kYmdwLmMg
ICAgICAgICAgICAgfCAgNSArKystLQogeGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgICAgICAg
ICAgICAgICB8ICA2ICsrKystLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2lu
aXQuYyB8ICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyAgICAgICAgICAgIHwg
MjEgKysrKysrKystLS0tLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFy
LmMgICAgICAgfCAgNiArKystLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xdWlya3Mu
YyAgICAgfCAgNiArKystLS0KIHhlbi9kcml2ZXJzL3BjaS9wY2kuYyAgICAgICAgICAgICAgICAg
ICAgfCAgOSArKysrLS0tLS0KIHhlbi9kcml2ZXJzL3ZpZGVvL3ZnYS5jICAgICAgICAgICAgICAg
ICAgfCAgMyArLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICAgICAgICAgICAgfCAg
MyArLS0KIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgICAgICAgICAgICAgfCAgOCArKyst
LS0tLQogeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgICAgICAgICAgICB8ICA0ICstLS0K
IDE0IGZpbGVzIGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDU2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5j
CmluZGV4IDgzOWYxOTI5MmQuLmM2Yzc0ZTc1ZjUgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9j
cHUvYW1kLmMKKysrIGIveGVuL2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtNDIwLDcgKzQyMCw3IEBA
IHN0YXRpYyB2b2lkIGRpc2FibGVfYzFfcmFtcGluZyh2b2lkKQogCW5yX25vZGVzID0gKChwY2lf
Y29uZl9yZWFkMzIoMCwgMCwgMHgxOCwgMHgwLCAweDYwKT4+NCkmMHgwNykrMTsKIAlmb3IgKG5v
ZGUgPSAwOyBub2RlIDwgbnJfbm9kZXM7IG5vZGUrKykgewogCQkvKiBQTU03OiBidXM9MCwgZGV2
PTB4MTgrbm9kZSwgZnVuY3Rpb249MHgzLCByZWdpc3Rlcj0weDg3LiAqLwotCQlwbW03ID0gcGNp
X2NvbmZfcmVhZDgoMCwgMCwgMHgxOCtub2RlLCAweDMsIDB4ODcpOworCQlwbW03ID0gcGNpX2Nv
bmZfcmVhZDgoUENJX1NCREYoMCwgMCwgMHgxOCArIG5vZGUsIDMpLCAweDg3KTsKIAkJLyogSW52
YWxpZCByZWFkIG1lYW5zIHdlJ3ZlIHVwZGF0ZWQgZXZlcnkgTm9ydGhicmlkZ2UuICovCiAJCWlm
IChwbW03ID09IDB4RkYpCiAJCQlicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tc2ku
YyBiL3hlbi9hcmNoL3g4Ni9tc2kuYwppbmRleCA4OWU2MTE2MGU5Li5lZDhiODljYzBmIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvbXNpLmMKKysrIGIveGVuL2FyY2gveDg2L21zaS5jCkBAIC04
MDAsNyArODAwLDcgQEAgc3RhdGljIHU2NCByZWFkX3BjaV9tZW1fYmFyKHUxNiBzZWcsIHU4IGJ1
cywgdTggc2xvdCwgdTggZnVuYywgdTggYmlyLCBpbnQgdmYpCiAgICAgICAgIGRpc3AgPSB2ZiAq
IHBkZXYtPnZmX3JsZW5bYmlyXTsKICAgICAgICAgbGltaXQgPSBQQ0lfU1JJT1ZfTlVNX0JBUlM7
CiAgICAgfQotICAgIGVsc2Ugc3dpdGNoICggcGNpX2NvbmZfcmVhZDgoc2VnLCBidXMsIHNsb3Qs
IGZ1bmMsCisgICAgZWxzZSBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1
cywgc2xvdCwgZnVuYyksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfSEVB
REVSX1RZUEUpICYgMHg3ZiApCiAgICAgewogICAgIGNhc2UgUENJX0hFQURFUl9UWVBFX05PUk1B
TDoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMgYi94ZW4vYXJjaC94ODYv
eDg2XzY0L3BjaS5jCmluZGV4IDZlM2Y1Y2YyMDMuLmI3MDM4M2ZiMDMgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvcGNpLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl82NC9wY2kuYwpA
QCAtOCwyNyArOCwyNiBAQAogI2luY2x1ZGUgPHhlbi9wY2kuaD4KICNpbmNsdWRlIDxhc20vaW8u
aD4KIAotI2RlZmluZSBQQ0lfQ09ORl9BRERSRVNTKGJ1cywgZGV2LCBmdW5jLCByZWcpIFwKLSAg
ICAoMHg4MDAwMDAwMCB8IChidXMgPDwgMTYpIHwgKGRldiA8PCAxMSkgfCAoZnVuYyA8PCA4KSB8
IChyZWcgJiB+MykpCisjZGVmaW5lIFBDSV9DT05GX0FERFJFU1Moc2JkZiwgcmVnKSBcCisgICAg
KDB4ODAwMDAwMDAgfCAoKHNiZGYpLmJkZiA8PCA4KSB8ICgocmVnKSAmIH4zKSkKIAotdWludDhf
dCBwY2lfY29uZl9yZWFkOCgKLSAgICB1bnNpZ25lZCBpbnQgc2VnLCB1bnNpZ25lZCBpbnQgYnVz
LCB1bnNpZ25lZCBpbnQgZGV2LCB1bnNpZ25lZCBpbnQgZnVuYywKLSAgICB1bnNpZ25lZCBpbnQg
cmVnKQordWludDhfdCBwY2lfY29uZl9yZWFkOChwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGlu
dCByZWcpCiB7Ci0gICAgdTMyIHZhbHVlOworICAgIHVpbnQzMl90IHZhbHVlOwogCi0gICAgaWYg
KCBzZWcgfHwgcmVnID4gMjU1ICkKKyAgICBpZiAoIHNiZGYuc2VnIHx8IHJlZyA+IDI1NSApCiAg
ICAgewotICAgICAgICBwY2lfbW1jZmdfcmVhZChzZWcsIGJ1cywgUENJX0RFVkZOKGRldiwgZnVu
YyksIHJlZywgMSwgJnZhbHVlKTsKKyAgICAgICAgcGNpX21tY2ZnX3JlYWQoc2JkZi5zZWcsIHNi
ZGYuYnVzLCBzYmRmLmRldmZuLCByZWcsIDEsICZ2YWx1ZSk7CiAgICAgICAgIHJldHVybiB2YWx1
ZTsKICAgICB9Ci0gICAgZWxzZQotICAgIHsKLSAgICAgICAgQlVHX09OKChidXMgPiAyNTUpIHx8
IChkZXYgPiAzMSkgfHwgKGZ1bmMgPiA3KSk7Ci0gICAgICAgIHJldHVybiBwY2lfY29uZl9yZWFk
KFBDSV9DT05GX0FERFJFU1MoYnVzLCBkZXYsIGZ1bmMsIHJlZyksIHJlZyAmIDMsIDEpOwotICAg
IH0KKworICAgIHJldHVybiBwY2lfY29uZl9yZWFkKFBDSV9DT05GX0FERFJFU1Moc2JkZiwgcmVn
KSwgcmVnICYgMywgMSk7CiB9CiAKKyN1bmRlZiBQQ0lfQ09ORl9BRERSRVNTCisjZGVmaW5lIFBD
SV9DT05GX0FERFJFU1MoYnVzLCBkZXYsIGZ1bmMsIHJlZykgXAorICAgICgweDgwMDAwMDAwIHwg
KGJ1cyA8PCAxNikgfCAoZGV2IDw8IDExKSB8IChmdW5jIDw8IDgpIHwgKHJlZyAmIH4zKSkKKwog
dWludDE2X3QgcGNpX2NvbmZfcmVhZDE2KAogICAgIHVuc2lnbmVkIGludCBzZWcsIHVuc2lnbmVk
IGludCBidXMsIHVuc2lnbmVkIGludCBkZXYsIHVuc2lnbmVkIGludCBmdW5jLAogICAgIHVuc2ln
bmVkIGludCByZWcpCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9jaGFyL2VoY2ktZGJncC5jIGIv
eGVuL2RyaXZlcnMvY2hhci9laGNpLWRiZ3AuYwppbmRleCA0NzVkYzQxNzY3Li43MWYwYWFhNmFj
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9jaGFyL2VoY2ktZGJncC5jCisrKyBiL3hlbi9kcml2
ZXJzL2NoYXIvZWhjaS1kYmdwLmMKQEAgLTcxMyw3ICs3MTMsNyBAQCBzdGF0aWMgdW5zaWduZWQg
aW50IF9faW5pdCBmaW5kX2RiZ3Aoc3RydWN0IGVoY2lfZGJncCAqZGJncCwKICAgICAgICAgICAg
ICAgICBjYXAgPSBfX2ZpbmRfZGJncChidXMsIHNsb3QsIGZ1bmMpOwogICAgICAgICAgICAgICAg
IGlmICggIWNhcCB8fCBlaGNpX251bS0tICkKICAgICAgICAgICAgICAgICB7Ci0gICAgICAgICAg
ICAgICAgICAgIGlmICggIWZ1bmMgJiYgIShwY2lfY29uZl9yZWFkOCgwLCBidXMsIHNsb3QsIGZ1
bmMsCisgICAgICAgICAgICAgICAgICAgIGlmICggIWZ1bmMgJiYgIShwY2lfY29uZl9yZWFkOChQ
Q0lfU0JERigwLCBidXMsIHNsb3QsIGZ1bmMpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSAmIDB4ODApICkKICAgICAg
ICAgICAgICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsK
QEAgLTEzMTIsNyArMTMxMiw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlaGNpX2RiZ3BfaW5pdF9w
cmVpcnEoc3RydWN0IHNlcmlhbF9wb3J0ICpwb3J0KQogICAgIG9mZnNldCA9IChkZWJ1Z19wb3J0
ID4+IDE2KSAmIDB4ZmZmOwogCiAgICAgLyogZG91YmxlIGNoZWNrIGlmIHRoZSBtZW0gc3BhY2Ug
aXMgZW5hYmxlZCAqLwotICAgIGRiZ3AtPnBjaV9jciA9IHBjaV9jb25mX3JlYWQ4KDAsIGRiZ3At
PmJ1cywgZGJncC0+c2xvdCwgZGJncC0+ZnVuYywKKyAgICBkYmdwLT5wY2lfY3IgPSBwY2lfY29u
Zl9yZWFkOChQQ0lfU0JERigwLCBkYmdwLT5idXMsIGRiZ3AtPnNsb3QsCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGJncC0+ZnVuYyksCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUENJX0NPTU1BTkQpOwogICAgIGlmICggIShkYmdwLT5wY2lf
Y3IgJiBQQ0lfQ09NTUFORF9NRU1PUlkpICkKICAgICB7CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9jaGFyL25zMTY1NTAuYyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCmluZGV4IDE4OWUx
MjFiN2UuLjU0NzI3MGQwZTEgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5j
CisrKyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCkBAIC0xMTg4LDggKzExODgsMTAgQEAg
cGNpX3VhcnRfY29uZmlnKHN0cnVjdCBuczE2NTUwICp1YXJ0LCBib29sX3Qgc2tpcF9hbXQsIHVu
c2lnbmVkIGludCBpZHgpCiAgICAgICAgICAgICAgICAgdWFydC0+YmFyNjQgPSBiYXJfNjQ7CiAg
ICAgICAgICAgICAgICAgdWFydC0+aW9fc2l6ZSA9IG1heCg4VSA8PCBwYXJhbS0+cmVnX3NoaWZ0
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFyYW0tPnVhcnRfb2Zmc2V0
KTsKLSAgICAgICAgICAgICAgICB1YXJ0LT5pcnEgPSBwY2lfY29uZl9yZWFkOCgwLCBiLCBkLCBm
LCBQQ0lfSU5URVJSVVBUX1BJTikgPwotICAgICAgICAgICAgICAgICAgICBwY2lfY29uZl9yZWFk
OCgwLCBiLCBkLCBmLCBQQ0lfSU5URVJSVVBUX0xJTkUpIDogMDsKKyAgICAgICAgICAgICAgICB1
YXJ0LT5pcnEgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERigwLCBiLCBkLCBmKSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfSU5URVJSVVBUX1BJTikgPwor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKDAsIGIs
IGQsIGYpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBDSV9J
TlRFUlJVUFRfTElORSkgOiAwOwogCiAgICAgICAgICAgICAgICAgcmV0dXJuIDA7CiAgICAgICAg
ICAgICB9CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfaW5p
dC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYwppbmRleCA0ZTc2
YjI2MjBjLi45NDNlMWMzOTNlIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9h
bWQvaW9tbXVfaW5pdC5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9p
bml0LmMKQEAgLTEyMzgsNyArMTIzOCw3IEBAIHN0YXRpYyBib29sX3QgX19pbml0IGFtZF9zcDUx
MDBfZXJyYXR1bTI4KHZvaWQpCiAgICAgICAgIGlmICh2ZW5kb3JfaWQgIT0gMHgxMDAyIHx8IGRl
dl9pZCAhPSAweDQzODUpCiAgICAgICAgICAgICBjb250aW51ZTsKIAotICAgICAgICBieXRlID0g
cGNpX2NvbmZfcmVhZDgoMCwgYnVzLCAweDE0LCAwLCAweGFkKTsKKyAgICAgICAgYnl0ZSA9IHBj
aV9jb25mX3JlYWQ4KFBDSV9TQkRGKDAsIGJ1cywgMHgxNCwgMCksIDB4YWQpOwogICAgICAgICBp
ZiAoIChieXRlID4+IDMpICYgMSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHByaW50ayhYRU5M
T0dfV0FSTklORyAiQU1ELVZpOiBTUDUxMDAgZXJyYXR1bSAyOCBkZXRlY3RlZCwgZGlzYWJsaW5n
IElPTU1VLlxuIgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwppbmRleCBlODg2ODk0MjVkLi4zNDBlOTU3OTU0
IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9wY2kuYwpAQCAtMjYwLDcgKzI2MCw3IEBAIHN0YXRpYyB2b2lkIGNo
ZWNrX3BkZXYoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAgICAgICAgIH0KICAgICB9CiAK
LSAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOChzZWcsIGJ1cywgZGV2LCBmdW5jLCBQQ0lfSEVB
REVSX1RZUEUpICYgMHg3ZiApCisgICAgc3dpdGNoICggcGNpX2NvbmZfcmVhZDgocGRldi0+c2Jk
ZiwgUENJX0hFQURFUl9UWVBFKSAmIDB4N2YgKQogICAgIHsKICAgICBjYXNlIFBDSV9IRUFERVJf
VFlQRV9CUklER0U6CiAgICAgICAgIGlmICggIWJyaWRnZV9jdGxfbWFzayApCkBAIC0zNzAsMTAg
KzM3MCw4IEBAIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldiAqYWxsb2NfcGRldihzdHJ1Y3QgcGNpX3Nl
ZyAqcHNlZywgdTggYnVzLCB1OCBkZXZmbikKIAogICAgICAgICBjYXNlIERFVl9UWVBFX1BDSWUy
UENJX0JSSURHRToKICAgICAgICAgY2FzZSBERVZfVFlQRV9MRUdBQ1lfUENJX0JSSURHRToKLSAg
ICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChwc2VnLT5uciwgYnVzLCBQQ0lfU0xP
VChkZXZmbiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX0ZVTkMo
ZGV2Zm4pLCBQQ0lfU0VDT05EQVJZX0JVUyk7Ci0gICAgICAgICAgICBzdWJfYnVzID0gcGNpX2Nv
bmZfcmVhZDgocHNlZy0+bnIsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLAotICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFBDSV9GVU5DKGRldmZuKSwgUENJX1NVQk9SRElOQVRFX0JV
Uyk7CisgICAgICAgICAgICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgocGRldi0+c2JkZiwgUENJ
X1NFQ09OREFSWV9CVVMpOworICAgICAgICAgICAgc3ViX2J1cyA9IHBjaV9jb25mX3JlYWQ4KHBk
ZXYtPnNiZGYsIFBDSV9TVUJPUkRJTkFURV9CVVMpOwogCiAgICAgICAgICAgICBzcGluX2xvY2so
JnBzZWctPmJ1czJicmlkZ2VfbG9jayk7CiAgICAgICAgICAgICBmb3IgKCA7IHNlY19idXMgPD0g
c3ViX2J1czsgc2VjX2J1cysrICkKQEAgLTQzNiwxNiArNDM0LDEyIEBAIHN0YXRpYyB2b2lkIGZy
ZWVfcGRldihzdHJ1Y3QgcGNpX3NlZyAqcHNlZywgc3RydWN0IHBjaV9kZXYgKnBkZXYpCiAgICAg
LyogdXBkYXRlIGJ1czJicmlkZ2UgKi8KICAgICBzd2l0Y2ggKCBwZGV2LT50eXBlICkKICAgICB7
Ci0gICAgICAgIHU4IGRldiwgZnVuYywgc2VjX2J1cywgc3ViX2J1czsKKyAgICAgICAgdWludDhf
dCBzZWNfYnVzLCBzdWJfYnVzOwogCiAgICAgICAgIGNhc2UgREVWX1RZUEVfUENJZTJQQ0lfQlJJ
REdFOgogICAgICAgICBjYXNlIERFVl9UWVBFX0xFR0FDWV9QQ0lfQlJJREdFOgotICAgICAgICAg
ICAgZGV2ID0gUENJX1NMT1QocGRldi0+ZGV2Zm4pOwotICAgICAgICAgICAgZnVuYyA9IFBDSV9G
VU5DKHBkZXYtPmRldmZuKTsKLSAgICAgICAgICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChw
c2VnLT5uciwgcGRldi0+YnVzLCBkZXYsIGZ1bmMsCi0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgUENJX1NFQ09OREFSWV9CVVMpOwotICAgICAgICAgICAgc3ViX2J1cyA9IHBj
aV9jb25mX3JlYWQ4KHBzZWctPm5yLCBwZGV2LT5idXMsIGRldiwgZnVuYywKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lfU1VCT1JESU5BVEVfQlVTKTsKKyAgICAgICAg
ICAgIHNlY19idXMgPSBwY2lfY29uZl9yZWFkOChwZGV2LT5zYmRmLCBQQ0lfU0VDT05EQVJZX0JV
Uyk7CisgICAgICAgICAgICBzdWJfYnVzID0gcGNpX2NvbmZfcmVhZDgocGRldi0+c2JkZiwgUENJ
X1NVQk9SRElOQVRFX0JVUyk7CiAKICAgICAgICAgICAgIHNwaW5fbG9jaygmcHNlZy0+YnVzMmJy
aWRnZV9sb2NrKTsKICAgICAgICAgICAgIGZvciAoIDsgc2VjX2J1cyA8PSBzdWJfYnVzOyBzZWNf
YnVzKysgKQpAQCAtMTA4Miw3ICsxMDc2LDggQEAgc3RhdGljIGludCBfX2luaXQgX3NjYW5fcGNp
X2RldmljZXMoc3RydWN0IHBjaV9zZWcgKnBzZWcsIHZvaWQgKmFyZykKICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9NRU07CiAgICAgICAgICAgICAgICAgfQogCi0gICAgICAgICAgICAg
ICAgaWYgKCAhZnVuYyAmJiAhKHBjaV9jb25mX3JlYWQ4KHBzZWctPm5yLCBidXMsIGRldiwgZnVu
YywKKyAgICAgICAgICAgICAgICBpZiAoICFmdW5jICYmICEocGNpX2NvbmZfcmVhZDgoUENJX1NC
REYocHNlZy0+bnIsIGJ1cywgZGV2LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBmdW5jKSwKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSAmIDB4ODApICkKICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICB9CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2Rt
YXIuYwppbmRleCBiODU4ZmU3YzgwLi45Yzk0ZGVhYzBiIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC9kbWFyLmMKQEAgLTM0OCw3ICszNDgsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNl
X2Rldl9zY29wZSgKIAogICAgICAgICB3aGlsZSAoIC0tZGVwdGggPiAwICkKICAgICAgICAgewot
ICAgICAgICAgICAgYnVzID0gcGNpX2NvbmZfcmVhZDgoc2VnLCBidXMsIHBhdGgtPmRldiwgcGF0
aC0+Zm4sCisgICAgICAgICAgICBidXMgPSBwY2lfY29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1
cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiksCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBQQ0lfU0VDT05EQVJZX0JVUyk7CiAgICAgICAgICAgICBwYXRoKys7CiAgICAgICAgIH0KQEAg
LTM1Niw5ICszNTYsOSBAQCBzdGF0aWMgaW50IF9faW5pdCBhY3BpX3BhcnNlX2Rldl9zY29wZSgK
ICAgICAgICAgc3dpdGNoICggYWNwaV9zY29wZS0+ZW50cnlfdHlwZSApCiAgICAgICAgIHsKICAg
ICAgICAgY2FzZSBBQ1BJX0RNQVJfU0NPUEVfVFlQRV9CUklER0U6Ci0gICAgICAgICAgICBzZWNf
YnVzID0gcGNpX2NvbmZfcmVhZDgoc2VnLCBidXMsIHBhdGgtPmRldiwgcGF0aC0+Zm4sCisgICAg
ICAgICAgICBzZWNfYnVzID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2VnLCBidXMsIHBhdGgt
PmRldiwgcGF0aC0+Zm4pLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBD
SV9TRUNPTkRBUllfQlVTKTsKLSAgICAgICAgICAgIHN1Yl9idXMgPSBwY2lfY29uZl9yZWFkOChz
ZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiwKKyAgICAgICAgICAgIHN1Yl9idXMgPSBwY2lf
Y29uZl9yZWFkOChQQ0lfU0JERihzZWcsIGJ1cywgcGF0aC0+ZGV2LCBwYXRoLT5mbiksCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUENJX1NVQk9SRElOQVRFX0JVUyk7CiAg
ICAgICAgICAgICBpZiAoIGlvbW11X3ZlcmJvc2UgKQogICAgICAgICAgICAgICAgIHByaW50ayhW
VERQUkVGSVgKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xdWlya3Mu
YyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9xdWlya3MuYwppbmRleCBkNmRiODYyNjc4
Li5mZjczYjBlN2Y0IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvcXVp
cmtzLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJrcy5jCkBAIC05Miw4
ICs5Miw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjYW50aWdhX2IzX2VycmF0YV9pbml0KHZvaWQp
CiAgICAgaWYgKCB2aWQgIT0gMHg4MDg2ICkKICAgICAgICAgcmV0dXJuOwogCi0gICAgZGlkX2hp
ID0gcGNpX2NvbmZfcmVhZDgoMCwgMCwgSUdEX0RFViwgMCwgMyk7Ci0gICAgcmlkID0gcGNpX2Nv
bmZfcmVhZDgoMCwgMCwgSUdEX0RFViwgMCwgOCk7CisgICAgZGlkX2hpID0gcGNpX2NvbmZfcmVh
ZDgoUENJX1NCREYoMCwgMCwgSUdEX0RFViwgMCksIDMpOworICAgIHJpZCA9IHBjaV9jb25mX3Jl
YWQ4KFBDSV9TQkRGKDAsIDAsIElHRF9ERVYsIDApLCA4KTsKIAogICAgIGlmICggKGRpZF9oaSA9
PSAweDJBKSAmJiAocmlkID09IDB4NykgKQogICAgICAgICBpc19jYW50aWdhX2IzID0gMTsKQEAg
LTI4MSw3ICsyODEsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgdHlsZXJzYnVyZ19pbnRyZW1hcF9x
dWlyayh2b2lkKQogICAgIHsKICAgICAgICAgLyogTWF0Y2ggb24gU3lzdGVtIE1hbmFnZW1lbnQg
UmVnaXN0ZXJzIG9uIERldmljZSAyMCBGdW5jdGlvbiAwICovCiAgICAgICAgIGRldmljZSA9IHBj
aV9jb25mX3JlYWQzMigwLCBidXMsIDIwLCAwLCBQQ0lfVkVORE9SX0lEKTsKLSAgICAgICAgcmV2
ID0gcGNpX2NvbmZfcmVhZDgoMCwgYnVzLCAyMCwgMCwgUENJX1JFVklTSU9OX0lEKTsKKyAgICAg
ICAgcmV2ID0gcGNpX2NvbmZfcmVhZDgoUENJX1NCREYoMCwgYnVzLCAyMCwgMCksIFBDSV9SRVZJ
U0lPTl9JRCk7CiAKICAgICAgICAgaWYgKCByZXYgPT0gMHgxMyAmJiBkZXZpY2UgPT0gMHgzNDJl
ODA4NiApCiAgICAgICAgIHsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3BjaS9wY2kuYyBiL3hl
bi9kcml2ZXJzL3BjaS9wY2kuYwppbmRleCAxYzgwOGQ2NjMyLi5lM2Y4ODNmYzVjIDEwMDY0NAot
LS0gYS94ZW4vZHJpdmVycy9wY2kvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGNpL3BjaS5jCkBA
IC0yMSwxMiArMjEsMTIgQEAgaW50IHBjaV9maW5kX2NhcF9vZmZzZXQodTE2IHNlZywgdTggYnVz
LCB1OCBkZXYsIHU4IGZ1bmMsIHU4IGNhcCkKIAogICAgIHdoaWxlICggbWF4X2NhcC0tICkKICAg
ICB7Ci0gICAgICAgIHBvcyA9IHBjaV9jb25mX3JlYWQ4KHNlZywgYnVzLCBkZXYsIGZ1bmMsIHBv
cyk7CisgICAgICAgIHBvcyA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGKHNlZywgYnVzLCBkZXYs
IGZ1bmMpLCBwb3MpOwogICAgICAgICBpZiAoIHBvcyA8IDB4NDAgKQogICAgICAgICAgICAgYnJl
YWs7CiAKICAgICAgICAgcG9zICY9IH4zOwotICAgICAgICBpZCA9IHBjaV9jb25mX3JlYWQ4KHNl
ZywgYnVzLCBkZXYsIGZ1bmMsIHBvcyArIFBDSV9DQVBfTElTVF9JRCk7CisgICAgICAgIGlkID0g
cGNpX2NvbmZfcmVhZDgoUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYyksIHBvcyArIFBDSV9D
QVBfTElTVF9JRCk7CiAKICAgICAgICAgaWYgKCBpZCA9PSAweGZmICkKICAgICAgICAgICAgIGJy
ZWFrOwpAQCAtNDYsMTMgKzQ2LDEyIEBAIGludCBwY2lfZmluZF9uZXh0X2NhcCh1MTYgc2VnLCB1
OCBidXMsIHVuc2lnbmVkIGludCBkZXZmbiwgdTggcG9zLCBpbnQgY2FwKQogCiAgICAgd2hpbGUg
KCB0dGwtLSApCiAgICAgewotICAgICAgICBwb3MgPSBwY2lfY29uZl9yZWFkOChzZWcsIGJ1cywg
UENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZmbiksIHBvcyk7CisgICAgICAgIHBvcyA9IHBj
aV9jb25mX3JlYWQ4KFBDSV9TQkRGMyhzZWcsIGJ1cywgZGV2Zm4pLCBwb3MpOwogICAgICAgICBp
ZiAoIHBvcyA8IDB4NDAgKQogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgcG9zICY9IH4z
OwotICAgICAgICBpZCA9IHBjaV9jb25mX3JlYWQ4KHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiks
IFBDSV9GVU5DKGRldmZuKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3MgKyBQQ0lf
Q0FQX0xJU1RfSUQpOworICAgICAgICBpZCA9IHBjaV9jb25mX3JlYWQ4KFBDSV9TQkRGMyhzZWcs
IGJ1cywgZGV2Zm4pLCBwb3MgKyBQQ0lfQ0FQX0xJU1RfSUQpOwogCiAgICAgICAgIGlmICggaWQg
PT0gMHhmZiApCiAgICAgICAgICAgICBicmVhazsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Zp
ZGVvL3ZnYS5jIGIveGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMKaW5kZXggNmE2NGZkOTAxMy4uNzg1
MzNhZDBiMSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdmlkZW8vdmdhLmMKKysrIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmdhLmMKQEAgLTEzNiw4ICsxMzYsNyBAQCB2b2lkIF9faW5pdCB2aWRlb19l
bmRib290KHZvaWQpCiAgICAgICAgICAgICAgICAgICAgICAgICBiID0gMDsKICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOwogICAgICAgICAgICAgICAgICAgICBjYXNlIDE6Ci0gICAgICAg
ICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFkOCgwLCBiLCBQQ0lfU0xPVChk
ZiksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lf
RlVOQyhkZiksCisgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggKCBwY2lfY29uZl9yZWFk
OChQQ0lfU0JERjMoMCwgYiwgZGYpLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUENJX0hFQURFUl9UWVBFKSApCiAgICAgICAgICAgICAgICAgICAgICAg
ICB7CiAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlIFBDSV9IRUFERVJfVFlQRV9CUklER0U6
CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIGIveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYwppbmRleCAyNThiOTFkZWVkLi41NjRjN2I2YTdkIDEwMDY0NAotLS0gYS94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jCisrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMKQEAg
LTQ2Myw4ICs0NjMsNyBAQCBzdGF0aWMgaW50IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRl
dikKICAgICBzdHJ1Y3QgdnBjaV9iYXIgKmJhcnMgPSBoZWFkZXItPmJhcnM7CiAgICAgaW50IHJj
OwogCi0gICAgc3dpdGNoICggcGNpX2NvbmZfcmVhZDgocGRldi0+c2VnLCBwZGV2LT5idXMsIHNs
b3QsIGZ1bmMsIFBDSV9IRUFERVJfVFlQRSkKLSAgICAgICAgICAgICAmIDB4N2YgKQorICAgIHN3
aXRjaCAoIHBjaV9jb25mX3JlYWQ4KHBkZXYtPnNiZGYsIFBDSV9IRUFERVJfVFlQRSkgJiAweDdm
ICkKICAgICB7CiAgICAgY2FzZSBQQ0lfSEVBREVSX1RZUEVfTk9STUFMOgogICAgICAgICBudW1f
YmFycyA9IFBDSV9IRUFERVJfTk9STUFMX05SX0JBUlM7CmRpZmYgLS1naXQgYS94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCmluZGV4IGNhNTk4Njc1ZWEu
LmM0MDMwMzMzYTUgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jCisrKyBiL3hl
bi9kcml2ZXJzL3ZwY2kvdnBjaS5jCkBAIC0yMjIsOCArMjIyLDcgQEAgc3RhdGljIHVpbnQzMl90
IHZwY2lfcmVhZF9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsCiAgICAgICAg
ICAqLwogICAgICAgICBpZiAoIHJlZyAmIDEgKQogICAgICAgICB7Ci0gICAgICAgICAgICBkYXRh
ID0gcGNpX2NvbmZfcmVhZDgoc2JkZi5zZWcsIHNiZGYuYnVzLCBzYmRmLmRldiwgc2JkZi5mbiwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcpOworICAgICAgICAgICAgZGF0
YSA9IHBjaV9jb25mX3JlYWQ4KHNiZGYsIHJlZyk7CiAgICAgICAgICAgICBkYXRhIHw9IHBjaV9j
b25mX3JlYWQxNihzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2LCBzYmRmLmZuLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnICsgMSkgPDwgODsKICAgICAgICAgfQpA
QCAtMjMxLDggKzIzMCw3IEBAIHN0YXRpYyB1aW50MzJfdCB2cGNpX3JlYWRfaHcocGNpX3NiZGZf
dCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLAogICAgICAgICB7CiAgICAgICAgICAgICBkYXRhID0g
cGNpX2NvbmZfcmVhZDE2KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4sCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyk7Ci0gICAgICAgICAgICBkYXRh
IHw9IHBjaV9jb25mX3JlYWQ4KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4s
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyArIDIpIDw8IDE2OworICAg
ICAgICAgICAgZGF0YSB8PSBwY2lfY29uZl9yZWFkOChzYmRmLCByZWcgKyAyKSA8PCAxNjsKICAg
ICAgICAgfQogICAgICAgICBicmVhazsKIApAQCAtMjQxLDcgKzIzOSw3IEBAIHN0YXRpYyB1aW50
MzJfdCB2cGNpX3JlYWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLAogICAg
ICAgICBicmVhazsKIAogICAgIGNhc2UgMToKLSAgICAgICAgZGF0YSA9IHBjaV9jb25mX3JlYWQ4
KHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXYsIHNiZGYuZm4sIHJlZyk7CisgICAgICAgIGRh
dGEgPSBwY2lfY29uZl9yZWFkOChzYmRmLCByZWcpOwogICAgICAgICBicmVhazsKIAogICAgIGRl
ZmF1bHQ6CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKaW5kZXggMDRhOWY0NmNjMy4uNDA4Y2QxY2I2NyAxMDA2NDQKLS0tIGEveGVuL2lu
Y2x1ZGUveGVuL3BjaS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaApAQCAtMTcyLDkgKzE3
Miw3IEBAIHN0cnVjdCBwY2lfZGV2ICpwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGNvbnN0IHN0cnVj
dCBkb21haW4gKiwgaW50IHNlZywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGludCBidXMsIGludCBkZXZmbik7CiB2b2lkIHBjaV9jaGVja19kaXNhYmxlX2RldmljZSh1
MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuKTsKIAotdWludDhfdCBwY2lfY29uZl9yZWFkOCgKLSAg
ICB1bnNpZ25lZCBpbnQgc2VnLCB1bnNpZ25lZCBpbnQgYnVzLCB1bnNpZ25lZCBpbnQgZGV2LCB1
bnNpZ25lZCBpbnQgZnVuYywKLSAgICB1bnNpZ25lZCBpbnQgcmVnKTsKK3VpbnQ4X3QgcGNpX2Nv
bmZfcmVhZDgocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnKTsKIHVpbnQxNl90IHBj
aV9jb25mX3JlYWQxNigKICAgICB1bnNpZ25lZCBpbnQgc2VnLCB1bnNpZ25lZCBpbnQgYnVzLCB1
bnNpZ25lZCBpbnQgZGV2LCB1bnNpZ25lZCBpbnQgZnVuYywKICAgICB1bnNpZ25lZCBpbnQgcmVn
KTsKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
