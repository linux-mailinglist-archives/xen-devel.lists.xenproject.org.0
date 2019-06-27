Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2100757F66
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 11:36:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgQmu-0000kl-NZ; Thu, 27 Jun 2019 09:33:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgQmt-0000kf-WE
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 09:33:52 +0000
X-Inumbo-ID: a9b6245c-98be-11e9-8d4e-8bef4bfdad5e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a9b6245c-98be-11e9-8d4e-8bef4bfdad5e;
 Thu, 27 Jun 2019 09:33:47 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TLP5W6zfC+VPF8QJa7rkyGraJh7ldJmNZX1lySeFl3/GJwS6SMBXUaVVdg2w1xSTTsI88+ibUp
 8WetgLFRnsB7W2fRUejmXX+0Mgrdq3lQzRzKR8c8jD6nwozn3o6sN9LSzd4HlRfB3M78NYx0HN
 hQ8JGrhqCssTnRFc9gwk31WfLNtAQHGjpVdXTiwrstFMMTtbbnkpgrCVrgiaa1ZwTSNC1Wa27U
 dTIEi6n/likHpNF5YmqyCcmc8TZt2IZgjrV4omn+nj0UO+i4c64daxxs2+NfuR3nlKPsLSBvoj
 IEA=
X-SBRS: 2.7
X-MesageID: 2316959
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2316959"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 27 Jun 2019 11:33:34 +0200
Message-ID: <20190627093335.56355-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190627093335.56355-1-roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 2/3] xen/link: handle .init.rodata.cst*
 sections in the linker script
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
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm90ZSB0aGF0IHRob3NlIHNlY3Rpb25zIHdoZW4gbm90IHByZWZpeGVkIHdpdGggLmluaXQgYXJl
IGFscmVhZHkKaGFuZGxlZCBieSB0aGUgbW9yZSBnZW5lcmFsIC5yb2RhdGEuKiBtYXRjaGluZyBw
YXR0ZXJuIGluIHRoZSAucm9kYXRhCm91dHB1dCBzZWN0aW9uLgoKU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgotLS0KIHhlbi9hcmNoL2FybS94ZW4ubGRzLlMgfCAxICsKIHhlbi9hcmNoL3g4Ni94
ZW4ubGRzLlMgfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL3hlbi5sZHMuUyBiL3hlbi9hcmNoL2FybS94ZW4ubGRzLlMKaW5k
ZXggZTY2NGM0NDQxYS4uYjYzNmQ5ZjIyMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3hlbi5s
ZHMuUworKysgYi94ZW4vYXJjaC9hcm0veGVuLmxkcy5TCkBAIC0xNTYsNiArMTU2LDcgQEAgU0VD
VElPTlMKICAgICAgICAqKC5pbml0LnJvZGF0YSkKICAgICAgICAqKC5pbml0LnJvZGF0YS5yZWwp
CiAgICAgICAgKiguaW5pdC5yb2RhdGEuc3RyKikKKyAgICAgICAqKC5pbml0LnJvZGF0YS5jc3Qq
KQogCiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwogICAgICAgIF9fc2V0dXBfc3Rh
cnQgPSAuOwpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKaW5kZXggMTlhYTQzMzJjZi4uZDBjN2ZiYzM3YiAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L3hlbi5sZHMuUworKysgYi94ZW4vYXJjaC94ODYveGVuLmxkcy5TCkBAIC0yMTYs
NiArMjE2LDcgQEAgU0VDVElPTlMKICAgICAgICAqKC5pbml0LnJvZGF0YSkKICAgICAgICAqKC5p
bml0LnJvZGF0YS5yZWwpCiAgICAgICAgKiguaW5pdC5yb2RhdGEuc3RyKikKKyAgICAgICAqKC5p
bml0LnJvZGF0YS5jc3QqKQogCiAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwogICAg
ICAgIF9fc2V0dXBfc3RhcnQgPSAuOwotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
