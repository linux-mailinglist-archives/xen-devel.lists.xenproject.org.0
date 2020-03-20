Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B014318CEB7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 14:22:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFHZ6-0001Lb-HN; Fri, 20 Mar 2020 13:19:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jFHZ4-0001LT-Ox
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 13:19:54 +0000
X-Inumbo-ID: 7c2395ee-6aad-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c2395ee-6aad-11ea-a6c1-bc764e2007e4;
 Fri, 20 Mar 2020 13:19:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 03D13ABD1;
 Fri, 20 Mar 2020 13:19:53 +0000 (UTC)
To: Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <54040784-84b2-e888-68f1-af0fa41835f7@suse.com>
Date: Fri, 20 Mar 2020 14:19:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDMuMjAyMCAxMDoxMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIwLzAzLzIwMjAg
MDk6MDEsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0
IDA4OjIxOjE5QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gT24gMTkuMDMuMjAyMCAy
MDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IE9uIDE5LzAzLzIwMjAgMTg6NDMsIFJvZ2Vy
IFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0
UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+Pj4+IE9uIDE5LzAzLzIwMjAgMTc6Mzgs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4+Pj4+Pj4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQg
MDQ6MjE6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+IMKgwqAgPj4gV2h5
IGNhbid0IHlvdSBrZWVwIGZsdXNoX3RsYl9tYXNrKCkgaGVyZT8KPj4+Pj4+Pgo+Pj4+Pj4+IEJl
Y2F1c2UgZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFw
LCBhbmQKPj4+Pj4+PiBjaGFuZ2VzIHRvIHRoZSBwaHltYXAgcmVxdWlyZSBhbiBBU0lEIGZsdXNo
IG9uIEFNRCBoYXJkd2FyZS4KPj4+Pj4+Cj4+Pj4+PiBJIGFtIGFmcmFpZCB0aGlzIGRvZXMgbm90
IHlldCBleHBsYWluIG1lIHdoeSBmbHVzaF90bGJfbWFzaygpIGNvdWxkIG5vdCBiZQo+Pj4+Pj4g
dXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBBTUQgaGFyZHdhcmUuCj4+Pj4+Cj4+Pj4+
IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUg
QVNJRHMgb24KPj4+Pj4gZXZlcnkgVExCIGZsdXNoLgo+Pj4+Pgo+Pj4+PiBmbHVzaF90bGJfbWFz
ayBpcyB0b28gd2lkZWx5IHVzZWQgb24geDg2IGluIHBsYWNlcyB3aGVyZSB0aGVyZSdzIG5vCj4+
Pj4+IG5lZWQgdG8gZmx1c2ggdGhlIEFTSURzLiBUaGlzIHByZXZlbnRzIHVzaW5nIGFzc2lzdGVk
IGZsdXNoZXMgKGJ5IEwwKQo+Pj4+PiB3aGVuIHJ1bm5pbmcgbmVzdGVkLCBzaW5jZSB0aG9zZSBh
c3Npc3RlZCBmbHVzaGVzIHBlcmZvcm1lZCBieSBMMAo+Pj4+PiBkb24ndCBmbHVzaCB0aGUgTDIg
Z3Vlc3RzIFRMQnMuCj4+Pj4+Cj4+Pj4+IEkgY291bGQga2VlcCBjdXJyZW50IGJlaGF2aW9yIGFu
ZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNvIGZsdXNoaW5nIHRoZQo+Pj4+PiBBU0lEcywgYnV0
IHRoYXQgc2VlbXMgd3JvbmcgYXMgdGhlIGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBp
bgo+Pj4+PiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBpdCBhbHNvIGZsdXNoZXMgdGhlIGluLWd1
ZXN0IFRMQnMgZm9yIEhWTS4KPj4+Pgo+Pj4+IEkgYWdyZWUgdGhlIG5hbWUgaXMgY29uZnVzaW5n
LCBJIGhhZCB0byBsb29rIGF0IHRoZSBpbXBsZW1lbnRhdGlvbiB0byB1bmRlcnN0YW5kIHdoYXQg
aXQgZG9lcy4KPj4+Pgo+Pj4+IEhvdyBhYm91dCByZW5hbWluZyAob3IgaW50cm9kdWNpbmcpIHRo
ZSBmdW5jdGlvbiB0byBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrKCkgb3IgZmx1c2hfdGxiX2Fs
bF9ndWVzdHNfY3B1bWFzaygpKSA/Cj4+Pgo+Pj4gQW5kIHRoaXMgd291bGQgdGhlbiBmbHVzaCBf
b25seV8gZ3Vlc3QgVExCcz8KPj4KPj4gTm8sIEkgdGhpbmsgZnJvbSBKdWxpZW4ncyBwcm9wb3Nh
bCAoaWYgSSB1bmRlcnN0b29kIGl0IGNvcnJlY3RseSkKPj4gZmx1c2hfdGxiX2FsbF9ndWVzdHNf
bWFzayB3b3VsZCBkbyB3aGF0IGZsdXNoX3RsYl9tYXNrIGN1cnJlbnRseSBkb2VzCj4+IHByZXZp
b3VzIHRvIHRoaXMgcGF0Y2ggKGZsdXNoIFhlbidzIFRMQnMgKyBIVk0gQVNJRHMpLgo+IAo+IEl0
IGxvb2tzIGxpa2UgdGhlcmUgbWlnaHQgYmUgY29uZnVzaW9uIG9uIHdoYXQgImd1ZXN0IFRMQnMi
IG1lYW5zLiBJbiBteSB2aWV3IHRoaXMgbWVhbnMgYW55IFRMQnMgYXNzb2NpYXRlZCBkaXJlY3Rs
eSBvciBpbmRpcmVjdGx5IHdpdGggdGhlIGd1ZXN0LiBPbiBBcm0sIHRoaXMgd291bGQgYmUgbnVr
ZToKPiDCoMKgIC0gZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGd1ZXN0IHBoeXNpY2FsIGFkZHJl
c3MgVExCIGVudHJ5Cj4gwqDCoCAtIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgLT4gaG9zdCBwaHlz
aWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+IMKgwqAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4g
aG9zdCBwaHlzaWNhbCBhZGRyZXNzIFRMQiBlbnRyeQo+IAo+IEkgd291bGQgYXNzdW1lIHlvdSB3
YW50IHNvbWV0aGluZyBzaW1pbGFyIG9uIHg4NiwgcmlnaHQ/CgpJIGRvbid0IHRoaW5rIHdlJ2Qg
d2FudCB0aGUgbWlkZGxlIG9mIHRoZSB0aHJlZSBpdGVtcyB5b3UgbGlzdCwKYnV0IEkgYWxzbyBk
b24ndCBzZWUgaG93IHRoaXMgd291bGQgYmUgcmVsZXZhbnQgaGVyZSAtIGZsdXNoaW5nCnRoYXQg
aXMgYSBwMm0gb3BlcmF0aW9uLCBub3Qgb25lIGFmZmVjdGluZyBpbi1ndWVzdCB0cmFuc2xhdGlv
bnMuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
