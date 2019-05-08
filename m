Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5F7179BD
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 14:49:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOLzk-0004PM-1G; Wed, 08 May 2019 12:48:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hOLzh-0004Of-M6
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 12:48:21 +0000
X-Inumbo-ID: 8e1353ba-718f-11e9-bfe3-233091e7213c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e1353ba-718f-11e9-bfe3-233091e7213c;
 Wed, 08 May 2019 12:48:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 08 May 2019 06:48:18 -0600
Message-Id: <5CD2D010020000780022CCCC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 08 May 2019 06:48:16 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
In-Reply-To: <5CD2CDEC020000780022CC95@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 4/4] x86/IRQ: ACKTYPE_NONE cannot make it into
 irq_guest_eoi_timer_fn()
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YWN0aW9uLT5hY2tfdHlwZSBpcyBzZXQgb25jZSBiZWZvcmUgdGhlIHRpbWVyIGV2ZW4gZ2V0cyBp
bml0aWFsaXplZCwgYW5kCmlzIG5ldmVyIGNoYW5nZWQgbGF0ZXIuIFRoZSB0aW1lciBnZXRzIGFj
dGl2YXRlZCBvbmx5IGZvciBFT0kgYW5kIFVOTUFTSwp0eXBlcy4gSGVuY2UgdGhlcmUncyBubyBu
ZWVkIHRvIGhhdmUgYSByZXNwZWN0aXZlIGlmKCkgaW4gdGhlcmUuIFJlcGxhY2UKaXQgYnkgYW4g
QVNTRVJUKCkuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
CgotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKKysrIGIveGVuL2FyY2gveDg2L2lycS5jCkBAIC0x
MTAzLDcgKzExMDMsNyBAQCBzdGF0aWMgdm9pZCBzZXRfZW9pX3JlYWR5KHZvaWQgKmRhdGEpOwog
c3RhdGljIHZvaWQgaXJxX2d1ZXN0X2VvaV90aW1lcl9mbih2b2lkICpkYXRhKQogewogICAgIHN0
cnVjdCBpcnFfZGVzYyAqZGVzYyA9IGRhdGE7Ci0gICAgdW5zaWduZWQgaW50IGlycSA9IGRlc2Mg
LSBpcnFfZGVzYzsKKyAgICB1bnNpZ25lZCBpbnQgaSwgaXJxID0gZGVzYyAtIGlycV9kZXNjOwog
ICAgIGlycV9ndWVzdF9hY3Rpb25fdCAqYWN0aW9uOwogICAgIGNwdW1hc2tfdCBjcHVfZW9pX21h
cDsKIApAQCAtMTExNCwxOSArMTExNCwxOCBAQCBzdGF0aWMgdm9pZCBpcnFfZ3Vlc3RfZW9pX3Rp
bWVyX2ZuKHZvaWQKIAogICAgIGFjdGlvbiA9IChpcnFfZ3Vlc3RfYWN0aW9uX3QgKilkZXNjLT5h
Y3Rpb247CiAKKyAgICBBU1NFUlQoYWN0aW9uLT5hY2tfdHlwZSAhPSBBQ0tUWVBFX05PTkUpOwor
CiAgICAgaWYgKCAhYWN0aW9uLT5pbl9mbGlnaHQgfHwgdGltZXJfaXNfYWN0aXZlKCZhY3Rpb24t
PmVvaV90aW1lcikgKQogICAgICAgICBnb3RvIG91dDsKIAotICAgIGlmICggYWN0aW9uLT5hY2tf
dHlwZSAhPSBBQ0tUWVBFX05PTkUgKQorICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9n
dWVzdHM7IGkrKyApCiAgICAgewotICAgICAgICB1bnNpZ25lZCBpbnQgaTsKLSAgICAgICAgZm9y
ICggaSA9IDA7IGkgPCBhY3Rpb24tPm5yX2d1ZXN0czsgaSsrICkKLSAgICAgICAgewotICAgICAg
ICAgICAgc3RydWN0IGRvbWFpbiAqZCA9IGFjdGlvbi0+Z3Vlc3RbaV07Ci0gICAgICAgICAgICB1
bnNpZ25lZCBpbnQgcGlycSA9IGRvbWFpbl9pcnFfdG9fcGlycShkLCBpcnEpOwotICAgICAgICAg
ICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9ib29sKHBpcnFfaW5mbyhkLCBwaXJxKS0+bWFza2VkKSAp
Ci0gICAgICAgICAgICAgICAgYWN0aW9uLT5pbl9mbGlnaHQtLTsKLSAgICAgICAgfQorICAgICAg
ICBzdHJ1Y3QgZG9tYWluICpkID0gYWN0aW9uLT5ndWVzdFtpXTsKKyAgICAgICAgdW5zaWduZWQg
aW50IHBpcnEgPSBkb21haW5faXJxX3RvX3BpcnEoZCwgaXJxKTsKKworICAgICAgICBpZiAoIHRl
c3RfYW5kX2NsZWFyX2Jvb2wocGlycV9pbmZvKGQsIHBpcnEpLT5tYXNrZWQpICkKKyAgICAgICAg
ICAgIGFjdGlvbi0+aW5fZmxpZ2h0LS07CiAgICAgfQogCiAgICAgaWYgKCBhY3Rpb24tPmluX2Zs
aWdodCApCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
