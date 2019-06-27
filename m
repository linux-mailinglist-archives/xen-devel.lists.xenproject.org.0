Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B958D58A7B
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 20:59:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgZZN-0004kD-3S; Thu, 27 Jun 2019 18:56:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bCrz=U2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hgZZL-0004k7-Ta
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 18:56:27 +0000
X-Inumbo-ID: 424c518e-990d-11e9-9db6-1bd82ea84f70
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 424c518e-990d-11e9-9db6-1bd82ea84f70;
 Thu, 27 Jun 2019 18:56:24 +0000 (UTC)
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
IronPort-SDR: srMw/8wIVKvWvyFCf9UQcAkSdL1mRWZGpE0+fD7JGte1fIUhFetKuCDbQrp8pCKmCtLvghUaxC
 6SBUkA8qHMv8JrF/aBdxIx5+B355wZVhQkEiT6prhTX3Fv70xhel+4vY8SHAYCntNv8b618MwB
 duxkSBWfTbO+GxQHwcCH0iW/v/gpM78ObvRUu1KqDOi0U5bR1jqu3QkY8Et9F4Zb9xfn2ERP5r
 ux32yYjfPguQCtnFzmXMXl73d4immTFXgsxT7JTwUDUStpkD4SGvkJYoIBTTUcnsZcMmd4AYj+
 eZI=
X-SBRS: 2.7
X-MesageID: 2345786
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,424,1557201600"; 
   d="scan'208";a="2345786"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 27 Jun 2019 19:56:20 +0100
