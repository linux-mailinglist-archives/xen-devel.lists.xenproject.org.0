Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C321134626
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:26:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDBO-0004QL-Ot; Wed, 08 Jan 2020 15:23:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Mkji=25=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ipDBN-0004PM-HT
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:23:41 +0000
X-Inumbo-ID: d43e4834-322a-11ea-9832-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d43e4834-322a-11ea-9832-bc764e2007e4;
 Wed, 08 Jan 2020 15:23:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 66A8BB1E1;
 Wed,  8 Jan 2020 15:23:31 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 16:23:20 +0100
Message-Id: <20200108152328.27194-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200108152328.27194-1-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/9] xen/sched: move schedulers and cpupool
 coding to dedicated directory
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TW92ZSBzY2hlZCpjIGFuZCBjcHVwb29sLmMgdG8gYSBuZXcgZGlyZWN0b3J5IGNvbW1vbi9zY2hl
ZC4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tClYy
OgotIHJlbmFtZWQgc291cmNlcyAoRGFyaW8gRmFnZ2lvbGksIEFuZHJldyBDb29wZXIpCi0tLQog
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA4ICst
LQogeGVuL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDY2
ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vY29tbW9uL01ha2VmaWxlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDggKy0tCiB4ZW4vY29tbW9uL3NjaGVkL0tjb25maWcgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2Nv
bW1vbi9zY2hlZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICsrKwogeGVu
L2NvbW1vbi97c2NoZWRfYXJpbmM2NTMuYyA9PiBzY2hlZC9hcmluYzY1My5jfSB8ICAwCiB4ZW4v
Y29tbW9uL3tjb21wYXQvc2NoZWR1bGUuYyA9PiBzY2hlZC9jb21wYXQuY30gIHwgIDIgKy0KIHhl
bi9jb21tb24ve3NjaGVkdWxlLmMgPT4gc2NoZWQvY29yZS5jfSAgICAgICAgICAgfCAgMiArLQog
eGVuL2NvbW1vbi97ID0+IHNjaGVkfS9jcHVwb29sLmMgICAgICAgICAgICAgICAgICB8ICAwCiB4
ZW4vY29tbW9uL3tzY2hlZF9jcmVkaXQuYyA9PiBzY2hlZC9jcmVkaXQuY30gICAgIHwgIDAKIHhl
bi9jb21tb24ve3NjaGVkX2NyZWRpdDIuYyA9PiBzY2hlZC9jcmVkaXQyLmN9ICAgfCAgMAogeGVu
L2NvbW1vbi97c2NoZWRfbnVsbC5jID0+IHNjaGVkL251bGwuY30gICAgICAgICB8ICAwCiB4ZW4v
Y29tbW9uL3tzY2hlZF9ydC5jID0+IHNjaGVkL3J0LmN9ICAgICAgICAgICAgIHwgIDAKIDEzIGZp
bGVzIGNoYW5nZWQsIDgwIGluc2VydGlvbnMoKyksIDc4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9jb21tb24vc2NoZWQvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IHhl
bi9jb21tb24vc2NoZWQvTWFrZWZpbGUKIHJlbmFtZSB4ZW4vY29tbW9uL3tzY2hlZF9hcmluYzY1
My5jID0+IHNjaGVkL2FyaW5jNjUzLmN9ICgxMDAlKQogcmVuYW1lIHhlbi9jb21tb24ve2NvbXBh
dC9zY2hlZHVsZS5jID0+IHNjaGVkL2NvbXBhdC5jfSAoOTclKQogcmVuYW1lIHhlbi9jb21tb24v
e3NjaGVkdWxlLmMgPT4gc2NoZWQvY29yZS5jfSAoOTklKQogcmVuYW1lIHhlbi9jb21tb24veyA9
PiBzY2hlZH0vY3B1cG9vbC5jICgxMDAlKQogcmVuYW1lIHhlbi9jb21tb24ve3NjaGVkX2NyZWRp
dC5jID0+IHNjaGVkL2NyZWRpdC5jfSAoMTAwJSkKIHJlbmFtZSB4ZW4vY29tbW9uL3tzY2hlZF9j
cmVkaXQyLmMgPT4gc2NoZWQvY3JlZGl0Mi5jfSAoMTAwJSkKIHJlbmFtZSB4ZW4vY29tbW9uL3tz
Y2hlZF9udWxsLmMgPT4gc2NoZWQvbnVsbC5jfSAoMTAwJSkKIHJlbmFtZSB4ZW4vY29tbW9uL3tz
Y2hlZF9ydC5jID0+IHNjaGVkL3J0LmN9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJT
IGIvTUFJTlRBSU5FUlMKaW5kZXggZWFlYTQ2MjBlMi4uOWQyYWM2MzFiYSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTE3NCw3ICsxNzQsNyBAQCBNOglKb3No
IFdoaXRlaGVhZCA8am9zaC53aGl0ZWhlYWRAZG9ybmVyd29ya3MuY29tPgogTToJU3Rld2FydCBI
aWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgogUzoJU3VwcG9y
dGVkCiBMOglEb3JuZXJXb3JrcyBYZW4tRGV2ZWwgPHhlbi1kZXZlbEBkb3JuZXJ3b3Jrcy5jb20+
Ci1GOgl4ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKK0Y6CXhlbi9jb21tb24vc2NoZWQvYXJp
bmM2NTMuYwogRjoJdG9vbHMvbGlieGMveGNfYXJpbmM2NTMuYwogCiBBUk0gKFcvIFZJUlRVQUxJ
U0FUSU9OIEVYVEVOU0lPTlMpIEFSQ0hJVEVDVFVSRQpAQCAtMjEyLDcgKzIxMiw3IEBAIENQVSBQ
T09MUwogTToJSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgogTToJRGFyaW8gRmFnZ2lv
bGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KIFM6CVN1cHBvcnRlZAotRjoJeGVuL2NvbW1vbi9jcHVw
b29sLmMKK0Y6CXhlbi9jb21tb24vc2NoZWQvY3B1cG9vbC5jCiAKIERFVklDRSBUUkVFCiBNOglT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkBAIC0zNzgsMTMgKzM3
OCwxMyBAQCBSVERTIFNDSEVEVUxFUgogTToJRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNl
LmNvbT4KIE06CU1lbmcgWHUgPG1lbmd4dUBjaXMudXBlbm4uZWR1PgogUzoJU3VwcG9ydGVkCi1G
Ogl4ZW4vY29tbW9uL3NjaGVkX3J0LmMKK0Y6CXhlbi9jb21tb24vc2NoZWQvcnQuYwogCiBTQ0hF
RFVMSU5HCiBNOglHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CiBN
OglEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29tPgogUzoJU3VwcG9ydGVkCi1GOgl4
ZW4vY29tbW9uL3NjaGVkKgorRjoJeGVuL2NvbW1vbi9zY2hlZC8KIAogU0VBQklPUyBVUFNUUkVB
TQogTToJV2VpIExpdSA8d2xAeGVuLm9yZz4KZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vS2NvbmZp
ZyBiL3hlbi9jb21tb24vS2NvbmZpZwppbmRleCBiM2QxNjFkMDU3Li45ZDZkMDllYjM3IDEwMDY0
NAotLS0gYS94ZW4vY29tbW9uL0tjb25maWcKKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCkBAIC0y
NzUsNzEgKzI3NSw3IEBAIGNvbmZpZyBBUkdPCiAKIAkgIElmIHVuc3VyZSwgc2F5IE4uCiAKLW1l
bnUgIlNjaGVkdWxlcnMiCi0JdmlzaWJsZSBpZiBFWFBFUlQgPSAieSIKLQotY29uZmlnIFNDSEVE
X0NSRURJVAotCWJvb2wgIkNyZWRpdCBzY2hlZHVsZXIgc3VwcG9ydCIKLQlkZWZhdWx0IHkKLQkt
LS1oZWxwLS0tCi0JICBUaGUgdHJhZGl0aW9uYWwgY3JlZGl0IHNjaGVkdWxlciBpcyBhIGdlbmVy
YWwgcHVycG9zZSBzY2hlZHVsZXIuCi0KLWNvbmZpZyBTQ0hFRF9DUkVESVQyCi0JYm9vbCAiQ3Jl
ZGl0MiBzY2hlZHVsZXIgc3VwcG9ydCIKLQlkZWZhdWx0IHkKLQktLS1oZWxwLS0tCi0JICBUaGUg
Y3JlZGl0MiBzY2hlZHVsZXIgaXMgYSBnZW5lcmFsIHB1cnBvc2Ugc2NoZWR1bGVyIHRoYXQgaXMK
LQkgIG9wdGltaXplZCBmb3IgbG93ZXIgbGF0ZW5jeSBhbmQgaGlnaGVyIFZNIGRlbnNpdHkuCi0K
LWNvbmZpZyBTQ0hFRF9SVERTCi0JYm9vbCAiUlREUyBzY2hlZHVsZXIgc3VwcG9ydCAoRVhQRVJJ
TUVOVEFMKSIKLQlkZWZhdWx0IHkKLQktLS1oZWxwLS0tCi0JICBUaGUgUlREUyBzY2hlZHVsZXIg
aXMgYSBzb2Z0IGFuZCBmaXJtIHJlYWwtdGltZSBzY2hlZHVsZXIgZm9yCi0JICBtdWx0aWNvcmUs
IHRhcmdldGVkIGZvciBlbWJlZGRlZCwgYXV0b21vdGl2ZSwgZ3JhcGhpY3MgYW5kIGdhbWluZwot
CSAgaW4gdGhlIGNsb3VkLCBhbmQgZ2VuZXJhbCBsb3ctbGF0ZW5jeSB3b3JrbG9hZHMuCi0KLWNv
bmZpZyBTQ0hFRF9BUklOQzY1MwotCWJvb2wgIkFSSU5DNjUzIHNjaGVkdWxlciBzdXBwb3J0IChF
WFBFUklNRU5UQUwpIgotCWRlZmF1bHQgREVCVUcKLQktLS1oZWxwLS0tCi0JICBUaGUgQVJJTkM2
NTMgc2NoZWR1bGVyIGlzIGEgaGFyZCByZWFsLXRpbWUgc2NoZWR1bGVyIGZvciBzaW5nbGUKLQkg
IGNvcmVzLCB0YXJnZXRlZCBmb3IgYXZpb25pY3MsIGRyb25lcywgYW5kIG1lZGljYWwgZGV2aWNl
cy4KLQotY29uZmlnIFNDSEVEX05VTEwKLQlib29sICJOdWxsIHNjaGVkdWxlciBzdXBwb3J0IChF
WFBFUklNRU5UQUwpIgotCWRlZmF1bHQgeQotCS0tLWhlbHAtLS0KLQkgIFRoZSBudWxsIHNjaGVk
dWxlciBpcyBhIHN0YXRpYywgemVybyBvdmVyaGVhZCBzY2hlZHVsZXIsCi0JICBmb3Igd2hlbiB0
aGVyZSBhbHdheXMgYXJlIGxlc3MgdkNQVXMgdGhhbiBwQ1BVcywgdHlwaWNhbGx5Ci0JICBpbiBl
bWJlZGRlZCBvciBIUEMgc2NlbmFyaW9zLgotCi1jaG9pY2UKLQlwcm9tcHQgIkRlZmF1bHQgU2No
ZWR1bGVyPyIKLQlkZWZhdWx0IFNDSEVEX0NSRURJVDJfREVGQVVMVAotCi0JY29uZmlnIFNDSEVE
X0NSRURJVF9ERUZBVUxUCi0JCWJvb2wgIkNyZWRpdCBTY2hlZHVsZXIiIGlmIFNDSEVEX0NSRURJ
VAotCWNvbmZpZyBTQ0hFRF9DUkVESVQyX0RFRkFVTFQKLQkJYm9vbCAiQ3JlZGl0MiBTY2hlZHVs
ZXIiIGlmIFNDSEVEX0NSRURJVDIKLQljb25maWcgU0NIRURfUlREU19ERUZBVUxUCi0JCWJvb2wg
IlJUIFNjaGVkdWxlciIgaWYgU0NIRURfUlREUwotCWNvbmZpZyBTQ0hFRF9BUklOQzY1M19ERUZB
VUxUCi0JCWJvb2wgIkFSSU5DNjUzIFNjaGVkdWxlciIgaWYgU0NIRURfQVJJTkM2NTMKLQljb25m
aWcgU0NIRURfTlVMTF9ERUZBVUxUCi0JCWJvb2wgIk51bGwgU2NoZWR1bGVyIiBpZiBTQ0hFRF9O
VUxMCi1lbmRjaG9pY2UKLQotY29uZmlnIFNDSEVEX0RFRkFVTFQKLQlzdHJpbmcKLQlkZWZhdWx0
ICJjcmVkaXQiIGlmIFNDSEVEX0NSRURJVF9ERUZBVUxUCi0JZGVmYXVsdCAiY3JlZGl0MiIgaWYg
U0NIRURfQ1JFRElUMl9ERUZBVUxUCi0JZGVmYXVsdCAicnRkcyIgaWYgU0NIRURfUlREU19ERUZB
VUxUCi0JZGVmYXVsdCAiYXJpbmM2NTMiIGlmIFNDSEVEX0FSSU5DNjUzX0RFRkFVTFQKLQlkZWZh
dWx0ICJudWxsIiBpZiBTQ0hFRF9OVUxMX0RFRkFVTFQKLQlkZWZhdWx0ICJjcmVkaXQyIgotCi1l
bmRtZW51Citzb3VyY2UgImNvbW1vbi9zY2hlZC9LY29uZmlnIgogCiBjb25maWcgQ1JZUFRPCiAJ
Ym9vbApkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9NYWtlZmlsZSBiL3hlbi9jb21tb24vTWFrZWZp
bGUKaW5kZXggNjJiMzRlNjllOS4uMmFiYjgyNTBiMCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9N
YWtlZmlsZQorKysgYi94ZW4vY29tbW9uL01ha2VmaWxlCkBAIC0zLDcgKzMsNiBAQCBvYmoteSAr
PSBiaXRtYXAubwogb2JqLXkgKz0gYnNlYXJjaC5vCiBvYmotJChDT05GSUdfQ09SRV9QQVJLSU5H
KSArPSBjb3JlX3Bhcmtpbmcubwogb2JqLXkgKz0gY3B1Lm8KLW9iai15ICs9IGNwdXBvb2wubwog
b2JqLSQoQ09ORklHX0RFQlVHX1RSQUNFKSArPSBkZWJ1Z3RyYWNlLm8KIG9iai0kKENPTkZJR19I
QVNfREVWSUNFX1RSRUUpICs9IGRldmljZV90cmVlLm8KIG9iai15ICs9IGRvbWN0bC5vCkBAIC0z
OCwxMiArMzcsNiBAQCBvYmoteSArPSByYWRpeC10cmVlLm8KIG9iai15ICs9IHJidHJlZS5vCiBv
YmoteSArPSByY3VwZGF0ZS5vCiBvYmoteSArPSByd2xvY2subwotb2JqLSQoQ09ORklHX1NDSEVE
X0FSSU5DNjUzKSArPSBzY2hlZF9hcmluYzY1My5vCi1vYmotJChDT05GSUdfU0NIRURfQ1JFRElU
KSArPSBzY2hlZF9jcmVkaXQubwotb2JqLSQoQ09ORklHX1NDSEVEX0NSRURJVDIpICs9IHNjaGVk
X2NyZWRpdDIubwotb2JqLSQoQ09ORklHX1NDSEVEX1JURFMpICs9IHNjaGVkX3J0Lm8KLW9iai0k
KENPTkZJR19TQ0hFRF9OVUxMKSArPSBzY2hlZF9udWxsLm8KLW9iai15ICs9IHNjaGVkdWxlLm8K
IG9iai15ICs9IHNodXRkb3duLm8KIG9iai15ICs9IHNvZnRpcnEubwogb2JqLXkgKz0gc29ydC5v
CkBAIC03NCw2ICs2Nyw3IEBAIG9iai0kKENPTkZJR19DT01QQVQpICs9ICQoYWRkcHJlZml4IGNv
bXBhdC8sZG9tYWluLm8ga2VybmVsLm8gbWVtb3J5Lm8gbXVsdGljYWxsCiBleHRyYS15IDo9IHN5
bWJvbHMtZHVtbXkubwogCiBzdWJkaXItJChDT05GSUdfQ09WRVJBR0UpICs9IGNvdmVyYWdlCitz
dWJkaXIteSArPSBzY2hlZAogc3ViZGlyLSQoQ09ORklHX1VCU0FOKSArPSB1YnNhbgogCiBzdWJk
aXItJChDT05GSUdfTkVFRFNfTElCRUxGKSArPSBsaWJlbGYKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWQvS2NvbmZpZyBiL3hlbi9jb21tb24vc2NoZWQvS2NvbmZpZwpuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi44ODNhYzg3Y2FiCi0tLSAvZGV2L251bGwKKysrIGIv
eGVuL2NvbW1vbi9zY2hlZC9LY29uZmlnCkBAIC0wLDAgKzEsNjUgQEAKK21lbnUgIlNjaGVkdWxl
cnMiCisJdmlzaWJsZSBpZiBFWFBFUlQgPSAieSIKKworY29uZmlnIFNDSEVEX0NSRURJVAorCWJv
b2wgIkNyZWRpdCBzY2hlZHVsZXIgc3VwcG9ydCIKKwlkZWZhdWx0IHkKKwktLS1oZWxwLS0tCisJ
ICBUaGUgdHJhZGl0aW9uYWwgY3JlZGl0IHNjaGVkdWxlciBpcyBhIGdlbmVyYWwgcHVycG9zZSBz
Y2hlZHVsZXIuCisKK2NvbmZpZyBTQ0hFRF9DUkVESVQyCisJYm9vbCAiQ3JlZGl0MiBzY2hlZHVs
ZXIgc3VwcG9ydCIKKwlkZWZhdWx0IHkKKwktLS1oZWxwLS0tCisJICBUaGUgY3JlZGl0MiBzY2hl
ZHVsZXIgaXMgYSBnZW5lcmFsIHB1cnBvc2Ugc2NoZWR1bGVyIHRoYXQgaXMKKwkgIG9wdGltaXpl
ZCBmb3IgbG93ZXIgbGF0ZW5jeSBhbmQgaGlnaGVyIFZNIGRlbnNpdHkuCisKK2NvbmZpZyBTQ0hF
RF9SVERTCisJYm9vbCAiUlREUyBzY2hlZHVsZXIgc3VwcG9ydCAoRVhQRVJJTUVOVEFMKSIKKwlk
ZWZhdWx0IHkKKwktLS1oZWxwLS0tCisJICBUaGUgUlREUyBzY2hlZHVsZXIgaXMgYSBzb2Z0IGFu
ZCBmaXJtIHJlYWwtdGltZSBzY2hlZHVsZXIgZm9yCisJICBtdWx0aWNvcmUsIHRhcmdldGVkIGZv
ciBlbWJlZGRlZCwgYXV0b21vdGl2ZSwgZ3JhcGhpY3MgYW5kIGdhbWluZworCSAgaW4gdGhlIGNs
b3VkLCBhbmQgZ2VuZXJhbCBsb3ctbGF0ZW5jeSB3b3JrbG9hZHMuCisKK2NvbmZpZyBTQ0hFRF9B
UklOQzY1MworCWJvb2wgIkFSSU5DNjUzIHNjaGVkdWxlciBzdXBwb3J0IChFWFBFUklNRU5UQUwp
IgorCWRlZmF1bHQgREVCVUcKKwktLS1oZWxwLS0tCisJICBUaGUgQVJJTkM2NTMgc2NoZWR1bGVy
IGlzIGEgaGFyZCByZWFsLXRpbWUgc2NoZWR1bGVyIGZvciBzaW5nbGUKKwkgIGNvcmVzLCB0YXJn
ZXRlZCBmb3IgYXZpb25pY3MsIGRyb25lcywgYW5kIG1lZGljYWwgZGV2aWNlcy4KKworY29uZmln
IFNDSEVEX05VTEwKKwlib29sICJOdWxsIHNjaGVkdWxlciBzdXBwb3J0IChFWFBFUklNRU5UQUwp
IgorCWRlZmF1bHQgeQorCS0tLWhlbHAtLS0KKwkgIFRoZSBudWxsIHNjaGVkdWxlciBpcyBhIHN0
YXRpYywgemVybyBvdmVyaGVhZCBzY2hlZHVsZXIsCisJICBmb3Igd2hlbiB0aGVyZSBhbHdheXMg
YXJlIGxlc3MgdkNQVXMgdGhhbiBwQ1BVcywgdHlwaWNhbGx5CisJICBpbiBlbWJlZGRlZCBvciBI
UEMgc2NlbmFyaW9zLgorCitjaG9pY2UKKwlwcm9tcHQgIkRlZmF1bHQgU2NoZWR1bGVyPyIKKwlk
ZWZhdWx0IFNDSEVEX0NSRURJVDJfREVGQVVMVAorCisJY29uZmlnIFNDSEVEX0NSRURJVF9ERUZB
VUxUCisJCWJvb2wgIkNyZWRpdCBTY2hlZHVsZXIiIGlmIFNDSEVEX0NSRURJVAorCWNvbmZpZyBT
Q0hFRF9DUkVESVQyX0RFRkFVTFQKKwkJYm9vbCAiQ3JlZGl0MiBTY2hlZHVsZXIiIGlmIFNDSEVE
X0NSRURJVDIKKwljb25maWcgU0NIRURfUlREU19ERUZBVUxUCisJCWJvb2wgIlJUIFNjaGVkdWxl
ciIgaWYgU0NIRURfUlREUworCWNvbmZpZyBTQ0hFRF9BUklOQzY1M19ERUZBVUxUCisJCWJvb2wg
IkFSSU5DNjUzIFNjaGVkdWxlciIgaWYgU0NIRURfQVJJTkM2NTMKKwljb25maWcgU0NIRURfTlVM
TF9ERUZBVUxUCisJCWJvb2wgIk51bGwgU2NoZWR1bGVyIiBpZiBTQ0hFRF9OVUxMCitlbmRjaG9p
Y2UKKworY29uZmlnIFNDSEVEX0RFRkFVTFQKKwlzdHJpbmcKKwlkZWZhdWx0ICJjcmVkaXQiIGlm
IFNDSEVEX0NSRURJVF9ERUZBVUxUCisJZGVmYXVsdCAiY3JlZGl0MiIgaWYgU0NIRURfQ1JFRElU
Ml9ERUZBVUxUCisJZGVmYXVsdCAicnRkcyIgaWYgU0NIRURfUlREU19ERUZBVUxUCisJZGVmYXVs
dCAiYXJpbmM2NTMiIGlmIFNDSEVEX0FSSU5DNjUzX0RFRkFVTFQKKwlkZWZhdWx0ICJudWxsIiBp
ZiBTQ0hFRF9OVUxMX0RFRkFVTFQKKwlkZWZhdWx0ICJjcmVkaXQyIgorCitlbmRtZW51CmRpZmYg
LS1naXQgYS94ZW4vY29tbW9uL3NjaGVkL01ha2VmaWxlIGIveGVuL2NvbW1vbi9zY2hlZC9NYWtl
ZmlsZQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi4zNTM3ZjJhNjhkCi0t
LSAvZGV2L251bGwKKysrIGIveGVuL2NvbW1vbi9zY2hlZC9NYWtlZmlsZQpAQCAtMCwwICsxLDcg
QEAKK29iai15ICs9IGNwdXBvb2wubworb2JqLSQoQ09ORklHX1NDSEVEX0FSSU5DNjUzKSArPSBh
cmluYzY1My5vCitvYmotJChDT05GSUdfU0NIRURfQ1JFRElUKSArPSBjcmVkaXQubworb2JqLSQo
Q09ORklHX1NDSEVEX0NSRURJVDIpICs9IGNyZWRpdDIubworb2JqLSQoQ09ORklHX1NDSEVEX1JU
RFMpICs9IHJ0Lm8KK29iai0kKENPTkZJR19TQ0hFRF9OVUxMKSArPSBudWxsLm8KK29iai15ICs9
IGNvcmUubwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9hcmluYzY1My5jIGIveGVuL2Nv
bW1vbi9zY2hlZC9hcmluYzY1My5jCnNpbWlsYXJpdHkgaW5kZXggMTAwJQpyZW5hbWUgZnJvbSB4
ZW4vY29tbW9uL3NjaGVkX2FyaW5jNjUzLmMKcmVuYW1lIHRvIHhlbi9jb21tb24vc2NoZWQvYXJp
bmM2NTMuYwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9jb21wYXQvc2NoZWR1bGUuYyBiL3hlbi9j
b21tb24vc2NoZWQvY29tcGF0LmMKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1lIGZyb20geGVu
L2NvbW1vbi9jb21wYXQvc2NoZWR1bGUuYwpyZW5hbWUgdG8geGVuL2NvbW1vbi9zY2hlZC9jb21w
YXQuYwppbmRleCA4YjZlNmYxMDdkLi4wNDBiNGNhY2EyIDEwMDY0NAotLS0gYS94ZW4vY29tbW9u
L2NvbXBhdC9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWQvY29tcGF0LmMKQEAgLTM3
LDcgKzM3LDcgQEAgc3RhdGljIGludCBjb21wYXRfcG9sbChzdHJ1Y3QgY29tcGF0X3NjaGVkX3Bv
bGwgKmNvbXBhdCkKICNkZWZpbmUgZG9fcG9sbCBjb21wYXRfcG9sbAogI2RlZmluZSBzY2hlZF9w
b2xsIGNvbXBhdF9zY2hlZF9wb2xsCiAKLSNpbmNsdWRlICIuLi9zY2hlZHVsZS5jIgorI2luY2x1
ZGUgImNvcmUuYyIKIAogaW50IGNvbXBhdF9zZXRfdGltZXJfb3AodTMyIGxvLCBzMzIgaGkpCiB7
CmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkL2Nv
cmUuYwpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJvbSB4ZW4vY29tbW9uL3NjaGVkdWxl
LmMKcmVuYW1lIHRvIHhlbi9jb21tb24vc2NoZWQvY29yZS5jCmluZGV4IDU0YTA3ZmY5ZTguLjRk
OGViNGM2MTcgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29t
bW9uL3NjaGVkL2NvcmUuYwpAQCAtMzEyOCw3ICszMTI4LDcgQEAgdm9pZCBfX2luaXQgc2NoZWRf
c2V0dXBfZG9tMF92Y3B1cyhzdHJ1Y3QgZG9tYWluICpkKQogI2VuZGlmCiAKICNpZmRlZiBDT05G
SUdfQ09NUEFUCi0jaW5jbHVkZSAiY29tcGF0L3NjaGVkdWxlLmMiCisjaW5jbHVkZSAiY29tcGF0
LmMiCiAjZW5kaWYKIAogI2VuZGlmIC8qICFDT01QQVQgKi8KZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vY3B1cG9vbC5jIGIveGVuL2NvbW1vbi9zY2hlZC9jcHVwb29sLmMKc2ltaWxhcml0eSBpbmRl
eCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9jb21tb24vY3B1cG9vbC5jCnJlbmFtZSB0byB4ZW4vY29t
bW9uL3NjaGVkL2NwdXBvb2wuYwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQu
YyBiL3hlbi9jb21tb24vc2NoZWQvY3JlZGl0LmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFt
ZSBmcm9tIHhlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKcmVuYW1lIHRvIHhlbi9jb21tb24vc2No
ZWQvY3JlZGl0LmMKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jIGIveGVu
L2NvbW1vbi9zY2hlZC9jcmVkaXQyLmMKc2ltaWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9t
IHhlbi9jb21tb24vc2NoZWRfY3JlZGl0Mi5jCnJlbmFtZSB0byB4ZW4vY29tbW9uL3NjaGVkL2Ny
ZWRpdDIuYwpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZF9udWxsLmMgYi94ZW4vY29tbW9u
L3NjaGVkL251bGwuYwpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVuYW1lIGZyb20geGVuL2NvbW1v
bi9zY2hlZF9udWxsLmMKcmVuYW1lIHRvIHhlbi9jb21tb24vc2NoZWQvbnVsbC5jCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3NjaGVkX3J0LmMgYi94ZW4vY29tbW9uL3NjaGVkL3J0LmMKc2ltaWxh
cml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIHhlbi9jb21tb24vc2NoZWRfcnQuYwpyZW5hbWUg
dG8geGVuL2NvbW1vbi9zY2hlZC9ydC5jCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
