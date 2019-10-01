Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BB6C2F94
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:05:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFE2k-0002tI-CD; Tue, 01 Oct 2019 09:02:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uaPp=X2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iFE2j-0002tD-Dt
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:02:01 +0000
X-Inumbo-ID: 1f64a924-e42a-11e9-97fb-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 1f64a924-e42a-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 09:01:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 82117C04DBCD;
 Tue,  1 Oct 2019 09:01:57 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-182.ams2.redhat.com [10.36.117.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CCCAD611DE;
 Tue,  1 Oct 2019 09:01:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 11:01:49 +0200
Message-Id: <20191001090152.1770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Tue, 01 Oct 2019 09:01:57 +0000 (UTC)
Subject: [Xen-devel] [PATCH v1 0/3] xen/balloon: PG_offline cleanups
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
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBjbGVhbnVwcyBiYXNlZCBvbiB0b3Agb2Y6CiAgICBbUEFUQ0ggdjFdIHhlbi9iYWxsb29u
OiBTZXQgcGFnZXMgUGFnZU9mZmxpbmUoKSBpbiBiYWxsb29uX2FkZF9yZWdpb24oKQoKTWFrZSB0
aGUgUEdfb2ZmbGluZSBsZXNzIGVycm9yIHByb25lLCBieSBzaW1wbHkgc2V0dGluZyBQR19vZmZs
aW5lIHdoZW4KdGhleSBlbnRlciB0aGUgcGFnZSBsaXN0IGFuZCBjbGVhcmluZyBQR19vZmZsaW5l
IHdoZW4gdGhleSBsZWF2ZSB0aGUKcGFnZSBsaXN0LgoKT25seSBjb21waWxlLXRlc3RlZC4KCkRh
dmlkIEhpbGRlbmJyYW5kICgzKToKICB4ZW4vYmFsbG9vbjogRHJvcCBfX2JhbGxvb25fYXBwZW5k
KCkKICB4ZW4vYmFsbG9vbjogTWFyayBwYWdlcyBQR19vZmZsaW5lIGluIGJhbGxvb25fYXBwZW5k
KCkKICB4ZW4vYmFsbG9vbjogQ2xlYXIgUEdfb2ZmbGluZSBpbiBiYWxsb29uX3JldHJpZXZlKCkK
CiBkcml2ZXJzL3hlbi9iYWxsb29uLmMgfCAyNSArKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
