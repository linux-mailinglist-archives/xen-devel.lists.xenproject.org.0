Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1F916A448
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:49:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BGg-0004xS-1Z; Mon, 24 Feb 2020 10:47:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BGe-0004we-H7
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:47:16 +0000
X-Inumbo-ID: 034a7692-56f3-11ea-ade5-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 034a7692-56f3-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 10:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582541232;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hp9Vkqbe2RJlMyNORLmAYW7aPSJozo4GoKahM6QtP04=;
 b=U97t8DgRJZ2HR7H4yNyTwAbtRsNgkSXQze+Jj6w9dYcWNHoQRZrBWU4P
 AQFUc/FMD2LzCsHQxZZ02SO4vIWpTHnsxBG4AL4spCHs6/J6gm3ARuybp
 quRHqqLZ2sTKfPY7iQYjyCFj9yQc+9YzpfGP18YTWP1nayV4M6UF/L7SV 8=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: GJZG/dvyvx4OIYRiA9zzcCEOmdD1SkvqdXwP+n2s3THK5yCojsAl+/7aDYl/jNgzSzAz3rCRLr
 nKwRCHyxwih1oedmOakJgNZqqNwPPBz/AXZAGiaMwzGXGmZVhOyBdSmmWOOqr994KkCOyByYZ/
 RGuz7+q9w4yBz8Yyt3VZg4W4f/UlBK6Wg7hld4zT1hbGXpWJSADdI7qfMcNe1xEgbhva0AjmpH
 tGl9lAHY2HASOGWP2tHFHt6+j2Yp0f52E6/jxrtSFCu6d+g/z8xRePODd+0yrcUb+sA24IcG76
 E+Q=
X-SBRS: 2.7
X-MesageID: 13524167
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="13524167"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 24 Feb 2020 11:46:44 +0100
Message-ID: <20200224104645.96381-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200224104645.96381-1-roger.pau@citrix.com>
References: <20200224104645.96381-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 4/5] x86/smp: use a dedicated scratch cpumask
 in send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hc2sgaXMgbm90IHNhZmUgYmVjYXVz
