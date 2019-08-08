Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587298612D
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 13:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvgys-00017o-8a; Thu, 08 Aug 2019 11:53:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YRw2=WE=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hvgyq-00017e-VN
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 11:53:16 +0000
X-Inumbo-ID: 191649d2-b9d3-11e9-95fc-6b47d3eea8f6
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 191649d2-b9d3-11e9-95fc-6b47d3eea8f6;
 Thu, 08 Aug 2019 11:53:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8F0A0AE0C;
 Thu,  8 Aug 2019 11:53:11 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-2-jgross@suse.com>
 <60000ee4-7d2d-097e-dad6-584155c08ade@suse.com>
 <7220f9b0-92e8-033f-e22d-e369f797c80f@suse.com>
 <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3a17204b-c569-11d3-ad4b-52e6f6214c65@suse.com>
Date: Thu, 8 Aug 2019 13:53:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <65da8b20-716d-34f2-945f-2dbc6abd2ef9@arm.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 1/4] xen/spinlocks: in debug builds store
 cpu holding the lock
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMTkgMTI6MjgsIEp1bGllbiBHcmFsbCB3cm90ZToKPiAKPiAKPiBPbiAwOC8wOC8y
MDE5IDA4OjUxLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAwOC4wOC4xOSAwODo1OCwgSmFu
IEJldWxpY2ggd3JvdGU6Cj4+PiBPbiAwNy4wOC4yMDE5IDE2OjMxLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOgo+Pj4gRG8gd2UgaGF2ZSBhbiBpbXBsaWVkIGFzc3VtcHRpb24gc29tZXdoZXJlIHRoYXQg
dW5zaWduZWQgc2hvcnQgaXMKPj4+IGV4YWN0bHkgMTYgYml0cyB3aWRlPyBJIHRoaW5rICJ2YWwi
IHdhbnRzIHRvIGJlIHVpbnQxNl90IGhlcmUgKGFzCj4+PiB5b3UgcmVhbGx5IG1lYW4gImV4YWN0
bHkgMTYgYml0cyIpLCB0aGUgdHdvIGJvb2xlYW4gZmllbGRzIHdhbnQKPj4+IHRvIGJlIGJvb2ws
IGFuZCB0aGUgcmVtYWluaW5nIHR3byBvbmVzIHVuc2lnbmVkIGludC4KPj4KPj4gQnV0IHRoYXQg
d291bGQgaW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIHVuaW9uIHRvIDQgYnl0ZXMgaW5zdGVhZCBv
ZiAyLgo+PiBTbyBhdCBsZWFzdCBwYWQgYW5kIGNwdSBtdXN0IGJlIHVuc2lnbmVkIHNob3J0IG9y
IChiZXR0ZXIpIHVpbnQxNl90Lgo+IAo+IEhvdyBhYm91dCBib29sIGlycV9zYWZlOjE/CgpJIGRp
ZG4ndCBxdWVzdGlvbiB0aGF0LCBidXQgT1RPSCBJJ20gbm90IHN1cmUgZG9pbmcgc29tZXRoaW5n
IGxpa2U6CgpzdHJ1Y3QgewogICBib29sICAgICB1bnNlZW46MTsKICAgYm9vbCAgICAgaXJxX3Nh
ZmU6MTsKICAgdWludDE2X3QgcGFkOjI7CiAgIHVpbnQxNl90IGNwdToxMjsKfQoKaXMgZ3VhcmFu
dGVlZCB0byBiZSAyIGJ5dGVzIGxvbmcuIEkgdGhpbmsgcGFkIHdpbGwgYmUgc3RpbGwgcHV0IGlu
dG8gdGhlCmZpcnN0IGJ5dGUsIGJ1dCB0aGUgY29tcGlsZXIgbWlnaHQgZGVjaWRlIHRoYXQgdGhl
IDQgYml0cyBsZWZ0IHdvbid0IGJlCmFibGUgdG8gaG9sZCB0aGUgbmV4dCAxMiBiaXRzIHNvIGl0
IGNvdWxkIHN0YXJ0IGEgbmV3IHVpbnQxNl90IGF0IG9mZnNldAoyLgoKTW92aW5nIHRoZSBib29s
IHR5cGVzIHRvIHRoZSBlbmQgb2YgdGhlIHN0cnVjdCB3b3VsZCBhdm9pZCB0aGF0IElNSE8uCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
