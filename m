Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28906C8736
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 13:23:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFcg0-00017X-Rz; Wed, 02 Oct 2019 11:20:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFcfz-00017I-DX
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 11:20:11 +0000
X-Inumbo-ID: 977f14e4-e506-11e9-9713-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 977f14e4-e506-11e9-9713-12813bfff9fa;
 Wed, 02 Oct 2019 11:20:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DEED0AF97;
 Wed,  2 Oct 2019 11:20:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  2 Oct 2019 13:20:01 +0200
Message-Id: <20191002112004.25793-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191002112004.25793-1-jgross@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/6] libs: add libxenhypfs
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHRoZSBuZXcgbGlicmFyeSBsaWJ4ZW5oeXBmcyBmb3IgYWNjZXNzIHRvIHRoZSBoeXBlcnZp
c29yIGZpbGVzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tClYxOgotIHJlbmFtZSB0byBsaWJ4ZW5oeXBmcwotIGFkZCB4ZW5oeXBmc193cml0ZSgpCi0t
LQogdG9vbHMvUnVsZXMubWsgICAgICAgICAgICAgICAgICAgICAgfCAgIDYgKwogdG9vbHMvbGli
cy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAgIDEgKwogdG9vbHMvbGlicy9oeXBmcy9NYWtl
ZmlsZSAgICAgICAgICAgfCAgMTQgKysKIHRvb2xzL2xpYnMvaHlwZnMvY29yZS5jICAgICAgICAg
ICAgIHwgMjUyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdG9vbHMvbGli
cy9oeXBmcy9pbmNsdWRlL3hlbmh5cGZzLmggfCAgNjAgKysrKysrKysrCiB0b29scy9saWJzL2h5
cGZzL2xpYnhlbmh5cGZzLm1hcCAgICB8ICAgOSArKwogdG9vbHMvbGlicy9oeXBmcy94ZW5oeXBm
cy5wYy5pbiAgICAgfCAgMTAgKysKIDcgZmlsZXMgY2hhbmdlZCwgMzUyIGluc2VydGlvbnMoKykK
IGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2h5cGZzL01ha2VmaWxlCiBjcmVhdGUgbW9k
ZSAxMDA2NDQgdG9vbHMvbGlicy9oeXBmcy9jb3JlLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29s
cy9saWJzL2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xz
L2xpYnMvaHlwZnMvbGlieGVuaHlwZnMubWFwCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGli
cy9oeXBmcy94ZW5oeXBmcy5wYy5pbgoKZGlmZiAtLWdpdCBhL3Rvb2xzL1J1bGVzLm1rIGIvdG9v
bHMvUnVsZXMubWsKaW5kZXggY2Y4OTM1ZDZhMy4uYjFlYmI0Yzk2YyAxMDA2NDQKLS0tIGEvdG9v
bHMvUnVsZXMubWsKKysrIGIvdG9vbHMvUnVsZXMubWsKQEAgLTE5LDYgKzE5LDcgQEAgWEVOX0xJ
QlhFTkdOVFRBQiAgID0gJChYRU5fUk9PVCkvdG9vbHMvbGlicy9nbnR0YWIKIFhFTl9MSUJYRU5D
QUxMICAgICA9ICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnMvY2FsbAogWEVOX0xJQlhFTkZPUkVJR05N
RU1PUlkgPSAkKFhFTl9ST09UKS90b29scy9saWJzL2ZvcmVpZ25tZW1vcnkKIFhFTl9MSUJYRU5E
RVZJQ0VNT0RFTCA9ICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnMvZGV2aWNlbW9kZWwKK1hFTl9MSUJY
RU5IWVBGUyAgICA9ICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnMvaHlwZnMKIFhFTl9MSUJYQyAgICAg
ICAgICA9ICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnhjCiBYRU5fWEVOTElHSFQgICAgICAgPSAkKFhF
Tl9ST09UKS90b29scy9saWJ4bAogIyBDdXJyZW50bHkgbGlieGx1dGlsIGxpdmVzIGluIHRoZSBz
YW1lIGRpcmVjdG9yeSBhcyBsaWJ4ZW5saWdodApAQCAtMTM0LDYgKzEzNSwxMSBAQCBTSERFUFNf
bGlieGVuZGV2aWNlbW9kZWwgPSAkKFNITElCX2xpYnhlbnRvb2xsb2cpICQoU0hMSUJfbGlieGVu
dG9vbGNvcmUpICQoU0hMSQogTERMSUJTX2xpYnhlbmRldmljZW1vZGVsID0gJChTSERFUFNfbGli
eGVuZGV2aWNlbW9kZWwpICQoWEVOX0xJQlhFTkRFVklDRU1PREVMKS9saWJ4ZW5kZXZpY2Vtb2Rl
bCQobGliZXh0ZW5zaW9uKQogU0hMSUJfbGlieGVuZGV2aWNlbW9kZWwgID0gJChTSERFUFNfbGli
eGVuZGV2aWNlbW9kZWwpIC1XbCwtcnBhdGgtbGluaz0kKFhFTl9MSUJYRU5ERVZJQ0VNT0RFTCkK
IAorQ0ZMQUdTX2xpYnhlbmh5cGZzID0gLUkkKFhFTl9MSUJYRU5IWVBGUykvaW5jbHVkZSAkKENG
TEFHU194ZW5pbmNsdWRlKQorU0hERVBTX2xpYnhlbmh5cGZzID0gJChTSExJQl9saWJ4ZW50b29s
bG9nKSAkKFNITElCX2xpYnhlbnRvb2xjb3JlKSAkKFNITElCX3hlbmNhbGwpCitMRExJQlNfbGli
eGVuaHlwZnMgPSAkKFNIREVQU19saWJ4ZW5oeXBmcykgJChYRU5fTElCWEVOSFlQRlMpL2xpYnhl
bmh5cGZzJChsaWJleHRlbnNpb24pCitTSExJQl9saWJ4ZW5oeXBmcyAgPSAkKFNIREVQU19saWJ4
ZW5oeXBmcykgLVdsLC1ycGF0aC1saW5rPSQoWEVOX0xJQlhFTkhZUEZTKQorCiAjIGNvZGUgd2hp
Y2ggY29tcGlsZXMgYWdhaW5zdCBsaWJ4ZW5jdHJsIGdldCBfX1hFTl9UT09MU19fIGFuZAogIyB0
aGVyZWZvcmUgc2VlcyB0aGUgdW5zdGFibGUgaHlwZXJjYWxsIGludGVyZmFjZXMuCiBDRkxBR1Nf
bGlieGVuY3RybCA9IC1JJChYRU5fTElCWEMpL2luY2x1ZGUgJChDRkxBR1NfbGlieGVudG9vbGxv
ZykgJChDRkxBR1NfbGlieGVuZm9yZWlnbm1lbW9yeSkgJChDRkxBR1NfbGlieGVuZGV2aWNlbW9k
ZWwpICQoQ0ZMQUdTX3hlbmluY2x1ZGUpIC1EX19YRU5fVE9PTFNfXwpkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlicy9NYWtlZmlsZSBiL3Rvb2xzL2xpYnMvTWFrZWZpbGUKaW5kZXggODg5MDFlNzM0MS4u
NjljZGZiNTk3NSAxMDA2NDQKLS0tIGEvdG9vbHMvbGlicy9NYWtlZmlsZQorKysgYi90b29scy9s
aWJzL01ha2VmaWxlCkBAIC05LDYgKzksNyBAQCBTVUJESVJTLXkgKz0gZ250dGFiCiBTVUJESVJT
LXkgKz0gY2FsbAogU1VCRElSUy15ICs9IGZvcmVpZ25tZW1vcnkKIFNVQkRJUlMteSArPSBkZXZp
Y2Vtb2RlbAorU1VCRElSUy15ICs9IGh5cGZzCiAKIGlmZXEgKCQoQ09ORklHX1JVTVApLHkpCiBT
VUJESVJTLXkgOj0gdG9vbGNvcmUKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvaHlwZnMvTWFrZWZp
bGUgYi90b29scy9saWJzL2h5cGZzL01ha2VmaWxlCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4
IDAwMDAwMDAwMDAuLmM1NzE1OTc2ODYKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9saWJzL2h5
cGZzL01ha2VmaWxlCkBAIC0wLDAgKzEsMTQgQEAKK1hFTl9ST09UID0gJChDVVJESVIpLy4uLy4u
Ly4uCitpbmNsdWRlICQoWEVOX1JPT1QpL3Rvb2xzL1J1bGVzLm1rCisKK01BSk9SICAgID0gMQor
TUlOT1IgICAgPSAwCitMSUJOQU1FICA6PSBoeXBmcworVVNFTElCUyAgOj0gdG9vbGxvZyB0b29s
Y29yZSBjYWxsCisKK1NSQ1MteSAgICAgICAgICAgICAgICAgKz0gY29yZS5jCisKK2luY2x1ZGUg
Li4vbGlicy5taworCiskKFBLR19DT05GSUdfTE9DQUwpOiBQS0dfQ09ORklHX0lOQ0RJUiA9ICQo
WEVOX0xJQlhFTkhZUEZTKS9pbmNsdWRlCiskKFBLR19DT05GSUdfTE9DQUwpOiBQS0dfQ09ORklH
X0NGTEFHU19MT0NBTCA9ICQoQ0ZMQUdTX3hlbmluY2x1ZGUpCmRpZmYgLS1naXQgYS90b29scy9s
aWJzL2h5cGZzL2NvcmUuYyBiL3Rvb2xzL2xpYnMvaHlwZnMvY29yZS5jCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmVkYmYzN2YyYzEKLS0tIC9kZXYvbnVsbAorKysgYi90
b29scy9saWJzL2h5cGZzL2NvcmUuYwpAQCAtMCwwICsxLDI1MiBAQAorLyoKKyAqIENvcHlyaWdo
dCAoYykgMjAxOSBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgKKyAqCisgKiBU
aGlzIGxpYnJhcnkgaXMgZnJlZSBzb2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5k
L29yCisgKiBtb2RpZnkgaXQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVy
YWwgUHVibGljCisgKiBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBG
b3VuZGF0aW9uOworICogdmVyc2lvbiAyLjEgb2YgdGhlIExpY2Vuc2UuCisgKgorICogVGhpcyBs
aWJyYXJ5IGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWws
CisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZSBHTlUKKyAqIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGZvciBtb3JlIGRldGFpbHMuCisgKgorICogWW91IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29w
eSBvZiB0aGUgR05VIExlc3NlciBHZW5lcmFsIFB1YmxpYworICogTGljZW5zZSBhbG9uZyB3aXRo
IHRoaXMgbGlicmFyeTsgSWYgbm90LCBzZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+
LgorICovCisKKyNkZWZpbmUgX19YRU5fVE9PTFNfXyAxCisKKyNpbmNsdWRlIDxlcnJuby5oPgor
I2luY2x1ZGUgPHN0ZGxpYi5oPgorI2luY2x1ZGUgPHN0cmluZy5oPgorCisjaW5jbHVkZSA8eGVu
dG9vbGxvZy5oPgorI2luY2x1ZGUgPHhlbmh5cGZzLmg+CisjaW5jbHVkZSA8eGVuY2FsbC5oPgor
CisjaW5jbHVkZSA8eGVudG9vbGNvcmVfaW50ZXJuYWwuaD4KKworc3RydWN0IHhlbmh5cGZzX2hh
bmRsZSB7CisgICAgeGVudG9vbGxvZ19sb2dnZXIgKmxvZ2dlciwgKmxvZ2dlcl90b2ZyZWU7Cisg
ICAgdW5zaWduZWQgaW50IGZsYWdzOworICAgIHhlbmNhbGxfaGFuZGxlICp4Y2FsbDsKK307CisK
K3hlbmh5cGZzX2hhbmRsZSAqeGVuaHlwZnNfb3Blbih4ZW50b29sbG9nX2xvZ2dlciAqbG9nZ2Vy
LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIG9wZW5fZmxhZ3MpCit7
CisgICAgeGVuaHlwZnNfaGFuZGxlICpmc2hkbCA9IGNhbGxvYygxLCBzaXplb2YoKmZzaGRsKSk7
CisKKyAgICBpZiAoIWZzaGRsKQorICAgICAgICByZXR1cm4gTlVMTDsKKworICAgIGZzaGRsLT5m
bGFncyA9IG9wZW5fZmxhZ3M7CisgICAgZnNoZGwtPmxvZ2dlciA9IGxvZ2dlcjsKKyAgICBmc2hk
bC0+bG9nZ2VyX3RvZnJlZSA9IE5VTEw7CisKKyAgICBpZiAoIWZzaGRsLT5sb2dnZXIpIHsKKyAg
ICAgICAgZnNoZGwtPmxvZ2dlciA9IGZzaGRsLT5sb2dnZXJfdG9mcmVlID0KKyAgICAgICAgICAg
ICh4ZW50b29sbG9nX2xvZ2dlciopCisgICAgICAgICAgICB4dGxfY3JlYXRlbG9nZ2VyX3N0ZGlv
c3RyZWFtKHN0ZGVyciwgWFRMX1BST0dSRVNTLCAwKTsKKyAgICAgICAgaWYgKCFmc2hkbC0+bG9n
Z2VyKQorICAgICAgICAgICAgZ290byBlcnI7CisgICAgfQorCisgICAgZnNoZGwtPnhjYWxsID0g
eGVuY2FsbF9vcGVuKGZzaGRsLT5sb2dnZXIsIDApOworICAgIGlmICghZnNoZGwtPnhjYWxsKQor
ICAgICAgICBnb3RvIGVycjsKKworCisgICAgcmV0dXJuIGZzaGRsOworCitlcnI6CisgICAgeHRs
X2xvZ2dlcl9kZXN0cm95KGZzaGRsLT5sb2dnZXJfdG9mcmVlKTsKKyAgICB4ZW5jYWxsX2Nsb3Nl
KGZzaGRsLT54Y2FsbCk7CisgICAgZnJlZShmc2hkbCk7CisgICAgcmV0dXJuIE5VTEw7Cit9CisK
K2ludCB4ZW5oeXBmc19jbG9zZSh4ZW5oeXBmc19oYW5kbGUgKmZzaGRsKQoreworICAgIGlmICgh
ZnNoZGwpCisgICAgICAgIHJldHVybiAwOworCisgICAgeGVuY2FsbF9jbG9zZShmc2hkbC0+eGNh
bGwpOworICAgIHh0bF9sb2dnZXJfZGVzdHJveShmc2hkbC0+bG9nZ2VyX3RvZnJlZSk7CisgICAg
ZnJlZShmc2hkbCk7CisgICAgcmV0dXJuIDA7Cit9CisKK3N0YXRpYyBpbnQgeGVuaHlwZnNfZ2V0
X3BhdGhidWYoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwgY29uc3QgY2hhciAqcGF0aCwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY2hhciAqKnBhdGhfYnVmKQoreworICAgIGludCBy
ZXQgPSAtMTsKKyAgICBpbnQgcGF0aF9zejsKKworICAgIGlmICghZnNoZGwpIHsKKyAgICAgICAg
ZXJybm8gPSBFQkFERjsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorCisgICAgcGF0aF9zeiA9
IHN0cmxlbihwYXRoKSArIDE7CisgICAgaWYgKHBhdGhfc3ogPiBYRU5fSFlQRlNfTUFYX1BBVEhM
RU4pCisgICAgeworICAgICAgICBlcnJubyA9IEVOQU1FVE9PTE9ORzsKKyAgICAgICAgZ290byBv
dXQ7CisgICAgfQorCisgICAgKnBhdGhfYnVmID0geGVuY2FsbF9hbGxvY19idWZmZXIoZnNoZGwt
PnhjYWxsLCBwYXRoX3N6KTsKKyAgICBpZiAoISpwYXRoX2J1ZikgeworICAgICAgICBlcnJubyA9
IEVOT01FTTsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorICAgIHN0cmNweSgqcGF0aF9idWYs
IHBhdGgpOworCisgICAgcmV0ID0gcGF0aF9zejsKKworIG91dDoKKyAgICByZXR1cm4gcmV0Owor
fQorCitzdGF0aWMgdm9pZCAqeGVuaHlwZnNfcmVhZF9hbnkoeGVuaHlwZnNfaGFuZGxlICpmc2hk
bCwgY29uc3QgY2hhciAqcGF0aCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgY21kKQoreworICAgIGNoYXIgKmJ1ZiA9IE5VTEwsICpwYXRoX2J1ZiA9IE5VTEw7
CisgICAgaW50IHJldDsKKyAgICBpbnQgc3osIHBhdGhfc3o7CisKKyAgICByZXQgPSB4ZW5oeXBm
c19nZXRfcGF0aGJ1Zihmc2hkbCwgcGF0aCwgJnBhdGhfYnVmKTsKKyAgICBpZiAocmV0IDwgMCkK
KyAgICAgICAgZ290byBvdXQ7CisKKyAgICBwYXRoX3N6ID0gcmV0OworCisgICAgZm9yIChzeiA9
IDQwOTY7IHN6ID4gMDsgc3ogPSByZXQpIHsKKyAgICAgICAgaWYgKGJ1ZikKKyAgICAgICAgICAg
IHhlbmNhbGxfZnJlZV9idWZmZXIoZnNoZGwtPnhjYWxsLCBidWYpOworCisgICAgICAgIGJ1ZiA9
IHhlbmNhbGxfYWxsb2NfYnVmZmVyKGZzaGRsLT54Y2FsbCwgc3opOworICAgICAgICBpZiAoIWJ1
ZikgeworICAgICAgICAgICAgZXJybm8gPSBFTk9NRU07CisgICAgICAgICAgICBnb3RvIG91dDsK
KyAgICAgICAgfQorCisgICAgICAgIHJldCA9IHhlbmNhbGw1KGZzaGRsLT54Y2FsbCwgX19IWVBF
UlZJU09SX2h5cGZzX29wLCBjbWQsCisgICAgICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBs
b25nKXBhdGhfYnVmLCBwYXRoX3N6LAorICAgICAgICAgICAgICAgICAgICAgICAodW5zaWduZWQg
bG9uZylidWYsIHN6KTsKKyAgICB9CisKKyAgICBpZiAocmV0IDwgMCkgeworICAgICAgICBlcnJu
byA9IC1yZXQ7CisgICAgICAgIHhlbmNhbGxfZnJlZV9idWZmZXIoZnNoZGwtPnhjYWxsLCBidWYp
OworICAgICAgICBidWYgPSBOVUxMOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyBvdXQ6
CisgICAgcmV0ID0gZXJybm87CisgICAgeGVuY2FsbF9mcmVlX2J1ZmZlcihmc2hkbC0+eGNhbGws
IHBhdGhfYnVmKTsKKyAgICBlcnJubyA9IHJldDsKKworICAgIHJldHVybiBidWY7Cit9CisKK2No
YXIgKnhlbmh5cGZzX3JlYWQoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwgY29uc3QgY2hhciAqcGF0
aCkKK3sKKyAgICBjaGFyICpidWYsICpyZXRfYnVmID0gTlVMTDsKKyAgICBpbnQgcmV0OworCisg
ICAgYnVmID0geGVuaHlwZnNfcmVhZF9hbnkoZnNoZGwsIHBhdGgsIFhFTl9IWVBGU19PUF9yZWFk
X2NvbnRlbnRzKTsKKyAgICBpZiAoYnVmKQorICAgICAgICByZXRfYnVmID0gc3RyZHVwKGJ1Zik7
CisKKyAgICByZXQgPSBlcnJubzsKKyAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRsLT54Y2Fs
bCwgYnVmKTsKKyAgICBlcnJubyA9IHJldDsKKworICAgIHJldHVybiByZXRfYnVmOworfQorCitz
dHJ1Y3QgeGVuaHlwZnNfZGlyZW50ICp4ZW5oeXBmc19yZWFkZGlyKHhlbmh5cGZzX2hhbmRsZSAq
ZnNoZGwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNo
YXIgKnBhdGgsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2ln
bmVkIGludCAqbnVtX2VudHJpZXMpCit7CisgICAgdm9pZCAqYnVmLCAqY3VycjsKKyAgICBpbnQg
cmV0OworICAgIGNoYXIgKm5hbWVzOworICAgIHN0cnVjdCB4ZW5oeXBmc19kaXJlbnQgKnJldF9i
dWYgPSBOVUxMOworICAgIHVuc2lnbmVkIGludCBuLCBuYW1lX3N6ID0gMDsKKyAgICBzdHJ1Y3Qg
eGVuX2h5cGZzX2RpcmVudHJ5ICplbnRyeTsKKworICAgIGJ1ZiA9IHhlbmh5cGZzX3JlYWRfYW55
KGZzaGRsLCBwYXRoLCBYRU5fSFlQRlNfT1BfcmVhZF9kaXIpOworICAgIGlmICghYnVmKQorICAg
ICAgICBnb3RvIG91dDsKKworICAgIGN1cnIgPSBidWY7CisgICAgZm9yIChuID0gMTs7IG4rKykg
eworICAgICAgICBlbnRyeSA9IGN1cnI7CisgICAgICAgIG5hbWVfc3ogKz0gc3RybGVuKGVudHJ5
LT5uYW1lKSArIDE7CisgICAgICAgIGlmICghZW50cnktPm9mZl9uZXh0KQorICAgICAgICAgICAg
YnJlYWs7CisKKyAgICAgICAgY3VyciArPSBlbnRyeS0+b2ZmX25leHQ7CisgICAgfQorCisgICAg
cmV0X2J1ZiA9IG1hbGxvYyhuICogc2l6ZW9mKCpyZXRfYnVmKSArIG5hbWVfc3opOworICAgIGlm
ICghcmV0X2J1ZikKKyAgICAgICAgZ290byBvdXQ7CisKKyAgICAqbnVtX2VudHJpZXMgPSBuOwor
ICAgIG5hbWVzID0gKGNoYXIgKikocmV0X2J1ZiAgKyBuKTsKKyAgICBjdXJyID0gYnVmOworICAg
IGZvciAobiA9IDA7IG4gPCAqbnVtX2VudHJpZXM7IG4rKykgeworICAgICAgICBlbnRyeSA9IGN1
cnI7CisgICAgICAgIHJldF9idWZbbl0ubmFtZSA9IG5hbWVzOworICAgICAgICByZXRfYnVmW25d
LmlzX2RpciA9IGVudHJ5LT5mbGFncyAmIFhFTl9IWVBGU19JU0RJUjsKKyAgICAgICAgc3RyY3B5
KG5hbWVzLCBlbnRyeS0+bmFtZSk7CisgICAgICAgIG5hbWVzICs9IHN0cmxlbihlbnRyeS0+bmFt
ZSkgKyAxOworICAgICAgICBjdXJyICs9IGVudHJ5LT5vZmZfbmV4dDsKKyAgICB9CisKKyBvdXQ6
CisgICAgcmV0ID0gZXJybm87CisgICAgeGVuY2FsbF9mcmVlX2J1ZmZlcihmc2hkbC0+eGNhbGws
IGJ1Zik7CisgICAgZXJybm8gPSByZXQ7CisKKyAgICByZXR1cm4gcmV0X2J1ZjsKK30KKworaW50
IHhlbmh5cGZzX3dyaXRlKHhlbmh5cGZzX2hhbmRsZSAqZnNoZGwsIGNvbnN0IGNoYXIgKnBhdGgs
IGNvbnN0IGNoYXIgKnZhbCkKK3sKKyAgICBjaGFyICpidWYgPSBOVUxMLCAqcGF0aF9idWYgPSBO
VUxMOworICAgIGludCByZXQsIHNhdmVkX2Vycm5vOworICAgIGludCBzeiwgcGF0aF9zejsKKwor
ICAgIHJldCA9IHhlbmh5cGZzX2dldF9wYXRoYnVmKGZzaGRsLCBwYXRoLCAmcGF0aF9idWYpOwor
ICAgIGlmIChyZXQgPCAwKQorICAgICAgICBnb3RvIG91dDsKKworICAgIHBhdGhfc3ogPSByZXQ7
CisKKyAgICBzeiA9IHN0cmxlbih2YWwpICsgMTsKKyAgICBidWYgPSB4ZW5jYWxsX2FsbG9jX2J1
ZmZlcihmc2hkbC0+eGNhbGwsIHN6KTsKKyAgICBpZiAoIWJ1ZikgeworICAgICAgICByZXQgPSAt
MTsKKyAgICAgICAgZXJybm8gPSBFTk9NRU07CisgICAgICAgIGdvdG8gb3V0OworICAgIH0KKyAg
ICBzdHJjcHkoYnVmLCB2YWwpOworCisgICAgcmV0ID0geGVuY2FsbDUoZnNoZGwtPnhjYWxsLCBf
X0hZUEVSVklTT1JfaHlwZnNfb3AsCisgICAgICAgICAgICAgICAgICAgWEVOX0hZUEZTX09QX3dy
aXRlX2NvbnRlbnRzLAorICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKXBhdGhfYnVm
LCBwYXRoX3N6LAorICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWJ1Ziwgc3opOwor
Cisgb3V0OgorICAgIHNhdmVkX2Vycm5vID0gZXJybm87CisgICAgeGVuY2FsbF9mcmVlX2J1ZmZl
cihmc2hkbC0+eGNhbGwsIHBhdGhfYnVmKTsKKyAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRs
LT54Y2FsbCwgYnVmKTsKKyAgICBlcnJubyA9IHNhdmVkX2Vycm5vOworICAgIHJldHVybiByZXQ7
Cit9CmRpZmYgLS1naXQgYS90b29scy9saWJzL2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaCBiL3Rv
b2xzL2xpYnMvaHlwZnMvaW5jbHVkZS94ZW5oeXBmcy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLjQ0MzIyMTUxMGEKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9saWJz
L2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaApAQCAtMCwwICsxLDYwIEBACisvKgorICogQ29weXJp
Z2h0IChjKSAyMDE5IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAorICoKKyAq
IFRoaXMgbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBh
bmQvb3IKKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2Vu
ZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb247CisgKiB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZS4KKyAqCisgKiBUaGlz
IGxpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1
bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVk
IHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNV
TEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICogTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vu
c2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdp
dGggdGhpcyBsaWJyYXJ5OyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCisgKi8KKyNpZm5kZWYgWEVOSFlQRlNfSAorI2RlZmluZSBYRU5IWVBGU19ICisKKyNpbmNs
dWRlIDxzdGRib29sLmg+CisjaW5jbHVkZSA8c3RkaW50Lmg+CisKKyNpbmNsdWRlIDx4ZW4veGVu
Lmg+CisjaW5jbHVkZSA8eGVuL2h5cGZzLmg+CisKKy8qIENhbGxlcnMgd2hvIGRvbid0IGNhcmUg
ZG9uJ3QgbmVlZCB0byAjaW5jbHVkZSA8eGVudG9vbGxvZy5oPiAqLworc3RydWN0IHhlbnRvb2xs
b2dfbG9nZ2VyOworCit0eXBlZGVmIHN0cnVjdCB4ZW5oeXBmc19oYW5kbGUgeGVuaHlwZnNfaGFu
ZGxlOworCitzdHJ1Y3QgeGVuaHlwZnNfZGlyZW50IHsKKyAgICBjaGFyICpuYW1lOworICAgIGJv
b2wgaXNfZGlyOworfTsKKworeGVuaHlwZnNfaGFuZGxlICp4ZW5oeXBmc19vcGVuKHN0cnVjdCB4
ZW50b29sbG9nX2xvZ2dlciAqbG9nZ2VyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCBvcGVuX2ZsYWdzKTsKK2ludCB4ZW5oeXBmc19jbG9zZSh4ZW5oeXBmc19o
YW5kbGUgKmZzaGRsKTsKKworLyogUmV0dXJuZWQgYnVmZmVyIHNob3VsZCBiZSBmcmVlZCB2aWEg
ZnJlZSgpLiAqLworY2hhciAqeGVuaHlwZnNfcmVhZCh4ZW5oeXBmc19oYW5kbGUgKmZzaGRsLCBj
b25zdCBjaGFyICpwYXRoKTsKKworLyogUmV0dXJuZWQgYnVmZmVyIHNob3VsZCBiZSBmcmVlZCB2
aWEgZnJlZSgpLiAqLworc3RydWN0IHhlbmh5cGZzX2RpcmVudCAqeGVuaHlwZnNfcmVhZGRpcih4
ZW5oeXBmc19oYW5kbGUgKmZzaGRsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25zdCBjaGFyICpwYXRoLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm51bV9lbnRyaWVzKTsKKworaW50IHhlbmh5cGZzX3dy
aXRlKHhlbmh5cGZzX2hhbmRsZSAqZnNoZGwsIGNvbnN0IGNoYXIgKnBhdGgsIGNvbnN0IGNoYXIg
KnZhbCk7CisKKyNlbmRpZiAvKiBYRU5IWVBGU19IICovCisKKy8qCisgKiBMb2NhbCB2YXJpYWJs
ZXM6CisgKiBtb2RlOiBDCisgKiBjLWZpbGUtc3R5bGU6ICJCU0QiCisgKiBjLWJhc2ljLW9mZnNl
dDogNAorICogdGFiLXdpZHRoOiA0CisgKiBpbmRlbnQtdGFicy1tb2RlOiBuaWwKKyAqIEVuZDoK
KyAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlicy9oeXBmcy9saWJ4ZW5oeXBmcy5tYXAgYi90b29s
cy9saWJzL2h5cGZzL2xpYnhlbmh5cGZzLm1hcApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4zOWM2M2Y0MzY3Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvbGlicy9oeXBm
cy9saWJ4ZW5oeXBmcy5tYXAKQEAgLTAsMCArMSw5IEBACitWRVJTXzEuMCB7CisJZ2xvYmFsOgor
CQl4ZW5oeXBmc19vcGVuOworCQl4ZW5oeXBmc19jbG9zZTsKKwkJeGVuaHlwZnNfcmVhZDsKKwkJ
eGVuaHlwZnNfcmVhZGRpcjsKKwkJeGVuaHlwZnNfd3JpdGU7CisJbG9jYWw6ICo7IC8qIERvIG5v
dCBleHBvc2UgYW55dGhpbmcgYnkgZGVmYXVsdCAqLworfTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xp
YnMvaHlwZnMveGVuaHlwZnMucGMuaW4gYi90b29scy9saWJzL2h5cGZzL3hlbmh5cGZzLnBjLmlu
Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjljYjk2OGYwZGIKLS0tIC9k
ZXYvbnVsbAorKysgYi90b29scy9saWJzL2h5cGZzL3hlbmh5cGZzLnBjLmluCkBAIC0wLDAgKzEs
MTAgQEAKK3ByZWZpeD1AQHByZWZpeEBACitpbmNsdWRlZGlyPUBAaW5jZGlyQEAKK2xpYmRpcj1A
QGxpYmRpckBACisKK05hbWU6IFhlbmh5cGZzCitEZXNjcmlwdGlvbjogVGhlIFhlbmh5cGZzIGxp
YnJhcnkgZm9yIFhlbiBoeXBlcnZpc29yCitWZXJzaW9uOiBAQHZlcnNpb25AQAorQ2ZsYWdzOiAt
SSR7aW5jbHVkZWRpcn0gQEBjZmxhZ3Nsb2NhbEBACitMaWJzOiBAQGxpYnNmbGFnQEAke2xpYmRp
cn0gLWx4ZW5oeXBmcworUmVxdWlyZXMucHJpdmF0ZTogeGVudG9vbGNvcmUseGVudG9vbGxvZyx4
ZW5jYWxsCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
