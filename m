Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244A018BB8E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:49:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExOf-0005y9-4N; Thu, 19 Mar 2020 15:47:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jExOe-0005xz-6O
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:47:48 +0000
X-Inumbo-ID: faafe1b6-69f8-11ea-b34e-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id faafe1b6-69f8-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 15:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584632868;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W9UNjxztVxtieJiPpRXnyo2aVKIiY15sG3BlUG99yOs=;
 b=d7q325VbU5gRrto1FV8ehIAUxidjIVF8K7C3+QXVJFrGCaJXpVjoeBGD
 YVO6+ALgt+XT9elorzKsGGdgCJcKiwWOaBfaTQ7kJ594KmKTUCxzPBG6+
 14rQk9PnPxLB0GW9a+tRsRKvZvZV1RaJRmEyBm7/kUOae04XZpePWNVbg A=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 6XTlyTS2FxeM4kHoEAMh4O7tPSScOAqSFJGnOsvIjx70to4CP+wUzthw1kUVIsFwuV/q6LZtdb
 EHoi3MNZ4vfYOFUomqcHqwRZVwK/If9K4VwK1RmgvjqWYg8qUk08AcPRkBCGysJ6RLMFCuMfnc
 kpvr3kDX4RHDvCSpkVQPtFEt2UMjcomwQ36BEfhd5x6Ax/7DymbF2O2HoxW9+PIy7jXthUStJ4
 /R1zG2BjyBofhIFep6/Bz7WP7YLXr+EbvRlEzaKye+yKw5EJWlY7/NcIJUPh8akb+NwhKuzqsw
 t38=
X-SBRS: 2.7
X-MesageID: 14287882
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14287882"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 16:47:16 +0100
Message-ID: <20200319154716.34556-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200319154716.34556-1-roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 3/3] x86/tlb: use Xen L0 assisted TLB flush
 when available
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

