Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44296F0637
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 20:46:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS4jj-0005g2-E7; Tue, 05 Nov 2019 19:43:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rgKV=Y5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iS4jh-0005fr-IQ
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 19:43:29 +0000
X-Inumbo-ID: 87f42c08-0004-11ea-9631-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87f42c08-0004-11ea-9631-bc764e2007e4;
 Tue, 05 Nov 2019 19:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572983005;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=hPrZvzQfRdYVwJuZQQi3nJdPY4SK4z9tSv3EXbIdUR4=;
 b=PIc2DLE3XbvFi07k61uKF7dyMzplioUYjAZxSLr5XUmArW33cbSxRJRB
 kzrXHlWgDTLDXkQskYe7jKr4gOOBm74JPjXKlWk+Xhq4R2SJqsfat4kLX
 P0J0g347j88FuGsCEftF8NLCxByA1217EkzX7Que5ZdERfXDkc6VHsW/4 c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: n/ntTUMBHdXfDhIsaZ//MzxxQ+rF4cFJL1QaSTcBG5CvludCFNnttdzeRxDBOD2vuL0SRotDCL
 x5f55ExKUEpm64w6sodE/IoN81GVpOuJxFjyXjAg8PA9TiG2BWdPR4ChTDpJ/MazAo9zYQD+K3
 AGDtczbxFxKJIu+ehxssdbX7zVzpY1TbXLsU0KnTnhpb10VLV4rY0jfEbj2jh5Mh6tYGOEuQwC
 3HqydbyZalgBrW1kY7sw1bABPQyaUAjIrXIJHbqqgqdLqchUW6u8xt0hZQX/9JQJNbXRNkrcUk
 JhQ=
X-SBRS: 2.7
X-MesageID: 7892190
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,271,1569297600"; 
   d="scan'208";a="7892190"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 5 Nov 2019 19:43:16 +0000
