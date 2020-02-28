Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 009211732E7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 09:29:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7aza-0002Oo-5V; Fri, 28 Feb 2020 08:27:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7azY-0002Oj-5v
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 08:27:28 +0000
X-Inumbo-ID: 27046494-5a04-11ea-98bb-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27046494-5a04-11ea-98bb-12813bfff9fa;
 Fri, 28 Feb 2020 08:27:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 41124AC52;
 Fri, 28 Feb 2020 08:27:26 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200228071922.3983-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e9dd548a-9a32-3d45-3daf-30f080df0b74@suse.com>
Date: Fri, 28 Feb 2020 09:27:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228071922.3983-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen: make sure stop_machine_run() is
 always called in a tasklet
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAwODoxOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBXaXRoIGNvcmUgc2No
ZWR1bGluZyBhY3RpdmUgaXQgaXMgbWFuZGF0b3J5IGZvciBzdG9wX21hY2hpbmVfcnVuKCkgdG8K
PiBiZSBjYWxsZWQgaW4gaWRsZSBjb250ZXh0IG9ubHkgKHNvIGVpdGhlciBkdXJpbmcgYm9vdCBv
ciBpbiBhIHRhc2tsZXQpLAo+IGFzIG90aGVyd2lzZSBhIHNjaGVkdWxpbmcgZGVhZGxvY2sgd291
bGQgb2NjdXI6IHN0b3BfbWFjaGluZV9ydW4oKQo+IGRvZXMgYSBjcHUgcmVuZGV6dm91cyBieSBh
Y3RpdmF0aW5nIGEgdGFza2xldCBvbiBhbGwgb3RoZXIgY3B1cy4gSW4KPiBjYXNlIHN0b3BfbWFj
aGluZV9ydW4oKSB3YXMgbm90IGNhbGxlZCBpbiBhbiBpZGxlIHZjcHUgaXQgd291bGQgYmxvY2sK
PiBzY2hlZHVsaW5nIHRoZSBpZGxlIHZjcHUgb24gaXRzIHNpYmxpbmdzIHdpdGggY29yZSBzY2hl
ZHVsaW5nIGJlaW5nCj4gYWN0aXZlLCByZXN1bHRpbmcgaW4gYSBoYW5nLgo+IAo+IFB1dCBhIEJV
R19PTigpIGludG8gc3RvcF9tYWNoaW5lX3J1bigpIHRvIHRlc3QgZm9yIGJlaW5nIGNhbGxlZCBp
biBhbgo+IGlkbGUgdmNwdSBvbmx5IGFuZCBhZGFwdCB0aGUgbWlzc2luZyBjYWxsIHNpdGUgKHVj
b2RlIGxvYWRpbmcpIHRvIHVzZSBhCj4gdGFza2xldCBmb3IgY2FsbGluZyBzdG9wX21hY2hpbmVf
cnVuKCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
Pgo+IC0tLQo+IFYyOgo+IC0gcmVwaHJhc2UgY29tbWl0IG1lc3NhZ2UgKEp1bGllbiBHcmFsbCkK
PiAtLS0KPiAgeGVuL2FyY2gveDg2L21pY3JvY29kZS5jICB8IDU0ICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCj4gIHhlbi9jb21tb24vc3RvcF9tYWNoaW5l
LmMgfCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRp
b25zKC0pCgpUaGVyZSdzIG5vIG1lbnRpb24gYW55d2hlcmUgb2YgYSBjb25uZWN0aW9uIHRvIHlv
dXIgUkNVIHNlcmllcywKbm9yIHRvIHJjdV9iYXJyaWVyKCkuIFlldCB0aGUgY2hhbmdlIHB1dHMg
YSBuZXcgcmVzdHJpY3Rpb24gYWxzbwpvbiBpdHMgdXNlLCBhbmQgaWlyYyB0aGlzIHdhcyBtZW50
aW9uZWQgaW4gcHJpb3IgZGlzY3Vzc2lvbi4gRGlkCkkgbWlzcyBhbnl0aGluZz8KCj4gQEAgLTcw
MCw2ICs2ODgsMzIgQEAgaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TShjb25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQo+ICAgICAgcmV0dXJuIHJldDsK
PiAgfQo+ICAKPiAraW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShj
b25zdF92b2lkKSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQo+ICt7Cj4gKyAgICBpbnQgcmV0Owo+
ICsgICAgc3RydWN0IHVjb2RlX2J1ZiAqYnVmZmVyOwo+ICsKPiArICAgIGlmICggbGVuICE9ICh1
aW50MzJfdClsZW4gKQo+ICsgICAgICAgIHJldHVybiAtRTJCSUc7Cj4gKwo+ICsgICAgaWYgKCBt
aWNyb2NvZGVfb3BzID09IE5VTEwgKQo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsKPiAr
ICAgIGJ1ZmZlciA9IHhtYWxsb2NfZmxleF9zdHJ1Y3Qoc3RydWN0IHVjb2RlX2J1ZiwgYnVmZmVy
LCBsZW4pOwo+ICsgICAgaWYgKCAhYnVmZmVyICkKPiArICAgICAgICByZXR1cm4gLUVOT01FTTsK
PiArCj4gKyAgICByZXQgPSBjb3B5X2Zyb21fZ3Vlc3QoYnVmZmVyLT5idWZmZXIsIGJ1ZiwgbGVu
KTsKPiArICAgIGlmICggcmV0ICkKPiArICAgIHsKPiArICAgICAgICB4ZnJlZShidWZmZXIpOwo+
ICsgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ICsgICAgfQo+ICsgICAgYnVmZmVyLT5sZW4gPSBs
ZW47Cj4gKwo+ICsgICAgcmV0dXJuIGNvbnRpbnVlX2h5cGVyY2FsbF9vbl9jcHUoMCwgbWljcm9j
b2RlX3VwZGF0ZV9oZWxwZXIsIGJ1ZmZlcik7Cj4gK30KCkFuZHJldywganVzdCB0byBjbGFyaWZ5
IC0gd2VyZSB5b3Ugb2theSB3aXRoIErDvHJnZW4ncyByZXNwb25zZSByZWdhcmRpbmcKdGhpcyBy
ZS1pbnRyb2R1Y3Rpb24gb2YgY29udGludWVfaHlwZXJjYWxsX29uX2NwdSgpIGhlcmU/CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
