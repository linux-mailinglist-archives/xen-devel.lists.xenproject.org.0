Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B308A20A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 17:13:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBy5-0003CQ-GL; Mon, 12 Aug 2019 15:10:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxBy4-0003CL-Fc
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 15:10:40 +0000
X-Inumbo-ID: 57dbaf20-bd13-11e9-8980-bc764e045a96
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 57dbaf20-bd13-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 15:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565622639;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q2JqmZk2jqxaTBSHkx6vRl9fE0darY5Lhc4lnnaCh6Y=;
 b=K3OXpLB1Ep/x3OtRxaJNX7TvQlf0Yahfuty7/H13VwOy5co8vZvOgJnG
 MDf3nJXRTz2A7K8i1Qyr9TYcyfZrLRWqorQNbDGETVkEyC2wlB2gplnav
 AQqEje2c5DWG7Hbxv4BGyy6LIaKPbgqodPsEIbJQR8Z9eTnyLWrKCoeqI E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +7JtekCMLAERiS3ApszJEFmNe7uBpx0mhNQJpa4eIyvtQ052DGQa6w5Np4mEl1X8iCXbZ2g0TO
 wV2l7VjYNAjhfiIs/1nbia4iGc7RMbrRr+Tfe88joqkn8lrFI3zc4K0tj08jcjrsSwC+kx0OlG
 km0vqIeqPp/uqI6hfFTV7Cc+JL35ejpj/VbtMJlFcXJ8uDQCb4KFAH4xDENkiON70KmrXJtNUX
 zmqAxI3JFXVclZ3bPhj+SXRkAN+J1D64zUJib6pa1B+9w9QvsjS89GWHwEyIBttxwRCDfyVvzb
 WEU=
X-SBRS: 2.7
X-MesageID: 4171881
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4171881"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 12 Aug 2019 16:10:32 +0100
Message-ID: <20190812151032.9353-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/boot: Simplify %fs setup in trampoline_setup
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

