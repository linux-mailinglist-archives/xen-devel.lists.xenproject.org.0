Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A9C08E8
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 17:50:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsS4-0006lr-Gi; Fri, 27 Sep 2019 15:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3ENn=XW=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iDsS3-0006lm-7t
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 15:46:35 +0000
X-Inumbo-ID: fbb55e90-e13d-11e9-967e-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id fbb55e90-e13d-11e9-967e-12813bfff9fa;
 Fri, 27 Sep 2019 15:46:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF3208980E5;
 Fri, 27 Sep 2019 15:46:33 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-116-169.ams2.redhat.com [10.36.116.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBB3D60BF3;
 Fri, 27 Sep 2019 15:46:29 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Fri, 27 Sep 2019 17:46:28 +0200
Message-Id: <20190927154628.8480-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Fri, 27 Sep 2019 15:46:34 +0000 (UTC)
Subject: [Xen-devel] [PATCH v1] xen/balloon: Set pages PageOffline() in
 balloon_add_region()
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
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, stable@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgYXJlIG1pc3NpbmcgYSBfX1NldFBhZ2VPZmZsaW5lKCksIHdoaWNoIGlzIHdoeSB3ZSBjYW4g
Z2V0CiFQYWdlT2ZmbGluZSgpIHBhZ2VzIG9udG8gdGhlIGJhbGxvb24gbGlzdCwgd2hlcmUKYWxs
b2NfeGVuYmFsbG9vbmVkX3BhZ2VzKCkgd2lsbCBjb21wbGFpbjoKCnBhZ2U6ZmZmZmVhMDAwM2U3
ZmZjMCByZWZjb3VudDoxIG1hcGNvdW50OjAgbWFwcGluZzowMDAwMDAwMDAwMDAwMDAwIGluZGV4
OjB4MApmbGFnczogMHhmZmZmZTAwMDAxMDAwKHJlc2VydmVkKQpyYXc6IDAwMGZmZmZlMDAwMDEw
MDAgZGVhZDAwMDAwMDAwMDEwMCBkZWFkMDAwMDAwMDAwMjAwIDAwMDAwMDAwMDAwMDAwMDAKcmF3
OiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDFmZmZmZmZmZiAwMDAw
MDAwMDAwMDAwMDAwCnBhZ2UgZHVtcGVkIGJlY2F1c2U6IFZNX0JVR19PTl9QQUdFKCFQYWdlT2Zm
bGluZShwYWdlKSkKLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tCmtlcm5lbCBC
VUcgYXQgaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmg6NzQ0IQppbnZhbGlkIG9wY29kZTogMDAw
MCBbIzFdIFNNUCBOT1BUSQoKUmVwb3J0ZWQtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KVGVzdGVkLWJ5OiBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CkZpeGVz
OiA3N2M0YWRmNmE2ZGYgKCJ4ZW4vYmFsbG9vbjogbWFyayBpbmZsYXRlZCBwYWdlcyBQR19vZmZs
aW5lIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2NS4xKwpDYzogQm9yaXMgT3N0cm92
c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xlLmNvbT4KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy94ZW4vYmFsbG9vbi5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9iYWxsb29uLmMgYi9kcml2ZXJzL3hlbi9i
YWxsb29uLmMKaW5kZXggMDViMWY3ZTk0OGVmLi4yOWY2MjU2MzYzZGIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMveGVuL2JhbGxvb24uYworKysgYi9kcml2ZXJzL3hlbi9iYWxsb29uLmMKQEAgLTY4Nyw2
ICs2ODcsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYmFsbG9vbl9hZGRfcmVnaW9uKHVuc2lnbmVk
IGxvbmcgc3RhcnRfcGZuLAogCQkvKiB0b3RhbHJhbV9wYWdlcyBhbmQgdG90YWxoaWdoX3BhZ2Vz
IGRvIG5vdAogCQkgICBpbmNsdWRlIHRoZSBib290LXRpbWUgYmFsbG9vbiBleHRlbnNpb24sIHNv
CiAJCSAgIGRvbid0IHN1YnRyYWN0IGZyb20gaXQuICovCisJCV9fU2V0UGFnZU9mZmxpbmUocGFn
ZSk7CiAJCV9fYmFsbG9vbl9hcHBlbmQocGFnZSk7CiAJfQogCi0tIAoyLjIxLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
