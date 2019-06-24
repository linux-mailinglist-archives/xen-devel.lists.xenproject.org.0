Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7D951A87
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:29:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTfC-0000P4-7m; Mon, 24 Jun 2019 18:25:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfTfA-0000Oz-Lf
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:25:56 +0000
X-Inumbo-ID: 80db020f-96ad-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 80db020f-96ad-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 18:25:54 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QaRaEBW1UxFuBvpseoQaodMNahbysXey52zFuwwQZQirAE/gBF5ZWm0IYxOHEtrvIZumuzwC+O
 1q8F4fClEi+EUYlzWtpL8A1yu6wXSv8EhclSTuWSvX4FWnMsHGpMpQD8Y309H75gVKtlrn0WSq
 bNxMrBFHo6UdlgUYG70qRuvqr2Thv/cW7Vy4Rf8mlbImp3Y7UP2kxb3z7/b0sF4xBuwv6kgW+o
 RNXyyiKzjhkCABLOc8uqSSKga5lJ4Q5AEQqisfawroqmxovnsKHUwoMQVzufACyAoIFEjqd3xh
 vrA=
X-SBRS: 2.7
X-MesageID: 2157980
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,413,1557201600"; 
   d="scan'208";a="2157980"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2019 19:25:46 +0100
Message-ID: <20190624182546.7661-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624101723.23291-2-andrew.cooper3@citrix.com>
References: <20190624101723.23291-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 1/2] x86/ubsan: Don't perform alignment
 checking on supporting compilers
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R0NDIDUgaW50cm9kdWNlZCAtZnNhbml0aXplPWFsaWdubWVudCB3aGljaCBpcyBlbmFibGVkIGJ5
IGRlZmF1bHQgYnkKQ09ORklHX1VCU0FOLiAgVGhpcyB0cmlwcyBhIGxvYWQgb2Ygd29udC1maXgg
Y2FzZXMgaW4gdGhlIEFDUEkgdGFibGVzIGFuZCB0aGUKaHlwZXJjYWxsIHBhZ2UgYW5kIHN0dWJz
IHdyaXRpbmcgbG9naWMuCgpJdCBhbHNvIGNhdXNlcyB0aGUgbmF0aXZlIFhlbiBib290IHRvIGNy
YXNoIGJlZm9yZSB0aGUgY29uc29sZSBpcyBzZXQgdXAsIGZvcgphbiBhcy15ZXQgdW5pZGVudGlm
aWVkIHJlYXNvbiAobW9zdCBsaWtsZXkgYSB3b250LWZpeCBjYXNlIGVhcmxpZXIgb24gYm9vdCku
CgpEaXNhYmxlIGFsaWdubWVudCBzYW5pdGlzYXRpb24gb24gY29tcGlsZXJzIHdoaWNoIHdvdWxk
IHRyeSB1c2luZyBpdC4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgpD
QzogV2VpIExpdSA8d2xAeGVuLm9yZz4KQ0M6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCnYyOgogKiBBdm9pZCB1
c2luZyAtZm5vLXNhbml0aXplPWFsaWdubWVudCBmb3IgQVJNCi0tLQogeGVuL1J1bGVzLm1rICAg
ICAgICAgIHwgNSArKysrLQogeGVuL2FyY2gveDg2L1J1bGVzLm1rIHwgNCArKysrCiAyIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBhMTUxYjNmNjI1Li5iZjgxNzM1YjhiIDEw
MDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0xMzgsNyArMTM4
LDEwIEBAICQoZmlsdGVyLW91dCAlLmluaXQubyAkKG5vY292LXkpLCQob2JqLXkpICQob2JqLWJp
bi15KSAkKGV4dHJhLXkpKTogQ0ZMQUdTICs9ICQoCiBlbmRpZgogCiBpZmVxICgkKENPTkZJR19V
QlNBTikseSkKLSQoZmlsdGVyLW91dCAlLmluaXQubyAkKG5vdWJzYW4teSksJChvYmoteSkgJChv
YmotYmluLXkpICQoZXh0cmEteSkpOiBDRkxBR1MgKz0gLWZzYW5pdGl6ZT11bmRlZmluZWQKK1VC
U0FOX0ZMQUdTICs9IC1mc2FuaXRpemU9dW5kZWZpbmVkCisjIEFueSAtZm5vLXNhbml0aXNlPSBv
cHRpb25zIG5lZWQgdG8gY29tZSBhZnRlciBhbnkgLWZzYW5pdGlzZT0gb3B0aW9ucworJChmaWx0
ZXItb3V0ICUuaW5pdC5vICQobm91YnNhbi15KSwkKG9iai15KSAkKG9iai1iaW4teSkgJChleHRy
YS15KSk6XAorQ0ZMQUdTICs9ICQoZmlsdGVyLW91dCAtZm5vLSUsJChVQlNBTl9GTEFHUykpICQo
ZmlsdGVyIC1mbm8tJSwkKFVCU0FOX0ZMQUdTKSkKIGVuZGlmCiAKIGlmZXEgKCQoQ09ORklHX0xU
TykseSkKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tayBiL3hlbi9hcmNoL3g4Ni9S
dWxlcy5tawppbmRleCBiYWJjMGVkYmNkLi4wMGQ4NjFjZjc2IDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvUnVsZXMubWsKKysrIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCkBAIC01Nyw2ICs1Nywx
MCBAQCBlbmRpZgogJChjYWxsIGNjLW9wdGlvbi1hZGQsQ0ZMQUdTLXN0YWNrLWJvdW5kYXJ5LEND
LC1tcHJlZmVycmVkLXN0YWNrLWJvdW5kYXJ5PTMpCiBDRkxBR1MgKz0gJChDRkxBR1Mtc3RhY2st
Ym91bmRhcnkpCiAKK2lmZXEgKCQoQ09ORklHX1VCU0FOKSx5KQorJChjYWxsIGNjLW9wdGlvbi1h
ZGQsVUJTQU5fRkxBR1MsQ0MsLWZuby1zYW5pdGl6ZT1hbGlnbm1lbnQpCitlbmRpZgorCiAjIFNl
dCB1cCB0aGUgYXNzZW1ibGVyIGluY2x1ZGUgcGF0aCBwcm9wZXJseSBmb3Igb2xkZXIgdG9vbGNo
YWlucy4KIENGTEFHUyArPSAtV2EsLUkkKEJBU0VESVIpL2luY2x1ZGUKIAotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
