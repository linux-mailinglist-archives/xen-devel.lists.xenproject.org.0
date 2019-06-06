Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DB736F76
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 11:06:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYoHy-0006ZR-Il; Thu, 06 Jun 2019 09:02:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/1VA=UF=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hYoHx-0006Yx-1o
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 09:02:25 +0000
X-Inumbo-ID: caa8a33c-8839-11e9-9bf7-cf51b6d505ea
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id caa8a33c-8839-11e9-9bf7-cf51b6d505ea;
 Thu, 06 Jun 2019 09:02:21 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=SoftFail smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: BQpwIR2u0rlCMnUSFbNIe6p5QxgT3D7UBqNscL/SjfMMct8ACJVEqz780z/Sf7b8K5GCDsSCbr
 8vGvZqE3EtzALzw3LxN2jF47uiShmVt8JG4YvS93rPPyqXfufgoVve8kG9TD/uy6EuanNoogTy
 XNXJbPJHrXVYAIgrykNr5zGMxuQfBXBCjHE6yB8Uea4+nUnU15VR//tb2TtWR10UJX5/OOEO61
 LVEek9aV6KfwoEAywUUIp3sjfq68LU6/inIoPp3uIcVB981ArFd88Zq+MdKaymBQqPFGwqVghC
 4vc=
X-SBRS: -0.9
X-MesageID: 1386104
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,558,1557201600"; 
   d="scan'208";a="1386104"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 6 Jun 2019 11:01:38 +0200
Message-ID: <20190606090146.77381-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190606090146.77381-1-roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 04/12] pci: make PCI_SBDF2 return a pci_sbdf_t
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
QHhlbi5vcmc+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9kbWFyLmMgfCAyICstCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAg
ICAgIHwgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jCmluZGV4IDU5YTQ2Y2QxYzYuLmI4NThm
ZTdjODAgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKKysr
IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYwpAQCAtMTA0Nyw3ICsxMDQ3LDcg
QEAgaW50IGludGVsX2lvbW11X2dldF9yZXNlcnZlZF9kZXZpY2VfbWVtb3J5KGlvbW11X2dyZG1f
dCAqZnVuYywgdm9pZCAqY3R4dCkKIAogICAgICAgICByYyA9IGZ1bmMoUEZOX0RPV04ocm1yci0+
YmFzZV9hZGRyZXNzKSwKICAgICAgICAgICAgICAgICAgIFBGTl9VUChybXJyLT5lbmRfYWRkcmVz
cykgLSBQRk5fRE9XTihybXJyLT5iYXNlX2FkZHJlc3MpLAotICAgICAgICAgICAgICAgICAgUENJ
X1NCREYyKHJtcnItPnNlZ21lbnQsIGJkZiksIGN0eHQpOworICAgICAgICAgICAgICAgICAgUENJ
X1NCREYyKHJtcnItPnNlZ21lbnQsIGJkZikuc2JkZiwgY3R4dCk7CiAKICAgICAgICAgaWYgKCB1
bmxpa2VseShyYyA8IDApICkKICAgICAgICAgICAgIHJldHVybiByYzsKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAppbmRleCA5ZWE0MTc4
OWQwLi4zMGFmYWNhODM4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKKysrIGIv
eGVuL2luY2x1ZGUveGVuL3BjaS5oCkBAIC0zNiw3ICszNiw4IEBACiAjZGVmaW5lIFBDSV9CREYy
KGIsZGYpICAoKCgoYikgJiAweGZmKSA8PCA4KSB8ICgoZGYpICYgMHhmZikpCiAjZGVmaW5lIFBD
SV9TQkRGKHMsYixkLGYpIFwKICAgICAoKHBjaV9zYmRmX3QpIHsgLnNiZGYgPSAoKChzKSAmIDB4
ZmZmZikgPDwgMTYpIHwgUENJX0JERihiLGQsZikgfSkKLSNkZWZpbmUgUENJX1NCREYyKHMsYmRm
KSAoKCgocykgJiAweGZmZmYpIDw8IDE2KSB8ICgoYmRmKSAmIDB4ZmZmZikpCisjZGVmaW5lIFBD
SV9TQkRGMihzLGJkZikgXAorICAgICgocGNpX3NiZGZfdCkgeyAuc2JkZiA9ICgoKHMpICYgMHhm
ZmZmKSA8PCAxNikgfCAoKGJkZikgJiAweGZmZmYpIH0pCiAjZGVmaW5lIFBDSV9TQkRGMyhzLGIs
ZGYpICgoKChzKSAmIDB4ZmZmZikgPDwgMTYpIHwgUENJX0JERjIoYiwgZGYpKQogCiB0eXBlZGVm
IHVuaW9uIHsKLS0gCjIuMjAuMSAoQXBwbGUgR2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
