Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551CA16115B
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:48:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3eqh-00017H-9E; Mon, 17 Feb 2020 11:46:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3eqf-00016t-Qt
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:46:01 +0000
X-Inumbo-ID: 1123c516-517b-11ea-bfd4-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1123c516-517b-11ea-bfd4-12813bfff9fa;
 Mon, 17 Feb 2020 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581939960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X73LQAyRxZc1sHJILFMGjRAH5RI6XM28Twoui29I0zQ=;
 b=eCTvsuqU1BzIBALl9rqVC1BnkO5sDuTa3BwjBi0n+TlYSTdJzpMNr8kR
 +FIjWgQ793YvxJ69s6BE7NdeTvsId5Pl8ADiixVqPcjgL/0y8UUthX4xu
 t7/Sw3iMFybxQu0BK0fHqa2nOS1dAsIIeu2hTrZnnfpxpwm0+X6Qio3e1 o=;
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
IronPort-SDR: uv9xflxfGaa8qqThrGK9WelHyKN/6fo4szsEothdApg5ySi7wOL0BUDX9g/my9fSJP6M3NWRSB
 pAqf8xp0PLfHkXpjArcm4ZMS1NC7u7eNulMBtAQ2wqhgsHmO/yIc5v72WsFsdQmcrUGsITZ8OH
 IvKoZa+JdVJ+V0H7t28TCZhSXEDKAzJmL8PPuvvVbgnkEEUpqm4QhbjNHsavqnZ2mSSf/aALlg
 SkfT4qWXE0cUyORvfh9LT9m6T2d+u+j75wMFwV5LH1TKfnSaPy78/Q1RNPKgXkmgOzl1PkVMnS
 FeQ=
