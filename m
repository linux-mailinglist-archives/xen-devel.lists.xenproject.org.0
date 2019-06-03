Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B8232FBF
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 14:35:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmA2-0004K3-K5; Mon, 03 Jun 2019 12:33:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9f30=UC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hXmA1-0004Jo-Ge
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:33:57 +0000
X-Inumbo-ID: d9840170-85fb-11e9-876b-db723debf754
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9840170-85fb-11e9-876b-db723debf754;
 Mon, 03 Jun 2019 12:33:55 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 23.29.105.83 as
 permitted sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: M8pNHGGQ+Bi9BrIvKX0M0XvfKbCFnbdYBHroOv7zamEPZHCz6yGWSGF55aG/FPAaA4B6wtNo5B
 IOx7OCLCAqjuR2BfxXhaHJvxjKBqwXJTET/bAPTR9AzoW1UBYDLvDm6lX6FphztM27vy5QpykU
 LfjWFiHvE4kZmYmqSDlgbumhvZov6jSjwyFwV/KboBrwYrTRbap7TX71GF/JT+RcY+/RD8JRyI
 aoYpiFeMpA56tdxjS2JXxqeLyqdQ2PDnM9cdwu+bewe3FmAj0GlSmky3kQYDUV86Jux+Pk5px+
 /5Y=
X-SBRS: 2.7
X-MesageID: 1213600
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,546,1549947600"; 
   d="scan'208";a="1213600"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 3 Jun 2019 13:33:46 +0100
