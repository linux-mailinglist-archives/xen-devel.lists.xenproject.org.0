Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B291533AE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 16:19:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izMNA-0007wS-0Q; Wed, 05 Feb 2020 15:13:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izMN8-0007wN-Qk
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 15:13:46 +0000
X-Inumbo-ID: 1ab150d0-482a-11ea-ad98-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ab150d0-482a-11ea-ad98-bc764e2007e4;
 Wed, 05 Feb 2020 15:13:46 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMN6-00085t-Jw; Wed, 05 Feb 2020 15:13:44 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izMN6-0002a5-9t; Wed, 05 Feb 2020 15:13:44 +0000
Date: Wed, 5 Feb 2020 15:13:41 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200205151341.iavle7uwjkaimpvk@debian>
References: <730add36-bfa0-e1bb-e2cb-b5570540688c@suse.com>
 <bc374d4c-e072-ca72-8b85-2120569e24e6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bc374d4c-e072-ca72-8b85-2120569e24e6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 6/6] domctl/vNUMA: avoid arithmetic overflow
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
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMDI6MTc6MDJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gQ2hlY2tpbmcgdGhlIHJlc3VsdCBvZiBhIG11bHRpcGxpY2F0aW9uIGFnYWluc3QgYSBj
ZXJ0YWluIGxpbWl0IGhhcyBubwo+IHN1ZmZpY2llbnQgaW1wbGljYXRpb24gb24gdGhlIG9yaWdp
bmFsIHZhbHVlJ3MgcmFuZ2UuIEluIHRoZSBjYXNlIGhlcmUKPiBpdCBpcyBpbiBwYXJ0aWN1bGFy
IHByb2JsZW1hdGljIHRoYXQgd2hpbGUgaGFuZGxpbmcgdGhlIGRvbWN0bCB3ZSBkbwo+IAo+ICAg
ICBpZiAoIGNvcHlfZnJvbV9ndWVzdChpbmZvLT52ZGlzdGFuY2UsIHVpbmZvLT52ZGlzdGFuY2Us
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIG5yX3Zub2RlcyAqIG5yX3Zub2RlcykgKQo+ICAg
ICAgICAgZ290byB2bnVtYV9mYWlsOwo+IAo+IHdoaWNoIG1lYW5zIGNvcHlpbmcgc2l6ZW9mKHVu
c2lnbmVkIGludCkgKiAobnJfdm5vZGVzICogbnJfdm5vZGVzKQo+IGJ5dGVzLCBhbmQgdGhlIGhh
bmRsaW5nIG9mIFhFTk1FTV9nZXRfdm51bWFpbmZvIHNpbWlsYXJseSBoYXMKPiAKPiAgICAgICAg
IHRtcC52ZGlzdGFuY2UgPSB4bWFsbG9jX2FycmF5KHVuc2lnbmVkIGludCwgZG9tX3Zub2RlcyAq
IGRvbV92bm9kZXMpOwo+IAo+IHdoaWNoIG1lYW5zIGFsbG9jYXRpbmcgc2l6ZW9mKHVuc2lnbmVk
IGludCkgKiAoZG9tX3Zub2RlcyAqIGRvbV92bm9kZXMpCj4gYnl0ZXMsIHdoZXJlYXMgaW4gdGhl
biBnb2VzIG9uIGRvaW5nIHRoaXM6Cj4gCj4gICAgICAgICBtZW1jcHkodG1wLnZkaXN0YW5jZSwg
ZC0+dm51bWEtPnZkaXN0YW5jZSwKPiAgICAgICAgICAgICAgICBzaXplb2YoKmQtPnZudW1hLT52
ZGlzdGFuY2UpICogZG9tX3Zub2RlcyAqIGRvbV92bm9kZXMpOwo+IAo+IE5vdGUgdGhlIGxhY2sg
b2YgcGFyZW50aGVzZXMgaW4gdGhlIG11bHRpcGxpY2F0aW9uIGV4cHJlc3Npb24uCj4gCj4gQWRq
dXN0IHRoZSBvdmVyZmxvdyBjaGVjaywgbW92aW5nIHRoZSBtdXN0LW5vdC1iZS16ZXJvIG9uZSBy
aWdodCBuZXh0IHRvCj4gaXQgdG8gYXZvaWQgcXVlc3Rpb25zIG9uIHdoZXRoZXIgdGhlcmUgbWln
aHQgYmUgZGl2aXNpb24gYnkgemVyby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
