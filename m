Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E866116FE06
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 12:43:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6v3r-0002rs-0b; Wed, 26 Feb 2020 11:41:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GoNq=4O=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j6v3p-0002rk-PJ
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 11:41:05 +0000
X-Inumbo-ID: dec9d466-588c-11ea-93ff-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dec9d466-588c-11ea-93ff-12813bfff9fa;
 Wed, 26 Feb 2020 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582717264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nrEK9P6/8xswePeoj0IWg66RRPf92+1H6bnWQ10Bt1E=;
 b=YKFtydLVgs8CHKN2HsDSUuBFHNwwAD6qtB1wh8y9p/SPgbp4377eoOZD
 ivYvWJmPM9yfCBdvQPUsLS3PR0eximbq9KoUzkusMRqhaB8alYboYB9dS
 hOwEXdIDnGhA2u0fzQVXzRq1OlLLNj0wX4D44+msjN9WwdUPTQQ3VKVc5 8=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pBEDIBz/kwclyxMwwIbkB4SPUejcjmGWqaFp4cGTY1kNlfqtVoYTuCWu4dpSRsULmf28R/y0GA
 d7SMNiMWd09pPwXn7gSWf2IXoq9ue7pgU09xB6slPLJicXTp8ZrSlZpleY/uT54GyNO2lDgZmo
 iok1swtRZtxd9zljEYc56l044Jx1sy4QE9kLStnHIn2Kk8v2d378237sOrs7ULnSpfY/Cidvnt
 xF4zeypg8bfEzFP/opzclEWNIQvkzoJhAfZBS1rYSjT8dWoPRYjm2w091H2PJoOuNchzhMntlr
 fdc=
