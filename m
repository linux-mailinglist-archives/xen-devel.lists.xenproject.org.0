Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1B11E3FD
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 13:56:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifkSm-0002VF-J4; Fri, 13 Dec 2019 12:54:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifkSk-0002V7-ET
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 12:54:30 +0000
X-Inumbo-ID: b21d198e-1da7-11ea-8ef7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b21d198e-1da7-11ea-8ef7-12813bfff9fa;
 Fri, 13 Dec 2019 12:54:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16E70B03C;
 Fri, 13 Dec 2019 12:54:27 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a1b23ffd-6af4-a3c1-b4ac-ba7bd3ec1d70@suse.com>
Date: Fri, 13 Dec 2019 13:54:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86emul: correct far branch handling for 64-bit
 mode
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

QU1EIGFuZCBmcmllbmRzIGV4cGxpY2l0bHkgc3BlY2lmeSB0aGF0IDY0LWJpdCBvcGVyYW5kcyBh
cmVuJ3QgcG9zc2libGUKZm9yIHRoZXNlIGluc25zLiBOZXZlcnRoZWxlc3MgUkVYLlcgaXNuJ3Qg
ZnVsbHkgaWdub3JlZDogSXQgc3RpbGwKY2FuY2VscyBhIHBvc3NpYmxlIG9wZXJhbmQgc2l6ZSBv
dmVycmlkZSAoMHg2NikuIEludGVsIG90b2ggZXhwbGljaXRseQpwcm92aWRlcyBmb3IgNjQtYml0
IG9wZXJhbmRzIG9uIHRoZSByZXNwZWN0aXZlIGluc24gcGFnZSBvZiB0aGUgU0RNLgoKU2lnbmVk
LW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVuL2FyY2gv
eDg2L3g4Nl9lbXVsYXRlL3g4Nl9lbXVsYXRlLmMKKysrIGIveGVuL2FyY2gveDg2L3g4Nl9lbXVs
YXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTI1MTksOSArMjUxOSwxNiBAQCB4ODZfZGVjb2RlX29uZWJ5
dGUoCiAgICAgICAgIGNhc2UgNjogLyogcHVzaCAqLwogICAgICAgICAgICAgaWYgKCBtb2RlXzY0
Yml0KCkgJiYgb3BfYnl0ZXMgPT0gNCApCiAgICAgICAgICAgICAgICAgb3BfYnl0ZXMgPSA4Owot
ICAgICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCisgICAgICAgICAgICBzdGF0ZS0+ZGVzYyA9
IERzdE5vbmUgfCBTcmNNZW0gfCBNb3Y7CisgICAgICAgICAgICBicmVhazsKKwogICAgICAgICBj
YXNlIDM6IC8qIGNhbGwgKGZhciwgYWJzb2x1dGUgaW5kaXJlY3QpICovCiAgICAgICAgIGNhc2Ug
NTogLyogam1wIChmYXIsIGFic29sdXRlIGluZGlyZWN0KSAqLworICAgICAgICAgICAgLyogUkVY
LlcgaWdub3JlZCBvbiBhIHZlbmRvci1kZXBlbmRlbnQgYmFzaXMuICovCisgICAgICAgICAgICBp
ZiAoIG9wX2J5dGVzID09IDggJiYKKyAgICAgICAgICAgICAgICAgKGN0eHQtPmNwdWlkLT54ODZf
dmVuZG9yICYKKyAgICAgICAgICAgICAgICAgIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1Jf
SFlHT04pKSApCisgICAgICAgICAgICAgICAgb3BfYnl0ZXMgPSA0OwogICAgICAgICAgICAgc3Rh
dGUtPmRlc2MgPSBEc3ROb25lIHwgU3JjTWVtIHwgTW92OwogICAgICAgICAgICAgYnJlYWs7CiAg
ICAgICAgIH0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
