Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D354B141275
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 21:47:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isYS1-0004zk-SK; Fri, 17 Jan 2020 20:42:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=J6zi=3G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1isYS0-0004yu-RD
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 20:42:40 +0000
X-Inumbo-ID: df856c36-3969-11ea-9fd7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df856c36-3969-11ea-9fd7-bc764e2007e4;
 Fri, 17 Jan 2020 20:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579293747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oGgEPL6H4T/atSijyUJAoByln4PcK5zMY4BCVapfIJs=;
 b=V1/Ez/KwOuMQjfqHKITGxeZOSyqeV2jocqzb7DLZoey6pteimqs4GH1j
 o+vSB49fOWvIH54eYZda4nyCCOnKM/51d76q2qb/vbTWelqphj3jkMgRj
 RX0AGs1847mVAJum+zs9kI/BrNDdmaT4eqkrXD21YElsT8xXWuaNFPtr7 I=;
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
IronPort-SDR: o4pF3YPvmxnMRGEVT7JubDEU6+MLx62FBx6XZuynb8yV12ZxZv1knYkJzpeSBDCwWA53WTguli
 EoQ3f8KvRY0fNhkhAejYujQcny8tnvFq//tzbLjOYdU9hiGrQAEw8+pdVxVDBAhdwgnsfT5TQW
 VfDolS1El2ymKZONKBOUcAaVj4vtAwRjmn5mepqEc1rqJ5iJyOmcNNWkjVgjTIgupGzDDUN3s/
 iu9oKnFCoFyr5xqs5CDGky/1b6kg9b0aWuf2LpIGSWZGAi3hWZcWSWBLMQn0rQP+JVv9AzQKLK
 Eig=
X-SBRS: 2.7
X-MesageID: 11526071
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,331,1574139600"; d="scan'208";a="11526071"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 17 Jan 2020 20:42:19 +0000
Message-ID: <20200117204223.30076-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200117204223.30076-1-andrew.cooper3@citrix.com>
References: <20200117204223.30076-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/5] x86/boot: Create the l2_xenmap[]
 mappings dynamically
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

