Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E34ED49
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 18:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heMYI-0003mB-M3; Fri, 21 Jun 2019 16:38:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GdIo=UU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1heMYH-0003lv-Bd
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 16:38:13 +0000
X-Inumbo-ID: f433f58e-9442-11e9-b447-2f4815867b3c
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f433f58e-9442-11e9-b447-2f4815867b3c;
 Fri, 21 Jun 2019 16:38:10 +0000 (UTC)
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
IronPort-SDR: BwyacdKED0TXF5Rn7D4mTnQk9vXr+7Vo9ht3E1nXJCVUrRLYor1xA6JS6JurH95Rq+UVsUICKs
 b7xt+Y32C2WyfmOtRUd2PkBn3e08JJQEqp8+6O3j781VDULhM1GkF6BdGLLnGHfsHWUgZ6jNbr
 ob/NXmtjgBEtUC4Ly54udoRusBfW+C2xoUmSxVfqME15o/t0hoYl0gdTTGH0f0V5Z4qpgXQuUX
 DEPwNUu55HeiUWTdkDpR6dKENbn2v1gAGrA+MtVWoRi/bXl18kBIRQdE3ZgOGnm55SK1ditRFe
 Mps=
X-SBRS: 2.7
X-MesageID: 2083135
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,401,1557201600"; 
   d="scan'208";a="2083135"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 21 Jun 2019 18:38:00 +0200
Message-ID: <20190621163802.29808-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190621163802.29808-1-roger.pau@citrix.com>
References: <20190621163802.29808-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/3] x86/linker: use DECL_SECTION uniformly
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

UmVwbGFjZSB0aGUgdHdvIG9wZW4tY29kZWQgRUZJIHJlbGF0ZWQgc2VjdGlvbiBkZWNsYXJhdGlv
bnMgd2l0aCB0aGUKdXNhZ2Ugb2YgREVDTF9TRUNUSU9OLiBUaGlzIGlzIGEgcHJlcGFyYXRvcnkg
Y2hhbmdlIGZvciBhbHNvIGFkZGluZyBhCnJlbG9jIHNlY3Rpb24gdG8gdGhlIEVMRiBiaW5hcnku
CgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
QWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpD
YzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVu
L2FyY2gveDg2L3hlbi5sZHMuUyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVuLmxkcy5T
IGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwppbmRleCBjYjQyZGM4ZmRhLi45OGE5OTQ0NGMyIDEw
MDY0NAotLS0gYS94ZW4vYXJjaC94ODYveGVuLmxkcy5TCisrKyBiL3hlbi9hcmNoL3g4Ni94ZW4u
bGRzLlMKQEAgLTI5OCwxMiArMjk4LDEyIEBAIFNFQ1RJT05TCiAKICNpZmRlZiBFRkkKICAgLiA9
IEFMSUdOKDQpOwotICAucmVsb2MgOiB7CisgIERFQ0xfU0VDVElPTigucmVsb2MpIHsKICAgICAq
KC5yZWxvYykKICAgfSA6dGV4dAogICAvKiBUcmljayB0aGUgbGlua2VyIGludG8gc2V0dGluZyB0
aGUgaW1hZ2Ugc2l6ZSB0byBleGFjdGx5IDE2TWIuICovCiAgIC4gPSBBTElHTihfX3NlY3Rpb25f
YWxpZ25tZW50X18pOwotICAucGFkIDogeworICBERUNMX1NFQ1RJT04oLnBhZCkgewogICAgIC4g
PSBBTElHTihNQigxNikpOwogICB9IDp0ZXh0CiAjZW5kaWYKLS0gCjIuMjAuMSAoQXBwbGUgR2l0
LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
