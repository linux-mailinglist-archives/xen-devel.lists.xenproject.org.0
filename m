Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BB47FDB1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:38:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZbK-00033g-Oc; Fri, 02 Aug 2019 15:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qji5=V6=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1htZbJ-00032y-It
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:36:13 +0000
X-Inumbo-ID: 3feb4f18-b53b-11e9-964a-6368ec9e1575
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3feb4f18-b53b-11e9-964a-6368ec9e1575;
 Fri, 02 Aug 2019 15:36:09 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: jFJBgI4oDbHIzUy6+Bp83BOFGKL/kf0++bUMXjrRW40iX4NmIjgTOUCNAcaVS7nincotfkE9+v
 KXPewQAOSxVSZoACj0w+4e0Q6+v2ITxsHx7+oCDZoYGx3XyoE2zFfHn6nlQntgqLmi/DQqyygt
 K4QNcueEm+7TxyKNXi6qDnbJ33sFWCYIdL7vTS62mJVt1Y/c+rQiipHt7Wnup4Y2+teELLumH6
 EA1pnBpP3D2CzHRh2jFRVnuBohR4Np0O/xnAbf35ucRovTgJn2S8TYZQrc4WbjJQ+3tymH9Ul3
 FEo=
X-SBRS: 2.7
X-MesageID: 3910073
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,338,1559534400"; 
   d="scan'208";a="3910073"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 2 Aug 2019 16:35:31 +0100
