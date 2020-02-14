Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796415D71D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 13:08:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2ZiL-0004oA-1T; Fri, 14 Feb 2020 12:04:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QOel=4C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2ZiI-0004nz-Pg
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 12:04:54 +0000
X-Inumbo-ID: 351aa8d2-4f22-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 351aa8d2-4f22-11ea-bc8e-bc764e2007e4;
 Fri, 14 Feb 2020 12:04:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1F78EAF36;
 Fri, 14 Feb 2020 12:04:52 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1354b838-e30f-10dd-edbe-064fb159ef7e@suse.com>
 <0542d37e-8128-b94c-19ac-8506bf0d1b8a@xen.org>
 <58391072-5196-62e7-a09b-bc45993b50ef@suse.com>
 <4d6e9d92-d0cf-6f4e-0fe1-8cba69c72300@xen.org>
 <17344a8c-b5f5-ee48-a89d-8d5c0070e81f@suse.com>
 <910276d6-a55d-87d2-cb92-055c53b9898c@xen.org>
 <979c25c4-09c2-755e-51f9-ca644358b096@suse.com>
 <87208524-5c30-48cf-fe7a-e5d77a26414b@xen.org>
 <ea8e70a3-83d2-0491-115c-fbf18bd1d705@suse.com>
 <22c23ea7-e8ee-d09f-6702-888e364f76f0@xen.org>
 <20200214104000.GA4679@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6845f17f-a1ff-7f80-bdd2-4e3ef20109c4@suse.com>