bW92L3NociBpcyBlYXNpZXIgdG8gZm9sbG93IHRoYW4gc2hsZCwgYW5kIGRvZXNuJ3QgaGF2ZSBh
IG1lcmdlIGRlcGVuZGVuY3kgb24KdGhlIHByZXZpb3VzIHZhbHVlIG9mICVlZHguICBTaG9ydGVu
IHRoZSByZXN0IG9mIHRoZSBjb2RlIGJ5IHN0cmVhbWxpbmluZyB0aGUKY29tbWVudHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0K
Q0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5v
cmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCkluIGFkZGl0
aW9uIHRvIGJlaW5nIGNsZWFyZXIgdG8gZm9sbG93LCBtb3Yvc2hyIGlzIGZhc3RlciB0aGFuIHNo
bGQgdG8gZGVjb2RlCmFuZCBleGVjdXRlLiAgU2VlIGh0dHBzOi8vZ29kYm9sdC5vcmcvei9BNWt2
dUMgZm9yIHRoZSBsYXRlbmN5L3Rocm91Z2hwdXQvcG9ydAphbmFseXNpcywgdGhlIEludGVsIE9w
dGltaXNhdGlvbiBndWlkZSB3aGljaCBjbGFzc2lmZXMgdGhlbSBhcyAiU2xvdyBJbnQiCmluc3Ry
dWN0aW9ucywgb3IgdGhlIEFNRCBPcHRpbWlzYXRpb24gZ3VpZGUgd2hpY2ggc3BlY2lmaWNhbGx5
IGhhcyBhIHNlY3Rpb24KZW50aXRsZWQgIkFsdGVybmF0aXZlcyB0byBTSExEIEluc3RydWN0aW9u
Ii4KLS0tCiB4ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgfCAyNyArKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMgYi94ZW4vYXJjaC94ODYv
Ym9vdC9oZWFkLlMKaW5kZXggNzgyZGVhYzBkNC4uMjZiNjgwNTIxZCAxMDA2NDQKLS0tIGEveGVu
L2FyY2gveDg2L2Jvb3QvaGVhZC5TCisrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwpAQCAt
NTU2LDI0ICs1NTYsMTcgQEAgdHJhbXBvbGluZV9zZXR1cDoKICAgICAgICAgLyoKICAgICAgICAg
ICogQ2FsbGVkIG9uIGxlZ2FjeSBCSU9TIGFuZCBFRkkgcGxhdGZvcm1zLgogICAgICAgICAgKgot
ICAgICAgICAgKiBJbml0aWFsaXplIGJpdHMgMC0xNSBvZiBCT09UX0ZTIHNlZ21lbnQgZGVzY3Jp
cHRvciBiYXNlIGFkZHJlc3MuCisgICAgICAgICAqIFNldCB0aGUgQk9PVF9GUyBkZXNjcmlwdG9y
IGJhc2UgYWRkcmVzcyB0byAlZXNpLgogICAgICAgICAgKi8KLSAgICAgICAgbW92ICAgICAlc2ks
Qk9PVF9GUysyK3N5bV9lc2kodHJhbXBvbGluZV9nZHQpCi0KLSAgICAgICAgLyogSW5pdGlhbGl6
ZSBiaXRzIDE2LTIzIG9mIEJPT1RfRlMgc2VnbWVudCBkZXNjcmlwdG9yIGJhc2UgYWRkcmVzcy4g
Ki8KLSAgICAgICAgc2hsZCAgICAkMTYsJWVzaSwlZWR4Ci0gICAgICAgIG1vdiAgICAgJWRsLEJP
T1RfRlMrNCtzeW1fZXNpKHRyYW1wb2xpbmVfZ2R0KQotCi0gICAgICAgIC8qIEluaXRpYWxpemUg
Yml0cyAyNC0zMSBvZiBCT09UX0ZTIHNlZ21lbnQgZGVzY3JpcHRvciBiYXNlIGFkZHJlc3MuICov
Ci0gICAgICAgIG1vdiAgICAgJWRoLEJPT1RfRlMrNytzeW1fZXNpKHRyYW1wb2xpbmVfZ2R0KQot
Ci0gICAgICAgIC8qCi0gICAgICAgICAqIEluaXRpYWxpemUgJWZzIGFuZCBsYXRlciB1c2UgaXQg
dG8gYWNjZXNzIFhlbiBkYXRhIHdoZXJlIHBvc3NpYmxlLgotICAgICAgICAgKiBBY2NvcmRpbmcg
dG8gSW50ZWwgNjQgYW5kIElBLTMyIEFyY2hpdGVjdHVyZXMgU29mdHdhcmUgRGV2ZWxvcGVyJ3MK
LSAgICAgICAgICogTWFudWFsIGl0IGlzIHNhZmUgdG8gZG8gdGhhdCB3aXRob3V0IHJlbG9hZGlu
ZyBHRFRSIGJlZm9yZS4KLSAgICAgICAgICovCi0gICAgICAgIG1vdiAgICAgJEJPT1RfRlMsJWVk
eAotICAgICAgICBtb3YgICAgICVlZHgsJWZzCisgICAgICAgIG1vdiAgICAgJWVzaSwgJWVkeAor
ICAgICAgICBzaHIgICAgICQxNiwgJWVkeAorICAgICAgICBtb3YgICAgICVzaSwgQk9PVF9GUyAr
IDIgKyBzeW1fZXNpKHRyYW1wb2xpbmVfZ2R0KSAvKiBCaXRzICAwLTE1ICovCisgICAgICAgIG1v
diAgICAgJWRsLCBCT09UX0ZTICsgNCArIHN5bV9lc2kodHJhbXBvbGluZV9nZHQpIC8qIEJpdHMg
MTYtMjMgKi8KKyAgICAgICAgbW92ICAgICAlZGgsIEJPT1RfRlMgKyA3ICsgc3ltX2VzaSh0cmFt
cG9saW5lX2dkdCkgLyogQml0cyAyNC0zMSAqLworCisgICAgICAgIC8qIExvYWQgJWZzIHRvIGFs
bG93IGZvciBhY2Nlc3MgdG8gWGVuIGRhdGEuICovCisgICAgICAgIG1vdiAgICAgJEJPT1RfRlMs
ICVlZHgKKyAgICAgICAgbW92ICAgICAlZWR4LCAlZnMKIAogICAgICAgICAvKiBTYXZlIFhlbiBp
bWFnZSBsb2FkIGJhc2UgYWRkcmVzcyBmb3IgbGF0ZXIgdXNlLiAqLwogICAgICAgICBtb3YgICAg
ICVlc2ksc3ltX2ZzKHhlbl9waHlzX3N0YXJ0KQotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
