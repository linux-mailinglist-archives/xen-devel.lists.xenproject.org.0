Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9B515060D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:23:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyahT-0007uT-OH; Mon, 03 Feb 2020 12:19:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyahS-0007u9-Ed
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:19:34 +0000
X-Inumbo-ID: 6f5af14c-467f-11ea-8e54-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f5af14c-467f-11ea-8e54-12813bfff9fa;
 Mon, 03 Feb 2020 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580732373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+WP06psAabSWNj9MQ8yGgg2MdVrxR0ib/BtWDA94YBw=;
 b=Mnqdcq0zOtoyhgNAJA/0kNPzz48R0o49mXwOVqRksTGSYmuCryzIt9QH
 tNBO/3P1Bjkj9Z2e3nR53vkaaUc8HfkYS5U86yh7LCAFkIFrk1KC0Yv1E
 H5M5zb9M4OPozr8RNPfUTLqGEYpaM3lCbEJSS5cNa19cPD1nyPdqs7pxr I=;
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
IronPort-SDR: BhbgsFz+l1CJ5jkN0fCJpPABZ5tgsBOnzFPY+Wvg7HLwD5B2tMK2b7MW/AEju+kugj4EJlN6Bm
 oPYzw/udmDKibeT5zBy0jVxTA+N5RpelRCiRsbDazPyMv5ZjukkK2LfT2oDf9XCqGyq5qYq7vv
 WWGRGaAhUryY1llvidZJn1j3O7udsT/ZOubOAwX+nVstMa4LFlZbBfhAMCgo5YwyrBOMfkxoY6
 lQeVMlDf8D8dmBoryd4L0+amEJr5s/Ik9E7fghAOyV0nOTfoXO7usgZ+gxk1C44o+h4SqoGT+y
 Jqk=
X-SBRS: 2.7
X-MesageID: 12457218
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12457218"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 3 Feb 2020 13:19:17 +0100
Message-ID: <20200203121919.15748-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200203121919.15748-1-roger.pau@citrix.com>
References: <20200203121919.15748-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/4] x86/vvmx: fix VM_EXIT_ACK_INTR_ON_EXIT
 handling
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

