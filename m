Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4586CA5C41
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 20:29:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4r2p-000105-9k; Mon, 02 Sep 2019 18:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hhAT=W5=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1i4r2n-0000zu-D2
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 18:27:13 +0000
X-Inumbo-ID: 47d4c844-cdaf-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47d4c844-cdaf-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 18:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567448833;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iw8lpmvWW06kgHF+Bh2AWLGQjfELVrhguAYDaK3ZqrU=;
 b=VkI/uJhk2wAFej8RYOXBxXdQIEOFNEQIJQRvrIs8FX7Xc21W8PuIyRLj
 qIl+voL5P3Qiwsbyi6ADRk1qXndfedJ5tDvvETZdehS7WS708GVfrxK5W
 rPnQVQpwh3HUpb25GO13eW8f51YgNzHJG7s3x4Wm3sWv5NRo41ofirOL3 8=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=edvin.torok@citrix.com;
 spf=Pass smtp.mailfrom=edvin.torok@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 edvin.torok@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 edvin.torok@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="edvin.torok@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="edvin.torok@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: i9aMzh2f13U2vixr+H1V7v6iLZZvEKYkSkqco4q/va9Cl8pqTmBdFAYF4ocVJNZND2ZenZdzTL
 fP+nR9Q5EHYReyNrd42xPRwjoVNioJw2e1jc0JWASA6PBTx39EAKKH+7H9pDWN4H6U11jB1oVZ
 51UpjhIg39sF/WeGd+mlt/I/x9bitkMHMSFpAavCa8N8lyagFDYW7SyPRGtVaJpBC6+LFcXBp+
 fDSWCRFPju3E8ANnBHDBxwNToQ/OvhIBX6gf7q96FL0xbF3Dx9wm3ZZzmJhkcIP1MlhsyznhBU
 cpw=
X-SBRS: 2.7
X-MesageID: 5025228
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,460,1559534400"; 
   d="scan'208";a="5025228"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 2 Sep 2019 19:27:07 +0100
