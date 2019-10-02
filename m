Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B83C495B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 10:21:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFZq6-0000AK-Mf; Wed, 02 Oct 2019 08:18:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFZq5-0000AF-4t
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 08:18:25 +0000
X-Inumbo-ID: 32ff8e04-e4ed-11e9-bf31-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 32ff8e04-e4ed-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 08:18:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 314321000;
 Wed,  2 Oct 2019 01:18:22 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E0423F706;
 Wed,  2 Oct 2019 01:18:19 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190805132955.1630-1-julien.grall@arm.com>
 <20190805132955.1630-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1910011825490.26319@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a23f608d-2756-3ef5-7a74-ab81929d0858@arm.com>
Date: Wed, 2 Oct 2019 09:18:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910011825490.26319@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen/console: Don't treat NUL
 character as the end of the buffer
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzIvMTkgMjoyNSBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIE1vbiwgNSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBBZnRlciB1cGdy
YWRpbmcgRGViaWFuIHRvIEJ1c3RlciwgSSBoYXZlIGJlZ2FuIHRvIG5vdGljZSBjb25zb2xlCj4+
IG1hbmdsaW5nIHdoZW4gdXNpbmcgenNoIGluIERvbTAuIFRoaXMgaXMgaGFwcGVubmluZyBiZWNh
dXNlIG91dHB1dCBzZW50IGJ5Cj4+IHpzaCB0byB0aGUgY29uc29sZSBtYXkgY29udGFpbiBOVUxz
IGluIHRoZSBtaWRkbGUgb2YgdGhlIGJ1ZmZlci5IaSwKPj4KPj4gVGhlIGFjdHVhbCBpbXBsZW1l
bnRhdGlvbiBvZiBDT05TT0xFSU9fd3JpdGUgY29uc2lkZXJzIHRoYXQgYSBidWZmZXIKPj4gYWx3
YXlzIHRlcm1pbmF0ZSB3aXRoIGEgTlVMIGFuZCB0aGVyZWZvcmUgd2lsbCBpZ25vcmUgYW55dGhp
bmcgYWZ0ZXIgaXQuCj4+Cj4+IEluIGdlbmVyYWwsIE5VTHMgYXJlIHBlcmZlY3RseSBsZWdpdGlt
YXRlIGluIHRlcm1pbmFsIHN0cmVhbXMuIEZvcgo+PiBpbnN0YW5jZSwgdGhpcyBjb3VsZCBiZSB1
c2VkIGZvciBwYWRkaW5nIHNsb3cgdGVybWluYWxzLiBTZWUgdGVybWluZm8oNSkKPj4gc2VjdGlv
biBgRGVsYXlzIGFuZCBQYWRkaW5nYCwgb3Igc2VhcmNoIGZvciB0aGUgcGNyZSAnXGJwYWQnLgo+
Pgo+PiBPdGhlciB1c2UgY2FzZXMgaW5jbHVkZXMgdXNpbmcgdGhlIGNvbnNvbGUgZm9yIGR1bXBp
bmcgbm9uLWh1bWFuCj4+IHJlYWRhYmxlIGluZm9ybWF0aW9uIChlLmcgZGVidWdnZXIsIGZpbGUg
aWYgbm8gbmV0d29yay4uLikuIFdpdGggdGhlCj4+IGN1cnJlbnQgYmVoYXZpb3IsIHRoZSByZXN1
bHRpbmcgc3RyZWFtIHdpbGwgZW5kIHVwIHRvIGJlIGNvcnJ1cHRlZC4KPj4KPj4gVGhlIGRvY3Vt
ZW50YXRpb24gZm9yIENPTlNPTEVJT193cml0ZSBpcyBwcmV0dHkgbGltaXRlZCAodG8gbm90IHNh
eQo+PiBpbmV4aXN0ZW50KS4gRnJvbSB0aGUgZGVjbGFyYXRpb24sIHRoZSBoeXBlcmNhbGwgdGFr
ZXMgYSBidWZmZXIgYW5kIHNpemUuCj4+IFNvIHRoaXMgY291bGQgbGVhZCB0byB0aGluayB0aGUg
TlVMIGNoYXJhY3RlciBpcyBhbGxvd2VkIGluIHRoZSBtaWRkbGUgb2YKPj4gdGhlIGJ1ZmZlci4K
Pj4KPj4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBjb25zb2xlIEFQSSB0byBwYXNzIHRoZSBzaXpl
IGFsb25nIHRoZSBidWZmZXIKPj4gZG93biBzbyB3ZSBjYW4gcmVtb3ZlIHRoZSByZWxpYW5jZSBv
biBidWZmZXIgdGVybWluYXRpbmcgYnkgYSBOVUwKPj4gY2hhcmFjdGVyLgo+Pgo+PiBTaWduZWQt
b2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+Pgo+PiAtLS0KPj4K
Pj4gVGhpcyBwYXRjaCB3YXMgb3JpZ2luYWxseSBzZW50IHN0YW5kYWxvbmUgWzFdLiBCdXQgdGhl
IHNlcmllcyBncm93cyB0bwo+PiBpbmNsdWRlIGFub3RoZXIgYnVnIGZvdW5kIGluIHRoZSBjb25z
b2xlIGNvZGUgYW5kIGRvY3VtZW50YXRpb24uCj4+Cj4+IENuaGFuZ2VzIGluIHYyOgo+PiAgICAg
IC0gU3dpdGNoIGZyb20gdW5zaWduZWQgaW50IHRvIHNpemVfdC4gU28gdHJ1bmNhdGlvbiBpcyBh
dm9pZGVkLiBXZQo+PiAgICAgIGNhbiBkZWNpZGUgd2hldGhlciB3ZSB3YW50IGV4cGxpY2l0IHRy
dW5jYXRpb24gbGF0ZXIgb24uCj4+ICAgICAgLSBSZW1vdmUgdW5lY2Vzc2FyeSBsZWFkaW5nIE5V
TCBhZGRlZCBpbiBkdW1wX2NvbnNvbGVfcmluZ19rZXkKPj4gICAgICAtIFJlbW92ZSB1bmVjZXNz
YXJ5IGRlY29yYXRpb24gaW4gc2VyY29uX3B1dHMKPj4gICAgICAtIEZpeCBsb29wIGluIGxmYl9z
Y3JvbGxfcHV0cwo+PiAgICAgIC0gdXNlIHdoaWxlKCkgcmF0aGVyIHRoYW4gZG8ge30gd2hpbGUo
KQo+Pgo+PiBDaGFuZ2Ugc2luY2UgdGhlIHN0YW5kYWxvbmUgdmVyc2lvbjoKPj4gICAgICAtIEZp
eCBlYXJseSBwcmludGsgb24gQXJtCj4+ICAgICAgLSBGaXggZ2Ric3R1Ygo+PiAgICAgIC0gUmVt
b3ZlIHVuZWNlc3NhcnkgbGVhZGluZyBOVUwgY2hhcmFjdGVyIGFkZGVkIGJ5IFhlbgo+PiAgICAg
IC0gSGFuZGxlIERvbVUgY29uc29sZQo+PiAgICAgIC0gUmV3b3JrIHRoZSBjb21taXQgbWVzc2Fn
ZQo+Pgo+PiBCZWxvdyBhIHNtYWxsIEMgcHJvZ3JhbSB0byByZXBybyB0aGUgYnVnIG9uIFhlbjoK
Pj4KPj4gaW50IG1haW4odm9pZCkKPj4gewo+PiAgICAgIHdyaXRlKDEsCj4+ICAgICAgICAgICAg
IlxyXDMzWzBtXDBcMFwwXDBcMFwwXDBcMFwzM1syN21cMzNbMjRtXDMzW2pcMzNbMzJtanVsaWVu
XDMzWzMxbUBcMzNbMDBtXDMzWzM2bWp1bm8yLWp1bGllbmc6flwzM1szN20+IiwKPj4gICAgICAg
ICAgICA3NSk7Cj4+ICAgICAgd3JpdGUoMSwKPj4gICAgICAgICAgICAiXDMzW0tcMzNbMzJDXDMz
WzAxOzMzbS0tanVubzItanVsaWVuZy0xMzo0NC0tXDMzWzAwbVwzM1szN21cMzNbNTVEIiwKPj4g
ICAgICAgICAgICA1NCk7Cj4+ICAgICAgd3JpdGUoMSwgIlwzM1s/MjAwNGgiLCA4KTsKPj4KPj4g
ICAgICByZXR1cm4gMDsKPj4gfQo+Pgo+PiBXaXRob3V0IHRoaXMgcGF0Y2gsIHRoZSBvbmx5IC0t
anVubzItanVsaWVuZy0xMzo0NC0tIHdpbGwgYmUgcHJpbnRlZCBpbgo+PiB5ZWxsb3cuCj4+Cj4+
IFRoaXMgcGF0Y2ggd2FzIHRlc3RlZCBvbiBBcm0gdXNpbmcgc2VyaWFsIGNvbnNvbGUuIEkgYW0g
bm90IGVudGlyZWx5Cj4+IHN1cmUgd2hldGhlciB0aGUgdmlkZW8gYW5kIFBWIGNvbnNvbGUgaXMg
Y29ycmVjdC4gSSB3b3VsZCBhcHByZWNpYXRlIGhlbHAKPj4gZm9yIHRlc3RpbmcgaGVyZS4KPj4K
Pj4gWzFdIGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2
ZWwvMjAxOS0wMi9tc2cwMTkzMi5odG1sCj4gCj4gQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KClRoYW5rIHlvdSBmb3IgdGhlIGFja2VkLWJ5LiBB
bHRob3VnaCwgdGhpcyB3YXMgYWxyZWFkeSBtZXJnZWQgMiBtb250aHMgYWdvLgoKQ2hlZXJzLAoK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