Message-ID: <20190627185620.4724-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624101723.23291-2-andrew.cooper3@citrix.com>
References: <20190624101723.23291-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 1/2] x86/ubsan: Don't perform alignment
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
c2luZyAtZm5vLXNhbml0aXplPWFsaWdubWVudCBmb3IgQVJNCnYzOgogKiBVc2UgQ0ZMQUdTX1VC
U0FOLCBpbml0aWFsaXNlZCB0byBlbXB0eSBmaXJzdC4KICogTGVhdmUgYSBjb21tZW50IGV4cGxh
aW5pbmcgd2h5IHdlIHVzZSAtZm5vLXNhbml0aXplPWFsaWdubWVudAoKVGhlIHJlYXNvbiB3aHkg
eDg2IGhhcyBhIGlmZXEgKCQoQ09ORklHX1VCU0FOKSx5KSBpcyB0byBhdm9pZCB5ZXQgYW5vdGhl
cgpjYy1vcHRpb24tYWRkIGV2YWx1YXRlZCBmb3IgZXZlcnkgdHJhbnNsYXRpb24gdWludCBpbiB0
aGUgZGVmYXVsdCBjYXNlLiAgVGhpcwp3aWxsIGFsbCBnbyBhd2F5IHdoZW4gd2UgdXBkYXRlIHRv
IGEgcmVjZW50IHZlcnNpb24gb2YgS2NvbmZpZyB3aGljaCBtb3ZlcyBhbGwKdGhlIHRvb2xjaGFp
biBjaGVja3MgaW50byB0aGF0IHBoYXNlLgotLS0KIHhlbi9SdWxlcy5tayAgICAgICAgICB8IDgg
KysrKysrKy0KIHhlbi9hcmNoL3g4Ni9SdWxlcy5tayB8IDggKysrKysrKysKIDIgZmlsZXMgY2hh
bmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9S
dWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBhMTUxYjNmNjI1Li4zMDkwZWE3ODI4IDEwMDY0
NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC00MSw2ICs0MSw5IEBA
IEFMTF9PQkpTLXkgICAgICAgICAgICAgICArPSAkKEJBU0VESVIpL3hzbS9idWlsdF9pbi5vCiBB
TExfT0JKUy15ICAgICAgICAgICAgICAgKz0gJChCQVNFRElSKS9hcmNoLyQoVEFSR0VUX0FSQ0gp
L2J1aWx0X2luLm8KIEFMTF9PQkpTLSQoQ09ORklHX0NSWVBUTykgICArPSAkKEJBU0VESVIpL2Ny
eXB0by9idWlsdF9pbi5vCiAKKyMgSW5pdGlhbGlzZSBzb21lIHZhcmlhYmxlcworQ0ZMQUdTX1VC
U0FOIDo9CisKIGlmZXEgKCQoQ09ORklHX0RFQlVHKSx5KQogQ0ZMQUdTICs9IC1PMQogZWxzZQpA
QCAtMTM4LDcgKzE0MSwxMCBAQCAkKGZpbHRlci1vdXQgJS5pbml0Lm8gJChub2Nvdi15KSwkKG9i
ai15KSAkKG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAkKAogZW5kaWYKIAogaWZl
cSAoJChDT05GSUdfVUJTQU4pLHkpCi0kKGZpbHRlci1vdXQgJS5pbml0Lm8gJChub3Vic2FuLXkp
LCQob2JqLXkpICQob2JqLWJpbi15KSAkKGV4dHJhLXkpKTogQ0ZMQUdTICs9IC1mc2FuaXRpemU9
dW5kZWZpbmVkCitDRkxBR1NfVUJTQU4gKz0gLWZzYW5pdGl6ZT11bmRlZmluZWQKKyMgQW55IC1m
bm8tc2FuaXRpemU9IG9wdGlvbnMgbmVlZCB0byBjb21lIGFmdGVyIGFueSAtZnNhbml0aXplPSBv
cHRpb25zCiskKGZpbHRlci1vdXQgJS5pbml0Lm8gJChub3Vic2FuLXkpLCQob2JqLXkpICQob2Jq
LWJpbi15KSAkKGV4dHJhLXkpKTogXAorQ0ZMQUdTICs9ICQoZmlsdGVyLW91dCAtZm5vLSUsJChD
RkxBR1NfVUJTQU4pKSAkKGZpbHRlciAtZm5vLSUsJChDRkxBR1NfVUJTQU4pKQogZW5kaWYKIAog
aWZlcSAoJChDT05GSUdfTFRPKSx5KQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L1J1bGVzLm1r
IGIveGVuL2FyY2gveDg2L1J1bGVzLm1rCmluZGV4IGJhYmMwZWRiY2QuLjUyZTkzYWZiNDggMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5taworKysgYi94ZW4vYXJjaC94ODYvUnVsZXMu
bWsKQEAgLTU3LDYgKzU3LDE0IEBAIGVuZGlmCiAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxDRkxBR1Mt
c3RhY2stYm91bmRhcnksQ0MsLW1wcmVmZXJyZWQtc3RhY2stYm91bmRhcnk9MykKIENGTEFHUyAr
PSAkKENGTEFHUy1zdGFjay1ib3VuZGFyeSkKIAoraWZlcSAoJChDT05GSUdfVUJTQU4pLHkpCisj
IERvbid0IGVuYWJsZSBhbGlnbm1lbnQgc2FuaXRpc2F0aW9uLiAgeDg2IGhhcyBlZmZpY2llbnQg
dW5hbGlnbmVkIGFjY2Vzc2VzLAorIyBhbmQgdmFyaW91cyB0aGluZ3MgKEFDUEkgdGFibGVzLCBo
eXBlcmNhbGwgcGFnZXMsIHN0dWJzLCBldGMpIGFyZSB3b250LWZpeC4KKyMgSXQgYWxzbyBjYXVz
ZXMgYW4gYXMteWV0LXVuaWRlbnRpZmllZCBjcmFzaCBvbiBuYXRpdmUgYm9vdCBiZWZvcmUgdGhl
CisjIGNvbnNvbGUgc3RhcnRzLgorJChjYWxsIGNjLW9wdGlvbi1hZGQsQ0ZMQUdTX1VCU0FOLEND
LC1mbm8tc2FuaXRpemU9YWxpZ25tZW50KQorZW5kaWYKKwogIyBTZXQgdXAgdGhlIGFzc2VtYmxl
ciBpbmNsdWRlIHBhdGggcHJvcGVybHkgZm9yIG9sZGVyIHRvb2xjaGFpbnMuCiBDRkxBR1MgKz0g
LVdhLC1JJChCQVNFRElSKS9pbmNsdWRlCiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
