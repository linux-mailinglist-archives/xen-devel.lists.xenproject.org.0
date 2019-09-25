Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD69BBE530
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 20:53:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDCLY-00048B-4L; Wed, 25 Sep 2019 18:49:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDCLX-000486-39
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 18:49:03 +0000
X-Inumbo-ID: 238734ae-dfc5-11e9-963a-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 238734ae-dfc5-11e9-963a-12813bfff9fa;
 Wed, 25 Sep 2019 18:49:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3689C2146E;
 Wed, 25 Sep 2019 18:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569437340;
 bh=wtd2ZEAxfSyQ8BkHLCp4XlyNv/xkNYGN7+Hvg5Ac2q4=;
 h=Date:From:To:cc:Subject:From;
 b=yUPxRoRXw+z3nOloleLJdergHqUCP2FqONH0rmmyPFV243wNp3LA2aS7Gog1VSswe
 Ykn/OfDDcPBP+NXZTu3MG34dNK+jQAzBp7rhxdxiUCkNXss02AKZ0ZC0hNge3RrxCg
 /i3g3Tt9zoUAk6+doeSX7qNUVNX+urbnf67t05Vc=
Date: Wed, 25 Sep 2019 11:48:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: julien.grall@arm.com
Message-ID: <alpine.DEB.2.21.1909251146261.24909@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 0/8] dom0less device assignment
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
bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNjZiODg2OGIyYzg4
MTE3YmU0M2ZmOTE2YmE3YmExNzQzMTc2Y2YwYToKCiAgeGVuL2FybTogYWRkIGRvbTAtbGVzcyBk
ZXZpY2UgYXNzaWdubWVudCBpbmZvIHRvIGRvY3MgKDIwMTktMDktMjUgMTE6NDc6MDQgLTA3MDAp
CgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGluaSAoOCk6CiAgICAgIHhlbi9hcm06IGludHJvZHVj
ZSBoYW5kbGVfZGV2aWNlX2ludGVycnVwdHMKICAgICAgeGVuL2FybTogZXhwb3J0IGRldmljZV90
cmVlX2dldF9yZWcgYW5kIGRldmljZV90cmVlX2dldF91MzIKICAgICAgeGVuL2FybTogaW50cm9k
dWNlIGtpbmZvLT5ndWVzdF9waGFuZGxlX2dpYwogICAgICB4ZW4vYXJtOiBjb3B5IGR0YiBmcmFn
bWVudCB0byBndWVzdCBkdGIKICAgICAgeGVuL2FybTogYXNzaWduIGRldmljZXMgdG8gYm9vdCBk
b21haW5zCiAgICAgIHhlbi9hcm06IGhhbmRsZSAibXVsdGlib290LGRldmljZS10cmVlIiBjb21w
YXRpYmxlIG5vZGVzCiAgICAgIHhlbi9hcm06IGludHJvZHVjZSBucl9zcGlzCiAgICAgIHhlbi9h
cm06IGFkZCBkb20wLWxlc3MgZGV2aWNlIGFzc2lnbm1lbnQgaW5mbyB0byBkb2NzCgogZG9jcy9t
aXNjL2FybS9kZXZpY2UtdHJlZS9ib290aW5nLnR4dCB8ICA0NCArKystCiBkb2NzL21pc2MvYXJt
L3Bhc3N0aHJvdWdoLnR4dCAgICAgICAgIHwgMTAxICsrKysrKysrKwogeGVuL2FyY2gvYXJtL2Jv
b3RmZHQuYyAgICAgICAgICAgICAgICB8ICAxMCArLQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWls
ZC5jICAgICAgICAgICB8IDM4NCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tCiB4
ZW4vYXJjaC9hcm0va2VybmVsLmMgICAgICAgICAgICAgICAgIHwgIDE0ICstCiB4ZW4vYXJjaC9h
cm0vc2V0dXAuYyAgICAgICAgICAgICAgICAgIHwgICAxICsKIHhlbi9pbmNsdWRlL2FzbS1hcm0v
a2VybmVsLmggICAgICAgICAgfCAgIDUgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vc2V0dXAuaCAg
ICAgICAgICAgfCAgIDcgKwogOCBmaWxlcyBjaGFuZ2VkLCA1MTAgaW5zZXJ0aW9ucygrKSwgNTYg
ZGVsZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
