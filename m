Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1563B164B2C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 17:55:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Saf-0004wl-6M; Wed, 19 Feb 2020 16:52:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wVCj=4H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j4Sad-0004wQ-9l
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 16:52:47 +0000
X-Inumbo-ID: 40eb701e-5338-11ea-83cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40eb701e-5338-11ea-83cf-12813bfff9fa;
 Wed, 19 Feb 2020 16:52:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 690F7AD57;
 Wed, 19 Feb 2020 16:52:45 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>
References: <20200123085504.30911-1-jgross@suse.com>
 <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6aff04ca-904b-cf27-d6f4-af9a146e4c04@suse.com>
Date: Wed, 19 Feb 2020 17:52:44 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <95f651ddc1639d1c498067e4af71759585aa48b3.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: rework credit2 run-queue
 allocation
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAyMCAxNzo0NywgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gVGh1LCAyMDIw
LTAxLTIzIGF0IDA5OjU1ICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiAtLS0gYS94ZW4v
Y29tbW9uL3NjaGVkL2NyZWRpdDIuYwo+PiArKysgYi94ZW4vY29tbW9uL3NjaGVkL2NyZWRpdDIu
Ywo+PiBAQCAtODQ5LDUxICs4MjIsNzEgQEAgc3RhdGljIGlubGluZSBib29sIHNhbWVfY29yZSh1
bnNpZ25lZCBpbnQgY3B1YSwKPj4gdW5zaWduZWQgaW50IGNwdWIpCj4+ICAgICAgICAgICAgIGNw
dV90b19jb3JlKGNwdWEpID09IGNwdV90b19jb3JlKGNwdWIpOwo+PiAgfQo+PiAgCj4+IC1zdGF0
aWMgdW5zaWduZWQgaW50Cj4+IC1jcHVfdG9fcnVucXVldWUoY29uc3Qgc3RydWN0IGNzY2hlZDJf
cHJpdmF0ZSAqcHJ2LCB1bnNpZ25lZCBpbnQgY3B1KQo+PiArc3RhdGljIHN0cnVjdCBjc2NoZWQy
X3J1bnF1ZXVlX2RhdGEgKgo+PiArY3B1X2FkZF90b19ydW5xdWV1ZShzdHJ1Y3QgY3NjaGVkMl9w
cml2YXRlICpwcnYsIHVuc2lnbmVkIGludCBjcHUpCj4+ICB7Cj4+IC0gICAgY29uc3Qgc3RydWN0
IGNzY2hlZDJfcnVucXVldWVfZGF0YSAqcnFkOwo+PiAtICAgIHVuc2lnbmVkIGludCBycWk7Cj4+
ICsgICAgc3RydWN0IGNzY2hlZDJfcnVucXVldWVfZGF0YSAqcnFkLCAqcnFkX25ldzsKPj4gKyAg
ICBzdHJ1Y3QgbGlzdF9oZWFkICpycWRfaW5zOwo+PiArICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3M7
Cj4+ICsgICAgaW50IHJxaSA9IDA7Cj4+ICsgICAgYm9vbCBycWlfdW51c2VkID0gZmFsc2UsIHJx
ZF92YWxpZCA9IGZhbHNlOwo+PiArCj4+ICsgICAgcnFkX25ldyA9IHh6YWxsb2Moc3RydWN0IGNz
Y2hlZDJfcnVucXVldWVfZGF0YSk7Cj4+ICAKPj4KPiBTbywgSSdtIG5vdCBzdXJlIEkgc2VlIHdo
eSBpdCdzIGJldHRlciB0byBhbGxvY2F0aW5nIHRoaXMgaGVyZSwgYW5kCj4gdGhlbiBmcmVlIGl0
IGlmIHdlIGRpZG4ndCBuZWVkIGl0LCBpbnN0ZWFkIHRoYW4gYWxsb2NhdGluZyBpdCBsYXRlciwK
PiBvbmx5IGlmIHdlIGFjdHVhbGx5IG5lZWQgaXQuLi4gV2hhdCBhbSBJIG1pc3Npbmc/IDotKQoK
V2hlcmUgcG9zc2libGUgd2Ugc2hvdWxkIHRyeSB0byBhdm9pZCBjYWxsaW5nIGFsbG9jYXRpb24g
ZnVuY3Rpb25zCndpdGggbG9ja3MgaGVsZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
