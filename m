Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F356B6F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 15:59:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8Oz-0007Gf-3G; Wed, 26 Jun 2019 13:55:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8Ox-0007G8-QR
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:55:55 +0000
X-Inumbo-ID: 1d6c62cb-981a-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d6c62cb-981a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:55:54 +0000 (UTC)
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
IronPort-SDR: cRZtkgqxTwLoTcOfTfcc/fev5wBqxoXvXjd8/97SFJk+TQmOh85eOpzhxwDWnbMqAKDeqYySbO
 eRHZHtxSXblt391h1MQdCEQxaoVv/A+DpUlJMK4Tfub1hi1YlgpClgqiz2ob9RDxd9rs2A064O
 GoUb0IJfQxRCcMbTvnabzFqJUZmbvNKpfpnAWBen1p9Q1NZbMQ04+AaiJbw+0t6I1JBUga/OKp
 MjnBexAhMHaW/Ru2l13c7o4pkUZEqt91prAS40MMkJasIm8RQVk2YhgszxMYUAOzxtMpAakqu3
 KSA=
X-SBRS: 2.7
X-MesageID: 2265978
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2265978"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:42 +0200
Message-ID: <20190626135546.50665-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190626135546.50665-1-roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/5] make: simplify setting HOST{CC/CXX}
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5mZXIgdGhlIHZhbHVlcyBvZiBIT1NUe0NDL0NYWH0gZnJvbSBDQy9DWFggaWYgdW5zZXQsIGRv
IHRoaXMgaW4KU3RkR05VLm1rLCB0b2dldGhlciB3aXRoIHRoZSByZXN0IG9mIHRoZSB0b29sY2hh
aW4gdmFyaWFibGVzLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Ci0tLQpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KQ2M6
IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVn
YW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiBDb25maWcubWsg
ICAgICAgIHwgMTAgLS0tLS0tLS0tLQogY29uZmlnL1N0ZEdOVS5tayB8ICA0ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9Db25maWcubWsgYi9Db25maWcubWsKaW5kZXggNDE3MDM5ZDdmNi4uMWExY2MwOTg4MSAxMDA2
NDQKLS0tIGEvQ29uZmlnLm1rCisrKyBiL0NvbmZpZy5tawpAQCAtMzksMjIgKzM5LDEyIEBAIERF
U1RESVIgICAgID89IC8KICMgQWxsb3cgcGhvbnkgYXR0cmlidXRlIHRvIGJlIGxpc3RlZCBhcyBk
ZXBlbmRlbmN5IHJhdGhlciB0aGFuIGZha2UgdGFyZ2V0CiAuUEhPTlk6IC5waG9ueQogCi0jIElm
IHdlIGFyZSBub3QgY3Jvc3MtY29tcGlsaW5nLCBkZWZhdWx0IEhPU1RDe0MvWFh9IHRvIEN7Qy9Y
WH0KLWlmZXEgKCQoWEVOX1RBUkdFVF9BUkNIKSwgJChYRU5fQ09NUElMRV9BUkNIKSkKLUhPU1RD
QyA/PSAkKENDKQotSE9TVENYWCA/PSAkKENYWCkKLWVuZGlmCi0KICMgVXNlIENsYW5nL0xMVk0g
aW5zdGVhZCBvZiBHQ0M/CiBjbGFuZyA/PSBuCiBpZmVxICgkKGNsYW5nKSxuKQogZ2NjIDo9IHkK
LUhPU1RDQyA/PSBnY2MKLUhPU1RDWFggPz0gZysrCiBlbHNlCiBnY2MgOj0gbgotSE9TVENDID89
IGNsYW5nCi1IT1NUQ1hYID89IGNsYW5nKysKIGVuZGlmCiAKIERFUFNfSU5DTFVERSA9ICQoYWRk
c3VmZml4IC5kMiwgJChiYXNlbmFtZSAkKHdpbGRjYXJkICQoREVQUykpKSkKZGlmZiAtLWdpdCBh
L2NvbmZpZy9TdGRHTlUubWsgYi9jb25maWcvU3RkR05VLm1rCmluZGV4IDQ5MGViZGYyM2MuLjdi
N2RmZTA0NDAgMTAwNjQ0Ci0tLSBhL2NvbmZpZy9TdGRHTlUubWsKKysrIGIvY29uZmlnL1N0ZEdO
VS5tawpAQCAtOSw2ICs5LDEwIEBAIENDICAgICAgICA/PSAkKENST1NTX0NPTVBJTEUpZ2NjCiBD
WFggICAgICAgPz0gJChDUk9TU19DT01QSUxFKWcrKwogTERfTFRPICAgID89ICQoQ1JPU1NfQ09N
UElMRSlsZAogZW5kaWYKKworSE9TVENDICAgID89ICQoQ0MpCitIT1NUQ1hYICAgPz0gJChDWFgp
CisKIENQUCAgICAgICA/PSAkKENDKSAtRQogQVIgICAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlh
cgogUkFOTElCICAgID89ICQoQ1JPU1NfQ09NUElMRSlyYW5saWIKLS0gCjIuMjAuMSAoQXBwbGUg
R2l0LTExNykKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