V2hlbiBWTV9FWElUX0FDS19JTlRSX09OX0VYSVQgaXMgc2V0IGluIHRoZSB2bWV4aXQgY29udHJv
bCB2bWNzCnJlZ2lzdGVyIHRoZSBiaXQgMzEgb2YgVk1fRVhJVF9JTlRSX0lORk8gbXVzdCBiZSAw
LCBpbiBvcmRlciB0byBkZW5vdGUKdGhhdCB0aGUgZmllbGQgZG9lc24ndCBjb250YWluIGFueSBp
bnRlcnJ1cHQgaW5mb3JtYXRpb24uIFRoaXMgaXMgbm90CmN1cnJlbnRseSBhY2tub3dsZWRnZWQg
YXMgdGhlIGZpZWxkIGFsd2F5cyBnZXQgZmlsbGVkIHdpdGggdmFsaWQKaW50ZXJydXB0IGluZm9y
bWF0aW9uLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgVk1fRVhJVF9BQ0tfSU5UUl9PTl9FWElUCmlz
IHNldC4KCkZpeCB0aGlzIGFuZCBvbmx5IGZpbGwgVk1fRVhJVF9JTlRSX0lORk8gd2hlbiBWTV9F
WElUX0FDS19JTlRSX09OX0VYSVQKaXMgbm90IHNldC4gTm90ZSB0aGF0IHRoaXMgcmVxdWlyZXMg
b25lIG1pbm9yIGNoYW5nZSBpbgpudm14X3VwZGF0ZV9hcGljdiBpbiBvcmRlciB0byBvYnRhaW4g
dGhlIGludGVycnVwdCBpbmZvcm1hdGlvbiBmcm9tCnRoZSBpbnRlcm5hbCBzdGF0ZSByYXRoZXIg
dGhhbiB0aGUgbmVzdGVkIHZtY3MgcmVnaXN0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIE5l
dyBpbiB0aGlzIHZlcnNpb24uCi0tLQogeGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIHwgNiAr
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdnZteC5jIGIveGVuL2FyY2gveDg2L2h2
bS92bXgvdnZteC5jCmluZGV4IDNkOTdhMjkzYjIuLjQ3ZWVlMWU1YjkgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9odm0vdm14L3Z2bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92dm14
LmMKQEAgLTEyODMsNiArMTI4Myw3IEBAIHN0YXRpYyB2b2lkIGxvYWRfdnZtY3NfaG9zdF9zdGF0
ZShzdHJ1Y3QgdmNwdSAqdikKIHN0YXRpYyB2b2lkIHN5bmNfZXhjZXB0aW9uX3N0YXRlKHN0cnVj
dCB2Y3B1ICp2KQogewogICAgIHN0cnVjdCBuZXN0ZWR2bXggKm52bXggPSAmdmNwdV8yX252bXgo
dik7CisgICAgdWludDMyX3QgZXhpdF9jdHJsID0gZ2V0X3Z2bWNzKHYsIFZNX0VYSVRfQ09OVFJP
TFMpOwogCiAgICAgaWYgKCAhKG52bXgtPmludHIuaW50cl9pbmZvICYgSU5UUl9JTkZPX1ZBTElE
X01BU0spICkKICAgICAgICAgcmV0dXJuOwpAQCAtMTI5NCw3ICsxMjk1LDggQEAgc3RhdGljIHZv
aWQgc3luY19leGNlcHRpb25fc3RhdGUoc3RydWN0IHZjcHUgKnYpCiAgICAgICAgIHNldF92dm1j
cyh2LCBWTV9FWElUX1JFQVNPTiwgRVhJVF9SRUFTT05fRVhURVJOQUxfSU5URVJSVVBUKTsKICAg
ICAgICAgc2V0X3Z2bWNzKHYsIEVYSVRfUVVBTElGSUNBVElPTiwgMCk7CiAgICAgICAgIHNldF92
dm1jcyh2LCBWTV9FWElUX0lOVFJfSU5GTywKLSAgICAgICAgICAgICAgICAgICAgbnZteC0+aW50
ci5pbnRyX2luZm8pOworICAgICAgICAgICAgICAgICAgKGV4aXRfY3RybCAmIFZNX0VYSVRfQUNL
X0lOVFJfT05fRVhJVCkgPyBudm14LT5pbnRyLmludHJfaW5mbworICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgOiAwKTsKICAgICAgICAgYnJl
YWs7CiAKICAgICBjYXNlIFg4Nl9FVkVOVFRZUEVfSFdfRVhDRVBUSU9OOgpAQCAtMTMyMCw3ICsx
MzIyLDcgQEAgc3RhdGljIHZvaWQgbnZteF91cGRhdGVfYXBpY3Yoc3RydWN0IHZjcHUgKnYpCiB7
CiAgICAgc3RydWN0IG5lc3RlZHZteCAqbnZteCA9ICZ2Y3B1XzJfbnZteCh2KTsKICAgICB1bnNp
Z25lZCBsb25nIHJlYXNvbiA9IGdldF92dm1jcyh2LCBWTV9FWElUX1JFQVNPTik7Ci0gICAgdWlu
dDMyX3QgaW50cl9pbmZvID0gZ2V0X3Z2bWNzKHYsIFZNX0VYSVRfSU5UUl9JTkZPKTsKKyAgICB1
aW50MzJfdCBpbnRyX2luZm8gPSBudm14LT5pbnRyLmludHJfaW5mbzsKIAogICAgIGlmICggcmVh
c29uID09IEVYSVRfUkVBU09OX0VYVEVSTkFMX0lOVEVSUlVQVCAmJgogICAgICAgICAgbnZteC0+
aW50ci5zb3VyY2UgPT0gaHZtX2ludHNyY19sYXBpYyAmJgotLSAKMi4yNS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
