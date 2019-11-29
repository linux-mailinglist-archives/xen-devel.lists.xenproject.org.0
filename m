Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5F10D71A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 15:36:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iahMb-0002pC-47; Fri, 29 Nov 2019 14:35:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UeaM=ZV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iahMZ-0002p2-Gi
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 14:35:15 +0000
X-Inumbo-ID: 74d5b59c-12b5-11ea-83b8-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 74d5b59c-12b5-11ea-83b8-bc764e2007e4;
 Fri, 29 Nov 2019 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575038114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=RiH7jnaB3EiOtyjYOGj/CNHCoyixO+9rlHBMwVdVOOE=;
 b=dgLmUJRH4F3pSnsswoYO2+/fB+e0I604PZ7jM6xe5LtA8oK5DcRJoDDL
 oNNrE32vUNbASJ9wBeRZ09d6q2YYfgjFestJlZLV1KrKc/BlsooM1MxE5
 LX0Sdo0uH9A/EIzMMHM22oT9If1z9qDZQ+TzrBsjOFrbZBnT5tLqWlNsH U=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 077PrDM3EXaVUUZbs0gmRCV4gMyugHQY8r7rRiV7LWIT+5c3slZAPWJdolZzz2vkDLHX7bGxbc
 H6T8Q6DubzuT0tUEGV2eZboL6zqEAjPV8fcc6hrcWU4qM2M9qkzWP8uPe2a+o3Hhby+WJ101bK
 qMLMBjI08BsRSv/scliVUKxc95ePOVixyMx/WuJr2L0WUmEVVeEno45JhuWNvWLGfsDf0Gn+Tt
 3VKD4XzCmkP/bhseM6WpMmRDs3i4dBve67nl/OHnoIc4QHAbbTwJlk2VJvk8eCr2F15O/nxLzE
 m0c=
X-SBRS: 2.7
X-MesageID: 9344533
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,257,1571716800"; 
   d="scan'208";a="9344533"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 29 Nov 2019 14:35:09 +0000
