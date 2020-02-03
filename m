Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17C5150EC9
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 18:40:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyffX-0007Se-DX; Mon, 03 Feb 2020 17:37:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyffW-0007SK-8A
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 17:37:54 +0000
X-Inumbo-ID: e7467682-46ab-11ea-8e7c-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7467682-46ab-11ea-8e7c-12813bfff9fa;
 Mon, 03 Feb 2020 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580751473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OqfmrT1+SOmdNfWCuLumoSoTJGFTwZPLnOQx0BuYkBQ=;
 b=H3O4Qmf/nR4iZYS/rUlMZyKj+O4nxkLIpnQxZlLzGvd09T6QiQs9/4SE
 CHtzEgb+5wsgN6GVz1m81D/OmYb8f+qO+Ck6wWQd1dddjzOx6gIYF/9t3
 6wTYzIINaZuO2T1i0x24hIrj1jgtnYfl0JoKssmGwspRjJgrsFzCRIBV6 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KWXFiGCuGdZxbr3kANVpz4QVt1xVV6ZRpG++9CFC+93pLOg6O3+inC8CJAv7TZKszQv4uxYNxf
 qKxVQ63zRzq9uRBFKsf/c1dYNMtfUJZghL+g1i4XfWQF4BboIvwE+u5+XYr9oDQbBhZvHqaQfH
 1PlpFgBvcdoQsrFURuXi8ICiAAQAtcqjQN0d4JppNrK2v9YRYPp8sZUxGHkcr4O8jhsZYWZtPs
 fBuoywbOcEBdwhrZnI/99el/4+zcDeq515iPajVl6vR9+5ZwKRJW+VtmIdapdv7bp6TynK6TqA
 RAE=
