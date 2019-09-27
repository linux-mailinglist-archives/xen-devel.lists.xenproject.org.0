Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45099C03B8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 12:52:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDnoH-0002K0-Op; Fri, 27 Sep 2019 10:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jwcO=XW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iDnoG-0002Ju-6Q
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 10:49:12 +0000
X-Inumbo-ID: 705007b6-e114-11e9-bf31-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by localhost (Halon) with ESMTPS
 id 705007b6-e114-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 10:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569581351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4WMGbJkM2W3PHvI5FBS2jC03Z72y36r8F1GBQvn8tCs=;
 b=CCW90O3DZFURg9GRlQ3+CVzOw3o3DOZ3t53NydlblJB3ecrVQ+KeCs+f
 P2YhsRIDkHm/LYiE+4zNxg9x+t8eZr7yIhjQIA8SnDevRIPsOoWBsqOYt
 USv9bp/9KZVXi/ODkUPhOPgTNsQIXqGQhIvVYGvHO4qCfEqk16WNispP9 o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Glbaq/sg9I8Ymi4L3aHZKtvSgEb7ESq4LRnLp8MnkuIgW4suRMHqMhWTdp1d6ksrHy8Q0cJ4hX
 SESKs4duOeOsp0LZ6hs4TU2cy6kehE+emfmV+9/zvRvB6/q2vMiiWWxBWzZg3HV8KAx1CDPVSQ
 huCejNyP/zXCE+H1lwZsqATGPkG3l1xiF86tAgw+CfeSxr0IcmXZjgf61OmdTJGDHG5CbkurVP
 9xMnprUomhOyNlGRZ2Hk0L/LGUiiBeauPz1a4hvP8vMyMjN3GBLLDIhmHPhLfMVN7jiil4daMf
 nPE=
X-SBRS: 2.7
X-MesageID: 6444143
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,555,1559534400"; 
   d="scan'208";a="6444143"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 27 Sep 2019 12:48:58 +0200
Message-ID: <20190927104858.43325-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/iommu: improve logging message
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
Cc: Juergen Gross <jgross@suse.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3dpdGNoIHRvIHVzaW5nIHBkIGFuZCBhbHNvIHByaW50IHRoZSBwZm4gdGhhdCBmYWlsZWQuCgpO
byBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3g4Ni9pb21tdS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9p
b21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKaW5kZXggNDdhM2U1
NTIxMy4uNzEwN2IxMTc1NyAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2
L2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMKQEAgLTIw
MCw4ICsyMDAsOCBAQCB2b2lkIF9faHdkb21faW5pdCBhcmNoX2lvbW11X2h3ZG9tX2luaXQoc3Ry
dWN0IGRvbWFpbiAqZCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJs
ZSB8IElPTU1VRl93cml0YWJsZSwgJmZsdXNoX2ZsYWdzKTsKIAogICAgICAgICBpZiAoIHJjICkK
LSAgICAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiIGQlZDogSU9NTVUgbWFwcGluZyBm
YWlsZWQ6ICVkXG4iLAotICAgICAgICAgICAgICAgICAgIGQtPmRvbWFpbl9pZCwgcmMpOworICAg
ICAgICAgICAgcHJpbnRrKFhFTkxPR19XQVJOSU5HICIlcGQ6IGlkZW50aXR5ICVzbWFwcGluZyBv
ZiAlbHggZmFpbGVkOiAlZFxuIiwKKyAgICAgICAgICAgICAgICAgICBkLCAhcGFnaW5nX21vZGVf
dHJhbnNsYXRlKGQpID8gIklPTU1VICIgOiAiIiwgcGZuLCByYyk7CiAKICAgICAgICAgaWYgKCEo
aSAmIDB4ZmZmZmYpKQogICAgICAgICAgICAgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7Ci0t
IAoyLjIzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
