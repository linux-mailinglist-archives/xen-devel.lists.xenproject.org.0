Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B871154E4
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 17:13:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idGBb-0001gP-TT; Fri, 06 Dec 2019 16:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=z/5o=Z4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1idGBa-0001gJ-3g
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 16:10:30 +0000
X-Inumbo-ID: ebb59c76-1842-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb59c76-1842-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 16:10:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B5C5AAFBE;
 Fri,  6 Dec 2019 16:10:28 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6782ed06-4cfa-279f-2f54-be49f1bc1203@suse.com>
Date: Fri, 6 Dec 2019 17:10:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86/i8259A: don't open-code LEGACY_VECTOR()
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

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2FyY2gveDg2L2k4MjU5LmMKKysrIGIveGVuL2FyY2gveDg2L2k4MjU5LmMKQEAgLTM0Nyw5ICsz
NDcsOSBAQCB2b2lkIF9faW5pdCBpbml0X0lSUSh2b2lkKQogICAgICAgICBpZiAoIGlycSA9PSAy
ICkgLyogSVJRMiBkb2Vzbid0IGV4aXN0ICovCiAgICAgICAgICAgICBjb250aW51ZTsKICAgICAg
ICAgZGVzYy0+aGFuZGxlciA9ICZpODI1OUFfaXJxX3R5cGU7Ci0gICAgICAgIHBlcl9jcHUodmVj
dG9yX2lycSwgY3B1KVtGSVJTVF9MRUdBQ1lfVkVDVE9SICsgaXJxXSA9IGlycTsKKyAgICAgICAg
cGVyX2NwdSh2ZWN0b3JfaXJxLCBjcHUpW0xFR0FDWV9WRUNUT1IoaXJxKV0gPSBpcnE7CiAgICAg
ICAgIGNwdW1hc2tfY29weShkZXNjLT5hcmNoLmNwdV9tYXNrLCBjcHVtYXNrX29mKGNwdSkpOwot
ICAgICAgICBkZXNjLT5hcmNoLnZlY3RvciA9IEZJUlNUX0xFR0FDWV9WRUNUT1IgKyBpcnE7Cisg
ICAgICAgIGRlc2MtPmFyY2gudmVjdG9yID0gTEVHQUNZX1ZFQ1RPUihpcnEpOwogICAgIH0KICAg
ICAKICAgICBwZXJfY3B1KHZlY3Rvcl9pcnEsIGNwdSlbSVJRMF9WRUNUT1JdID0gMDsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
