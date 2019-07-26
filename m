Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F01767A7
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 15:37:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr0M6-0006aF-D5; Fri, 26 Jul 2019 13:33:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+y56=VX=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hr0M4-0006Zk-DY
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 13:33:52 +0000
X-Inumbo-ID: 00067e40-afaa-11e9-abe1-5f0873753198
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00067e40-afaa-11e9-abe1-5f0873753198;
 Fri, 26 Jul 2019 13:33:49 +0000 (UTC)
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
IronPort-SDR: qyb7dRRJbfoyKhZMGZBje5YUCdoVVvicYS5oDxHRCO+AKhFMOEc1mGBcBvUICbE0vGQhQM4MIu
 Q6B5A6quwqCtH2acl7ia5lyMW4yYongc8tUT0AZmkt68k8mjcrGcegE2PXZt61lFlqzYEESQHm
 AwtxdzjKA2+wDndoUFQ4d7nQ1c296wZDvV+p7PJ/mCcjxR5vLzZZPquIxq0MAVHecC1iztmmZL
 NoeVlgWf0S56nBUs2pBe0SVZ3fvQ6rVU0H7BjxU2ss2cGE2nBk8j+DjXrwkpTpdoWvSSZ0tZlA
 tYY=
X-SBRS: 2.7
X-MesageID: 3514037
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,311,1559534400"; 
   d="scan'208";a="3514037"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Jul 2019 15:33:31 +0200
Message-ID: <20190726133331.91482-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190726133331.91482-1-roger.pau@citrix.com>
References: <20190726133331.91482-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 3/3] build: allow picking the env values for
 toolchain utilities
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

RG9uJ3QgZm9yY2UgdGhlIHVzYWdlIG9mIHRoZSBoYXJkY29kZWQgdG9vbGNoYWluIHZhbHVlcyBp
ZiB0aG9zZSBhcmUKYWxyZWFkeSBzZXQgb24gdGhlIGVudmlyb25tZW50LgoKTm90ZSB0aGF0IGFz
IHBhcnQgb2YgdGhlIGNoYW5nZSB0aGUgZGVmaW5pdGlvbiBvZiBBUyBhbmQgTEQgaXMgbW92ZWQK
YWZ0ZXIgdGhlIHNldHRpbmcgb2YgY29tcGlsZXIgcmVsYXRlZCB2YXJpYWJsZXMuCgpTaWduZWQt
b2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CkNj
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogS29ucmFkIFJ6ZXN6dXRl
ayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgpDYzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CkNjOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KIGNvbmZpZy9TdGRHTlUubWsgfCAyMiArKysrKysrKysr
Ky0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvY29uZmlnL1N0ZEdOVS5tayBiL2NvbmZpZy9TdGRHTlUubWsK
aW5kZXggYjMwNzJmNWIxMy4uY2FiNzM2OWYxMiAxMDA2NDQKLS0tIGEvY29uZmlnL1N0ZEdOVS5t
aworKysgYi9jb25maWcvU3RkR05VLm1rCkBAIC0xLDggKzEsNiBAQAogIyBVc2UgQ2xhbmcvTExW
TSBpbnN0ZWFkIG9mIEdDQz8KIGNsYW5nICAgICA/PSBuCiAKLUFTICAgICAgICAgPSAkKENST1NT
X0NPTVBJTEUpYXMKLUxEICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUpbGQKIGlmZXEgKCQoY2xh
bmcpLHkpCiBnY2MgICAgICAgOj0gbgogREVGX0NDICAgICA9IGNsYW5nCkBAIC0yOCwxOSArMjYs
MjEgQEAgSE9TVENDICAgID89ICQoREVGX0NDKQogSE9TVENYWCAgID89ICQoREVGX0NYWCkKIGVu
ZGlmCiAKLUNQUCAgICAgICAgPSAkKENDKSAtRQotQVIgICAgICAgICA9ICQoQ1JPU1NfQ09NUElM
RSlhcgotUkFOTElCICAgICA9ICQoQ1JPU1NfQ09NUElMRSlyYW5saWIKLU5NICAgICAgICAgPSAk
KENST1NTX0NPTVBJTEUpbm0KLVNUUklQICAgICAgPSAkKENST1NTX0NPTVBJTEUpc3RyaXAKLU9C
SkNPUFkgICAgPSAkKENST1NTX0NPTVBJTEUpb2JqY29weQotT0JKRFVNUCAgICA9ICQoQ1JPU1Nf
Q09NUElMRSlvYmpkdW1wCi1TSVpFVVRJTCAgID0gJChDUk9TU19DT01QSUxFKXNpemUKK0FTICAg
ICAgICA/PSAkKENST1NTX0NPTVBJTEUpYXMKK0xEICAgICAgICA/PSAkKENST1NTX0NPTVBJTEUp
bGQKK0NQUCAgICAgICA/PSAkKENDKSAtRQorQVIgICAgICAgID89ICQoQ1JPU1NfQ09NUElMRSlh
cgorUkFOTElCICAgID89ICQoQ1JPU1NfQ09NUElMRSlyYW5saWIKK05NICAgICAgICA/PSAkKENS
T1NTX0NPTVBJTEUpbm0KK1NUUklQICAgICA/PSAkKENST1NTX0NPTVBJTEUpc3RyaXAKK09CSkNP
UFkgICA/PSAkKENST1NTX0NPTVBJTEUpb2JqY29weQorT0JKRFVNUCAgID89ICQoQ1JPU1NfQ09N
UElMRSlvYmpkdW1wCitTSVpFVVRJTCAgPz0gJChDUk9TU19DT01QSUxFKXNpemUKIAogIyBBbGxv
dyBnaXQgdG8gYmUgd3JhcHBlcmVkIGluIHRoZSBlbnZpcm9ubWVudAogR0lUICAgICAgICA/PSBn
aXQKIAotSU5TVEFMTCAgICAgID0gaW5zdGFsbAorSU5TVEFMTCAgICAgPz0gaW5zdGFsbAogSU5T
VEFMTF9ESVIgID0gJChJTlNUQUxMKSAtZCAtbTA3NTUgLXAKIElOU1RBTExfREFUQSA9ICQoSU5T
VEFMTCkgLW0wNjQ0IC1wCiBJTlNUQUxMX1BST0cgPSAkKElOU1RBTEwpIC1tMDc1NSAtcAotLSAK
Mi4yMC4xIChBcHBsZSBHaXQtMTE3KQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
