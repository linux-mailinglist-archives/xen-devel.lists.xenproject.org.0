Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17848161158
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 12:47:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3eqo-0001B0-2r; Mon, 17 Feb 2020 11:46:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3eqm-0001AO-Rz
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 11:46:08 +0000
X-Inumbo-ID: 1597f770-517b-11ea-bfd4-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1597f770-517b-11ea-bfd4-12813bfff9fa;
 Mon, 17 Feb 2020 11:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581939967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HbNgsxjhDJg2cfAsjg7YJ/c5HCpT5XfT108NmWLAzFM=;
 b=Pvgam7c7H8QJniDi4QglrUFTJS9Lyutg3TA+U9xD3pn3tkSu1FW4xSja
 /kI25qMuLdk8g5TjTebJselO3Jlj3PVgE3Nww0VYj/BF6ZR2ihyWz+WuF
 +kTEAw3E24V4XmQk/wOeRppxDBURzPEFOgsRZTnrXuuIM5pjTvBTqFIgU 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: VyL+57nxCzdZtRsvM7sIJRH/G259MVs9ZHsKjeT9cx4US2lxCsaUuZBxqIevapgFeJ5+VXBPOZ
 7F0YuA0g161zLbZXrtggsa/o7WtejIkANXWjXw1OzgsjX5qNRh+Ye5NYBCnQ/CiDw0mqXcpHx5
 WAx8TSiy4tlZHYP2DmicmNBiH1elJ9Jh/2h2k8YJ9436p/Zkb1S+6cbX545aPCPmhG/cpE4vag
 Pxh4vI3cRy6CXn3bOqvv018N4H7k4dfEn7JrZhRyBPH1wYf/Nt5SjudYv8p3iLHBQGjgrC333B
 lXE=
X-SBRS: 2.7
X-MesageID: 12992157
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,452,1574139600"; d="scan'208";a="12992157"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 12:45:45 +0100
Message-ID: <20200217114545.71112-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217114545.71112-1-roger.pau@citrix.com>
References: <20200217114545.71112-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 4/4] nvmx: always trap accesses to x2APIC MSRs
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
UmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgotLS0KQ2hhbmdl
cyBzaW5jZSB2NDoKIC0gRml4IHNpemUgb2YgeDJBUElDIHJlZ2lvbiB0byB1c2UgMHgxMDAuCgpD
aGFuZ2VzIHNpbmNlIHYzOgogLSBVc2UgYml0bWFwX3NldC4KCkNoYW5nZXMgc2luY2UgdjE6CiAt
IE5ldyBpbiB0aGlzIHZlcnNpb24gKHNwbGl0IGZyb20gIzEgcGF0Y2gpLgogLSBVc2Ugbm9uLWxv
Y2tlZCBzZXRfYml0LgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYyB8IDcgKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9odm0vdm14L3Z2bXguYyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYwppbmRleCAz
MzM3MjYwZDRiLi45MjZhMTFjMTVmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92
dm14LmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jCkBAIC01OTYsNiArNTk2LDEz
IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9tc3JiaXRtYXAoc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90
IHNoYWRvd19jdHJsKQogICAgICAgICAgICAgICB2LT5hcmNoLmh2bS52bXgubXNyX2JpdG1hcC0+
d3JpdGVfaGlnaCwKICAgICAgICAgICAgICAgc2l6ZW9mKG1zcl9iaXRtYXAtPndyaXRlX2hpZ2gp
ICogOCk7CiAKKyAgICAvKgorICAgICAqIE5lc3RlZCBWTVggZG9lc24ndCBzdXBwb3J0IGFueSB4
MkFQSUMgaGFyZHdhcmUgdmlydHVhbGl6YXRpb24sIHNvCisgICAgICogbWFrZSBzdXJlIGFsbCB0
aGUgeDJBUElDIE1TUnMgYXJlIHRyYXBwZWQuCisgICAgICovCisgICAgYml0bWFwX3NldChtc3Jf
Yml0bWFwLT5yZWFkX2xvdywgTVNSX1gyQVBJQ19GSVJTVCwgMHgxMDApOworICAgIGJpdG1hcF9z
ZXQobXNyX2JpdG1hcC0+d3JpdGVfbG93LCBNU1JfWDJBUElDX0ZJUlNULCAweDEwMCk7CisKICAg
ICB1bm1hcF9kb21haW5fcGFnZShtc3JfYml0bWFwKTsKIAogICAgIF9fdm13cml0ZShNU1JfQklU
TUFQLCBwYWdlX3RvX21hZGRyKG52bXgtPm1zcl9tZXJnZWQpKTsKLS0gCjIuMjUuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