X-SBRS: 2.7
X-MesageID: 12036630
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,398,1574139600"; d="scan'208";a="12036630"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 18:37:28 +0100
Message-ID: <20200203173728.18135-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203173728.18135-1-roger.pau@citrix.com>
References: <20200203173728.18135-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/2] nvmx: always trap accesses to x2APIC MSRs
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
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TmVzdGVkIFZNWCBkb2Vzbid0IGV4cG9zZSBzdXBwb3J0IGZvcgpTRUNPTkRBUllfRVhFQ19WSVJU
VUFMSVpFX1gyQVBJQ19NT0RFLApTRUNPTkRBUllfRVhFQ19WSVJUVUFMX0lOVFJfREVMSVZFUlkg
b3IKU0VDT05EQVJZX0VYRUNfQVBJQ19SRUdJU1RFUl9WSVJULCBhbmQgaGVuY2UgdGhlIHgyQVBJ
QyBNU1JzIHNob3VsZAphbHdheXMgYmUgdHJhcHBlZCBpbiB0aGUgbmVzdGVkIGd1ZXN0IE1TUiBi
aXRtYXAsIG9yIGVsc2UgYSBuZXN0ZWQKZ3Vlc3QgY291bGQgYWNjZXNzIHRoZSBoYXJkd2FyZSB4
MkFQSUMgTVNScyBnaXZlbiBjZXJ0YWluIGNvbmRpdGlvbnMuCgpBY2Nlc3NpbmcgdGhlIGhhcmR3
YXJlIE1TUnMgY291bGQgYmUgYWNoaWV2ZWQgYnkgZm9yY2luZyB0aGUgTDAgWGVuIHRvCnVzZSBT
RUNPTkRBUllfRVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGFuZApTRUNPTkRBUllfRVhFQ19W
SVJUVUFMX0lOVFJfREVMSVZFUlkgb3IKU0VDT05EQVJZX0VYRUNfQVBJQ19SRUdJU1RFUl9WSVJU
IChpZiBzdXBwb3J0ZWQpLCBhbmQgdGhlbiBjcmVhdGluZyBhCkwyIGd1ZXN0IHdpdGggYSBNU1Ig
Yml0bWFwIHRoYXQgZG9lc24ndCB0cmFwIGFjY2Vzc2VzIHRvIHRoZSB4MkFQSUMKTVNSIHJhbmdl
LiBUaGVuIE9SJ2luZyBib3RoIEwwIGFuZCBMMSBNU1IgYml0bWFwcyB3b3VsZCByZXN1bHQgaW4g
YQpiaXRtYXAgdGhhdCBkb2Vzbid0IHRyYXAgY2VydGFpbiB4MkFQSUMgTVNScyBhbmQgYSBWTUNT
IHRoYXQgZG9lc24ndApoYXZlIFNFQ09OREFSWV9FWEVDX1ZJUlRVQUxJWkVfWDJBUElDX01PREUg
YW5kClNFQ09OREFSWV9FWEVDX1ZJUlRVQUxfSU5UUl9ERUxJVkVSWSBvcgpTRUNPTkRBUllfRVhF
Q19BUElDX1JFR0lTVEVSX1ZJUlQgc2V0IGVpdGhlci4KCkZpeCB0aGlzIGJ5IG1ha2luZyBzdXJl
IHgyQVBJQyBNU1JzIGFyZSBhbHdheXMgdHJhcHBlZCBpbiB0aGUgbmVzdGVkCk1TUiBiaXRtYXAu
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
UmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KQ2hhbmdl
cyBzaW5jZSB2MToKIC0gTmV3IGluIHRoaXMgdmVyc2lvbiAoc3BsaXQgZnJvbSAjMSBwYXRjaCku
CiAtIFVzZSBub24tbG9ja2VkIHNldF9iaXQuCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZt
eC5jIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCmluZGV4IGYxMThmODg2ODMuLjg5YmEyYTgwZDUgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMKQEAgLTU2Nyw2ICs1NjcsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfbXNyYml0bWFwKHN0cnVj
dCB2Y3B1ICp2LCB1aW50MzJfdCBzaGFkb3dfY3RybCkKIHsKICAgICBzdHJ1Y3QgbmVzdGVkdm14
ICpudm14ID0gJnZjcHVfMl9udm14KHYpOwogICAgIHN0cnVjdCB2bXhfbXNyX2JpdG1hcCAqbXNy
X2JpdG1hcDsKKyAgICB1bnNpZ25lZCBpbnQgbXNyOwogCiAgICAgaWYgKCAhKHNoYWRvd19jdHJs
ICYgQ1BVX0JBU0VEX0FDVElWQVRFX01TUl9CSVRNQVApIHx8CiAgICAgICAgICAhbnZteC0+bXNy
Yml0bWFwICkKQEAgLTU4Nyw2ICs1ODgsMTYgQEAgc3RhdGljIHZvaWQgdXBkYXRlX21zcmJpdG1h
cChzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3Qgc2hhZG93X2N0cmwpCiAgICAgICAgICAgICAgIHYt
PmFyY2guaHZtLnZteC5tc3JfYml0bWFwLT53cml0ZV9oaWdoLAogICAgICAgICAgICAgICBzaXpl
b2YobXNyX2JpdG1hcC0+d3JpdGVfaGlnaCkgKiA4KTsKIAorICAgIC8qCisgICAgICogTmVzdGVk
IFZNWCBkb2Vzbid0IHN1cHBvcnQgYW55IHgyQVBJQyBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiwg
c28KKyAgICAgKiBtYWtlIHN1cmUgYWxsIHRoZSB4MkFQSUMgTVNScyBhcmUgdHJhcHBlZC4KKyAg
ICAgKi8KKyAgICBmb3IgKCBtc3IgPSBNU1JfWDJBUElDX0ZJUlNUOyBtc3IgPD0gTVNSX1gyQVBJ
Q19GSVJTVCArIDB4ZmY7IG1zcisrICkKKyAgICB7CisgICAgICAgIF9fc2V0X2JpdChtc3IsIG1z
cl9iaXRtYXAtPnJlYWRfbG93KTsKKyAgICAgICAgX19zZXRfYml0KG1zciwgbXNyX2JpdG1hcC0+
d3JpdGVfbG93KTsKKyAgICB9CisKICAgICB1bm1hcF9kb21haW5fcGFnZShtc3JfYml0bWFwKTsK
IAogICAgIF9fdm13cml0ZShNU1JfQklUTUFQLCBwYWdlX3RvX21hZGRyKG52bXgtPm1zcl9tZXJn
ZWQpKTsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