Date: Fri, 14 Feb 2020 13:04:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200214104000.GA4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] bitmap: import bitmap_{set/clear}
 from Linux 5.5
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDIuMjAyMCAxMTo0MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBNb24sIEZl
YiAxMCwgMjAyMCBhdCAxMjo1NDowNFBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+
Cj4+IE9uIDEwLzAyLzIwMjAgMTI6MzIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTAuMDIu
MjAyMCAxMzoyMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpLAo+Pj4+Cj4+Pj4gT24gMTAv
MDIvMjAyMCAxMTo1OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEwLjAyLjIwMjAgMTI6
MDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+IE9uIDEwLzAyLzIwMjAgMTA6MjgsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDEwLjAyLjIwMjAgMTA6NDUsIEp1bGllbiBHcmFsbCB3
cm90ZToKPj4+Pj4+Pj4gUGxlYXNlIHN1Z2dlc3QgYSBuZXcgbmFtZSBmb3IgQklUX1dPUkQoKSBh
bmQgd2UgY2FuIHJlcHVycG9zZSBpdC4gU28KPj4+Pj4+Pj4gZmFyLCBJIGhhdmUgbm8gaWRlYSBo
b3cgdG8gcmVuYW1lIGl0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gX0JJVF9XT1JEKCkgaWYgeW91L3dlIHdl
cmUgdG8gYWNjZXB0IHRoZSBuYW1lIHNwYWNlIHZpb2xhdGlvbiwgb3IKPj4+Pj4+PiBCSVRNQVBf
V09SRCgpPwo+Pj4+Pj4KPj4+Pj4+IEJJVE1BUF9XT1JEKCkgaXMgbWlzbGVhZGluZyBhcyBiaXRt
YXAgYXJlIHVzaW5nIHVuc2lnbmVkIGxvbmcuIFNvIG15Cj4+Pj4+PiBwcmVmZXJlbmNlIGlzIF9C
SVRfV09SRCgpLgo+Pj4+Pj4KPj4+Pj4+IEFub3RoZXIgYWx0ZXJuYXRpdmUgd291bGQgYmUgQVRP
TUlDX1dPUkQoKS4KPj4+Pj4KPj4+Pj4gRXhjZXB0IHRoYXQgdGhlcmUgYXJlIGFsc28gbm9uLWF0
b21pYyBiaXRtYXAgb3BlcmF0aW9ucywgSSBkb24ndCByZWFsbHkKPj4+Pj4gY2FyZSBhYm91dCB0
aGUgbmFtZSBhcyBsb25nIGFzIGl0J3Mgbm90IEJJVF9XT1JEKCkgKG9yIGFueXRoaW5nIGVsc2UK
Pj4+Pj4gdGhhdCdzIGxpa2VseSB0byBjb2xsaWRlIHdpdGggb3RoZXIgc3R1ZmYuCj4+Pj4KPj4+
PiBJIGFtIGFmcmFpZCB3ZSBhcmUgZGlzYWdyZWluZyBvbiB3aGF0IGlzIGNvbGxpZGluZyB3aXRo
IHdoYXQgaGVyZS4gVGhlCj4+Pj4gbmFtaW5nIG9uIEFybSBoYXMgYmVlbiBsaWtlIHRoYXQgZm9y
IHRoZSBwYXN0IGZldyB5ZWFycy4gV2hpbGUgdGhpcyBtYXkKPj4+PiBub3QgaGF2ZSBiZWVuIHRo
ZSBiZXN0IGNob2ljZSwgdGhpcyBpcyB5b3VyIHN1Z2dlc3Rpb24gY29sbGlkaW5nIHdpdGgKPj4+
PiB3aGF0IGlzIGV4aXN0aW5nLgo+Pj4KPj4+IEl0IGlzIGEgcGxhaW4gaW1wb3J0IGZyb20gTGlu
dXggd2hpY2ggaGFzIHR1cm5lZCBvdXQgaW1wb3NzaWJsZQo+Pj4gYmVjYXVzZSBvZiB0aGUgY2hh
bmdlIHRoYXQgd2FzIGRvbmUgYXQgc29tZSBwb2ludCB0byBBcm0gY29kZQo+Pj4gd2hpY2gsIEkg
Z3Vlc3MsIGFsc28gb3JpZ2luYWxseSBjYW1lIGZyb20gTGludXguIFRoZXJlJ3Mgbm8gbmV3Cj4+
PiBuYW1pbmcgSSd2ZSBiZWVuIHN1Z2dlc3RpbmcgaGVyZSBhdCBhbGwuCj4+Cj4+IFdlIG5ldmVy
IGNsYWltZWQgd2Ugd291bGQgYmUgZnVsbHkgY29tcGF0aWJsZSB3aXRoIExpbnV4IGFuZCBJIGRv
bid0IHRoaW5rCj4+IHdlIGNvdWxkIGV2ZXJ5IGNsYWltIGl0LiBQYXJ0aWN1bGFybHksIHRoZSBi
aXRvcCBvcGVyYXRpb25zIGFyZSBkaWZmZXJlbnQKPj4gZ2l2ZW4gTGludXggYml0b3BzIGFyZSBi
YXNlZCBvbiB1bnNpZ25lZCBsb25nLgo+Pgo+PiBUaGUgYml0b3AgZGlkIGluZGVlZCBjYW1lIGZy
b20gTGludXggb3JpZ2luYWxseSwgaG93ZXZlciB3ZSBoYWQgdG8gYWRhcHQKPj4gdGhlbSBiZWNh
dXNlIExpbnV4IEFybXY4IGJpdG9wIHdhcyBleHBlY3RpbmcgOC1ieXRlIGFsaWduZWQuIFRoaXMg
ZG9lcyBub3QKPj4gaG9sZCBvbiBYZW4uCj4+Cj4+Pgo+Pj4+IEkgYW0gbm90IGVudGlyZWx5IGZ1
c3NlZCBhYm91dCB0aGUgbmFtZXNwYWNlIHZpb2xhdGlvbiwgYWx0aG91Z2ggSSB0aGluawo+Pj4+
IHRoZSBuYW1lIGlzIHBvdGVudGlhbGx5IG1pc2xlYWRpbmcuIFlldCwgSSB3b3VsZCBiZSBoYXBw
eSB0byB1c2UKPj4+PiBfQklUX1dPUkQoKSBhcyB0aGlzIGlzIHRoZSBiZXN0IG9mIGl0IHNvIGZh
ci4KPj4+Pgo+Pj4+IFdoaWxlIHRoaXMgaXMgY29kZSBmYWxscyB1bmRlciBBcm0gbWFpbnRhaW5l
cnNoaXAsIEkgYW0gc3RpbGwgaGFwcHkgdG8KPj4+PiBjb25zaWRlciBvdGhlciBuYW1pbmcuIEJ1
dCBhdCB0aGlzIHBvaW50LCB5b3Ugc2hvdWxkIGJlIHRoZSBvbmUgc3VnZ2VzdGluZy4KPj4+Cj4+
PiBCSVRfVU5JVCgpIG9yIEJJVE9QX1VOSVQoKSBvciBCSVRPUF9XT1JEKCk/Cj4+Cj4+IEJJVE9Q
X1dPUkQoKS4KPiAKPiBTbyBJIGFzc3VtZSB5b3Ugd291bGQgbGlrZSBtZSB0byBpbXBvcnQgYml0
bWFwX3tzZXQvY2xlYXJ9IGFuZCB1c2UgaXQKPiBpbiB0aGUgeDJBUElDIE1TUiBwYXRjaD8KCldl
bGwsIGl0J3MgcmVhbGx5IHVwIHRvIHlvdS4gSSd2ZSBwdXQgdGhpcyBhcyBhbiBpdGVtIG9uIG15
IG93biB0b2RvCmxpc3QgYWxyZWFkeSwgYXNzdW1pbmcgdGhlcmUgbWF5IGJlIG1vcmUgcGxhY2Vz
IHdoZXJlIHRoZSB0d28gZnVuY3Rpb25zCm1pZ2h0IHR1cm4gb3V0IHVzZWZ1bC4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
