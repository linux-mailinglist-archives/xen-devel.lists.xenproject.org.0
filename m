Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2065B714F5
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 11:23:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpqyl-0003qn-MA; Tue, 23 Jul 2019 09:21:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bPW/=VU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hpqyk-0003qd-Hi
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 09:21:02 +0000
X-Inumbo-ID: 2f65354c-ad2b-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2f65354c-ad2b-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 09:21:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 2DD49AF79;
 Tue, 23 Jul 2019 09:20:59 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 23 Jul 2019 11:20:55 +0200
Message-Id: <20190723092056.15045-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190723092056.15045-1-jgross@suse.com>
References: <20190723092056.15045-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 1/2] xen/sched: fix locking in
 restore_vcpu_affinity()
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDA3NjNjZDI2ODc4OTdiNTVlNyAoInhlbi9zY2hlZDogZG9uJ3QgZGlzYWJsZSBzY2hl
ZHVsZXIgb24gY3B1cwpkdXJpbmcgc3VzcGVuZCIpIHJlbW92ZWQgYSBsb2NrIGluIHJlc3RvcmVf
dmNwdV9hZmZpbml0eSgpIHdoaWNoIG5lZWRzCnRvIHN0YXk6IGNwdW1hc2tfc2NyYXRjaF9jcHUo
KSBtdXN0IGJlIHByb3RlY3RlZCBieSB0aGUgc2NoZWR1bGVyCmxvY2suIHJlc3RvcmVfdmNwdV9h
ZmZpbml0eSgpIGlzIGJlaW5nIGNhbGxlZCBieSB0aGF3X2RvbWFpbnMoKSwgc28Kd2l0aCBtdWx0
aXBsZSBkb21haW5zIGluIHRoZSBzeXN0ZW0gYW5vdGhlciBkb21haW4gbWlnaHQgYWxyZWFkeSBi
ZQpydW5uaW5nIGFuZCB0aGUgc2NoZWR1bGVyIG1pZ2h0IG1ha2UgdXNlIG9mIGNwdW1hc2tfc2Ny
YXRjaF9jcHUoKQphbHJlYWR5LgoKU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3Nz
QHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyB8IDUgKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxl
LmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKaW5kZXggMjVmNmFiMzg4ZC4uODliYzI1OWFlNCAx
MDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1
bGUuYwpAQCAtNzA4LDYgKzcwOCw4IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVj
dCBkb21haW4gKmQpCiAgICAgICAgICAqIHNldCB2LT5wcm9jZXNzb3Igb2YgZWFjaCBvZiB0aGVp
ciB2Q1BVcyB0byBzb21ldGhpbmcgdGhhdCB3aWxsCiAgICAgICAgICAqIG1ha2Ugc2Vuc2UgZm9y
IHRoZSBzY2hlZHVsZXIgb2YgdGhlIGNwdXBvb2wgaW4gd2hpY2ggdGhleSBhcmUgaW4uCiAgICAg
ICAgICAqLworICAgICAgICBsb2NrID0gdmNwdV9zY2hlZHVsZV9sb2NrX2lycSh2KTsKKwogICAg
ICAgICBjcHVtYXNrX2FuZChjcHVtYXNrX3NjcmF0Y2hfY3B1KGNwdSksIHYtPmNwdV9oYXJkX2Fm
ZmluaXR5LAogICAgICAgICAgICAgICAgICAgICBjcHVwb29sX2RvbWFpbl9jcHVtYXNrKGQpKTsK
ICAgICAgICAgaWYgKCBjcHVtYXNrX2VtcHR5KGNwdW1hc2tfc2NyYXRjaF9jcHUoY3B1KSkgKQpA
QCAtNzMxLDYgKzczMyw5IEBAIHZvaWQgcmVzdG9yZV92Y3B1X2FmZmluaXR5KHN0cnVjdCBkb21h
aW4gKmQpCiAKICAgICAgICAgdi0+cHJvY2Vzc29yID0gY3B1bWFza19hbnkoY3B1bWFza19zY3Jh
dGNoX2NwdShjcHUpKTsKIAorICAgICAgICBzcGluX3VubG9ja19pcnEobG9jayk7CisKKwkvKiB2
LT5wcm9jZXNzb3IgbWlnaHQgaGF2ZSBjaGFuZ2VkLCBzbyByZWFjcXVpcmUgdGhlIGxvY2suICov
CiAgICAgICAgIGxvY2sgPSB2Y3B1X3NjaGVkdWxlX2xvY2tfaXJxKHYpOwogICAgICAgICB2LT5w
cm9jZXNzb3IgPSBzY2hlZF9waWNrX2NwdSh2Y3B1X3NjaGVkdWxlcih2KSwgdik7CiAgICAgICAg
IHNwaW5fdW5sb2NrX2lycShsb2NrKTsKLS0gCjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
