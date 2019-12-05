Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA2A113C70
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 08:36:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iclbZ-0006cl-2D; Thu, 05 Dec 2019 07:31:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iclbY-0006cd-B3
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 07:31:16 +0000
X-Inumbo-ID: 380cb900-1731-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 380cb900-1731-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 07:31:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ABC77B22C;
 Thu,  5 Dec 2019 07:31:14 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Message-ID: <a720d5d3-f5a0-0fd2-a6a7-5f6101dcf9cb@suse.com>
Date: Thu, 5 Dec 2019 08:31:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <521c23e1-9d89-8f26-572c-1b6f6bc3cbaa@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/3] lz4: fix system halt at boot kernel on
 x86_64
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogS3J6eXN6dG9mIEtvbGFzYSA8a2tvbGFzYUB3aW5zb2Z0LnBsPgoKU29tZXRpbWVzLCBv
biB4ODZfNjQsIGRlY29tcHJlc3Npb24gZmFpbHMgd2l0aCB0aGUgZm9sbG93aW5nCmVycm9yOgoK
RGVjb21wcmVzc2luZyBMaW51eC4uLgoKRGVjb2RpbmcgZmFpbGVkCgogLS0gU3lzdGVtIGhhbHRl
ZAoKVGhpcyBjb25kaXRpb24gaXMgbm90IG5lZWRlZCBmb3IgYSA2NGJpdCBrZXJuZWwoZnJvbSBj
b21taXQgZDVlN2NhZik6CgppZiggLi4uIHx8CiAgICAob3AgKyBDT1BZTEVOR1RIKSA+IG9lbmQp
CiAgICBnb3RvIF9vdXRwdXRfZXJyb3IKCm1hY3JvIExaNF9TRUNVUkVfQ09QWSgpIHRlc3RzIG9w
IGFuZCBkb2VzIG5vdCBjb3B5IGFueSBkYXRhCndoZW4gb3AgZXhjZWVkcyB0aGUgdmFsdWUuCgph
ZGRlZCBieSBhbmFsb2d5IHRvIGx6NF91bmNvbXByZXNzX3Vua25vd25vdXRwdXRzaXplKC4uLikK
ClNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb2xhc2EgPGtrb2xhc2FAd2luc29mdC5wbD4KW0xp
bnV4IGNvbW1pdCA5OWI3ZTkzYzk1Yzc4OTUyNzI0YTk3ODNkZTZjNzhkZWY4ZmJmYzNmXQoKVGhl
IG9mZmVuZGluZyBjb21taXQgaW4gb3VyIGNhc2UgaXMgZmNjMTdmOTZjMjc3ICgiTFo0IDogZml4
IHRoZSBkYXRhCmFib3J0IGlzc3VlIikuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vY29tbW9uL2x6NC9kZWNvbXByZXNzLmMKKysrIGIv
eGVuL2NvbW1vbi9sejQvZGVjb21wcmVzcy5jCkBAIC0xMzMsOCArMTMzLDEyIEBAIHN0YXRpYyBp
bnQgSU5JVCBsejRfdW5jb21wcmVzcyhjb25zdCB1bnMKIAkJCS8qIEVycm9yOiByZXF1ZXN0IHRv
IHdyaXRlIGJleW9uZCBkZXN0aW5hdGlvbiBidWZmZXIgKi8KIAkJCWlmIChjcHkgPiBvZW5kKQog
CQkJCWdvdG8gX291dHB1dF9lcnJvcjsKKyNpZiBMWjRfQVJDSDY0CisJCQlpZiAoKHJlZiArIENP
UFlMRU5HVEgpID4gb2VuZCkKKyNlbHNlCiAJCQlpZiAoKHJlZiArIENPUFlMRU5HVEgpID4gb2Vu
ZCB8fAogCQkJCQkob3AgKyBDT1BZTEVOR1RIKSA+IG9lbmQpCisjZW5kaWYKIAkJCQlnb3RvIF9v
dXRwdXRfZXJyb3I7CiAJCQlMWjRfU0VDVVJFQ09QWShyZWYsIG9wLCAob2VuZCAtIENPUFlMRU5H
VEgpKTsKIAkJCXdoaWxlIChvcCA8IGNweSkKQEAgLTI2Miw3ICsyNjYsMTMgQEAgc3RhdGljIGlu
dCBsejRfdW5jb21wcmVzc191bmtub3dub3V0cHV0cwogCQlpZiAoY3B5ID4gb2VuZCAtIENPUFlM
RU5HVEgpIHsKIAkJCWlmIChjcHkgPiBvZW5kKQogCQkJCWdvdG8gX291dHB1dF9lcnJvcjsgLyog
d3JpdGUgb3V0c2lkZSBvZiBidWYgKi8KLQorI2lmIExaNF9BUkNINjQKKwkJCWlmICgocmVmICsg
Q09QWUxFTkdUSCkgPiBvZW5kKQorI2Vsc2UKKwkJCWlmICgocmVmICsgQ09QWUxFTkdUSCkgPiBv
ZW5kIHx8CisJCQkJCShvcCArIENPUFlMRU5HVEgpID4gb2VuZCkKKyNlbmRpZgorCQkJCWdvdG8g
X291dHB1dF9lcnJvcjsKIAkJCUxaNF9TRUNVUkVDT1BZKHJlZiwgb3AsIChvZW5kIC0gQ09QWUxF
TkdUSCkpOwogCQkJd2hpbGUgKG9wIDwgY3B5KQogCQkJCSpvcCsrID0gKnJlZisrOwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
