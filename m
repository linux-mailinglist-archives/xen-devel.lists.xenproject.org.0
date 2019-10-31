Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFACEB89B
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2019 21:53:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQHN4-0004Bh-BY; Thu, 31 Oct 2019 20:48:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqky=YY=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iQHN2-0004Bc-Fj
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2019 20:48:41 +0000
X-Inumbo-ID: d071da4a-fc1f-11e9-8aca-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d071da4a-fc1f-11e9-8aca-bc764e2007e4;
 Thu, 31 Oct 2019 20:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXgvEYc0Kdiqb5BHPmpzfhi20fEYHSgEEiQkan400zA=; b=PqQh6TaeF5BugQ2lvahVU4kn8h
 1ytrTEZYgmeFHRVkha0Xvnd33jxTiIufRDquZyPhp828LSWRazKLYGMwPc2/dmDVOeT90wxRsJ/kA
 80D3StDYsJca27yOg9TWeUtTxO66v8G7SgF1jh9wkO6EsL4frvlQY27H5x87peD7v6zY=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:36250
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iQHNm-0005hw-P9; Thu, 31 Oct 2019 21:49:27 +0100
To: Jan Beulich <jbeulich@suse.com>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
Date: Thu, 31 Oct 2019 21:48:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEvMTAvMjAxOSAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMzAuMTAuMjAxOSAy
MzoyMSwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBDYWxsIHRyYWNlIHNlZW1zIHRvIGJl
IHRoZSBzYW1lIGluIGFsbCBjYXNlcy4KPj4KPj4gLS0KPj4gU2FuZGVyCj4+Cj4+Cj4+IChYRU4p
IFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gQU1ELVZpOiB1cGRhdGVfcGFnaW5nX21vZGUgVHJ5
IHRvIGFjY2VzcyBwZGV2X2xpc3Qgd2l0aG91dCBhcXVpcmluZyBwY2lkZXZzX2xvY2suCj4+IChY
RU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gLS0tLVsgWGVuLTQuMTMuMC1yYyAgeDg2XzY0
ICBkZWJ1Zz15ICAgTm90IHRhaW50ZWQgXS0tLS0KPj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6
MDUuNzQ4XSBDUFU6ICAgIDEKPj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSBSSVA6
ICAgIGUwMDg6WzxmZmZmODJkMDgwMjY1NzQ4Pl0gaW9tbXVfbWFwLmMjdXBkYXRlX3BhZ2luZ19t
b2RlKzB4MWYyLzB4M2ViCj4+IChYRU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gUkZMQUdT
OiAwMDAwMDAwMDAwMDEwMjg2ICAgQ09OVEVYVDogaHlwZXJ2aXNvciAoZDB2MikKPiAKPiBJIGRp
ZG4ndCBwYXkgYXR0ZW50aW9uIHRvIHRoaXMgd2hlbiB3cml0aW5nIG15IGVhcmxpZXIgcmVwbHk6
IFRoZQo+IGxpa2VseSBjdWxwcml0IGxvb2tzIHRvIGJlIGY4OWY1NTU4MjcgKCJyZW1vdmUgbGF0
ZSAob24tZGVtYW5kKQo+IGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcyIpLiBQcmlv
ciB0byB0aGlzIEkgYXNzdW1lIElPTU1VCj4gcGFnZSB0YWJsZXMgZ290IGNvbnN0cnVjdGVkIG9u
bHkgYWZ0ZXIgLi4uCgpPSywgSSB0ZXN0ZWQgZjg5ZjU1NTgyNyBhbmQgZjg5ZjU1NTgyN34xLCBt
eSBvYnNlcnZhdGlvbnM6CgogICAgd2l0aCBmODlmNTU1ODI3fjE6CiAgICAgICAgLSBJJ20gTk9U
IHNlZWluZyB0aGUgYXF1aXJpbmcgcGNpZGV2c19sb2NrIG1lc3NhZ2UKICAgICAgICAtIHRoZSB1
c2IzIGNvbnRyb2xsZXIgaXMgYWxzbyB3b3JraW5nLgoKICAgIHdpdGggZjg5ZjU1NTgyNzoKICAg
ICAgICAtIEknbSBub3cgc2VlaW5nIHRoZSBhcXVpcmluZyBwY2lkZXZzX2xvY2sgbWVzc2FnZXMu
CiAgICAgICAgLSBidXQgSSdtIE5PVCBzZWVpbmcgdGhlbSAqb25jZSogcGVyIGJvb3RpbmcgZ3Vl
c3QsIGJ1dCBtdWx0aXBsZSB0aW1lcy4KICAgICAgICAtIHRoZSB1c2IzIGNvbnRyb2xsZXIgaXMg
c3RpbGwgd29ya2luZy4KCiAgICB3aXRoIHN0YWdpbmc6CiAgICAgICAgLSBTZWVpbmcgdGhlIGFx
dWlyaW5nIHBjaWRldnNfbG9jayBtZXNzYWdlcywgYnV0IG9ubHkgKm9uY2UqIHBlciBndWVzdCBi
b290LgogICAgICAgIC0gdGhlIHVzYjMgY29udHJvbGxlciBnb2VzIGhheXdpcmUgaW4gdGhlIGd1
ZXN0LgoKU28geW91IHNlZW0gdG8gYmUgcmlnaHQgYWJvdXQgYm90aCB0aGluZ3M6CiAgICAtIGY4
OWY1NTU4MjcgaXMgdGhlIGN1bHByaXQgZm9yIHRoZSBhcXVpcmluZyBwY2lkZXZzX2xvY2sgbWVz
c2FnZXMuIAogICAgICBBbHRob3VnaCBJIGdldCBsZXNzIG9mIHRoZW0gd2l0aCBjdXJyZW50IHN0
YWdpbmcsIHNvIHNvbWUgb3RoZXIgbGF0ZXIgcGF0Y2ggbXVzdCBoYXZlIGhhZCBzb21lIGluZmx1
ZW5jZQogICAgICBpbiByZWR1Y2luZyB0aGUgYW1vdW50LgoKICAgIC0gVGhlIHVzYjMgY29udHJv
bGxlciBtYWxmdW5jdGlvbmluZyBzZWVtcyBpbmRlZWQgdG8gYmUgYSBzZXBhcmF0ZSBpc3N1ZSAo
d2hpY2ggc2VlbXMgdW5mb3J0dW5hdGUsIAogICAgICBiZWNhdXNlIGEgYmlzZWN0IHNlZW1zIHRv
IGJlY29tZSBldmVuIG5hc3RpZXIgd2l0aCBhbGwgdGhlIGludGVydHdpbmVkIHBjaS1wYXNzdGhy
b3VnaCBpc3N1ZXMpLgogICAgICAKICAgICAgUGVyaGFwcyB0aGlzIG9uZSBpcyB0aGVuIHJlbGF0
ZWQgdG8gdGhlIG9ubHkgKm9uY2UqIG9jY3VyaW5nIG1lc3NhZ2U6IAogICAgICAgICAgKFhFTikg
WzIwMTktMTAtMzEgMjA6Mzk6MzAuNzQ2XSBBTUQtVmk6IElOVkFMSURfREVWX1JFUVVFU1QgMDAw
MDA4MDAgOGEwMDAwMDAgZjgwMDA4NDAgMDAwMDAwZmQKICAgICAKICAgICAgV2hpbGUgaW4gdGhl
IGd1ZXN0IGl0IGlzIGVuZGxlc3NseSByZXBlYXRpbmc6CiAgICAgICAgICBbICAyMzEuMzg1NTY2
XSB4aGNpX2hjZCAwMDAwOjAwOjA1LjA6IE1heCBudW1iZXIgb2YgZGV2aWNlcyB0aGlzIHhIQ0kg
aG9zdCBzdXBwb3J0cyBpcyAzMi4KICAgICAgICAgIFsgIDIzMS40MDczNTFdIHVzYiB1c2IxLXBv
cnQyOiBjb3VsZG4ndCBhbGxvY2F0ZSB1c2JfZGV2aWNlCgogICAgICBIb3BlZnVsbHkgdGhpcyBh
bHNvIGdpdmVzIHlvdSBhIGh1bmNoIGFzIHRvIHdoaWNoIGNvbW1pdHMgdG8gbG9vayBhdC4KCi0t
ClNhbmRlcgoKPj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSBYZW4gY2FsbCB0cmFj
ZToKPj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUuNzQ4XSAgICBbPGZmZmY4MmQwODAyNjU3
NDg+XSBSIGlvbW11X21hcC5jI3VwZGF0ZV9wYWdpbmdfbW9kZSsweDFmMi8weDNlYgo+PiAoWEVO
KSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhdICAgIFs8ZmZmZjgyZDA4MDI2NWRlZD5dIEYgYW1k
X2lvbW11X21hcF9wYWdlKzB4NzIvMHgxYzIKPj4gKFhFTikgWzIwMTktMTAtMzAgMjI6MDc6MDUu
NzQ4XSAgICBbPGZmZmY4MmQwODAyNTgzYjY+XSBGIGlvbW11X21hcCsweDk4LzB4MTdlCj4+IChY
RU4pIFsyMDE5LTEwLTMwIDIyOjA3OjA1Ljc0OF0gICAgWzxmZmZmODJkMDgwMjU4NmZiPl0gRiBp
b21tdV9sZWdhY3lfbWFwKzB4MjgvMHg3Mwo+PiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43
NDhdICAgIFs8ZmZmZjgyZDA4MDM0YTRhNj5dIEYgcDJtLXB0LmMjcDJtX3B0X3NldF9lbnRyeSsw
eDRkMy8weDg0NAo+PiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhdICAgIFs8ZmZmZjgy
ZDA4MDM0MmUxMz5dIEYgcDJtX3NldF9lbnRyeSsweDkxLzB4MTI4Cj4+IChYRU4pIFsyMDE5LTEw
LTMwIDIyOjA3OjA1Ljc0OF0gICAgWzxmZmZmODJkMDgwMzQzYzUyPl0gRiBndWVzdF9waHlzbWFw
X2FkZF9lbnRyeSsweDM5Zi8weDVhMwo+PiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhd
ICAgIFs8ZmZmZjgyZDA4MDM0M2Y4NT5dIEYgZ3Vlc3RfcGh5c21hcF9hZGRfcGFnZSsweDEyZi8w
eDEzOAo+PiAoWEVOKSBbMjAxOS0xMC0zMCAyMjowNzowNS43NDhdICAgIFs8ZmZmZjgyZDA4MDIy
MDFlZT5dIEYgbWVtb3J5LmMjcG9wdWxhdGVfcGh5c21hcCsweDJlMy8weDUwNQo+IAo+IC4uLiBE
b20wIGhhZCBwb3B1bGF0ZWQgdGhlIG5ldyBndWVzdCdzIHBoeXNtYXAuCj4gCj4gQW55d2F5LCBh
cyBvZGQgYXMgaXQgbWF5IHNlZW0gSSBndWVzcyB0aGVyZSdzIGxpdHRsZSBjaG9pY2UKPiBiZXNp
ZGVzIG1ha2luZyBwb3B1bGF0ZV9waHlzbWFwKCkgKGFuZCBsaWtlbHkgYSBmZXcgb3RoZXJzKQo+
IGFjcXVpcmUgdGhlIGxvY2suCj4gCj4gSmFuCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
