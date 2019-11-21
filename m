Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282A2105C8B
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 23:18:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXukB-00077t-Nl; Thu, 21 Nov 2019 22:16:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOoV=ZN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iXukA-00077n-8A
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 22:16:06 +0000
X-Inumbo-ID: 7f78379a-0cac-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f78379a-0cac-11ea-9631-bc764e2007e4;
 Thu, 21 Nov 2019 22:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574374560;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ldMBmOldI2iKTh4VR9QYTnyXSQf/G+qOY76q/OFm+M4=;
 b=Ce6ntlZlO3REFN1D3G9RrtJI7cMKxvj+RSQTDZtxOFK9Zp6JILFB5Q9j
 1MuuqoAYSxpdQsLP3WgV0yRis7nKzrs18IkM5b5Gh4//OhCNE3p5g5XwQ
 rDHigmuhTsol+pf1c8rhKqriyouHMQRamxOe7VGnn7ceedF8z9KJ9sOeO c=;
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
IronPort-SDR: 2rhv19R0F1MUQGnxAlU1cbSUgM14deDEZJUe1VZwVkR/Utin9rpeWNdQsETvuUDv908jBguRcC
 em5d2oHR1roUoS3hkoeaAlDp6yEyBXx1yW3XZ9K3BSJfM0g4mmxzpb3+VhJ5T5dWztgV3SiNIg
 DVMug+BZhgU8+RZn+IGr+fbjG76wiYPcAoad71MH/y+3qkrjf5SFLSvQV28iPnSUllOb8wyOgM
 JGOkyA3SyIyDkNokVlusYcJspDqM8yj/83alobN9GFV3NJ4Cn510XVo3PGfsVzU+REztzsuicz
 Tr0=
X-SBRS: 2.7
X-MesageID: 9097596
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,227,1571716800"; 
   d="scan'208";a="9097596"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 21 Nov 2019 22:15:50 +0000
