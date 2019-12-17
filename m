Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFB912296F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 12:03:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihAZX-0008BN-Nk; Tue, 17 Dec 2019 10:59:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9l2e=2H=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ihAZW-0008Ao-Bf
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 10:59:22 +0000
X-Inumbo-ID: 3f188489-20bc-11ea-8e9d-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f188489-20bc-11ea-8e9d-12813bfff9fa;
 Tue, 17 Dec 2019 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576580348;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U3Lce/KlFvj8bHLwbHXOYVYCrQrf7lO6uk+hxrmtXfU=;
 b=fG0pAjg4cT8QNn2ZHhbkmkkpWGCLC6QytljqDG920hVKMRpy80DjF6IH
 K1rb57dJc6IeWYFJJ0fyVFdGXUBhWinBzxBFbhmxWpeLAgsnCRTsVVtO6
 S/aHG/+PDOROoc/UeiNPHSYdK+7++ouG82JCHI0j7vfUxOMY6cXSkgdml E=;
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
IronPort-SDR: YUL/h+w97rk6fL2AtzL31hapl3vmavakEisjzMUXThTGx+TReZsq9L2OdsgE7RHeor8Ep7wghr
 eF+gQDNv42FjsFS6+HKy237PLwYzCeDhNbYcpg519wtfK3D5ULth2+d9hLp8eQPGrFVyRvu6AK
 cRebXe9cAEB+/y7OWeIsL3x+GBDhh0U7JZqlg95odqIUQzofuFusD9T7FWOZKiTh9n0XsgPEQr
 HIvNu34XUepXAmvP+ARZBe0U/wLkya/zVbEpoxvCy+4s9rphrvrBJHeWB+Bkqh2i+ApF6ra86c
 Wy4=
