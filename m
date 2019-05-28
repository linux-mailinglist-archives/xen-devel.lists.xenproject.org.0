Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0E92C957
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 16:57:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVdUr-0000VB-O7; Tue, 28 May 2019 14:54:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=twwc=T4=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1hVdUq-0000Uq-6R
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 14:54:36 +0000
X-Inumbo-ID: 81aa6446-8158-11e9-b0c1-373a42fb1148
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 81aa6446-8158-11e9-b0c1-373a42fb1148;
 Tue, 28 May 2019 14:54:35 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Tue, 28 May 2019 16:54:33 +0200
Received: from linux-nq5u.suse.de (nwb-a10-snat.microfocus.com [10.120.13.201])
 by emea4-mta.ukb.novell.com with ESMTP (NOT encrypted);
 Tue, 28 May 2019 15:54:23 +0100
From: Vasilis Liaskovitis <vliaskovitis@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 16:54:15 +0200
Message-Id: <20190528145416.16918-4-vliaskovitis@suse.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190528145416.16918-1-vliaskovitis@suse.com>
References: <20190528145416.16918-1-vliaskovitis@suse.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 3/4] libxl: add libxl_get_parameters()
 function
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
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com,
 jbeulich@suse.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com,
 ian.jackson@eu.citrix.com, tim@xen.org, vliaskovitis@suse.com,
 anthony.perard@citrix.com, dgdegra@tycho.nsa.gov
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbmV3IGxpYnhsIGZ1bmN0aW9uIHRvIGdldCBoeXBlcnZpc29yIHBhcmFtZXRlcnMuCgpT
aWduZWQtb2ZmLWJ5OiBWYXNpbGlzIExpYXNrb3ZpdGlzIDx2bGlhc2tvdml0aXNAc3VzZS5jb20+
Ci0tLQogdG9vbHMvbGlieGwvbGlieGwuYyB8IDE5ICsrKysrKysrKysrKysrKysrKysKIHRvb2xz
L2xpYnhsL2xpYnhsLmggfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5jIGIvdG9vbHMvbGlieGwvbGlieGwuYwpp
bmRleCBlYzcxNTc0ZTk5Li45YmIwMzgyYzM4IDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bC5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmMKQEAgLTY2OSw2ICs2NjksMjUgQEAgaW50IGxp
YnhsX3NldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpwYXJhbXMpCiAgICAgcmV0
dXJuIDA7CiB9CiAKK2ludCBsaWJ4bF9nZXRfcGFyYW1ldGVycyhsaWJ4bF9jdHggKmN0eCwgY2hh
ciAqcGFyYW1zLCBjaGFyICp2YWx1ZXMpCit7CisgICAgaW50IHIsIHJjOworICAgIEdDX0lOSVQo
Y3R4KTsKKworICAgIHIgPSB4Y19nZXRfcGFyYW1ldGVycyhjdHgtPnhjaCwgcGFyYW1zLCB2YWx1
ZXMpOworICAgIGlmIChyIDwgMCkgeworICAgICAgICBMT0dFKEVSUk9SLCAiZ2V0dGluZyBwYXJh
bWV0ZXJzIik7CisgICAgICAgIHJjID0gRVJST1JfRkFJTDsKKyAgICAgICAgZ290byBvdXQ7Cisg
ICAgfQorCisgICAgcmMgPSAwOworCitvdXQ6CisgICAgR0NfRlJFRTsKKyAgICByZXR1cm4gcmM7
Cit9CisKIHN0YXRpYyBpbnQgZmRfc2V0X2ZsYWdzKGxpYnhsX2N0eCAqY3R4LCBpbnQgZmQsCiAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnQgZmNudGxnZXRvcCwgaW50IGZjbnRsc2V0b3AsIGNv
bnN0IGNoYXIgKmZsLAogICAgICAgICAgICAgICAgICAgICAgICAgaW50IGZsYWdtYXNrLCBpbnQg
c2V0X3ApCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGli
eGwuaAppbmRleCBhMzhlNWNkYmEyLi4zNjBhNzU3YTA2IDEwMDY0NAotLS0gYS90b29scy9saWJ4
bC9saWJ4bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKQEAgLTIzMDcsNiArMjMwNyw3IEBA
IGludCBsaWJ4bF9zZW5kX3RyaWdnZXIobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAog
aW50IGxpYnhsX3NlbmRfc3lzcnEobGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBjaGFy
IHN5c3JxKTsKIGludCBsaWJ4bF9zZW5kX2RlYnVnX2tleXMobGlieGxfY3R4ICpjdHgsIGNoYXIg
KmtleXMpOwogaW50IGxpYnhsX3NldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpw
YXJhbXMpOworaW50IGxpYnhsX2dldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpw
YXJhbXMsIGNoYXIgKnZhbHVlcyk7CiAKIHR5cGVkZWYgc3RydWN0IGxpYnhsX194ZW5fY29uc29s
ZV9yZWFkZXIgbGlieGxfeGVuX2NvbnNvbGVfcmVhZGVyOwogCi0tIAoyLjIwLjEKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