Message-ID: <20191121221551.1175-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191121221551.1175-1-andrew.cooper3@citrix.com>
References: <20191121221551.1175-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] x86/vtx: Fix fault semantics for early task
 switch failures
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIFZULXggdGFzayBzd2l0Y2ggaGFuZGxlciBhZGRzIGluc3RfbGVuIHRvIHJpcCBiZWZvcmUg
Y2FsbGluZwpodm1fdGFza19zd2l0Y2goKS4gIFRoaXMgY2F1c2VzIGVhcmx5IGZhdWx0cyB0byBi
ZSBkZWxpdmVyZWQgdG8gdGhlIGd1ZXN0IHdpdGgKdHJhcCBzZW1hbnRpY3MsIGFuZCBicmVhayBy
ZXN0YXJ0aWJpbGl0eS4KCkluc3RlYWQsIHBhc3MgdGhlIGluc3RydWN0aW9uIGxlbmd0aCBpbnRv
IGh2bV90YXNrX3N3aXRjaCgpIGFuZCB3cml0ZSBpdCBpbnRvCnRoZSBvdXRnb2luZyB0c3Mgb25s
eSwgbGVhdmluZyByaXAgaW4gaXRzIG9yaWdpbmFsIGxvY2F0aW9uLgoKRm9yIG5vdywgcGFzcyAw
IG9uIHRoZSBTVk0gc2lkZS4gIFRoaXMgaGlnaGxpZ2h0cyBhIHNlcGFyYXRlIHByZWV4aXN0aW5n
IGJ1Zwp3aGljaCB3aWxsIGJlIGFkZHJlc3NlZCBpbiB0aGUgZm9sbG93aW5nIHBhdGNoLgoKV2hp
bGUgYWRqdXN0aW5nIGNhbGwgc2l0ZXMsIGRyb3AgdGhlIHVubmVjZXNzYXJ5IHVpbnQxNl90IGNh
c3QuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUg
PHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
Q0M6IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT4KQ0M6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPgpDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PgotLS0KIHhlbi9hcmNoL3g4Ni9odm0vaHZtLmMgICAgICAgIHwgNCArKy0tCiB4ZW4vYXJjaC94
ODYvaHZtL3N2bS9zdm0uYyAgICB8IDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAg
IHwgNCArKy0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaCB8IDIgKy0KIDQgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hl
bi9hcmNoL3g4Ni9odm0vaHZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCmluZGV4IDgxOGU3
MDVmZDEuLjdmNTU2MTcxYmQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKKysr
IGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwpAQCAtMjkxMyw3ICsyOTEzLDcgQEAgdm9pZCBodm1f
cHJlcGFyZV92bTg2X3RzcyhzdHJ1Y3QgdmNwdSAqdiwgdWludDMyX3QgYmFzZSwgdWludDMyX3Qg
bGltaXQpCiAKIHZvaWQgaHZtX3Rhc2tfc3dpdGNoKAogICAgIHVpbnQxNl90IHRzc19zZWwsIGVu
dW0gaHZtX3Rhc2tfc3dpdGNoX3JlYXNvbiB0YXNrc3dpdGNoX3JlYXNvbiwKLSAgICBpbnQzMl90
IGVycmNvZGUpCisgICAgaW50MzJfdCBlcnJjb2RlLCB1bnNpZ25lZCBpbnQgaW5zbl9sZW4pCiB7
CiAgICAgc3RydWN0IHZjcHUgKnYgPSBjdXJyZW50OwogICAgIHN0cnVjdCBjcHVfdXNlcl9yZWdz
ICpyZWdzID0gZ3Vlc3RfY3B1X3VzZXJfcmVncygpOwpAQCAtMjk4Nyw3ICsyOTg3LDcgQEAgdm9p
ZCBodm1fdGFza19zd2l0Y2goCiAgICAgaWYgKCB0YXNrc3dpdGNoX3JlYXNvbiA9PSBUU1dfaXJl
dCApCiAgICAgICAgIGVmbGFncyAmPSB+WDg2X0VGTEFHU19OVDsKIAotICAgIHRzcy5laXAgICAg
PSByZWdzLT5laXA7CisgICAgdHNzLmVpcCAgICA9IHJlZ3MtPmVpcCArIGluc25fbGVuOwogICAg
IHRzcy5lZmxhZ3MgPSBlZmxhZ3M7CiAgICAgdHNzLmVheCAgICA9IHJlZ3MtPmVheDsKICAgICB0
c3MuZWN4ICAgID0gcmVncy0+ZWN4OwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS9zdm0v
c3ZtLmMgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYwppbmRleCA0ZWI2YjBlNGM3Li4wNDli
ODAwZTIwIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3N2bS9zdm0uYworKysgYi94ZW4v
YXJjaC94ODYvaHZtL3N2bS9zdm0uYwpAQCAtMjc5NCw3ICsyNzk0LDcgQEAgdm9pZCBzdm1fdm1l
eGl0X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgICAqLwogICAg
ICAgICB2bWNiLT5ldmVudGluai5ieXRlcyA9IDA7CiAKLSAgICAgICAgaHZtX3Rhc2tfc3dpdGNo
KCh1aW50MTZfdCl2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSk7CisgICAgICAgIGh2
bV90YXNrX3N3aXRjaCh2bWNiLT5leGl0aW5mbzEsIHJlYXNvbiwgZXJyY29kZSwgMCk7CiAgICAg
ICAgIGJyZWFrOwogICAgIH0KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14
LmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCA2YTVlZWI1YzEzLi42ZDA0ODg1
MmMzIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYwpAQCAtMzk1Niw4ICszOTU2LDggQEAgdm9pZCB2bXhfdm1leGl0
X2hhbmRsZXIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCiAgICAgICAgICAgICBfX3ZtcmVh
ZChJRFRfVkVDVE9SSU5HX0VSUk9SX0NPREUsICZlY29kZSk7CiAgICAgICAgIGVsc2UKICAgICAg
ICAgICAgICBlY29kZSA9IC0xOwotICAgICAgICByZWdzLT5yaXAgKz0gaW5zdF9sZW47Ci0gICAg
ICAgIGh2bV90YXNrX3N3aXRjaCgodWludDE2X3QpZXhpdF9xdWFsaWZpY2F0aW9uLCByZWFzb25z
W3NvdXJjZV0sIGVjb2RlKTsKKworICAgICAgICBodm1fdGFza19zd2l0Y2goZXhpdF9xdWFsaWZp
Y2F0aW9uLCByZWFzb25zW3NvdXJjZV0sIGVjb2RlLCBpbnN0X2xlbik7CiAgICAgICAgIGJyZWFr
OwogICAgIH0KICAgICBjYXNlIEVYSVRfUkVBU09OX0NQVUlEOgpkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApp
bmRleCBmODZhZjA5ODk4Li40Y2NlNTliYjMxIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20t
eDg2L2h2bS9odm0uaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9odm0uaApAQCAtMjk3
LDcgKzI5Nyw3IEBAIHZvaWQgaHZtX3NldF9yZHRzY19leGl0aW5nKHN0cnVjdCBkb21haW4gKmQs
IGJvb2xfdCBlbmFibGUpOwogZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29uIHsgVFNXX2ptcCwg
VFNXX2lyZXQsIFRTV19jYWxsX29yX2ludCB9Owogdm9pZCBodm1fdGFza19zd2l0Y2goCiAgICAg
dWludDE2X3QgdHNzX3NlbCwgZW51bSBodm1fdGFza19zd2l0Y2hfcmVhc29uIHRhc2tzd2l0Y2hf
cmVhc29uLAotICAgIGludDMyX3QgZXJyY29kZSk7CisgICAgaW50MzJfdCBlcnJjb2RlLCB1bnNp
Z25lZCBpbnQgaW5zbl9sZW4pOwogCiBlbnVtIGh2bV9hY2Nlc3NfdHlwZSB7CiAgICAgaHZtX2Fj
Y2Vzc19pbnNuX2ZldGNoLAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
