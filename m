Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C60140B9E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 14:52:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isS0R-000623-He; Fri, 17 Jan 2020 13:49:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HJCJ=3G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1isS0P-00061x-T7
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 13:49:45 +0000
X-Inumbo-ID: 31657aee-3930-11ea-b833-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31657aee-3930-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 13:49:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 56285AAC2;
 Fri, 17 Jan 2020 13:49:33 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Date: Fri, 17 Jan 2020 14:49:31 +0100
Message-Id: <20200117134931.16470-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v2] xen/balloon: Support xend-based toolstack
 take two
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
YWNrIHRvIHRoZSBiZWhhdmlvcgpiZWZvcmUgY29tbWl0IDk2ZWRkNjFkY2Y0NDM2ICgieGVuL2Jh
bGxvb246IGRvbid0IG9ubGluZSBuZXcgbWVtb3J5CmluaXRpYWxseSIpIGluIGNhc2UgdGhlIHN0
YXRpYyBtZW1vcnkgbWF4aW11bSBjYW4ndCBiZSByZWFkLgoKVGhpcyBpcyBhY2hpZXZlZCBieSBz
ZXR0aW5nIHN0YXRpY19tYXggdG8gdGhlIGN1cnJlbnQgbnVtYmVyIG9mCm1lbW9yeSBwYWdlcyBr
bm93biBieSB0aGUgc3lzdGVtIHJlc3VsdGluZyBpbiB0YXJnZXRfZGlmZiBiZWNvbWluZwp6ZXJv
LgoKRml4ZXM6IDNhYTZjMTlkMmYzOGJlICgieGVuL2JhbGxvb246IFN1cHBvcnQgeGVuZC1iYXNl
ZCB0b29sc3RhY2siKQpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+ClJldmlld2VkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUu
Y29tPgpDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgNC4xMwotLS0KVjI6IGJldHRlciBj
b21taXQgbWVzc2FnZQotLS0KIGRyaXZlcnMveGVuL3hlbi1iYWxsb29uLmMgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jIGIvZHJpdmVycy94ZW4veGVuLWJhbGxvb24uYwppbmRl
eCA2ZDEyZmMzNjgyMTAuLmE4ZDI0NDMzYzhlOSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4veGVu
LWJhbGxvb24uYworKysgYi9kcml2ZXJzL3hlbi94ZW4tYmFsbG9vbi5jCkBAIC05NCw3ICs5NCw3
IEBAIHN0YXRpYyB2b2lkIHdhdGNoX3RhcmdldChzdHJ1Y3QgeGVuYnVzX3dhdGNoICp3YXRjaCwK
IAkJCQkgICIlbGx1IiwgJnN0YXRpY19tYXgpID09IDEpKQogCQkJc3RhdGljX21heCA+Pj0gUEFH
RV9TSElGVCAtIDEwOwogCQllbHNlCi0JCQlzdGF0aWNfbWF4ID0gbmV3X3RhcmdldDsKKwkJCXN0
YXRpY19tYXggPSBiYWxsb29uX3N0YXRzLmN1cnJlbnRfcGFnZXM7CiAKIAkJdGFyZ2V0X2RpZmYg
PSAoeGVuX3B2X2RvbWFpbigpIHx8IHhlbl9pbml0aWFsX2RvbWFpbigpKSA/IDAKIAkJCQk6IHN0
YXRpY19tYXggLSBiYWxsb29uX3N0YXRzLnRhcmdldF9wYWdlczsKLS0gCjIuMTYuNAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
