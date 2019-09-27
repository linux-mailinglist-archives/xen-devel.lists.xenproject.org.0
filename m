Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA18BFED7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 08:08:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDjN9-0005wZ-To; Fri, 27 Sep 2019 06:04:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDjN8-0005wU-Ai
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 06:04:54 +0000
X-Inumbo-ID: b8e6cc3a-e0ec-11e9-966b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b8e6cc3a-e0ec-11e9-966b-12813bfff9fa;
 Fri, 27 Sep 2019 06:04:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 65EFFAF13;
 Fri, 27 Sep 2019 06:04:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 08:04:48 +0200
Message-Id: <20190927060448.7056-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH] xen/debugtrace: fix buffer allocation
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDYzMzhjOWVhZDlmZjllZjYgKCJkZWJ1Z3RyYWNlOiBhZGQgcGVyLWNwdSBidWZmZXIg
b3B0aW9uIikgaGFkCmEgcmViYXNlIGVycm9yIHdoZW4gdXNpbmcgcGVyLWNwdSBidWZmZXJzOiB0
aGUgZ2xvYmFsIGJ1ZmZlciBhZGRyZXNzCndvdWxkIGFsd2F5cyBiZSBzZXQgdG8gdGhlIG9uZSBv
ZiB0aGUgbGFzdCBwZXItY3B1IGJ1ZmZlciBhbGxvY2F0ZWQuCgpUaGUgcmVzdWx0IHdvdWxkIGJl
IHRoYXQgd2hlbiBkdW1waW5nIHRoZSBidWZmZXJzIHRoZSBsYXN0IGNwdSdzIGJ1ZmZlcgppcyBh
bHdheXMgc2hvd24gYXMgZW1wdHkgYXMgdGhvc2UgZW50cmllcyBhcmUgcHJpbnRlZCBpbiB0aGUg
Z2xvYmFsCmJ1ZmZlcidzIGR1bXAgYWxyZWFkeS4KCkZpeCB0aGF0LgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vZGVidWd0cmFj
ZS5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hl
bi9jb21tb24vZGVidWd0cmFjZS5jIGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKaW5kZXggNzMx
M2U4OTM4OS4uYTc4OGU1NWI0YyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMK
KysrIGIveGVuL2NvbW1vbi9kZWJ1Z3RyYWNlLmMKQEAgLTI1OSw3ICsyNTksNiBAQCBzdGF0aWMg
dm9pZCBkZWJ1Z3RyYWNlX2FsbG9jX2J1ZmZlcihzdHJ1Y3QgZGVidWd0cmFjZV9kYXRhICoqcHRy
LAogCiAgICAgbWVtc2V0KGRhdGEsICdcMCcsIGRlYnVndHJhY2VfYnl0ZXMgKyBzaXplb2YoKmRh
dGEpKTsKIAotICAgIGR0X2RhdGEgPSBkYXRhOwogICAgICpwdHIgPSBkYXRhOwogfQogCi0tIAoy
LjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