Message-ID: <a4ce05dc1da29722dc6292159a2f83811af84f6f.1567448405.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1567448405.git.edvin.torok@citrix.com>
References: <cover.1567448405.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/1] x86/arch: VM resume: avoid RDTSC emulation
 due to host clock drift
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gYSBJbnRlbChSKSBYZW9uKFIpIENQVSBFNS0yNjk3IHYzIEAgMi42MEdIeiB0aGUgaG9zdCBm
cmVxdWVuY3kgZHJpZnRzOgpgYGAKKFhFTikgWyAgICA2LjYwNzY5M10gRGV0ZWN0ZWQgMjYwMC4w
MDQgTUh6IHByb2Nlc3Nvci4KKFhFTikgWyAyNjc0LjIxMzA4MV0gZG9tMShodm0pOiBtb2RlPTAs
b2ZzPTB4ZmZmZWU2ZjcwYjdmYWE0OCxraHo9MjYwMDAxOCxpbmM9MwooWEVOKSBbIDI2NzQuMjEz
MDg3XSBkb20yKGh2bSk6IG1vZGU9MCxvZnM9MHhmZmZlZTZmZDQ5OTgzNWMwLGtoej0yNjAwMDE4
LGluYz0yCmBgYAoKVGhlIDIgZG9tYWlucyB3ZXJlIHN1c3BlbmRlZCBwcmlvciB0byByZWJvb3Rp
bmcgdGhlIGhvc3QgYW5kIGFwcGx5aW5nIGEKeGVuL21pY3JvY29kZSBwYXRjaC4gQWZ0ZXIgdGhl
IHJlYm9vdCB0aGUgZnJlcXVlbmN5IG9mIHRoZSBob3N0IHdhcyBkZWVtZWQgdG8KYmUgc2xpZ2h0
bHkgZGlmZmVyZW50LCBhbmQgdGhlcmVmb3JlIHN3aXRjaGluZyBvbiBSRFRTQyBlbXVsYXRpb24g
Zm9yIHRoZSBMaW51eApIVk0gZ3Vlc3QsIGV2ZW4gdGhvdWdoIHRoZSBkaWZmZXJlbmNlIHdhcyBv
bmx5IDUgcHBtLiBUaGlzIENQVSBkb2Vzbid0IHN1cHBvcnQKVFNDIHNjYWxpbmcuCgpUaGVyZWZv
cmUgd2Ugc2hvdWxkIGVpdGhlciBtZWFzdXJlIHRoZSBzdGFuZGFyZCBkZXZpYXRpb24gb2Ygb3Vy
IGNhbGlicmF0aW9uCmFuZCBoYXZlIGEgcmFuZ2Ugb2YgYWNjZXB0YWJsZSBmcmVxdWVuY2llcyBh
cyAic2FtZSIsIG9yIGhhdmUgYSBzdGF0aWMKdG9sZXJhbmNlIHZhbHVlLgoKVGhlIHBsYXRmb3Jt
IHRpbWVyJ3MgY2xvY2sgZnJlcXVlbmN5IGFjY3VyYWN5IGlzOgoqIElBLVBDIEhQRVQgU3BlY2lm
aWNhdGlvbiAxLjBhIHNlY3Rpb25zIDIuMiBhbmQgMi40LjE6IDUwMCBwcG0gb3IgYmV0dGVyCiog
QUNQSSBQTSB0aW1lciwgYW5kIFBJVCB0aW1lciBkbyBub3QgaGF2ZSBkZWZpbmVkIGFjY3VyYWNp
ZXMKKiBJbnRlbCAzMDAgU2VyaWVzIGRhdGFzaGVldCBzZWN0aW9uIDI1LjY6IDI0IE1IeiBjcnlz
dGFsIDEwMCBwcG0gb3IgYmV0dGVyCiogTlRQIEZBUSBzZWN0aW9uIDMuMyBDbG9jayBRdWFsaXR5
OiAxMSBwcG0gZHJpZnQgZHVlIHRvIHRlbXBlcmF0dXJlCiogc2VjdGlvbiAyLjIuMiBjbGFpbXMg
dGhhdCBQSVQvQUNQSSBQTSB0aW1lciBzaGFyZSB0aGUgc2FtZSBjcnlzdGFsIGFzIEhQRVQgYW5k
CnRodXMgNTAwIHBwbSBhcyBhbiB1cHBlciBib3VuZCwgInRoZSByZWFsIGRyaWZ0IGlzIHVzdWFs
bHkgc21hbGxlciB0aGFuIDMwcHBtIgoKRm9yIHNpbXBsaWNpdHkgYW5kIGRldGVybWluaXNtIG9w
dGVkIGZvciBhIHN0YXRpYyB0b2xlcmFuY2UgdmFsdWUgb2YgMTAwIHBwbQpoZXJlLCBzdWNoIHRo
YXQgdGhlIGFueSBlcnJvciB3b3VsZCBiZSB3ZWxsIHdpdGhpbiB0aGUgZXJyb3IgeW91IHdvdWxk
IGdldCB3aXRoCkhQRVQvTGludXgncyBjYWxpYnJhdGlvbi4gTlRQIGNhbiBjb3BlIHdpdGggYSBk
cmlmdCA8IDUwMCBwcG0uCk1vc3QgaW1wb3J0YW50bHkgdGhpcyBzaG91bGQgc3RvcCBYZW4gZnJv
bSBjbGFpbWluZyB0aGF0IHRoZSBjbG9jayBmcmVxdWVuY3kgb24KdGhlIHNhbWUgaG9zdCBpcyBk
aWZmZXJlbnQgYWNyb3NzIHJlYm9vdHMuIFNwZWNpZmljYXRpb25zIGRvIG5vdCBjdXJyZW50bHkK
bWFuZGF0ZSBhbiBhY2N1cmFjeSBoaWdoZXIgdGhhbiAxMDAgcHBtLCB0aGVyZWZvcmUgT1NlcyBz
aG91bGQgYWxyZWFkeSBiZSBhYmxlCnRvIGNvcGUgd2l0aCBzdWNoIGRyaWZ0IG9uIHJlYWwgaGFy
ZHdhcmUuIEFueSBpbXByb3ZlbWVudHMgaW4gYWNjdXJhY3kgZnJvbQpmdXR1cmUgc3BlY2lmaWNh
dGlvbnMvbW90aGVyYm9hcmRzIHdvdWxkbid0IGJlIGFwcGxpY2FibGUsIGJlY2F1c2UgdGhleSB3
b3VsZAphbHNvIGNvbWUgd2l0aCBuZXdlciBDUFVzIHRoYXQgc3VwcG9ydCBUU0Mgc2NhbGluZy4K
CklmIHRoZSBDUFUgZG9lcyBzdXBwb3J0IFRTQyBzY2FsaW5nIFhlbiB3aWxsIG9mIGNvdXJzZSBz
dGlsbCBhdHRlbXB0IHRvIG1hdGNoCnRoZSBleGFjdCBmcmVxdWVuY3kgdmFsdWUgaXQgdGhpbmtz
IHRoZSBndWVzdCBoYWQgd2hlbiBpdCB3YXMgc3VzcGVuZGVkLgpTZWUgYmVsb3cgZm9yIGBpZiAo
IGh2bV90c2Nfc2NhbGluZ19zdXBwb3J0ZWQgJiYgIWQtPmFyY2gudnRzYyApYCAobm90IHZpc2li
bGUKaW4gcGF0Y2ggY29udGV4dCkuCgpsbGFicygpIGRvZXNuJ3QgYXBwZWFyIHRvIGJlIGF2YWls
YWJsZSB3aGVuIGJ1aWxkaW5nIHhlbiwgaGVuY2UgdGhlIDIgY29tcGFyaXNvbnMuCgpBZnRlciB0
aGlzIHBhdGNoIHdoZW4gc3VzcGVuZGluZyBhIFZNLCBhbmQgcmVib290aW5nIHRoZSBob3N0IEkg
Z2V0IHRoaXMgb3V0cHV0OgpgYGAKKFhFTikgWyAgICA2LjYxNDcwM10gRGV0ZWN0ZWQgMjYwMC4w
MTAgTUh6IHByb2Nlc3Nvci4KKFhFTikgWyAgMTM4LjkyNDM0Ml0gVFNDIG1hcmtlZCBhcyByZWxp
YWJsZSwgd2FycCA9IDAgKGNvdW50PTIpCihYRU4pIFsgIDEzOC45MjQzNDZdIGRvbTEoaHZtKTog
bW9kZT0wLG9mcz0weGZmZmVkMDE5MDEwMTZkMTgsa2h6PTI2MDAwMTIsaW5jPTIKYGBgCgpTaWdu
ZWQtb2ZmLWJ5OiBFZHdpbiBUw7Zyw7ZrIDxlZHZpbi50b3Jva0BjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni90aW1lLmMgfCA4ICsrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3RpbWUuYyBi
L3hlbi9hcmNoL3g4Ni90aW1lLmMKaW5kZXggOWE2ZWE4ZmZjYi4uYTBiOTlmNWZmZiAxMDA2NDQK
LS0tIGEveGVuL2FyY2gveDg2L3RpbWUuYworKysgYi94ZW4vYXJjaC94ODYvdGltZS5jCkBAIC0y
MTcxLDYgKzIxNzEsMTIgQEAgdm9pZCB0c2NfZ2V0X2luZm8oc3RydWN0IGRvbWFpbiAqZCwgdWlu
dDMyX3QgKnRzY19tb2RlLAogICAgICAgICAqZWxhcHNlZF9uc2VjID0gMDsKIH0KIAorc3RhdGlj
IGlubGluZSBpbnQgZnJlcXVlbmN5X3NhbWVfd2l0aF90b2xlcmFuY2UoaW50NjRfdCBraHoxLCBp
bnQ2NF90IGtoejIpCit7CisgICAgaW50NjRfdCBwcG0gPSAoa2h6MiAtIGtoejEpICogMTAwMDAw
MCAvIGtoejI7CisgICAgcmV0dXJuIC0xMDAgPCBwcG0gJiYgcHBtIDwgMTAwOworfQorCiAvKgog
ICogVGhpcyBtYXkgYmUgY2FsbGVkIGFzIG1hbnkgYXMgdGhyZWUgdGltZXMgZm9yIGEgZG9tYWlu
LCBvbmNlIHdoZW4gdGhlCiAgKiBoeXBlcnZpc29yIGNyZWF0ZXMgdGhlIGRvbWFpbiwgb25jZSB3
aGVuIHRoZSB0b29sc3RhY2sgY3JlYXRlcyB0aGUKQEAgLTIyMDcsNyArMjIxMyw3IEBAIGludCB0
c2Nfc2V0X2luZm8oc3RydWN0IGRvbWFpbiAqZCwKICAgICAgICAgICogZC0+YXJjaC50c2Nfa2h6
ID09IGNwdV9raHouIFRodXMgbm8gbmVlZCB0byBjaGVjayBpbmNhcm5hdGlvbi4KICAgICAgICAg
ICovCiAgICAgICAgIGlmICggdHNjX21vZGUgPT0gVFNDX01PREVfREVGQVVMVCAmJiBob3N0X3Rz
Y19pc19zYWZlKCkgJiYKLSAgICAgICAgICAgICAoZC0+YXJjaC50c2Nfa2h6ID09IGNwdV9raHog
fHwKKyAgICAgICAgICAgICAoZnJlcXVlbmN5X3NhbWVfd2l0aF90b2xlcmFuY2UoZC0+YXJjaC50
c2Nfa2h6LCBjcHVfa2h6KSB8fAogICAgICAgICAgICAgICAoaXNfaHZtX2RvbWFpbihkKSAmJgog
ICAgICAgICAgICAgICAgaHZtX2dldF90c2Nfc2NhbGluZ19yYXRpbyhkLT5hcmNoLnRzY19raHop
KSkgKQogICAgICAgICB7Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
