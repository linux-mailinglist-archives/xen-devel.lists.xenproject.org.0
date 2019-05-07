Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D42F16674
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:17:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1oi-0007gP-Ew; Tue, 07 May 2019 15:15:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO1og-0007en-O7
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:15:38 +0000
X-Inumbo-ID: f7c8fccb-70da-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f7c8fccb-70da-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 15:15:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3879FEBD;
 Tue,  7 May 2019 08:15:37 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A03A3F5AF;
 Tue,  7 May 2019 08:15:35 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Tue,  7 May 2019 16:14:58 +0100
Message-Id: <20190507151458.29350-15-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190507151458.29350-1-julien.grall@arm.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH 14/14] xen/mm: Provide dummy M2P-related helpers
 when !CONFIG_HAVE_M2P
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgdGhlIG1vbWVudCwgQXJtIGlzIHByb3ZpZGluZyBhIGR1bW15IGltcGxlbWVudGF0aW9uIGZv
ciB0aGUgTTJQCmhlbHBlcnMgdXNlZCBpbiBjb21tb24gY29kZS4gSG93ZXZlciwgdGhleSBhcmUg
cXVpdGUgaXNvbGF0ZWQgYW5kIGNvdWxkCmJlIHVzZWQgYnkgb3RoZXIgYXJjaGl0ZWN0dXJlIGlu
IHRoZSBmdXR1cmUuIFNvIG1vdmUgYWxsIHRoZSBoZWxwZXJzIGluCnhlbi9tbS5oLgoKU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCi0tLQogICAgQ2hh
bmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVkCi0tLQogeGVuL2luY2x1ZGUvYXNtLWFy
bS9tbS5oIHwgMTEgLS0tLS0tLS0tLS0KIHhlbi9pbmNsdWRlL3hlbi9tbS5oICAgICB8IDE0ICsr
KysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDExIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vbW0uaCBiL3hlbi9pbmNs
dWRlL2FzbS1hcm0vbW0uaAppbmRleCAzYzAzYmUzYmNhLi5kNjhkMTc5NGU1IDEwMDY0NAotLS0g
YS94ZW4vaW5jbHVkZS9hc20tYXJtL21tLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9tbS5o
CkBAIC0zMTMsMTcgKzMxMyw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAqcGFnZV90b192aXJ0KGNv
bnN0IHN0cnVjdCBwYWdlX2luZm8gKnBnKQogc3RydWN0IHBhZ2VfaW5mbyAqZ2V0X3BhZ2VfZnJv
bV9ndmEoc3RydWN0IHZjcHUgKnYsIHZhZGRyX3QgdmEsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKTsKIAotLyoKLSAqIEFybSBkb2VzIG5v
dCBoYXZlIGFuIE0yUCwgYnV0IGNvbW1vbiBjb2RlIGV4cGVjdHMgYSBoYW5kZnVsIG9mCi0gKiBN
MlAtcmVsYXRlZCBkZWZpbmVzIGFuZCBmdW5jdGlvbnMuIFByb3ZpZGUgZHVtbXkgdmVyc2lvbnMg
b2YgdGhlc2UuCi0gKi8KLSNkZWZpbmUgSU5WQUxJRF9NMlBfRU5UUlkgICAgICAgICh+MFVMKQot
I2RlZmluZSBTSEFSRURfTTJQX0VOVFJZICAgICAgICAgKH4wVUwgLSAxVUwpCi0jZGVmaW5lIFNI
QVJFRF9NMlAoX2UpICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZKQotCi0vKiBX
ZSBkb24ndCBoYXZlIGEgTTJQIG9uIEFybSAqLwotc3RhdGljIGlubGluZSB2b2lkIHNldF9wZm5f
ZnJvbV9tZm4obWZuX3QgbWZuLCB1bnNpZ25lZCBsb25nIHBmbikge30KLQogLyogQXJjaC1zcGVj
aWZpYyBwb3J0aW9uIG9mIG1lbW9yeV9vcCBoeXBlcmNhbGwuICovCiBsb25nIGFyY2hfbWVtb3J5
X29wKGludCBvcCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpOwogCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vbW0uaCBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCmluZGV4IDNi
YTcxNjhjYzkuLjA3ZDJkNDQ0OTEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9tbS5oCisr
KyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCkBAIC02NTgsNCArNjU4LDE4IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBzaGFyZV94ZW5fcGFnZV93aXRoX3ByaXZpbGVnZWRfZ3Vlc3RzKAogICAgIHNoYXJl
X3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGFnZSwgZG9tX3hlbiwgZmxhZ3MpOwogfQogCisvKgorICog
RHVtbXkgaW1wbGVtZW50YXRpb24gb2YgTTJQLXJlbGF0ZWQgaGVscGVycyBmb3IgY29tbW9uIGNv
ZGUgd2hlbgorICogdGhlIGFyY2hpdGVjdHVyZSBkb2Vzbid0IGhhdmUgYW4gTTJQLgorICovCisj
aWZuZGVmIENPTkZJR19IQVNfTTJQCisKKyNkZWZpbmUgSU5WQUxJRF9NMlBfRU5UUlkgICAgICAg
ICh+MFVMKQorI2RlZmluZSBTSEFSRURfTTJQX0VOVFJZICAgICAgICAgKH4wVUwgLSAxVUwpCisj
ZGVmaW5lIFNIQVJFRF9NMlAoX2UpICAgICAgICAgICAoKF9lKSA9PSBTSEFSRURfTTJQX0VOVFJZ
KQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2V0X3Bmbl9mcm9tX21mbihtZm5fdCBtZm4sIHVuc2ln
bmVkIGxvbmcgcGZuKSB7fQorCisjZW5kaWYKKwogI2VuZGlmIC8qIF9fWEVOX01NX0hfXyAqLwot
LSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
