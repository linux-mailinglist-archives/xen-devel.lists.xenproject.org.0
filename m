Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 760B0C3885
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 17:05:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFJfP-000581-0n; Tue, 01 Oct 2019 15:02:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rvNq=X2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iFJaZ-0004OE-GA
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 14:57:19 +0000
X-Inumbo-ID: c3263fec-e45b-11e9-b588-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id c3263fec-e45b-11e9-b588-bc764e2007e4;
 Tue, 01 Oct 2019 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569941838;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qUeO4+yJpm+ZEItf2jxtpPKt7p08qKHXSsAp1VS6gng=;
 b=PEyfqoL04HnMy4hRutPHGSyWmkyu3daE4G8uevxUe24tswICSd5OQy+J
 uj9vusy5Z2gFzMLEIRkrPDEMG5yoQScY+13MlCxnpqo7SyV7zjs77IpPg
 OCHKuH86519nMMhRx0+HwOGMQnrkGDj11asC7r7ToynWdcaC0CyXlCOHo Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i+dlpgJiYn98uf/k4hHENFNoc19oJnNtSVdTPyZ30NfDMVCjXjWjElSpYWMctrmDZVL2r3w3FN
 JwRRJOeJQJ/UOl5+P+4vjDopP/gEJC02KL6Krxj+ePQ9XK2igqAj0XGX9BgFY/ywb2YYjWZDyN
 RV/EPD9pRroSG/jkL6a7FHiwYbagzKoQ90K/fpLIJUWwEWp+knjMyN+rWCJPGULbMYsmFhsZJw
 lP02hehDcjgrOTLLon/ZCUJjrZCh2eTwnxEYE8rsx3OAZMRNz2mG+j5Zef5oT/eIIl7OXvy/Bs
 cbU=
X-SBRS: 2.7
X-MesageID: 6557828
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,571,1559534400"; 
   d="scan'208";a="6557828"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 1 Oct 2019 15:57:13 +0100
