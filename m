Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D13613A4F1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 11:04:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irJ1Z-00019c-I3; Tue, 14 Jan 2020 10:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irJ1Y-00019X-Nj
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 10:02:12 +0000
X-Inumbo-ID: e9f3bf04-36b4-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9f3bf04-36b4-11ea-a985-bc764e2007e4;
 Tue, 14 Jan 2020 10:02:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 19FFAACD9;
 Tue, 14 Jan 2020 10:02:03 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb84362c-d175-7a71-89cc-17ce0c523b09@suse.com>
Date: Tue, 14 Jan 2020 11:02:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] IRQ: u16 is too narrow for an event channel
 number
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RklGTyBldmVudCBjaGFubmVscyBhbGxvdyBwb3J0cyB1cCB0byAyXjE3LCBzbyB3ZSBuZWVkIHRv
IHVzZSBhIHdpZGVyCmZpZWxkIGluIHN0cnVjdCBwaXJxLiBNb3ZlICJtYXNrZWQiIHN1Y2ggdGhh
dCBpdCBtYXkgc2hhcmUgdGhlIDgtYnl0ZQpzbG90IHdpdGggc3RydWN0IGFyY2hfcGlycSBvbiA2
NC1iaXQgYXJjaGVzLCByYXRoZXIgdGhhbiBsZWF2aW5nIGEKNy1ieXRlIGhvbGUgaW4gYWxsIGNh
c2VzLgoKVGFrZSB0aGUgb3Bwb3J0dW5pdHkgYW5kIGFsc28gYWRkIGEgY29tbWVudCByZWdhcmRp
bmcgImFyY2giIHBsYWNlbWVudAp3aXRoaW4gdGhlIHN0cnVjdHVyZS4KClNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3hlbi9pbmNsdWRlL3hlbi9p
cnEuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vaXJxLmgKQEAgLTEyNyw5ICsxMjcsMTAgQEAgc3Ry
dWN0IHZjcHU7CiAKIHN0cnVjdCBwaXJxIHsKICAgICBpbnQgcGlycTsKLSAgICB1MTYgZXZ0Y2hu
OwotICAgIGJvb2xfdCBtYXNrZWQ7CisgICAgZXZ0Y2huX3BvcnRfdCBldnRjaG47CiAgICAgc3Ry
dWN0IHJjdV9oZWFkIHJjdV9oZWFkOworICAgIGJvb2wgbWFza2VkOworICAgIC8qIEFyY2hpdGVj
dHVyZXMgbWF5IHJlcXVpcmUgdGhpcyBmaWVsZCB0byBiZSBsYXN0LiAqLwogICAgIHN0cnVjdCBh
cmNoX3BpcnEgYXJjaDsKIH07CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
