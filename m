Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEFFE63D
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 21:13:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVhvh-0006th-VY; Fri, 15 Nov 2019 20:10:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NJS8=ZH=dornerworks.com=stewart.hildebrand@srs-us1.protection.inumbo.net>)
 id 1iVhvf-0006tS-WF
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 20:10:52 +0000
X-Inumbo-ID: 02c57bc6-07e4-11ea-b678-bc764e2007e4
Received: from webmail.dornerworks.com (unknown [12.207.209.150])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 02c57bc6-07e4-11ea-b678-bc764e2007e4;
 Fri, 15 Nov 2019 20:10:47 +0000 (UTC)
From: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 15 Nov 2019 15:10:32 -0500
Message-ID: <20191115201037.44982-2-stewart.hildebrand@dornerworks.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
References: <20191115200115.44890-1-stewart.hildebrand@dornerworks.com>
MIME-Version: 1.0
X-Originating-IP: [172.27.14.58]
X-ClientProxiedBy: Mcbain.dw.local (172.27.1.45) To Mcbain.dw.local
 (172.27.1.45)
X-spam-status: No, score=-2.9 required=3.5 tests=ALL_TRUSTED, BAYES_00,
 MAILSHELL_SCORE_0_4
X-Spam-Flag: NO
Subject: [Xen-devel] [XEN PATCH v3 06/11] Add NR_SGIS and NR_PPIS
 definitions to irq.h
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2Ugd2lsbCBiZSB1c2VkIGluIGEgZm9sbG93LXVwIHBhdGNoLgoKU2lnbmVkLW9mZi1ieTog
U3Rld2FydCBIaWxkZWJyYW5kIDxzdGV3YXJ0LmhpbGRlYnJhbmRAZG9ybmVyd29ya3MuY29tPgot
LS0KdjM6IG5ldyBwYXRjaAotLS0KIHhlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmggfCA0ICsrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL2lycS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pcnEu
aAppbmRleCAzYjM3YTIxYzA2Li4zNjdmZTYyNjljIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9h
c20tYXJtL2lycS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vaXJxLmgKQEAgLTMzLDcgKzMz
LDkgQEAgc3RydWN0IGFyY2hfaXJxX2Rlc2MgewogICAgIHVuc2lnbmVkIGludCB0eXBlOwogfTsK
IAotI2RlZmluZSBOUl9MT0NBTF9JUlFTCTMyCisjZGVmaW5lIE5SX1NHSVMgICAgICAgICAxNgor
I2RlZmluZSBOUl9QUElTICAgICAgICAgMTYKKyNkZWZpbmUgTlJfTE9DQUxfSVJRUyAgIChOUl9T
R0lTICsgTlJfUFBJUykKIAogLyoKICAqIFRoaXMgb25seSBjb3ZlcnMgdGhlIGludGVycnVwdHMg
dGhhdCBYZW4gY2FyZXMgYWJvdXQsIHNvIFNHSXMsIFBQSXMgYW5kCi0tIAoyLjI0LjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
