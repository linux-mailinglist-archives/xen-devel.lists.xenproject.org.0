Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F79E16FF4F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 13:50:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6w5r-0002BG-Ol; Wed, 26 Feb 2020 12:47:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6w5q-0002B2-I6
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 12:47:14 +0000
X-Inumbo-ID: 1a16531a-5896-11ea-8cb6-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a16531a-5896-11ea-8cb6-bc764e2007e4;
 Wed, 26 Feb 2020 12:47:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC591AF3E;
 Wed, 26 Feb 2020 12:47:08 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 26 Feb 2020 13:46:58 +0100
Message-Id: <20200226124705.29212-6-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200226124705.29212-1-jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v6 05/12] libs: add libxenhypfs
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHRoZSBuZXcgbGlicmFyeSBsaWJ4ZW5oeXBmcyBmb3IgYWNjZXNzIHRvIHRoZSBoeXBlcnZp
c29yIGZpbGVzeXN0ZW0uCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+CkFja2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgotLS0KVjE6Ci0gcmVuYW1lIHRv
IGxpYnhlbmh5cGZzCi0gYWRkIHhlbmh5cGZzX3dyaXRlKCkKClYzOgotIG1ham9yIHJld29yayBk
dWUgdG8gbmV3IGh5cGVydmlzb3IgaW50ZXJmYWNlCi0gYWRkIGRlY29tcHJlc3Npb24gY2FwYWJp
bGl0eQoKVjQ6Ci0gYWRkIGRlcGVuZGVuY3kgdG8gbGlieiBpbiBwa2djb25maWcgZmlsZSAoV2Vp
IExpdSkKLS0tCiAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArCiB0
b29scy9SdWxlcy5tayAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArCiB0b29scy9saWJzL01h
a2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArCiB0b29scy9saWJzL2h5cGZzL01ha2VmaWxl
ICAgICAgICAgICB8ICAxNiArKwogdG9vbHMvbGlicy9oeXBmcy9jb3JlLmMgICAgICAgICAgICAg
fCA1NDAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0b29scy9saWJzL2h5
cGZzL2luY2x1ZGUveGVuaHlwZnMuaCB8ICA3NSArKysrKwogdG9vbHMvbGlicy9oeXBmcy9saWJ4
ZW5oeXBmcy5tYXAgICAgfCAgMTAgKwogdG9vbHMvbGlicy9oeXBmcy94ZW5oeXBmcy5wYy5pbiAg
ICAgfCAgMTAgKwogOCBmaWxlcyBjaGFuZ2VkLCA2NjAgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRvb2xzL2xpYnMvaHlwZnMvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0
b29scy9saWJzL2h5cGZzL2NvcmUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHRvb2xzL2xpYnMvaHlw
ZnMvaW5jbHVkZS94ZW5oeXBmcy5oCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy9oeXBm
cy9saWJ4ZW5oeXBmcy5tYXAKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0b29scy9saWJzL2h5cGZzL3hl
bmh5cGZzLnBjLmluCgpkaWZmIC0tZ2l0IGEvLmdpdGlnbm9yZSBiLy5naXRpZ25vcmUKaW5kZXgg
YjI2MjRkZjc5YS4uZTk4YzNmMDU2ZCAxMDA2NDQKLS0tIGEvLmdpdGlnbm9yZQorKysgYi8uZ2l0
aWdub3JlCkBAIC0xMDksNiArMTA5LDggQEAgdG9vbHMvbGlicy9ldnRjaG4vaGVhZGVycy5jaGsK
IHRvb2xzL2xpYnMvZXZ0Y2huL3hlbmV2dGNobi5wYwogdG9vbHMvbGlicy9nbnR0YWIvaGVhZGVy
cy5jaGsKIHRvb2xzL2xpYnMvZ250dGFiL3hlbmdudHRhYi5wYwordG9vbHMvbGlicy9oeXBmcy9o
ZWFkZXJzLmNoawordG9vbHMvbGlicy9oeXBmcy94ZW5oeXBmcy5wYwogdG9vbHMvbGlicy9jYWxs
L2hlYWRlcnMuY2hrCiB0b29scy9saWJzL2NhbGwveGVuY2FsbC5wYwogdG9vbHMvbGlicy9mb3Jl
aWdubWVtb3J5L2hlYWRlcnMuY2hrCmRpZmYgLS1naXQgYS90b29scy9SdWxlcy5tayBiL3Rvb2xz
L1J1bGVzLm1rCmluZGV4IDUyZjQ3YmUzZjguLmEwNDY5N2EzM2MgMTAwNjQ0Ci0tLSBhL3Rvb2xz
L1J1bGVzLm1rCisrKyBiL3Rvb2xzL1J1bGVzLm1rCkBAIC0xOSw2ICsxOSw3IEBAIFhFTl9MSUJY
RU5HTlRUQUIgICA9ICQoWEVOX1JPT1QpL3Rvb2xzL2xpYnMvZ250dGFiCiBYRU5fTElCWEVOQ0FM
TCAgICAgPSAkKFhFTl9ST09UKS90b29scy9saWJzL2NhbGwKIFhFTl9MSUJYRU5GT1JFSUdOTUVN
T1JZID0gJChYRU5fUk9PVCkvdG9vbHMvbGlicy9mb3JlaWdubWVtb3J5CiBYRU5fTElCWEVOREVW
SUNFTU9ERUwgPSAkKFhFTl9ST09UKS90b29scy9saWJzL2RldmljZW1vZGVsCitYRU5fTElCWEVO
SFlQRlMgICAgPSAkKFhFTl9ST09UKS90b29scy9saWJzL2h5cGZzCiBYRU5fTElCWEMgICAgICAg
ICAgPSAkKFhFTl9ST09UKS90b29scy9saWJ4YwogWEVOX1hFTkxJR0hUICAgICAgID0gJChYRU5f
Uk9PVCkvdG9vbHMvbGlieGwKICMgQ3VycmVudGx5IGxpYnhsdXRpbCBsaXZlcyBpbiB0aGUgc2Ft
ZSBkaXJlY3RvcnkgYXMgbGlieGVubGlnaHQKQEAgLTEzNCw2ICsxMzUsMTEgQEAgU0hERVBTX2xp
YnhlbmRldmljZW1vZGVsID0gJChTSExJQl9saWJ4ZW50b29sbG9nKSAkKFNITElCX2xpYnhlbnRv
b2xjb3JlKSAkKFNITEkKIExETElCU19saWJ4ZW5kZXZpY2Vtb2RlbCA9ICQoU0hERVBTX2xpYnhl
bmRldmljZW1vZGVsKSAkKFhFTl9MSUJYRU5ERVZJQ0VNT0RFTCkvbGlieGVuZGV2aWNlbW9kZWwk
KGxpYmV4dGVuc2lvbikKIFNITElCX2xpYnhlbmRldmljZW1vZGVsICA9ICQoU0hERVBTX2xpYnhl
bmRldmljZW1vZGVsKSAtV2wsLXJwYXRoLWxpbms9JChYRU5fTElCWEVOREVWSUNFTU9ERUwpCiAK
K0NGTEFHU19saWJ4ZW5oeXBmcyA9IC1JJChYRU5fTElCWEVOSFlQRlMpL2luY2x1ZGUgJChDRkxB
R1NfeGVuaW5jbHVkZSkKK1NIREVQU19saWJ4ZW5oeXBmcyA9ICQoU0hMSUJfbGlieGVudG9vbGxv
ZykgJChTSExJQl9saWJ4ZW50b29sY29yZSkgJChTSExJQl94ZW5jYWxsKQorTERMSUJTX2xpYnhl
bmh5cGZzID0gJChTSERFUFNfbGlieGVuaHlwZnMpICQoWEVOX0xJQlhFTkhZUEZTKS9saWJ4ZW5o
eXBmcyQobGliZXh0ZW5zaW9uKQorU0hMSUJfbGlieGVuaHlwZnMgID0gJChTSERFUFNfbGlieGVu
aHlwZnMpIC1XbCwtcnBhdGgtbGluaz0kKFhFTl9MSUJYRU5IWVBGUykKKwogIyBjb2RlIHdoaWNo
IGNvbXBpbGVzIGFnYWluc3QgbGlieGVuY3RybCBnZXQgX19YRU5fVE9PTFNfXyBhbmQKICMgdGhl
cmVmb3JlIHNlZXMgdGhlIHVuc3RhYmxlIGh5cGVyY2FsbCBpbnRlcmZhY2VzLgogQ0ZMQUdTX2xp
YnhlbmN0cmwgPSAtSSQoWEVOX0xJQlhDKS9pbmNsdWRlICQoQ0ZMQUdTX2xpYnhlbnRvb2xsb2cp
ICQoQ0ZMQUdTX2xpYnhlbmZvcmVpZ25tZW1vcnkpICQoQ0ZMQUdTX2xpYnhlbmRldmljZW1vZGVs
KSAkKENGTEFHU194ZW5pbmNsdWRlKSAtRF9fWEVOX1RPT0xTX18KZGlmZiAtLWdpdCBhL3Rvb2xz
L2xpYnMvTWFrZWZpbGUgYi90b29scy9saWJzL01ha2VmaWxlCmluZGV4IDg4OTAxZTczNDEuLjY5
Y2RmYjU5NzUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnMvTWFrZWZpbGUKKysrIGIvdG9vbHMvbGli
cy9NYWtlZmlsZQpAQCAtOSw2ICs5LDcgQEAgU1VCRElSUy15ICs9IGdudHRhYgogU1VCRElSUy15
ICs9IGNhbGwKIFNVQkRJUlMteSArPSBmb3JlaWdubWVtb3J5CiBTVUJESVJTLXkgKz0gZGV2aWNl
bW9kZWwKK1NVQkRJUlMteSArPSBoeXBmcwogCiBpZmVxICgkKENPTkZJR19SVU1QKSx5KQogU1VC
RElSUy15IDo9IHRvb2xjb3JlCmRpZmYgLS1naXQgYS90b29scy9saWJzL2h5cGZzL01ha2VmaWxl
IGIvdG9vbHMvbGlicy9oeXBmcy9NYWtlZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAw
MDAwMDAwMDAwLi4wNmRkNDQ5OTI5Ci0tLSAvZGV2L251bGwKKysrIGIvdG9vbHMvbGlicy9oeXBm
cy9NYWtlZmlsZQpAQCAtMCwwICsxLDE2IEBACitYRU5fUk9PVCA9ICQoQ1VSRElSKS8uLi8uLi8u
LgoraW5jbHVkZSAkKFhFTl9ST09UKS90b29scy9SdWxlcy5taworCitNQUpPUiAgICA9IDEKK01J
Tk9SICAgID0gMAorTElCTkFNRSAgOj0gaHlwZnMKK1VTRUxJQlMgIDo9IHRvb2xsb2cgdG9vbGNv
cmUgY2FsbAorCitBUFBFTkRfTERGTEFHUyArPSAtbHoKKworU1JDUy15ICAgICAgICAgICAgICAg
ICArPSBjb3JlLmMKKworaW5jbHVkZSAuLi9saWJzLm1rCisKKyQoUEtHX0NPTkZJR19MT0NBTCk6
IFBLR19DT05GSUdfSU5DRElSID0gJChYRU5fTElCWEVOSFlQRlMpL2luY2x1ZGUKKyQoUEtHX0NP
TkZJR19MT0NBTCk6IFBLR19DT05GSUdfQ0ZMQUdTX0xPQ0FMID0gJChDRkxBR1NfeGVuaW5jbHVk
ZSkKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvaHlwZnMvY29yZS5jIGIvdG9vbHMvbGlicy9oeXBm
cy9jb3JlLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNmQxNDAyM2Y4
OAotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL2xpYnMvaHlwZnMvY29yZS5jCkBAIC0wLDAgKzEs
NTQwIEBACisvKgorICogQ29weXJpZ2h0IChjKSAyMDE5IFNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSAorICoKKyAqIFRoaXMgbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3Ug
Y2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAqIG1vZGlmeSBpdCB1bmRlciB0aGUgdGVybXMg
b2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAqIExpY2Vuc2UgYXMgcHVibGlzaGVk
IGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247CisgKiB2ZXJzaW9uIDIuMSBvZiB0aGUg
TGljZW5zZS4KKyAqCisgKiBUaGlzIGxpYnJhcnkgaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUg
dGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0
aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisgKiBNRVJDSEFOVEFCSUxJVFkgb3Ig
RklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQorICogTGVzc2Vy
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyAqCisgKiBZb3Ugc2hv
dWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgTGVzc2VyIEdlbmVyYWwgUHVibGlj
CisgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5OyBJZiBub3QsIHNlZSA8aHR0cDov
L3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKworI2RlZmluZSBfX1hFTl9UT09MU19fIDEK
KworI2RlZmluZSBfR05VX1NPVVJDRQorCisjaW5jbHVkZSA8ZXJybm8uaD4KKyNpbmNsdWRlIDxp
bnR0eXBlcy5oPgorI2luY2x1ZGUgPHN0ZGJvb2wuaD4KKyNpbmNsdWRlIDxzdGRsaWIuaD4KKyNp
bmNsdWRlIDxzdHJpbmcuaD4KKyNpbmNsdWRlIDx6bGliLmg+CisKKyNpbmNsdWRlIDx4ZW50b29s
bG9nLmg+CisjaW5jbHVkZSA8eGVuaHlwZnMuaD4KKyNpbmNsdWRlIDx4ZW5jYWxsLmg+CisjaW5j
bHVkZSA8eGVudG9vbGNvcmVfaW50ZXJuYWwuaD4KKworI2luY2x1ZGUgPHhlbi94ZW4uaD4KKyNp
bmNsdWRlIDx4ZW4vaHlwZnMuaD4KKworI2RlZmluZSBCVUZfU0laRSA0MDk2CisKK3N0cnVjdCB4
ZW5oeXBmc19oYW5kbGUgeworICAgIHhlbnRvb2xsb2dfbG9nZ2VyICpsb2dnZXIsICpsb2dnZXJf
dG9mcmVlOworICAgIHVuc2lnbmVkIGludCBmbGFnczsKKyAgICB4ZW5jYWxsX2hhbmRsZSAqeGNh
bGw7Cit9OworCit4ZW5oeXBmc19oYW5kbGUgKnhlbmh5cGZzX29wZW4oeGVudG9vbGxvZ19sb2dn
ZXIgKmxvZ2dlciwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBvcGVu
X2ZsYWdzKQoreworICAgIHhlbmh5cGZzX2hhbmRsZSAqZnNoZGwgPSBjYWxsb2MoMSwgc2l6ZW9m
KCpmc2hkbCkpOworCisgICAgaWYgKCFmc2hkbCkKKyAgICAgICAgcmV0dXJuIE5VTEw7CisKKyAg
ICBmc2hkbC0+ZmxhZ3MgPSBvcGVuX2ZsYWdzOworICAgIGZzaGRsLT5sb2dnZXIgPSBsb2dnZXI7
CisgICAgZnNoZGwtPmxvZ2dlcl90b2ZyZWUgPSBOVUxMOworCisgICAgaWYgKCFmc2hkbC0+bG9n
Z2VyKSB7CisgICAgICAgIGZzaGRsLT5sb2dnZXIgPSBmc2hkbC0+bG9nZ2VyX3RvZnJlZSA9Cisg
ICAgICAgICAgICAoeGVudG9vbGxvZ19sb2dnZXIqKQorICAgICAgICAgICAgeHRsX2NyZWF0ZWxv
Z2dlcl9zdGRpb3N0cmVhbShzdGRlcnIsIFhUTF9QUk9HUkVTUywgMCk7CisgICAgICAgIGlmICgh
ZnNoZGwtPmxvZ2dlcikKKyAgICAgICAgICAgIGdvdG8gZXJyOworICAgIH0KKworICAgIGZzaGRs
LT54Y2FsbCA9IHhlbmNhbGxfb3Blbihmc2hkbC0+bG9nZ2VyLCAwKTsKKyAgICBpZiAoIWZzaGRs
LT54Y2FsbCkKKyAgICAgICAgZ290byBlcnI7CisKKyAgICAvKiBObyBuZWVkIHRvIHJlbWVtYmVy
IHN1cHBvcnRlZCB2ZXJzaW9uLCB3ZSBvbmx5IHN1cHBvcnQgVjEuICovCisgICAgaWYgKHhlbmNh
bGwxKGZzaGRsLT54Y2FsbCwgX19IWVBFUlZJU09SX2h5cGZzX29wLAorICAgICAgICAgICAgICAg
ICBYRU5fSFlQRlNfT1BfZ2V0X3ZlcnNpb24pIDwgMCkKKyAgICAgICAgZ290byBlcnI7CisKKyAg
ICByZXR1cm4gZnNoZGw7CisKK2VycjoKKyAgICB4dGxfbG9nZ2VyX2Rlc3Ryb3koZnNoZGwtPmxv
Z2dlcl90b2ZyZWUpOworICAgIHhlbmNhbGxfY2xvc2UoZnNoZGwtPnhjYWxsKTsKKyAgICBmcmVl
KGZzaGRsKTsKKyAgICByZXR1cm4gTlVMTDsKK30KKworaW50IHhlbmh5cGZzX2Nsb3NlKHhlbmh5
cGZzX2hhbmRsZSAqZnNoZGwpCit7CisgICAgaWYgKCFmc2hkbCkKKyAgICAgICAgcmV0dXJuIDA7
CisKKyAgICB4ZW5jYWxsX2Nsb3NlKGZzaGRsLT54Y2FsbCk7CisgICAgeHRsX2xvZ2dlcl9kZXN0
cm95KGZzaGRsLT5sb2dnZXJfdG9mcmVlKTsKKyAgICBmcmVlKGZzaGRsKTsKKyAgICByZXR1cm4g
MDsKK30KKworc3RhdGljIGludCB4ZW5oeXBmc19nZXRfcGF0aGJ1Zih4ZW5oeXBmc19oYW5kbGUg
KmZzaGRsLCBjb25zdCBjaGFyICpwYXRoLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjaGFyICoqcGF0aF9idWYpCit7CisgICAgaW50IHJldCA9IC0xOworICAgIGludCBwYXRoX3N6
OworCisgICAgaWYgKCFmc2hkbCkgeworICAgICAgICBlcnJubyA9IEVCQURGOworICAgICAgICBn
b3RvIG91dDsKKyAgICB9CisKKyAgICBwYXRoX3N6ID0gc3RybGVuKHBhdGgpICsgMTsKKyAgICBp
ZiAocGF0aF9zeiA+IFhFTl9IWVBGU19NQVhfUEFUSExFTikKKyAgICB7CisgICAgICAgIGVycm5v
ID0gRU5BTUVUT09MT05HOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICAqcGF0aF9i
dWYgPSB4ZW5jYWxsX2FsbG9jX2J1ZmZlcihmc2hkbC0+eGNhbGwsIHBhdGhfc3opOworICAgIGlm
ICghKnBhdGhfYnVmKSB7CisgICAgICAgIGVycm5vID0gRU5PTUVNOworICAgICAgICBnb3RvIG91
dDsKKyAgICB9CisgICAgc3RyY3B5KCpwYXRoX2J1ZiwgcGF0aCk7CisKKyAgICByZXQgPSBwYXRo
X3N6OworCisgb3V0OgorICAgIHJldHVybiByZXQ7Cit9CisKK3N0YXRpYyB2b2lkICp4ZW5oeXBm
c19pbmZsYXRlKHZvaWQgKmluX2RhdGEsIHNpemVfdCAqc3opCit7CisgICAgdW5zaWduZWQgY2hh
ciAqd29ya2J1ZjsKKyAgICB2b2lkICpjb250ZW50ID0gTlVMTDsKKyAgICB1bnNpZ25lZCBpbnQg
b3V0X3N6OworICAgIHpfc3RyZWFtIHogPSB7IC5vcGFxdWUgPSBOVUxMIH07CisgICAgaW50IHJl
dDsKKworICAgIHdvcmtidWYgPSBtYWxsb2MoQlVGX1NJWkUpOworICAgIGlmICghd29ya2J1ZikK
KyAgICAgICAgcmV0dXJuIE5VTEw7CisKKyAgICB6Lm5leHRfaW4gPSBpbl9kYXRhOworICAgIHou
YXZhaWxfaW4gPSAqc3o7CisgICAgcmV0ID0gaW5mbGF0ZUluaXQyKCZ6LCBNQVhfV0JJVFMgKyAz
Mik7IC8qIDMyID09IGd6aXAgKi8KKworICAgIGZvciAoKnN6ID0gMDsgcmV0ID09IFpfT0s7ICpz
eiArPSBvdXRfc3opIHsKKyAgICAgICAgei5uZXh0X291dCA9IHdvcmtidWY7CisgICAgICAgIHou
YXZhaWxfb3V0ID0gQlVGX1NJWkU7CisgICAgICAgIHJldCA9IGluZmxhdGUoJnosIFpfU1lOQ19G
TFVTSCk7CisgICAgICAgIGlmIChyZXQgIT0gWl9PSyAmJiByZXQgIT0gWl9TVFJFQU1fRU5EKQor
ICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgb3V0X3N6ID0gei5uZXh0X291dCAtIHdvcmti
dWY7CisgICAgICAgIGNvbnRlbnQgPSByZWFsbG9jKGNvbnRlbnQsICpzeiArIG91dF9zeik7Cisg
ICAgICAgIGlmICghY29udGVudCkgeworICAgICAgICAgICAgcmV0ID0gWl9NRU1fRVJST1I7Cisg
ICAgICAgICAgICBicmVhazsKKyAgICAgICAgfQorICAgICAgICBtZW1jcHkoY29udGVudCArICpz
eiwgd29ya2J1Ziwgb3V0X3N6KTsKKyAgICB9CisKKyAgICBpbmZsYXRlRW5kKCZ6KTsKKyAgICBp
ZiAocmV0ICE9IFpfU1RSRUFNX0VORCkgeworICAgICAgICBmcmVlKGNvbnRlbnQpOworICAgICAg
ICBjb250ZW50ID0gTlVMTDsKKyAgICAgICAgZXJybm8gPSBFSU87CisgICAgfQorICAgIGZyZWUo
d29ya2J1Zik7CisgICAgcmV0dXJuIGNvbnRlbnQ7Cit9CisKK3N0YXRpYyB2b2lkIHhlbmh5cGZz
X3NldF9hdHRycyhzdHJ1Y3QgeGVuX2h5cGZzX2RpcmVudHJ5ICplbnRyeSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuaHlwZnNfZGlyZW50ICpkaXJlbnQpCit7Cisg
ICAgZGlyZW50LT5zaXplID0gZW50cnktPmNvbnRlbnRfbGVuOworCisgICAgc3dpdGNoKGVudHJ5
LT50eXBlKSB7CisgICAgY2FzZSBYRU5fSFlQRlNfVFlQRV9ESVI6CisgICAgICAgIGRpcmVudC0+
dHlwZSA9IHhlbmh5cGZzX3R5cGVfZGlyOworICAgICAgICBicmVhazsKKyAgICBjYXNlIFhFTl9I
WVBGU19UWVBFX0JMT0I6CisgICAgICAgIGRpcmVudC0+dHlwZSA9IHhlbmh5cGZzX3R5cGVfYmxv
YjsKKyAgICAgICAgYnJlYWs7CisgICAgY2FzZSBYRU5fSFlQRlNfVFlQRV9TVFJJTkc6CisgICAg
ICAgIGRpcmVudC0+dHlwZSA9IHhlbmh5cGZzX3R5cGVfc3RyaW5nOworICAgICAgICBicmVhazsK
KyAgICBjYXNlIFhFTl9IWVBGU19UWVBFX1VJTlQ6CisgICAgICAgIGRpcmVudC0+dHlwZSA9IHhl
bmh5cGZzX3R5cGVfdWludDsKKyAgICAgICAgYnJlYWs7CisgICAgY2FzZSBYRU5fSFlQRlNfVFlQ
RV9JTlQ6CisgICAgICAgIGRpcmVudC0+dHlwZSA9IHhlbmh5cGZzX3R5cGVfaW50OworICAgICAg
ICBicmVhazsKKyAgICBjYXNlIFhFTl9IWVBGU19UWVBFX0JPT0w6CisgICAgICAgIGRpcmVudC0+
dHlwZSA9IHhlbmh5cGZzX3R5cGVfYm9vbDsKKyAgICAgICAgYnJlYWs7CisgICAgZGVmYXVsdDoK
KyAgICAgICAgZGlyZW50LT50eXBlID0geGVuaHlwZnNfdHlwZV9ibG9iOworICAgIH0KKworICAg
IHN3aXRjaCAoZW50cnktPmVuY29kaW5nKSB7CisgICAgY2FzZSBYRU5fSFlQRlNfRU5DX1BMQUlO
OgorICAgICAgICBkaXJlbnQtPmVuY29kaW5nID0geGVuaHlwZnNfZW5jX3BsYWluOworICAgICAg
ICBicmVhazsKKyAgICBjYXNlIFhFTl9IWVBGU19FTkNfR1pJUDoKKyAgICAgICAgZGlyZW50LT5l
bmNvZGluZyA9IHhlbmh5cGZzX2VuY19nemlwOworICAgICAgICBicmVhazsKKyAgICBkZWZhdWx0
OgorICAgICAgICBkaXJlbnQtPmVuY29kaW5nID0geGVuaHlwZnNfZW5jX3BsYWluOworICAgICAg
ICBkaXJlbnQtPnR5cGUgPSB4ZW5oeXBmc190eXBlX2Jsb2I7CisgICAgfQorCisgICAgZGlyZW50
LT5pc193cml0YWJsZSA9IGVudHJ5LT5mbGFncyAmIFhFTl9IWVBGU19XUklURUFCTEU7Cit9CisK
K3ZvaWQgKnhlbmh5cGZzX3JlYWRfcmF3KHhlbmh5cGZzX2hhbmRsZSAqZnNoZGwsIGNvbnN0IGNo
YXIgKnBhdGgsCisgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuaHlwZnNfZGlyZW50
ICoqZGlyZW50KQoreworICAgIHZvaWQgKnJldGJ1ZiA9IE5VTEwsICpjb250ZW50ID0gTlVMTDsK
KyAgICBjaGFyICpwYXRoX2J1ZiA9IE5VTEw7CisgICAgY29uc3QgY2hhciAqbmFtZTsKKyAgICBz
dHJ1Y3QgeGVuX2h5cGZzX2RpcmVudHJ5ICplbnRyeTsKKyAgICBpbnQgcmV0OworICAgIGludCBz
eiwgcGF0aF9zejsKKworICAgICpkaXJlbnQgPSBOVUxMOworICAgIHJldCA9IHhlbmh5cGZzX2dl
dF9wYXRoYnVmKGZzaGRsLCBwYXRoLCAmcGF0aF9idWYpOworICAgIGlmIChyZXQgPCAwKQorICAg
ICAgICBnb3RvIG91dDsKKworICAgIHBhdGhfc3ogPSByZXQ7CisKKyAgICBmb3IgKHN6ID0gQlVG
X1NJWkU7OyBzeiA9IHNpemVvZigqZW50cnkpICsgZW50cnktPmNvbnRlbnRfbGVuKSB7CisgICAg
ICAgIGlmIChyZXRidWYpCisgICAgICAgICAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRsLT54
Y2FsbCwgcmV0YnVmKTsKKworICAgICAgICByZXRidWYgPSB4ZW5jYWxsX2FsbG9jX2J1ZmZlcihm
c2hkbC0+eGNhbGwsIHN6KTsKKyAgICAgICAgaWYgKCFyZXRidWYpIHsKKyAgICAgICAgICAgIGVy
cm5vID0gRU5PTUVNOworICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0KKyAgICAgICAg
ZW50cnkgPSByZXRidWY7CisKKyAgICAgICAgcmV0ID0geGVuY2FsbDUoZnNoZGwtPnhjYWxsLCBf
X0hZUEVSVklTT1JfaHlwZnNfb3AsIFhFTl9IWVBGU19PUF9yZWFkLAorICAgICAgICAgICAgICAg
ICAgICAgICAodW5zaWduZWQgbG9uZylwYXRoX2J1ZiwgcGF0aF9zeiwKKyAgICAgICAgICAgICAg
ICAgICAgICAgKHVuc2lnbmVkIGxvbmcpcmV0YnVmLCBzeik7CisgICAgICAgIGlmICghcmV0KQor
ICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgaWYgKHJldCAhPSBFTk9CVUZTKSB7CisgICAg
ICAgICAgICBlcnJubyA9IC1yZXQ7CisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQor
ICAgIH0KKworICAgIGNvbnRlbnQgPSBtYWxsb2MoZW50cnktPmNvbnRlbnRfbGVuKTsKKyAgICBp
ZiAoIWNvbnRlbnQpCisgICAgICAgIGdvdG8gb3V0OworICAgIG1lbWNweShjb250ZW50LCBlbnRy
eSArIDEsIGVudHJ5LT5jb250ZW50X2xlbik7CisKKyAgICBuYW1lID0gc3RycmNocihwYXRoLCAn
LycpOworICAgIGlmICghbmFtZSkKKyAgICAgICAgbmFtZSA9IHBhdGg7CisgICAgZWxzZSB7Cisg
ICAgICAgIG5hbWUrKzsKKyAgICAgICAgaWYgKCEqbmFtZSkKKyAgICAgICAgICAgIG5hbWUtLTsK
KyAgICB9CisgICAgKmRpcmVudCA9IGNhbGxvYygxLCBzaXplb2Yoc3RydWN0IHhlbmh5cGZzX2Rp
cmVudCkgKyBzdHJsZW4obmFtZSkgKyAxKTsKKyAgICBpZiAoISpkaXJlbnQpIHsKKyAgICAgICAg
ZnJlZShjb250ZW50KTsKKyAgICAgICAgY29udGVudCA9IE5VTEw7CisgICAgICAgIGVycm5vID0g
RU5PTUVNOworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisgICAgKCpkaXJlbnQpLT5uYW1lID0g
KGNoYXIgKikoKmRpcmVudCArIDEpOworICAgIHN0cmNweSgoKmRpcmVudCktPm5hbWUsIG5hbWUp
OworICAgIHhlbmh5cGZzX3NldF9hdHRycyhlbnRyeSwgKmRpcmVudCk7CisKKyBvdXQ6CisgICAg
cmV0ID0gZXJybm87CisgICAgeGVuY2FsbF9mcmVlX2J1ZmZlcihmc2hkbC0+eGNhbGwsIHBhdGhf
YnVmKTsKKyAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRsLT54Y2FsbCwgcmV0YnVmKTsKKyAg
ICBlcnJubyA9IHJldDsKKworICAgIHJldHVybiBjb250ZW50OworfQorCitjaGFyICp4ZW5oeXBm
c19yZWFkKHhlbmh5cGZzX2hhbmRsZSAqZnNoZGwsIGNvbnN0IGNoYXIgKnBhdGgpCit7CisgICAg
Y2hhciAqYnVmLCAqcmV0X2J1ZiA9IE5VTEw7CisgICAgc3RydWN0IHhlbmh5cGZzX2RpcmVudCAq
ZGlyZW50OworICAgIGludCByZXQ7CisKKyAgICBidWYgPSB4ZW5oeXBmc19yZWFkX3Jhdyhmc2hk
bCwgcGF0aCwgJmRpcmVudCk7CisgICAgaWYgKCFidWYpCisgICAgICAgIGdvdG8gb3V0OworCisg
ICAgc3dpdGNoIChkaXJlbnQtPmVuY29kaW5nKSB7CisgICAgY2FzZSB4ZW5oeXBmc19lbmNfcGxh
aW46CisgICAgICAgIGJyZWFrOworICAgIGNhc2UgeGVuaHlwZnNfZW5jX2d6aXA6CisgICAgICAg
IHJldF9idWYgPSB4ZW5oeXBmc19pbmZsYXRlKGJ1ZiwgJmRpcmVudC0+c2l6ZSk7CisgICAgICAg
IGlmICghcmV0X2J1ZikKKyAgICAgICAgICAgIGdvdG8gb3V0OworICAgICAgICBmcmVlKGJ1Zik7
CisgICAgICAgIGJ1ZiA9IHJldF9idWY7CisgICAgICAgIHJldF9idWYgPSBOVUxMOworICAgICAg
ICBicmVhazsKKyAgICB9CisKKyAgICBzd2l0Y2ggKGRpcmVudC0+dHlwZSkgeworICAgIGNhc2Ug
eGVuaHlwZnNfdHlwZV9kaXI6CisgICAgICAgIGVycm5vID0gRUlTRElSOworICAgICAgICBicmVh
azsKKyAgICBjYXNlIHhlbmh5cGZzX3R5cGVfYmxvYjoKKyAgICAgICAgZXJybm8gPSBFRE9NOwor
ICAgICAgICBicmVhazsKKyAgICBjYXNlIHhlbmh5cGZzX3R5cGVfc3RyaW5nOgorICAgICAgICBy
ZXRfYnVmID0gYnVmOworICAgICAgICBidWYgPSBOVUxMOworICAgICAgICBicmVhazsKKyAgICBj
YXNlIHhlbmh5cGZzX3R5cGVfdWludDoKKyAgICBjYXNlIHhlbmh5cGZzX3R5cGVfYm9vbDoKKyAg
ICAgICAgc3dpdGNoIChkaXJlbnQtPnNpemUpIHsKKyAgICAgICAgY2FzZSAxOgorICAgICAgICAg
ICAgcmV0ID0gYXNwcmludGYoJnJldF9idWYsICIlIlBSSXU4LCAqKHVpbnQ4X3QgKilidWYpOwor
ICAgICAgICAgICAgYnJlYWs7CisgICAgICAgIGNhc2UgMjoKKyAgICAgICAgICAgIHJldCA9IGFz
cHJpbnRmKCZyZXRfYnVmLCAiJSJQUkl1MTYsICoodWludDE2X3QgKilidWYpOworICAgICAgICAg
ICAgYnJlYWs7CisgICAgICAgIGNhc2UgNDoKKyAgICAgICAgICAgIHJldCA9IGFzcHJpbnRmKCZy
ZXRfYnVmLCAiJSJQUkl1MzIsICoodWludDMyX3QgKilidWYpOworICAgICAgICAgICAgYnJlYWs7
CisgICAgICAgIGNhc2UgODoKKyAgICAgICAgICAgIHJldCA9IGFzcHJpbnRmKCZyZXRfYnVmLCAi
JSJQUkl1NjQsICoodWludDY0X3QgKilidWYpOworICAgICAgICAgICAgYnJlYWs7CisgICAgICAg
IGRlZmF1bHQ6CisgICAgICAgICAgICByZXQgPSAtMTsKKyAgICAgICAgICAgIGVycm5vID0gRURP
TTsKKyAgICAgICAgfQorICAgICAgICBpZiAocmV0IDwgMCkKKyAgICAgICAgICAgIHJldF9idWYg
PSBOVUxMOworICAgICAgICBicmVhazsKKyAgICBjYXNlIHhlbmh5cGZzX3R5cGVfaW50OgorICAg
ICAgICBzd2l0Y2ggKGRpcmVudC0+c2l6ZSkgeworICAgICAgICBjYXNlIDE6CisgICAgICAgICAg
ICByZXQgPSBhc3ByaW50ZigmcmV0X2J1ZiwgIiUiUFJJZDgsICooaW50OF90ICopYnVmKTsKKyAg
ICAgICAgICAgIGJyZWFrOworICAgICAgICBjYXNlIDI6CisgICAgICAgICAgICByZXQgPSBhc3By
aW50ZigmcmV0X2J1ZiwgIiUiUFJJZDE2LCAqKGludDE2X3QgKilidWYpOworICAgICAgICAgICAg
YnJlYWs7CisgICAgICAgIGNhc2UgNDoKKyAgICAgICAgICAgIHJldCA9IGFzcHJpbnRmKCZyZXRf
YnVmLCAiJSJQUklkMzIsICooaW50MzJfdCAqKWJ1Zik7CisgICAgICAgICAgICBicmVhazsKKyAg
ICAgICAgY2FzZSA4OgorICAgICAgICAgICAgcmV0ID0gYXNwcmludGYoJnJldF9idWYsICIlIlBS
SWQ2NCwgKihpbnQ2NF90ICopYnVmKTsKKyAgICAgICAgICAgIGJyZWFrOworICAgICAgICBkZWZh
dWx0OgorICAgICAgICAgICAgcmV0ID0gLTE7CisgICAgICAgICAgICBlcnJubyA9IEVET007Cisg
ICAgICAgIH0KKyAgICAgICAgaWYgKHJldCA8IDApCisgICAgICAgICAgICByZXRfYnVmID0gTlVM
TDsKKyAgICAgICAgYnJlYWs7CisgICAgfQorCisgb3V0OgorICAgIHJldCA9IGVycm5vOworICAg
IGZyZWUoYnVmKTsKKyAgICBmcmVlKGRpcmVudCk7CisgICAgZXJybm8gPSByZXQ7CisKKyAgICBy
ZXR1cm4gcmV0X2J1ZjsKK30KKworc3RydWN0IHhlbmh5cGZzX2RpcmVudCAqeGVuaHlwZnNfcmVh
ZGRpcih4ZW5oeXBmc19oYW5kbGUgKmZzaGRsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBjaGFyICpwYXRoLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKm51bV9lbnRyaWVzKQoreworICAgIHZvaWQg
KmJ1ZiwgKmN1cnI7CisgICAgaW50IHJldDsKKyAgICBjaGFyICpuYW1lczsKKyAgICBzdHJ1Y3Qg
eGVuaHlwZnNfZGlyZW50ICpyZXRfYnVmID0gTlVMTCwgKmRpcmVudDsKKyAgICB1bnNpZ25lZCBp
bnQgbiA9IDAsIG5hbWVfc3ogPSAwOworICAgIHN0cnVjdCB4ZW5faHlwZnNfZGlybGlzdGVudHJ5
ICplbnRyeTsKKworICAgIGJ1ZiA9IHhlbmh5cGZzX3JlYWRfcmF3KGZzaGRsLCBwYXRoLCAmZGly
ZW50KTsKKyAgICBpZiAoIWJ1ZikKKyAgICAgICAgZ290byBvdXQ7CisKKyAgICBpZiAoZGlyZW50
LT50eXBlICE9IHhlbmh5cGZzX3R5cGVfZGlyIHx8CisgICAgICAgIGRpcmVudC0+ZW5jb2Rpbmcg
IT0geGVuaHlwZnNfZW5jX3BsYWluKSB7CisgICAgICAgIGVycm5vID0gRU5PVERJUjsKKyAgICAg
ICAgZ290byBvdXQ7CisgICAgfQorCisgICAgaWYgKGRpcmVudC0+c2l6ZSkgeworICAgICAgICBj
dXJyID0gYnVmOworICAgICAgICBmb3IgKG4gPSAxOzsgbisrKSB7CisgICAgICAgICAgICBlbnRy
eSA9IGN1cnI7CisgICAgICAgICAgICBuYW1lX3N6ICs9IHN0cmxlbihlbnRyeS0+bmFtZSkgKyAx
OworICAgICAgICAgICAgaWYgKCFlbnRyeS0+b2ZmX25leHQpCisgICAgICAgICAgICAgICAgYnJl
YWs7CisKKyAgICAgICAgICAgIGN1cnIgKz0gZW50cnktPm9mZl9uZXh0OworICAgICAgICB9Cisg
ICAgfQorCisgICAgcmV0X2J1ZiA9IG1hbGxvYyhuICogc2l6ZW9mKCpyZXRfYnVmKSArIG5hbWVf
c3opOworICAgIGlmICghcmV0X2J1ZikKKyAgICAgICAgZ290byBvdXQ7CisKKyAgICAqbnVtX2Vu
dHJpZXMgPSBuOworICAgIG5hbWVzID0gKGNoYXIgKikocmV0X2J1ZiArIG4pOworICAgIGN1cnIg
PSBidWY7CisgICAgZm9yIChuID0gMDsgbiA8ICpudW1fZW50cmllczsgbisrKSB7CisgICAgICAg
IGVudHJ5ID0gY3VycjsKKyAgICAgICAgeGVuaHlwZnNfc2V0X2F0dHJzKCZlbnRyeS0+ZSwgcmV0
X2J1ZiArIG4pOworICAgICAgICByZXRfYnVmW25dLm5hbWUgPSBuYW1lczsKKyAgICAgICAgc3Ry
Y3B5KG5hbWVzLCBlbnRyeS0+bmFtZSk7CisgICAgICAgIG5hbWVzICs9IHN0cmxlbihlbnRyeS0+
bmFtZSkgKyAxOworICAgICAgICBjdXJyICs9IGVudHJ5LT5vZmZfbmV4dDsKKyAgICB9CisKKyBv
dXQ6CisgICAgcmV0ID0gZXJybm87CisgICAgZnJlZShidWYpOworICAgIGZyZWUoZGlyZW50KTsK
KyAgICBlcnJubyA9IHJldDsKKworICAgIHJldHVybiByZXRfYnVmOworfQorCitpbnQgeGVuaHlw
ZnNfd3JpdGUoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwgY29uc3QgY2hhciAqcGF0aCwgY29uc3Qg
Y2hhciAqdmFsKQoreworICAgIHZvaWQgKmJ1ZiA9IE5VTEw7CisgICAgY2hhciAqcGF0aF9idWYg
PSBOVUxMLCAqdmFsX2VuZDsKKyAgICBpbnQgcmV0LCBzYXZlZF9lcnJubzsKKyAgICBpbnQgc3os
IHBhdGhfc3o7CisgICAgc3RydWN0IHhlbl9oeXBmc19kaXJlbnRyeSAqZW50cnk7CisgICAgdWlu
dDY0X3QgbWFzazsKKworICAgIHJldCA9IHhlbmh5cGZzX2dldF9wYXRoYnVmKGZzaGRsLCBwYXRo
LCAmcGF0aF9idWYpOworICAgIGlmIChyZXQgPCAwKQorICAgICAgICBnb3RvIG91dDsKKworICAg
IHBhdGhfc3ogPSByZXQ7CisgICAgcmV0ID0gLTE7CisKKyAgICBzeiA9IEJVRl9TSVpFOworICAg
IGJ1ZiA9IHhlbmNhbGxfYWxsb2NfYnVmZmVyKGZzaGRsLT54Y2FsbCwgc3opOworICAgIGlmICgh
YnVmKSB7CisgICAgICAgIGVycm5vID0gRU5PTUVNOworICAgICAgICBnb3RvIG91dDsKKyAgICB9
CisKKyAgICByZXQgPSB4ZW5jYWxsNShmc2hkbC0+eGNhbGwsIF9fSFlQRVJWSVNPUl9oeXBmc19v
cCwgWEVOX0hZUEZTX09QX3JlYWQsCisgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcp
cGF0aF9idWYsIHBhdGhfc3osCisgICAgICAgICAgICAgICAgICAgKHVuc2lnbmVkIGxvbmcpYnVm
LCBzaXplb2YoKmVudHJ5KSk7CisgICAgaWYgKHJldCAmJiBlcnJubyAhPSBFTk9CVUZTKQorICAg
ICAgICBnb3RvIG91dDsKKyAgICByZXQgPSAtMTsKKyAgICBlbnRyeSA9IGJ1ZjsKKyAgICBpZiAo
IShlbnRyeS0+ZmxhZ3MgJiBYRU5fSFlQRlNfV1JJVEVBQkxFKSkgeworICAgICAgICBlcnJubyA9
IEVBQ0NFUzsKKyAgICAgICAgZ290byBvdXQ7CisgICAgfQorICAgIGlmIChlbnRyeS0+ZW5jb2Rp
bmcgIT0gWEVOX0hZUEZTX0VOQ19QTEFJTikgeworICAgICAgICAvKiBXcml0aW5nIGNvbXByZXNz
ZWQgZGF0YSBjdXJyZW50bHkgbm90IHN1cHBvcnRlZC4gKi8KKyAgICAgICAgZXJybm8gPSBFRE9N
OworICAgICAgICBnb3RvIG91dDsKKyAgICB9CisKKyAgICBzd2l0Y2ggKGVudHJ5LT50eXBlKSB7
CisgICAgY2FzZSBYRU5fSFlQRlNfVFlQRV9TVFJJTkc6CisgICAgICAgIGlmIChzeiA8IHN0cmxl
bih2YWwpICsgMSkgeworICAgICAgICAgICAgc3ogPSBzdHJsZW4odmFsKSArIDE7CisgICAgICAg
ICAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRsLT54Y2FsbCwgYnVmKTsKKyAgICAgICAgICAg
IGJ1ZiA9IHhlbmNhbGxfYWxsb2NfYnVmZmVyKGZzaGRsLT54Y2FsbCwgc3opOworICAgICAgICAg
ICAgaWYgKCFidWYpIHsKKyAgICAgICAgICAgICAgICBlcnJubyA9IEVOT01FTTsKKyAgICAgICAg
ICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgICAgIH0KKyAgICAgICAgfQorICAgICAgICBzeiA9
IHN0cmxlbih2YWwpICsgMTsKKyAgICAgICAgc3RyY3B5KGJ1ZiwgdmFsKTsKKyAgICAgICAgYnJl
YWs7CisgICAgY2FzZSBYRU5fSFlQRlNfVFlQRV9VSU5UOgorICAgICAgICBzeiA9IGVudHJ5LT5j
b250ZW50X2xlbjsKKyAgICAgICAgZXJybm8gPSAwOworICAgICAgICAqKHVuc2lnbmVkIGxvbmcg
bG9uZyAqKWJ1ZiA9IHN0cnRvdWxsKHZhbCwgJnZhbF9lbmQsIDApOworICAgICAgICBpZiAoZXJy
bm8gfHwgISp2YWwgfHwgKnZhbF9lbmQpCisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAg
bWFzayA9IH4wVUxMIDw8ICg4ICogc3opOworICAgICAgICBpZiAoKCoodWludDY0X3QgKilidWYg
JiBtYXNrKSAmJiAoKCoodWludDY0X3QgKilidWYgJiBtYXNrKSAhPSBtYXNrKSkgeworICAgICAg
ICAgICAgZXJybm8gPSBFUkFOR0U7CisgICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQor
ICAgICAgICBicmVhazsKKyAgICBjYXNlIFhFTl9IWVBGU19UWVBFX0lOVDoKKyAgICAgICAgc3og
PSBlbnRyeS0+Y29udGVudF9sZW47CisgICAgICAgIGVycm5vID0gMDsKKyAgICAgICAgKih1bnNp
Z25lZCBsb25nIGxvbmcgKilidWYgPSBzdHJ0b2xsKHZhbCwgJnZhbF9lbmQsIDApOworICAgICAg
ICBpZiAoZXJybm8gfHwgISp2YWwgfHwgKnZhbF9lbmQpCisgICAgICAgICAgICBnb3RvIG91dDsK
KyAgICAgICAgbWFzayA9IChzeiA9PSA4KSA/IDAgOiB+MFVMTCA8PCAoOCAqIHN6KTsKKyAgICAg
ICAgaWYgKCgqKHVpbnQ2NF90ICopYnVmICYgbWFzaykgJiYgKCgqKHVpbnQ2NF90ICopYnVmICYg
bWFzaykgIT0gbWFzaykpIHsKKyAgICAgICAgICAgIGVycm5vID0gRVJBTkdFOworICAgICAgICAg
ICAgZ290byBvdXQ7CisgICAgICAgIH0KKyAgICAgICAgYnJlYWs7CisgICAgY2FzZSBYRU5fSFlQ
RlNfVFlQRV9CT09MOgorICAgICAgICBzeiA9IGVudHJ5LT5jb250ZW50X2xlbjsKKyAgICAgICAg
aWYgKHN6ICE9IHNpemVvZihib29sKSkgeworICAgICAgICAgICAgZXJybm8gPSBFSUxTRVE7Cisg
ICAgICAgICAgICBnb3RvIG91dDsKKyAgICAgICAgfQorICAgICAgICAqKGJvb2wgKilidWYgPSBm
YWxzZTsKKyAgICAgICAgaWYgKCFzdHJjbXAodmFsLCAiMSIpIHx8ICFzdHJjbXAodmFsLCAib24i
KSB8fCAhc3RyY21wKHZhbCwgInllcyIpIHx8CisgICAgICAgICAgICAhc3RyY21wKHZhbCwgInRy
dWUiKSB8fCAhc3RyY21wKHZhbCwgImVuYWJsZSIpKQorICAgICAgICAgICAgKihib29sICopYnVm
ID0gdHJ1ZTsKKyAgICAgICAgZWxzZSBpZiAoc3RyY21wKHZhbCwgIjAiKSAmJiBzdHJjbXAodmFs
LCAibm8iKSAmJiBzdHJjbXAodmFsLCAib2ZmIikgJiYKKyAgICAgICAgICAgICAgICAgc3RyY21w
KHZhbCwgImZhbHNlIikgJiYgc3RyY21wKHZhbCwgImRpc2FibGUiKSkgeworICAgICAgICAgICAg
ZXJybm8gPSBFRE9NOworICAgICAgICAgICAgZ290byBvdXQ7CisgICAgICAgIH0KKyAgICAgICAg
YnJlYWs7CisgICAgZGVmYXVsdDoKKyAgICAgICAgLyogTm8gc3VwcG9ydCBmb3Igb3RoZXIgdHlw
ZXMgKHlldCkuICovCisgICAgICAgIGVycm5vID0gRURPTTsKKyAgICAgICAgZ290byBvdXQ7Cisg
ICAgfQorCisgICAgcmV0ID0geGVuY2FsbDUoZnNoZGwtPnhjYWxsLCBfX0hZUEVSVklTT1JfaHlw
ZnNfb3AsCisgICAgICAgICAgICAgICAgICAgWEVOX0hZUEZTX09QX3dyaXRlX2NvbnRlbnRzLAor
ICAgICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKXBhdGhfYnVmLCBwYXRoX3N6LAorICAg
ICAgICAgICAgICAgICAgICh1bnNpZ25lZCBsb25nKWJ1Ziwgc3opOworCisgb3V0OgorICAgIHNh
dmVkX2Vycm5vID0gZXJybm87CisgICAgeGVuY2FsbF9mcmVlX2J1ZmZlcihmc2hkbC0+eGNhbGws
IHBhdGhfYnVmKTsKKyAgICB4ZW5jYWxsX2ZyZWVfYnVmZmVyKGZzaGRsLT54Y2FsbCwgYnVmKTsK
KyAgICBlcnJubyA9IHNhdmVkX2Vycm5vOworICAgIHJldHVybiByZXQ7Cit9CmRpZmYgLS1naXQg
YS90b29scy9saWJzL2h5cGZzL2luY2x1ZGUveGVuaHlwZnMuaCBiL3Rvb2xzL2xpYnMvaHlwZnMv
aW5jbHVkZS94ZW5oeXBmcy5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAu
LjI5YzY5NzEyY2UKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9saWJzL2h5cGZzL2luY2x1ZGUv
eGVuaHlwZnMuaApAQCAtMCwwICsxLDc1IEBACisvKgorICogQ29weXJpZ2h0IChjKSAyMDE5IFNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSAorICoKKyAqIFRoaXMgbGlicmFyeSBp
cyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IKKyAqIG1vZGlm
eSBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMKKyAq
IExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247Cisg
KiB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZS4KKyAqCisgKiBUaGlzIGxpYnJhcnkgaXMgZGlz
dHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3aWxsIGJlIHVzZWZ1bCwKKyAqIGJ1dCBXSVRI
T1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCisg
KiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBT
ZWUgdGhlIEdOVQorICogTGVzc2VyIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0
YWlscy4KKyAqCisgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUg
TGVzc2VyIEdlbmVyYWwgUHVibGljCisgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBsaWJyYXJ5
OyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisgKi8KKyNpZm5k
ZWYgWEVOSFlQRlNfSAorI2RlZmluZSBYRU5IWVBGU19ICisKKyNpbmNsdWRlIDxzdGRib29sLmg+
CisjaW5jbHVkZSA8c3RkaW50Lmg+CisjaW5jbHVkZSA8c3lzL3R5cGVzLmg+CisKKy8qIENhbGxl
cnMgd2hvIGRvbid0IGNhcmUgZG9uJ3QgbmVlZCB0byAjaW5jbHVkZSA8eGVudG9vbGxvZy5oPiAq
Lworc3RydWN0IHhlbnRvb2xsb2dfbG9nZ2VyOworCit0eXBlZGVmIHN0cnVjdCB4ZW5oeXBmc19o
YW5kbGUgeGVuaHlwZnNfaGFuZGxlOworCitzdHJ1Y3QgeGVuaHlwZnNfZGlyZW50IHsKKyAgICBj
aGFyICpuYW1lOworICAgIHNpemVfdCBzaXplOworICAgIGVudW0geworICAgICAgICB4ZW5oeXBm
c190eXBlX2RpciwKKyAgICAgICAgeGVuaHlwZnNfdHlwZV9ibG9iLAorICAgICAgICB4ZW5oeXBm
c190eXBlX3N0cmluZywKKyAgICAgICAgeGVuaHlwZnNfdHlwZV91aW50LAorICAgICAgICB4ZW5o
eXBmc190eXBlX2ludCwKKyAgICAgICAgeGVuaHlwZnNfdHlwZV9ib29sCisgICAgfSB0eXBlOwor
ICAgIGVudW0geworICAgICAgICB4ZW5oeXBmc19lbmNfcGxhaW4sCisgICAgICAgIHhlbmh5cGZz
X2VuY19nemlwCisgICAgfSBlbmNvZGluZzsKKyAgICBib29sIGlzX3dyaXRhYmxlOworfTsKKwor
eGVuaHlwZnNfaGFuZGxlICp4ZW5oeXBmc19vcGVuKHN0cnVjdCB4ZW50b29sbG9nX2xvZ2dlciAq
bG9nZ2VyLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvcGVu
X2ZsYWdzKTsKK2ludCB4ZW5oeXBmc19jbG9zZSh4ZW5oeXBmc19oYW5kbGUgKmZzaGRsKTsKKwor
LyogUmV0dXJuZWQgYnVmZmVyIGFuZCBkaXJlbnQgc2hvdWxkIGJlIGZyZWVkIHZpYSBmcmVlKCku
ICovCit2b2lkICp4ZW5oeXBmc19yZWFkX3Jhdyh4ZW5oeXBmc19oYW5kbGUgKmZzaGRsLCBjb25z
dCBjaGFyICpwYXRoLAorICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHhlbmh5cGZzX2Rp
cmVudCAqKmRpcmVudCk7CisKKy8qIFJldHVybmVkIGJ1ZmZlciBzaG91bGQgYmUgZnJlZWQgdmlh
IGZyZWUoKS4gKi8KK2NoYXIgKnhlbmh5cGZzX3JlYWQoeGVuaHlwZnNfaGFuZGxlICpmc2hkbCwg
Y29uc3QgY2hhciAqcGF0aCk7CisKKy8qIFJldHVybmVkIGJ1ZmZlciBzaG91bGQgYmUgZnJlZWQg
dmlhIGZyZWUoKS4gKi8KK3N0cnVjdCB4ZW5oeXBmc19kaXJlbnQgKnhlbmh5cGZzX3JlYWRkaXIo
eGVuaHlwZnNfaGFuZGxlICpmc2hkbCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqcGF0aCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICpudW1fZW50cmllcyk7CisKK2ludCB4ZW5oeXBmc193
cml0ZSh4ZW5oeXBmc19oYW5kbGUgKmZzaGRsLCBjb25zdCBjaGFyICpwYXRoLCBjb25zdCBjaGFy
ICp2YWwpOworCisjZW5kaWYgLyogWEVOSFlQRlNfSCAqLworCisvKgorICogTG9jYWwgdmFyaWFi
bGVzOgorICogbW9kZTogQworICogYy1maWxlLXN0eWxlOiAiQlNEIgorICogYy1iYXNpYy1vZmZz
ZXQ6IDQKKyAqIHRhYi13aWR0aDogNAorICogaW5kZW50LXRhYnMtbW9kZTogbmlsCisgKiBFbmQ6
CisgKi8KZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvaHlwZnMvbGlieGVuaHlwZnMubWFwIGIvdG9v
bHMvbGlicy9oeXBmcy9saWJ4ZW5oeXBmcy5tYXAKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXgg
MDAwMDAwMDAwMC4uNDdmMWVkZGEzZQotLS0gL2Rldi9udWxsCisrKyBiL3Rvb2xzL2xpYnMvaHlw
ZnMvbGlieGVuaHlwZnMubWFwCkBAIC0wLDAgKzEsMTAgQEAKK1ZFUlNfMS4wIHsKKwlnbG9iYWw6
CisJCXhlbmh5cGZzX29wZW47CisJCXhlbmh5cGZzX2Nsb3NlOworCQl4ZW5oeXBmc19yZWFkX3Jh
dzsKKwkJeGVuaHlwZnNfcmVhZDsKKwkJeGVuaHlwZnNfcmVhZGRpcjsKKwkJeGVuaHlwZnNfd3Jp
dGU7CisJbG9jYWw6ICo7IC8qIERvIG5vdCBleHBvc2UgYW55dGhpbmcgYnkgZGVmYXVsdCAqLwor
fTsKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvaHlwZnMveGVuaHlwZnMucGMuaW4gYi90b29scy9s
aWJzL2h5cGZzL3hlbmh5cGZzLnBjLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjkyYTI2MmM3YTIKLS0tIC9kZXYvbnVsbAorKysgYi90b29scy9saWJzL2h5cGZzL3hl
bmh5cGZzLnBjLmluCkBAIC0wLDAgKzEsMTAgQEAKK3ByZWZpeD1AQHByZWZpeEBACitpbmNsdWRl
ZGlyPUBAaW5jZGlyQEAKK2xpYmRpcj1AQGxpYmRpckBACisKK05hbWU6IFhlbmh5cGZzCitEZXNj
cmlwdGlvbjogVGhlIFhlbmh5cGZzIGxpYnJhcnkgZm9yIFhlbiBoeXBlcnZpc29yCitWZXJzaW9u
OiBAQHZlcnNpb25AQAorQ2ZsYWdzOiAtSSR7aW5jbHVkZWRpcn0gQEBjZmxhZ3Nsb2NhbEBACitM
aWJzOiBAQGxpYnNmbGFnQEAke2xpYmRpcn0gLWx4ZW5oeXBmcworUmVxdWlyZXMucHJpdmF0ZTog
eGVudG9vbGNvcmUseGVudG9vbGxvZyx4ZW5jYWxsLHoKLS0gCjIuMTYuNAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