VXNlIFhlbidzIEwwIEhWTU9QX2ZsdXNoX3RsYnMgaHlwZXJjYWxsIGluIG9yZGVyIHRvIHBlcmZv
cm0gZmx1c2hlcy4KVGhpcyBncmVhdGx5IGluY3JlYXNlcyB0aGUgcGVyZm9ybWFuY2Ugb2YgVExC
IGZsdXNoZXMgd2hlbiBydW5uaW5nCndpdGggYSBoaWdoIGFtb3VudCBvZiB2Q1BVcyBhcyBhIFhl
biBndWVzdCwgYW5kIGlzIHNwZWNpYWxseSBpbXBvcnRhbnQKd2hlbiBydW5uaW5nIGluIHNoaW0g
bW9kZS4KClRoZSBmb2xsb3dpbmcgZmlndXJlcyBhcmUgZnJvbSBhIFBWIGd1ZXN0IHJ1bm5pbmcg
YG1ha2UgLWozMiB4ZW5gIGluCnNoaW0gbW9kZSB3aXRoIDMyIHZDUFVzIGFuZCBIQVAuCgpVc2lu
ZyB4MkFQSUMgYW5kIEFMTEJVVCBzaG9ydGhhbmQ6CnJlYWwJNG0zNS45NzNzCnVzZXIJNG0zNS4x
MTBzCnN5cwkzNm0yNC4xMTdzCgpVc2luZyBMMCBhc3Npc3RlZCBmbHVzaDoKcmVhbCAgICAxbTIu
NTk2cwp1c2VyICAgIDRtMzQuODE4cwpzeXMgICAgIDVtMTYuMzc0cwoKVGhlIGltcGxlbWVudGF0
aW9uIGFkZHMgYSBuZXcgaG9vayB0byBoeXBlcnZpc29yX29wcyBzbyBvdGhlcgplbmxpZ2h0ZW5t
ZW50cyBjYW4gYWxzbyBpbXBsZW1lbnQgc3VjaCBhc3Npc3RlZCBmbHVzaCBqdXN0IGJ5IGZpbGxp
bmcKdGhlIGhvb2suCgpOb3RlIHRoYXQgdGhlIFhlbiBpbXBsZW1lbnRhdGlvbiBjb21wbGV0ZWx5
IGlnbm9yZXMgdGhlIGRpcnR5IENQVSBtYXNrCmFuZCB0aGUgbGluZWFyIGFkZHJlc3MgcGFzc2Vk
IGluLCBhbmQgYWx3YXlzIHBlcmZvcm1zIGEgZ2xvYmFsIFRMQgpmbHVzaCBvbiBhbGwgdkNQVXMu
IFRoaXMgaXMgYSBsaW1pdGF0aW9uIG9mIHRoZSBoeXBlcmNhbGwgcHJvdmlkZWQgYnkKWGVuLiBB
bHNvIG5vdGUgdGhhdCBsb2NhbCBUTEIgZmx1c2hlcyBhcmUgbm90IHBlcmZvcm1lZCB1c2luZyB0
aGUKYXNzaXN0ZWQgVExCIGZsdXNoLCBvbmx5IHJlbW90ZSBvbmVzLgoKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgotLS0KQ2hhbmdlcyBzaW5jZSB2NToKIC0gQ2xhcmlmeSBjb21taXQgbWVzc2FnZS4KIC0g
VGVzdCBmb3IgYXNzaXN0ZWQgZmx1c2ggYXQgc2V0dXAsIGRvIHRoaXMgZm9yIGFsbCBoeXBlcnZp
c29ycy4KIC0gUmV0dXJuIEVPUE5PVFNVUFAgaWYgYXNzaXN0ZWQgZmx1c2ggaXMgbm90IGF2YWls
YWJsZS4KCkNoYW5nZXMgc2luY2UgdjQ6CiAtIEFkanVzdCBvcmRlciBjYWxjdWxhdGlvbi4KCkNo
YW5nZXMgc2luY2UgdjM6CiAtIFVzZSBhbiBhbHRlcm5hdGl2ZSBjYWxsIGZvciB0aGUgZmx1c2gg
aG9vay4KCkNoYW5nZXMgc2luY2UgdjE6CiAtIEFkZCBhIEwwIGFzc2lzdGVkIGhvb2sgdG8gaHlw
ZXJ2aXNvciBvcHMuCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyAgICAgICAg
fCAxNCArKysrKysrKysrKysrKwogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICAgICAg
ICAgfCAgNiArKysrKysKIHhlbi9hcmNoL3g4Ni9zbXAuYyAgICAgICAgICAgICAgICAgICAgIHwg
IDcgKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggfCAxNyAr
KysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnZpc29yLmMKaW5kZXggNjQ3Y2RiMTM2Ny4uZTQ2ZGU0MmRlZCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYworKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2aXNvci5jCkBAIC0xOCw2ICsxOCw3IEBACiAgKgogICogQ29weXJpZ2h0IChjKSAy
MDE5IE1pY3Jvc29mdC4KICAqLworI2luY2x1ZGUgPHhlbi9jcHVtYXNrLmg+CiAjaW5jbHVkZSA8
eGVuL2luaXQuaD4KICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KIApAQCAtNTEsNiArNTIsMTAgQEAg
dm9pZCBfX2luaXQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQogewogICAgIGlmICggb3BzLnNldHVw
ICkKICAgICAgICAgb3BzLnNldHVwKCk7CisKKyAgICAvKiBDaGVjayBpZiBhc3Npc3RlZCBmbHVz
aCBpcyBhdmFpbGFibGUgYW5kIGRpc2FibGUgdGhlIFRMQiBjbG9jayBpZiBzby4gKi8KKyAgICBp
ZiAoICFoeXBlcnZpc29yX2ZsdXNoX3RsYihjcHVtYXNrX29mKHNtcF9wcm9jZXNzb3JfaWQoKSks
IE5VTEwsIDApICkKKyAgICAgICAgdGxiX2Nsa19lbmFibGVkID0gZmFsc2U7CiB9CiAKIGludCBo
eXBlcnZpc29yX2FwX3NldHVwKHZvaWQpCkBAIC03Myw2ICs3OCwxNSBAQCB2b2lkIF9faW5pdCBo
eXBlcnZpc29yX2U4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiAgICAgICAgIG9wcy5l
ODIwX2ZpeHVwKGU4MjApOwogfQogCitpbnQgaHlwZXJ2aXNvcl9mbHVzaF90bGIoY29uc3QgY3B1
bWFza190ICptYXNrLCBjb25zdCB2b2lkICp2YSwKKyAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgb3JkZXIpCit7CisgICAgaWYgKCBvcHMuZmx1c2hfdGxiICkKKyAgICAgICAg
cmV0dXJuIGFsdGVybmF0aXZlX2NhbGwob3BzLmZsdXNoX3RsYiwgbWFzaywgdmEsIG9yZGVyKTsK
KworICAgIHJldHVybiAtRU9QTk9UU1VQUDsKK30KKwogLyoKICAqIExvY2FsIHZhcmlhYmxlczoK
ICAqIG1vZGU6IEMKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMgYi94
ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCmluZGV4IGU3NGZkMWU5OTUuLjNiYzAxYzg3MjMg
MTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMKKysrIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L3hlbi94ZW4uYwpAQCAtMzI0LDEyICszMjQsMTggQEAgc3RhdGljIHZvaWQgX19p
bml0IGU4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAgKmU4MjApCiAgICAgICAgIHB2X3NoaW1fZml4
dXBfZTgyMChlODIwKTsKIH0KIAorc3RhdGljIGludCBmbHVzaF90bGIoY29uc3QgY3B1bWFza190
ICptYXNrLCBjb25zdCB2b2lkICp2YSwgdW5zaWduZWQgaW50IG9yZGVyKQoreworICAgIHJldHVy
biB4ZW5faHlwZXJjYWxsX2h2bV9vcChIVk1PUF9mbHVzaF90bGJzLCBOVUxMKTsKK30KKwogc3Rh
dGljIGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBfX2luaXRjb25zdHJlbCBvcHMgPSB7CiAg
ICAgLm5hbWUgPSAiWGVuIiwKICAgICAuc2V0dXAgPSBzZXR1cCwKICAgICAuYXBfc2V0dXAgPSBh
cF9zZXR1cCwKICAgICAucmVzdW1lID0gcmVzdW1lLAogICAgIC5lODIwX2ZpeHVwID0gZTgyMF9m
aXh1cCwKKyAgICAuZmx1c2hfdGxiID0gZmx1c2hfdGxiLAogfTsKIAogY29uc3Qgc3RydWN0IGh5
cGVydmlzb3Jfb3BzICpfX2luaXQgeGdfcHJvYmUodm9pZCkKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9zbXAuYyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwppbmRleCBiY2VhZDVkMDFiLi4xZDlmZWM2
NWRlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc21wLmMKKysrIGIveGVuL2FyY2gveDg2L3Nt
cC5jCkBAIC0xNSw2ICsxNSw3IEBACiAjaW5jbHVkZSA8eGVuL3BlcmZjLmg+CiAjaW5jbHVkZSA8
eGVuL3NwaW5sb2NrLmg+CiAjaW5jbHVkZSA8YXNtL2N1cnJlbnQuaD4KKyNpbmNsdWRlIDxhc20v
Z3Vlc3QuaD4KICNpbmNsdWRlIDxhc20vc21wLmg+CiAjaW5jbHVkZSA8YXNtL21jMTQ2ODE4cnRj
Lmg+CiAjaW5jbHVkZSA8YXNtL2ZsdXNodGxiLmg+CkBAIC0yNjgsNiArMjY5LDEyIEBAIHZvaWQg
Zmx1c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVu
c2lnbmVkIGludCBmbGFncykKICAgICBpZiAoIChmbGFncyAmIH5GTFVTSF9PUkRFUl9NQVNLKSAm
JgogICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1hc2ssIGNwdW1hc2tfb2YoY3B1KSkgKQogICAg
IHsKKyAgICAgICAgaWYgKCBjcHVfaGFzX2h5cGVydmlzb3IgJiYKKyAgICAgICAgICAgICAhKGZs
YWdzICYgfihGTFVTSF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfAor
ICAgICAgICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spKSAmJgorICAgICAgICAg
ICAgICFoeXBlcnZpc29yX2ZsdXNoX3RsYihtYXNrLCB2YSwgKGZsYWdzIC0gMSkgJiBGTFVTSF9P
UkRFUl9NQVNLKSApCisgICAgICAgICAgICByZXR1cm47CisKICAgICAgICAgc3Bpbl9sb2NrKCZm
bHVzaF9sb2NrKTsKICAgICAgICAgY3B1bWFza19hbmQoJmZsdXNoX2NwdW1hc2ssIG1hc2ssICZj
cHVfb25saW5lX21hcCk7CiAgICAgICAgIGNwdW1hc2tfY2xlYXJfY3B1KGNwdSwgJmZsdXNoX2Nw
dW1hc2spOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29y
LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAppbmRleCBhZGUxMGU3
NGVhLi43N2ExZDIxODI0IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5
cGVydmlzb3IuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaApA
QCAtMTksNiArMTksOCBAQAogI2lmbmRlZiBfX1g4Nl9IWVBFUlZJU09SX0hfXwogI2RlZmluZSBf
X1g4Nl9IWVBFUlZJU09SX0hfXwogCisjaW5jbHVkZSA8eGVuL2NwdW1hc2suaD4KKwogI2luY2x1
ZGUgPGFzbS9lODIwLmg+CiAKIHN0cnVjdCBoeXBlcnZpc29yX29wcyB7CkBAIC0zMiw2ICszNCw4
IEBAIHN0cnVjdCBoeXBlcnZpc29yX29wcyB7CiAgICAgdm9pZCAoKnJlc3VtZSkodm9pZCk7CiAg
ICAgLyogRml4IHVwIGU4MjAgbWFwICovCiAgICAgdm9pZCAoKmU4MjBfZml4dXApKHN0cnVjdCBl
ODIwbWFwICplODIwKTsKKyAgICAvKiBMMCBhc3Npc3RlZCBUTEIgZmx1c2ggKi8KKyAgICBpbnQg
KCpmbHVzaF90bGIpKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVuc2ln
bmVkIGludCBvcmRlcik7CiB9OwogCiAjaWZkZWYgQ09ORklHX0dVRVNUCkBAIC00MSw2ICs0NSwx
NCBAQCB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCk7CiBpbnQgaHlwZXJ2aXNvcl9hcF9zZXR1
cCh2b2lkKTsKIHZvaWQgaHlwZXJ2aXNvcl9yZXN1bWUodm9pZCk7CiB2b2lkIGh5cGVydmlzb3Jf
ZTgyMF9maXh1cChzdHJ1Y3QgZTgyMG1hcCAqZTgyMCk7CisvKgorICogTDAgYXNzaXN0ZWQgVExC
IGZsdXNoLgorICogbWFzazogY3B1bWFzayBvZiB0aGUgZGlydHkgdkNQVXMgdGhhdCBzaG91bGQg
YmUgZmx1c2hlZC4KKyAqIHZhOiBsaW5lYXIgYWRkcmVzcyB0byBmbHVzaCwgb3IgTlVMTCBmb3Ig
Z2xvYmFsIGZsdXNoZXMuCisgKiBvcmRlcjogb3JkZXIgb2YgdGhlIGxpbmVhciBhZGRyZXNzIHBv
aW50ZWQgYnkgdmEuCisgKi8KK2ludCBoeXBlcnZpc29yX2ZsdXNoX3RsYihjb25zdCBjcHVtYXNr
X3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAorICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCBvcmRlcik7CiAKICNlbHNlCiAKQEAgLTUyLDYgKzY0LDExIEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBoeXBlcnZpc29yX3NldHVwKHZvaWQpIHsgQVNTRVJUX1VOUkVBQ0hBQkxFKCk7IH0K
IHN0YXRpYyBpbmxpbmUgaW50IGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCkgeyByZXR1cm4gMDsg
fQogc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3JfcmVzdW1lKHZvaWQpIHsgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2U4MjBfZml4dXAo
c3RydWN0IGU4MjBtYXAgKmU4MjApIHt9CitzdGF0aWMgaW5saW5lIGludCBoeXBlcnZpc29yX2Zs
dXNoX3RsYihjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGNvbnN0IHZvaWQgKnZhLAorICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG9yZGVyKQoreworICAg
IHJldHVybiAtRU9QTk9UU1VQUDsKK30KIAogI2VuZGlmICAvKiBDT05GSUdfR1VFU1QgKi8KIAot
LSAKMi4yNS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
