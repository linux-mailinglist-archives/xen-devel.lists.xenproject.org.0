Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEB310C6BE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:32:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaH4f-0000aQ-ED; Thu, 28 Nov 2019 10:31:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaH4d-0000aF-PQ
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:30:59 +0000
X-Inumbo-ID: 281e1726-11ca-11ea-a55d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 281e1726-11ca-11ea-a55d-bc764e2007e4;
 Thu, 28 Nov 2019 10:30:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D3F29AD46;
 Thu, 28 Nov 2019 10:30:53 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191127143711.4377-1-pdurrant@amazon.com>
 <31090dd0-a8e5-7716-40a6-0e72de7f7934@suse.com>
 <a644007e77374b90b5abf11a76b2331d@EX13D32EUC003.ant.amazon.com>
 <d581a826-0959-1e8e-f78f-65a0f10b4b65@suse.com>
 <bfdfac8d-8f80-7d79-ba8b-b781de1b310a@citrix.com>
 <e8a947346b084e0088608ddeca4bd52c@EX13D32EUC003.ant.amazon.com>
 <5d508521-6483-b7b8-e556-b3bf02f7d5eb@citrix.com>
 <9d3b3eba41e14930bf89923eabbd012b@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1619974-d9ca-8124-a521-5eab0a96f5d2@suse.com>
