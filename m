Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1BE3A21
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 19:33:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNgu0-0008AR-Ih; Thu, 24 Oct 2019 17:28:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncnf=YR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iNgtz-0008AM-K4
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 17:27:59 +0000
X-Inumbo-ID: 9ef0ccd5-f683-11e9-94ab-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ef0ccd5-f683-11e9-94ab-12813bfff9fa;
 Thu, 24 Oct 2019 17:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571938078;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bIncVFUqOaY7r6BAE6cM3jnH2xJ9AXIgZ4sNPc/YRd8=;
 b=hFl65Xb57YhIGVAPUnnaT7NlG9pNERX2TEEpHfD0eiVMcwWvsPmyl49c
 nJFUZ6qz40Uu9jIYWeYeYL9sxp32Ar1ehgyWY1NvQl7D88VlrhamOhvjb
 3eGXgFhLcV4oa5myCtGjz12tL16rn6+IoRMhdZSU7kIOSYH9Fb9WWqceC 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VnJZYlJ7wVpjGE6n9PzAidhSKmR81bqbIiRUPx/QVNJHlQ/uM9dNfvzD/JZmyojJy31/izH4e5
 fpq5lT4O3eAqWMar+Xaz6Z4kU3o26GPwHXr+bqNBTD97xJXbo4qOUD00LP8s5XwYQCl9Lc8vky
 5IX2ZS9Z3nscDNGBbJb3ELJovYX9tvi8a+O5UOi4YkLcbRoc1t//7YlRLGeSViAkmRhxtXSsK6
 gP948IIY3pDhSd8JnT0AKwIAcSDQvoFXPIrVg+OJ77/x+rEJEJR2CLGUm4cWF5YQi9qsT0ib4u
 Px4=
X-SBRS: 2.7
X-MesageID: 7746716
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,225,1569297600"; 
   d="scan'208";a="7746716"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 24 Oct 2019 18:27:31 +0100
