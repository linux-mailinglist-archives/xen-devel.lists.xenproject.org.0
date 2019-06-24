Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF435089E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 12:20:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfM2Y-00025x-Ce; Mon, 24 Jun 2019 10:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TGna=UX=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hfM2W-00025r-TQ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 10:17:32 +0000
X-Inumbo-ID: 44818092-9669-11e9-9a83-5333c333f460
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44818092-9669-11e9-9a83-5333c333f460;
 Mon, 24 Jun 2019 10:17:28 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: H3eK4YqKYhfCQc//pP0YFWwGqDECrf3/EpaEjDOaystK3aSZT8Y3KG6JsQngcxhuPxdkdyrA1G
 HGmzNh+dTNEMNF9r6yOEci+aq0V+urKRA4/BrWgTjzvjw3f1abpW34u0oVBeCfQAZ7EJiKNaca
 623RURNov0Eo/YYvM6lLKHIAZ6w8YryPQ/EIuy/lId8Kc7zIK/heP3YHMs74Lmegdksw8leNUu
 RAXCx5WRZNI+9HK28J+W5ItmjYuyTiIw40Rm+4DEuOeww8gtAIEnCzCaHfx8xhGTQRC/xVQ+pZ
 PIA=
X-SBRS: 2.7
X-MesageID: 2154245
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,411,1557201600"; 
   d="scan'208";a="2154245"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 24 Jun 2019 11:17:22 +0100
Message-ID: <20190624101723.23291-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190624101723.23291-1-andrew.cooper3@citrix.com>
References: <20190624101723.23291-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 1/2] xen/ubsan: Don't perform alignment checking
 on supporting compilers
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
PgpDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoaXMgaXNuJ3QgaWRl
YWwsIGJ1dCB3ZSBjYW4ndCBkbyBiZXR0ZXIgd2l0aG91dCBhIGJpdCBvZiBhbiBvdmVyaGF1bCB3
aGljaCBJCmRvbid0IGhhdmUgdGltZSBmb3Igbm93LiAgTGludXggdXNlcyBhIHdoaXRlbGlzdCBv
ZiBzYW5pdGlzZXJzIGJ1dCBJJ20gbm90CmVudGlyZWx5IHN1cmUgd2Ugd2FudCB0byBnbyB0aGF0
IHJvdXRlLiAgQVJNIGN1cnJlbnRseSBpc24ndCB3b3JraW5nIHdlbGwgd2l0aApVQlNBTiwgYnV0
IEFGQUNJVCwgYWxsIEFSTSBwbGF0Zm9ybXMgdGhhdCB3ZSBzdXBwb3J0IGFsc28gZGlzYWJsZSBh
bGlnbm1lbnQKc2FuaXRpc2F0aW9uIGluIExpbnV4LgotLS0KIHhlbi9SdWxlcy5tayB8IDQgKysr
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL3hlbi9SdWxlcy5tayBiL3hlbi9SdWxlcy5tawppbmRleCBhMTUxYjNmNjI1Li42MWNk
OGVkNWQ5IDEwMDY0NAotLS0gYS94ZW4vUnVsZXMubWsKKysrIGIveGVuL1J1bGVzLm1rCkBAIC0x
MzgsNyArMTM4LDkgQEAgJChmaWx0ZXItb3V0ICUuaW5pdC5vICQobm9jb3YteSksJChvYmoteSkg
JChvYmotYmluLXkpICQoZXh0cmEteSkpOiBDRkxBR1MgKz0gJCgKIGVuZGlmCiAKIGlmZXEgKCQo
Q09ORklHX1VCU0FOKSx5KQotJChmaWx0ZXItb3V0ICUuaW5pdC5vICQobm91YnNhbi15KSwkKG9i
ai15KSAkKG9iai1iaW4teSkgJChleHRyYS15KSk6IENGTEFHUyArPSAtZnNhbml0aXplPXVuZGVm
aW5lZAorVUJTQU5fRkxBR1MgOj0gLWZzYW5pdGl6ZT11bmRlZmluZWQKKyQoY2FsbCBjYy1vcHRp
b24tYWRkLFVCU0FOX0ZMQUdTLENDLC1mbm8tc2FuaXRpemU9YWxpZ25tZW50KQorJChmaWx0ZXIt
b3V0ICUuaW5pdC5vICQobm91YnNhbi15KSwkKG9iai15KSAkKG9iai1iaW4teSkgJChleHRyYS15
KSk6IENGTEFHUyArPSAkKFVCU0FOX0ZMQUdTKQogZW5kaWYKIAogaWZlcSAoJChDT05GSUdfTFRP
KSx5KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