Message-ID: <20190802153606.32061-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/35] libxl refactoring to use ev_qmp (with API
 changes)
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiB0aGUgcXVlc3QgdG8gaGF2ZSBRRU1VIGRlcHJpdmlsZWRnZSwgd2UgbmVlZCB0byBt
YWtlIHF1aXRlIGEgZmV3IGNoYW5nZXMgdG8KbGlieGwuIFRoaXMgcGF0Y2ggc2VyaWVzIHJld29y
ayBxdWl0ZSBhIGZldyBsaWJ4bCBmZWF0dXJlIHRvIHVzZSBsaWJ4bF9fZXZfcW1wLAp3aGljaCBp
cyB0aGUgbmV3IGFzeW5jaHJvbm91cyB3YXkgb2YgY29tbXVuaWNhdGluZyB3aXRoIFFFTVUgaW4g
bGlieGwuCgpVbmZvcnR1bmF0ZWx5LCBzb21lIGxpYnhsIGZ1bmN0aW9ucyAoaW4gdGhlIHB1Ymxp
YyBBUEkpIGFyZSBzdXBwb3NlZCB0byBiZQpzeW5jaHJvbm91cyBidXQgYXJlIGNvbW11bmljYXRp
bmcgd2l0aCBRRU1VIGJlZm9yZSByZXR1cm5pbmcuIFNvIHRob3NlIGZ1bmN0aW9ucwphcmUgbWFk
ZSBhc3luY2hyb25vdXMgd2l0aCBhbiBhZGRpdGlvbmFsIHBhcmFtZXRlciBgbGlieGxfYXN5bmNv
cF9ob3cnLgoKRnVuY3Rpb25zIHRoYXQgYXJlIGNoYW5nZXM6CiAgICAtIGxpYnhsX2RvbWFpbl91
bnBhdXNlCiAgICAtIGxpYnhsX2RvbWFpbl9wYXVzZQogICAgLSBsaWJ4bF9zZW5kX3RyaWdnZXIK
ICAgIC0gbGlieGxfc2V0X3ZjcHVvbmxpbmUKICAgIC0gbGlieGxfcmV0cmlldmVfZG9tYWluX2Nv
bmZpZ3VyYXRpb24KICAgIC0gbGlieGxfcWVtdV9tb25pdG9yX2NvbW1hbmQKClRoaXMgc2VyaWVz
IGRlcGVuZHMgb24gYm90aDoKICAgIC0gW1BBVENIIHYyIDAvOV0gbGlieGw6IE5ldyBzbG93IGxv
Y2sgKyBmaXggbGlieGxfY2Ryb21faW5zZXJ0IHdpdGggUUVNVSBkZXByaXYKICAgIC0gW1BBVENI
IDAwLzE1XSBTb21lIGNsZWFudXAgb2YgbGlieGwKClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4g
dGhpcyBnaXQgYnJhbmNoOgpodHRwczovL3hlbmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUv
YXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJyLmxpYnhsLWV2X3FtcC1yZWZhY3RvcmluZy12MQoK
Q2hlZXJzLAoKQW50aG9ueSBQRVJBUkQgKDM1KToKICBsaWJ4bDogTWFrZSBsaWJ4bF9kb21haW5f
dW5wYXVzZSBhc3luYwogIGxpYnhsOiBNYWtlIGxpYnhsX3NlbmRfdHJpZ2dlciBhc3luYwogIGxp
YnhsOiBNYWtlIGxpYnhsX3NldF92Y3B1b25saW5lIGFzeW5jCiAgbGlieGw6IE1ha2UgbGlieGxf
cmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb24gYXN5bmMKICBsaWJ4bDogTWFrZSBsaWJ4bF9x
ZW11X21vbml0b3JfY29tbWFuZCBhc3luYwogIGxpYnhsOiBVc2UgZXZfcW1wIGZvciBzd2l0Y2hf
cWVtdV94ZW5fbG9nZGlydHkKICBsaWJ4bDogTW92ZSAicW1wX2luaXRpYWxpemF0aW9ucyIgdG8g
bGlieGxfZG0KICBsaWJ4bDogUmVwbGFjZSBsaWJ4bF9fcW1wX2luaXRpYWxpemF0aW9ucyBieSBl
dl9xbXAgY2FsbHMKICBsaWJ4bDogRGVwcmVjYXRlIGxpYnhsX19kb21haW5fe3VucGF1c2UscmVz
dW1lfQogIGxpYnhsOiBSZS1pbnRyb2R1Y2UgbGlieGxfX2RvbWFpbl9yZXN1bWUKICBsaWJ4bF9k
b21haW46IENvbnZlcnQgbGlieGxfZG9tYWluX3Jlc3VtZSB0byB1c2UgbGlieGxfX2RvbWFpbl9y
ZXN1bWUKICBsaWJ4bDogUmUtaW50cm9kdWNlIGxpYnhsX19kb21haW5fdW5wYXVzZQogIGxpYnhs
X2RtOiBVcGRhdGUgbGlieGxfX3NwYXduX3N0dWJfZG0gdG8gdXNlIGxpYnhsX19kb21haW5fdW5w
YXVzZQogIGxpYnhsX2RvbWFpbjogQ29udmVydCBsaWJ4bF9kb21haW5fdW5wYXVzZSB0byB1c2UK
ICAgIGxpYnhsX19kb21haW5fdW5wYXVzZQogIGxpYnhsOiBJbmxpbmUgZG9fdXNiZGV2X2FkZCBp
bnRvIGxpYnhsX19kZXZpY2VfdXNiZGV2X2FkZAogIGxpYnhsOiBJbmxpbmUgZG9fdXNiZGV2X3Jl
bW92ZSBpbnRvIGxpYnhsX19kZXZpY2VfdXNiZGV2X3JlbW92ZQogIGxpYnhsOiBBZGQgbGlieGxf
X2V2X3FtcCB0byBsaWJ4bF9fYW9fZGV2aWNlCiAgbGlieGw6IEFkZCBkZXZpY2Vfe2NvbmZpZyx0
eXBlfSB0byBsaWJ4bF9fYW9fZGV2aWNlCiAgbGlieGxfdXNiOiBNYWtlIGxpYnhsX19kZXZpY2Vf
dXNiY3RybF9hZGQgdXNlcyBldl9xbXAKICBsaWJ4bF91c2I6IE1ha2UgbGlieGxfX2luaXRpYXRl
X2RldmljZV91c2JjdHJsX3JlbW92ZSB1c2VzIGV2X3FtcAogIGxpYnhsX3VzYjogTWFrZSBsaWJ4
bF9fZGV2aWNlX3VzYmRldl9hZGQgdXNlcyBldl9xbXAKICBsaWJ4bDogVXNlIGFvZGV2IGZvciBs
aWJ4bF9fZGV2aWNlX3VzYmRldl9yZW1vdmUKICBsaWJ4bDogbGlieGxfX2luaXRpYXRlX2Rldmlj
ZV91c2JkZXZfcmVtb3ZlIG5vdyB1c2UgZXZfcW1wCiAgbGlieGw6IFJlbW92ZSBsaWJ4bF9fcW1w
X3J1bl9jb21tYW5kX2ZsZXhhcnJheQogIGxpYnhsX3BjaTogQ29kaW5nIHN0eWxlIG9mIGRvX3Bj
aV9hZGQKICBsaWJ4bF9wY2k6IE9ubHkgY2hlY2sgaWYgcWVtdS1kbSBpcyBydW5uaW5nIGluIHFl
bXUtdHJhZCBjYXNlCiAgbGlieGxfcGNpOiBVc2UgbGlieGxfX2FvX2RldmljZSB3aXRoIGxpYnhs
X19kZXZpY2VfcGNpX2FkZAogIGxpYnhsX3BjaTogVXNlIGV2X3FtcCBpbiBkb19wY2lfYWRkCiAg
bGlieGxfcGNpOiBVc2UgbGlieGxfX2FvX2RldmljZSB3aXRoIHBjaV9yZW1vdmUKICBsaWJ4bF9w
Y2k6IFVzZSBldl9xbXAgZm9yIHBjaV9yZW1vdmUKICBsaWJ4bDogVXNlIGV2X3FtcCBmb3IgbGli
eGxfc2VuZF90cmlnZ2VyCiAgbGlieGw6IFVzZSBldl9xbXAgaW4gbGlieGxfc2V0X3ZjcHVvbmxp
bmUKICBsaWJ4bDogRXh0cmFjdCBxbXBfcGFyc2VfcXVlcnlfY3B1cwogIGxpYnhsOiBsaWJ4bF9y
ZXRyaWV2ZV9kb21haW5fY29uZmlndXJhdGlvbiBub3cgdXNlcyBldl9xbXAKICBsaWJ4bDogbGli
eGxfcWVtdV9tb25pdG9yX2NvbW1hbmQgbm93IHVzZXMgZXZfcW1wCgogdG9vbHMvbGlieGwvbGli
eGwuaCAgICAgICAgICAgICAgfCAgNzcgKystCiB0b29scy9saWJ4bC9saWJ4bF9jb2xvX3Jlc3Rv
cmUuYyB8ICAgNCArLQogdG9vbHMvbGlieGwvbGlieGxfY29sb19zYXZlLmMgICAgfCAgIDQgKy0K
IHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgIHwgIDEwIC0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RldmljZS5jICAgICAgIHwgICAyICsKIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAg
ICAgIHwgMjM5ICsrKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9kb21fc2F2ZS5jICAgICB8ICA0
MSArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tX3N1c3BlbmQuYyAgfCAxOTggKysrKysrLQogdG9v
bHMvbGlieGwvbGlieGxfZG9tYWluLmMgICAgICAgfCA2MjcgKysrKysrKysrKysrKysrKy0tLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggICAgIHwgIDg2ICsrLQogdG9vbHMvbGlieGwv
bGlieGxfcGNpLmMgICAgICAgICAgfCA5NjYgKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LQogdG9vbHMvbGlieGwvbGlieGxfcW1wLmMgICAgICAgICAgfCA0NzEgKystLS0tLS0tLS0tLS0t
CiB0b29scy9saWJ4bC9saWJ4bF9yZW11cy5jICAgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwv
bGlieGxfdXNiLmMgICAgICAgICAgfCA1OTggKysrKysrKysrKysrKy0tLS0tLQogdG9vbHMveGwv
eGxfY3B1cG9vbC5jICAgICAgICAgICAgfCAgIDIgKy0KIHRvb2xzL3hsL3hsX2luZm8uYyAgICAg
ICAgICAgICAgIHwgICAzICstCiB0b29scy94bC94bF9taWdyYXRlLmMgICAgICAgICAgICB8ICAg
NCArLQogdG9vbHMveGwveGxfbWlzYy5jICAgICAgICAgICAgICAgfCAgIDYgKy0KIHRvb2xzL3hs
L3hsX3NhdmVyZXN0b3JlLmMgICAgICAgIHwgICA1ICstCiB0b29scy94bC94bF92Y3B1LmMgICAg
ICAgICAgICAgICB8ICAgMiArLQogdG9vbHMveGwveGxfdm1jb250cm9sLmMgICAgICAgICAgfCAg
MTMgKy0KIDIxIGZpbGVzIGNoYW5nZWQsIDI0MjcgaW5zZXJ0aW9ucygrKSwgOTMzIGRlbGV0aW9u
cygtKQoKLS0gCkFudGhvbnkgUEVSQVJECgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
