Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3953C990
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 12:58:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haeSM-0006uO-UI; Tue, 11 Jun 2019 10:56:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LgYn=UK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1haeSL-0006uJ-0o
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 10:56:45 +0000
X-Inumbo-ID: 97021eee-8c37-11e9-bc32-23d53856b8c0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97021eee-8c37-11e9-bc32-23d53856b8c0;
 Tue, 11 Jun 2019 10:56:40 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: D3tCepL7+edETIQUuCINKpMOCvLM6Z3KqmRai04y4638wSfv2P/bu0+rQf6eoY43xkCgONl5h2
 sqlGiwbpwyhaP4AXnDs8xQBlgxSbvcSxMAZ1yDCEEg15C7qkyQUpBbRYIREE8jz2OHfp+n9N//
 UiuleiQVDRx+ZrkdLULwqBlJ4ZoIEr3vQayhwCJaXG5qGHTV2cgZl01yxi2BDJsqRhTf6WWVKF
 KENcT6s8wKv+EbrFXOUJXKgx1dn1l8VoVS13TU8lSO86edqAob2nC81LoVaV7TYy2yLFWbnCpE
 EwI=
X-SBRS: 2.7
X-MesageID: 1569138
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,578,1557201600"; 
   d="scan'208";a="1569138"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Tue, 11 Jun 2019 11:56:36 +0100
Message-ID: <1560250596-26821-1-git-send-email-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] automation: Fix CI with the fedora container
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Doug
 Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSByZWNlbnQgcmVidWlsZCBvZiB0aGUgQ0kgY29udGFuaWVycyBzd2l0Y2hlZCBmcm9tIEZlZG9y
