Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534704ED46
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 18:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heMYJ-0003mH-01; Fri, 21 Jun 2019 16:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heMYH-0003m0-RZ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 16:38:13 +0000
X-Inumbo-ID: f54d35c0-9442-11e9-848f-273a8269bcae
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f54d35c0-9442-11e9-848f-273a8269bcae;
 Fri, 21 Jun 2019 16:38:12 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: JMD/OlD/aWFhl74Tex+xROkN99/C65Z3bqweYVcj6r9BUoCDPY5D6KQpTeEP11rM7ynkQzWCnr
 UXndrn3BVaxGCXEx+waYkgKX/VeopGPsXWtY4bUvjBCYivnV8imLY+gftiobzuoYVnFPvAxBmF
 IkRsSRq/q1DuCb+wxyIRluOXD7zCQn1biFSEQjBgNQVgSsYiPg1Bf0egT5TBJCnzyRe3yzOiYO
 TNWbfZGmDma+f8Kd0iAgi6q6qASEsU5kRhzr1ugJI07SIL6QrBnp7NfafxkqeQngH46LVxOwC8
 i5E=
X-SBRS: 2.7
X-MesageID: 2093852
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,401,1557201600"; 
   d="scan'208";a="2093852"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 18:38:01 +0200
Message-ID: <20190621163802.29808-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190621163802.29808-1-roger.pau@citrix.com>
References: <20190621163802.29808-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 2/3] x86: check for multiboot{1,
 2} header presence
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgYnVpbGRpbmcgdGhlIGh5cGVydmlzb3IgYmluYXJ5LiBOb3RlIHRoYXQgdGhlIGNoZWNr
IGlzIHBlcmZvcm1lZApieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUgYXQg
dGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCkNoYW5nZXMgc2luY2UgdjE6CiAtIFVzZSBhbiBpbnRl
cm1lZGlhdGUgZmlsZSB0byBwZXJmb3JtIHRoZSBoZWFkZXIgY2hlY2tzLgotLS0KIHhlbi9hcmNo
L3g4Ni9NYWtlZmlsZSB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVu
L2FyY2gveDg2L01ha2VmaWxlCmluZGV4IDhhOGQ4ZjA2MGYuLjVjOTA4YzQ5ZTMgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC94ODYvTWFrZWZpbGUKQEAg
LTEwMCw4ICsxMDAsMTIgQEAgc3ltcy13YXJuLWR1cC15IDo9IC0td2Fybi1kdXAKIHN5bXMtd2Fy
bi1kdXAtJChDT05GSUdfU1VQUFJFU1NfRFVQTElDQVRFX1NZTUJPTF9XQVJOSU5HUykgOj0KIAog
JChUQVJHRVQpOiAkKFRBUkdFVCktc3ltcyAkKGVmaS15KSBib290L21rZWxmMzIKLQkuL2Jvb3Qv
bWtlbGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1H
X09GRlNFVCkgXAorCS4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1z
ICQoQEQpLy4kKEBGKSAkKFhFTl9JTUdfT0ZGU0VUKSBcCiAJICAgICAgICAgICAgICAgYCQoTk0p
ICQoVEFSR0VUKS1zeW1zIHwgc2VkIC1uZSAncy9eXChbXiBdKlwpIC4gX18yTV9yd2RhdGFfZW5k
JCQvMHhcMS9wJ2AKKwkjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFkZXJzCisJb2QgLXQg
eDQgLU4gODE5MiAkKEBEKS8uJChARikgfCBncmVwIDFiYWRiMDAyID4gL2Rldi9udWxsCisJb2Qg
LXQgeDQgLU4gMzI3NjggJChARCkvLiQoQEYpIHwgZ3JlcCBlODUyNTBkNiA+IC9kZXYvbnVsbAor
CW12ICQoQEQpLy4kKEBGKSAkKFRBUkdFVCkKIAogQUxMX09CSlMgOj0gJChCQVNFRElSKS9hcmNo
L3g4Ni9ib290L2J1aWx0X2luLm8gJChCQVNFRElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubyAk
KEFMTF9PQkpTKQogCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
