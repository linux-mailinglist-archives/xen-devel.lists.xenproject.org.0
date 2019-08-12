Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3F8A4A6
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 19:33:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxE9a-0006mm-Cp; Mon, 12 Aug 2019 17:30:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dIXR=WI=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxE9Y-0006lR-VI
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 17:30:40 +0000
X-Inumbo-ID: e767d733-bd26-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e767d733-bd26-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 17:30:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF0B21715;
 Mon, 12 Aug 2019 10:30:39 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 491D63F706;
 Mon, 12 Aug 2019 10:30:39 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 12 Aug 2019 18:30:05 +0100
Message-Id: <20190812173019.11956-15-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190812173019.11956-1-julien.grall@arm.com>
References: <20190812173019.11956-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v3 14/28] xen/arm32: head: Rework and document
 check_cpu_mode()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QSBicmFuY2ggaW4gdGhlIHN1Y2Nlc3MgY2FzZSBjYW4gYmUgYXZvaWRlZCBieSBpbnZlcnRpbmcg
dGhlIGJyYW5jaApjb25kaXRpb24uIEF0IHRoZSBzYW1lIHRpbWUsIHJlbW92ZSBhIHBvaW50bGVz
cyBjb21tZW50IGFzIFhlbiBjYW4gb25seQpydW4gYXQgSHlwZXJ2aXNvciBNb2RlLgoKTGFzdGx5
LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWluIHJlZ2lzdGVycyB1c2FnZSB3aXRo
aW4gdGhlCmZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3Jh
bGxAYXJtLmNvbT4KCi0tLQogICAgQ2hhbmdlcyBpbiB2MjoKICAgICAgICAtIFBhdGNoIGFkZGVk
Ci0tLQogeGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyB8IDE1ICsrKysrKysrKysrLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMK
aW5kZXggNDI4NWY3NjQ2My4uYzdiNGZlNGNkNCAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2Fy
bTMyL2hlYWQuUworKysgYi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0yMDYsNiArMjA2
LDE2IEBAIHNlY29uZGFyeV9zd2l0Y2hlZDoKICAgICAgICAgYiAgICAgbGF1bmNoCiBFTkRQUk9D
KGluaXRfc2Vjb25kYXJ5KQogCisvKgorICogQ2hlY2sgaWYgdGhlIENQVSBzdXBwb3J0cyB2aXJ0
dWFsaXphdGlvbiBleHRlbnNpb25zIGFuZCBoYXMgYmVlbiBib290ZWQKKyAqIGluIEh5cGVydmlz
b3IgbW9kZS4KKyAqCisgKiBUaGlzIGZ1bmN0aW9uIHdpbGwgbmV2ZXIgcmV0dXJuIHdoZW4gdGhl
IENQVSBkb2Vzbid0IHN1cHBvcnQKKyAqIHZpcnR1YWxpemF0aW9uIGV4dGVuc2lvbnMgb3IgaXMg
Ym9vdGVkIGluIGFub3RoZXIgbW9kZSB0aGFuCisgKiBIeXBlcnZpc29yIG1vZGUuCisgKgorICog
Q2xvYmJlcnMgcjAgLSByMworICovCiBjaGVja19jcHVfbW9kZToKICAgICAgICAgLyogQ2hlY2sg
dGhhdCB0aGlzIENQVSBoYXMgSHlwIG1vZGUgKi8KICAgICAgICAgbXJjICAgQ1AzMihyMCwgSURf
UEZSMSkKQEAgLTIyMCwxNSArMjMwLDEyIEBAIGNoZWNrX2NwdV9tb2RlOgogICAgICAgICBtcnMg
ICByMCwgY3BzcgogICAgICAgICBhbmQgICByMCwgcjAsICMweDFmICAgICAgICAgIC8qIE1vZGUg
aXMgaW4gdGhlIGxvdyA1IGJpdHMgb2YgQ1BTUiAqLwogICAgICAgICB0ZXEgICByMCwgIzB4MWEg
ICAgICAgICAgICAgIC8qIEh5cCBNb2RlPyAqLwotICAgICAgICBiZXEgICBoeXAKKyAgICAgICAg
bW92ZXEgcGMsIGxyICAgICAgICAgICAgICAgICAvKiBZZXMsIHJldHVybiAqLwogCiAgICAgICAg
IC8qIE9LLCB3ZSdyZSBib25lZC4gKi8KICAgICAgICAgUFJJTlQoIi0gWGVuIG11c3QgYmUgZW50
ZXJlZCBpbiBOUyBIeXAgbW9kZSAtXHJcbiIpCiAgICAgICAgIFBSSU5UKCItIFBsZWFzZSB1cGRh
dGUgdGhlIGJvb3Rsb2FkZXIgLVxyXG4iKQogICAgICAgICBiICAgICBmYWlsCi0KLWh5cDogICAg
UFJJTlQoIi0gWGVuIHN0YXJ0aW5nIGluIEh5cCBtb2RlIC1cclxuIikKLSAgICAgICAgbW92ICAg
cGMsIGxyCiBFTkRQUk9DKGNoZWNrX2NwdV9tb2RlKQogCiB6ZXJvX2JzczoKLS0gCjIuMTEuMAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
