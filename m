Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA78C2F8D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFE2z-0002w5-Aq; Tue, 01 Oct 2019 09:02:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uaPp=X2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iFE2y-0002vr-BN
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:02:16 +0000
X-Inumbo-ID: 23d89010-e42a-11e9-8628-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 23d89010-e42a-11e9-8628-bc764e2007e4;
 Tue, 01 Oct 2019 09:02:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0702373A62;
 Tue,  1 Oct 2019 09:02:05 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-182.ams2.redhat.com [10.36.117.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 824F0611DE;
 Tue,  1 Oct 2019 09:02:01 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 11:01:52 +0200
Message-Id: <20191001090152.1770-4-david@redhat.com>
In-Reply-To: <20191001090152.1770-1-david@redhat.com>
References: <20191001090152.1770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Tue, 01 Oct 2019 09:02:05 +0000 (UTC)
Subject: [Xen-devel] [PATCH v1 3/3] xen/balloon: Clear PG_offline in
 balloon_retrieve()
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
 Stefano Stabellini <sstabellini@kernel.org>,
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGV0J3MgbW92ZSB0aGUgY2xlYXJpbmcgdG8gYmFsbG9vbl9yZXRyaWV2ZSgpLiBJbgpicF9zdGF0
ZSBpbmNyZWFzZV9yZXNlcnZhdGlvbigpLCB3ZSBub3cgY2xlYXIgdGhlIGZsYWcgYSBsaXR0bGUg
ZWFybGllcgp0aGFuIGJlZm9yZSwgaG93ZXZlciwgdGhpcyBzaG91bGQgbm90IG1hdHRlciBmb3Ig
WEVOLgoKU3VnZ2VzdGVkLWJ5OiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPgpDYzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4K
Q2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJh
bmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy94ZW4vYmFsbG9vbi5jIHwgMyArLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKaW5kZXgg
OGMyNDVlOTliYjA2Li41YmFlNTE1YzhlMjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL2JhbGxv
b24uYworKysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKQEAgLTE4OSw2ICsxODksNyBAQCBzdGF0
aWMgc3RydWN0IHBhZ2UgKmJhbGxvb25fcmV0cmlldmUoYm9vbCByZXF1aXJlX2xvd21lbSkKIAll
bHNlCiAJCWJhbGxvb25fc3RhdHMuYmFsbG9vbl9sb3ctLTsKIAorCV9fQ2xlYXJQYWdlT2ZmbGlu
ZShwYWdlKTsKIAlyZXR1cm4gcGFnZTsKIH0KIApAQCAtNDQwLDcgKzQ0MSw2IEBAIHN0YXRpYyBl
bnVtIGJwX3N0YXRlIGluY3JlYXNlX3Jlc2VydmF0aW9uKHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMp
CiAJCXhlbm1lbV9yZXNlcnZhdGlvbl92YV9tYXBwaW5nX3VwZGF0ZSgxLCAmcGFnZSwgJmZyYW1l
X2xpc3RbaV0pOwogCiAJCS8qIFJlbGlucXVpc2ggdGhlIHBhZ2UgYmFjayB0byB0aGUgYWxsb2Nh
dG9yLiAqLwotCQlfX0NsZWFyUGFnZU9mZmxpbmUocGFnZSk7CiAJCWZyZWVfcmVzZXJ2ZWRfcGFn
ZShwYWdlKTsKIAl9CiAKQEAgLTYwNiw3ICs2MDYsNiBAQCBpbnQgYWxsb2NfeGVuYmFsbG9vbmVk
X3BhZ2VzKGludCBucl9wYWdlcywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAl3aGlsZSAocGdubyA8
IG5yX3BhZ2VzKSB7CiAJCXBhZ2UgPSBiYWxsb29uX3JldHJpZXZlKHRydWUpOwogCQlpZiAocGFn
ZSkgewotCQkJX19DbGVhclBhZ2VPZmZsaW5lKHBhZ2UpOwogCQkJcGFnZXNbcGdubysrXSA9IHBh
Z2U7CiAjaWZkZWYgQ09ORklHX1hFTl9IQVZFX1BWTU1VCiAJCQkvKgotLSAKMi4yMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
