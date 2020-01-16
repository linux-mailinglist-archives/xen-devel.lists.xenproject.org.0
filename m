Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEA113E38B
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 18:02:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is8VB-0006S0-8s; Thu, 16 Jan 2020 17:00:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=s8OO=3F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1is8VA-0006Rs-6g
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 17:00:12 +0000
X-Inumbo-ID: a5e1998f-3881-11ea-8781-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5e1998f-3881-11ea-8781-12813bfff9fa;
 Thu, 16 Jan 2020 17:00:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7A0E7B2EDC;
 Thu, 16 Jan 2020 17:00:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Thu, 16 Jan 2020 18:00:04 +0100
Message-Id: <20200116170004.14373-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/balloon: Support xend-based toolstack take
 two
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
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDNhYTZjMTlkMmYzOGJlICgieGVuL2JhbGxvb246IFN1cHBvcnQgeGVuZC1iYXNlZCB0
b29sc3RhY2siKQp0cmllZCB0byBmaXggYSByZWdyZXNzaW9uIHdpdGggcnVubmluZyBvbiByYXRo
ZXIgYW5jaWVudCBYZW4gdmVyc2lvbnMuClVuZm9ydHVuYXRlbHkgdGhlIGZpeCB3YXMgYmFzZWQg
b24gdGhlIGFzc3VtcHRpb24gdGhhdCB4ZW5kIHdvdWxkCmp1c3QgdXNlIGFub3RoZXIgWGVuc3Rv
cmUgbm9kZSwgYnV0IGluIHJlYWxpdHkgb25seSBzb21lIGRvd25zdHJlYW0KdmVyc2lvbnMgb2Yg
eGVuZCBhcmUgZG9pbmcgdGhhdC4gVGhlIHVwc3RyZWFtIHhlbmQgZG9lcyBub3Qgd3JpdGUKdGhh
dCBYZW5zdG9yZSBub2RlIGF0IGFsbCwgc28gdGhlIHByb2JsZW0gbXVzdCBiZSBmaXhlZCBpbiBh
bm90aGVyCndheS4KClRoZSBlYXNpZXN0IHdheSB0byBhY2hpZXZlIHRoYXQgaXMgdG8gZmFsbCBi
YWNrIHRvIHRoZSBiZWhhdmlvciBiZWZvcmUKY29tbWl0IDUyNjZiOGU0NDQ1YyAoInhlbjogZml4
IGJvb3RpbmcgYmFsbG9vbmVkIGRvd24gaHZtIGd1ZXN0IikKaW4gY2FzZSB0aGUgc3RhdGljIG1l
bW9yeSBtYXhpbXVtIGNhbid0IGJlIHJlYWQuCgpGaXhlczogM2FhNmMxOWQyZjM4YmUgKCJ4ZW4v
YmFsbG9vbjogU3VwcG9ydCB4ZW5kLWJhc2VkIHRvb2xzdGFjayIpClNpZ25lZC1vZmYtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3Jn
PiAjIDQuMTMKLS0tCiBkcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy94ZW4veGVuLWJhbGxvb24uYyBiL2RyaXZlcnMveGVuL3hlbi1iYWxsb29uLmMKaW5kZXggNmQx
MmZjMzY4MjEwLi5hOGQyNDQzM2M4ZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL3hlbi1iYWxs
b29uLmMKKysrIGIvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwpAQCAtOTQsNyArOTQsNyBAQCBz
dGF0aWMgdm9pZCB3YXRjaF90YXJnZXQoc3RydWN0IHhlbmJ1c193YXRjaCAqd2F0Y2gsCiAJCQkJ
ICAiJWxsdSIsICZzdGF0aWNfbWF4KSA9PSAxKSkKIAkJCXN0YXRpY19tYXggPj49IFBBR0VfU0hJ
RlQgLSAxMDsKIAkJZWxzZQotCQkJc3RhdGljX21heCA9IG5ld190YXJnZXQ7CisJCQlzdGF0aWNf
bWF4ID0gYmFsbG9vbl9zdGF0cy5jdXJyZW50X3BhZ2VzOwogCiAJCXRhcmdldF9kaWZmID0gKHhl
bl9wdl9kb21haW4oKSB8fCB4ZW5faW5pdGlhbF9kb21haW4oKSkgPyAwCiAJCQkJOiBzdGF0aWNf
bWF4IC0gYmFsbG9vbl9zdGF0cy50YXJnZXRfcGFnZXM7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
