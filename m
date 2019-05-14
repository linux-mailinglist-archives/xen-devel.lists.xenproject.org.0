Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 133461CBEC
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 17:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQZO2-0005qr-L1; Tue, 14 May 2019 15:30:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jxAo=TO=amazon.com=prvs=030dd7525=sironi@srs-us1.protection.inumbo.net>)
 id 1hQZBg-0004Pe-1M
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 15:17:52 +0000
X-Inumbo-ID: 6fff6848-765b-11e9-8e8f-bf921e4427e0
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fff6848-765b-11e9-8e8f-bf921e4427e0;
 Tue, 14 May 2019 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1557847070; x=1589383070;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=QcDO1x50vykS6alzxzUfHSiSasm/D0Pn85L/rydHfIg=;
 b=iGuZbAcHU/uW5drVq4BdCd6m3R2qTj943B0sMg4Y0p/GJHYuD+L1VRN+
 ljGraFVcpival74uwDBwUi7Lqw+1Ff4EyEXRZyjq+SQQJIx0ImjFAfoaQ
 z1mlCD+Ub83E7CPuMOMYtD1LByaMtLiFGgLEUQyH2DUatqZXPpPrUIO9V s=;
X-IronPort-AV: E=Sophos;i="5.60,469,1549929600"; d="scan'208";a="804590402"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 14 May 2019 15:17:46 +0000
Received: from uf8b156e456a5587c9af4.ant.amazon.com
 (iad7-ws-svc-lb50-vlan2.amazon.com [10.0.93.210])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (8.14.7/8.14.7) with
 ESMTP id x4EFHegZ104209
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 May 2019 15:17:43 GMT
Received: from uf8b156e456a5587c9af4.ant.amazon.com (localhost [127.0.0.1])
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 x4EFHd8C028010; Tue, 14 May 2019 17:17:39 +0200
Received: (from sironi@localhost)
 by uf8b156e456a5587c9af4.ant.amazon.com (8.15.2/8.15.2/Submit) id
 x4EFHdra028007; Tue, 14 May 2019 17:17:39 +0200
From: Filippo Sironi <sironi@amazon.de>
To: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, borntraeger@de.ibm.com, 
 boris.ostrovsky@oracle.com, cohuck@redhat.com, konrad.wilk@oracle.com,
 xen-devel@lists.xenproject.org, vasu.srinivasan@oracle.com
Date: Tue, 14 May 2019 17:16:41 +0200
Message-Id: <1557847002-23519-2-git-send-email-sironi@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557847002-23519-1-git-send-email-sironi@amazon.de>
References: <1539078879-4372-1-git-send-email-sironi@amazon.de>
 <1557847002-23519-1-git-send-email-sironi@amazon.de>
