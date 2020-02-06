Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51CE9154479
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:04:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izgn5-0000t8-Qo; Thu, 06 Feb 2020 13:01:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izgn4-0000sx-Bh
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:01:54 +0000
X-Inumbo-ID: d8b5b51a-48e0-11ea-8952-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8b5b51a-48e0-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 13:01:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E4585B188;
 Thu,  6 Feb 2020 13:01:52 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <20200206103833.15355-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <97b012d1-0bea-cc8c-f93e-493a06725d42@suse.com>
Date: Thu, 6 Feb 2020 14:01:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200206103833.15355-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/mm: Avoid assuming the page is inuse
 in assign_pages()
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
Cc: xen-devel@lists.xenproject.org, pdurrant@amazon.com,
 Julien Grall <jgrall@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDIuMjAyMCAxMTozOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhvd2V2ZXIsIHRoZSBj
b2RlIG1heSByYWNlIHdpdGggdGhlIHBhZ2Ugb2ZmbGluaW5nIGNvZGUgKHNlZQo+IG9mZmxpbmVf
cGFnZSgpKS4gRGVwZW5kaW5nIG9uIHRoZSBvcmRlcmluZywgdGhlIHBhZ2UgbWF5IGJlIGluIG9m
ZmxpbmluZwo+IHN0YXRlIChQR0Nfc3RhdGVfb2ZmbGluaW5nKSBiZWZvcmUgaXQgaXMgYXNzaWdu
ZWQgdG8gYSBkb21haW4uCj4gCj4gT24gZGVidWcgYnVpbGQsIHRoaXMgbWF5IHJlc3VsdCB0byBo
aXQgdGhlIGFzc2VydCBvciBqdXN0IGNsb2JiZXIgdGhlCj4gc3RhdGUuIE9uIG5vbi1kZWJ1ZyBi
dWlsZCwgdGhlIHN0YXRlIHdpbGwgZ2V0IGNsb2JiZXJlZC4KPiAKPiBJbmNpZGVudGFsbHkgdGhl
IGZsYWcgUEdDX2Jyb2tlbiB3aWxsIGdldCBjbG9iYmVyZWQgYXMgd2VsbC4KCkFzIG1lbnRpb25l
ZCB3aGVuIEkgZmlyc3QgcG9pbnRlZCBvdXQgdGhpcyBpc3N1ZSwgaXQgaXMgd2lkZXIgdGhhbgpq
dXN0IGFzc2lnbl9wYWdlcygpIGFmYWljdCwgd2hpY2ggaXMgc3BlY2lmaWNhbGx5IHdoeSBJIHNh
aWQgSQp3b3VsZG4ndCBleHBlY3QgeW91IHRvIHdhbnQgdG8gZGVhbCB3aXRoIGl0IGFsb25nc2lk
ZSB0aGUgImltcGxpY2l0CmludXNlIiBhc3BlY3QuIEZpeGluZyBqdXN0IG9uZSBpbnN0YW5jZSBv
ZiBpdCB3aXRob3V0IGFsc28KYWRkcmVzc2luZyB0aGUgb3RoZXJzIGlzbid0IGdvaW5nIHRvIGhl
bHAuIElPVyB5b3UgY291bGQgbGVhdmUgdGhlCmNvZGUgdGhlIHdheSBpdCB3YXMgaW4gdjEgaW4g
dGhpcyByZWdhcmQsIGFuZCB0aGVuIHdlICh5b3UsIG1lLCBvcgp5ZXQgc29tZW9uZSBlbHNlKSB0
YWtlIGNhcmUgb2YgdGhlIHJhY2UgYXNwZWN0IGdsb2JhbGx5IGZvciB0aGUKdHJlZS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
