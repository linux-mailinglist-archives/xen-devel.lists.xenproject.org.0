Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E202311A722
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 10:30:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieyHp-0005XT-QU; Wed, 11 Dec 2019 09:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bHGM=2B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieyHo-0005XJ-5B
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 09:28:00 +0000
X-Inumbo-ID: 842080ef-1bf8-11ea-8ade-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 842080ef-1bf8-11ea-8ade-12813bfff9fa;
 Wed, 11 Dec 2019 09:27:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70660AD10;
 Wed, 11 Dec 2019 09:27:58 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cd54bc0e-9e7b-42bb-ea60-8d4578a59cac@suse.com>
Date: Wed, 11 Dec 2019 10:28:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] x86emul: correct LFS et al handling for 64-bit
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
YXRlL3g4Nl9lbXVsYXRlLmMKQEAgLTI2NDAsNiArMjY0MCwxNSBAQCB4ODZfZGVjb2RlX3R3b2J5
dGUoCiAgICAgICAgIH0KICAgICAgICAgYnJlYWs7CiAKKyAgICBjYXNlIDB4YjI6IC8qIGxzcyAq
LworICAgIGNhc2UgMHhiNDogLyogbGZzICovCisgICAgY2FzZSAweGI1OiAvKiBsZ3MgKi8KKyAg
ICAgICAgLyogUkVYLlcgaWdub3JlZCBvbiBhIHZlbmRvci1kZXBlbmRlbnQgYmFzaXMuICovCisg
ICAgICAgIGlmICggb3BfYnl0ZXMgPT0gOCAmJgorICAgICAgICAgICAgIChjdHh0LT5jcHVpZC0+
eDg2X3ZlbmRvciAmIChYODZfVkVORE9SX0FNRCB8IFg4Nl9WRU5ET1JfSFlHT04pKSApCisgICAg
ICAgICAgICBvcF9ieXRlcyA9IDQ7CisgICAgICAgIGJyZWFrOworCiAgICAgY2FzZSAweGI4OiAv
KiBqbXBlIC8gcG9wY250ICovCiAgICAgICAgIGlmICggcmVwX3ByZWZpeCgpICkKICAgICAgICAg
ICAgIGN0eHQtPm9wY29kZSB8PSBNQVNLX0lOU1IodmV4LnBmeCwgWDg2RU1VTF9PUENfUEZYX01B
U0spOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