Precedence: Bulk
X-Mailman-Approved-At: Tue, 14 May 2019 15:30:36 +0000
Subject: [Xen-devel] [PATCH v2 1/2] KVM: Start populating /sys/hypervisor
 with KVM entries
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Filippo Sironi <sironi@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U3RhcnQgcG9wdWxhdGluZyAvc3lzL2h5cGVydmlzb3Igd2l0aCBLVk0gZW50cmllcyB3aGVuIHdl
J3JlIHJ1bm5pbmcgb24KS1ZNLiBUaGlzIGlzIHRvIHJlcGxpY2F0ZSBmdW5jdGlvbmFsaXR5IHRo
YXQncyBhdmFpbGFibGUgd2hlbiB3ZSdyZQpydW5uaW5nIG9uIFhlbi4KClN0YXJ0IHdpdGggL3N5
cy9oeXBlcnZpc29yL3V1aWQsIHdoaWNoIHVzZXJzIHByZWZlciBvdmVyCi9zeXMvZGV2aWNlcy92
aXJ0dWFsL2RtaS9pZC9wcm9kdWN0X3V1aWQgYXMgYSB3YXkgdG8gcmVjb2duaXplIGEgdmlydHVh
bAptYWNoaW5lLCBzaW5jZSBpdCdzIGFsc28gYXZhaWxhYmxlIHdoZW4gcnVubmluZyBvbiBYZW4g
SFZNIGFuZCBvbiBYZW4gUFYKYW5kLCBvbiB0b3Agb2YgdGhhdCBkb2Vzbid0IHJlcXVpcmUgcm9v
dCBwcml2aWxlZ2VzIGJ5IGRlZmF1bHQuCkxldCdzIGNyZWF0ZSBhcmNoLXNwZWNpZmljIGhvb2tz
IHNvIHRoYXQgZGlmZmVyZW50IGFyY2hpdGVjdHVyZXMgY2FuCnByb3ZpZGUgZGlmZmVyZW50IGlt
cGxlbWVudGF0aW9ucy4KClNpZ25lZC1vZmYtYnk6IEZpbGlwcG8gU2lyb25pIDxzaXJvbmlAYW1h
em9uLmRlPgotLS0KdjI6CiogbW92ZSB0aGUgcmV0cmlldmFsIG9mIHRoZSBWTSBVVUlEIG91dCBv
ZiB1dWlkX3Nob3cgYW5kIGludG8KICBrdm1fcGFyYV9nZXRfdXVpZCwgd2hpY2ggaXMgYSB3ZWFr
IGZ1bmN0aW9uIHRoYXQgY2FuIGJlIG92ZXJ3cml0dGVuCgogZHJpdmVycy9LY29uZmlnICAgICAg
ICAgICAgICB8ICAyICsrCiBkcml2ZXJzL01ha2VmaWxlICAgICAgICAgICAgIHwgIDIgKysKIGRy
aXZlcnMva3ZtL0tjb25maWcgICAgICAgICAgfCAxNCArKysrKysrKysrKysrKwogZHJpdmVycy9r
dm0vTWFrZWZpbGUgICAgICAgICB8ICAxICsKIGRyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMg
fCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgNDkg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMva3ZtL0tjb25maWcKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2t2bS9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMKCmRpZmYgLS1naXQgYS9kcml2ZXJzL0tjb25m
aWcgYi9kcml2ZXJzL0tjb25maWcKaW5kZXggNDVmOWRlY2I5ODQ4Li45MGViODM1ZmU5NTEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvS2NvbmZpZworKysgYi9kcml2ZXJzL0tjb25maWcKQEAgLTE0Niw2
ICsxNDYsOCBAQCBzb3VyY2UgImRyaXZlcnMvaHYvS2NvbmZpZyIKIAogc291cmNlICJkcml2ZXJz
L3hlbi9LY29uZmlnIgogCitzb3VyY2UgImRyaXZlcnMva3ZtL0tjb25maWciCisKIHNvdXJjZSAi
ZHJpdmVycy9zdGFnaW5nL0tjb25maWciCiAKIHNvdXJjZSAiZHJpdmVycy9wbGF0Zm9ybS9LY29u
ZmlnIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9NYWtlZmlsZSBiL2RyaXZlcnMvTWFrZWZpbGUKaW5k
ZXggYzYxY2RlNTU0MzQwLi43OWNjOTJhM2Y2YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvTWFrZWZp
bGUKKysrIGIvZHJpdmVycy9NYWtlZmlsZQpAQCAtNDQsNiArNDQsOCBAQCBvYmoteQkJCQkrPSBz
b2MvCiBvYmotJChDT05GSUdfVklSVElPKQkJKz0gdmlydGlvLwogb2JqLSQoQ09ORklHX1hFTikJ
CSs9IHhlbi8KIAorb2JqLSQoQ09ORklHX0tWTV9HVUVTVCkJCSs9IGt2bS8KKwogIyByZWd1bGF0
b3JzIGVhcmx5LCBzaW5jZSBzb21lIHN1YnN5c3RlbXMgcmVseSBvbiB0aGVtIHRvIGluaXRpYWxp
emUKIG9iai0kKENPTkZJR19SRUdVTEFUT1IpCQkrPSByZWd1bGF0b3IvCiAKZGlmZiAtLWdpdCBh
L2RyaXZlcnMva3ZtL0tjb25maWcgYi9kcml2ZXJzL2t2bS9LY29uZmlnCm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uM2ZjMDQxZGY3YzExCi0tLSAvZGV2L251bGwKKysr
IGIvZHJpdmVycy9rdm0vS2NvbmZpZwpAQCAtMCwwICsxLDE0IEBACittZW51ICJLVk0gZHJpdmVy
IHN1cHBvcnQiCisgICAgICAgIGRlcGVuZHMgb24gS1ZNX0dVRVNUCisKK2NvbmZpZyBLVk1fU1lT
X0hZUEVSVklTT1IKKyAgICAgICAgYm9vbCAiQ3JlYXRlIEtWTSBlbnRyaWVzIHVuZGVyIC9zeXMv
aHlwZXJ2aXNvciIKKyAgICAgICAgZGVwZW5kcyBvbiBTWVNGUworICAgICAgICBzZWxlY3QgU1lT
X0hZUEVSVklTT1IKKyAgICAgICAgZGVmYXVsdCB5CisgICAgICAgIGhlbHAKKyAgICAgICAgICBD
cmVhdGUgS1ZNIGVudHJpZXMgdW5kZXIgL3N5cy9oeXBlcnZpc29yIChlLmcuLCB1dWlkKS4gV2hl
biBydW5uaW5nCisgICAgICAgICAgbmF0aXZlIG9yIG9uIGFub3RoZXIgaHlwZXJ2aXNvciwgL3N5
cy9oeXBlcnZpc29yIG1heSBzdGlsbCBiZQorICAgICAgICAgIHByZXNlbnQsIGJ1dCBpdCB3aWxs
IGhhdmUgbm8gS1ZNIGVudHJpZXMuCisKK2VuZG1lbnUKZGlmZiAtLWdpdCBhL2RyaXZlcnMva3Zt
L01ha2VmaWxlIGIvZHJpdmVycy9rdm0vTWFrZWZpbGUKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMDAwLi43M2E0M2ZjOTk0YjkKLS0tIC9kZXYvbnVsbAorKysgYi9kcml2ZXJz
L2t2bS9NYWtlZmlsZQpAQCAtMCwwICsxIEBACitvYmotJChDT05GSUdfS1ZNX1NZU19IWVBFUlZJ
U09SKSArPSBzeXMtaHlwZXJ2aXNvci5vCmRpZmYgLS1naXQgYS9kcml2ZXJzL2t2bS9zeXMtaHlw
ZXJ2aXNvci5jIGIvZHJpdmVycy9rdm0vc3lzLWh5cGVydmlzb3IuYwpuZXcgZmlsZSBtb2RlIDEw
MDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjQzYjFkMWEwOTgwNwotLS0gL2Rldi9udWxsCisrKyBi
L2RyaXZlcnMva3ZtL3N5cy1oeXBlcnZpc29yLmMKQEAgLTAsMCArMSwzMCBAQAorLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKworI2luY2x1ZGUgPGFzbS9rdm1fcGFyYS5o
PgorCisjaW5jbHVkZSA8bGludXgva29iamVjdC5oPgorI2luY2x1ZGUgPGxpbnV4L3N5c2ZzLmg+
CisKK19fd2VhayBjb25zdCBjaGFyICprdm1fcGFyYV9nZXRfdXVpZCh2b2lkKQoreworCXJldHVy
biBOVUxMOworfQorCitzdGF0aWMgc3NpemVfdCB1dWlkX3Nob3coc3RydWN0IGtvYmplY3QgKm9i
aiwKKwkJCSBzdHJ1Y3Qga29ial9hdHRyaWJ1dGUgKmF0dHIsCisJCQkgY2hhciAqYnVmKQorewor
CWNvbnN0IGNoYXIgKnV1aWQgPSBrdm1fcGFyYV9nZXRfdXVpZCgpOworCXJldHVybiBzcHJpbnRm
KGJ1ZiwgIiVzXG4iLCB1dWlkKTsKK30KKworc3RhdGljIHN0cnVjdCBrb2JqX2F0dHJpYnV0ZSB1
dWlkID0gX19BVFRSX1JPKHV1aWQpOworCitzdGF0aWMgaW50IF9faW5pdCB1dWlkX2luaXQodm9p
ZCkKK3sKKwlpZiAoIWt2bV9wYXJhX2F2YWlsYWJsZSgpKQorCQlyZXR1cm4gMDsKKwlyZXR1cm4g
c3lzZnNfY3JlYXRlX2ZpbGUoaHlwZXJ2aXNvcl9rb2JqLCAmdXVpZC5hdHRyKTsKK30KKworZGV2
aWNlX2luaXRjYWxsKHV1aWRfaW5pdCk7Ci0tIAoyLjcuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
