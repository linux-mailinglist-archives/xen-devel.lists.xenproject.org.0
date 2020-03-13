Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 124A9184190
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 08:37:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCer0-0007MM-I7; Fri, 13 Mar 2020 07:35:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCeqz-0007MF-Aa
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 07:35:33 +0000
X-Inumbo-ID: 382bf90e-64fd-11ea-b299-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 382bf90e-64fd-11ea-b299-12813bfff9fa;
 Fri, 13 Mar 2020 07:35:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BF64FAC24;
 Fri, 13 Mar 2020 07:35:31 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Message-ID: <36b5d9a8-1f27-fc11-7d3a-a63e80c7329b@suse.com>
Date: Fri, 13 Mar 2020 08:35:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c50fc4e8-cb96-74a1-de2b-9e83e609db1c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 2/2] libfdt: fix undefined behaviour in
 _fdt_splice()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxvbmcgdGhlIGxpbmVzIG9mIGNvbW1pdCBkMGIzYWIwYTBmNDYgKCJsaWJmZHQ6IEZpeCB1bmRl
ZmluZWQgYmVoYXZpb3VyCmluIGZkdF9vZmZzZXRfcHRyKCkiKSwgX2ZkdF9zcGxpY2UoKSBzaW1p
bGFybHkgbWF5IG5vdCB1c2UgcG9pbnRlcgphcml0aG1ldGljIHRvIGRvIG92ZXJmbG93IGNoZWNr
cy4KClt1cHN0cmVhbSBjb21taXQgNzNkNmU5ZWNiNDE3OWI1MTA0MDhiYzUyNjI0MGY4MjkyNjJk
ZjM2MV0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0t
IGEveGVuL2NvbW1vbi9saWJmZHQvZmR0X3J3LmMKKysrIGIveGVuL2NvbW1vbi9saWJmZHQvZmR0
X3J3LmMKQEAgLTg3LDcgKzg3LDcgQEAgc3RhdGljIGludCBfZmR0X3J3X2NoZWNrX2hlYWRlcih2
b2lkICpmZAogCQkJcmV0dXJuIGVycjsgXAogCX0KIAotc3RhdGljIGlubGluZSBpbnQgX2ZkdF9k
YXRhX3NpemUodm9pZCAqZmR0KQorc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgX2ZkdF9kYXRh
X3NpemUodm9pZCAqZmR0KQogewogCXJldHVybiBmZHRfb2ZmX2R0X3N0cmluZ3MoZmR0KSArIGZk
dF9zaXplX2R0X3N0cmluZ3MoZmR0KTsKIH0KQEAgLTk1LDEzICs5NSwxNCBAQCBzdGF0aWMgaW5s
aW5lIGludCBfZmR0X2RhdGFfc2l6ZSh2b2lkICpmCiBzdGF0aWMgaW50IF9mZHRfc3BsaWNlKHZv
aWQgKmZkdCwgdm9pZCAqc3BsaWNlcG9pbnQsIGludCBvbGRsZW4sIGludCBuZXdsZW4pCiB7CiAJ
Y2hhciAqcCA9IHNwbGljZXBvaW50OwotCWNoYXIgKmVuZCA9IChjaGFyICopZmR0ICsgX2ZkdF9k
YXRhX3NpemUoZmR0KTsKKwl1bnNpZ25lZCBpbnQgZHNpemUgPSBfZmR0X2RhdGFfc2l6ZShmZHQp
OworCXNpemVfdCBzb2ZmID0gcCAtIChjaGFyICopZmR0OwogCi0JaWYgKCgocCArIG9sZGxlbikg
PCBwKSB8fCAoKHAgKyBvbGRsZW4pID4gZW5kKSkKKwlpZiAob2xkbGVuIDwgMCB8fCBzb2ZmICsg
b2xkbGVuIDwgc29mZiB8fCBzb2ZmICsgb2xkbGVuID4gZHNpemUpCiAJCXJldHVybiAtRkRUX0VS
Ul9CQURPRkZTRVQ7Ci0JaWYgKChlbmQgLSBvbGRsZW4gKyBuZXdsZW4pID4gKChjaGFyICopZmR0
ICsgZmR0X3RvdGFsc2l6ZShmZHQpKSkKKwlpZiAoZHNpemUgLSBvbGRsZW4gKyBuZXdsZW4gPiBm
ZHRfdG90YWxzaXplKGZkdCkpCiAJCXJldHVybiAtRkRUX0VSUl9OT1NQQUNFOwotCW1lbW1vdmUo
cCArIG5ld2xlbiwgcCArIG9sZGxlbiwgZW5kIC0gcCAtIG9sZGxlbik7CisJbWVtbW92ZShwICsg
bmV3bGVuLCBwICsgb2xkbGVuLCAoKGNoYXIgKilmZHQgKyBkc2l6ZSkgLSAocCArIG9sZGxlbikp
OwogCXJldHVybiAwOwogfQogCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
