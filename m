Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D33D12F718
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 12:22:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inKyJ-0002X9-9u; Fri, 03 Jan 2020 11:18:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inKyI-0002X4-Gz
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 11:18:26 +0000
X-Inumbo-ID: bd26e4ee-2e1a-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bd26e4ee-2e1a-11ea-88e7-bc764e2007e4;
 Fri, 03 Jan 2020 11:18:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F6E6B02C;
 Fri,  3 Jan 2020 11:18:16 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-2-roger.pau@citrix.com>
 <311877a7-02ef-f3ab-7f24-9262de5431a1@citrix.com>
 <20191231121042.GH11756@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bfcd9625-1b6c-d16b-e68a-e46a26b66556@suse.com>
Date: Fri, 3 Jan 2020 12:18:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191231121042.GH11756@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hvm: improve performance of
 HVMOP_flush_tlbs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTIuMjAxOSAxMzoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIERl
YyAyNywgMjAxOSBhdCAwMjo1MjoxN1BNICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+PiBP
biAyNC8xMi8yMDE5IDEzOjI2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4+PiBUaGVyZSdzIG5v
IG5lZWQgdG8gY2FsbCBwYWdpbmdfdXBkYXRlX2NyMyB1bmxlc3MgQ1IzIHRyYXBwaW5nIGlzCj4+
PiBlbmFibGVkLCBhbmQgdGhhdCdzIG9ubHkgdGhlIGNhc2Ugd2hlbiB1c2luZyBzaGFkb3cgcGFn
aW5nIG9yIHdoZW4KPj4+IHJlcXVlc3RlZCBmb3IgaW50cm9zcGVjdGlvbiBwdXJwb3Nlcywgb3Ro
ZXJ3aXNlIHRoZXJlJ3Mgbm8gbmVlZCB0bwo+Pj4gcGF1c2UgYWxsIHRoZSB2Q1BVcyBvZiB0aGUg
ZG9tYWluIGluIG9yZGVyIHRvIHBlcmZvcm0gdGhlIGZsdXNoLgo+Pj4KPj4+IENoZWNrIHdoZXRo
ZXIgQ1IzIHRyYXBwaW5nIGlzIGN1cnJlbnRseSBpbiB1c2UgaW4gb3JkZXIgdG8gZGVjaWRlCj4+
PiB3aGV0aGVyIHRoZSB2Q1BVcyBzaG91bGQgYmUgcGF1c2VkLCBvdGhlcndpc2UganVzdCBwZXJm
b3JtIHRoZSBmbHVzaC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4KPj4KPj4gSSBhZ3JlZSB0aGF0IHRoZSBleGlzdGluZyBsb2dp
YyBwb29yLCBidXQgdGhpcyBkaXJlY3Rpb24gbG9va3MgdG8gYmUKPj4gZXZlbiBtb3JlIGZyYWdp
bGUuCj4+Cj4+IEluc3RlYWQsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGZvbGxvdyB0
aGUgRVBUIGludmFsaWRhdGlvbgo+PiBleGFtcGxlOyBtYXJrIGFsbCB2Y3B1cyBhcyBuZWVkaW5n
IGEgdGxiIGZsdXNoLCBhbmQgSVBJIHRoZSBkb21haW4gZGlydHkKPj4gbWFzaywgaGF2aW5nIHRo
ZSByZXR1cm4tdG8tZ3Vlc3QgcGF0aCBkbyB0aGUgZmx1c2hpbmcuCj4gCj4gQUZBSUNUIHRoZXJl
J3Mgbm8gbmVlZCB0byBjYWxsIHRoZSB0bGIgZmx1c2gsIHRoZSB2bWV4aXQvdm1lbnRyeQo+IGl0
c2VsZiB3aWxsIHBlcmZvcm0gdGhlIG5lY2Vzc2FyeSBmbHVzaGVzLCBzbyB0aGUgb25seSByZXF1
aXJlbWVudCBpcwo+IHRvIElQSSB0aGUgcENQVXMgaW4gb3JkZXIgdG8gZm9yY2UgYSB2bWV4aXQu
CgpUTEIgZmx1c2hpbmcgaXMgYXQgYmVzdCBjb25kaXRpb25hbCB1cG9uIFZNIGVudHJ5IC0gc2Vl
IHRoZSBjYWxsZXJzCm9mIGh2bV9hc2lkX2hhbmRsZV92bWVudGVyKCkuCgpKYW4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