Message-ID: <20191129143509.26528-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
References: <5766dd2b-2aa7-bafe-56ad-3ea33ddf4591@suse.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH XTF] CONSOLEIO_write stack overflow PoC
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2xhc3NpZnkgaXQgYXMgYW4gWFNBIHRlc3QgKHdoaWNoIGFyZ3VhYmx5IG91Z2h0IHRvIGJlIG5h
bWVkICdzZWN1cml0eScpLApkZXNwaXRlIG5vIFhTQSBiZWluZyBpc3N1ZXMuCgpTaWduZWQtb2Zm
LWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KIGRvY3Mv
YWxsLXRlc3RzLmRveCAgICAgICAgICAgICAgICAgfCAgMiArKwogdGVzdHMveHNhLWNvbnNvbGVp
by13cml0ZS9NYWtlZmlsZSB8ICA5ICsrKysrCiB0ZXN0cy94c2EtY29uc29sZWlvLXdyaXRlL21h
aW4uYyAgIHwgNjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDMgZmls
ZXMgY2hhbmdlZCwgODAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL3hz
YS1jb25zb2xlaW8td3JpdGUvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy94c2Et
Y29uc29sZWlvLXdyaXRlL21haW4uYwoKZGlmZiAtLWdpdCBhL2RvY3MvYWxsLXRlc3RzLmRveCBi
L2RvY3MvYWxsLXRlc3RzLmRveAppbmRleCA1MDQyOTEyNy4uYmNmOWI3ZWQgMTAwNjQ0Ci0tLSBh
L2RvY3MvYWxsLXRlc3RzLmRveAorKysgYi9kb2NzL2FsbC10ZXN0cy5kb3gKQEAgLTE0Myw2ICsx
NDMsOCBAQCBYU0EtMjkzIC0gU2VlIEByZWYgdGVzdC1wdi1mc2dzYmFzZS4KIEBzdWJwYWdlIHRl
c3QteHNhLTI5OCAtIG1pc3NpbmcgZGVzY3JpcHRvciB0YWJsZSBsaW1pdCBjaGVja2luZyBpbiB4
ODYgUFYKIGVtdWxhdGlvbi4KIAorQHN1YnBhZ2UgdGVzdC14c2EtY29uc29sZWlvLXdyaXRlIC0g
Q09OU09MRUlPX3dyaXRlIHN0YWNrIG92ZXJmbG93CisKIAogQHNlY3Rpb24gaW5kZXgtdXRpbGl0
eSBVdGlsaXRpZXMKIApkaWZmIC0tZ2l0IGEvdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9NYWtl
ZmlsZSBiL3Rlc3RzL3hzYS1jb25zb2xlaW8td3JpdGUvTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAuLmQxODliNGRlCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMv
eHNhLWNvbnNvbGVpby13cml0ZS9NYWtlZmlsZQpAQCAtMCwwICsxLDkgQEAKK2luY2x1ZGUgJChS
T09UKS9idWlsZC9jb21tb24ubWsKKworTkFNRSAgICAgIDo9IHhzYS1jb25zb2xlaW8td3JpdGUK
K0NBVEVHT1JZICA6PSB4c2EKK1RFU1QtRU5WUyA6PSBodm0zMnBhZQorCitvYmotcGVyZW52ICs9
IG1haW4ubworCitpbmNsdWRlICQoUk9PVCkvYnVpbGQvZ2VuLm1rCmRpZmYgLS1naXQgYS90ZXN0
cy94c2EtY29uc29sZWlvLXdyaXRlL21haW4uYyBiL3Rlc3RzL3hzYS1jb25zb2xlaW8td3JpdGUv
bWFpbi5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwLi5mMTBhNjI1NgotLS0g
L2Rldi9udWxsCisrKyBiL3Rlc3RzL3hzYS1jb25zb2xlaW8td3JpdGUvbWFpbi5jCkBAIC0wLDAg
KzEsNjkgQEAKKy8qKgorICogQGZpbGUgdGVzdHMveHNhLWNvbnNvbGVpby13cml0ZS9tYWluLmMK
KyAqIEByZWYgdGVzdC14c2EtY29uc29sZWlvLXdyaXRlCisgKgorICogVGhpcyBpc3N1ZSB3YXMg
ZGlzY292ZXJlZCBiZWZvcmUgaXQgbWFkZSBpdCBpbnRvIGFueSByZWxlYXNlZCB2ZXJzaW9uIG9m
CisgKiBYZW4uICBUaGVyZWZvcmUsIG5vIFhTQSBvciBDVkUgd2FzIGlzc3VlZC4KKyAqCisgKiBB
IGJ1Z2ZpeCBpbiBYZW4gNC4xMyBhbHRlcmVkIENPTlNPTEVJT193cml0ZSB0byB0b2xlcmF0ZSBw
YXNzaW5nIE5VTAorICogY2hhcmFjdGVycyBpbnRhY3QsIGFzIHRoaXMgaXMgYSByZXF1aXJlbWVu
dCBmb3IgdmFyaW91cyBUVFkgc2V0dXBzLgorICoKKyAqIEEgc2lnbmVkLW5lc3MgaXNzdWUgd2l0
aCB0aGUgbGVuZ3RoIGNhbGN1bGF0aW9uIGxlYWQgdG8gYSBjYXNlIHdoZXJlIFhlbgorICogd2ls
bCBjb3B5IGJldHdlZW4gMiBhbmQgNEcgb2YgZ3Vlc3QgcHJvdmlkZWQgZGF0YSBpbnRvIGEgMTI4
IGJ5dGUgb2JqZWN0IG9uCisgKiB0aGUgc3RhY2suCisgKgorICogQHNlZSB0ZXN0cy94c2EtY29u
c29sZWlvLXdyaXRlL21haW4uYworICovCisjaW5jbHVkZSA8eHRmLmg+CisKK2NvbnN0IGNoYXIg
dGVzdF90aXRsZVtdID0gIkNPTlNPTEVJT193cml0ZSBzdGFjayBvdmVyZmxvdyBQb0MiOworCit1
aW50OF90IHplcm9fcGFnZVtQQUdFX1NJWkVdIF9fcGFnZV9hbGlnbmVkX2JzczsKKworLyogSGF2
ZSB0aGUgYXNzZW1ibGVyIGJ1aWxkIGFuIEwxL0wyIHBhaXIgbWFwcGluZyB6ZXJvX3BhZ2VbXSBt
YW55IHRpbWVzLiAqLworYXNtICgiLnNlY3Rpb24gXCIuZGF0YS5wYWdlX2FsaWduZWRcIiwgXCJh
d1wiOyIKKyAgICAgIi5hbGlnbiA0MDk2OyIKKworICAgICAibDF0OiIKKyAgICAgIi5yZXB0IDUx
MjsiCisgICAgICIubG9uZyB6ZXJvX3BhZ2UgKyAiU1RSKFBGX1NZTShBRCwgUCkpIiwgMDsiCisg
ICAgICIuZW5kcjsiCisgICAgICIuc2l6ZSBsMXQsIC4gLSBsMXQ7IgorICAgICAiLnR5cGUgbDF0
LCBAb2JqZWN0OyIKKworICAgICAibDJ0OiIKKyAgICAgIi5yZXB0IDUxMjsiCisgICAgICIubG9u
ZyBsMXQgKyAiU1RSKFBGX1NZTShBRCwgUCkpIiwgMDsiCisgICAgICIuZW5kcjsiCisgICAgICIu
c2l6ZSBsMnQsIC4gLSBsMnQ7IgorICAgICAiLnR5cGUgbDJ0LCBAb2JqZWN0OyIKKworICAgICAi
LnByZXZpb3VzOyIKKyAgICApOworZXh0ZXJuIGludHB0ZV90IGwydFs1MTJdOworCit2b2lkIHRl
c3RfbWFpbih2b2lkKQoreworICAgIC8qIE1hcCAyRyB3b3J0aCBvZiB6ZXJvX3BhZ2VbXSBzdGFy
dGluZyBmcm9tIDFHLi4uICovCisgICAgcGFlX2wzX2lkZW50bWFwWzFdID0gcGFlX2wzX2lkZW50
bWFwWzJdID0gcHRlX2Zyb21fdmlydChsMnQsIFBGX1NZTShBRCwgUCkpOworCisgICAgLyoKKyAg
ICAgKiAuLi4gLCB3cml0ZSB0aG9zZSB6ZXJvcyB3aXRoIGEgbGVuZ3RoIHBvc3NpYmxlIHRvIGJl
IGNvbmZ1c2VkIGJ5IGEKKyAgICAgKiBzaWduZWQgYm91bmRzIGNoZWNrLi4uCisgICAgICovCisg
ICAgaHlwZXJjYWxsX2NvbnNvbGVfd3JpdGUoX3AoR0IoMSkpLCAweDgwMDAwMDAwKTsKKworICAg
IC8qIC4uLiBhbmQgaWYgWGVuIGlzIHN0aWxsIGFsaXZlLCBpdCBkaWRuJ3QgdHJhbXBsZSBvdmVy
IGl0cyBvd24gc3RhY2suICovCisKKyAgICB4dGZfc3VjY2VzcygiU3VjY2VzczogTm90IHZ1bG5l
cmFibGUgdG8gQ09OU09MRUlPX3dyaXRlIHN0YWNrIG92ZXJmbG93XG4iKTsKK30KKworLyoKKyAq
IExvY2FsIHZhcmlhYmxlczoKKyAqIG1vZGU6IEMKKyAqIGMtZmlsZS1zdHlsZTogIkJTRCIKKyAq
IGMtYmFzaWMtb2Zmc2V0OiA0CisgKiB0YWItd2lkdGg6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6
IG5pbAorICogRW5kOgorICovCi0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