Message-ID: <20191001145714.556-2-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20191001145714.556-1-paul.durrant@citrix.com>
References: <20191001145714.556-1-paul.durrant@citrix.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 01 Oct 2019 15:02:16 +0000
Subject: [Xen-devel] [PATCH-for-4.13 v2 1/2] libxl: replace 'enabled' with
 'unknown' in libxl_passthrough enumeration
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhpcyBpcyBtb3N0bHkgYSBjb3NtZXRpYyBwYXRjaCB0byBhdm9pZCB0aGUgZGVmYXVsdCBlbnVt
ZXJhdGlvbiB2YWx1ZQpiZWluZyAnZW5hYmxlZCcuIFRoZSBvbmx5IG5vbi1jb3NtZXRpYyBwYXJ0
cyBhcmUgaW4geGxfcGFyc2UuYyB3aGVyZSBpdCBub3cKYmVjb21lcyBuZWNlc3NhcnkgdG8gZXhw
bGljaXRseSBwYXJzZSB0aGUgJ2VuYWJsZWQnIHZhbHVlIGZvciB4bC5jZmcKJ3Bhc3N0aHJvdWdo
JyBvcHRpb24sIGFuZCBlcnJvciBvbiB0aGUgdmFsdWUgJ3Vua25vd24nLCBiZWNhdXNlIHRoZXJl
IGlzIG5vCmxvbmdlciBhIGRpcmVjdCBtYXBwaW5nIGJldHdlZW4gdmFsaWQgeGwuY2ZnIHZhbHVl
cyBhbmQgdGhlIGVudW1lcmF0aW9uLgoKU3VnZ2VzdGVkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmph
Y2tzb25AZXUuY2l0cml4LmNvbT4KU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1
cnJhbnRAY2l0cml4LmNvbT4KLS0tCkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cgp2MjoKIC0gbmV3IGluIHYyCi0tLQogdG9vbHMvbGlieGwvbGlieGxf
Y3JlYXRlLmMgIHwgIDQgKystLQogdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIHwgIDIgKy0K
IHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICB8IDI2ICsrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCiAzIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGli
eGxfY3JlYXRlLmMKaW5kZXggYjU4ZTAzMDM3Ni4uNWYyOTcyYmMwMyAxMDA2NDQKLS0tIGEvdG9v
bHMvbGlieGwvbGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMK
QEAgLTY0LDcgKzY0LDcgQEAgaW50IGxpYnhsX19kb21haW5fY3JlYXRlX2luZm9fc2V0ZGVmYXVs
dChsaWJ4bF9fZ2MgKmdjLAogICAgICAgICBjX2luZm8tPnNzaWRyZWYgPSBTRUNJTklUU0lEX0RP
TVU7CiAKICAgICBpZiAoaW5mby5jYXBfaHZtX2RpcmVjdGlvICYmCi0gICAgICAgIChjX2luZm8t
PnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQpKSB7CisgICAgICAgIChj
X2luZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04pKSB7CiAgICAg
ICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSAoKGNfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5f
VFlQRV9QVikgfHwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhaW5mby5jYXBfaW9t
bXVfaGFwX3B0X3NoYXJlKSA/CiAgICAgICAgICAgICBMSUJYTF9QQVNTVEhST1VHSF9TWU5DX1BU
IDogTElCWExfUEFTU1RIUk9VR0hfU0hBUkVfUFQ7CkBAIC01ODYsNyArNTg2LDcgQEAgaW50IGxp
YnhsX19kb21haW5fbWFrZShsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9kb21haW5fY29uZmlnICpkX2Nv
bmZpZywKICAgICAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3ZhbChpbmZvLT5vb3MpID8gMCA6
IFhFTl9ET01DVExfQ0RGX29vc19vZmY7CiAgICAgICAgIH0KIAotICAgICAgICBhc3NlcnQoaW5m
by0+cGFzc3Rocm91Z2ggIT0gTElCWExfUEFTU1RIUk9VR0hfRU5BQkxFRCk7CisgICAgICAgIGFz
c2VydChpbmZvLT5wYXNzdGhyb3VnaCAhPSBMSUJYTF9QQVNTVEhST1VHSF9VTktOT1dOKTsKICAg
ICAgICAgTE9HKERFVEFJTCwgInBhc3N0aHJvdWdoOiAlcyIsCiAgICAgICAgICAgICBsaWJ4bF9w
YXNzdGhyb3VnaF90b19zdHJpbmcoaW5mby0+cGFzc3Rocm91Z2gpKTsKIApkaWZmIC0tZ2l0IGEv
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsIGIvdG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRs
CmluZGV4IDU0YWM2ODVmNTAuLjNhYzk0OTRiODAgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xp
YnhsX3R5cGVzLmlkbAorKysgYi90b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwKQEAgLTI2NCw3
ICsyNjQsNyBAQCBsaWJ4bF92a2JfYmFja2VuZCA9IEVudW1lcmF0aW9uKCJ2a2JfYmFja2VuZCIs
IFsKICAgICBdKQogCiBsaWJ4bF9wYXNzdGhyb3VnaCA9IEVudW1lcmF0aW9uKCJwYXNzdGhyb3Vn
aCIsIFsKLSAgICAoMCwgImVuYWJsZWQiKSwKKyAgICAoMCwgInVua25vd24iKSwKICAgICAoMSwg
ImRpc2FibGVkIiksCiAgICAgKDIsICJzeW5jX3B0IiksCiAgICAgKDMsICJzaGFyZV9wdCIpLApk
aWZmIC0tZ2l0IGEvdG9vbHMveGwveGxfcGFyc2UuYyBiL3Rvb2xzL3hsL3hsX3BhcnNlLmMKaW5k
ZXggYzJlNjFiNjgwZi4uMDNhMmM1NGRkMiAxMDA2NDQKLS0tIGEvdG9vbHMveGwveGxfcGFyc2Uu
YworKysgYi90b29scy94bC94bF9wYXJzZS5jCkBAIC0xNTEyLDIzICsxNTEyLDI3IEBAIHZvaWQg
cGFyc2VfY29uZmlnX2RhdGEoY29uc3QgY2hhciAqY29uZmlnX3NvdXJjZSwKICAgICBpZiAoeGx1
X2NmZ19nZXRfc3RyaW5nKGNvbmZpZywgInBhc3N0aHJvdWdoIiwgJmJ1ZiwgMCkpIHsKICAgICAg
ICAgY19pbmZvLT5wYXNzdGhyb3VnaCA9CiAgICAgICAgICAgICAoZF9jb25maWctPm51bV9wY2lk
ZXZzIHx8IGRfY29uZmlnLT5udW1fZHRkZXZzKQotICAgICAgICAgICAgPyBMSUJYTF9QQVNTVEhS
T1VHSF9FTkFCTEVEIDogTElCWExfUEFTU1RIUk9VR0hfRElTQUJMRUQ7CisgICAgICAgICAgICA/
IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04gOiBMSUJYTF9QQVNTVEhST1VHSF9ESVNBQkxFRDsK
ICAgICB9IGVsc2UgewotICAgICAgICBsaWJ4bF9wYXNzdGhyb3VnaCBvOworICAgICAgICBpZiAo
IXN0cmNhc2VjbXAoImVuYWJsZWQiLCBidWYpKQorICAgICAgICAgICAgY19pbmZvLT5wYXNzdGhy
b3VnaCA9IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV047CisgICAgICAgIGVsc2UgeworICAgICAg
ICAgICAgbGlieGxfcGFzc3Rocm91Z2ggbzsKIAotICAgICAgICBlID0gbGlieGxfcGFzc3Rocm91
Z2hfZnJvbV9zdHJpbmcoYnVmLCAmbyk7Ci0gICAgICAgIGlmIChlKSB7Ci0gICAgICAgICAgICBm
cHJpbnRmKHN0ZGVyciwKLSAgICAgICAgICAgICAgICAgICAgIkVSUk9SOiB1bmtub3duIHBhc3N0
aHJvdWdoIG9wdGlvbiAnJXMnXG4iLAotICAgICAgICAgICAgICAgICAgICBidWYpOwotICAgICAg
ICAgICAgZXhpdCgtRVJST1JfRkFJTCk7Ci0gICAgICAgIH0KKyAgICAgICAgICAgIGUgPSBsaWJ4
bF9wYXNzdGhyb3VnaF9mcm9tX3N0cmluZyhidWYsICZvKTsKKyAgICAgICAgICAgIGlmIChlIHx8
ICFzdHJjYXNlY21wKCJ1bmtub3duIiwgYnVmKSkgeworICAgICAgICAgICAgICAgIGZwcmludGYo
c3RkZXJyLAorICAgICAgICAgICAgICAgICAgICAgICAgIkVSUk9SOiB1bmtub3duIHBhc3N0aHJv
dWdoIG9wdGlvbiAnJXMnXG4iLAorICAgICAgICAgICAgICAgICAgICAgICAgYnVmKTsKKyAgICAg
ICAgICAgICAgICBleGl0KC1FUlJPUl9GQUlMKTsKKyAgICAgICAgICAgIH0KIAotICAgICAgICBj
X2luZm8tPnBhc3N0aHJvdWdoID0gbzsKKyAgICAgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2gg
PSBvOworICAgICAgICB9CiAgICAgfQogCiAgICAgc3dpdGNoIChjX2luZm8tPnBhc3N0aHJvdWdo
KSB7Ci0gICAgY2FzZSBMSUJYTF9QQVNTVEhST1VHSF9FTkFCTEVEOgorICAgIGNhc2UgTElCWExf
UEFTU1RIUk9VR0hfVU5LTk9XTjoKICAgICAgICAgLyoKICAgICAgICAgICogQ2hvb3NlIGEgc3Vp
dGFibGUgZGVmYXVsdC4gbGlieGwgd291bGQgYWxzbyBkbyB0aGlzIGJ1dAogICAgICAgICAgKiBj
aG9vc2luZyBoZXJlIGFsbG93cyB0aGUgY29kZSBjYWxjdWxhdGluZyAnaW9tbXVfbWVta2InCi0t
IAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
