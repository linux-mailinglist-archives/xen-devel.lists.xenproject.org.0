Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299283E47
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 02:25:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv9jQ-0004dN-5R; Wed, 07 Aug 2019 00:23:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PRvR=WD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hv9jO-0004dI-Oa
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 00:23:06 +0000
X-Inumbo-ID: 85bf6b3b-b8a9-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 85bf6b3b-b8a9-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 00:23:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8285214C6;
 Wed,  7 Aug 2019 00:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565137384;
 bh=uPQBNP/H+xEPulN9SvFGqaVbGIizpT6+XK1rYU0ad2c=;
 h=Date:From:To:cc:Subject:From;
 b=1+UsWrdvBfW5e5AF2lOqw+XapPmWlSV9BvNN7CujW96GzaYuZM4oq84P+FQU9ME0U
 Z/0liiCrhqlxeYaJk7ZG0pBmbAl0no22gNlLuK2fcB2ExHMKQt3doS4H3aa7FbGgpz
 Pf0ohYa4jNg//jk07kcolJoozA87K0mzz+ZCAMUI=
Date: Tue, 6 Aug 2019 17:23:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Message-ID: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 0/6] iomem memory policy
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
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, andrew.cooper3@citrix.com,
 julien.grall@arm.com, JBeulich@suse.com, ian.jackson@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLAoKVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhIG1lbW9yeSBwb2xpY3kgcGFyYW1ldGVy
IGZvciB0aGUgaW9tZW0gb3B0aW9uLApzbyB0aGF0IHdlIGNhbiBtYXAgYW4gaW9tZW0gcmVnaW9u
IGludG8gYSBndWVzdCBhcyBjYWNoZWFibGUgbWVtb3J5LgoKKE90aGVyIHRoaW5ncyByZWxhdGVk
IHRvIHJlc2VydmVkLW1lbW9yeSBvbiBBcm0gaGF2ZSBiZWVuIHNlbnQKc2VwYXJhdGVseS4pCgpD
aGVlcnMsCgpTdGVmYW5vCgoKVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0NWNl
NWI4NzQ5YTIyMGFkN2M0Y2U1ZDVlYmE3YzIwMWE5NDE4MDc4OgoKICBtbTogU2FmZSB0byBjbGVh
ciBQR0NfYWxsb2NhdGVkIG9uIHhlbmhlYXAgcGFnZXMgd2l0aG91dCBhbiBleHRyYSByZWZlcmVu
Y2UgKDIwMTktMDgtMDYgMTI6MTk6NTUgKzAxMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQg
cmVwb3NpdG9yeSBhdDoKCiAgaHR0cDovL3hlbmJpdHMueGVucHJvamVjdC5vcmcvZ2l0LWh0dHAv
cGVvcGxlL3NzdGFiZWxsaW5pL3hlbi11bnN0YWJsZS5naXQgCgpmb3IgeW91IHRvIGZldGNoIGNo
YW5nZXMgdXAgdG8gMzZiZTM4ZGEyZjU0MGFlZmJmYjNkMTQwNzZiODM1ZmM0Zjg1MmFhZjoKCiAg
eGVuL2FybTogY2xhcmlmeSB0aGUgc3VwcG9ydCBzdGF0dXMgb2YgaW9tZW0gY29uZmlndXJhdGlv
bnMgKDIwMTktMDgtMDYgMTc6MTU6MDAgLTA3MDApCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClN0ZWZhbm8gU3RhYmVsbGlu
aSAoNik6CiAgICAgIHhlbi9hcm06IGludHJvZHVjZSBwMm1faXNfbW1pbwogICAgICB4ZW46IGFk
ZCBhIHAybXQgcGFyYW1ldGVyIHRvIG1hcF9tbWlvX3JlZ2lvbnMKICAgICAgeGVuOiBleHRlbmQg
WEVOX0RPTUNUTF9tZW1vcnlfbWFwcGluZyB0byBoYW5kbGUgbWVtb3J5IHBvbGljeQogICAgICBs
aWJ4YzogaW50cm9kdWNlIHhjX2RvbWFpbl9tZW1fbWFwX3BvbGljeQogICAgICBsaWJ4bC94bDog
YWRkIG1lbW9yeSBwb2xpY3kgb3B0aW9uIHRvIGlvbWVtCiAgICAgIHhlbi9hcm06IGNsYXJpZnkg
dGhlIHN1cHBvcnQgc3RhdHVzIG9mIGlvbWVtIGNvbmZpZ3VyYXRpb25zCgogU1VQUE9SVC5tZCAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogZG9jcy9tYW4veGwuY2ZnLjUucG9kLmluICAg
ICAgICAgfCAxMCArKysrKysrKystCiB0b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaCAgICB8
ICA4ICsrKysrKysrCiB0b29scy9saWJ4Yy94Y19kb21haW4uYyAgICAgICAgICB8IDI0ICsrKysr
KysrKysrKysrKysrKysrLS0tLQogdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICAgICAgfCAg
NSArKysrKwogdG9vbHMvbGlieGwvbGlieGxfYXJjaC5oICAgICAgICAgfCAgMyArKysKIHRvb2xz
L2xpYnhsL2xpYnhsX2FybS5jICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKIHRvb2xzL2xp
YnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgIHwgMTIgKysrKysrKysrKy0tCiB0b29scy9saWJ4bC9s
aWJ4bF90eXBlcy5pZGwgICAgICB8ICA4ICsrKysrKysrCiB0b29scy9saWJ4bC9saWJ4bF94ODYu
YyAgICAgICAgICB8IDEwICsrKysrKysrKysKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAgICAgICAg
ICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrLQogeGVuL2FyY2gvYXJtL2FjcGkvZG9tYWlu
X2J1aWxkLmMgfCAgNCArKy0tCiB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC9hcm0vZ2ljLXYyLmMgICAgICAgICAgICB8ICAzICsrLQogeGVuL2FyY2gv
YXJtL3AybS5jICAgICAgICAgICAgICAgfCAxOSArKy0tLS0tLS0tLS0tLS0tLS0tCiB4ZW4vYXJj
aC9hcm0vcGxhdGZvcm1zL2V4eW5vczUuYyB8ICA2ICsrKystLQogeGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9vbWFwNS5jICAgfCAxMiArKysrKysrKy0tLS0KIHhlbi9hcmNoL2FybS90cmFwcy5jICAg
ICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL2FybS92Z2ljLXYyLmMgICAgICAgICAgIHwgIDIg
Ky0KIHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMtdjIuYyAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4
Ni9odm0vZG9tMF9idWlsZC5jICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyAgICAg
ICAgICAgIHwgIDggKysrKy0tLS0KIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAgICAgICAgIHwg
MzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVh
ZGVyLmMgICAgICAgIHwgIDIgKy0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vcDJtLmggICAgICAgIHwg
MjEgKysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oICAgICAg
ICB8ICA4ICsrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmggICAgICB8IDIwICsr
KysrKysrKysrKysrKysrKystCiB4ZW4vaW5jbHVkZS94ZW4vcDJtLWNvbW1vbi5oICAgICB8IDEx
ICsrKysrKystLS0tCiAyOCBmaWxlcyBjaGFuZ2VkLCAyMDYgaW5zZXJ0aW9ucygrKSwgNjggZGVs
ZXRpb25zKC0pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
