Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865D236F66
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:05:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoHi-0006TY-3c; Thu, 06 Jun 2019 09:02:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoHg-0006TK-Tk
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:08 +0000
X-Inumbo-ID: c2dc9e85-8839-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c2dc9e85-8839-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 09:02:07 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i1v8eSehGkrdR1LhDVRTpoRdeEkESBEJZ4B9ppKZog+uJp1pU/RB4Pgwb9P2HMKmN7TJDlLBYu
 yfER/as53qq01kqalJLDpoVkfBt4S8Nm1Uir9SOPGUIl7oLZGXJbZ1PlXxxL76yk3kkr86/2Wv
 BKGfYpm6pytHXLVv1rgIXmlkcLC1cl/2Blfe6ki0Q1BQPkntPMcDeqzxb8UIHiN7yJ+R8xJPo4
 Jyeqj12NFuvny0HwZkIfQOizMZE/bX55gqL/bxZ+b+KmysULSKz+gXrFGc2haqhfgBputUfwGN
 k3A=
X-SBRS: -0.9
X-MesageID: 1392581
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1392581"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:35 +0200
Message-ID: <20190606090146.77381-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190606090146.77381-1-roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBlcXVpdmFsZW50IHRvIHRoZSBjdXJyZW50IGV4dGZ1bmMgZmllbGQgaW4gdGVybSBv
ZiBjb250ZW50cy4KClN3aXRjaCB0aGUgdHdvIGN1cnJlbnQgdXNlcnMgb2YgZXh0ZnVuYyB0byB1
c2UgZGV2Zm4gaW5zdGVhZCBmb3IKY29ycmVjdG5lc3MuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4K
ClJlcXVlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTaWduZWQtb2Zm
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxhcCA8
R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29u
QGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNjOiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRlayBX
aWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgotLS0KQ2hhbmdlcyBzaW5jZSB2MToKIC0gTmV3IGluIHRoaXMgdmVy
c2lvbi4KLS0tCk5COiBQYXVsIHN1Z2dlc3RlZCB0byBuYW1lIHRoZSBmdW5jdGlvbiBmaWVsZCBm
biBpbnN0ZWFkIG9mIGZ1bmMsIHNvCnRoYXQgaXQgd291bGQgbWF0Y2ggdGhlIG5hbWluZyBvZiB0
aGUgZGV2Zm4gZmllbGQuIFNhZGx5IHRoZSBmdW5jCmZpZWxkIGNhbm5vdCBiZSBhbGlhc2VkIHRv
IGFub3RoZXIgZmllbGQgdXNpbmcgYSB1bmlvbiBiZWNhdXNlIGl0J3MgYQpiaXQgZmllbGQsIHNv
IHRoZSBvbmx5IG9wdGlvbiBpcyB0byByZW5hbWUgZnVuYyB0byBmbi4gSSBkb24ndCBoYXZlIGEK
c3Ryb25nIG9waW5pb24sIGJ1dCBpZiB0aGVyZSdzIGNvbnNlbnN1cyBpdCBzaG91bGQgYmUgZG9u
ZSBhZnRlciB0aGlzCnBhdGNoIElNTyBhbmQgbm90IGxhdGVyIGluIHRoZSBzZXJpZXMsIGFzIG1v
cmUgb2NjdXJyZW5jZXMgb2YKc2JkZi5mdW5jIHdpbGwgYXBwZWFyLgotLS0KIHhlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jIHwgNCArKy0tCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICB8IDUgKysrKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMK
aW5kZXggODI2MDdiZGI5YS4uNGYxZjk1YWI2OSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMKKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMKQEAgLTMyNyw3ICszMjcsNyBA
QCB1aW50MzJfdCB2cGNpX3JlYWQocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1
bnNpZ25lZCBpbnQgc2l6ZSkKICAgICB9CiAKICAgICAvKiBGaW5kIHRoZSBQQ0kgZGV2IG1hdGNo
aW5nIHRoZSBhZGRyZXNzLiAqLwotICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQs
IHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5leHRmdW5jKTsKKyAgICBwZGV2ID0gcGNpX2dldF9w
ZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4pOwogICAgIGlm
ICggIXBkZXYgKQogICAgICAgICByZXR1cm4gdnBjaV9yZWFkX2h3KHNiZGYsIHJlZywgc2l6ZSk7
CiAKQEAgLTQzMiw3ICs0MzIsNyBAQCB2b2lkIHZwY2lfd3JpdGUocGNpX3NiZGZfdCBzYmRmLCB1
bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwKICAgICAgKiBGaW5kIHRoZSBQQ0kg
ZGV2IG1hdGNoaW5nIHRoZSBhZGRyZXNzLgogICAgICAqIFBhc3N0aHJvdWdoIGV2ZXJ5dGhpbmcg
dGhhdCdzIG5vdCB0cmFwcGVkLgogICAgICAqLwotICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXZfYnlf
ZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5leHRmdW5jKTsKKyAgICBwZGV2ID0g
cGNpX2dldF9wZGV2X2J5X2RvbWFpbihkLCBzYmRmLnNlZywgc2JkZi5idXMsIHNiZGYuZGV2Zm4p
OwogICAgIGlmICggIXBkZXYgKQogICAgIHsKICAgICAgICAgdnBjaV93cml0ZV9odyhzYmRmLCBy
ZWcsIHNpemUsIGRhdGEpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVu
L2luY2x1ZGUveGVuL3BjaS5oCmluZGV4IDhiMjFlOGRjODQuLmVjOTgyNzQ2NzUgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKQEAg
LTQ5LDcgKzQ5LDEwIEBAIHR5cGVkZWYgdW5pb24gewogICAgICAgICAgICAgICAgICAgICAgICAg
dWludDhfdCBmdW5jIDogMywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2ICA6
IDU7CiAgICAgICAgICAgICAgICAgICAgIH07Ci0gICAgICAgICAgICAgICAgICAgIHVpbnQ4X3Qg
ICAgIGV4dGZ1bmM7CisgICAgICAgICAgICAgICAgICAgIHVuaW9uIHsKKyAgICAgICAgICAgICAg
ICAgICAgICAgIHVpbnQ4X3QgZXh0ZnVuYywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGV2Zm47CisgICAgICAgICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgICAgfTsKICAg
ICAgICAgICAgICAgICB1aW50OF90ICAgICAgICAgYnVzOwogICAgICAgICAgICAgfTsKLS0gCjIu
MjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