Message-ID: <1559565226-19789-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2] x86/hvm: Make the altp2m locking in
 hvm_hap_nested_page_fault() easier to follow
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RHJvcCB0aGUgYXAybV9hY3RpdmUgYm9vbGVhbiwgYW5kIGNvbnNpc3RlbnRseSB1c2UgdGhlIHVu
bG9ja2luZyBmb3JtOgoKICBpZiAoIHAybSAhPSBob3N0cDJtICkKICAgICAgIF9fcHV0X2dmbihw
Mm0sIGdmbik7CiAgX19wdXRfZ2ZuKGhvc3RwMm0sIGdmbik7Cgp3aGljaCBtYWtlcyBpdCBjbGVh
ciB0aGF0IHdlIGFsd2F5cyB1bmxvY2sgdGhlIGFsdHAybSdzIGdmbiBpZiBpdCBpcyBpbiB1c2Us
CmFuZCBhbHdheXMgdW5sb2NrIHRoZSBob3N0cDJtJ3MgZ2ZuLiAgVGhpcyBhbHNvIGRyb3BzIHRo
ZSB0ZXJuYXJ5IGV4cHJlc3Npb24KaW4gdGhlIGxvZ2RpcnR5IGNhc2UuCgpFeHRlbmQgdGhlIGxv
Z2RpcnR5IGNvbW1lbnQgdG8gaWRlbnRpZnkgd2hlcmUgdGhlIGxvY2tpbmcgdmlvbGF0aW9uIGlz
IGxpYWJsZQp0byBvY2N1ci4KCk5vIChpbnRlbmRlZCkgb3ZlcmFsbCBjaGFuZ2UgaW4gYmVoYXZp
b3VyLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KUmV2aWV3ZWQtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVy
LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCkND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+CkNDOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+CkNDOiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+Cgp2MjoKICogRWRpdCBz
dWJqZWN0IHRvIGJlIGNsZWFyZXIKICogUmViYXNlIG92ZXIgVGFtYXMnIGxhenkgY29weSBjbGVh
bnVwCi0tLQogeGVuL2FyY2gveDg2L2h2bS9odm0uYyB8IDIxICsrKysrKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5j
CmluZGV4IGQ4ZDVkNDUuLjAyOWVlYTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZt
LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMTY5MSw3ICsxNjkxLDcgQEAgaW50
IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxvbmcgZ2xh
LAogICAgIGludCByYywgZmFsbF90aHJvdWdoID0gMCwgcGFnZWQgPSAwOwogICAgIGludCBzaGFy
aW5nX2Vub21lbSA9IDA7CiAgICAgdm1fZXZlbnRfcmVxdWVzdF90ICpyZXFfcHRyID0gTlVMTDsK
LSAgICBib29sX3QgYXAybV9hY3RpdmUsIHN5bmMgPSAwOworICAgIGJvb2wgc3luYyA9IGZhbHNl
OwogICAgIHVuc2lnbmVkIGludCBwYWdlX29yZGVyOwogCiAgICAgLyogT24gTmVzdGVkIFZpcnR1
YWxpemF0aW9uLCB3YWxrIHRoZSBndWVzdCBwYWdlIHRhYmxlLgpAQCAtMTc1MCw4ICsxNzUwLDYg
QEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBncGEsIHVuc2lnbmVkIGxv
bmcgZ2xhLAogICAgICAgICBnb3RvIG91dDsKICAgICB9CiAKLSAgICBhcDJtX2FjdGl2ZSA9IGFs
dHAybV9hY3RpdmUoY3VycmQpOwotCiAgICAgLyoKICAgICAgKiBUYWtlIGEgbG9jayBvbiB0aGUg
aG9zdCBwMm0gc3BlY3VsYXRpdmVseSwgdG8gYXZvaWQgcG90ZW50aWFsCiAgICAgICogbG9ja2lu
ZyBvcmRlciBwcm9ibGVtcyBsYXRlciBhbmQgdG8gaGFuZGxlIHVuc2hhcmUgZXRjLgpAQCAtMTc2
MSw3ICsxNzU5LDcgQEAgaW50IGh2bV9oYXBfbmVzdGVkX3BhZ2VfZmF1bHQocGFkZHJfdCBncGEs
IHVuc2lnbmVkIGxvbmcgZ2xhLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUDJNX0FM
TE9DIHwgKG5wZmVjLndyaXRlX2FjY2VzcyA/IFAyTV9VTlNIQVJFIDogMCksCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmcGFnZV9vcmRlcik7CiAKLSAgICBpZiAoIGFwMm1fYWN0aXZl
ICkKKyAgICBpZiAoIGFsdHAybV9hY3RpdmUoY3VycmQpICkKICAgICB7CiAgICAgICAgIHAybSA9
IHAybV9nZXRfYWx0cDJtKGN1cnIpOwogCkBAIC0xODg4LDEzICsxODg2LDE0IEBAIGludCBodm1f
aGFwX25lc3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKICAg
ICAgICAgewogICAgICAgICAgICAgcGFnaW5nX21hcmtfcGZuX2RpcnR5KGN1cnJkLCBfcGZuKGdm
bikpOwogICAgICAgICAgICAgLyoKLSAgICAgICAgICAgICAqIElmIHAybSBpcyByZWFsbHkgYW4g
YWx0cDJtLCB1bmxvY2sgaGVyZSB0byBhdm9pZCBsb2NrIG9yZGVyaW5nCi0gICAgICAgICAgICAg
KiB2aW9sYXRpb24gd2hlbiB0aGUgY2hhbmdlIGJlbG93IGlzIHByb3BhZ2F0ZWQgZnJvbSBob3N0
IHAybS4KKyAgICAgICAgICAgICAqIElmIHAybSBpcyByZWFsbHkgYW4gYWx0cDJtLCB1bmxvY2sg
aXQgYmVmb3JlIGNoYW5naW5nIHRoZSB0eXBlLAorICAgICAgICAgICAgICogYXMgcDJtX2FsdHAy
bV9wcm9wYWdhdGVfY2hhbmdlKCkgbmVlZHMgdG8gYWNxdWlyZSB0aGUKKyAgICAgICAgICAgICAq
IGFsdHAybV9saXN0IGxvY2suCiAgICAgICAgICAgICAgKi8KLSAgICAgICAgICAgIGlmICggYXAy
bV9hY3RpdmUgKQorICAgICAgICAgICAgaWYgKCBwMm0gIT0gaG9zdHAybSApCiAgICAgICAgICAg
ICAgICAgX19wdXRfZ2ZuKHAybSwgZ2ZuKTsKICAgICAgICAgICAgIHAybV9jaGFuZ2VfdHlwZV9v
bmUoY3VycmQsIGdmbiwgcDJtX3JhbV9sb2dkaXJ0eSwgcDJtX3JhbV9ydyk7Ci0gICAgICAgICAg
ICBfX3B1dF9nZm4oYXAybV9hY3RpdmUgPyBob3N0cDJtIDogcDJtLCBnZm4pOworICAgICAgICAg
ICAgX19wdXRfZ2ZuKGhvc3RwMm0sIGdmbik7CiAKICAgICAgICAgICAgIGdvdG8gb3V0OwogICAg
ICAgICB9CkBAIC0xOTE1LDkgKzE5MTQsOSBAQCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVs
dChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9uZyBnbGEsCiAgICAgcmMgPSBmYWxsX3Rocm91Z2g7
CiAKICBvdXRfcHV0X2dmbjoKLSAgICBfX3B1dF9nZm4ocDJtLCBnZm4pOwotICAgIGlmICggYXAy
bV9hY3RpdmUgKQotICAgICAgICBfX3B1dF9nZm4oaG9zdHAybSwgZ2ZuKTsKKyAgICBpZiAoIHAy
bSAhPSBob3N0cDJtICkKKyAgICAgICAgX19wdXRfZ2ZuKHAybSwgZ2ZuKTsKKyAgICBfX3B1dF9n
Zm4oaG9zdHAybSwgZ2ZuKTsKICBvdXQ6CiAgICAgLyogQWxsIG9mIHRoZXNlIGFyZSBkZWxheWVk
IHVudGlsIHdlIGV4aXQsIHNpbmNlIHdlIG1pZ2h0IAogICAgICAqIHNsZWVwIG9uIGV2ZW50IHJp
bmcgd2FpdCBxdWV1ZXMsIGFuZCB3ZSBtdXN0IG5vdCBob2xkCi0tIAoyLjEuNAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
