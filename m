Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B3124B56
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 16:16:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihaze-00084z-5l; Wed, 18 Dec 2019 15:12:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NgR6=2I=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ihazc-00084p-N1
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 15:12:04 +0000
X-Inumbo-ID: b9cfb812-21a8-11ea-a914-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9cfb812-21a8-11ea-a914-bc764e2007e4;
 Wed, 18 Dec 2019 15:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A01B4AD45;
 Wed, 18 Dec 2019 15:11:53 +0000 (UTC)
To: SeongJae Park <sjpark@amazon.com>
References: <20191218144025.24277-1-sjpark@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <7edb266e-3185-5adc-1121-1b61feaf5a34@suse.com>
Date: Wed, 18 Dec 2019 16:11:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191218144025.24277-1-sjpark@amazon.com>
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
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, konrad.wilk@oracle.com,
 pdurrant@amazon.com, SeongJae Park <sjpark@amazon.de>,
 linux-kernel@vger.kernel.org, sj38.park@gmail.com,
 xen-devel@lists.xenproject.org, roger.pau@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTIuMTkgMTU6NDAsIFNlb25nSmFlIFBhcmsgd3JvdGU6Cj4gT24gV2VkLCAxOCBEZWMg
MjAxOSAxNDozMDo0NCArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0BzdXNlLmNvbT4gd3Jv
dGU6Cj4gCj4+IE9uIDE4LjEyLjE5IDEzOjQyLCBTZW9uZ0phZSBQYXJrIHdyb3RlOgo+Pj4gT24g
V2VkLCAxOCBEZWMgMjAxOSAxMzoyNzozNyArMDEwMCAiSsO8cmdlbiBHcm/DnyIgPGpncm9zc0Bz
dXNlLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+IE9uIDE4LjEyLjE5IDExOjQyLCBTZW9uZ0phZSBQYXJr
IHdyb3RlOgo+Pj4+PiBGcm9tOiBTZW9uZ0phZSBQYXJrIDxzanBhcmtAYW1hem9uLmRlPgo+Pj4+
Pgo+Pj4+PiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIGNhbiByYWNlIHdpdGggYSBkcml2ZXIg
Y29kZSBhcyB0aGlzIGNhbGxiYWNrCj4+Pj4+IHdpbGwgYmUgY2FsbGVkIGZyb20gYW55IG1lbW9y
eSBwcmVzc3VyZSBkZXRlY3RlZCBjb250ZXh0LiAgVG8gZGVhbCB3aXRoCj4+Pj4+IHRoZSBjYXNl
LCB0aGlzIGNvbW1pdCBhZGRzIGEgc3BpbmxvY2sgaW4gdGhlICd4ZW5idXNfZGV2aWNlJy4gIFdo
ZW5ldmVyCj4+Pj4+ICdyZWNsYWltX21lbW9yeScgY2FsbGJhY2sgaXMgY2FsbGVkLCB0aGUgbG9j
ayBvZiB0aGUgZGV2aWNlIHdoaWNoIHBhc3NlZAo+Pj4+PiB0byB0aGUgY2FsbGJhY2sgYXMgaXRz
IGFyZ3VtZW50IGlzIGxvY2tlZC4gIFRodXMsIGRyaXZlcnMgcmVnaXN0ZXJpbmcKPj4+Pj4gdGhl
aXIgJ3JlY2xhaW1fbWVtb3J5JyBjYWxsYmFjayBzaG91bGQgcHJvdGVjdCB0aGUgZGF0YSB0aGF0
IG1pZ2h0IHJhY2UKPj4+Pj4gd2l0aCB0aGUgY2FsbGJhY2sgd2l0aCB0aGUgbG9jayBieSB0aGVt
c2VsdmVzLgo+Pj4+Cj4+Pj4gQW55IHJlYXNvbiB5b3UgZG9uJ3QgdGFrZSB0aGUgbG9jayBhcm91
bmQgdGhlIC5wcm9iZSgpIGFuZCAucmVtb3ZlKCkKPj4+PiBjYWxscyBvZiB0aGUgYmFja2VuZCAo
eGVuYnVzX2Rldl9wcm9iZSgpIGFuZCB4ZW5idXNfZGV2X3JlbW92ZSgpKT8gVGhpcwo+Pj4+IHdv
dWxkIGVsaW1pbmF0ZSB0aGUgbmVlZCB0byBkbyB0aGF0IGluIGVhY2ggYmFja2VuZCBpbnN0ZWFk
Lgo+Pj4KPj4+IEZpcnN0IG9mIGFsbCwgSSB3b3VsZCBsaWtlIHRvIGtlZXAgdGhlIGNyaXRpY2Fs
IHNlY3Rpb24gYXMgc21hbGwgYXMgcG9zc2libGUuCj4+PiBXaXRoIG15IHNtYWxsIHRlc3QsIEkg
Y291bGQgc2VlIHNsaWdodGx5IGluY3JlYXNpbmcgbWVtb3J5IHByZXNzdXJlIGFzIHRoZQo+Pj4g
Y3JpdGljYWwgc2VjdGlvbiBiZWNvbWVzIHdpZGVyLiAgQWxzbywgc29tZSBkcml2ZXJzIG1pZ2h0
IHNoYXJlIHRoZSBkYXRhIHRoZWlyCj4+PiAncmVjbGFpbV9tZW1vcnknIGNhbGxiYWNrIHRvdWNo
ZXMgd2l0aCBvdGhlciBmdW5jdGlvbnMuICBJIHRoaW5rIG9ubHkgdGhlCj4+PiBkcml2ZXIgb3du
ZXJzIGNhbiBrbm93IHdoYXQgZGF0YSBpcyBzaGFyZWQgYW5kIHdoYXQgaXMgdGhlIG1pbmltdW0g
Y3JpdGljYWwKPj4+IHNlY3Rpb24gdG8gcHJvdGVjdCBpdC4KPj4KPj4gQnV0IHRoaXMga2luZCBv
ZiBzZXJpYWxpemF0aW9uIGNhbiBzdGlsbCBiZSBhZGRlZCBvbiB0b3AuCj4gCj4gSSdtIHN0aWxs
IHdvcnJ5aW5nIGFib3V0IHRoZSB1bm5lY2Vzc2FyaWx5IGxhcmdlIGNyaXRpY2FsIHNlY3Rpb24s
IGJ1dCBpdCBtaWdodAo+IGJlIHNtYWxsIGVub3VnaCB0byBiZSBpZ25vcmVkLiAgSWYgbm8gb3Ro
ZXJzIGhhdmUgc3Ryb25nIG9iamVjdGlvbiwgSSB3aWxsIHRha2UKPiB0aGUgbG9jayBhcm91bmQg
dGhlICctPnByb2JlKCknIGFuZCAnLT5yZW1vdmUoKScuCgpUaGUgbG9jayBpcyBwZXIgZGV2aWNl
LCBzbyBjb250ZW50aW9uIGlzIHBvc3NpYmxlIG9ubHkgZm9yIHRoZQpyZWNsYWltIGNhc2UuIElu
IGNhc2UgcHJvYmUgb3IgcmVtb3ZlIGFyZSBydW5uaW5nIHJlY2xhaW0gd2lsbCBoYXZlCm5vdGhp
bmcgdG8gZnJlZSAoaW4gcHJvYmUgY2FzZSBub3RoaW5nIGlzIGFsbG9jYXRlZCB5ZXQsIGluIHJl
bW92ZQpjYXNlIGV2ZXJ5dGhpbmcgc2hvdWxkIGJlIGZyZWVkIGFueXdheSkuIFNvIHRoZSBsYXJn
ZXIgY3JpdGljYWwgc2VjdGlvbgppcyBubyBwcm9ibGVtIGF0IGFsbCBJTU8uCgo+PiBBbmQgd2l0
aCB0aGUgdHJ5bG9jayBpbiB0aGUgcmVjbGFpbSBwYXRoIEkgYmVsaWV2ZSB5b3UgY2FuIGV2ZW4g
YXZvaWQKPj4gdGhlIGlycSB2YXJpYW50cyBvZiB0aGUgc3BpbmxvY2suIEJ1dCBJIG1pZ2h0IGJl
IHdyb25nLCBzbyB5b3Ugc2hvdWxkCj4+IHRyeSB0aGF0IHdpdGggbG9ja2RlcCBlbmFibGVkLiBJ
ZiBpdCBpcyB3b3JraW5nIHRoZXJlIGlzIG5vIGhhcm0gZG9uZQo+PiB3aGVuIG1ha2luZyB0aGUg
Y3JpdGljYWwgc2VjdGlvbiBsYXJnZXIsIGFzIG1lbW9yeSBhbGxvY2F0aW9ucyB3aWxsCj4+IHdv
cmsgYXMgYmVmb3JlLgo+IAo+IFllcywgeW91J3JlIHJpZ2h0LiAgSSB3aWxsIHRyeSB0ZXN0IHdp
dGggbG9ja2RlcC4KClRoYW5rcywKCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
