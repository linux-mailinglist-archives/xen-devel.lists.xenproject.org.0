Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7DE4D56D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 19:49:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1he19Z-00015b-4s; Thu, 20 Jun 2019 17:47:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1he19X-00015S-Ma
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 17:47:15 +0000
X-Inumbo-ID: 6eafa8c8-9383-11e9-ba41-4327d1b8e17c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6eafa8c8-9383-11e9-ba41-4327d1b8e17c;
 Thu, 20 Jun 2019 17:47:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0FFF360;
 Thu, 20 Jun 2019 10:47:11 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFAE83F246;
 Thu, 20 Jun 2019 10:47:10 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 20 Jun 2019 18:47:06 +0100
Message-Id: <20190620174706.16657-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PRE-4.12 PATCH] xen/arm: time: cycles_t should be an
 uint64_t and not unsigned long
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
Cc: Julien Grall <julien.grall@arm.com>, sstabellini@kernel.org,
 ian.jackson@eu.citrix.com, jbeulich@suse.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2luY2UgY29tbWl0IGNhNzNhYzhlN2QgInhlbi9hcm06IEFkZCBhbiBpc2IoKSBiZWZvcmUgcmVh
ZGluZyBDTlRQQ1RfRUwwCnRvIHByZXZlbnQgcmUtb3JkZXJpbmciLCBnZXRfY3ljbGVzKCkgaXMg
bm93IHJldHVybmluZyB0aGUgbnVtYmVyIG9mCmN5Y2xlcyBhbmQgdXNlZCBpbiBtb3JlIGNhbGxl
cnMuCgpXaGlsZSB0aGUgY291bnRlciByZWdpc3RlcnMgaXMgYWx3YXlzIDY0LWJpdCwgZ2V0X2N5
Y2xlcygpIHdpbGwgb25seQpyZXV0cm4gYSAzMi1iaXQgb24gQXJtMzIgYW5kIHRoZXJlZm9yZSB0
cnVuY2F0ZSB0aGUgdmFsdWUuIFRoaXMgd2lsbApyZXN1bHQgdG8gd2VpcmQgYmVoYXZpb3IgYnkg
Ym90aCBYZW4gYW5kIHRoZSBHdWVzdCBhcyB0aGUgdGltZXIgd2lsbCBub3QKYmUgc2V0dXAgY29y
cmVjdGx5LgoKVGhpcyBjb3VsZCBiZSByZXNvbHZlZCBieSBzd2l0Y2ggY3ljbGVzX3QgZnJvbSB1
bnNpZ25lZCBsb25nIHRvCnVuc2lnbmVkIGludC4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIFRoaXMgaXMgb25seSB0YXJnZXRpbmcg
eGVuIDQuMTEgYW5kIGVhcmxpZXIuIFhlbiA0LjEyIGFuZCBsYXRlciBoYXZlCiAgICBhIGNvcnJl
Y3QgZGVmaW5pdGlvbiBvZiBjeWNsZXNfdCB0aGFua3MgdG8gZGEzZDU1YWU2NyAiY29uc29sZToK
ICAgIGF2b2lkIHByaW50aW5nIG5vIG9yIG51bGwgdGltZSBzdGFtcHMiLgoKICAgIFRoaXMgd2ls
bCBob3BlZnVsbHkgdW5ibG9jayBvc3N0ZXN0IG9uIHN0YWdpbmctNC4xMCBhbmQKICAgIHN0YWdp
bmctNC4xMS4gVGhpcyBwYXRjaCBzaG91bGQgYmUgYmFja3BvcnRlZCB1cCB0byBYZW4gNC44Lgot
LS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vdGltZS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LWFybS90aW1lLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaAppbmRleCBjYTMwNDA2NjY5
Li5iZDdkYzg2ZDc4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaAorKysg
Yi94ZW4vaW5jbHVkZS9hc20tYXJtL3RpbWUuaApAQCAtNyw3ICs3LDcgQEAKICAgICBEVF9NQVRD
SF9DT01QQVRJQkxFKCJhcm0sYXJtdjctdGltZXIiKSwgXAogICAgIERUX01BVENIX0NPTVBBVElC
TEUoImFybSxhcm12OC10aW1lciIpCiAKLXR5cGVkZWYgdW5zaWduZWQgbG9uZyBjeWNsZXNfdDsK
K3R5cGVkZWYgdWludDY0X3QgY3ljbGVzX3Q7CiAKIHN0YXRpYyBpbmxpbmUgY3ljbGVzX3QgZ2V0
X2N5Y2xlcyAodm9pZCkKIHsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
