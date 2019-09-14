Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7735B29F2
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 07:08:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i90En-0005YE-8M; Sat, 14 Sep 2019 05:04:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i90Em-0005Y9-0u
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 05:04:44 +0000
X-Inumbo-ID: 26962e1e-d6ad-11e9-95c0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26962e1e-d6ad-11e9-95c0-12813bfff9fa;
 Sat, 14 Sep 2019 05:04:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D9306AF79;
 Sat, 14 Sep 2019 05:04:36 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190909093339.7134-1-jgross@suse.com>
 <20190909093339.7134-3-jgross@suse.com>
 <bdf39183da171d3780318f3c50818906a6a4b487.camel@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f96be1bb-9881-a300-4f4d-24c3c2fdb7bf@suse.com>
Date: Sat, 14 Sep 2019 07:04:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bdf39183da171d3780318f3c50818906a6a4b487.camel@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH v3 2/4] xen/sched: remove cpu from pool0
 before removing it
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMTkgMTk6MjcsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIE1vbiwgMjAxOS0w
OS0wOSBhdCAxMTozMyArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVG9kYXkgYSBjcHUg
d2hpY2ggaXMgcmVtb3ZlZCBmcm9tIHRoZSBzeXN0ZW0gaXMgdGFrZW4gZGlyZWN0bHkgZnJvbQo+
PiBQb29sMCB0byB0aGUgb2ZmbGluZSBzdGF0ZS4gVGhpcyB3aWxsIGNvbmZsaWN0IHdpdGggdGhl
IG5ldyBpZGxlCj4+IHNjaGVkdWxlciwgc28gcmVtb3ZlIGl0IGZyb20gUG9vbDAgZmlyc3QuIEFk
ZGl0aW9uYWxseSBhY2NlcHQKPj4gcmVtb3ZpbmcKPj4gYSBmcmVlIGNwdSBpbnN0ZWFkIG9mIHJl
cXVpcmluZyBpdCB0byBiZSBpbiBQb29sMC4KPj4KPj4gRm9yIHRoZSByZXN1bWUgZmFpbGVkIGNh
c2Ugd2UgbmVlZCB0byBjYWxsIHRoZSBzY2hlZHVsZXIgY29kZSBmb3IKPj4gdGhhdAo+PiBzaXR1
YXRpb24gYWZ0ZXIgdGhlIGNwdXBvb2wgaGFuZGxpbmcsIHNvIG1vdmUgdGhlIHNjaGVkdWxlciBj
b2RlIGludG8KPj4gYSBmdW5jdGlvbiBhbmQgY2FsbCBpdCBmcm9tIGNwdXBvb2xfY3B1X3JlbW92
ZV9mb3JjZWQoKSBhbmQgcmVtb3ZlCj4+IHRoZQo+PiBDUFVfUkVTVU1FX0ZBSUxFRCBjYXNlIGZy
b20gY3B1X3NjaGVkdWxlX2NhbGxiYWNrKCkuCj4+Cj4+IE5vdGUgdGhhdCB3ZSBhcmUgY2FsbGlu
ZyBub3cgc2NoZWR1bGVfY3B1X3N3aXRjaCgpIGluIHN0b3BfbWFjaGluZQo+PiBjb250ZXh0IHNv
IHdlIG5lZWQgdG8gc3dpdGNoIGZyb20gc3BpbmxvY2tfaXJxIHRvIHNwaW5sb2NrX2lycXNhdmUu
Cj4+Cj4gU28sIEkgd2FzIGxvb2tpbmcgYXQgdGhpcyBwYXRjaCwgYW5kIHdoaWxlIGRvaW5nIHRo
YXQsIGFsc28gdHJ5aW5nIGl0Cj4gb3V0Lgo+IAo+IEkndmUgZG9uZSB0aGUgZm9sbG93aW5nOgo+
IAo+ICMgZWNobyAwID4gL3N5cy9kZXZpY2VzL3N5c3RlbS94ZW5fY3B1L3hlbl9jcHU3L29ubGlu
ZQo+IAo+IEFuZCBDUFUgNyB3ZW50IG9mZmxpbmUsIGFuZCB3YXMgbGlzdGVkIGFtb25nIHRoZSBm
cmVlIENQVXM6Cj4gCj4gKFhFTikgT25saW5lIENwdXM6IDAtNgo+IChYRU4pIEZyZWUgQ3B1czog
Nwo+IChYRU4pIENwdXBvb2wgMDoKPiAoWEVOKSBDcHVzOiAwLTYKPiAoWEVOKSBTY2hlZHVsZXI6
IFNNUCBDcmVkaXQgU2NoZWR1bGVyIHJldjIgKGNyZWRpdDIpCj4gKFhFTikgQWN0aXZlIHF1ZXVl
czogMQo+IChYRU4pIAlkZWZhdWx0LXdlaWdodCAgICAgPSAyNTYKPiAoWEVOKSBSdW5xdWV1ZSAw
Ogo+IChYRU4pIAluY3B1cyAgICAgICAgICAgICAgPSA3Cj4gKFhFTikgCWNwdXMgICAgICAgICAg
ICAgICA9IDAtNgo+IChYRU4pIAltYXhfd2VpZ2h0ICAgICAgICAgPSAyNTYKPiAoWEVOKSAJcGlj
a19iaWFzICAgICAgICAgID0gMQo+IChYRU4pIAlpbnN0bG9hZCAgICAgICAgICAgPSAxCj4gKFhF
TikgCWF2ZWxvYWQgICAgICAgICAgICA9IDM5OTIgKH4xJSkKPiAoWEVOKSAJaWRsZXJzOiAwMDAw
MDA2Zgo+IChYRU4pIAl0aWNrbGVkOiAwMDAwMDAwMAo+IChYRU4pIAlmdWxseSBpZGxlIGNvcmVz
OiAwMDAwMDA0Zgo+IAo+IFRoZW4sIEkgZGlkOgo+IAo+ICMgZWNobyAxID4gL3N5cy9kZXZpY2Vz
L3N5c3RlbS94ZW5fY3B1L3hlbl9jcHU3L29ubGluZQo+IAo+IEFuZCBhZ2FpbiBpdCBhcHBlYXIg
dG8gaGF2ZSB3b3JrZWQsIGkuZS4sIHRoZSBDUFUgaXMgYmFjayBvbmxpbmUgYW5kIGluCj4gUG9v
bC0wOgo+IAo+IChYRU4pIE9ubGluZSBDcHVzOiAwLTcKPiAoWEVOKSBDcHVwb29sIDA6Cj4gKFhF
TikgQ3B1czogMC03Cj4gKFhFTikgU2NoZWR1bGVyOiBTTVAgQ3JlZGl0IFNjaGVkdWxlciByZXYy
IChjcmVkaXQyKQo+IChYRU4pIEFjdGl2ZSBxdWV1ZXM6IDEKPiAoWEVOKSAJZGVmYXVsdC13ZWln
aHQgICAgID0gMjU2Cj4gKFhFTikgUnVucXVldWUgMDoKPiAoWEVOKSAJbmNwdXMgICAgICAgICAg
ICAgID0gOAo+IChYRU4pIAljcHVzICAgICAgICAgICAgICAgPSAwLTcKPiAoWEVOKSAJbWF4X3dl
aWdodCAgICAgICAgID0gMjU2Cj4gKFhFTikgCXBpY2tfYmlhcyAgICAgICAgICA9IDEKPiAoWEVO
KSAJaW5zdGxvYWQgICAgICAgICAgID0gMgo+IChYRU4pIAlhdmVsb2FkICAgICAgICAgICAgPSAy
NzE0NzQgKH4xMDMlKQo+IChYRU4pIAlpZGxlcnM6IDAwMDAwMGFmCj4gKFhFTikgCXRpY2tsZWQ6
IDAwMDAwMDAwCj4gKFhFTikgCWZ1bGx5IGlkbGUgY29yZXM6IDAwMDAwMDhmCj4gCj4gVGhlbiBJ
IGRpZDoKPiAKPiAjIGVjaG8gMCA+IC9zeXMvZGV2aWNlcy9zeXN0ZW0veGVuX2NwdS94ZW5fY3B1
Ny9vbmxpbmUKPiAKPiBBbmQsIGFmdGVyIHRoYXQ6Cj4gCj4gIyB4bCBjcHVwb29sLWNwdS1yZW1v
dmUgUG9vbC0wIDcKPiAKPiBBbmQgdGhlIHN5c3RlbSBoYW5nZWQuCj4gCj4gSSBkb24ndCBoYXZl
IGEgd29ya2luZyBzZXJpYWwgY29uc29sZSBvbiB0aGF0IHRlc3Rib3gsIHVuZm9ydHVuYXRlbHks
Cj4gc28gSSBjYW4ndCBwb2tlIGF0IGRlYnVnIGtleXMsIGV0Yy4KPiAKPiBJcyB0aGlzIGFueXRo
aW5nIHRoYXQgeW91J3ZlIHNlZW4gb3IgdGhhdCB5b3UgY2FuIHJlcHJvZHVjZT8KCkkgY2FuIHJl
cHJvZHVjZSBpdCBhbmQgYWxyZWFkeSBoYXZlIGZvdW5kIHRoZSBidWcuCgoKSnVlcmdlbgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