ZSBpdCBjYW4gYmUKY2FsbGVkIGZyb20gaW50ZXJydXB0IGNvbnRleHQsIGFuZCBoZW5jZSBYZW4g
d291bGQgaGF2ZSB0byBtYWtlIHN1cmUKYWxsIHRoZSB1c2VycyBvZiB0aGUgc2NyYXRjaCBjcHVt
YXNrIGRpc2FibGUgaW50ZXJydXB0cyB3aGlsZSB1c2luZwppdC4KCkluc3RlYWQgaW50cm9kdWNl
IGEgbmV3IGNwdW1hc2sgdG8gYmUgdXNlZCBieSBzZW5kX0lQSV9tYXNrLCBhbmQKZGlzYWJsZSBp
bnRlcnJ1cHRzIHdoaWxlIHVzaW5nIGl0LgoKTm90ZSB0aGF0IHN1Y2ggbWFzayBjYW5ub3QgYmUg
dXNlZCB3aGVuIG5vbi1tYXNrYWJsZSBpbnRlcnJ1cHRzIGFyZQpiZWluZyBzZXJ2aWNlZCAoI05N
SSBvciAjTUMpIGFuZCBoZW5jZSBmYWxsYmFjayB0byBub3QgdXNpbmcgdGhlCnNob3J0aGFuZCBp
biB0aGF0IGNhc2UsIGxpa2UgaXQgd2FzIGRvbmUgcHJldmlvdXNseS4KCkZpeGVzOiA1NTAwZDI2
NWEyYTggKCd4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdo
ZW4gcG9zc2libGUnKQpSZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5ib29tIDxsaW51eEBlaWtl
bGVuYm9vbS5pdD4KU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Ci0tLQpDaGFuZ2VzIHNpbmNlIHYyOgogLSBGYWxsYmFjayB0byB0aGUgcHJldmlv
dXMgSVBJIHNlbmRpbmcgbWVjaGFuaXNtIGluICNNQyBvciAjTk1JCiAgIGNvbnRleHQuCgpDaGFu
Z2VzIHNpbmNlIHYxOgogLSBEb24ndCB1c2UgdGhlIHNob3J0aGFuZCB3aGVuIGluICNNQyBvciAj
Tk1JIGNvbnRleHQuCi0tLQogeGVuL2FyY2gveDg2L3NtcC5jICAgICB8IDI3ICsrKysrKysrKysr
KysrKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJvb3QuYyB8ICA5ICsrKysrKysrLQog
MiBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwppbmRleCA1NWQw
OGM5ZDUyLi41M2UwZGUyYTcwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wLmMKKysrIGIv
eGVuL2FyY2gveDg2L3NtcC5jCkBAIC01OSw2ICs1OSw3IEBAIHN0YXRpYyB2b2lkIHNlbmRfSVBJ
X3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZlY3RvciwKICAgICBhcGljX3dy
aXRlKEFQSUNfSUNSLCBjZmcpOwogfQogCitERUNMQVJFX1BFUl9DUFUoY3B1bWFza192YXJfdCwg
c2VuZF9pcGlfY3B1bWFzayk7CiAvKgogICogc2VuZF9JUElfbWFzayhjcHVtYXNrLCB2ZWN0b3Ip
OiBzZW5kcyBAdmVjdG9yIElQSSB0byBDUFVzIGluIEBjcHVtYXNrLAogICogZXhjbHVkaW5nIHRo
ZSBsb2NhbCBDUFUuIEBjcHVtYXNrIG1heSBiZSBlbXB0eS4KQEAgLTY3LDcgKzY4LDIxIEBAIHN0
YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50IHZl
Y3RvciwKIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0
b3IpCiB7CiAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOwotICAgIGNwdW1hc2tfdCAqc2Ny
YXRjaCA9IHRoaXNfY3B1KHNjcmF0Y2hfY3B1bWFzayk7CisgICAgY3B1bWFza190ICpzY3JhdGNo
ID0gdGhpc19jcHUoc2VuZF9pcGlfY3B1bWFzayk7CisgICAgdW5zaWduZWQgbG9uZyBmbGFnczsK
KworICAgIGlmICggaW5fbWMoKSB8fCBpbl9ubWkoKSApCisgICAgeworICAgICAgICAvKgorICAg
ICAgICAgKiBXaGVuIGluICNOTUkgb3IgI01DIGNvbnRleHQgZmFsbGJhY2sgdG8gdGhlIG9sZCAo
YW5kIHNpbXBsZXIpIElQSQorICAgICAgICAgKiBzZW5kaW5nIHJvdXRpbmUsIGFuZCBhdm9pZCBk
b2luZyBhbnkgcGVyZm9ybWFuY2Ugb3B0aW1pemF0aW9ucyAobGlrZQorICAgICAgICAgKiB1c2lu
ZyBhIHNob3J0aGFuZCkuIFNlbmRpbmcgYW4gSVBJIGZyb20gc3VjaCBjb250ZXh0cyBpcyBsaWtl
bHkgYQorICAgICAgICAgKiBzaWduIG9mIGEgY3Jhc2gsIGFuZCBoZW5jZSB3ZSB3b3VsZCBsaWtl
IHRvIGF2b2lkIGFzIG11Y2ggY29tcGxleGl0eQorICAgICAgICAgKiBhcyBwb3NzaWJsZSBpbiBv
cmRlciB0byBtYWtlIHN1cmUgdGhlIElQSSBpcyBkZWxpdmVyZWQuCisgICAgICAgICAqLworICAg
ICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ssIHZlY3Rv
cik7CisgICAgICAgIHJldHVybjsKKyAgICB9CiAKICAgICAvKgogICAgICAqIFRoaXMgY2FuIG9u
bHkgYmUgc2FmZWx5IHVzZWQgd2hlbiBubyBDUFUgaG90cGx1ZyBvciB1bnBsdWcgb3BlcmF0aW9u
cwpAQCAtODEsNyArOTYsMTUgQEAgdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAq
bWFzaywgaW50IHZlY3RvcikKICAgICAgICAgIGxvY2FsX2lycV9pc19lbmFibGVkKCkgJiYgKGNw
dXNfbG9ja2VkID0gZ2V0X2NwdV9tYXBzKCkpICYmCiAgICAgICAgICAocGFya19vZmZsaW5lX2Nw
dXMgfHwKICAgICAgICAgICBjcHVtYXNrX2VxdWFsKCZjcHVfb25saW5lX21hcCwgJmNwdV9wcmVz
ZW50X21hcCkpICkKKyAgICB7CisgICAgICAgIC8qCisgICAgICAgICAqIHNlbmRfSVBJX21hc2sg
Y2FuIGJlIGNhbGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0LCBhbmQgaGVuY2Ugd2UKKyAgICAg
ICAgICogbmVlZCB0byBkaXNhYmxlIGludGVycnVwdHMgaW4gb3JkZXIgdG8gcHJvdGVjdCB0aGUg
cGVyLWNwdQorICAgICAgICAgKiBzZW5kX2lwaV9jcHVtYXNrIHdoaWxlIGJlaW5nIHVzZWQuCisg
ICAgICAgICAqLworICAgICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7CiAgICAgICAgIGNwdW1h
c2tfb3Ioc2NyYXRjaCwgbWFzaywgY3B1bWFza19vZihzbXBfcHJvY2Vzc29yX2lkKCkpKTsKKyAg
ICB9CiAgICAgZWxzZQogICAgIHsKICAgICAgICAgaWYgKCBjcHVzX2xvY2tlZCApCkBAIC04OSw2
ICsxMTIsNyBAQCB2b2lkIHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQg
dmVjdG9yKQogICAgICAgICAgICAgcHV0X2NwdV9tYXBzKCk7CiAgICAgICAgICAgICBjcHVzX2xv
Y2tlZCA9IGZhbHNlOwogICAgICAgICB9CisgICAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsK
ICAgICAgICAgY3B1bWFza19jbGVhcihzY3JhdGNoKTsKICAgICB9CiAKQEAgLTk3LDYgKzEyMSw3
IEBAIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3Ip
CiAgICAgZWxzZQogICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21h
c2ssIG1hc2ssIHZlY3Rvcik7CiAKKyAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7CiAgICAg
aWYgKCBjcHVzX2xvY2tlZCApCiAgICAgICAgIHB1dF9jcHVfbWFwcygpOwogfQpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXgg
ZTgzZTQ1NjRhNC4uODJlODkyMDFiMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3Qu
YworKysgYi94ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC01Nyw2ICs1Nyw5IEBAIERFRklORV9Q
RVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9jb3JlX21hc2spOwogREVGSU5F
X1BFUl9DUFVfUkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgc2NyYXRjaF9jcHVtYXNrKTsKIHN0
YXRpYyBjcHVtYXNrX3Qgc2NyYXRjaF9jcHUwbWFzazsKIAorREVGSU5FX1BFUl9DUFVfUkVBRF9N
T1NUTFkoY3B1bWFza192YXJfdCwgc2VuZF9pcGlfY3B1bWFzayk7CitzdGF0aWMgY3B1bWFza190
IHNlbmRfaXBpX2NwdTBtYXNrOworCiBjcHVtYXNrX3QgY3B1X29ubGluZV9tYXAgX19yZWFkX21v
c3RseTsKIEVYUE9SVF9TWU1CT0woY3B1X29ubGluZV9tYXApOwogCkBAIC05MzAsNiArOTMzLDgg
QEAgc3RhdGljIHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1LCBib29sIHJl
bW92ZSkKICAgICAgICAgRlJFRV9DUFVNQVNLX1ZBUihwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNw
dSkpOwogICAgICAgICBpZiAoIHBlcl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpICE9ICZzY3Jh
dGNoX2NwdTBtYXNrICkKICAgICAgICAgICAgIEZSRUVfQ1BVTUFTS19WQVIocGVyX2NwdShzY3Jh
dGNoX2NwdW1hc2ssIGNwdSkpOworICAgICAgICBpZiAoIHBlcl9jcHUoc2VuZF9pcGlfY3B1bWFz
aywgY3B1KSAhPSAmc2VuZF9pcGlfY3B1MG1hc2sgKQorICAgICAgICAgICAgRlJFRV9DUFVNQVNL
X1ZBUihwZXJfY3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpOwogICAgIH0KIAogICAgIGNsZWFu
dXBfY3B1X3Jvb3RfcGd0KGNwdSk7CkBAIC0xMDM0LDcgKzEwMzksOCBAQCBzdGF0aWMgaW50IGNw
dV9zbXBib290X2FsbG9jKHVuc2lnbmVkIGludCBjcHUpCiAKICAgICBpZiAoICEoY29uZF96YWxs
b2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgJiYKICAgICAg
ICAgICAgY29uZF96YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1
KSkgJiYKLSAgICAgICAgICAgY29uZF9hbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShzY3JhdGNo
X2NwdW1hc2ssIGNwdSkpKSApCisgICAgICAgICAgIGNvbmRfYWxsb2NfY3B1bWFza192YXIoJnBl
cl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpKSAmJgorICAgICAgICAgICBjb25kX2FsbG9jX2Nw
dW1hc2tfdmFyKCZwZXJfY3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpKSApCiAgICAgICAgIGdv
dG8gb3V0OwogCiAgICAgcmMgPSAwOwpAQCAtMTE3NSw2ICsxMTgxLDcgQEAgdm9pZCBfX2luaXQg
c21wX3ByZXBhcmVfYm9vdF9jcHUodm9pZCkKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1
X3ByZXNlbnRfbWFwKTsKICNpZiBOUl9DUFVTID4gMiAqIEJJVFNfUEVSX0xPTkcKICAgICBwZXJf
Y3B1KHNjcmF0Y2hfY3B1bWFzaywgY3B1KSA9ICZzY3JhdGNoX2NwdTBtYXNrOworICAgIHBlcl9j
cHUoc2VuZF9pcGlfY3B1bWFzaywgY3B1KSA9ICZzZW5kX2lwaV9jcHUwbWFzazsKICNlbmRpZgog
CiAgICAgZ2V0X2NwdV9pbmZvKCktPnVzZV9wdl9jcjMgPSBmYWxzZTsKLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
