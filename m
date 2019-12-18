Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B636124873
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:33:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZPn-0005iT-2X; Wed, 18 Dec 2019 13:30:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihZPl-0005iO-EM
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:30:57 +0000
X-Inumbo-ID: 99fa8674-219a-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 99fa8674-219a-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 13:30:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 73862ACA0;
 Wed, 18 Dec 2019 13:30:47 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>
References: <20191218124244.8840-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ee6c4bae-0571-a18e-d408-0b69f8018329@suse.com>
Date: Wed, 18 Dec 2019 14:30:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191218124244.8840-1-sjpark@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v12 2/5] xenbus/backend: Protect xenbus
 callback with lock
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
Cc: axboe@kernel.dk, sj38.park@gmail.com, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTM6NDIsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gT24gV2VkLCAxOCBEZWMg
MjAxOSAxMzoyNzozNyArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6Cj4gCj4+IE9uIDE4LjEyLjE5IDExOjQyLCBTZW9uZ0phZSBQYXJrIHdyb3RlOgo+Pj4gRnJv
bTogU2VvbmdKYWUgUGFyayA8c2pwYXJrQGFtYXpvbi5kZT4KPj4+Cj4+PiAncmVjbGFpbV9tZW1v
cnknIGNhbGxiYWNrIGNhbiByYWNlIHdpdGggYSBkcml2ZXIgY29kZSBhcyB0aGlzIGNhbGxiYWNr
Cj4+PiB3aWxsIGJlIGNhbGxlZCBmcm9tIGFueSBtZW1vcnkgcHJlc3N1cmUgZGV0ZWN0ZWQgY29u
dGV4dC4gIFRvIGRlYWwgd2l0aAo+Pj4gdGhlIGNhc2UsIHRoaXMgY29tbWl0IGFkZHMgYSBzcGlu
bG9jayBpbiB0aGUgJ3hlbmJ1c19kZXZpY2UnLiAgV2hlbmV2ZXIKPj4+ICdyZWNsYWltX21lbW9y
eScgY2FsbGJhY2sgaXMgY2FsbGVkLCB0aGUgbG9jayBvZiB0aGUgZGV2aWNlIHdoaWNoIHBhc3Nl
ZAo+Pj4gdG8gdGhlIGNhbGxiYWNrIGFzIGl0cyBhcmd1bWVudCBpcyBsb2NrZWQuICBUaHVzLCBk
cml2ZXJzIHJlZ2lzdGVyaW5nCj4+PiB0aGVpciAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIHNo
b3VsZCBwcm90ZWN0IHRoZSBkYXRhIHRoYXQgbWlnaHQgcmFjZQo+Pj4gd2l0aCB0aGUgY2FsbGJh
Y2sgd2l0aCB0aGUgbG9jayBieSB0aGVtc2VsdmVzLgo+Pgo+PiBBbnkgcmVhc29uIHlvdSBkb24n
dCB0YWtlIHRoZSBsb2NrIGFyb3VuZCB0aGUgLnByb2JlKCkgYW5kIC5yZW1vdmUoKQo+PiBjYWxs
cyBvZiB0aGUgYmFja2VuZCAoeGVuYnVzX2Rldl9wcm9iZSgpIGFuZCB4ZW5idXNfZGV2X3JlbW92
ZSgpKT8gVGhpcwo+PiB3b3VsZCBlbGltaW5hdGUgdGhlIG5lZWQgdG8gZG8gdGhhdCBpbiBlYWNo
IGJhY2tlbmQgaW5zdGVhZC4KPiAKPiBGaXJzdCBvZiBhbGwsIEkgd291bGQgbGlrZSB0byBrZWVw
IHRoZSBjcml0aWNhbCBzZWN0aW9uIGFzIHNtYWxsIGFzIHBvc3NpYmxlLgo+IFdpdGggbXkgc21h
bGwgdGVzdCwgSSBjb3VsZCBzZWUgc2xpZ2h0bHkgaW5jcmVhc2luZyBtZW1vcnkgcHJlc3N1cmUg
YXMgdGhlCj4gY3JpdGljYWwgc2VjdGlvbiBiZWNvbWVzIHdpZGVyLiAgQWxzbywgc29tZSBkcml2
ZXJzIG1pZ2h0IHNoYXJlIHRoZSBkYXRhIHRoZWlyCj4gJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFj
ayB0b3VjaGVzIHdpdGggb3RoZXIgZnVuY3Rpb25zLiAgSSB0aGluayBvbmx5IHRoZQo+IGRyaXZl
ciBvd25lcnMgY2FuIGtub3cgd2hhdCBkYXRhIGlzIHNoYXJlZCBhbmQgd2hhdCBpcyB0aGUgbWlu
aW11bSBjcml0aWNhbAo+IHNlY3Rpb24gdG8gcHJvdGVjdCBpdC4KCkJ1dCB0aGlzIGtpbmQgb2Yg
c2VyaWFsaXphdGlvbiBjYW4gc3RpbGwgYmUgYWRkZWQgb24gdG9wLgoKQW5kIHdpdGggdGhlIHRy
eWxvY2sgaW4gdGhlIHJlY2xhaW0gcGF0aCBJIGJlbGlldmUgeW91IGNhbiBldmVuIGF2b2lkCnRo
ZSBpcnEgdmFyaWFudHMgb2YgdGhlIHNwaW5sb2NrLiBCdXQgSSBtaWdodCBiZSB3cm9uZywgc28g
eW91IHNob3VsZAp0cnkgdGhhdCB3aXRoIGxvY2tkZXAgZW5hYmxlZC4gSWYgaXQgaXMgd29ya2lu
ZyB0aGVyZSBpcyBubyBoYXJtIGRvbmUKd2hlbiBtYWtpbmcgdGhlIGNyaXRpY2FsIHNlY3Rpb24g
bGFyZ2VyLCBhcyBtZW1vcnkgYWxsb2NhdGlvbnMgd2lsbAp3b3JrIGFzIGJlZm9yZS4KCgpKdWVy
Z2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
