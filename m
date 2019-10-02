Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22C7C4B27
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:12:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFba7-0002iM-K0; Wed, 02 Oct 2019 10:10:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFba6-0002br-7e
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:10:02 +0000
X-Inumbo-ID: cb00a03b-e4fc-11e9-9712-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id cb00a03b-e4fc-11e9-9712-12813bfff9fa;
 Wed, 02 Oct 2019 10:10:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BF23AE09;
 Wed,  2 Oct 2019 10:09:59 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <87c597a3-d7f0-bd20-4c43-afd5ec919be3@suse.com>
Date: Wed, 2 Oct 2019 12:10:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] IOMMU: add missing HVM check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Rml4IGFuIHVuZ3VhcmRlZCBkLT5hcmNoLmh2bSBhY2Nlc3MgaW4gYXNzaWduX2RldmljZSgpLgoK
U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KU3BsaXQg
ZnJvbSBub3cgd2l0aGRyYXduICJ4ODYvSFZNOiBwMm1fcmFtX3JvIGlzIGluY29tcGF0aWJsZSB3
aXRoCmRldmljZSBwYXNzLXRocm91Z2giLgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
cGNpLmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTE0ODgsNyArMTQ4
OCw4IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICoKIAogICAgIC8q
IFByZXZlbnQgZGV2aWNlIGFzc2lnbiBpZiBtZW0gcGFnaW5nIG9yIG1lbSBzaGFyaW5nIGhhdmUg
YmVlbiAKICAgICAgKiBlbmFibGVkIGZvciB0aGlzIGRvbWFpbiAqLwotICAgIGlmICggdW5saWtl
bHkoZC0+YXJjaC5odm0ubWVtX3NoYXJpbmdfZW5hYmxlZCB8fAorICAgIGlmICggdW5saWtlbHko
KGlzX2h2bV9kb21haW4oZCkgJiYKKyAgICAgICAgICAgICAgICAgICBkLT5hcmNoLmh2bS5tZW1f
c2hhcmluZ19lbmFibGVkKSB8fAogICAgICAgICAgICAgICAgICAgdm1fZXZlbnRfY2hlY2tfcmlu
ZyhkLT52bV9ldmVudF9wYWdpbmcpIHx8CiAgICAgICAgICAgICAgICAgICBwMm1fZ2V0X2hvc3Rw
Mm0oZCktPmdsb2JhbF9sb2dkaXJ0eSkgKQogICAgICAgICByZXR1cm4gLUVYREVWOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
