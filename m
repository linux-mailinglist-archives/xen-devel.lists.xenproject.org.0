Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57853151F8D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 18:37:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iz26h-0005Yp-BJ; Tue, 04 Feb 2020 17:35:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iz26g-0005YW-Al
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 17:35:26 +0000
X-Inumbo-ID: b9b0ce56-4774-11ea-8fd3-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9b0ce56-4774-11ea-8fd3-12813bfff9fa;
 Tue, 04 Feb 2020 17:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580837726;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6RLGYGH/PB0tdHb5G977ezYQckYuAdBhpi5kJAjMXUE=;
 b=OCd4gFA9PW9ofsZsW1zOLSKH0j1BqDtC5AjdbvEzOXaUvsLuRjUJfdaA
 iLYOMFor11WmaKd0oiU8IBrwhqHF0dI8ZeuSwMaSKZdxH/XY2mYjVxfxI
 3dGfcFRyuZYu/53sj7z8OcKPcZmwzQ/xFoau0nLrhTQHMSBOL4O+tj5Ya E=;
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
IronPort-SDR: dS6Vj+7q+ncd7N2PkpBeRTt+h1ZbWV8tRxqWhCOByTgpgv97p+mjWRQMGcn5/euDjQGvFwiMXQ
 DyEpNN7rWhJlWv6yRE4mL0e4pQ5dzmJtX45X1H+eowrUAi6FJL6KucnIXUeqn7MkOg3pnOeblC
 CNylo4o5TDbfQnY5gGNwU3b6UjkP9l3ibEBdqb9warRQc0h6Y2BOB/WjkiGXkY5fe1jIRA0sTc
 Bx4nrdPBIyOop6ySPaqAycf/PTELISUgRooPm/mFpbw3ss5jco9tSvyf/glXj9IcHPYRVw3qF0
 81s=
X-SBRS: 2.7
X-MesageID: 12106523
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,402,1574139600"; d="scan'208";a="12106523"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 4 Feb 2020 18:34:55 +0100
Message-ID: <20200204173455.22020-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200204173455.22020-1-roger.pau@citrix.com>
References: <20200204173455.22020-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/3] nvmx: always trap accesses to x2APIC MSRs
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
LS0tCkNoYW5nZXMgc2luY2UgdjM6CiAtIFVzZSBiaXRtYXBfc2V0LgoKQ2hhbmdlcyBzaW5jZSB2
MToKIC0gTmV3IGluIHRoaXMgdmVyc2lvbiAoc3BsaXQgZnJvbSAjMSBwYXRjaCkuCiAtIFVzZSBu
b24tbG9ja2VkIHNldF9iaXQuCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgNyAr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCmlu
ZGV4IDQ2YzUxYTk1YjkuLjU2ZTBkODg0YjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0v
dm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14LmMKQEAgLTU5Niw2ICs1
OTYsMTMgQEAgc3RhdGljIHZvaWQgdXBkYXRlX21zcmJpdG1hcChzdHJ1Y3QgdmNwdSAqdiwgdWlu
dDMyX3Qgc2hhZG93X2N0cmwpCiAgICAgICAgICAgICAgIHYtPmFyY2guaHZtLnZteC5tc3JfYml0
bWFwLT53cml0ZV9oaWdoLAogICAgICAgICAgICAgICBzaXplb2YobXNyX2JpdG1hcC0+d3JpdGVf
aGlnaCkgKiA4KTsKIAorICAgIC8qCisgICAgICogTmVzdGVkIFZNWCBkb2Vzbid0IHN1cHBvcnQg
YW55IHgyQVBJQyBoYXJkd2FyZSB2aXJ0dWFsaXphdGlvbiwgc28KKyAgICAgKiBtYWtlIHN1cmUg
YWxsIHRoZSB4MkFQSUMgTVNScyBhcmUgdHJhcHBlZC4KKyAgICAgKi8KKyAgICBiaXRtYXBfc2V0
KG1zcl9iaXRtYXAtPnJlYWRfbG93LCBNU1JfWDJBUElDX0ZJUlNULCAweGZmKTsKKyAgICBiaXRt
YXBfc2V0KG1zcl9iaXRtYXAtPndyaXRlX2xvdywgTVNSX1gyQVBJQ19GSVJTVCwgMHhmZik7CisK
ICAgICB1bm1hcF9kb21haW5fcGFnZShtc3JfYml0bWFwKTsKIAogICAgIF9fdm13cml0ZShNU1Jf
QklUTUFQLCBwYWdlX3RvX21hZGRyKG52bXgtPm1zcl9tZXJnZWQpKTsKLS0gCjIuMjUuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
