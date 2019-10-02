Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A10C86BB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:53:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFcCa-0006VZ-IR; Wed, 02 Oct 2019 10:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xXQL=X3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iFcCY-0006VU-Jo
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:49:46 +0000
X-Inumbo-ID: 58a95b16-e502-11e9-9712-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by localhost (Halon) with ESMTPS
 id 58a95b16-e502-11e9-9712-12813bfff9fa;
 Wed, 02 Oct 2019 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570013385;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9g3yQ8/yFu8MB+e69ExSbEN8NzP8qzfavPEi88ss+tE=;
 b=TBZDUnZ14Lgqz9umZ+Io2kD727Jo66haq1Dfol8gxSNWvLHwUXM+1kh0
 fLRdoDxcVL5svxn4q2b5aMyfxM5CydiryM2M6waLKIvf5gmB8dgEdCGC5
 BQHeBMdKj3AMylmLYIKKayhaIxkFDjRVKtbO3HGI2U1D97eRk0tr3hybQ w=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 1frYUEHpB7lfN6RuIEiYr3dkP7V4b5rkcyIzoDBs8P60rVtZw80pHzagrxp+fGo6JsNox6tgyH
 RW2xiVcIddEQSlvXBz0jJtnoOMRiQIroCZHLJkDlguWIuW/foZ82yg2e14yWiMq0ygN+pOKMWc
 JvDF2YiOfw9l2fHALLGl2hDr4T8JR/+lN2CHl6ZKke0qzoGoYzLfozikzoSux3IvsU3o2rrPzR
 zEBnCyK1JnBxOeRc4lFuLijU7sA3Vam1pL3gj1rJmuwIoM8i2xliJY2xPyjQRElubuRpEXENXq
 z3k=
X-SBRS: 2.7
X-MesageID: 6715069
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,574,1559534400"; 
   d="scan'208";a="6715069"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 2 Oct 2019 12:49:35 +0200
Message-ID: <20191002104935.60245-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] pci: clear host_maskall field on assign
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
Cc: Chao Gao <chao.gao@intel.com>, "Spassov, Stanislav" <stanspas@amazon.de>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24gb2YgaG9zdF9tYXNrYWxsIG1ha2VzIGl0IHN0aWNr
eSBhY3Jvc3MKYXNzaWduIGFuZCBkZWFzc2lnbiBjYWxscywgd2hpY2ggbWVhbnMgdGhhdCBvbmNl
IGEgZ3Vlc3QgZm9yY2VzIFhlbiB0bwpzZXQgaG9zdF9tYXNrYWxsIHRoZSBtYXNrYWxsIGJpdCBp
cyBub3QgZ29pbmcgdG8gYmUgY2xlYXJlZCB1bnRpbCBhCmNhbGwgdG8gUEhZU0RFVk9QX3ByZXBh
cmVfbXNpeCBpcyBwZXJmb3JtZWQuIFN1Y2ggY2FsbCBob3dldmVyCnNob3VsZG4ndCBiZSBwYXJ0
IG9mIHRoZSBub3JtYWwgZmxvdyB3aGVuIGRvaW5nIFBDSSBwYXNzdGhyb3VnaCwgYW5kCmhlbmNl
IHRoZSBmbGFnIG5lZWRzIHRvIGJlIGNsZWFyZWQgd2hlbiBhc3NpZ25pbmcgaW4gb3JkZXIgdG8g
cHJldmVudApob3N0X21hc2thbGwgYmVpbmcgY2FycmllZCBvdmVyIGZyb20gcHJldmlvdXMgYXNz
aWduYXRpb25zLgoKTm90ZSB0aGF0IG90aGVyIG1hc2sgZmllbGRzLCBsaWtlIGd1ZXN0X21hc2tl
ZCBvciB0aGUgZW50cnkgbWFza2JpdAphcmUgYWxyZWFkeSByZXNldCB3aGVuIHRoZSBtc2l4IGNh
cGFiaWxpdHkgaXMgaW5pdGlhbGl6ZWQuIEFsc28gbm90ZQp0aGF0IGRvaW5nIHRoZSByZXNldCBv
ZiBob3N0X21hc2thbGwgdGhlcmUgd291bGQgYWxsb3cgdGhlIGd1ZXN0IHRvCnJlc2V0IHN1Y2gg
ZmllbGQgYnkgZW5hYmxpbmcgYW5kIGRpc2FibGluZyBNU0lYLCB3aGljaCBpcyBub3QKaW50ZW5k
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNv
bT4KLS0tCkNjOiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPgpDYzogIlNwYXNzb3YsIFN0
YW5pc2xhdiIgPHN0YW5zcGFzQGFtYXpvbi5kZT4KQ2M6IFBhc2kgS8Okcmtrw6RpbmVuIDxwYXNp
a0Bpa2kuZmk+Ci0tLQpDaGFvLCBTdGFuaXNsYXYsIGNhbiB5b3UgcGxlYXNlIGNoZWNrIGlmIHRo
aXMgcGF0Y2ggZml4ZXMgeW91cgppc3N1ZXM/Ci0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvcGNpLmMKaW5kZXggN2RlZWYyZjEyYi4uYjRmMWFjMmRkOSAxMDA2NDQKLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNp
LmMKQEAgLTE1MDQsNyArMTUwNCwxMCBAQCBzdGF0aWMgaW50IGFzc2lnbl9kZXZpY2Uoc3RydWN0
IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwgdTMyIGZsYWcpCiAgICAgfQog
CiAgICAgaWYgKCBwZGV2LT5tc2l4ICkKKyAgICB7CiAgICAgICAgIG1zaXh0YmxfaW5pdChkKTsK
KyAgICAgICAgcGRldi0+bXNpeC0+aG9zdF9tYXNrYWxsID0gZmFsc2U7CisgICAgfQogCiAgICAg
cGRldi0+ZmF1bHQuY291bnQgPSAwOwogCi0tIAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
