Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B927CC12E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 18:59:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGQsw-00044P-A6; Fri, 04 Oct 2019 16:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEoo=X5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iGQsu-00044K-AW
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 16:56:52 +0000
X-Inumbo-ID: f5f769aa-e6c7-11e9-975d-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f5f769aa-e6c7-11e9-975d-12813bfff9fa;
 Fri, 04 Oct 2019 16:56:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4EBF15AB;
 Fri,  4 Oct 2019 09:56:50 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5EA3F68E;
 Fri,  4 Oct 2019 09:56:50 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Fri,  4 Oct 2019 17:56:46 +0100
Message-Id: <20191004165646.14482-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH for-4.13] xen/xsm: flask: Check xmalloc_array()
 return in security_sid_to_context()
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
Cc: jgross@suse.com, Julien Grall <julien.grall@arm.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

eG1hbGxvY19hcnJheSgpIG1heSByZXR1cm4gTlVMTCBpZiB0aGVyZSBhcmUgbWVtb3J5LiBSYXRo
ZXIgdGhhbiB0cnlpbmcKdG8gZGVmZXJlbmNlIGl0IGRpcmVjdGx5LCB3ZSBzaG91bGQgY2hlY2sg
dGhlIHJldHVybiB2YWx1ZSBmaXJzdC4KCkNvdmVyaXR5LUlEOiAxMzgxODUyClNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0tLQogeGVuL3hzbS9mbGFz
ay9zcy9zZXJ2aWNlcy5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi94c20vZmxhc2svc3Mvc2VydmljZXMuYyBiL3hlbi94c20vZmxhc2sv
c3Mvc2VydmljZXMuYwppbmRleCBiNTk5MjhlYThhLi40MjY4NjUzNWYyIDEwMDY0NAotLS0gYS94
ZW4veHNtL2ZsYXNrL3NzL3NlcnZpY2VzLmMKKysrIGIveGVuL3hzbS9mbGFzay9zcy9zZXJ2aWNl
cy5jCkBAIC03NzUsNiArNzc1LDggQEAgaW50IHNlY3VyaXR5X3NpZF90b19jb250ZXh0KHUzMiBz
aWQsIGNoYXIgKipzY29udGV4dCwgdTMyICpzY29udGV4dF9sZW4pCiAKICAgICAgICAgICAgICpz
Y29udGV4dF9sZW4gPSBzdHJsZW4oaW5pdGlhbF9zaWRfdG9fc3RyaW5nW3NpZF0pICsgMTsKICAg
ICAgICAgICAgIHNjb250ZXh0cCA9IHhtYWxsb2NfYXJyYXkoY2hhciwgKnNjb250ZXh0X2xlbik7
CisgICAgICAgICAgICBpZiAoICFzY29udGV4dHAgKQorICAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwogICAgICAgICAgICAgc3RybGNweShzY29udGV4dHAsIGluaXRpYWxfc2lkX3RvX3N0
cmluZ1tzaWRdLCAqc2NvbnRleHRfbGVuKTsKICAgICAgICAgICAgICpzY29udGV4dCA9IHNjb250
ZXh0cDsKICAgICAgICAgICAgIGdvdG8gb3V0OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
