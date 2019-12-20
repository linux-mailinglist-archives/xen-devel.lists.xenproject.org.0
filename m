Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84488127BB5
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 14:32:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiILC-0005d4-TU; Fri, 20 Dec 2019 13:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiILB-0005cr-Fk
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 13:29:13 +0000
X-Inumbo-ID: b5dd5806-232c-11ea-9359-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5dd5806-232c-11ea-9359-12813bfff9fa;
 Fri, 20 Dec 2019 13:29:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3FF06AC37;
 Fri, 20 Dec 2019 13:29:12 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20efd995-9346-4b0c-f927-ad1152f6ccfe@suse.com>
Message-ID: <b916a5d3-2ce0-4232-fa42-33ea02bf655f@suse.com>
Date: Fri, 20 Dec 2019 14:29:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20efd995-9346-4b0c-f927-ad1152f6ccfe@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/6] x86/IRQ: simplify pending EOI stack logic
 for internally used IRQs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW4gNTY1NWNlOGIxZWMyICgieDg2L0lSUTogbWFrZSBpbnRlcm5hbGx5IHVzZWQgSVJRcyBhbHNv
IGhvbm9yIHRoZQpwZW5kaW5nIEVPSSBzdGFjayIpIGl0IHdhcyBtZW50aW9uZWQgdGhhdCBib3Ro
IHRoZSBjaGVja19lb2lfZGVmZXJyYWwKcGVyLUNQVSB2YXJpYWJsZSBhbmQgdGhlIGNwdV9oYXNf
cGVuZGluZ19hcGljX2VvaSgpIHdlcmUgYWRkZWQganVzdCB0bwpoYXZlIGFzIGxpdHRsZSBpbXBh
Y3Qgb24gZXhpc3RpbmcgYmVoYXZpb3IgYXMgcG9zc2libGUsIHRvIHJlZHVjZSB0aGUKcmlzayBv
ZiBhIGxhc3QgbWludXRlIHJlZ3Jlc3Npb24gaW4gNC4xMy4KClVwb24gY2xvc2VyIGluc3BlY3Rp
b24sIGRyb3BwaW5nIHRoZSB2YXJpYWJsZSBpcyBhbiBvcHRpb24gb25seSBpZiBhbGwKY2FsbGVy
cyBvZiAtPmVuZCgpIHdvdWxkIGFzc3VtZSB0aGUgcmVzcG9uc2liaWxpdHkgb2YgYWxzbyBjYWxs
aW5nCmZsdXNoX3JlYWR5X2VvaSgpLiBUaGVyZWZvcmUgb25seSBkcm9wIHRoZSBjcHVfaGFzX3Bl
bmRpbmdfYXBpY19lb2koKQpndWFyZCBub3cuCgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Ci0tLQpUQkQ6IEluIHRoZSBlbmQgSSdtIG5vdCBzdXJlIHRoaXMg
aXMgcmVhbGx5IHdvcnRoIGl0IHRoZW4uCgotLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKKysrIGIv
eGVuL2FyY2gveDg2L2lycS5jCkBAIC0xOTkxLDE4ICsxOTkxLDEzIEBAIHZvaWQgZG9fSVJRKHN0
cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQogICAgICAgICAgKiBJZiBoaWdoZXIgcHJpb3JpdHkg
dmVjdG9ycyBzdGlsbCBoYXZlIHRoZWlyIEVPSXMgcGVuZGluZywgd2UgbWF5CiAgICAgICAgICAq
IG5vdCBpc3N1ZSBhbiBFT0kgaGVyZSwgYXMgdGhpcyB3b3VsZCBFT0kgdGhlIGhpZ2hlc3QgcHJp
b3JpdHkgb25lLgogICAgICAgICAgKi8KLSAgICAgICAgaWYgKCBjcHVfaGFzX3BlbmRpbmdfYXBp
Y19lb2koKSApCi0gICAgICAgIHsKLSAgICAgICAgICAgIHRoaXNfY3B1KGNoZWNrX2VvaV9kZWZl
cnJhbCkgPSB0cnVlOwotICAgICAgICAgICAgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MsIHZlY3Rv
cik7Ci0gICAgICAgICAgICB0aGlzX2NwdShjaGVja19lb2lfZGVmZXJyYWwpID0gZmFsc2U7Ci0K
LSAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkZXNjLT5sb2NrKTsKLSAgICAgICAgICAgIGZsdXNo
X3JlYWR5X2VvaSgpOwotICAgICAgICAgICAgZ290byBvdXRfbm9fdW5sb2NrOwotICAgICAgICB9
Ci0KKyAgICAgICAgdGhpc19jcHUoY2hlY2tfZW9pX2RlZmVycmFsKSA9IHRydWU7CiAgICAgICAg
IGRlc2MtPmhhbmRsZXItPmVuZChkZXNjLCB2ZWN0b3IpOworICAgICAgICB0aGlzX2NwdShjaGVj
a19lb2lfZGVmZXJyYWwpID0gZmFsc2U7CisKKyAgICAgICAgc3Bpbl91bmxvY2soJmRlc2MtPmxv
Y2spOworICAgICAgICBmbHVzaF9yZWFkeV9lb2koKTsKKyAgICAgICAgZ290byBvdXRfbm9fdW5s
b2NrOwogICAgIH0KIAogIG91dF9ub19lbmQ6CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
