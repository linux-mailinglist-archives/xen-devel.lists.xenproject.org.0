Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF3D389E1
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 14:10:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZDeR-0000NB-Av; Fri, 07 Jun 2019 12:07:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0f+t=UG=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hZDeQ-0000N6-7a
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 12:07:18 +0000
X-Inumbo-ID: c85c3eca-891c-11e9-82fa-631995befb48
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c85c3eca-891c-11e9-82fa-631995befb48;
 Fri, 07 Jun 2019 12:07:13 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=SoftFail smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: SoftFail (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 17GX6J6aerUjZYKTXFETGqo/kyFwrYHdHTCmgnXAthn2hPzQethfsNOhdCr+1nVpo9FFlje2f6
 MF1tJ9szE+eDKmxTPTpvj5c7lNuYoToqJiPMkOSPaK11vDVSKivoIS3oa/pxHM90GbkXzJvgM+
 hSaU0uvCYkhz9AwFZT5WKO9FkrJsnJEHQOK2/wgpTyKJnqB+o7ubalXecwXr9S9nNjSGbf3WsU
 vU5vu4NqqpvYgtjxnnsDqcM2jchbxxzxt+24mc4xHh/zy5pl1h1CYITJ0vyfc+/Czz3dXUq403
 /Bo=
X-SBRS: -0.9
X-MesageID: 1451988
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,563,1557201600"; 
   d="scan'208";a="1451988"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 7 Jun 2019 13:07:04 +0100
Message-ID: <1559909224-26062-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86: Fix boot with CONFIG_XSM enabled following
 c/s 7177f589ba
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5LCBib290aW5nIHN0YWdpbmcgZmFpbHMgd2l0aDoKCiAgKFhFTikgVXNpbmcgQVBJ
QyBkcml2ZXIgZGVmYXVsdAogIChYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlICB4ODZfNjQg
IGRlYnVnPXkgICBOb3QgdGFpbnRlZCBdLS0tLQogIChYRU4pIENQVTogICAgMAogIChYRU4pIFJJ
UDogICAgZTAwODpbPGZmZmY4MmQwODAzOGY2NmU+XSBfX3g4Nl9pbmRpcmVjdF90aHVua19yYXgr
MHhlLzB4MTAKICAoWEVOKSBSRkxBR1M6IDAwMDAwMDAwMDAwMTAwMTYgICBDT05URVhUOiBoeXBl
cnZpc29yCiAgKFhFTikgcmF4OiBjMmMyYzJjMmMyYzJjMmMyICAgcmJ4OiBmZmZmODMwMDNmNGNj
MDAwICAgcmN4OiAwMDAwMDAwMDAwMDAwMDAwCiAgPHNuaXA+CiAgKFhFTikgWGVuIGNvZGUgYXJv
dW5kIDxmZmZmODJkMDgwMzhmNjZlPiAoX194ODZfaW5kaXJlY3RfdGh1bmtfcmF4KzB4ZS8weDEw
KToKICAoWEVOKSAgYWUgZTggZWIgZmIgNDggODkgMDQgMjQgPGMzPiA5MCBlOCAwNSAwMCAwMCAw
MCAwZiBhZSBlOCBlYiBmYiA0OCA4OSAwYyAyNAogIChYRU4pIFhlbiBzdGFjayB0cmFjZSBmcm9t
IHJzcD1mZmZmODJkMDgwODI3ZDI4OgogIChYRU4pICAgIGMyYzJjMmMyYzJjMmMyYzIgZmZmZjgy
ZDA4MDIwNzU4OCBmZmZmODJkMDgwODI3ZDY4IDAwMDAwMDAwMDAwMDAwMDAKICA8c25pcD4KICAo
WEVOKSBYZW4gY2FsbCB0cmFjZToKICAoWEVOKSAgICBbPGZmZmY4MmQwODAzOGY2NmU+XSBfX3g4
Nl9pbmRpcmVjdF90aHVua19yYXgrMHhlLzB4MTAKICAoWEVOKSAgICBbPGZmZmY4MmQwODA2MDc4
YTk+XSBzZXR1cF9zeXN0ZW1fZG9tYWlucysweDE4LzB4YWIKICAoWEVOKSAgICBbPGZmZmY4MmQw
ODA2MmQ5Yzg+XSBfX3N0YXJ0X3hlbisweDFlYTkvMHgyOTM1CiAgKFhFTikgICAgWzxmZmZmODJk
MDgwMjAwMGYzPl0gX19oaWdoX3N0YXJ0KzB4NTMvMHg1NQogIChYRU4pCiAgKFhFTikgKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgogIChYRU4pIFBhbmljIG9uIENQVSAw
OgogIChYRU4pIEdFTkVSQUwgUFJPVEVDVElPTiBGQVVMVAogIChYRU4pIFtlcnJvcl9jb2RlPTAw
MDBdCiAgKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgoKVUJT
QU4gKHdoaWNoIEkgaGFwcGVuZWQgdG8gaGF2ZSBhY3RpdmUgaW4gbXkgYnVpbGQgYXQgdGhlIHRp
bWUpIGlkZW50aWZpZXMgdGhlCnByb2JsZW0gZXhwbGljaXRseToKCiAgKFhFTikgVXNpbmcgQVBJ
QyBkcml2ZXIgZGVmYXVsdAogIChYRU4pID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CiAgKFhFTikg
VUJTQU46IFVuZGVmaW5lZCBiZWhhdmlvdXIgaW4gL2xvY2FsL3hlbi5naXQveGVuL2luY2x1ZGUv
eHNtL3hzbS5oOjMwOToxOQogIChYRU4pIG1lbWJlciBhY2Nlc3Mgd2l0aGluIG51bGwgcG9pbnRl
ciBvZiB0eXBlICdzdHJ1Y3QgeHNtX29wZXJhdGlvbnMnCiAgKFhFTikgLS0tLVsgWGVuLTQuMTMt
dW5zdGFibGUgIHg4Nl82NCAgZGVidWc9eSAgIE5vdCB0YWludGVkIF0tLS0tCgoiYWRqdXN0IHN5
c3RlbSBkb21haW4gY3JlYXRpb24gKGFuZCBjYWxsIGl0IGVhcmxpZXIgb24geDg2KSIgZGlkbid0
IGFjY291bnQKZm9yIHRoZSBmYWN0IHRoYXQgZG9tYWluX2NyZWF0ZSgpIGRlcGVuZHMgb24gWFNN
IGFscmVhZHkgYmVpbmcgc2V0IHVwLiAgVGhlcmUKaXMgbm90aGluZyB2ZXJ5IGludGVyZXN0aW5n
IHdoaWNoIHhzbV9tdWx0aWJvb3RfaW5pdCgpIG1vcmUgdGhhbiBhbGxvY2F0aW5nCm1lbW9yeSwg
d2hpY2ggbWVhbnMgaXQgaXMgc2FmZSB0byBtb3ZlIGVhcmxpZXIgZHVyaW5nIGJvb3QuCgpUaGUg
cmVzdWx0aW5nIGJvb3Qgbm93IGxvb2tzIGxpa2U6CgogIChYRU4pIFVzaW5nIEFQSUMgZHJpdmVy
IGRlZmF1bHQKICAoWEVOKSBYU00gRnJhbWV3b3JrIHYxLjAuMCBpbml0aWFsaXplZAogIChYRU4p
IEZsYXNrOiAxMjggYXZ0YWIgaGFzaCBzbG90cywgMjgzIHJ1bGVzLgogIChYRU4pIEZsYXNrOiAx
MjggYXZ0YWIgaGFzaCBzbG90cywgMjgzIHJ1bGVzLgogIChYRU4pIEZsYXNrOiAgNCB1c2Vycywg
MyByb2xlcywgMzggdHlwZXMsIDIgYm9vbHMKICAoWEVOKSBGbGFzazogIDEzIGNsYXNzZXMsIDI4
MyBydWxlcwogIChYRU4pIEZsYXNrOiAgU3RhcnRpbmcgaW4gZW5mb3JjaW5nIG1vZGUuCiAgKFhF
TikgQUNQSTogdjUgU0xFRVAgSU5GTzogY29udHJvbFswOjBdLCBzdGF0dXNbMDowXQoKYW5kCgog
IChYRU4pIFVzaW5nIEFQSUMgZHJpdmVyIGRlZmF1bHQKICAoWEVOKSBYU00gRnJhbWV3b3JrIHYx
LjAuMCBpbml0aWFsaXplZAogIChYRU4pIEluaXRpYWxpc2luZyBYU00gU0lMTyBtb2RlCiAgKFhF
TikgQUNQSTogdjUgU0xFRVAgSU5GTzogY29udHJvbFswOjBdLCBzdGF0dXNbMDowXQoKU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkND
OiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
PgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2Fy
Y2gveDg2L3NldHVwLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4v
YXJjaC94ODYvc2V0dXAuYwppbmRleCA2YzNhN2VkLi5kMjAxMTkxIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwpAQCAtMTUzMyw2ICsx
NTMzLDggQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBt
YmlfcCkKICAgICBtbWlvX3JvX3JhbmdlcyA9IHJhbmdlc2V0X25ldyhOVUxMLCAici9vIG1taW8g
cmFuZ2VzIiwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSQU5HRVNFVEZfcHJl
dHR5cHJpbnRfaGV4KTsKIAorICAgIHhzbV9tdWx0aWJvb3RfaW5pdChtb2R1bGVfbWFwLCBtYmkp
OworCiAgICAgc2V0dXBfc3lzdGVtX2RvbWFpbnMoKTsKIAogICAgIGFjcGlfYm9vdF9pbml0KCk7
CkBAIC0xNTgzLDggKzE1ODUsNiBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1
bnNpZ25lZCBsb25nIG1iaV9wKQogCiAgICAgaW5pdF9JUlEoKTsKIAotICAgIHhzbV9tdWx0aWJv
b3RfaW5pdChtb2R1bGVfbWFwLCBtYmkpOwotCiAgICAgbWljcm9jb2RlX2dyYWJfbW9kdWxlKG1v
ZHVsZV9tYXAsIG1iaSk7CiAKICAgICB0aW1lcl9pbml0KCk7Ci0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
