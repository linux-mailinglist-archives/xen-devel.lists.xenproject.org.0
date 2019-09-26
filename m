Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938C2BFBAF
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 01:15:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDcvA-0004fC-JX; Thu, 26 Sep 2019 23:11:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/1y=XV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDcv8-0004eQ-CB
 for xen-devel@lists.xen.org; Thu, 26 Sep 2019 23:11:34 +0000
X-Inumbo-ID: faf5a720-e0b2-11e9-9665-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id faf5a720-e0b2-11e9-9665-12813bfff9fa;
 Thu, 26 Sep 2019 23:11:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57BB7206B7;
 Thu, 26 Sep 2019 23:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569539492;
 bh=NMaIIf9CtgjSEq3M1LiLsavmN68J8QzwjGm/RHGTMEs=;
 h=Date:From:To:cc:Subject:From;
 b=W3Uyh1d5KfbX+L7FhIKYMG/oJZz2aEUiQmQUZo+tDc6DJF+KKPOJxzpQX5dcQ9awD
 XjcCnMEFvemp8bB/K3RwSkRycdOxupOU//iaEZn3HpBl5mCQ4cPMljHnanhkosBhZc
 vOA4dkpV63pv0BPSpEi1e85rTL5O18JLCckT/UpQ=
Date: Thu, 26 Sep 2019 16:11:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 0/8] dom0less device assignment
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, sstabellini@kernel.org,
 andrii_anisov@epam.com, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzbWFsbCBwYXRjaCBzZXJpZXMgYWRkcyBkZXZpY2UgYXNzaWdubWVudCBz
dXBwb3J0IHRvIERvbTBsZXNzLgpUaGUgbGFzdCBwYXRjaCBpcyB0aGUgZG9jdW1lbnRhdGlvbi4K
CkNoZWVycywKClN0ZWZhbm8KCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IGY5
M2FiZjAzMTVlZmVmODYxMjcwYzI1ZDgzYzgwNDdmZDZhNTRlYzQ6CgogIHhlbjogc2NoZWQ6IEZp
eCBBcm0gYnVpbGQgYWZ0ZXIgY29tbWl0IGY4NTVkZDk2MjUgKDIwMTktMDktMjQgMTg6NTg6NTUg
KzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBhdDoKCiAgaHR0cDov
L3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAvcGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11
bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNzg1MmU2YWNjMWIy
OGUwMGZjNGY3ZGEwYmMxNjMxNWI2ZGE4MWQyNzoKCiAgeGVuL2FybTogYWRkIGRvbTAtbGVzcyBk
ZXZpY2UgYXNzaWdubWVudCBpbmZvIHRvIGRvY3MgKDIwMTktMDktMjUgMTk6MDM6MTAgLTA3MDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoOCk6CiAgICAgIHhlbi9hcm06IGludHJvZHVj
ZSBoYW5kbGVfZGV2aWNlX2ludGVycnVwdHMKICAgICAgeGVuL2FybTogZXhwb3J0IGRldmljZV90
cmVlX2dldF9yZWcgYW5kIGRldmljZV90cmVlX2dldF91MzIKICAgICAgeGVuL2FybTogaW50cm9k
dWNlIGtpbmZvLT5waGFuZGxlX2dpYwogICAgICB4ZW4vYXJtOiBjb3B5IGR0YiBmcmFnbWVudCB0
byBndWVzdCBkdGIKICAgICAgeGVuL2FybTogYXNzaWduIGRldmljZXMgdG8gYm9vdCBkb21haW5z
CiAgICAgIHhlbi9hcm06IGhhbmRsZSAibXVsdGlib290LGRldmljZS10cmVlIiBjb21wYXRpYmxl
IG5vZGVzCiAgICAgIHhlbi9hcm06IGludHJvZHVjZSBucl9zcGlzCiAgICAgIHhlbi9hcm06IGFk
ZCBkb20wLWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzCgogZG9jcy9taXNjL2Fy
bS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8ICA0NCArKystCiBkb2NzL21pc2MvYXJtL3Bhc3N0
aHJvdWdoLnR4dCAgICAgICAgIHwgMTAxICsrKysrKysrKwogeGVuL2FyY2gvYXJtL2Jvb3RmZHQu
YyAgICAgICAgICAgICAgICB8ICAxMCArLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jICAg
ICAgICAgICB8IDM5OCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4ZW4vYXJj
aC9hcm0va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC9hcm0vc2V0
dXAuYyAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL2FzbS1hcm0va2VybmVs
LmggICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCAgICAgICAg
ICAgfCAgIDcgKwogOCBmaWxlcyBjaGFuZ2VkLCA1MjMgaW5zZXJ0aW9ucygrKSwgNTcgZGVsZXRp
b25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
