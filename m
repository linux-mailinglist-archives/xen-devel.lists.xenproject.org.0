Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A028114403B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 16:11:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itv7r-0006HR-Iy; Tue, 21 Jan 2020 15:07:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=li9x=3K=dornerworks.com=jeff.kubascik@srs-us1.protection.inumbo.net>)
 id 1itv7q-0006H5-1Y
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 15:07:30 +0000
X-Inumbo-ID: bb7face0-3c5f-11ea-bacb-12813bfff9fa
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bb7face0-3c5f-11ea-bacb-12813bfff9fa;
 Tue, 21 Jan 2020 15:07:26 +0000 (UTC)
From: Jeff Kubascik <jeff.kubascik@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 21 Jan 2020 10:07:04 -0500
Message-ID: <20200121150704.126001-3-jeff.kubascik@dornerworks.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
References: <20200121150704.126001-1-jeff.kubascik@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.13.179]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [PATCH v4 2/2] xen/arm: Sign extend TimerValue when
 computing the CompareValue
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

WGVuIHdpbGwgb25seSBzdG9yZSB0aGUgQ29tcGFyZVZhbHVlIGFzIGl0IGNhbiBiZSBkZXJpdmVk
IGZyb20gdGhlClRpbWVyVmFsdWUgKEFSTSBEREkgMDQ4N0UuYSBzZWN0aW9uIEQxMS4yLjQpOgoK
ICBDb21wYXJlVmFsdWUgPSAoQ291bnRlcls2MzowXSArIFNpZ25FeHRlbmQoVGltZXJWYWx1ZSkp
WzYzOjBdCgpXaGlsZSB0aGUgVGltZXJWYWx1ZSBpcyBhIDMyLWJpdCBzaWduZWQgdmFsdWUsIG91
ciBpbXBsZW1lbnRhdGlvbgphc3N1bWVkIGl0IGlzIGEgMzItYml0IHVuc2lnbmVkIHZhbHVlLgoK
U2lnbmVkLW9mZi1ieTogSmVmZiBLdWJhc2NpayA8amVmZi5rdWJhc2Npa0Bkb3JuZXJ3b3Jrcy5j
b20+Ci0tLQogeGVuL2FyY2gvYXJtL3Z0aW1lci5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Z0
aW1lci5jIGIveGVuL2FyY2gvYXJtL3Z0aW1lci5jCmluZGV4IDBjNzhhNjU4NjMuLmZlZDg5NDk4
YTkgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS92dGltZXIuYworKysgYi94ZW4vYXJjaC9hcm0v
dnRpbWVyLmMKQEAgLTIxMSw3ICsyMTEsNyBAQCBzdGF0aWMgYm9vbCB2dGltZXJfY250cF90dmFs
KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCB1aW50MzJfdCAqciwKICAgICB9CiAgICAgZWxz
ZQogICAgIHsKLSAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVyLmN2YWwgPSBjbnRwY3QgKyAqcjsK
KyAgICAgICAgdi0+YXJjaC5waHlzX3RpbWVyLmN2YWwgPSBjbnRwY3QgKyAodWludDY0X3QpKGlu
dDMyX3QpKnI7CiAgICAgICAgIGlmICggdi0+YXJjaC5waHlzX3RpbWVyLmN0bCAmIENOVHhfQ1RM
X0VOQUJMRSApCiAgICAgICAgIHsKICAgICAgICAgICAgIHYtPmFyY2gucGh5c190aW1lci5jdGwg
Jj0gfkNOVHhfQ1RMX1BFTkRJTkc7Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
