Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DCA769F9
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:55:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0eN-0000Pb-Tl; Fri, 26 Jul 2019 13:52:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOBC=VX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hr0eM-0000PL-29
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:52:46 +0000
X-Inumbo-ID: a4a0800a-afac-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a4a0800a-afac-11e9-8980-bc764e045a96;
 Fri, 26 Jul 2019 13:52:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: OKs2pvRavWkmwp7WGSsyoF6l/864Cmu2tmefxmU6Ck2rKuv1/IIIyB2FhW+LtULi4LIchqPulm
 07kS5jMnxxGukStqUPu8jdHSaeZjx8Bz1uCC2GZQNC9J3d5BCEaqy7CNg8HMEyBOMM3TYTuYOW
 e2OUgWSQ+rk4BX6er5EGvqtZqSQZoGb9Z+mSYxsLmkb3a2N17LJTIaXDDejEEh50Xm3Xx1jh8y
 FiNELBbXpb0mTH9d/0ZLyxPRbqIdLOHbOoT0inErLGt5y/V2/ePD84GmDZC7hUDPwleZO+061p
 Nts=
X-SBRS: 2.7
X-MesageID: 3514944
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3514944"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 14:52:38 +0100
Message-ID: <20190726135240.21745-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 0/2] x86/xpti: Don't leak TSS-adjacent percpu
 data via Meltdown
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciAoMik6CiAgeGVuL2xpbms6IEludHJvZHVjZSAuYnNzLnBlcmNwdS5wYWdl
X2FsaWduZWQKICB4ODYveHB0aTogRG9uJ3QgbGVhayBUU1MtYWRqYWNlbnQgcGVyY3B1IGRhdGEg
dmlhIE1lbHRkb3duCgogeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICAgICB8IDUgKysrLS0K
IHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgfCAyIC0tCiB4ZW4vYXJjaC94ODYvdHJh
cHMuYyAgICAgICAgICAgIHwgNiArKysrKysKIHhlbi9hcmNoL3g4Ni94ZW4ubGRzLlMgICAgICAg
ICAgfCA3ICsrKysrLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYvcHJvY2Vzc29yLmggfCA0ICsrLS0K
IHhlbi9pbmNsdWRlL3hlbi9wZXJjcHUuaCAgICAgICAgfCAyICsrCiA2IGZpbGVzIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