Message-ID: <20191105194317.16232-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191105194317.16232-1-andrew.cooper3@citrix.com>
References: <20191105194317.16232-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/livepatch: Add a return value to load
 hooks
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T25lIHVzZSBvZiBsb2FkIGhvb2tzIGlzIHRvIHBlcmZvcm0gYSBzYWZldHkgY2hlY2sgb2YgdGhl
IHN5c3RlbSBpbiBpdHMKcXVpZXNjZWQgc3RhdGUuICBBbnkgbm9uLXplcm8gcmV0dXJuIHZhbHVl
IGZyb20gYSBsb2FkIGhvb2sgd2lsbCBhYm9ydCB0aGUKYXBwbHkgYXR0ZW1wdC4KClNpZ25lZC1v
ZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzog
S29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDQzogUm9zcyBM
YWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CkNDOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgpGb3Igc2V2ZXJhbCB5ZWFycywgdGhlIGZvbGxvd2luZyBwYXRjaCBp
biB0aGUgc2VyaWVzIGhhcyBiZWVuIHNoaXBwZWQgaW4gZXZlcnkKWGVuU2VydmVyIGxpdmVwYXRj
aCwgaW1wbGVtZW50ZWQgYXMgYSB2b2lkIGxvYWQgaG9vayB3aGljaCBtb2RpZmllcyBpdHMgcmV0
dXJuCmFkZHJlc3MgdG8gc2tpcCB0byB0aGUgZW5kIG9mIGFwcGx5X3BheWxvYWQoKS4gIFRoaXMg
bWV0aG9kIGlzIGRpc3RpbmN0bHkgbGVzcwpoYWNreS4KLS0tCiB4ZW4vY29tbW9uL2xpdmVwYXRj
aC5jICAgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oICB8ICAyICstCiB4ZW4vdGVzdC9saXZl
cGF0Y2gveGVuX2hlbGxvX3dvcmxkLmMgfCAxMiArKysrKysrKystLS0KIDMgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Nv
bW1vbi9saXZlcGF0Y2guYyBiL3hlbi9jb21tb24vbGl2ZXBhdGNoLmMKaW5kZXggN2NhYTMwYzIw
Mi4uOTYyNjQ3NjE2YSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9saXZlcGF0Y2guYworKysgYi94
ZW4vY29tbW9uL2xpdmVwYXRjaC5jCkBAIC0xMDc2LDI1ICsxMDc2LDMzIEBAIHN0YXRpYyBpbnQg
YXBwbHlfcGF5bG9hZChzdHJ1Y3QgcGF5bG9hZCAqZGF0YSkKICAgICAgKiB0ZW1wb3JhcmlseSBk
aXNhYmxlIHRoZSBzcGluIGxvY2tzIElSUSBzdGF0ZSBjaGVja3MuCiAgICAgICovCiAgICAgc3Bp
bl9kZWJ1Z19kaXNhYmxlKCk7Ci0gICAgZm9yICggaSA9IDA7IGkgPCBkYXRhLT5uX2xvYWRfZnVu
Y3M7IGkrKyApCi0gICAgICAgIGRhdGEtPmxvYWRfZnVuY3NbaV0oKTsKKyAgICBmb3IgKCBpID0g
MDsgIXJjICYmIGkgPCBkYXRhLT5uX2xvYWRfZnVuY3M7IGkrKyApCisgICAgICAgIHJjID0gZGF0
YS0+bG9hZF9mdW5jc1tpXSgpOwogICAgIHNwaW5fZGVidWdfZW5hYmxlKCk7CiAKKyAgICBpZiAo
IHJjICkKKyAgICAgICAgcHJpbnRrKFhFTkxPR19FUlIgTElWRVBBVENIICIlczogbG9hZF9mdW5j
c1sldV0gZmFpbGVkOiAlZFxuIiwKKyAgICAgICAgICAgICAgIGRhdGEtPm5hbWUsIGksIHJjKTsK
KwogICAgIEFTU0VSVCghbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSk7CiAKLSAgICBmb3IgKCBpID0g
MDsgaSA8IGRhdGEtPm5mdW5jczsgaSsrICkKLSAgICAgICAgYXJjaF9saXZlcGF0Y2hfYXBwbHko
JmRhdGEtPmZ1bmNzW2ldKTsKKyAgICBpZiAoICFyYyApCisgICAgICAgIGZvciAoIGkgPSAwOyBp
IDwgZGF0YS0+bmZ1bmNzOyBpKysgKQorICAgICAgICAgICAgYXJjaF9saXZlcGF0Y2hfYXBwbHko
JmRhdGEtPmZ1bmNzW2ldKTsKIAogICAgIGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSgpOwogCi0gICAg
LyoKLSAgICAgKiBXZSBuZWVkIFJDVSB2YXJpYW50ICh3aGljaCBoYXMgYmFycmllcnMpIGluIGNh
c2Ugd2UgY3Jhc2ggaGVyZS4KLSAgICAgKiBUaGUgYXBwbGllZF9saXN0IGlzIGl0ZXJhdGVkIGJ5
IHRoZSB0cmFwIGNvZGUuCi0gICAgICovCi0gICAgbGlzdF9hZGRfdGFpbF9yY3UoJmRhdGEtPmFw
cGxpZWRfbGlzdCwgJmFwcGxpZWRfbGlzdCk7Ci0gICAgcmVnaXN0ZXJfdmlydHVhbF9yZWdpb24o
JmRhdGEtPnJlZ2lvbik7CisgICAgaWYgKCAhcmMgKQorICAgIHsKKyAgICAgICAgLyoKKyAgICAg
ICAgICogV2UgbmVlZCBSQ1UgdmFyaWFudCAod2hpY2ggaGFzIGJhcnJpZXJzKSBpbiBjYXNlIHdl
IGNyYXNoIGhlcmUuCisgICAgICAgICAqIFRoZSBhcHBsaWVkX2xpc3QgaXMgaXRlcmF0ZWQgYnkg
dGhlIHRyYXAgY29kZS4KKyAgICAgICAgICovCisgICAgICAgIGxpc3RfYWRkX3RhaWxfcmN1KCZk
YXRhLT5hcHBsaWVkX2xpc3QsICZhcHBsaWVkX2xpc3QpOworICAgICAgICByZWdpc3Rlcl92aXJ0
dWFsX3JlZ2lvbigmZGF0YS0+cmVnaW9uKTsKKyAgICB9CiAKLSAgICByZXR1cm4gMDsKKyAgICBy
ZXR1cm4gcmM7CiB9CiAKIHN0YXRpYyBpbnQgcmV2ZXJ0X3BheWxvYWQoc3RydWN0IHBheWxvYWQg
KmRhdGEpCmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoX3BheWxvYWQuaCBi
L3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oCmluZGV4IDRhMWE5NmQwNTQuLjM3
ODhiNTJkZGYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5o
CisrKyBiL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2hfcGF5bG9hZC5oCkBAIC05LDcgKzksNyBA
QAogICogVGhlIGZvbGxvd2luZyBkZWZpbml0aW9ucyBhcmUgdG8gYmUgdXNlZCBpbiBwYXRjaGVz
LiBUaGV5IGFyZSB0YWtlbgogICogZnJvbSBrcGF0Y2guCiAgKi8KLXR5cGVkZWYgdm9pZCBsaXZl
cGF0Y2hfbG9hZGNhbGxfdCh2b2lkKTsKK3R5cGVkZWYgaW50IGxpdmVwYXRjaF9sb2FkY2FsbF90
KHZvaWQpOwogdHlwZWRlZiB2b2lkIGxpdmVwYXRjaF91bmxvYWRjYWxsX3Qodm9pZCk7CiAKIC8q
CmRpZmYgLS1naXQgYS94ZW4vdGVzdC9saXZlcGF0Y2gveGVuX2hlbGxvX3dvcmxkLmMgYi94ZW4v
dGVzdC9saXZlcGF0Y2gveGVuX2hlbGxvX3dvcmxkLmMKaW5kZXggMDJmM2Y4NWRjMC4uZDcyMDAw
MWYwNyAxMDA2NDQKLS0tIGEveGVuL3Rlc3QvbGl2ZXBhdGNoL3hlbl9oZWxsb193b3JsZC5jCisr
KyBiL3hlbi90ZXN0L2xpdmVwYXRjaC94ZW5faGVsbG9fd29ybGQuYwpAQCAtMTYsOSArMTYsMTEg
QEAgc3RhdGljIGNvbnN0IGNoYXIgaGVsbG9fd29ybGRfcGF0Y2hfdGhpc19mbmNbXSA9ICJ4ZW5f
ZXh0cmFfdmVyc2lvbiI7CiBleHRlcm4gY29uc3QgY2hhciAqeGVuX2hlbGxvX3dvcmxkKHZvaWQp
Owogc3RhdGljIHVuc2lnbmVkIGludCBjbnQ7CiAKLXN0YXRpYyB2b2lkIGFwcGx5X2hvb2sodm9p
ZCkKK3N0YXRpYyBpbnQgYXBwbHlfaG9vayh2b2lkKQogewogICAgIHByaW50ayhLRVJOX0RFQlVH
ICJIb29rIGV4ZWN1dGluZy5cbiIpOworCisgICAgcmV0dXJuIDA7CiB9CiAKIHN0YXRpYyB2b2lk
IHJldmVydF9ob29rKHZvaWQpCkBAIC0yNiwxMCArMjgsMTQgQEAgc3RhdGljIHZvaWQgcmV2ZXJ0
X2hvb2sodm9pZCkKICAgICBwcmludGsoS0VSTl9ERUJVRyAiSG9vayB1bmxvYWRlZC5cbiIpOwog
fQogCi1zdGF0aWMgdm9pZCAgaGlfZnVuYyh2b2lkKQorc3RhdGljIGludCBoaV9mdW5jKHZvaWQp
CiB7CiAgICAgcHJpbnRrKEtFUk5fREVCVUcgIiVzOiBIaSEgKGNhbGxlZCAldSB0aW1lcylcbiIs
IF9fZnVuY19fLCArK2NudCk7CisKKyAgICByZXR1cm4gMDsKIH07CisvKiBTYWZlIHRvIGNhc3Qg
YXdheSB0aGUgcmV0dXJuIHZhbHVlIGZvciB0aGlzIHRyaXZpYWwgY2FzZS4gKi8KK3ZvaWQgKHZv
aWRfaGlfZnVuYykodm9pZCkgX19hdHRyaWJ1dGVfXygoYWxpYXMoImhpX2Z1bmMiKSkpOwogCiBz
dGF0aWMgdm9pZCBjaGVja19mbmModm9pZCkKIHsKQEAgLTQzLDcgKzQ5LDcgQEAgTElWRVBBVENI
X1VOTE9BRF9IT09LKHJldmVydF9ob29rKTsKIC8qIEltYmFsYW5jZSBoZXJlLiBUd28gbG9hZCBh
bmQgdGhyZWUgdW5sb2FkLiAqLwogCiBMSVZFUEFUQ0hfTE9BRF9IT09LKGhpX2Z1bmMpOwotTElW
RVBBVENIX1VOTE9BRF9IT09LKGhpX2Z1bmMpOworTElWRVBBVENIX1VOTE9BRF9IT09LKHZvaWRf
aGlfZnVuYyk7CiAKIExJVkVQQVRDSF9VTkxPQURfSE9PSyhjaGVja19mbmMpOwogCi0tIAoyLjEx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