YSAyOSB0byAzMCBiZWNhdXNlCnRoZSBkb2NrZXJmaWxlIGlzIHRhcmdldHRpbmcgbGF0ZXN0LgoK
VW5mb3J0dW5hdGVseSwgdGhlIHZlcnNpb24gb2YgaVBYRSBpbiBtYXN0ZXIgZG9lc24ndCBidWls
ZCB3aXRoIHRoZSBkZWZhdWx0CkdDQyBpbiBGZWRvcmEgMzAsIHdoaWNoIGlzIGJsb2NraW5nIGFs
bCBDSSBhY3Rpdml0eS4KClN3aXRjaCBmcm9tIGxhdGVzdCB0byBhbiBleHBsaWNpdCB2ZXJzaW9u
LCB0byBhdm9pZCBmdXR1cmUgYnJlYWthZ2UuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
CkNDOiBEb3VnIEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+CgpJIGhhdmUgYWxyZWFkeSBw
dXNoZWQgYW4gInVwZGF0ZWQiIGZlZG9yYTpsYXRlc3QgY29udGFpbmVyIHdoaWNoIGlzIGFjdHVh
bGx5CjI5IHRvIHVuYmxvY2sgZXhpc3RpbmcgQ0ksIGFuZCBwdXNoZWQgZmVkb3JhOjI5IGJ1aWx0
IGZyb20gdGhpcyBkb2NrZXJmaWxlLgotLS0KIGF1dG9tYXRpb24vYnVpbGQvZmVkb3JhL3tsYXRl
c3QuZG9ja2VyZmlsZSA9PiAyOS5kb2NrZXJmaWxlfSB8IDIgKy0KIGF1dG9tYXRpb24vZ2l0bGFi
LWNpL2J1aWxkLnlhbWwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQogYXV0
b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CiByZW5hbWUgYXV0b21hdGlvbi9idWlsZC9mZWRvcmEve2xhdGVzdC5kb2NrZXJmaWxlID0+IDI5
LmRvY2tlcmZpbGV9ICg5NyUpCgpkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9idWlsZC9mZWRvcmEv
bGF0ZXN0LmRvY2tlcmZpbGUgYi9hdXRvbWF0aW9uL2J1aWxkL2ZlZG9yYS8yOS5kb2NrZXJmaWxl
CnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFtZSBmcm9tIGF1dG9tYXRpb24vYnVpbGQvZmVkb3Jh
L2xhdGVzdC5kb2NrZXJmaWxlCnJlbmFtZSB0byBhdXRvbWF0aW9uL2J1aWxkL2ZlZG9yYS8yOS5k
b2NrZXJmaWxlCmluZGV4IGUwZGI3YWYuLjhhZDBiMmIgMTAwNjQ0Ci0tLSBhL2F1dG9tYXRpb24v
YnVpbGQvZmVkb3JhL2xhdGVzdC5kb2NrZXJmaWxlCisrKyBiL2F1dG9tYXRpb24vYnVpbGQvZmVk
b3JhLzI5LmRvY2tlcmZpbGUKQEAgLTEsNCArMSw0IEBACi1GUk9NIGZlZG9yYTpsYXRlc3QKK0ZS
T00gZmVkb3JhOjI5CiBMQUJFTCBtYWludGFpbmVyLm5hbWU9IlRoZSBYZW4gUHJvamVjdCIgXAog
ICAgICAgbWFpbnRhaW5lci5lbWFpbD0ieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIgog
CmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sIGIvYXV0b21hdGlv
bi9naXRsYWItY2kvYnVpbGQueWFtbAppbmRleCAxN2RlM2IxLi4xZTYxZDMwIDEwMDY0NAotLS0g
YS9hdXRvbWF0aW9uL2dpdGxhYi1jaS9idWlsZC55YW1sCisrKyBiL2F1dG9tYXRpb24vZ2l0bGFi
LWNpL2J1aWxkLnlhbWwKQEAgLTM0MSwxMiArMzQxLDEyIEBAIGRlYmlhbi11bnN0YWJsZS0zMi1n
Y2MtZGVidWc6CiBmZWRvcmEtZ2NjOgogICBleHRlbmRzOiAuZ2NjLXg4Ni02NC1idWlsZAogICB2
YXJpYWJsZXM6Ci0gICAgQ09OVEFJTkVSOiBmZWRvcmE6bGF0ZXN0CisgICAgQ09OVEFJTkVSOiBm
ZWRvcmE6MjkKIAogZmVkb3JhLWdjYy1kZWJ1ZzoKICAgZXh0ZW5kczogLmdjYy14ODYtNjQtYnVp
bGQtZGVidWcKICAgdmFyaWFibGVzOgotICAgIENPTlRBSU5FUjogZmVkb3JhOmxhdGVzdAorICAg
IENPTlRBSU5FUjogZmVkb3JhOjI5CiAKICMgVWJ1bnR1IFRydXN0eSdzIENsYW5nIGlzIDMuNCB3
aGlsZSBYZW4gcmVxdWlyZXMgMy41CiAKZGlmZiAtLWdpdCBhL2F1dG9tYXRpb24vc2NyaXB0cy9j
b250YWluZXJpemUgYi9hdXRvbWF0aW9uL3NjcmlwdHMvY29udGFpbmVyaXplCmluZGV4IGE3ODA5
YjMuLmRjNmQ0ZjMgMTAwNzU1Ci0tLSBhL2F1dG9tYXRpb24vc2NyaXB0cy9jb250YWluZXJpemUK
KysrIGIvYXV0b21hdGlvbi9zY3JpcHRzL2NvbnRhaW5lcml6ZQpAQCAtMTksNyArMTksNyBAQCBj
YXNlICJfJHtDT05UQUlORVJ9IiBpbgogICAgIF9jZW50b3M2KSBDT05UQUlORVI9IiR7QkFTRX0v
Y2VudG9zOjYiIDs7CiAgICAgX2NlbnRvczcpIENPTlRBSU5FUj0iJHtCQVNFfS9jZW50b3M6NyIg
OzsKICAgICBfY2VudG9zNzIpIENPTlRBSU5FUj0iJHtCQVNFfS9jZW50b3M6Ny4yIiA7OwotICAg
IF9mZWRvcmEpIENPTlRBSU5FUj0iJHtCQVNFfS9mZWRvcmE6bGF0ZXN0Ijs7CisgICAgX2ZlZG9y
YSkgQ09OVEFJTkVSPSIke0JBU0V9L2ZlZG9yYToyOSI7OwogICAgIF9qZXNzaWUpIENPTlRBSU5F
Uj0iJHtCQVNFfS9kZWJpYW46amVzc2llIiA7OwogICAgIF9zdHJldGNofF8pIENPTlRBSU5FUj0i
JHtCQVNFfS9kZWJpYW46c3RyZXRjaCIgOzsKICAgICBfdHJ1c3R5KSBDT05UQUlORVI9IiR7QkFT
RX0vdWJ1bnR1OnRydXN0eSIgOzsKLS0gCjIuMS40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
