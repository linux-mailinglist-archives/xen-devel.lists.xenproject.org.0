Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6E15318D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 14:17:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izKWR-00058y-30; Wed, 05 Feb 2020 13:15:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rprq=3Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izKWP-00058l-9n
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 13:15:13 +0000
X-Inumbo-ID: 8a6bc236-4819-11ea-8396-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a6bc236-4819-11ea-8396-bc764e2007e4;
 Wed, 05 Feb 2020 13:15:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D4823AC69;
 Wed,  5 Feb 2020 13:15:11 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Message-ID: <043fa4ef-b46d-6ddf-8348-33b3bce69b3f@suse.com>
Date: Wed, 5 Feb 2020 14:15:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 3/6] xmalloc: guard against integer overflow
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
 Ilja Van Sprundel <ivansprundel@ioactive.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcmUgYXJlIGh5cGVyY2FsbCBoYW5kbGluZyBwYXRocyAoRUZJIG9uZXMgYXJlIHdoYXQgdGhp
cyB3YXMgZm91bmQKd2l0aCkgbmVlZGluZyB0byBhbGxvY2F0ZSBidWZmZXJzIG9mIGEgY2FsbGVy
IHNwZWNpZmllZCBzaXplLiBUaGlzIGlzCmdlbmVyYWxseSBmaW5lLCBhcyBvdXIgcGFnZSBhbGxv
Y2F0b3IgZW5mb3JjZXMgYW4gdXBwZXIgYm91bmQgb24gYWxsCmFsbG9jYXRpb25zLiBIb3dldmVy
LCBjZXJ0YWluIGV4dHJlbWVseSBsYXJnZSBzaXplcyBjb3VsZCwgd2hlbiBhZGRpbmcKaW4gYWxs
b2NhdG9yIG92ZXJoZWFkLCByZXN1bHQgaW4gYW4gYXBwYXJlbnRseSB0aW55IGFsbG9jYXRpb24g
c2l6ZSwKd2hpY2ggd291bGQgdHlwaWNhbGx5IHJlc3VsdCBpbiBlaXRoZXIgYSBzdWNjZXNzZnVs
IGFsbG9jYXRpb24sIGJ1dCBhCnNldmVyZSBidWZmZXIgb3ZlcnJ1biB3aGVuIHVzaW5nIHRoYXQg
bWVtb3J5IGJsb2NrLCBvciBpbiBhIGNyYXNoIHJpZ2h0CmluIHRoZSBhbGxvY2F0b3IgY29kZS4K
ClJlcG9ydGVkLWJ5OiBJbGphIFZhbiBTcHJ1bmRlbCA8aXZhbnNwcnVuZGVsQGlvYWN0aXZlLmNv
bT4KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpSZXZpZXdl
ZC1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPgoKLS0tIGEveGVu
L2NvbW1vbi94bWFsbG9jX3Rsc2YuYworKysgYi94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jCkBA
IC0zNzgsNyArMzc4LDE3IEBAIHZvaWQgKnhtZW1fcG9vbF9hbGxvYyh1bnNpZ25lZCBsb25nIHNp
emUKICAgICBpbnQgZmwsIHNsOwogICAgIHVuc2lnbmVkIGxvbmcgdG1wX3NpemU7CiAKLSAgICBz
aXplID0gKHNpemUgPCBNSU5fQkxPQ0tfU0laRSkgPyBNSU5fQkxPQ0tfU0laRSA6IFJPVU5EVVBf
U0laRShzaXplKTsKKyAgICBpZiAoIHNpemUgPCBNSU5fQkxPQ0tfU0laRSApCisgICAgICAgIHNp
emUgPSBNSU5fQkxPQ0tfU0laRTsKKyAgICBlbHNlCisgICAgeworICAgICAgICB0bXBfc2l6ZSA9
IFJPVU5EVVBfU0laRShzaXplKTsKKyAgICAgICAgLyogR3VhcmQgYWdhaW5zdCBvdmVyZmxvdy4g
Ki8KKyAgICAgICAgaWYgKCB0bXBfc2l6ZSA8IHNpemUgKQorICAgICAgICAgICAgcmV0dXJuIE5V
TEw7CisgICAgICAgIHNpemUgPSB0bXBfc2l6ZTsKKyAgICB9CisKICAgICAvKiBSb3VuZGluZyB1
cCB0aGUgcmVxdWVzdGVkIHNpemUgYW5kIGNhbGN1bGF0aW5nIGZsIGFuZCBzbCAqLwogCiAgICAg
c3Bpbl9sb2NrKCZwb29sLT5sb2NrKTsKQEAgLTU5NCw2ICs2MDQsMTAgQEAgdm9pZCAqX3htYWxs
b2ModW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZwogICAgICAgICBhbGlnbiA9IE1FTV9BTElHTjsK
ICAgICBzaXplICs9IGFsaWduIC0gTUVNX0FMSUdOOwogCisgICAgLyogR3VhcmQgYWdhaW5zdCBv
dmVyZmxvdy4gKi8KKyAgICBpZiAoIHNpemUgPCBhbGlnbiAtIE1FTV9BTElHTiApCisgICAgICAg
IHJldHVybiBOVUxMOworCiAgICAgaWYgKCAheGVucG9vbCApCiAgICAgICAgIHRsc2ZfaW5pdCgp
OwogCkBAIC02NDYsNiArNjYwLDEwIEBAIHZvaWQgKl94cmVhbGxvYyh2b2lkICpwdHIsIHVuc2ln
bmVkIGxvbmcKICAgICAgICAgdW5zaWduZWQgbG9uZyB0bXBfc2l6ZSA9IHNpemUgKyBhbGlnbiAt
IE1FTV9BTElHTjsKICAgICAgICAgY29uc3Qgc3RydWN0IGJoZHIgKmI7CiAKKyAgICAgICAgLyog
R3VhcmQgYWdhaW5zdCBvdmVyZmxvdy4gKi8KKyAgICAgICAgaWYgKCB0bXBfc2l6ZSA8IHNpemUg
KQorICAgICAgICAgICAgcmV0dXJuIE5VTEw7CisKICAgICAgICAgaWYgKCB0bXBfc2l6ZSA8IFBB
R0VfU0laRSApCiAgICAgICAgICAgICB0bXBfc2l6ZSA9ICh0bXBfc2l6ZSA8IE1JTl9CTE9DS19T
SVpFKSA/IE1JTl9CTE9DS19TSVpFIDoKICAgICAgICAgICAgICAgICBST1VORFVQX1NJWkUodG1w
X3NpemUpOwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
