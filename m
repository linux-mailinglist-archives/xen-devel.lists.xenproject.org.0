Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07C6FE623
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:03:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhmV-0005XG-Ca; Fri, 15 Nov 2019 20:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhmU-0005XB-Bv
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:01:22 +0000
X-Inumbo-ID: b14e5bb0-07e2-11ea-adbe-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b14e5bb0-07e2-11ea-adbe-bc764e2007e4;
 Fri, 15 Nov 2019 20:01:21 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:01:04 -0500
Message-ID: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_10_69
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 00/11] xen: arm: context switch vtimer
 PPI state
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jarvis Roach <jarvis.roach@dornerworks.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IFRoaXMgaXMgYW4gdXBkYXRlIHRvIElhbiBDYW1wYmVsbCdzIHdvcmsgdG8gcm91dGUgdGltZXIg
UFBJcyB0byBndWVzdHMKWzFdLgoKSSBhdHRlbXB0ZWQgdG8gYWRkcmVzcyBtb3N0IG9mIHRoZSBm
ZWVkYmFjayBvbiB2MiBvZiB0aGUgc2VyaWVzLiBUaGVyZQphcmUgYSBjb3VwbGUgb2YgY29tbWVu
dHMgSSB3YXMgdW5zdXJlIGFib3V0IC0gaW5zdGFuY2VzIG9mIHRoaXMgYXJlCm5vdGVkIGluIHRo
ZSBpbmRpdmlkdWFsIHBhdGNoZXMuCgpIaWdobGlnaHRzIGluIHYzOgogICogUmViYXNlCiAgKiBU
ZXN0ZWQgb24gUUVNVSB3aXRoIEdJQ3YzCiAgKiBUZXN0ZWQgb24gWGlsaW54IFp5bnEgVWx0cmFT
Y2FsZSsgd2l0aCBHSUN2MgoKV2hpbGUgSSBidWlsZC10ZXN0ZWQgd2l0aCBDT05GSUdfTkVXX1ZH
SUM9eSwgSSBvbmx5IGRpZCBhIHF1aWNrIHJ1bnRpbWUKdGVzdCB3aXRoIHRoZSBuZXcgdkdJQyBh
bmQgSSBlbmNvdW50ZXJlZCBhbiBBU1NFUlQgZmFpbHVyZToKCiAgQXNzZXJ0aW9uICdpcnEtPmh3
aW50aWQgPj0gVkdJQ19OUl9QUklWQVRFX0lSUVMnIGZhaWxlZCBhdCB2Z2ljLW1taW8uYzo5NgoK
QmVjYXVzZSBvZiB0aGlzLCBhbmQgYmVjYXVzZSB0aGVyZSBpcyBzdGlsbCBzb21lIGZlZWRiYWNr
IG91dHN0YW5kaW5nCmZyb20gdjIsIHBvcnRpb25zIG9mIHRoaXMgc2VyaWVzIG1heSBiZSBjb25z
aWRlcmVkIFJGQy1pc2ggKGVzcGVjaWFsbHkKdGhlIGxhc3QgcGF0Y2ggImNvbnRleHQgc3dpdGNo
IHZ0aW1lciBQUEkgc3RhdGUiKS4KClsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTUtMTEvbXNnMDA5MjEuaHRtbAoKCklhbiBDYW1wYmVs
bCAoNyk6CiAgeGVuOiBhcm06IGZpeCBpbmRlbnRhdGlvbiBvZiBzdHJ1Y3QgdnRpbWVyCiAgeGVu
OiBhcm06IGZpeCB0eXBvIGluIHRoZSBkZXNjcmlwdGlvbiBvZiBzdHJ1Y3QgcGVuZGluZ19pcnEt
PmRlc2MKICB4ZW46IGFybTogUmVmYWN0b3Igcm91dGVfaXJxX3RvX2d1ZXN0CiAgeGVuOiBhcm06
IGFkZCBpbnRlcmZhY2VzIHRvIHNhdmUvcmVzdG9yZSB0aGUgc3RhdGUgb2YgYSBQUEkuCiAgeGVu
OiBhcm06IGdpYzogc3VwcG9ydGluZyByb3V0aW5nIGEgUFBJIHRvIHRoZSBjdXJyZW50IHZjcHUu
CiAgeGVuOiBhcm06IGNvbnRleHQgc3dpdGNoIHZ0aW1lciBQUEkgc3RhdGUuCiAgSEFDSzogRm9y
Y2UgdmlydCB0aW1lciB0byBQUEkwIChJUlExNikKClN0ZXdhcnQgSGlsZGVicmFuZCAoNCk6CiAg
eGVuOiBhcm06IHJlbW92ZSBpc19hc3NpZ25hYmxlX2lycQogIEFkZCBOUl9TR0lTIGFuZCBOUl9Q
UElTIGRlZmluaXRpb25zIHRvIGlycS5oCiAgeGVuOiBhcm06IHZnaWM6IGFsbG93IGRlbGl2ZXJ5
IG9mIFBQSXMgdG8gZ3Vlc3RzCiAgeGVuOiBhcm06IHZnaWM6IGRvbid0IGZhaWwgaWYgSVJRIGlz
IGFscmVhZHkgY29ubmVjdGVkCgogeGVuL2FyY2gvYXJtL2dpYy12Mi5jICAgICAgICAgICAgfCAg
NjkgKysrKysrKysrKysKIHhlbi9hcmNoL2FybS9naWMtdjMuYyAgICAgICAgICAgIHwgIDY5ICsr
KysrKysrKysrCiB4ZW4vYXJjaC9hcm0vZ2ljLXZnaWMuYyAgICAgICAgICB8ICAzMyArKystLQog
eGVuL2FyY2gvYXJtL2dpYy5jICAgICAgICAgICAgICAgfCAgNzkgKysrKysrKysrKysrCiB4ZW4v
YXJjaC9hcm0vaXJxLmMgICAgICAgICAgICAgICB8IDIwMiArKysrKysrKysrKysrKysrKysrKysr
LS0tLS0tLS0tCiB4ZW4vYXJjaC9hcm0vdGltZS5jICAgICAgICAgICAgICB8ICAyNiArLS0tCiB4
ZW4vYXJjaC9hcm0vdmdpYy5jICAgICAgICAgICAgICB8ICAgNiArLQogeGVuL2FyY2gvYXJtL3Zn
aWMvdmdpYy5jICAgICAgICAgfCAgIDQgKwogeGVuL2FyY2gvYXJtL3Z0aW1lci5jICAgICAgICAg
ICAgfCAgNDUgKysrKysrLQogeGVuL2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCAgICAgfCAgMjIg
KysrLQogeGVuL2luY2x1ZGUvYXNtLWFybS9naWMuaCAgICAgICAgfCAgMjQgKysrKwogeGVuL2lu
Y2x1ZGUvYXNtLWFybS9pcnEuaCAgICAgICAgfCAgIDkgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0v
cGVyZmNfZGVmbi5oIHwgICAxIC0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vdmdpYy5oICAgICAgIHwg
ICAyICstCiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCAgICB8ICAgMiArLQogMTUgZmls
ZXMgY2hhbmdlZCwgNDgzIGluc2VydGlvbnMoKyksIDExMCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