X-SBRS: 2.7
X-MesageID: 13182661
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="13182661"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 12:45:42 +0100
Message-ID: <20200217114545.71112-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217114545.71112-1-roger.pau@citrix.com>
References: <20200217114545.71112-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 1/4] nvmx: implement support for MSR bitmaps
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiBuZXN0ZWQgVk1YIGhhcyBhIGhhbGYgYmFrZWQgaGFu
ZGxpbmcgb2YgTVNSCmJpdG1hcHMgZm9yIHRoZSBMMSBWTU06IGl0IG1hcHMgdGhlIEwxIFZNTSBw
cm92aWRlZCBNU1IgYml0bWFwLCBidXQKZG9lc24ndCBhY3R1YWxseSBsb2FkIGl0IGludG8gdGhl
IG5lc3RlZCB2bWNzLCBhbmQgdGh1cyB0aGUgbmVzdGVkCmd1ZXN0IHZtY3MgZW5kcyB1cCB1c2lu
ZyB0aGUgc2FtZSBNU1IgYml0bWFwIGFzIHRoZSBMMSBWTU0uCgpUaGlzIGlzIHdyb25nIGFzIHRo
ZXJlJ3Mgbm8gYXNzdXJhbmNlIHRoYXQgdGhlIHNldCBvZiBmZWF0dXJlcyBlbmFibGVkCmZvciB0
aGUgTDEgdm1jcyBhcmUgdGhlIHNhbWUgdGhhdCBMMSBpdHNlbGYgaXMgZ29pbmcgdG8gdXNlIGlu
IHRoZQpuZXN0ZWQgdm1jcywgYW5kIHRodXMgY2FuIGxlYWQgdG8gbWlzY29uZmlndXJhdGlvbnMu
CgpGb3IgZXhhbXBsZSBMMSB2bWNzIGNhbiB1c2UgeDJBUElDIHZpcnR1YWxpemF0aW9uIGFuZCB2
aXJ0dWFsCmludGVycnVwdCBkZWxpdmVyeSwgYW5kIHRodXMgc29tZSB4MkFQSUMgTVNScyB3b24n
dCBiZSB0cmFwcGVkIHNvIHRoYXQKdGhleSBjYW4gYmUgaGFuZGxlZCBkaXJlY3RseSBieSB0aGUg
aGFyZHdhcmUgdXNpbmcgdmlydHVhbGl6YXRpb24KZXh0ZW5zaW9ucy4gT24gdGhlIG90aGVyIGhh
bmQsIHRoZSBuZXN0ZWQgdm1jcyBjcmVhdGVkIGJ5IEwxIFZNTSBtaWdodApub3QgdXNlIGFueSBv
ZiBzdWNoIGZlYXR1cmVzLCBzbyB1c2luZyBhIE1TUiBiaXRtYXAgdGhhdCBkb2Vzbid0IHRyYXAK
YWNjZXNzZXMgdG8gdGhlIHgyQVBJQyBNU1JzIHdpbGwgYmUgbGVha2luZyB0aGVtIHRvIHRoZSB1
bmRlcmx5aW5nCmhhcmR3YXJlLgoKRml4IHRoaXMgYnkgY3JhZnRpbmcgYSBtZXJnZWQgTVNSIGJp
dG1hcCBiZXR3ZWVuIHRoZSBvbmUgdXNlZCBieSBMMQphbmQgdGhlIG5lc3RlZCBndWVzdC4KClNp
Z25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0K
Q2hhbmdlcyBzaW5jZSB2NDoKIC0gQWRkIHN0YXRpYyB0byB2Y3B1X3JlbGlucXVpc2hfcmVzb3Vy
Y2VzLgoKQ2hhbmdlcyBzaW5jZSB2MzoKIC0gRnJlZSB0aGUgbWVyZ2VkIE1TUiBiaXRtYXAgcGFn
ZSBpbiBudm14X3B1cmdlX3Z2bWNzLgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gUGFzcyBzaGFkb3df
Y3RybCBpbnRvIHVwZGF0ZV9tc3JiaXRtYXAsIGFuZCBjaGVjayB0aGVyZSBpZgogICBDUFVfQkFT
RURfQUNUSVZBVEVfTVNSX0JJVE1BUCBpcyBzZXQuCiAtIERvIG5vdCBlbmFibGUgTVNSIGJpdG1h
cCB1bmxlc3MgaXQncyBlbmFibGVkIGluIGJvdGggTDEgYW5kIEwyLgogLSBSZW5hbWUgTDEgZ3Vl
c3QgdG8gTDIgaW4gbmVzdGVkdm14IHN0cnVjdCBjb21tZW50LgoKQ2hhbmdlcyBzaW5jZSB2MToK
IC0gU3BsaXQgdGhlIHgyQVBJQyBNU1IgZml4IGludG8gYSBzZXBhcmF0ZSBwYXRjaC4KIC0gTW92
ZSBzZXR0aW5nIE1TUl9CSVRNQVAgdm1jcyBmaWVsZCBpbnRvIGxvYWRfdnZtY3NfaG9zdF9zdGF0
ZSBmb3IKICAgdmlydHVhbCB2bWV4aXQuCiAtIEFsbG9jYXRlIG1lbW9yeSB3aXRoIE1FTUZfbm9f
b3duZXIuCiAtIFVzZSB0YWJzIHRvIGFsaWduIGNvbW1lbnQgb2YgdGhlIG5lc3RlZHZteCBzdHJ1
Y3QgZmllbGQuCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jICAgICAgICB8IDczICsr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdm14
L3Z2bXguaCB8ICAzICstCiAyIGZpbGVzIGNoYW5nZWQsIDcxIGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jCmluZGV4IDQ3ZWVlMWU1YjkuLjMzMzcyNjBkNGIgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYv
aHZtL3ZteC92dm14LmMKQEAgLTEyOCw2ICsxMjgsMTYgQEAgaW50IG52bXhfdmNwdV9pbml0aWFs
aXNlKHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICB1bm1hcF9kb21haW5fcGFnZSh2dyk7CiAgICAg
fQogCisgICAgaWYgKCBjcHVfaGFzX3ZteF9tc3JfYml0bWFwICkKKyAgICB7CisgICAgICAgIG52
bXgtPm1zcl9tZXJnZWQgPSBhbGxvY19kb21oZWFwX3BhZ2UoZCwgTUVNRl9ub19vd25lcik7Cisg
ICAgICAgIGlmICggIW52bXgtPm1zcl9tZXJnZWQgKQorICAgICAgICB7CisgICAgICAgICAgICBn
ZHByaW50ayhYRU5MT0dfRVJSLCAibmVzdDogYWxsb2NhdGlvbiBmb3IgTVNSIGJpdG1hcCBmYWls
ZWRcbiIpOworICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07CisgICAgICAgIH0KKyAgICB9CisK
ICAgICBudm14LT5lcHQuZW5hYmxlZCA9IDA7CiAgICAgbnZteC0+Z3Vlc3RfdnBpZCA9IDA7CiAg
ICAgbnZteC0+dm14b25fcmVnaW9uX3BhID0gSU5WQUxJRF9QQUREUjsKQEAgLTE4MywxMyArMTkz
LDI3IEBAIHZvaWQgbnZteF92Y3B1X2Rlc3Ryb3koc3RydWN0IHZjcHUgKnYpCiAgICAgICAgIHYt
PmFyY2guaHZtLnZteC52bXdyaXRlX2JpdG1hcCA9IE5VTEw7CiAgICAgfQogfQotIAorCitzdGF0
aWMgdm9pZCB2Y3B1X3JlbGlucXVpc2hfcmVzb3VyY2VzKHN0cnVjdCB2Y3B1ICp2KQoreworICAg
IHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252bXgodik7CisKKyAgICBpZiAoIG52
bXgtPm1zcl9tZXJnZWQgKQorICAgIHsKKyAgICAgICAgZnJlZV9kb21oZWFwX3BhZ2UobnZteC0+
bXNyX21lcmdlZCk7CisgICAgICAgIG52bXgtPm1zcl9tZXJnZWQgPSBOVUxMOworICAgIH0KK30K
Kwogdm9pZCBudm14X2RvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcyhzdHJ1Y3QgZG9tYWluICpk
KQogewogICAgIHN0cnVjdCB2Y3B1ICp2OwogCiAgICAgZm9yX2VhY2hfdmNwdSAoIGQsIHYgKQor
ICAgIHsKICAgICAgICAgbnZteF9wdXJnZV92dm1jcyh2KTsKKyAgICAgICAgdmNwdV9yZWxpbnF1
aXNoX3Jlc291cmNlcyh2KTsKKyAgICB9CiB9CiAKIGludCBudm14X3ZjcHVfcmVzZXQoc3RydWN0
IHZjcHUgKnYpCkBAIC01NDgsNiArNTcyLDM1IEBAIHVuc2lnbmVkIGxvbmcgKl9zaGFkb3dfaW9f
Yml0bWFwKHN0cnVjdCB2Y3B1ICp2KQogICAgIHJldHVybiBuZXN0ZWRodm1fdmNwdV9pb21hcF9n
ZXQocG9ydDgwLCBwb3J0RUQpOwogfQogCitzdGF0aWMgdm9pZCB1cGRhdGVfbXNyYml0bWFwKHN0
cnVjdCB2Y3B1ICp2LCB1aW50MzJfdCBzaGFkb3dfY3RybCkKK3sKKyAgICBzdHJ1Y3QgbmVzdGVk
dm14ICpudm14ID0gJnZjcHVfMl9udm14KHYpOworICAgIHN0cnVjdCB2bXhfbXNyX2JpdG1hcCAq
bXNyX2JpdG1hcDsKKworICAgIGlmICggIShzaGFkb3dfY3RybCAmIENQVV9CQVNFRF9BQ1RJVkFU
RV9NU1JfQklUTUFQKSB8fAorICAgICAgICAgIW52bXgtPm1zcmJpdG1hcCApCisgICAgICAgcmV0
dXJuOworCisgICAgbXNyX2JpdG1hcCA9IF9fbWFwX2RvbWFpbl9wYWdlKG52bXgtPm1zcl9tZXJn
ZWQpOworCisgICAgYml0bWFwX29yKG1zcl9iaXRtYXAtPnJlYWRfbG93LCBudm14LT5tc3JiaXRt
YXAtPnJlYWRfbG93LAorICAgICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubXNyX2JpdG1hcC0+
cmVhZF9sb3csCisgICAgICAgICAgICAgIHNpemVvZihtc3JfYml0bWFwLT5yZWFkX2xvdykgKiA4
KTsKKyAgICBiaXRtYXBfb3IobXNyX2JpdG1hcC0+cmVhZF9oaWdoLCBudm14LT5tc3JiaXRtYXAt
PnJlYWRfaGlnaCwKKyAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lm1zcl9iaXRtYXAtPnJl
YWRfaGlnaCwKKyAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRtYXAtPnJlYWRfaGlnaCkgKiA4
KTsKKyAgICBiaXRtYXBfb3IobXNyX2JpdG1hcC0+d3JpdGVfbG93LCBudm14LT5tc3JiaXRtYXAt
PndyaXRlX2xvdywKKyAgICAgICAgICAgICAgdi0+YXJjaC5odm0udm14Lm1zcl9iaXRtYXAtPndy
aXRlX2xvdywKKyAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRtYXAtPndyaXRlX2xvdykgKiA4
KTsKKyAgICBiaXRtYXBfb3IobXNyX2JpdG1hcC0+d3JpdGVfaGlnaCwgbnZteC0+bXNyYml0bWFw
LT53cml0ZV9oaWdoLAorICAgICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubXNyX2JpdG1hcC0+
d3JpdGVfaGlnaCwKKyAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRtYXAtPndyaXRlX2hpZ2gp
ICogOCk7CisKKyAgICB1bm1hcF9kb21haW5fcGFnZShtc3JfYml0bWFwKTsKKworICAgIF9fdm13
cml0ZShNU1JfQklUTUFQLCBwYWdlX3RvX21hZGRyKG52bXgtPm1zcl9tZXJnZWQpKTsKK30KKwog
dm9pZCBudm14X3VwZGF0ZV9leGVjX2NvbnRyb2woc3RydWN0IHZjcHUgKnYsIHUzMiBob3N0X2Nu
dHJsKQogewogICAgIHUzMiBwaW9fY250cmwgPSAoQ1BVX0JBU0VEX0FDVElWQVRFX0lPX0JJVE1B
UApAQCAtNTU4LDEwICs2MTEsMTcgQEAgdm9pZCBudm14X3VwZGF0ZV9leGVjX2NvbnRyb2woc3Ry
dWN0IHZjcHUgKnYsIHUzMiBob3N0X2NudHJsKQogICAgIHNoYWRvd19jbnRybCA9IF9fbjJfZXhl
Y19jb250cm9sKHYpOwogICAgIHBpb19jbnRybCAmPSBzaGFkb3dfY250cmw7CiAgICAgLyogRW5m
b3JjZSB0aGUgcmVtb3ZlZCBmZWF0dXJlcyAqLwotICAgIHNoYWRvd19jbnRybCAmPSB+KENQVV9C
QVNFRF9BQ1RJVkFURV9NU1JfQklUTUFQCi0gICAgICAgICAgICAgICAgICAgICAgfCBDUFVfQkFT
RURfQUNUSVZBVEVfSU9fQklUTUFQCisgICAgc2hhZG93X2NudHJsICY9IH4oQ1BVX0JBU0VEX0FD
VElWQVRFX0lPX0JJVE1BUAogICAgICAgICAgICAgICAgICAgICAgIHwgQ1BVX0JBU0VEX1VOQ09O
RF9JT19FWElUSU5HKTsKLSAgICBzaGFkb3dfY250cmwgfD0gaG9zdF9jbnRybDsKKyAgICAvKgor
ICAgICAqIERvIE5PVCBlbmZvcmNlIHRoZSBNU1IgYml0bWFwIGN1cnJlbnRseSB1c2VkIGJ5IEwx
LCBhcyBjZXJ0YWluIGhhcmR3YXJlCisgICAgICogdmlydHVhbGl6YXRpb24gZmVhdHVyZXMgcmVx
dWlyZSBzcGVjaWZpYyBNU1IgYml0bWFwIHNldHRpbmdzLCBidXQKKyAgICAgKiB3aXRob3V0IHRo
ZSBndWVzdCBhbHNvIHVzaW5nIHRoZXNlIHNhbWUgZmVhdHVyZXMgdGhlIGJpdG1hcCBjb3VsZCBi
ZQorICAgICAqIGxlYWtpbmcgdGhyb3VnaCB1bndhbnRlZCBNU1IgYWNjZXNzZXMuCisgICAgICov
CisgICAgc2hhZG93X2NudHJsIHw9IGhvc3RfY250cmwgJiB+Q1BVX0JBU0VEX0FDVElWQVRFX01T
Ul9CSVRNQVA7CisgICAgaWYgKCAhKHNoYWRvd19jbnRybCAmIGhvc3RfY250cmwgJiBDUFVfQkFT
RURfQUNUSVZBVEVfTVNSX0JJVE1BUCkgKQorICAgICAgc2hhZG93X2NudHJsICY9IH5DUFVfQkFT
RURfQUNUSVZBVEVfTVNSX0JJVE1BUDsKICAgICBpZiAoIHBpb19jbnRybCA9PSBDUFVfQkFTRURf
VU5DT05EX0lPX0VYSVRJTkcgKSB7CiAgICAgICAgIC8qIEwxIFZNTSBpbnRlcmNlcHRzIGFsbCBJ
L08gaW5zdHJ1Y3Rpb25zICovCiAgICAgICAgIHNoYWRvd19jbnRybCB8PSBDUFVfQkFTRURfVU5D
T05EX0lPX0VYSVRJTkc7CkBAIC01ODQsNiArNjQ0LDggQEAgdm9pZCBudm14X3VwZGF0ZV9leGVj
X2NvbnRyb2woc3RydWN0IHZjcHUgKnYsIHUzMiBob3N0X2NudHJsKQogICAgICAgICBfX3Ztd3Jp
dGUoSU9fQklUTUFQX0IsIHZpcnRfdG9fbWFkZHIoYml0bWFwKSArIFBBR0VfU0laRSk7CiAgICAg
fQogCisgICAgdXBkYXRlX21zcmJpdG1hcCh2LCBzaGFkb3dfY250cmwpOworCiAgICAgLyogVE9E
TzogY2hhbmdlIEwwIGludHIgd2luZG93IHRvIE1URiBvciBOTUkgd2luZG93ICovCiAgICAgX192
bXdyaXRlKENQVV9CQVNFRF9WTV9FWEVDX0NPTlRST0wsIHNoYWRvd19jbnRybCk7CiB9CkBAIC0x
Mjc4LDYgKzEzNDAsOSBAQCBzdGF0aWMgdm9pZCBsb2FkX3Z2bWNzX2hvc3Rfc3RhdGUoc3RydWN0
IHZjcHUgKnYpCiAgICAgaHZtX3NldF90c2Nfb2Zmc2V0KHYsIHYtPmFyY2guaHZtLmNhY2hlX3Rz
Y19vZmZzZXQsIDApOwogCiAgICAgc2V0X3Z2bWNzKHYsIFZNX0VOVFJZX0lOVFJfSU5GTywgMCk7
CisKKyAgICBpZiAoIHYtPmFyY2guaHZtLnZteC5leGVjX2NvbnRyb2wgJiBDUFVfQkFTRURfQUNU
SVZBVEVfTVNSX0JJVE1BUCApCisgICAgICAgIF9fdm13cml0ZShNU1JfQklUTUFQLCB2aXJ0X3Rv
X21hZGRyKHYtPmFyY2guaHZtLnZteC5tc3JfYml0bWFwKSk7CiB9CiAKIHN0YXRpYyB2b2lkIHN5
bmNfZXhjZXB0aW9uX3N0YXRlKHN0cnVjdCB2Y3B1ICp2KQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vdm14L3Z2bXguaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3ZteC92
dm14LmgKaW5kZXggNmI5YzRhZTBiMi4uYzQxZjA4OTkzOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9odm0vdm14L3Z2bXguaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS92
bXgvdnZteC5oCkBAIC0zNyw3ICszNyw4IEBAIHN0cnVjdCBuZXN0ZWR2bXggewogICAgICAqLwog
ICAgIHBhZGRyX3QgICAgdm14b25fcmVnaW9uX3BhOwogICAgIHZvaWQgICAgICAgKmlvYml0bWFw
WzJdOwkJLyogbWFwICh2YSkgb2YgTDEgZ3Vlc3QgSS9PIGJpdG1hcCAqLwotICAgIHZvaWQgICAg
ICAgKm1zcmJpdG1hcDsJCS8qIG1hcCAodmEpIG9mIEwxIGd1ZXN0IE1TUiBiaXRtYXAgKi8KKyAg
ICBzdHJ1Y3Qgdm14X21zcl9iaXRtYXAgKm1zcmJpdG1hcDsJLyogbWFwICh2YSkgb2YgTDEgZ3Vl
c3QgTVNSIGJpdG1hcCAqLworICAgIHN0cnVjdCBwYWdlX2luZm8gKm1zcl9tZXJnZWQ7CS8qIG1l
cmdlZCBMMSBhbmQgTDIgTVNSIGJpdG1hcCAqLwogICAgIC8qIGRlZmVycmVkIG5lc3RlZCBpbnRl
cnJ1cHQgKi8KICAgICBzdHJ1Y3QgewogICAgICAgICB1bnNpZ25lZCBsb25nIGludHJfaW5mbzsK
LS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