X-SBRS: 2.7
X-MesageID: 13462008
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,487,1574139600"; d="scan'208";a="13462008"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 26 Feb 2020 11:33:52 +0000
Message-ID: <20200226113355.2532224-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200226113355.2532224-1-anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v3 20/23] xen/build: factorise generation of
 the linker scripts
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gQXJtIGFuZCBYODYgbWFrZWZpbGUsIGdlbmVyYXRpbmcgdGhlIGxpbmtlciBzY3JpcHQgaXMg
dGhlIHNhbWUsIHNvCndlIGNhbiBzaW1wbHkgaGF2ZSBib3RoIGNhbGwgdGhlIHNhbWUgbWFjcm8u
CgpXZSBuZWVkIHRvIGFkZCAqLmxkcyBmaWxlcyBpbnRvIGV4dHJhLXkgc28gdGhhdCBSdWxlcy5t
ayBjYW4gZmluZCB0aGUKLiouY21kIGRlcGVuZGVuY3kgZmlsZSBhbmQgbG9hZCBpdC4KClNpZ25l
ZC1vZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgotLS0K
IHhlbi9SdWxlcy5tayAgICAgICAgICB8IDggKysrKysrKysKIHhlbi9hcmNoL2FybS9NYWtlZmls
ZSB8IDUgKystLS0KIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSB8IDYgKysrLS0tCiAzIGZpbGVzIGNo
YW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVu
L1J1bGVzLm1rIGIveGVuL1J1bGVzLm1rCmluZGV4IDhjN2RiYTkyMTFkMS4uMDJjZDM3ZDA0MDU0
IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0yMzAsNiAr
MjMwLDE0IEBAIGNtZF9zX1MgPSAkKENQUCkgJChmaWx0ZXItb3V0IC1XYSQoY29tbWEpJSwkKGFf
ZmxhZ3MpKSAkPCAtbyAkQAogJS5zOiAlLlMgRk9SQ0UKIAkkKGNhbGwgaWZfY2hhbmdlZCxjcHBf
c19TKQogCisjIExpbmtlciBzY3JpcHRzLCAubGRzLlMgLT4gLmxkcworcXVpZXRfY21kX2NjX2xk
c19TID0gTERTICAgICAkQAorZGVmaW5lIGNtZF9jY19sZHNfUworICAgICQoQ0MpIC1QIC1FIC1V
aTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21tYSklLCQoYV9mbGFncykpIC1vICRAICQ8OyBcCisg
ICAgc2VkIC1lICdzLy4qXC5sZHNcLm86LyQoQEYpOi9nJyA8JChkb3QtdGFyZ2V0KS5kID4kKGRv
dC10YXJnZXQpLmQubmV3OyBcCisgICAgbXYgLWYgJChkb3QtdGFyZ2V0KS5kLm5ldyAkKGRvdC10
YXJnZXQpLmQKK2VuZGVmCisKICMgQWRkIGludGVybWVkaWF0ZSB0YXJnZXRzOgogIyBXaGVuIGJ1
aWxkaW5nIG9iamVjdHMgd2l0aCBzcGVjaWZpYyBzdWZmaXggcGF0dGVybnMsIGFkZCBpbnRlcm1l
ZGlhdGUKICMgdGFyZ2V0cyB0aGF0IHRoZSBmaW5hbCB0YXJnZXRzIGFyZSBkZXJpdmVkIGZyb20u
CmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vTWFrZWZp
bGUKaW5kZXggMzdjYTZkMjVjMDhlLi5iM2VlNGFkYjlhYzQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9NYWtlZmlsZQorKysgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUKQEAgLTEyNCw5ICsxMjQs
OCBAQCBhc20tb2Zmc2V0cy5zOiAkKFRBUkdFVF9TVUJBUkNIKS9hc20tb2Zmc2V0cy5jCiAJJChD
QykgJChmaWx0ZXItb3V0IC1mbHRvLCQoY19mbGFncykpIC1TIC1vICRAICQ8CiAKIHhlbi5sZHM6
IHhlbi5sZHMuUwotCSQoQ0MpIC1QIC1FIC1VaTM4NiAkKGFfZmxhZ3MpIC1vICRAICQ8Ci0Jc2Vk
IC1lICdzL3hlblwubGRzXC5vOi94ZW5cLmxkczovZycgPC54ZW4ubGRzLmQgPi54ZW4ubGRzLmQu
bmV3Ci0JbXYgLWYgLnhlbi5sZHMuZC5uZXcgLnhlbi5sZHMuZAorCSQoY2FsbCBpZl9jaGFuZ2Vk
LGNjX2xkc19TKQorZXh0cmEteSArPSB4ZW4ubGRzCiAKIGR0Yi5vOiAkKENPTkZJR19EVEJfRklM
RSkKIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01h
a2VmaWxlCmluZGV4IDZmYjZjYWZkZjQ3Yi4uMWJlOTQ4NDZlMTFmIDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCkBAIC03NSw2ICs3
NSw3IEBAIG9iai15ICs9IGhwZXQubwogb2JqLXkgKz0gdm1fZXZlbnQubwogb2JqLXkgKz0geHN0
YXRlLm8KIGV4dHJhLXkgKz0gYXNtLW1hY3Jvcy5pCitleHRyYS15ICs9IHhlbi5sZHMKIAogeDg2
X2VtdWxhdGUubzogeDg2X2VtdWxhdGUveDg2X2VtdWxhdGUuYyB4ODZfZW11bGF0ZS94ODZfZW11
bGF0ZS5oCiAKQEAgLTE5Nyw2ICsxOTgsNyBAQCBlbmRpZgogbm90ZV9maWxlX29wdGlvbiA/PSAk
KG5vdGVfZmlsZSkKIAogaWZlcSAoJChYRU5fQlVJTERfUEUpLHkpCitleHRyYS15ICs9IGVmaS5s
ZHMKICQoVEFSR0VUKS5lZmk6IHByZWxpbmstZWZpLm8gJChub3RlX2ZpbGUpIGVmaS5sZHMgZWZp
L3JlbG9jcy1kdW1teS5vIGVmaS9ta3JlbG9jCiAJJChmb3JlYWNoIGJhc2UsICQoVklSVF9CQVNF
KSAkKEFMVF9CQVNFKSwgXAogCSAgICAgICAgICAkKExEKSAkKGNhbGwgRUZJX0xERkxBR1MsJChi
YXNlKSkgLVQgZWZpLmxkcyAtTiAkPCBlZmkvcmVsb2NzLWR1bW15Lm8gXApAQCAtMjQ0LDkgKzI0
Niw3IEBAICQoQkFTRURJUikvaW5jbHVkZS9hc20teDg2L2FzbS1tYWNyb3MuaDogYXNtLW1hY3Jv
cy5pIE1ha2VmaWxlCiAKIGVmaS5sZHM6IEFGTEFHUy15ICs9IC1ERUZJCiB4ZW4ubGRzIGVmaS5s
ZHM6IHhlbi5sZHMuUwotCSQoQ0MpIC1QIC1FIC1VaTM4NiAkKGZpbHRlci1vdXQgLVdhJChjb21t
YSklLCQoYV9mbGFncykpIC1vICRAICQ8Ci0Jc2VkIC1lICdzLy4qXC5sZHNcLm86LyQoQEYpOi9n
JyA8LiQoQEYpLmQgPi4kKEBGKS5kLm5ldwotCW12IC1mIC4kKEBGKS5kLm5ldyAuJChARikuZAor
CSQoY2FsbCBpZl9jaGFuZ2VkLGNjX2xkc19TKQogCiBib290L21rZWxmMzI6IGJvb3QvbWtlbGYz
Mi5jCiAJJChIT1NUQ0MpICQoSE9TVENGTEFHUykgLW8gJEAgJDwKLS0gCkFudGhvbnkgUEVSQVJE
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
