Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4139D2D79
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:16:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIa61-0006Cb-NM; Thu, 10 Oct 2019 15:11:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubId=YD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIa60-0006CV-KQ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:11:16 +0000
X-Inumbo-ID: 3424cae0-eb70-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3424cae0-eb70-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 15:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570720276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Z2wcBcBGG/Y/drK4rHShO5xZz9+eTKQjLFNrm0BeVIw=;
 b=Kw10H54xHrriUVszN5hPqdyexS0kiPoaYRwDNFWM9YTznQm+cUtKvJdj
 eGbYJn4SyLi73hbvtHdHgiXHj9pMzybqnIWmew62JeNYisKnB11pE6up/
 kbhrwKybef5TmX/aCy41KFPlJW+4NU55V6AILFro/721K6NTUBPLwsowt E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4XJt8Xly9RFP+y0wluR8g8rj6o/d5LUw+IOreJv7nA4at3LiylDrsFtdA7TLP9998GC/JNfjGY
 SpfnftHB8A1p8SwGzDDnvt07EdjJYK9DH4rnsz5SolGkl5o2Nnp0kvV+BJz+ENHwDiby5qkH0B
 bTl1W39VxybEp1k/8zrOd4EK1Je/qAokF3PiJtfWgDE9ko69FVB9NBkDQ9pJAw6Lc57Q+g5KIT
 AmyrxZ5chzOmcHZ83aYA0BOtLVuvKa/LuuC+zo8kB2NDzhb1t8WvLM4zL1MaxWHzrmCIHKsniu
 qhU=
X-SBRS: 2.7
X-MesageID: 7110087
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="7110087"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 16:11:03 +0100
Message-ID: <20191010151111.22125-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 1/9] libxl: Offer API versions
 0x040700 and 0x040800
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWNjb3JkaW5nIHRvIGdpdCBsb2cgLUc6CgoweDA0MDcwMCB3YXMgaW50cm9kdWNlZCBpbiAzMDQ0
MDA0NTllZjAgKGFrYSA0LjcuMC1yYzF+NDgxKQogICJ0b29scy9saWJ4bDogcmVuYW1lIHJlbXVz
IGRldmljZSB0byBjaGVja3BvaW50IGRldmljZSIKCjB4MDQwODAwIHdhcyBpbnRyb2R1Y2VkIGlu
IDU3ZjhiMTNjNzI0MCAoYWthIDQuOC4wLXJjMX40MzcpCiAgImxpYnhsOiBtZW1vcnkgc2l6ZSBp
biBrYiByZXF1aXJlcyA2NCBiaXQgdmFyaWFibGUiCgpJdCBpcyBzdXJwcmlzaW5nIHRoYXQgbm8t
b25lIG5vdGljZWQgdGhpcy4KCkFueXdheSwgaW4gdGhlIG1lYW50aW1lLCB3ZSBzaG91bGQgZml4
IGl0LiAgQmFja3BvcnRpbmcgdGhpcyBpcwpwcm9iYWJseSBhIGdvb2QgaWRlYTogaXQgd29uJ3Qg
Y2hhbmdlIHRoZSBiZWhhdmlvdXIgZm9yIGV4aXN0aW5nCmNhbGxlcnMgYnV0IGl0IHdpbGwgYXZv
aWQgZXJyb3JzIGZvciBzb21lIG9sZGVyIGNvcnJlY3QgdXNlcy4KClNpZ25lZC1vZmYtYnk6IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpBY2tlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQp2MjogQWRqdXN0ZWQgY29tbWl0
IG1lc3NhZ2Ugc2xpZ2h0bHkuCi0tLQogdG9vbHMvbGlieGwvbGlieGwuaCB8IDEgKwogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwu
aCBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKaW5kZXggMjU1NWU5Y2QzYi4uNTE4ZmM5ZTQ3ZiAxMDA2
NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGwuaAorKysgYi90b29scy9saWJ4bC9saWJ4bC5oCkBA
IC02NTUsNiArNjU1LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgbGlieGxfX2N0eCBsaWJ4bF9jdHg7CiAj
aWZkZWYgTElCWExfQVBJX1ZFUlNJT04KICNpZiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDIw
MCAmJiBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MDMwMCAmJiBcCiAgICAgTElCWExfQVBJX1ZF
UlNJT04gIT0gMHgwNDA0MDAgJiYgTElCWExfQVBJX1ZFUlNJT04gIT0gMHgwNDA1MDAgJiYgXAor
ICAgIExJQlhMX0FQSV9WRVJTSU9OICE9IDB4MDQwNzAwICYmIExJQlhMX0FQSV9WRVJTSU9OICE9
IDB4MDQwODAwICYmIFwKICAgICBMSUJYTF9BUElfVkVSU0lPTiAhPSAweDA0MTMwMAogI2Vycm9y
IFVua25vd24gTElCWExfQVBJX1ZFUlNJT04KICNlbmRpZgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
