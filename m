Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7546F108E1E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 13:42:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDeR-00073h-BO; Mon, 25 Nov 2019 12:39:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+HWr=ZR=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iZDeP-00073P-L6
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:39:33 +0000
X-Inumbo-ID: 9e1f7308-0f80-11ea-a38f-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e1f7308-0f80-11ea-a38f-12813bfff9fa;
 Mon, 25 Nov 2019 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574685567;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HOGdDhtENMkSj0XwuMFJWG7Yl6DNkudQovEu1wtjqWI=;
 b=cCY0gJHInaS5h/w54SFqsbQV3GTQOEQw8qiuUvQOAngpbv1EZknFAKuS
 bvOI4K94B9OoAvxq5LE54/FEcbLJqIHz6i/rWzllOMhZKvqN8wNpJK8EH
 EQ0r86HWgyFjmX2KO2Cia/lbQC+yM26uGy7H7I+CZmacrLh77alriUW2F Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +BRnsVDPxOWGyzxDa7xeuzOOBvAIJS0XxlgAVBdGAMoEc7T5T/Ru21Kojcjn6JewsUSqPh2v2v
 oJedFSGs7snn7ZdU/giWgVt4+XhHcG4CbQG7GpaTWDkhvJy8aHSzZLL4zHCy0KGZs/oANmlpXw
 uLwvF7WwtDolCBFxNgpNvnniYYyJFmqrj/gqlik5l8JeADrLXanWFsCmWY6Eqw+df4n5ET2MN3
 GZcbsi3GjEmatzMWLm8gNVbiA2DRLClHSP6MXciGwDlV66MKO3Rh83LOlpNi9cPQ/YWH5Z6a+V
 O6U=
X-SBRS: 2.7
X-MesageID: 9199247
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,241,1571716800"; 
   d="scan'208";a="9199247"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 25 Nov 2019 12:39:23 +0000
Message-ID: <20191125123923.2000028-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RFC] x86: Don't increase ApicIdCoreSize past 7
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
Cc: Juergen Gross <jgross@suse.com>, Steven Haigh <netwiz@crc.id.au>, Wei
 Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Andreas Kinzler <hfp@posteo.de>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hhbmdlc2V0IGNhMmVlZTkyZGY0NCAoIng4NiwgaHZtOiBFeHBvc2UgaG9zdCBjb3JlL0hUIHRv
