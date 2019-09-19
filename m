Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21467B7FDD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 19:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iB03V-0000yH-Sx; Thu, 19 Sep 2019 17:17:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vwgP=XO=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iB03T-0000xN-QW
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 17:17:19 +0000
X-Inumbo-ID: 5557c552-db01-11e9-978d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5557c552-db01-11e9-978d-bc764e2007e4;
 Thu, 19 Sep 2019 17:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568913439;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ci4smiWPFLzIWqPwqI6oXdI5XbyxyNL0fqXtc0wxQtU=;
 b=QNAI61cplfbyvm48sGXTcx1NmOip/B+jx6XJYb9d7/5yuHOvXZ26jyCH
 K37ENHjb/ETs1NreQWpXbiO/t9zKmiMjG004r0HJPncIII0DnFsujQRFC
 45tpZqTu+N2f1bU1ArQuRXJiY9nqDSBpxTfvCvPO5i781pV18018iaI13 g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: yqVm0W1SNhvKQan1WQOL8iWm/AqBMjbUAYaNc/qdGSIwQdoh/6Q7peHeAvx44F45py9C2WHjk4
 fohdmecBbMhwie21ecvPBWcnZ3IqroQ4kn0Xci6cugNnSV4w44souOiKv6AzUk6+K9YmSfJIP0
 x9S+UBwmqKwqktYo5wjTvUnSOItKeVvsfDPRyC16gzdTbBsglrKVDhmyjqKrXzbiiaLEkqhsrY
 I91WDbdR38+ZEUavgldV3plRioY8D2FTu6Wwc4ShvGodqpA+/R4TKpRrdsaPbmqSQ8OVSwEX0U
 SnM=
X-SBRS: 2.7
X-MesageID: 5800417
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,524,1559534400"; 
   d="scan'208";a="5800417"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Sep 2019 18:16:20 +0100
