Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D610B10D79A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 16:07:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahox-0006VC-Il; Fri, 29 Nov 2019 15:04:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1wlA=ZV=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iahow-0006Um-Nj
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 15:04:34 +0000
X-Inumbo-ID: 865c0754-12b9-11ea-a55d-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 865c0754-12b9-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575039862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=R852eYJhxdmVkBNBQPl006OPOFvbNL/z64674CVTpkk=;
 b=GRQyhRV5j6eddiGJ/v7paQPm9jpMYhJyw+l5yTRSGO0+eF2z4y3LUetR
 wleZR/IUyZWb8ckSMf5JH+569A/YQm5w8uSIH21Rfct0uJcTerjad7jVH
 7S78WHQ0srWju7Yr/4XJ61T0hn0AJGqWiKGMjfJaa5sgbJGKDblUv6Ctq k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PU5nctucYoPYMnvCMaMQ+RUkyn0VuD9vtdRwMTAhrmlbGd8Kw4siwWYaaVin3kppwoy8xTqF4i
 OE0prLXupYnS7nh9M2Y837b8CUuB6tkoiU0me72xtR8XXZvOKd96UthB2Bn+yJqStEuFtGo3QM
 eiMjSCQ8Dmz2AMApNtO3G7O0+nQJmE9h0tUScyGybi99XKKcq34P1ojvLyukOxWKr1TASwCjDR
 iZt8aOj0bLbLFOj3vwDJmHqFssBKKxLXvNA3aXaPnKIpia6t0Lm+t/B65mJ57ACuvSrHrUzR4z
 hSQ=
X-SBRS: 2.7
X-MesageID: 8994772
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="8994772"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 15:04:12 +0000
Message-ID: <20191129150416.4944-6-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
References: <20191129150416.4944-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/9] release technician checklist: More explicit
 XEN_EXTRAVERSION
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gcGFydGljdWxhciwgc2F5IGNsZWFybHkgdGhhdCBYLlktdW5zdGFibGUgc2hvdWxkIGJlIHRo
dXMsIG5vdApYLlkuMC11bnN0YWJsZS4KCkNDOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29t
PgotLS0KIGRvY3MvcHJvY2Vzcy9yZWxlYXNlLXRlY2huaWNpYW4tY2hlY2tsaXN0LnR4dCB8IDYg
KysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0
IGIvZG9jcy9wcm9jZXNzL3JlbGVhc2UtdGVjaG5pY2lhbi1jaGVja2xpc3QudHh0CmluZGV4IGVi
ZjMzOGM5ZDQuLmY0YmVlNGVlMTMgMTAwNjQ0Ci0tLSBhL2RvY3MvcHJvY2Vzcy9yZWxlYXNlLXRl
Y2huaWNpYW4tY2hlY2tsaXN0LnR4dAorKysgYi9kb2NzL3Byb2Nlc3MvcmVsZWFzZS10ZWNobmlj
aWFuLWNoZWNrbGlzdC50eHQKQEAgLTU5LDcgKzU5LDExIEBAIHQ9UkVMRUFTRS0kcgogKiBjaGFu
Z2UgeGVuLXVuc3RhYmxlIHhlbi9NYWtlZmlsZSBYRU5fRVhUUkFWRVJTSU9OCiAjIGlmIG1haW4g
dmVyc2lvbiBudW1iZXIgaGFzIGNoYW5nZWQgKGVnIDQuNyAtPiA0LjgpIHJlcnVuIC4vYXV0b2dl
bi5zaAogKiByZXJ1biAuL2F1dG9nZW4uc2ggdG8gdXBkYXRlIHZlcnNpb24gbnVtYmVyIGluIGNv
bmZpZ3VyZQotIyAgICAtIFhFTl9FWFRSQVZFUlNJT04gc2hvdWxkIGJlIGAuMC1yYyQoWEVOX1ZF
TkRPUlZFUlNJT04pJworIyAgICAtIFhFTl9FWFRSQVZFUlNJT04gc2hvdWxkIGJlIGFzIGZvbGxv
d3MKKyMgICAgICBgLjAtcmMkKFhFTl9WRU5ET1JWRVJTSU9OKScgICAgICAgZHVyaW5nIGZyZWV6
ZSwgZmlyc3QgcmMgb253YXJkcyAoaW5jbHVkaW5nIHN0YWdpbmcsIGJlZm9yZSBicmFuY2hpbmcp
CisjICAgICAgYC11bnN0YWJsZSQoWEVOX1ZFTkRPUlZFUlNJT04pJyAgIHVuc3RhYmxlIGFrYSB1
bmZyb3plbiBzdGFnaW5nIChvciB1bnN0YWJsZSBicmFuY2gsIGFmdGVyIGJyYW5jaGluZykKKyMg
ICAgICBgLjAkKFhFTl9WRU5ET1JWRVJTSU9OKScgICAgICAgICAgYWN0dWFsIHJlbGVhc2Ugb2Yg
WGVuIFguWS4wIChha2EgZmlyc3QgYWN0dWFsIHJlbGVhc2Ugb2YgWGVuIFguWSkKKyMgICAgICBg
LlokKFhFTl9WRU5ET1JWRVJTSU9OKScgICAgICAgICAgYWN0dWFsIHJlbGVhc2Ugb2YgWGVuIFgu
WS5aIChzdGFibGUgcG9pbnQgcmVhbGFzZSkKICMKICMgICAgLSB0dXJuIG9mZiBkZWJ1ZyBvbiBz
dGFibGUgYnJhbmNoZXMsIGlmIG5vdCBhbHJlYWR5IGRvbmUKICMgICAgICAgICAgIC0gdG9vbHMv
UnVsZXMubWsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
