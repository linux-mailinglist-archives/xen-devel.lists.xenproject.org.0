Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01981AF593
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 08:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7vhi-00024M-Th; Wed, 11 Sep 2019 06:02:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s4Ct=XG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i7vhh-00024H-Hv
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 06:02:09 +0000
X-Inumbo-ID: aef80b98-d459-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aef80b98-d459-11e9-978d-bc764e2007e4;
 Wed, 11 Sep 2019 06:02:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EDAC3AF81;
 Wed, 11 Sep 2019 06:02:05 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 11 Sep 2019 08:02:03 +0200
Message-Id: <20190911060203.25202-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] tools: fix linking hypervisor includes to tools
 include directory
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
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW4gaW5jcmVtZW50YWwgYnVpbGQgb2YgdG9vbHMvaW5jbHVkZSB3b24ndCBwaWNrdXAgbmV3IGh5
cGVydmlzb3IKaGVhZGVycyBpbiB0b29scy9pbmNsdWRlL3hlbi4gRml4IHRoYXQuCgpTaWduZWQt
b2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogdG9vbHMvaW5jbHVk
ZS9NYWtlZmlsZSB8IDkgKysrKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL2luY2x1ZGUvTWFrZWZpbGUgYi90
b29scy9pbmNsdWRlL01ha2VmaWxlCmluZGV4IDcxNTM4ZTFjZTIuLjNkMDE5MmZiYWQgMTAwNjQ0
Ci0tLSBhL3Rvb2xzL2luY2x1ZGUvTWFrZWZpbGUKKysrIGIvdG9vbHMvaW5jbHVkZS9NYWtlZmls
ZQpAQCAtMTIsMTEgKzEyLDE0IEBAIGFsbC15OgogeGVuLWZvcmVpZ246CiAJJChNQUtFKSAtQyB4
ZW4tZm9yZWlnbgogCi14ZW4vLmRpcjoKK1hFTl9QVUJMSUNfSU5DTFVERVMgPSAkKHdpbGRjYXJk
ICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3B1YmxpYy8qLmgpCitYRU5fTElCX1g4Nl9JTkNMVURF
UyA9ICQoZmlsdGVyLW91dCAlYXV0b2dlbi5oLCAkKFhFTl9ST09UKS94ZW4vaW5jbHVkZS94ZW4v
bGliL3g4Ni9NYWtlZmlsZSAkKHdpbGRjYXJkICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi9s
aWIveDg2LyouaCkpCisKK3hlbi8uZGlyOiAkKFhFTl9QVUJMSUNfSU5DTFVERVMpICQoWEVOX0xJ
Ql9YODZfSU5DTFVERVMpCiAJQHJtIC1yZiB4ZW4KIAlta2RpciAtcCB4ZW4vbGliZWxmCiAJbG4g
LXNmICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3B1YmxpYy9DT1BZSU5HIHhlbgotCWxuIC1zZiAk
KHdpbGRjYXJkICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3B1YmxpYy8qLmgpIHhlbgorCWxuIC1z
ZiAkKFhFTl9QVUJMSUNfSU5DTFVERVMpIHhlbgogCWxuIC1zZiAkKGFkZHByZWZpeCAkKFhFTl9S
T09UKS94ZW4vaW5jbHVkZS9wdWJsaWMvLGFyY2gteDg2IGFyY2gtYXJtIGh2bSBpbyB4c20pIHhl
bgogCWxuIC1zZiAuLi94ZW4tc3lzLyQoWEVOX09TKSB4ZW4vc3lzCiAJbG4gLXNmICQoYWRkcHJl
Zml4ICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi8sbGliZWxmLmggZWxmc3RydWN0cy5oKSB4
ZW4vbGliZWxmLwpAQCAtMjUsNyArMjgsNyBAQCB4ZW4vLmRpcjoKIGlmZXEgKCQoQ09ORklHX1g4
NikseSkKIAlsbiAtc2YgJChYRU5fUk9PVCkveGVuL2luY2x1ZGUvYXNtLXg4NiB4ZW4vYXNtCiAJ
bWtkaXIgLXAgeGVuL2xpYi94ODYKLQlmb3IgZiBpbiAkKGZpbHRlci1vdXQgJWF1dG9nZW4uaCwk
KHBhdHN1YnN0ICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2LyUsJSxNYWtlZmls
ZSAkKHdpbGRjYXJkICQoWEVOX1JPT1QpL3hlbi9pbmNsdWRlL3hlbi9saWIveDg2LyouaCkpKTsg
ZG8gXAorCWZvciBmIGluICQocGF0c3Vic3QgJChYRU5fUk9PVCkveGVuL2luY2x1ZGUveGVuL2xp
Yi94ODYvJSwlLCQoWEVOX0xJQl9YODZfSU5DTFVERVMpKTsgZG8gXAogCQlsbiAtc2YgJChYRU5f
Uk9PVCkveGVuL2luY2x1ZGUveGVuL2xpYi94ODYvJCRmIHhlbi9saWIveDg2LyQkZjsgXAogCWRv
bmUKIGVuZGlmCi0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