VGhlIGJ1aWxkLXRpbWUgY29uc3RydWN0aW9uIG9mIGwyX3hlbm1hcFtdIGltcG9zZXMgYW4gYXJi
aXRyYXJ5IGxpbWl0IG9mIDE2TQp0b3RhbCwgd2hpY2ggaXMgYSBsaW1pdCBsb29raW5nIHRvIGJl
IGxpZnRlZC4KCk1vdmUgbDJfeGVubWFwW10gaW50byB0aGUgQlNTLCBhbmQgYWRqdXN0IGJvdGgg
dGhlIEJJT1MgYW5kIEVGSSBwYXRocyB0byBmaWxsCml0IGluIGR5bmFtaWNhbGx5LCBiYXNlZCBv
biB0aGUgZmluYWwgbGlua2VkIHNpemUgb2YgWGVuLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cgp2MjoKICogUmV3cml0ZSBzZXZlcmFsIGNvbW1l
bnRzCi0tLQogeGVuL2FyY2gveDg2L2Jvb3QvaGVhZC5TICAgIHwgMTQgKysrKysrKysrKysrKysK
IHhlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TICB8IDIzICsrKysrKysrLS0tLS0tLS0tLS0tLS0t
CiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggfCAxNCArKysrKysrKysrKysrKwogeGVuL2Fy
Y2gveDg2L3hlbi5sZHMuUyAgICAgIHwgIDMgKysrCiA0IGZpbGVzIGNoYW5nZWQsIDM5IGluc2Vy
dGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ib290
L2hlYWQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwppbmRleCBjNWFjYmY1NmFlLi5lZjlm
NTYyNTA1IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKKysrIGIveGVuL2Fy
Y2gveDg2L2Jvb3QvaGVhZC5TCkBAIC02NjgsNiArNjY4LDIwIEBAIHRyYW1wb2xpbmVfc2V0dXA6
CiAgICAgICAgIGFkZCAgICAgJWVzaSxzeW1fZnMoX19wYWdlX3RhYmxlc19zdGFydCktOCgsJWVj
eCw4KQogMjogICAgICBsb29wICAgIDFiCiAKKyAgICAgICAgLyogTWFwIFhlbiBpbnRvIHRoZSBo
aWdoZXIgbWFwcGluZ3MgdXNpbmcgMk0gc3VwZXJwYWdlcy4gKi8KKyAgICAgICAgbGVhICAgICBf
UEFHRV9QU0UgKyBQQUdFX0hZUEVSVklTT1JfUldYICsgc3ltX2VzaShfc3RhcnQpLCAlZWF4Cisg
ICAgICAgIG1vdiAgICAgJHN5bV9vZmZzKF9zdGFydCksICAgJWVjeCAgIC8qICVlYXggPSBQVEUg
dG8gd3JpdGUgXiAgICAgICovCisgICAgICAgIG1vdiAgICAgJHN5bV9vZmZzKF9lbmQgLSAxKSwg
JWVkeAorICAgICAgICBzaHIgICAgICRMMl9QQUdFVEFCTEVfU0hJRlQsICVlY3ggICAvKiAlZWN4
ID0gRmlyc3Qgc2xvdCB0byB3cml0ZSAqLworICAgICAgICBzaHIgICAgICRMMl9QQUdFVEFCTEVf
U0hJRlQsICVlZHggICAvKiAlZWR4ID0gRmluYWwgc2xvdCB0byB3cml0ZSAqLworCisxOiAgICAg
IG1vdiAgICAgJWVheCwgc3ltX29mZnMobDJfeGVubWFwKSglZXNpLCAlZWN4LCA4KQorICAgICAg
ICBhZGQgICAgICQxLCAlZWN4CisgICAgICAgIGFkZCAgICAgJDEgPDwgTDJfUEFHRVRBQkxFX1NI
SUZULCAlZWF4CisKKyAgICAgICAgY21wICAgICAlZWR4LCAlZWN4CisgICAgICAgIGpiZSAgICAg
MWIKKwogICAgICAgICAvKgogICAgICAgICAgKiBNYXAgWGVuIGludG8gdGhlIGRpcmVjdG1hcCAo
bmVlZGVkIGZvciBlYXJseS1ib290IHBhZ2V0YWJsZQogICAgICAgICAgKiBoYW5kbGluZy93YWxr
aW5nKSwgYW5kIGlkZW50aXR5IG1hcCBYZW4gaW50byBib290bWFwIChuZWVkZWQgZm9yCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC94ODZfNjQuUyBiL3hlbi9hcmNoL3g4Ni9ib290L3g4
Nl82NC5TCmluZGV4IGFhYmY1NjFiMjMuLmU2M2JlY2U0NjAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L3g4Ni9ib290L3g4Nl82NC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L3g4Nl82NC5TCkBAIC00
Myw2ICs0MywxNCBAQCBtdWx0aWJvb3RfcHRyOgogR0xPQkFMKHN0YWNrX3N0YXJ0KQogICAgICAg
ICAucXVhZCAgIGNwdTBfc3RhY2sgKyBTVEFDS19TSVpFIC0gQ1BVSU5GT19zaXplb2YKIAorICAg
ICAgICAuc2VjdGlvbiAuYnNzLnBhZ2VfYWxpZ25lZCwgImF3IiwgQG5vYml0cworICAgICAgICAu
YWxpZ24gUEFHRV9TSVpFLCAwCisKKy8qIEwyIG1hcHBpbmcgdGhlIFhlbiB0ZXh0L2RhdGEvYnNz
IHJlZ2lvbi4gIFVzZXMgMXggNGsgcGFnZS4gKi8KK0dMT0JBTChsMl94ZW5tYXApCisgICAgICAg
IC5maWxsIEwyX1BBR0VUQUJMRV9FTlRSSUVTLCA4LCAwCisgICAgICAgIC5zaXplIGwyX3hlbm1h
cCwgLiAtIGwyX3hlbm1hcAorCiAgICAgICAgIC5zZWN0aW9uIC5kYXRhLnBhZ2VfYWxpZ25lZCwg
ImF3IiwgQHByb2diaXRzCiAgICAgICAgIC5hbGlnbiBQQUdFX1NJWkUsIDAKIC8qCkBAIC04MCwy
MSArODgsNiBAQCBHTE9CQUwobDJfZGlyZWN0bWFwKQogICAgICAgICAuZmlsbCA0ICogTDJfUEFH
RVRBQkxFX0VOVFJJRVMgLSAxLCA4LCAwCiAgICAgICAgIC5zaXplIGwyX2RpcmVjdG1hcCwgLiAt
IGwyX2RpcmVjdG1hcAogCi0vKgotICogTDIgbWFwcGluZyB0aGUgMUdCIFhlbiB0ZXh0L2RhdGEv
YnNzIHJlZ2lvbi4gIEF0IGJvb3QgaXQgbWFwcyAxNk1CIGZyb20KLSAqIF9faW1hZ2VfYmFzZV9f
LCBhbmQgaXMgbW9kaWZpZWQgd2hlbiBYZW4gcmVsb2NhdGVzIGl0c2VsZi4gIFVzZXMgMXggNGsK
LSAqIHBhZ2UuCi0gKi8KLUdMT0JBTChsMl94ZW5tYXApCi0gICAgICAgIC5xdWFkIDAKLSAgICAg
ICAgaWR4ID0gMQotICAgICAgICAucmVwdCA3Ci0gICAgICAgIC5xdWFkIHN5bV9vZmZzKF9faW1h
Z2VfYmFzZV9fKSArIChpZHggPDwgTDJfUEFHRVRBQkxFX1NISUZUKSArIChQQUdFX0hZUEVSVklT
T1JfUldYIHwgX1BBR0VfUFNFKQotICAgICAgICBpZHggPSBpZHggKyAxCi0gICAgICAgIC5lbmRy
Ci0gICAgICAgIC5maWxsIEwyX1BBR0VUQUJMRV9FTlRSSUVTIC0gOCwgOCwgMAotICAgICAgICAu
c2l6ZSBsMl94ZW5tYXAsIC4gLSBsMl94ZW5tYXAKLQogLyogTDIgbWFwcGluZyB0aGUgZml4bWFw
LiAgVXNlcyAxeCA0ayBwYWdlLiAqLwogbDJfZml4bWFwOgogICAgICAgICBpZHggPSAwCmRpZmYg
LS1naXQgYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC94ODYvZWZpL2Vm
aS1ib290LmgKaW5kZXggNTBkMTQ5OTg2Ny4uY2UwN2FlZGY0NSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gveDg2L2VmaS9lZmktYm9vdC5oCisrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaApA
QCAtNTg1LDYgKzU4NSwyMCBAQCBzdGF0aWMgdm9pZCBfX2luaXQgZWZpX2FyY2hfbWVtb3J5X3Nl
dHVwKHZvaWQpCiAgICAgaWYgKCAhZWZpX2VuYWJsZWQoRUZJX0xPQURFUikgKQogICAgICAgICBy
ZXR1cm47CiAKKyAgICAvKgorICAgICAqIE1hcCBYZW4gaW50byB0aGUgaGlnaGVyIG1hcHBpbmdz
LCB1c2luZyAyTSBzdXBlcnBhZ2VzLgorICAgICAqCisgICAgICogTkI6IFdlIGFyZSBjdXJyZW50
bHkgaW4gcGh5c2ljYWwgbW9kZSwgc28gYSBSSVAtcmVsYXRpdmUgcmVsb2NhdGlvbgorICAgICAq
IGFnYWluc3QgX3N0YXJ0L19lbmQgcmVzdWx0IGluIG91ciBhcmJpdHJhcnkgcGxhY2VtZW50IGJ5
IHRoZSBib290bG9hZGVyCisgICAgICogaW4gbWVtb3J5LCByYXRoZXIgdGhhbiB0aGUgaW50ZW5k
ZWQgaGlnaCBtYXBwaW5ncyBwb3NpdGlvbi4gIFN1YnRyYWN0CisgICAgICogeGVuX3BoeXNfc3Rh
cnQgdG8gZ2V0IHRoZSBhcHByb3ByaWF0ZSBzbG90cyBpbiBsMl94ZW5tYXBbXS4KKyAgICAgKi8K
KyAgICBmb3IgKCBpID0gIGwyX3RhYmxlX29mZnNldCgoVUlOVE4pX3N0YXJ0ICAgLSB4ZW5fcGh5
c19zdGFydCk7CisgICAgICAgICAgaSA8PSBsMl90YWJsZV9vZmZzZXQoKFVJTlROKV9lbmQgLSAx
IC0geGVuX3BoeXNfc3RhcnQpOyArK2kgKQorICAgICAgICBsMl94ZW5tYXBbaV0gPQorICAgICAg
ICAgICAgbDJlX2Zyb21fcGFkZHIoeGVuX3BoeXNfc3RhcnQgKyAoaSA8PCBMMl9QQUdFVEFCTEVf
U0hJRlQpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgUEFHRV9IWVBFUlZJU09SX1JXWCB8
IF9QQUdFX1BTRSk7CisKICAgICAvKiBDaGVjayB0aGF0IHRoZXJlIGlzIGF0IGxlYXN0IDRHIG9m
IG1hcHBpbmcgc3BhY2UgaW4gbDJfKm1hcFtdICovCiAgICAgQlVJTERfQlVHX09OKChzaXplb2Yo
bDJfYm9vdG1hcCkgICAvIEwyX1BBR0VUQUJMRV9FTlRSSUVTKSA8IDQpOwogICAgIEJVSUxEX0JV
R19PTigoc2l6ZW9mKGwyX2RpcmVjdG1hcCkgLyBMMl9QQUdFVEFCTEVfRU5UUklFUykgPCA0KTsK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgYi94ZW4vYXJjaC94ODYveGVuLmxk
cy5TCmluZGV4IDI5ZWY1MDc0MzIuLjA3YzY0NDhkYmIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwpAQCAtMzYwLDYgKzM2MCw5
IEBAIEFTU0VSVChfXzJNX3J3ZGF0YV9lbmQgPD0gWEVOX1ZJUlRfRU5EIC0gWEVOX1ZJUlRfU1RB
UlQgKyBfX1hFTl9WSVJUX1NUQVJUIC0KIEFTU0VSVChrZXhlY19yZWxvY19zaXplIC0ga2V4ZWNf
cmVsb2MgPD0gUEFHRV9TSVpFLCAia2V4ZWNfcmVsb2MgaXMgdG9vIGxhcmdlIikKICNlbmRpZgog
CisvKiBUaGUgTXVsdGlib290IHNldHVwIHBhdGhzIHJlbGllcyBvbiB0aGlzIHRvIHNpbXBsaWZ5
IHN1cGVycGFnZSBQVEUgY3JlYXRpb24uICovCitBU1NFUlQoSVNfQUxJR05FRChfc3RhcnQsICAg
ICAgICAgICAgTUIoMikpLCAiX3N0YXJ0IG1pc2FsaWduZWQiKQorCiBBU1NFUlQoSVNfQUxJR05F
RChfXzJNX3RleHRfZW5kLCAgICAgU0VDVElPTl9BTElHTiksICJfXzJNX3RleHRfZW5kIG1pc2Fs
aWduZWQiKQogQVNTRVJUKElTX0FMSUdORUQoX18yTV9yb2RhdGFfc3RhcnQsIFNFQ1RJT05fQUxJ
R04pLCAiX18yTV9yb2RhdGFfc3RhcnQgbWlzYWxpZ25lZCIpCiBBU1NFUlQoSVNfQUxJR05FRChf
XzJNX3JvZGF0YV9lbmQsICAgU0VDVElPTl9BTElHTiksICJfXzJNX3JvZGF0YV9lbmQgbWlzYWxp
Z25lZCIpCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