Date: Thu, 28 Nov 2019 11:31:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9d3b3eba41e14930bf89923eabbd012b@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] Rationalize max_grant_frames and
 max_maptrack_frames handling
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
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxMToyNiwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiBGcm9tOiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+IFNlbnQ6IDI3IE5vdmVtYmVy
IDIwMTkgMTY6NTIKPj4KPj4gT24gMTEvMjcvMTkgNDo0MyBQTSwgRHVycmFudCwgUGF1bCB3cm90
ZToKPj4+PiBGcm9tOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Cj4+
Pj4gU2VudDogMjcgTm92ZW1iZXIgMjAxOSAxNjozNAo+Pj4+Cj4+Pj4gVEJIIEknZCBiZSB0ZW1w
dGVkIHRvIGRlZmluZSBYRU5TT01FVEhJTkdfTUFYX0RFRkFVTFQgYXMgKHVuc2lnbmVkCj4+Pj4g
bG9uZykoLTEpIG9yIHNvbWV0aGluZywgYW5kIGV4cGxpY2l0bHkgY29tcGFyZSB0byB0aGF0LiAg
VGhhdCBsZWF2ZXMKPj4+PiBvcGVuIHRoZSBwb3NzaWJpbGl0eSBvZiBoYXZpbmcgbW9yZSBzZW50
aW5lbCB2YWx1ZXMgaWYgd2UgZGVjaWRlZCB3ZQo+Pj4+IHdhbnRlZCB0aGVtLgo+Pj4KPj4+IEkn
bSBleHRyZW1lbHkgY29uZnVzZWQgbm93LiBXaGF0IGRvIHlvdSB3YW50IG1lIHRvIGNvbXBhcmUg
YW5kIHdoZXJlPwo+Pj4KPj4+IEkgYXNzdW1lIHdlJ3JlIHRhbGtpbmcgYWJvdXQgdGhlIG9wdF9Y
WFggdmFsdWVzLiBBbSBJIHN1cHBvc2VkIHRvIHN0b3AKPj4+IElOVF9NQVggYmVpbmcgYXNzaWdu
ZWQgdG8gdGhlbT8gT3Igc2hvdWxkIEkgZGVmaW5lIGxvY2FsIHVuc2lnbmVkIHZhbHVlcwo+PiBm
b3IgbWF4X21hcHRyYWNrL2dyYW50X2ZyYW1lcyBhbmQgc2ltcGx5IGluaXRpYWxpemUgdGhlbSB0
byB0aGUgcGFzc2VkLWluCj4+IGFyZyAoaWYgPj0gMCkgb3IgdGhlIG9wdF9YWFggdmFsdWUgb3Ro
ZXJ3aXNlLgo+Pgo+PiBJbiB0aGlzIHZlcnNpb24gb2YgdGhlIHBhdGNoLCB5b3UgY2hhbmdlIHRo
ZSBkb21jdGwgYXJndW1lbnRzIGZyb20KPj4gdWludDMyX3QgdG8gaW50MzJfdC4gIEkgd291bGQg
bGVhdmUgdGhlbSB1aW50MzJfdCwgYW5kIGlmICgKPj4gbWF4X2dyYW50X2ZyYW1lcyA9PSBYRU5T
T01FVEhJTkdfTUFYX0RFRkFVTFQgKSBtYXhfZ3JhbnRfZnJhbWVzID0gb3B0XyZjLgo+Pgo+PiBU
aGVuIHRoZSBvbmx5IGludmFsaWQgdmFsdWUgd2UgaGF2ZSB0byB3b3JyeSBhYm91dCBpcyBjaGVj
a2luZyBmb3IKPj4gWEVOU09NRVRISU5HX01BWF9ERUZBVUxULgo+Pgo+PiBUaGlzIGlzIGEgc3Vn
Z2VzdGlvbiwgYW5kIEkgd291bGRuJ3QgYXJndWUgc3Ryb25nbHkgaWYgc29tZW9uZSB0aG91Z2h0
Cj4+IGl0IHdhcyBhIGJhZCBpZGVhLCBidXQgaXQgc2VlbXMgbGlrZSB0aGUgbW9zdCBzdHJhaWdo
dGZvcndhcmQgb3B0aW9uIHRvCj4+IG1lLgo+IAo+IEFGQUlDVCB0aGUgZGVmaW5pdGlvbiBvZiB0
aGF0IGludmFsaWQgdmFsdWUgaXMgZ29pbmcgdG8gYmUgbmVlZGVkIGJ5IGJvdGgKPiB0aGUgZ3Jh
bnQgdGFibGUgY29kZSBhbmQgdGhlIHVzZXItc3BhY2UgdG9vbHN0YWNrIGNvZGUgc28gSSBndWVz
cyB0aGUKPiBsb2dpY2FsIHBsYWNlIGZvciB0aGUgZGVmaW5pdGlvbiB3b3VsZCBiZSBhIHRvb2xz
LW9ubHkgc2VjdGlvbiBvZiB0aGUKPiBwdWJsaWMgZ3JhbnQgdGFibGUgaGVhZGVyPyBUQkggSSBw
cmVmZXIgdGhlIGlkZWEgb2YgYW55IG5lZ2F0aXZlIHZhbHVlCj4gYmVpbmcgZGVmYXVsdCB0aG91
Z2guCgpGV0lXIEkgYWdyZWUsIGFzIEkgY2FuJ3QgcmVhbGx5IHNlZSB3aGF0IG90aGVyIHB1cnBv
c2VzIHdlIG1pZ2h0IG5lZWQKc2VudGluZWwgdmFsdWVzIGZvciBkb3duIHRoZSByb2FkLgoKPiBB
cyBsb25nIGFzIHRoZSB4bC9saWJ4bCBwYXJ0cyBkb24ndCBhbGxvdyBhICpzcGVjaWZpZWQqIHZh
bHVlID4gSU5UX01BWAo+IHRoZW4gdGhhdCBzaG91bGQgYmUgZmluZSwgYWx0aG91Z2ggZm9yIHRo
ZSBmdWxsIHN0b3J5IGEgY3VzdG9tIHBhcnNlcgo+IGZvciB0aGUgY29tbWFuZCBsaW5lIHZhbHVl
cyBzaG91bGQgYWxzbyBiZSBhZGRlZCB0byBlbnN1cmUgdGhlIHNhbWUKPiBzZW1hbnRpY3MgdGhl
cmUuCgpSaWdodC4gV2hpbGUgZ29pbmcgYSBsaXR0bGUgZmFyLCBJIGNhbid0IHJpZ2h0IG5vdyBz
ZWUgZWFzeSBhbHRlcm5hdGl2ZXMKdG8gYSBjdXN0b20gcGFyc2VyLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
