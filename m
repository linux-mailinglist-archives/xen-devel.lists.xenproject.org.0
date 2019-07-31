Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E36E7B8F1
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 07:03:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsggx-0006Av-Q9; Wed, 31 Jul 2019 04:58:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GJXX=V4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hsggw-0006Aq-J0
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 04:58:22 +0000
X-Inumbo-ID: d0dbe55c-b34f-11e9-a286-cbfddbad5ec9
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d0dbe55c-b34f-11e9-a286-cbfddbad5ec9;
 Wed, 31 Jul 2019 04:58:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E19FABB1;
 Wed, 31 Jul 2019 04:58:19 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-5-andrew.cooper3@citrix.com>
 <9c5c9972-801a-e01a-171e-bcabde79eb6f@suse.com>
 <bb203e66-6edd-4edd-4f96-1fe95c1f9ccd@citrix.com>
 <f585f767-f6a0-e9ce-bbab-2183dde59e97@suse.com>
 <59379d7b-6add-4f34-c82e-1d8124871d9e@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3502d93e-25a5-6854-5ebd-21f922d48a61@suse.com>
Date: Wed, 31 Jul 2019 06:58:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <59379d7b-6add-4f34-c82e-1d8124871d9e@citrix.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 4/4] xen/percpu: Make DECLARE_PER_CPU() and
 __DEFINE_PER_CPU() common
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDcuMTkgMjA6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gT24gMjkvMDcvMjAxOSAx
NDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI5LjA3LjIwMTkgMTU6MjMsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAyOS8wNy8yMDE5IDE0OjAwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAyNi4wNy4yMDE5IDIzOjA4LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4+PiAtLS0g
YS94ZW4vaW5jbHVkZS94ZW4vcGVyY3B1LmgKPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Bl
cmNwdS5oCj4+Pj4+IEBAIC0zLDYgKzMsMTIgQEAKPj4+Pj4gICAgIAo+Pj4+PiAgICAgI2luY2x1
ZGUgPGFzbS9wZXJjcHUuaD4KPj4+Pj4gICAgIAo+Pj4+PiArI2RlZmluZSBERUNMQVJFX1BFUl9D
UFUodHlwZSwgbmFtZSkgXAo+Pj4+PiArICAgIGV4dGVybiBfX3R5cGVvZl9fKHR5cGUpIHBlcl9j
cHVfXyAjIyBuYW1lCj4+Pj4+ICsKPj4+Pj4gKyNkZWZpbmUgX19ERUZJTkVfUEVSX0NQVShhdHRy
LCB0eXBlLCBuYW1lKSBcCj4+Pj4+ICsgICAgYXR0ciBfX3R5cGVvZl9fKHR5cGUpIHBlcl9jcHVf
ICMjIG5hbWUKPj4+Pj4gKwo+Pj4+PiAgICAgLyoKPj4+Pj4gICAgICAqIFNlcGFyYXRlIG91dCB0
aGUgdHlwZSwgc28gKGludFszXSwgZm9vKSB3b3Jrcy4KPj4+Pj4gICAgICAqCj4+Pj4gQnkgbW92
aW5nIHRoaW5ncyBoZXJlIHlvdSByZW5kZXIgc3RhbGUgdGhlIHJlbWFpbmRlciBvZiB0aGUKPj4+
PiBjb21tZW50IGluIGNvbnRleHQgYWJvdmU6IE5vIHBlci1hcmNoIHN5bWJvbCBuYW1lIHByZWZp
eCBpcyBnb2luZwo+Pj4+IHRvIGJlIHBvc3NpYmxlIGFueW1vcmUuIEknbSBub3QgYWdhaW5zdCBp
dCwgYnV0IHRoaXMgY29tbWVudAo+Pj4+IHdvdWxkIHRoZW4gd2FudCBhZGp1c3RpbmcuIFdoYXQn
cyBub3QgaW1tZWRpYXRlbHkgY2xlYXIgdG8gbWUgaXMKPj4+PiB3aGV0aGVyIHRoZSB0d28tc3Rh
Z2UgY29uY2F0ZW5hdGlvbiBvZiBhbiB1bmRlcnNjb3JlIGVhY2ggaXMgdGhlbgo+Pj4+IHN0aWxs
IG5lY2Vzc2FyeS4KPj4+IFllcyBpdCBpcyBzdGlsbCBuZWNlc3NhcnkuwqAgU2VlIHRoZSBUU1Mg
dGhyZWFkIGZvciB3aHkuCj4+IE5vLCB0aGF0IHRocmVhZCBkb2Vzbid0IGV4cGxhaW4gaXQuIEZy
b20gYW4gaW5pdGlhbCBsb29rIEkgdGhpbmsKPj4gdHdvLXN0YWdlIGV4cGFuc2lvbiBpcyBzdGls
bCBuZWNlc3NhcnkKPiAKPiBJdCBpcyBhYm91dCBwcmV2ZW50aW5nICduYW1lJyBiZWluZyBleHBh
bmRlZCwgZHVlIHRvIHRoZSBtZXNzIHdpdGgKPiBjcHVtYXNrX3NjcmF0Y2gsIHdoaWNoIHJlcXVp
cmVzIGEgIyMgYXQgbGVhc3QgYXQgdGhlIHRvcCBsZXZlbC4KPiAKPiBJIHBlcnNvbmFsbHkgdGhp
bmsgdGhhdCBmaXhpbmcgY3B1bWFza19zY3JhdGNoIGlzIHRoZSByaWdodCB3YXkgdG8gZ28sCj4g
YnV0IEkgc3BlY2lmaWNhbGx5IGRpZG4ndCB0b3VjaCB0aGF0IHNvIGFzIHRvIGF2b2lkIHdyZWFr
aW5nIGhhdm9jIHdpdGgKPiBKdWVyZ2VuJ3MgY29yZS1zY2hlZHVsaW5nIHNlcmllcy4KCkkgYXBw
cmVjaWF0ZSB0aGF0LCBidXQgSSBkb24ndCB0aGluayBhIGxhcmdlIHNlcmllcyBsaWtlIG1pbmUg
c2hvdWxkCmJsb2NrIGVmZm9ydHMgdG8gbWFrZSBYZW4gY2xlYW5lci4KCkVzcGVjaWFsbHkgdGhp
cyBjYXNlIHNob3VsZCBiZSByYXRoZXIgZWFzeSB0byBoYW5kbGUsIGFzIHRoZXJlIGlzIG5vCmNo
YW5nZSBvZiB0aGUgbG9naWMgb2YgdGhlIHBhdGNoZXMgdG8gYmUgZXhwZWN0ZWQuCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
