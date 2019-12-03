Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74F10FB1D
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 10:50:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic4mX-0000Oc-LE; Tue, 03 Dec 2019 09:47:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic4mW-0000OX-N0
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 09:47:44 +0000
X-Inumbo-ID: f41141c4-15b1-11ea-81d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f41141c4-15b1-11ea-81d8-12813bfff9fa;
 Tue, 03 Dec 2019 09:47:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F041EAF47;
 Tue,  3 Dec 2019 09:47:42 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191202114117.1264-1-pdurrant@amazon.com>
 <20191202114117.1264-2-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c784e57a-46ea-a839-8c0c-5a299aa5a64f@suse.com>
Date: Tue, 3 Dec 2019 10:47:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191202114117.1264-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/xenbus: reference count
 registered modules
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
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTIuMjAxOSAxMjo0MSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRvIHByZXZlbnQgYSBQ
ViBkcml2ZXIgbW9kdWxlIGJlaW5nIHJlbW92ZWQgd2hpbHN0IGF0dGFjaGVkIHRvIGl0cyBvdGhl
cgo+IGVuZCwgYW5kIGhlbmNlIHhlbmJ1cyBjYWxsaW5nIGludG8gcG90ZW50aWFsbHkgaW52YWxp
ZCB0ZXh0LCB0YWtlIGEKPiByZWZlcmVuY2Ugb24gdGhlIG1vZHVsZSBiZWZvcmUgY2FsbGluZyB0
aGUgcHJvYmUoKSBtZXRob2QgKGRyb3BwaW5nIGl0IGlmCj4gdW5zdWNjZXNzZnVsKSBhbmQgZHJv
cCB0aGUgcmVmZXJlbmNlIGFmdGVyIHJldHVybmluZyBmcm9tIHRoZSByZW1vdmUoKQo+IG1ldGhv
ZC4KPiAKPiBTdWdnZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpSZXZpZXdl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgp3aXRoIC4uLgoKPiAtLS0gYS9k
cml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlLmMKPiArKysgYi9kcml2ZXJzL3hlbi94ZW5i
dXMveGVuYnVzX3Byb2JlLmMKPiBAQCAtMjMyLDkgKzIzMiwxNiBAQCBpbnQgeGVuYnVzX2Rldl9w
cm9iZShzdHJ1Y3QgZGV2aWNlICpfZGV2KQo+ICAJCXJldHVybiBlcnI7Cj4gIAl9Cj4gIAo+ICsJ
aWYgKCF0cnlfbW9kdWxlX2dldChkcnYtPmRyaXZlci5vd25lcikpIHsKPiArCQlkZXZfd2Fybigm
ZGV2LT5kZXYsICJmYWlsZWQgdG8gYWNxdWlyZSBtb2R1bGUgcmVmZXJlbmNlIG9uICclcycuXG4i
LAo+ICsJCQkgZHJ2LT5kcml2ZXIubmFtZSk7CgouLi4gcGVyaGFwcyB0aGUgZnVsbCBzdG9wIGRy
b3BwZWQgaGVyZSBhbmQgLi4uCgo+ICsJCWVyciA9IC1FU1JDSDsKPiArCQlnb3RvIGZhaWw7Cj4g
KyAgICAgICAgfQoKLi4uIChkZWZpbml0ZWx5KSBpbmRlbnRhdGlvbiBoZXJlIGNoYW5nZWQgdG8g
dXNlIGEgdGFiLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