cG9sb2d5IHRvIEhWTQpndWVzdHMiKSBhdHRlbXB0ZWQgdG8gImZha2UgdXAiIGEgdG9wb2xvZ3kg
d2hpY2ggd291bGQgaW5kdWNlIGd1ZXN0Cm9wZXJhdGluZyBzeXN0ZW1zIHRvIG5vdCB0cmVhdCB2
Y3B1cyBhcyBzaWJsaW5nIGh5cGVydGhyZWFkcy4gIFRoaXMKaW52b2x2ZWQgYWN0dWFsbHkgcmVw
b3J0aW5nIGh5cGVydGhyZWFkaW5nIGFzIGF2YWlsYWJsZSwgYnV0IGdpdmluZwp2Y3B1cyBldmVy
eSBvdGhlciBBcGljSWQ7IHdoaWNoIGluIHR1cm4gbGVkIHRvIGRvdWJsaW5nIHRoZSBBcGljSWRz
CnBlciBjb3JlIGJ5IGJ1bXBpbmcgdGhlIEFwaWNJZENvcmVTaXplIGJ5IG9uZS4gIEluIHBhcnRp
Y3VsYXIsIFJ5emVuCjN4eHggc2VyaWVzIHByb2Nlc3NvcnMsIGFuZCByZXBvcnRlZGx5IEVQWUMg
IlJvbWUiIGNwdXMgLS0gaGF2ZSBhbgpBcGljSWRDb3JlU2l6ZSBvZiA3OyB0aGUgImZha2UiIHRv
cG9sb2d5IGluY3JlYXNlcyB0aGlzIHRvIDguCgpVbmZvcnR1bmF0ZWx5LCBXaW5kb3dzIHJ1bm5p
bmcgb24gbW9kZXJuIEFNRCBoYXJkd2FyZSAtLSBpbmNsdWRpbmcKUnl6ZW4gM3h4eCBzZXJpZXMg
cHJvY2Vzc29ycywgYW5kIHJlcG9ydGVkbHkgRVBZQyAiUm9tZSIgY3B1cyAtLQpkb2Vzbid0IHNl
ZW0gdG8gY29wZSB3aXRoIHRoaXMgdmFsdWUgYmVpbmcgaGlnaGVyIHRoYW4gNy4gIChMaW51eApn
dWVzdHMgaGF2ZSBzbyBmYXIgY29udGludWVkIHRvIGNvcGUuKQoKQSAicHJvcGVyIiBmaXggaXMg
Y29tcGxpY2F0ZWQgYW5kIGl0J3MgdG9vIGxhdGUgdG8gZml4IGl0IGVpdGhlciBmb3IKNC4xMywg
b3IgdG8gYmFja3BvcnQgdG8gc3VwcG9ydGVkIGJyYW5jaGVzLiAgQXMgYSBzaG9ydC10ZXJtIGZp
eCwKbGltaXQgdGhpcyB2YWx1ZSB0byA3LgoKVGhpcyBkb2VzIG1lYW4gdGhhdCBhIExpbnV4IGd1
ZXN0LCBib290ZWQgb24gc3VjaCBhIHN5c3RlbSB3aXRob3V0CnRoaXMgY2hhbmdlLCBhbmQgdGhl
biBtaWdyYXRpbmcgdG8gYSBzeXN0ZW0gd2l0aCB0aGlzIGNoYW5nZSwgd2l0aAptb3JlIHRoYW4g
NjQgdmNwdXMsIHdvdWxkIHNlZSBhbiBhcHBhcmVudCB0b3BvbG9neSBjaGFuZ2UuICBUaGlzIGlz
IGEKbG93IGVub3VnaCByaXNrIGluIHByYWN0aWNlIHRoYXQgZW5hYmxpbmcgdGhpcyBsaW1pdCB1
bmlsYXRlcmFsbHksIHRvCmFsbG93IG90aGVyIGd1ZXN0cyB0byBib290IHdpdGhvdXQgbWFudWFs
IGludGVydmVudGlvbiwgaXMgd29ydGggaXQuCgpSZXBvcnRlZC1ieTogU3RldmVuIEhhaWdoIDxu
ZXR3aXpAY3JjLmlkLmF1PgpSZXBvcnRlZC1ieTogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVv
LmRlPgpTaWduZWQtb2ZmLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5j
b20+Ci0tLQpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ0M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ0M6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB0b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyB8IDcg
KysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jIGIvdG9vbHMvbGlieGMveGNf
Y3B1aWRfeDg2LmMKaW5kZXggMzEyYzQ4MWYxZS4uNTE5ZDZkOGJkMCAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGMveGNfY3B1aWRfeDg2LmMKKysrIGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMK
QEAgLTYxNiwxMCArNjE2LDE1IEBAIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJm
YWNlICp4Y2gsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICAgICAgICogLSBnb2luZyBvdXQgb2Yg
c3luYyB3aXRoIGxlYWYgMSBFQlhbMjM6MTZdLAogICAgICAgICAgICAgICogLSBpbmNyZW1lbnRp
bmcgQXBpY0lkQ29yZVNpemUgd2hlbiBpdCdzIHplcm8gKHdoaWNoIGNoYW5nZXMgdGhlCiAgICAg
ICAgICAgICAgKiAgIG1lYW5pbmcgb2YgYml0cyA3OjApLgorICAgICAgICAgICAgICoKKyAgICAg
ICAgICAgICAqIFVQREFURTogSSBhZGRpdGlvbiB0byBhdm9pZGluZyBvdmVyZmxvdywgc29tZQor
ICAgICAgICAgICAgICogcHJvcHJpZXRhcnkgb3BlcmF0aW5nIHN5c3RlbXMgaGF2ZSB0cm91Ymxl
IHdpdGgKKyAgICAgICAgICAgICAqIGFwaWNfaWRfc2l6ZSB2YWx1ZXMgZ3JlYXRlciB0aGFuIDcu
ICBMaW1pdCB0aGUgdmFsdWUgdG8KKyAgICAgICAgICAgICAqIDcgZm9yIG5vdy4KICAgICAgICAg
ICAgICAqLwogICAgICAgICAgICAgaWYgKCBwLT5leHRkLm5jIDwgMHg3ZiApCiAgICAgICAgICAg
ICB7Ci0gICAgICAgICAgICAgICAgaWYgKCBwLT5leHRkLmFwaWNfaWRfc2l6ZSAhPSAwICYmIHAt
PmV4dGQuYXBpY19pZF9zaXplICE9IDB4ZiApCisgICAgICAgICAgICAgICAgaWYgKCBwLT5leHRk
LmFwaWNfaWRfc2l6ZSAhPSAwICYmIHAtPmV4dGQuYXBpY19pZF9zaXplIDwgMHg3ICkKICAgICAg
ICAgICAgICAgICAgICAgcC0+ZXh0ZC5hcGljX2lkX3NpemUrKzsKIAogICAgICAgICAgICAgICAg
IHAtPmV4dGQubmMgPSAocC0+ZXh0ZC5uYyA8PCAxKSB8IDE7Ci0tIAoyLjI0LjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
