Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F265145B61
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:27:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkKE-0007Qj-6n; Fri, 14 Jun 2019 11:24:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkKC-0007QI-AB
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:24:52 +0000
X-Inumbo-ID: 03f81786-8e97-11e9-a65f-bfcbe5e6fe01
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03f81786-8e97-11e9-a65f-bfcbe5e6fe01;
 Fri, 14 Jun 2019 11:24:47 +0000 (UTC)
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
IronPort-SDR: dFRvG8NeYf4AsrUA1cdehuyLisYUEe50IlZJwfdFtIR+bGqgKWUus3UxLcXEsFBfXWhNLZXgXs
 dyQqYHUWkI/MvXKdpajTM5hCWWuPBAsqAoCMdi4AXajRD+mIxnWayw/Ui3aLKpFvqA2TFSg2YL
 xWFkcNPENbjzDlmO7gF7rqCNpWWh06Xzq4BH0d7wsRA43GO1OlAcZlMd/zTAh/viQaz9+LdMyH
 Uz4f81wJh22xMMQdZSoyInD6sjWwsKUjH0TpxhVxcL7DpNaL2CvMTt+s9zgMENno5KHzfAtBRx
 FdU=
X-SBRS: 2.7
X-MesageID: 1737460
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737460"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:29 +0100
Message-ID: <20190614112444.29980-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 00/15] Some cleanup of libxl
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGlzIHNlcmllcyBjb250YWlucyBjbGVhbnVwIHBhdGNoZXMsIGFoZWFkIG9mIGEgc2Vy
aWVzIHRoYXQncyBnb2luZyB0byBtYWtlCm1vcmUgY2hhbmdlcyB0byBsaWJ4bC4KCkFudGhvbnkg
UEVSQVJEICgxNSk6CiAgbGlieGw6IFJlbmFtZSBzdHJ1Y3QgbGlieGxfZGV2aWNlX3R5cGUgdG8g
bGlieGxfX2RldmljZV90eXBlCiAgbGlieGw6IFJlbW92ZSB1bnVzZWQgdmFyaWFibGUgaW4gbGli
eGxfX2RldmljZV9wY2lfYWRkX3hlbnN0b3JlCiAgbGlieGxfcGNpOiBNYWtlIGxpYnhsX19jcmVh
dGVfcGNpX2JhY2tlbmQgc3RhdGljCiAgbGlieGxfcGNpOiBDb25zdGlmeSBhcmcgYHBjaWRldicg
b2YgbGlieGxfX2RldmljZV9wY2lfYWRkX3hlbnN0b3JlCiAgbGlieGxfcGNpOiBgc3RhcnRpbmcn
IGlzIGEgYm9vbAogIGxpYnhsX2RvbV9zYXZlOiBSZW9yZGVyIGZ1bmN0aW9ucyBmb3Igc3dpdGNo
X3FlbXVfbG9nZGlydHkKICBsaWJ4bF9kbTogRml4IGluaXRpYWxpc2F0aW9uIG9mIGxpYnhsX19z
dHViX2RtX3NwYXduX3N0YXRlCiAgbGlieGw6IENvbW1lbnQgbGlieGxfX2RtX3NwYXduX3N0YXRl
IGFib3VkIGluaXQgYW5kIGRpc3Bvc2UKICBsaWJ4bF9kb21haW46IENsZWFudXAgbGlieGxfX2Rl
c3Ryb3lfZG9taWQKICBsaWJ4bF91c2I6IFVzZSBwcm9wZXIgZG9taWQgdmFsdWUsIGZyb20gbGli
eGxfX2RldmljZQogIGxpYnhsX3VzYjogRml4IHdyb25nIHVzYWdlIG9mIGFzc2VydHMKICBsaWJ4
bF91c2I6IEZpeCBsaWJ4bF9kZXZpY2VfdXNiY3RybF9nZXRpbmZvCiAgbGlieGw6IENvbnN0aWZ5
IGxpYnhsX2RldmljZV8qIHBhcmFtIG9mICpfZ2V0aW5mbwogIGxpYnhsX3VzYjogdXNiY3RybCwg
bWFrZSB1c2Ugb2YgZ2VuZXJpYyBkZXZpY2UgaGFuZGxpbmcgZnVuY3Rpb25zCiAgbGlieGxfdXNi
OiBVc2UgdXNiY3RybCBpbnN0ZWFkIG9mIHVzYmN0cmxpbmZvCgogdG9vbHMvbGlieGwvbGlieGwu
aCAgICAgICAgICB8ICAxNiArLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NvbnNvbGUuYyAgfCAgIDIg
Ky0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgfCAgIDQgKy0KIHRvb2xzL2xpYnhsL2xp
YnhsX2RldmljZS5jICAgfCAgMTAgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2Rpc2suYyAgICAgfCAg
IDMgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgfCAgIDggKy0KIHRvb2xzL2xpYnhs
L2xpYnhsX2RvbV9zYXZlLmMgfCAxNjggKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
IHRvb2xzL2xpYnhsL2xpYnhsX2RvbWFpbi5jICAgfCAgMjAgKystLQogdG9vbHMvbGlieGwvbGli
eGxfaW50ZXJuYWwuYyB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaCB8ICA1
NiArKysrKy0tLS0tLQogdG9vbHMvbGlieGwvbGlieGxfbmljLmMgICAgICB8ICAgMyArLQogdG9v
bHMvbGlieGwvbGlieGxfcGNpLmMgICAgICB8ICAzOSArKysrLS0tLQogdG9vbHMvbGlieGwvbGli
eGxfdXNiLmMgICAgICB8IDE4MyArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
dG9vbHMvbGlieGwvbGlieGxfdmRpc3BsLmMgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxf
dmtiLmMgICAgICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfdnNuZC5jICAgICB8ICAgNCAr
LQogdG9vbHMvbGlieGwvbGlieGxfdnRwbS5jICAgICB8ICAgMiArLQogMTcgZmlsZXMgY2hhbmdl
ZCwgMjI3IGluc2VydGlvbnMoKyksIDI5NyBkZWxldGlvbnMoLSkKCi0tIApBbnRob255IFBFUkFS
RAoKClBhdGNoIHNlcmllcyBhdmFpbGFibGUgaW4gdGhpcyBnaXQgYnJhbmNoOgpodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXQtaHR0cC9wZW9wbGUvYXBlcmFyZC94ZW4tdW5zdGFibGUuZ2l0IGJy
LmxpYnhsLWNsZWFudXAtdjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
