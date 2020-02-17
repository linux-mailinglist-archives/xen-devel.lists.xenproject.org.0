Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11A161596
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 16:09:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3hzV-0004js-Gz; Mon, 17 Feb 2020 15:07:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ywWV=4F=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j3hzT-0004jl-3G
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 15:07:19 +0000
X-Inumbo-ID: 3026b9d4-5197-11ea-8006-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3026b9d4-5197-11ea-8006-12813bfff9fa;
 Mon, 17 Feb 2020 15:07:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D57AAF2C;
 Mon, 17 Feb 2020 15:07:17 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xenproject.org
References: <20200217072006.20211-1-jgross@suse.com>
 <20200217072006.20211-3-jgross@suse.com>
 <3f1b46dc-ba1d-301a-3a7b-f3480338f379@citrix.com>
 <a7a17e9d-dce5-0fff-9f75-9af69f173d5b@suse.com>
 <af2b3f49-77ef-1171-0901-5631b6404b5c@citrix.com>
 <a22149d0-7858-864d-fcdc-590d165dd9c3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <84b1512b-817c-8c37-350f-0b1fdbd33b6f@suse.com>
Date: Mon, 17 Feb 2020 16:07:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <a22149d0-7858-864d-fcdc-590d165dd9c3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] xen/rcu: don't use stop_machine_run()
 for rcu_barrier()
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAgMTU6MjMsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+IE9uIDE3LzAyLzIwMjAg
MTI6MzAsIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+PiBPbiAxNy8wMi8yMDIwIDEyOjI4LCBKw7xy
Z2VuIEdyb8OfIHdyb3RlOgo+Pj4gT24gMTcuMDIuMjAgMTM6MjYsIElnb3IgRHJ1emhpbmluIHdy
b3RlOgo+Pj4+IE9uIDE3LzAyLzIwMjAgMDc6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4+
IFRvZGF5IHJjdV9iYXJyaWVyKCkgaXMgY2FsbGluZyBzdG9wX21hY2hpbmVfcnVuKCkgdG8gc3lu
Y2hyb25pemUgYWxsCj4+Pj4+IHBoeXNpY2FsIGNwdXMgaW4gb3JkZXIgdG8gZW5zdXJlIGFsbCBw
ZW5kaW5nIHJjdSBjYWxscyBoYXZlIGZpbmlzaGVkCj4+Pj4+IHdoZW4gcmV0dXJuaW5nLgo+Pj4+
Pgo+Pj4+PiBBcyBzdG9wX21hY2hpbmVfcnVuKCkgaXMgdXNpbmcgdGFza2xldHMgdGhpcyByZXF1
aXJlcyBzY2hlZHVsaW5nIG9mCj4+Pj4+IGlkbGUgdmNwdXMgb24gYWxsIGNwdXMgaW1wb3Npbmcg
dGhlIG5lZWQgdG8gY2FsbCByY3VfYmFycmllcigpIG9uIGlkbGUKPj4+Pj4gY3B1cyBvbmx5IGlu
IGNhc2Ugb2YgY29yZSBzY2hlZHVsaW5nIGJlaW5nIGFjdGl2ZSwgYXMgb3RoZXJ3aXNlIGEKPj4+
Pj4gc2NoZWR1bGluZyBkZWFkbG9jayB3b3VsZCBvY2N1ci4KPj4+Pj4KPj4+Pj4gVGhlcmUgaXMg
bm8gbmVlZCBhdCBhbGwgdG8gZG8gdGhlIHN5bmNpbmcgb2YgdGhlIGNwdXMgaW4gdGFza2xldHMs
IGFzCj4+Pj4+IHJjdSBhY3Rpdml0eSBpcyBzdGFydGVkIGluIF9fZG9fc29mdGlycSgpIGNhbGxl
ZCB3aGVuZXZlciBzb2Z0aXJxCj4+Pj4+IGFjdGl2aXR5IGlzIGFsbG93ZWQuIFNvIHJjdV9iYXJy
aWVyKCkgY2FuIGVhc2lseSBiZSBtb2RpZmllZCB0byB1c2UKPj4+Pj4gc29mdGlycSBmb3Igc3lu
Y2hyb25pemF0aW9uIG9mIHRoZSBjcHVzIG5vIGxvbmdlciByZXF1aXJpbmcgYW55Cj4+Pj4+IHNj
aGVkdWxpbmcgYWN0aXZpdHkuCj4+Pj4+Cj4+Pj4+IEFzIHRoZXJlIGFscmVhZHkgaXMgYSByY3Ug
c29mdGlycSByZXVzZSB0aGF0IGZvciB0aGUgc3luY2hyb25pemF0aW9uLgo+Pj4+Pgo+Pj4+PiBG
aW5hbGx5IHN3aXRjaCByY3VfYmFycmllcigpIHRvIHJldHVybiB2b2lkIGFzIGl0IG5vdyBjYW4g
bmV2ZXIgZmFpbC4KPj4+Pj4KPj4+Pgo+Pj4+IFdvdWxkIHRoaXMgaW1wbGVtZW50YXRpb24gZ3Vh
cmFudGVlIHByb2dyZXNzIGFzIHByZXZpb3VzIGltcGxlbWVudGF0aW9uCj4+Pj4gZ3VhcmFudGVl
ZD8KPj4+Cj4+PiBZZXMuCj4+Cj4+IFRoYW5rcywgSSdsbCBwdXQgaXQgdG8gdGVzdCB0b2RheSB0
byBzZWUgaWYgaXQgc29sdmVzIG91ciB1c2UgY2FzZS4KPiAKPiBKdXN0IG1hbnVhbGx5IHRyaWVk
IGl0IC0gZ2l2ZXMgaW5maW5pdGUgKHVwIHRvIHN0YWNrIHNpemUpIHRyYWNlIGxpa2U6Cj4gCj4g
KFhFTikgWyAgICAxLjQ5NjUyMF0gICAgWzxmZmZmODJkMDgwMjJlNDM1Pl0gRiBzb2Z0aXJxLmMj
X19kb19zb2Z0aXJxKzB4ODUvMHg5MAo+IChYRU4pIFsgICAgMS40OTY1NjFdICAgIFs8ZmZmZjgy
ZDA4MDIyZTQ3NT5dIEYgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKzB4MzUvMHgzNwo+IChYRU4p
IFsgICAgMS40OTY2MDBdICAgIFs8ZmZmZjgyZDA4MDIyMTEwMT5dIEYgcmN1cGRhdGUuYyNyY3Vf
cHJvY2Vzc19jYWxsYmFja3MrMHgxZGYvMHgxZjYKPiAoWEVOKSBbICAgIDEuNDk2NjQzXSAgICBb
PGZmZmY4MmQwODAyMmU0MzU+XSBGIHNvZnRpcnEuYyNfX2RvX3NvZnRpcnErMHg4NS8weDkwCj4g
KFhFTikgWyAgICAxLjQ5NjY4NV0gICAgWzxmZmZmODJkMDgwMjJlNDc1Pl0gRiBwcm9jZXNzX3Bl
bmRpbmdfc29mdGlycXMrMHgzNS8weDM3Cj4gKFhFTikgWyAgICAxLjQ5NjcyNl0gICAgWzxmZmZm
ODJkMDgwMjIxMTAxPl0gRiByY3VwZGF0ZS5jI3JjdV9wcm9jZXNzX2NhbGxiYWNrcysweDFkZi8w
eDFmNgo+IChYRU4pIFsgICAgMS40OTY3NjZdICAgIFs8ZmZmZjgyZDA4MDIyZTQzNT5dIEYgc29m
dGlycS5jI19fZG9fc29mdGlycSsweDg1LzB4OTAKPiAoWEVOKSBbICAgIDEuNDk2ODA2XSAgICBb
PGZmZmY4MmQwODAyMmU0NzU+XSBGIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcysweDM1LzB4MzcK
PiAoWEVOKSBbICAgIDEuNDk2ODQ3XSAgICBbPGZmZmY4MmQwODAyMjExMDE+XSBGIHJjdXBkYXRl
LmMjcmN1X3Byb2Nlc3NfY2FsbGJhY2tzKzB4MWRmLzB4MWY2Cj4gKFhFTikgWyAgICAxLjQ5Njg4
N10gICAgWzxmZmZmODJkMDgwMjJlNDM1Pl0gRiBzb2Z0aXJxLmMjX19kb19zb2Z0aXJxKzB4ODUv
MHg5MAo+IChYRU4pIFsgICAgMS40OTY5MjddICAgIFs8ZmZmZjgyZDA4MDIyZTQ3NT5dIEYgcHJv
Y2Vzc19wZW5kaW5nX3NvZnRpcnFzKzB4MzUvMHgzNwoKSW50ZXJlc3RpbmcgSSBkaWRuJ3QgcnVu
IGludG8gdGhpcyBwcm9ibGVtLiBPYnZpb3VzbHkgSSBtYW5hZ2VkIHRvCmZvcmdldCBoYW5kbGlu
ZyB0aGUgY2FzZSBvZiByZWN1cnNpb24uCgoKSnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
