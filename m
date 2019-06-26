Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A2A56B71
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 16:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg8P1-0007Gs-D5; Wed, 26 Jun 2019 13:55:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ehih=UZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hg8P0-0007Gl-1F
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 13:55:58 +0000
X-Inumbo-ID: 1ef4f874-981a-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1ef4f874-981a-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 13:55:57 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qlWp7xHbmnB4IWU3oB0Yi7eatWbY0o1ZOiE2ik4huJaCcnj1PQclDi+3HomM3yrlgEdGfKf99I
 e8PdWYT2N1g/rDh4MH1rTelBJ6pUrtiyAiJ8Lf0lEyoyZL2pTavlgk4I/Ae5Hc9mbUPVogCUZO
 YHK2Aulk3TVD9tULT1HH1r/jC4t8RMUzG7CdV32fIqBT+WzdQHdi2/vcBE2RC7k2Mk2gIHwz5S
 DkjcigO59yRq0NiIDMH+UdKfdMyqItAhyTYrpiykrbYa9cD1SkSCC+/cAqjJ6BEnykTSZ7kAde
 NYA=
X-SBRS: 2.7
X-MesageID: 2262059
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,420,1557201600"; 
   d="scan'208";a="2262059"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Jun 2019 15:55:43 +0200
Message-ID: <20190626135546.50665-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190626135546.50665-1-roger.pau@citrix.com>
References: <20190626135546.50665-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/5] kconfig: don't pass ARCH and SRCARCH on the
 sub-make call
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

YW5kIGluc3RlYWQgZXhwb3J0IHRoZW0gZnJvbSB0aGUgdG9wLWxldmVsIFhlbiBtYWtlZmlsZS4K
ClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgot
LS0KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9y
Z2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8
aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CkNjOiBLb25yYWQg
Unplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9y
Zz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Ci0tLQogeGVuL01ha2VmaWxlIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS94ZW4vTWFrZWZpbGUgYi94ZW4vTWFrZWZpbGUKaW5kZXggYzgwOTE0YzMxZC4u
M2UzZDA4ZDFjYyAxMDA2NDQKLS0tIGEveGVuL01ha2VmaWxlCisrKyBiL3hlbi9NYWtlZmlsZQpA
QCAtMjEsOCArMjEsOCBAQCBNQUtFRkxBR1MgKz0gLXJSCiAKIEVGSV9NT1VOVFBPSU5UID89ICQo
Qk9PVF9ESVIpL2VmaQogCi1BUkNIPSQoWEVOX1RBUkdFVF9BUkNIKQotU1JDQVJDSD0kKHNoZWxs
IGVjaG8gJChBUkNIKSB8IHNlZCAtZSAncy94ODYuKi94ODYvJyAtZSBzJy9hcm1cKDMyXHw2NFwp
L2FybS9nJykKK2V4cG9ydCBBUkNIPSQoWEVOX1RBUkdFVF9BUkNIKQorZXhwb3J0IFNSQ0FSQ0g9
JChzaGVsbCBlY2hvICQoQVJDSCkgfCBzZWQgLWUgJ3MveDg2LioveDg2LycgLWUgcycvYXJtXCgz
Mlx8NjRcKS9hcm0vZycpCiAKICMgRG9uJ3QgYnJlYWsgaWYgdGhlIGJ1aWxkIHByb2Nlc3Mgd2Fz
bid0IGNhbGxlZCBmcm9tIHRoZSB0b3AgbGV2ZWwKICMgd2UgbmVlZCBYRU5fVEFSR0VUX0FSQ0gg
dG8gZ2VuZXJhdGUgdGhlIHByb3BlciBjb25maWcKQEAgLTI2NywxNCArMjY3LDE0IEBAIGtjb25m
aWcgOj0gc2lsZW50b2xkY29uZmlnIG9sZGNvbmZpZyBjb25maWcgbWVudWNvbmZpZyBkZWZjb25m
aWcgXAogCXJhbmRjb25maWcgJChub3RkaXIgJCh3aWxkY2FyZCBhcmNoLyQoU1JDQVJDSCkvY29u
Zmlncy8qX2RlZmNvbmZpZykpCiAuUEhPTlk6ICQoa2NvbmZpZykKICQoa2NvbmZpZyk6Ci0JJChN
QUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQo
QVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RDQz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhP
U1RDWFgpIiAkQAorCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxl
Lmtjb25maWcgSE9TVENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiICRACiAKIGlu
Y2x1ZGUvY29uZmlnLyUuY29uZjogaW5jbHVkZS9jb25maWcvYXV0by5jb25mLmNtZCAkKEtDT05G
SUdfQ09ORklHKQotCSQoTUFLRSkgLWYgJChCQVNFRElSKS90b29scy9rY29uZmlnL01ha2VmaWxl
Lmtjb25maWcgQVJDSD0kKEFSQ0gpIFNSQ0FSQ0g9JChTUkNBUkNIKSBIT1NUQ0M9IiQoSE9TVEND
KSIgSE9TVENYWD0iJChIT1NUQ1hYKSIgc2lsZW50b2xkY29uZmlnCisJJChNQUtFKSAtZiAkKEJB
U0VESVIpL3Rvb2xzL2tjb25maWcvTWFrZWZpbGUua2NvbmZpZyBIT1NUQ0M9IiQoSE9TVENDKSIg
SE9TVENYWD0iJChIT1NUQ1hYKSIgc2lsZW50b2xkY29uZmlnCiAKICMgQWxsb3cgcGVvcGxlIHRv
IGp1c3QgcnVuIGBtYWtlYCBhcyBiZWZvcmUgYW5kIG5vdCBmb3JjZSB0aGVtIHRvIGNvbmZpZ3Vy
ZQogJChLQ09ORklHX0NPTkZJRyk6Ci0JJChNQUtFKSAtZiAkKEJBU0VESVIpL3Rvb2xzL2tjb25m
aWcvTWFrZWZpbGUua2NvbmZpZyBBUkNIPSQoQVJDSCkgU1JDQVJDSD0kKFNSQ0FSQ0gpIEhPU1RD
Qz0iJChIT1NUQ0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBkZWZjb25maWcKKwkkKE1BS0UpIC1m
ICQoQkFTRURJUikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEhPU1RDQz0iJChIT1NU
Q0MpIiBIT1NUQ1hYPSIkKEhPU1RDWFgpIiBkZWZjb25maWcKIAogIyBCcmVhayB0aGUgZGVwZW5k
ZW5jeSBjaGFpbiBmb3IgdGhlIGZpcnN0IHJ1bgogaW5jbHVkZS9jb25maWcvYXV0by5jb25mLmNt
ZDogOwotLSAKMi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