Message-ID: <20191024172731.15752-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/VT-d: Misc initialisation cleanup
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ICogSW5pdGlhbGlzZSBhbGwgc3BpbmxvY2sgZmllbGRzIHRvZ2V0aGVyCiAqIE5vIG5lZWQgZm9y
IGFuIGF0b21pYyBzZXRfYml0KCkgdG8gaW5pdGlhbGlzZSBkb21pZF9iaXRtYXAKICogQXZvaWQg
dXNpbmcgcGFydGlhbC1saW5lIHByaW50aygpJ3MuCiAqIFN0eWxlIGZpeGVzICh0b28gbWFueSwg
YW5kIHRvbyBmZXcgc3BhY2VzKQoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBC
ZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ0M6IEp1biBOYWthamltYSA8
anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwu
Y29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVGhpcyBpc24ndCByZXF1
aXJlZCBmb3IgNC4xMywgYnV0IGl0IGlzIGEgY291cGxlIG9mIG5pY2UtdG8taGF2ZSdzIGFuZCB3
ZSdyZQpzdGlsbCBhdCB0aGUgZWFybHkgUkMgcGhhc2UuCi0tLQogeGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvdnRkL2lvbW11LmMgfCAyNCArKysrKysrKystLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKaW5kZXggMDUyMmVjZDNiYy4uNGE3NTlkMzNjZCAxMDA2NDQKLS0tIGEv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2lvbW11LmMKQEAgLTExNDUsNiArMTE0NSw4IEBAIGludCBfX2luaXQgaW9t
bXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF91bml0ICpkcmhkKQogICAgIGlvbW11LT5tc2kuaXJx
ID0gLTE7IC8qIE5vIGlycSBhc3NpZ25lZCB5ZXQuICovCiAgICAgaW9tbXUtPm5vZGUgPSBOVU1B
X05PX05PREU7CiAgICAgSU5JVF9MSVNUX0hFQUQoJmlvbW11LT5hdHNfZGV2aWNlcyk7CisgICAg
c3Bpbl9sb2NrX2luaXQoJmlvbW11LT5sb2NrKTsKKyAgICBzcGluX2xvY2tfaW5pdCgmaW9tbXUt
PnJlZ2lzdGVyX2xvY2spOwogICAgIHNwaW5fbG9ja19pbml0KCZpb21tdS0+aW50cmVtYXAubG9j
ayk7CiAKICAgICBpb21tdS0+ZHJoZCA9IGRyaGQ7CkBAIC0xMTk3LDIxICsxMTk5LDE4IEBAIGlu
dCBfX2luaXQgaW9tbXVfYWxsb2Moc3RydWN0IGFjcGlfZHJoZF91bml0ICpkcmhkKQogICAgIG5y
X2RvbSA9IGNhcF9uZG9tcyhpb21tdS0+Y2FwKTsKICAgICBpb21tdS0+ZG9taWRfYml0bWFwID0g
eHphbGxvY19hcnJheSh1bnNpZ25lZCBsb25nLCBCSVRTX1RPX0xPTkdTKG5yX2RvbSkpOwogICAg
IGlmICggIWlvbW11LT5kb21pZF9iaXRtYXAgKQotICAgICAgICByZXR1cm4gLUVOT01FTSA7Cisg
ICAgICAgIHJldHVybiAtRU5PTUVNOwogCiAgICAgLyoKICAgICAgKiBpZiBDYWNoaW5nIG1vZGUg
aXMgc2V0LCB0aGVuIGludmFsaWQgdHJhbnNsYXRpb25zIGFyZSB0YWdnZWQgd2l0aAogICAgICAq
IGRvbWFpbiBpZCAwLCBIZW5jZSByZXNlcnZlIGJpdCAwIGZvciBpdAogICAgICAqLwogICAgIGlm
ICggY2FwX2NhY2hpbmdfbW9kZShpb21tdS0+Y2FwKSApCi0gICAgICAgIHNldF9iaXQoMCwgaW9t
bXUtPmRvbWlkX2JpdG1hcCk7CisgICAgICAgIF9fc2V0X2JpdCgwLCBpb21tdS0+ZG9taWRfYml0
bWFwKTsKIAogICAgIGlvbW11LT5kb21pZF9tYXAgPSB4emFsbG9jX2FycmF5KHUxNiwgbnJfZG9t
KTsKICAgICBpZiAoICFpb21tdS0+ZG9taWRfbWFwICkKLSAgICAgICAgcmV0dXJuIC1FTk9NRU0g
OwotCi0gICAgc3Bpbl9sb2NrX2luaXQoJmlvbW11LT5sb2NrKTsKLSAgICBzcGluX2xvY2tfaW5p
dCgmaW9tbXUtPnJlZ2lzdGVyX2xvY2spOworICAgICAgICByZXR1cm4gLUVOT01FTTsKIAogICAg
IHJldHVybiAwOwogfQpAQCAtMjI3MiwxNSArMjI3MSwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCB2
dGRfc2V0dXAodm9pZCkKICAgICB7CiAgICAgICAgIGlvbW11ID0gZHJoZC0+aW9tbXU7CiAKLSAg
ICAgICAgcHJpbnRrKCJJbnRlbCBWVC1kIGlvbW11ICUiUFJJdTMyIiBzdXBwb3J0ZWQgcGFnZSBz
aXplczogNGtCIiwKLSAgICAgICAgICAgICAgIGlvbW11LT5pbmRleCk7Ci0gICAgICAgIGlmIChj
YXBfc3BzXzJtYihpb21tdS0+Y2FwKSkKLSAgICAgICAgICAgIHByaW50aygiLCAyTUIiKTsKLQot
ICAgICAgICBpZiAoY2FwX3Nwc18xZ2IoaW9tbXUtPmNhcCkpCi0gICAgICAgICAgICBwcmludGso
IiwgMUdCIik7Ci0KLSAgICAgICAgcHJpbnRrKCIuXG4iKTsKKyAgICAgICAgcHJpbnRrKCJJbnRl
bCBWVC1kIGlvbW11ICV1IHN1cHBvcnRlZCBwYWdlIHNpemVzOiA0a0IlcyVzXG4iLAorICAgICAg
ICAgICAgICAgaW9tbXUtPmluZGV4LAorICAgICAgICAgICAgICAgY2FwX3Nwc18ybWIoaW9tbXUt
PmNhcCkgPyAiLCAyTUIiIDogIiIsCisgICAgICAgICAgICAgICBjYXBfc3BzXzFnYihpb21tdS0+
Y2FwKSA/ICIsIDFHQiIgOiAiIik7CiAKICAgICAgICAgaWYgKCBpb21tdV9zbm9vcCAmJiAhZWNh
cF9zbnBfY3RsKGlvbW11LT5lY2FwKSApCiAgICAgICAgICAgICBpb21tdV9zbm9vcCA9IDA7Ci0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