X-SBRS: 2.7
X-MesageID: 10211658
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10211658"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 17 Dec 2019 10:59:00 +0000
Message-ID: <20191217105901.68158-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191217105901.68158-1-anthony.perard@citrix.com>
References: <20191217105901.68158-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH v2 5/6] xen: Use $(CONFIG_CC_IS_CLANG)
 instead of $(clang) in Makefile
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
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2NvbmZpZyBjYW4gY2hlY2sgaWYgJChDQykgaXMgY2xhbmcgb3Igbm90LCBpZiBpdCBpcwpDT05G
SUdfQ0NfSVNfQ0xBTkcgd2lsbCBiZSBzZXQuCgpXaXRoIHRoYXQgcGF0Y2gsIHRoZSBoeXBlcnZp
c29yIGNhbiBiZSBidWlsdCB1c2luZyBjbGFuZyBieSBydW5uaW5nCmBtYWtlIENDPWNsYW5nIENY
WD1jbGFuZysrYCB3aXRob3V0IG5lZWRlZCB0byBwcm92aWRlIGFuIGV4dHJhIGNsYW5nCnBhcmFt
ZXRlci4KCmBtYWtlIGNsYW5nPXlgIHN0aWxsIHdvcmtzIGFzIENvbmZpZy5tayB3aWxsIHNldCBD
QyBhbmQgQ1hYLgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJk
QGNpdHJpeC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPgotLS0KIHhlbi9SdWxlcy5tayAgICAgICAgICAgICAgICAgfCA4ICsrKystLS0tCiB4
ZW4vYXJjaC94ODYvUnVsZXMubWsgICAgICAgIHwgMiArLQogeGVuL2NvbW1vbi9jb3ZlcmFnZS9N
YWtlZmlsZSB8IDIgKy0KIHhlbi9pbmNsdWRlL01ha2VmaWxlICAgICAgICAgfCAyICstCiA0IGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS94ZW4vUnVsZXMubWsgYi94ZW4vUnVsZXMubWsKaW5kZXggZDA1M2RiZDI2NTI2Li5mY2RhZmQw
MjkzNDIgMTAwNjQ0Ci0tLSBhL3hlbi9SdWxlcy5taworKysgYi94ZW4vUnVsZXMubWsKQEAgLTY0
LDcgKzY0LDcgQEAgQ0ZMQUdTICs9IC1waXBlIC1EX19YRU5fXyAtaW5jbHVkZSAkKEJBU0VESVIp
L2luY2x1ZGUveGVuL2NvbmZpZy5oCiBDRkxBR1MtJChDT05GSUdfREVCVUdfSU5GTykgKz0gLWcK
IENGTEFHUyArPSAnLURfX09CSkVDVF9GSUxFX189IiRAIicKIAotaWZuZXEgKCQoY2xhbmcpLHkp
CitpZm5lcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkpCiAjIENsYW5nIGRvZXNuJ3QgdW5kZXJz
dGFuZCB0aGlzIGNvbW1hbmQgbGluZSBhcmd1bWVudCwgYW5kIGRvZXNuJ3QgYXBwZWFyIHRvCiAj
IGhhdmUgYW4gc3VpdGFibGUgYWx0ZXJuYXRpdmUuICBUaGUgcmVzdWx0aW5nIGNvbXBpbGVkIGJp
bmFyeSBkb2VzIGZ1bmN0aW9uLAogIyBidXQgaGFzIGFuIGV4Y2Vzc2l2ZWx5IGxhcmdlIHN5bWJv
bCB0YWJsZS4KQEAgLTEyNiw3ICsxMjYsNyBAQCBzdWJkaXItYWxsIDo9ICQoc3ViZGlyLXkpICQo
c3ViZGlyLW4pCiAkKGZpbHRlciAlLmluaXQubywkKG9iai15KSAkKG9iai1iaW4teSkgJChleHRy
YS15KSk6IENGTEFHUyArPSAtRElOSVRfU0VDVElPTlNfT05MWQogCiBpZmVxICgkKENPTkZJR19D
T1ZFUkFHRSkseSkKLWlmZXEgKCQoY2xhbmcpLHkpCitpZmVxICgkKENPTkZJR19DQ19JU19DTEFO
RykseSkKICAgICBDT1ZfRkxBR1MgOj0gLWZwcm9maWxlLWluc3RyLWdlbmVyYXRlIC1mY292ZXJh
Z2UtbWFwcGluZwogZWxzZQogICAgIENPVl9GTEFHUyA6PSAtZnByb2ZpbGUtYXJjcyAtZnRlc3Qt
Y292ZXJhZ2UKQEAgLTE0Myw3ICsxNDMsNyBAQCBlbmRpZgogCiBpZmVxICgkKENPTkZJR19MVE8p
LHkpCiBDRkxBR1MgKz0gLWZsdG8KLUxERkxBR1MtJChjbGFuZykgKz0gLXBsdWdpbiBMTFZNZ29s
ZC5zbworTERGTEFHUy0kKENPTkZJR19DQ19JU19DTEFORykgKz0gLXBsdWdpbiBMTFZNZ29sZC5z
bwogIyBXb3VsZCBsaWtlIHRvIGhhbmRsZSBhbGwgb2JqZWN0IGZpbGVzIGFzIGJpdGNvZGUsIGJ1
dCBvYmplY3RzIG1hZGUgZnJvbQogIyBwdXJlIGFzbSBhcmUgaW4gYSBkaWZmZXJlbnQgZm9ybWF0
IGFuZCBoYXZlIHRvIGJlIGNvbGxlY3RlZCBzZXBhcmF0ZWx5LgogIyBNaXJyb3IgdGhlIGRpcmVj
dG9yeSB0cmVlLCBjb2xsZWN0aW5nIHRoZW0gYXMgYnVpbHRfaW5fYmluLm8uCkBAIC0xOTcsNyAr
MTk3LDcgQEAgU1JDUEFUSCA6PSAkKHBhdHN1YnN0ICQoQkFTRURJUikvJSwlLCQoQ1VSRElSKSkK
ICUubzogJS5jIE1ha2VmaWxlCiBpZmVxICgkKENPTkZJR19FTkZPUkNFX1VOSVFVRV9TWU1CT0xT
KSx5KQogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAkPCAtbyAkKEBEKS8uJChARikudG1wCi1pZmVxICgk
KGNsYW5nKSx5KQoraWZlcSAoJChDT05GSUdfQ0NfSVNfQ0xBTkcpLHkpCiAJJChPQkpDT1BZKSAt
LXJlZGVmaW5lLXN5bSAkPD0kKFNSQ1BBVEgpLyQ8ICQoQEQpLy4kKEBGKS50bXAgJEAKIGVsc2UK
IAkkKE9CSkNPUFkpIC0tcmVkZWZpbmUtc3ltICQoPEYpPSQoU1JDUEFUSCkvJDwgJChARCkvLiQo
QEYpLnRtcCAkQApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L1J1bGVzLm1rIGIveGVuL2FyY2gv
eDg2L1J1bGVzLm1rCmluZGV4IGEyYzI1N2ZiOTViMi4uYjk4ZTE0ZTI4YzVhIDEwMDY0NAotLS0g
YS94ZW4vYXJjaC94ODYvUnVsZXMubWsKKysrIGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCkBAIC0x
Miw3ICsxMiw3IEBAIENGTEFHUyArPSAnLURfX09CSkVDVF9MQUJFTF9fPSQoc3Vic3QgLywkJCwk
KHN1YnN0IC0sXywkKHN1YnN0ICQoQkFTRURJUikvLCwkKENVCiAjIFByZXZlbnQgZmxvYXRpbmct
cG9pbnQgdmFyaWFibGVzIGZyb20gY3JlZXBpbmcgaW50byBYZW4uCiBDRkxBR1MgKz0gLW1zb2Z0
LWZsb2F0CiAKLWlmZXEgKCQoY2xhbmcpLHkpCitpZmVxICgkKENPTkZJR19DQ19JU19DTEFORyks
eSkKICMgTm90ZTogQW55IHRlc3Qgd2hpY2ggYWRkcyAtbm8taW50ZWdyYXRlZC1hcyB3aWxsIGNh
dXNlIHN1YnNlcXVlbnQgdGVzdHMgdG8KICMgc3VjY2VlZCwgYW5kIG5vdCB0cmlnZ2VyIGZ1cnRo
ZXIgYWRkaXRpb25zLgogIwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmls
ZSBiL3hlbi9jb21tb24vY292ZXJhZ2UvTWFrZWZpbGUKaW5kZXggYjUwOWU1MWY5NjBiLi42M2Y5
OGM3MWQ2YjUgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vY292ZXJhZ2UvTWFrZWZpbGUKKysrIGIv
eGVuL2NvbW1vbi9jb3ZlcmFnZS9NYWtlZmlsZQpAQCAtMSw1ICsxLDUgQEAKIG9iai15ICs9IGNv
dmVyYWdlLm8KLWlmbmVxICgkKGNsYW5nKSx5KQoraWZuZXEgKCQoQ09ORklHX0NDX0lTX0NMQU5H
KSx5KQogb2JqLXkgKz0gZ2Nvdl9iYXNlLm8gZ2Nvdi5vCiBvYmoteSArPSAkKGNhbGwgY2MtaWZ2
ZXJzaW9uLC1sdCwwNDA3LCBcCiAJCWdjY18zXzQubywgJChjYWxsIGNjLWlmdmVyc2lvbiwtbHQs
MDQwOSwgXApkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvTWFrZWZpbGUgYi94ZW4vaW5jbHVkZS9N
YWtlZmlsZQppbmRleCBjM2UwMjgzZDM0N2YuLmZkZTBjYTAxMzEyMSAxMDA2NDQKLS0tIGEveGVu
L2luY2x1ZGUvTWFrZWZpbGUKKysrIGIveGVuL2luY2x1ZGUvTWFrZWZpbGUKQEAgLTM2LDcgKzM2
LDcgQEAgY3BwZmxhZ3MteSAgICAgICAgICAgICAgICA6PSAtaW5jbHVkZSBwdWJsaWMveGVuLWNv
bXBhdC5oIC1EWEVOX0dFTkVSQVRJTkdfQ09NUEEKIGNwcGZsYWdzLSQoQ09ORklHX1g4NikgICAg
Kz0gLW0zMgogCiAjIDgtYnl0ZSB0eXBlcyBhcmUgNC1ieXRlIGFsaWduZWQgb24geDg2XzMyIC4u
LgotaWZlcSAoJChjbGFuZykseSkKK2lmZXEgKCQoQ09ORklHX0NDX0lTX0NMQU5HKSx5KQogcHJl
Zml4LSQoQ09ORklHX1g4NikgICAgICA6PSBcI3ByYWdtYSBwYWNrKHB1c2gsIDQpCiBzdWZmaXgt
JChDT05GSUdfWDg2KSAgICAgIDo9IFwjcHJhZ21hIHBhY2socG9wKQogZWxzZQotLSAKQW50aG9u
eSBQRVJBUkQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