Message-ID: <20190919171656.899649-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/35] libxl refactoring to use ev_qmp (with
 API changes)
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2hlcyB3aXRoIG1pc3NpbmcgYWNrZXM6CiAgICBsaWJ4bDogVXNlIGV2X3FtcCBmb3Igc3dp
dGNoX3FlbXVfeGVuX2xvZ2RpcnR5CiAgICBsaWJ4bDogVXNlIGV2X3FtcCBpbiBsaWJ4bF9zZXRf
dmNwdW9ubGluZQogICAgbGlieGxfcGNpOiBFeHRyYWN0IGNvbW1vbiBwYXJ0IG9mICpxZW11X3Ry
YWRfd2F0Y2hfc3RhdGVfY2IKClRoZSBzZXJpZXMgZGVwZW5kcyBvbiAiU29tZSBjbGVhbnVwIG9m
IGxpYnhsIiBzZXJpZXMuClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNo
ICh3aGljaCBpcyBvbiB0b3Agb2YgdGhlIGJyYW5jaApici5saWJ4bC1jbGVhbnVwLXYyKToKaHR0
cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0LWh0dHAvcGVvcGxlL2FwZXJhcmQveGVuLXVuc3RhYmxl
LmdpdCBici5saWJ4bC1ldl9xbXAtcmVmYWN0b3JpbmctdjIKCkhpLAoKT24gdGhlIHF1ZXN0IHRv
IGhhdmUgUUVNVSBkZXByaXZpbGVkZ2UsIHdlIG5lZWQgdG8gbWFrZSBxdWl0ZSBhIGZldyBjaGFu
Z2VzIHRvCmxpYnhsLiBUaGlzIHBhdGNoIHNlcmllcyByZXdvcmsgcXVpdGUgYSBmZXcgbGlieGwg
ZmVhdHVyZSB0byB1c2UgbGlieGxfX2V2X3FtcCwKd2hpY2ggaXMgdGhlIG5ldyBhc3luY2hyb25v
dXMgd2F5IG9mIGNvbW11bmljYXRpbmcgd2l0aCBRRU1VIGluIGxpYnhsLgoKVW5mb3J0dW5hdGVs
eSwgc29tZSBsaWJ4bCBmdW5jdGlvbnMgKGluIHRoZSBwdWJsaWMgQVBJKSBhcmUgc3VwcG9zZWQg
dG8gYmUKc3luY2hyb25vdXMgYnV0IGFyZSBjb21tdW5pY2F0aW5nIHdpdGggUUVNVSBiZWZvcmUg
cmV0dXJuaW5nLiBTbyB0aG9zZSBmdW5jdGlvbnMKYXJlIG1hZGUgYXN5bmNocm9ub3VzIHdpdGgg
YW4gYWRkaXRpb25hbCBwYXJhbWV0ZXIgYGxpYnhsX2FzeW5jb3BfaG93Jy4KCiUgbGlieGwgQVBJ
IGNoYW5nZXMKCkZ1bmN0aW9ucyB0aGF0IGFyZSBjaGFuZ2VzOgogICAgLSBsaWJ4bF9kb21haW5f
dW5wYXVzZQogICAgLSBsaWJ4bF9kb21haW5fcGF1c2UKICAgIC0gbGlieGxfc2VuZF90cmlnZ2Vy
CiAgICAtIGxpYnhsX3NldF92Y3B1b25saW5lCiAgICAtIGxpYnhsX3JldHJpZXZlX2RvbWFpbl9j
b25maWd1cmF0aW9uCiAgICAtIGxpYnhsX3FlbXVfbW9uaXRvcl9jb21tYW5kCgolIFBhdGNoIHNl
cmllcyBkZXBlbmRlbmN5CgpUaGlzIHNlcmllcyBkZXBlbmRzIG9uOgogICAgLSBbUEFUQ0ggMDAv
MTVdIFNvbWUgY2xlYW51cCBvZiBsaWJ4bAogICAgICAoaXRzIHYyKQoKQ2hlZXJzLAoKQW50aG9u
eSBQRVJBUkQgKDM1KToKICBsaWJ4bDogTWFrZSBsaWJ4bF9kb21haW5fdW5wYXVzZSBhc3luYwog
IGxpYnhsOiBNYWtlIGxpYnhsX3NlbmRfdHJpZ2dlciBhc3luYwogIGxpYnhsOiBNYWtlIGxpYnhs
X3NldF92Y3B1b25saW5lIGFzeW5jCiAgbGlieGw6IE1ha2UgbGlieGxfcmV0cmlldmVfZG9tYWlu
X2NvbmZpZ3VyYXRpb24gYXN5bmMKICBsaWJ4bDogTWFrZSBsaWJ4bF9xZW11X21vbml0b3JfY29t
bWFuZCBhc3luYwogIGxpYnhsOiBVc2UgZXZfcW1wIGZvciBzd2l0Y2hfcWVtdV94ZW5fbG9nZGly
dHkKICBsaWJ4bDogTW92ZSAicW1wX2luaXRpYWxpemF0aW9ucyIgdG8gbGlieGxfZG0KICBsaWJ4
bDogUmVwbGFjZSBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBldl9xbXAgY2FsbHMKICBs
aWJ4bDogRGVwcmVjYXRlIGxpYnhsX19kb21haW5fe3VucGF1c2UscmVzdW1lfQogIGxpYnhsOiBS
ZS1pbnRyb2R1Y2UgbGlieGxfX2RvbWFpbl9yZXN1bWUKICBsaWJ4bF9kb21haW46IENvbnZlcnQg
bGlieGxfZG9tYWluX3Jlc3VtZSB0byB1c2UgbGlieGxfX2RvbWFpbl9yZXN1bWUKICBsaWJ4bDog
UmUtaW50cm9kdWNlIGxpYnhsX19kb21haW5fdW5wYXVzZQogIGxpYnhsX2RtOiBVcGRhdGUgbGli
eGxfX3NwYXduX3N0dWJfZG0gdG8gdXNlIGxpYnhsX19kb21haW5fdW5wYXVzZQogIGxpYnhsX2Rv
bWFpbjogQ29udmVydCBsaWJ4bF9kb21haW5fdW5wYXVzZSB0byB1c2UKICAgIGxpYnhsX19kb21h
aW5fdW5wYXVzZQogIGxpYnhsOiBJbmxpbmUgZG9fdXNiZGV2X2FkZCBpbnRvIGxpYnhsX19kZXZp
Y2VfdXNiZGV2X2FkZAogIGxpYnhsOiBJbmxpbmUgZG9fdXNiZGV2X3JlbW92ZSBpbnRvIGxpYnhs
X19kZXZpY2VfdXNiZGV2X3JlbW92ZQogIGxpYnhsOiBBZGQgbGlieGxfX2V2X3FtcCB0byBsaWJ4
bF9fYW9fZGV2aWNlCiAgbGlieGw6IEFkZCBkZXZpY2Vfe2NvbmZpZyx0eXBlfSB0byBsaWJ4bF9f
YW9fZGV2aWNlCiAgbGlieGxfdXNiOiBNYWtlIGxpYnhsX19kZXZpY2VfdXNiY3RybF9hZGQgdXNl
cyBldl9xbXAKICBsaWJ4bF91c2I6IE1ha2UgbGlieGxfX2luaXRpYXRlX2RldmljZV91c2JjdHJs
X3JlbW92ZSB1c2VzIGV2X3FtcAogIGxpYnhsX3VzYjogTWFrZSBsaWJ4bF9fZGV2aWNlX3VzYmRl
dl9hZGQgdXNlcyBldl9xbXAKICBsaWJ4bDogVXNlIGFvZGV2IGZvciBsaWJ4bF9fZGV2aWNlX3Vz
YmRldl9yZW1vdmUKICBsaWJ4bDogbGlieGxfX2luaXRpYXRlX2RldmljZV91c2JkZXZfcmVtb3Zl
IG5vdyB1c2UgZXZfcW1wCiAgbGlieGw6IFJlbW92ZSBsaWJ4bF9fcW1wX3J1bl9jb21tYW5kX2Zs
ZXhhcnJheQogIGxpYnhsX3BjaTogQ29kaW5nIHN0eWxlIG9mIGRvX3BjaV9hZGQKICBsaWJ4bF9w
Y2k6IE9ubHkgY2hlY2sgaWYgcWVtdS1kbSBpcyBydW5uaW5nIGluIHFlbXUtdHJhZCBjYXNlCiAg
bGlieGxfcGNpOiBVc2UgbGlieGxfX2FvX2RldmljZSB3aXRoIGxpYnhsX19kZXZpY2VfcGNpX2Fk
ZAogIGxpYnhsX3BjaTogVXNlIGV2X3FtcCBpbiBkb19wY2lfYWRkCiAgbGlieGxfcGNpOiBVc2Ug
bGlieGxfX2FvX2RldmljZSB3aXRoIHBjaV9yZW1vdmUKICBsaWJ4bF9wY2k6IFVzZSBldl9xbXAg
Zm9yIHBjaV9yZW1vdmUKICBsaWJ4bDogVXNlIGV2X3FtcCBmb3IgbGlieGxfc2VuZF90cmlnZ2Vy
CiAgbGlieGw6IFVzZSBldl9xbXAgaW4gbGlieGxfc2V0X3ZjcHVvbmxpbmUKICBsaWJ4bDogbGli
eGxfcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb24gbm93IHVzZXMgZXZfcW1wCiAgbGlieGw6
IGxpYnhsX3FlbXVfbW9uaXRvcl9jb21tYW5kIG5vdyB1c2VzIGV2X3FtcAogIGxpYnhsX3BjaTog
RXh0cmFjdCBjb21tb24gcGFydCBvZiAqcWVtdV90cmFkX3dhdGNoX3N0YXRlX2NiCgogdG9vbHMv
bGlieGwvbGlieGwuaCAgICAgICAgICAgICAgfCAgOTIgKystCiB0b29scy9saWJ4bC9saWJ4bF9j
b2xvX3Jlc3RvcmUuYyB8ICAgNCArLQogdG9vbHMvbGlieGwvbGlieGxfY29sb19zYXZlLmMgICAg
fCAgIDQgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgIHwgIDEwIC0KIHRvb2xz
L2xpYnhsL2xpYnhsX2RldmljZS5jICAgICAgIHwgICAyICsKIHRvb2xzL2xpYnhsL2xpYnhsX2Rt
LmMgICAgICAgICAgIHwgMjM5ICsrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9kb21fc2F2ZS5j
ICAgICB8ICA0MSArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyAgfCAxOTggKysr
KysrLQogdG9vbHMvbGlieGwvbGlieGxfZG9tYWluLmMgICAgICAgfCA2MjcgKysrKysrKysrKysr
KysrKy0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggICAgIHwgIDkwICsrLQogdG9v
bHMvbGlieGwvbGlieGxfcGNpLmMgICAgICAgICAgfCA5NzYgKysrKysrKysrKysrKysrKysrKysr
KysrKystLS0tLQogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgICAgICAgICAgfCA0NzEgKystLS0t
LS0tLS0tLS0tCiB0b29scy9saWJ4bC9saWJ4bF9yZW11cy5jICAgICAgICB8ICAgMiArLQogdG9v
bHMvbGlieGwvbGlieGxfdXNiLmMgICAgICAgICAgfCA1OTggKysrKysrKysrKysrKy0tLS0tLQog
dG9vbHMveGwveGxfY3B1cG9vbC5jICAgICAgICAgICAgfCAgIDIgKy0KIHRvb2xzL3hsL3hsX2lu
Zm8uYyAgICAgICAgICAgICAgIHwgICAzICstCiB0b29scy94bC94bF9taWdyYXRlLmMgICAgICAg
ICAgICB8ICAgNCArLQogdG9vbHMveGwveGxfbWlzYy5jICAgICAgICAgICAgICAgfCAgIDYgKy0K
IHRvb2xzL3hsL3hsX3NhdmVyZXN0b3JlLmMgICAgICAgIHwgICA1ICstCiB0b29scy94bC94bF92
Y3B1LmMgICAgICAgICAgICAgICB8ICAgMiArLQogdG9vbHMveGwveGxfdm1jb250cm9sLmMgICAg
ICAgICAgfCAgMTMgKy0KIDIxIGZpbGVzIGNoYW5nZWQsIDI0NTYgaW5zZXJ0aW9ucygrKSwgOTMz
IGRlbGV0aW9ucygtKQoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
