Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0BD1624EF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 11:49:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j40OQ-0005HE-IB; Tue, 18 Feb 2020 10:46:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LnEJ=4G=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j40OP-0005H9-Cd
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 10:46:17 +0000
X-Inumbo-ID: e385e2bc-523b-11ea-bc8e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e385e2bc-523b-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 10:46:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DE772B135;
 Tue, 18 Feb 2020 10:46:14 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
 <cec31639-00ce-8ef1-4a7e-1d85a92b820e@suse.com>
 <20200218101515.GQ4679@Air-de-Roger>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <14dcdbac-2337-14aa-768f-90c53d97dec8@suse.com>
Date: Tue, 18 Feb 2020 11:46:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218101515.GQ4679@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/6] x86: fixes/improvements for scratch
 cpumask
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDIuMjAgMTE6MTUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gT24gVHVlLCBGZWIg
MTgsIDIwMjAgYXQgMDg6NDA6NThBTSArMDEwMCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPj4gT24g
MTcuMDIuMjAgMTk6NDMsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IEhlbGxvLAo+Pj4KPj4+
IENvbW1pdDoKPj4+Cj4+PiA1NTAwZDI2NWEyYThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1
Cj4+PiB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4g
cG9zc2libGUKPj4+Cj4+PiBJbnRyb2R1Y2VkIGEgYm9ndXMgdXNhZ2Ugb2YgdGhlIHNjcmF0Y2gg
Y3B1bWFzazogaXQgd2FzIHVzZWQgaW4gYQo+Pj4gZnVuY3Rpb24gdGhhdCBjb3VsZCBiZSBjYWxs
ZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIHVzaW5nCj4+PiB0aGUgc2NyYXRj
aCBjcHVtYXNrIHRoZXJlIGlzIG5vdCBzYWZlLiBQYXRjaCAjNSBpcyBhIGZpeCBmb3IgdGhhdCB1
c2FnZSwKPj4+IHRvZ2V0aGVyIHdpdGggYWxzbyBwcmV2ZW50aW5nIHRoZSB1c2FnZSBvZiBhbnkg
cGVyLUNQVSB2YXJpYWJsZXMgd2hlbgo+Pj4gc2VuZF9JUElfbWFzayBpcyBjYWxsZWQgZnJvbSAj
TUMgb3IgI05NSSBjb250ZXh0LiBQcmV2aW91cyBwYXRjaGVzIGFyZQo+Pj4gcHJlcGFyYXRvcnkg
Y2hhbmdlcy4KPj4+Cj4+PiBQYXRjaCAjNiBhZGRzIHNvbWUgZGVidWcgaW5mcmFzdHJ1Y3R1cmUg
dG8gbWFrZSBzdXJlIHRoZSBzY3JhdGNoIGNwdW1hc2sKPj4+IGlzIHVzZWQgaW4gdGhlIHJpZ2h0
IGNvbnRleHQsIGFuZCBoZW5jZSBzaG91bGQgcHJldmVudCBmdXJ0aGVyIG1pc3N1c2VzLgo+Pgo+
PiBJIHdvbmRlciB3aGV0aGVyIGl0IHdvdWxkbid0IGJlIGJldHRlciB0byBoYXZlIGEgY29tbW9u
IHBlcmNwdSBzY3JhdGNoCj4+IGNwdW1hc2sgaGFuZGxpbmcgaW5zdGVhZCBvZiBpbnRyb2R1Y2lu
ZyBsb2NhbCBvbmVzIGFsbCBvdmVyIHRoZQo+PiBoeXBlcnZpc29yLgo+IAo+IEJ1dCB0aGUgc2Ny
YXRjaCBDUFUgbWFzayBhbHJlYWR5IGFjY29tcGxpc2hlcyB0aGlzLCBpdCdzIGEgc2luZ2xlCj4g
cGVyLUNQVSBtYXNrIGFsbG9jYXRlZCB3aGVuIHRoZSBDUFUgaXMgYnJvdWdodCB1cC4KClRoaXMg
b25lLCB5ZXMuIFRoZXJlIGFyZSBvdGhlcnMgd2hpY2ggYXJlIGp1c3QgZGVmaW5lZCBsaWtlOgoK
REVGSU5FX1BFUl9DUFUoY3B1bWFza190LCAuLi4pCgo+PiBTbyBiYXNpY2FsbHkgYW4gYXJyYXkg
b2YgcGVyY3B1IGNwdW1hc2tzIGFsbG9jYXRlZCB3aGVuIGJyaW5naW5nIHVwIGEKPj4gY3B1ICh0
aGlzIHNwYXJlcyBtZW1vcnkgYXMgdGhlIG1hc2tzIHdvdWxkbid0IG5lZWQgdG8gY292ZXIgTlJf
Q1BVUwo+PiBjcHVzKSwgYSBwZXJjcHUgY291bnRlciBvZiB0aGUgbmV4dCBmcmVlIGluZGV4IGFu
ZCBnZXRfIGFuZCBwdXRfCj4+IGZ1bmN0aW9ucyBhY3RpbmcgaW4gYSBsaWZvIG1hbm5lci4KPiAK
PiBTaXppbmcgdGhpcyBhcnJheSB3b3VsZCBiZSBjb21wbGljYXRlZCBJTU8sIGFuZCBpdCdzIHBv
c3NpYmxlIHRoYXQgYQo+IGZhaWx1cmUgdG8gZ2V0IGEgbWFzayBpbiBjZXJ0YWluIHBsYWNlcyBj
b3VsZCBsZWFkIHRvIGEgcGFuaWMuCgpUaGUgcXVlc3Rpb24gaXMgd2hldGhlciBhIHNpbGVudCBk
b3VibGUgdXNhZ2UgaXMgYmV0dGVyICh3aGljaCB5b3VyCnNlcmllcyBpcyBhbHJlYWR5IGFkZHJl
c3NpbmcgYXQgbGVhc3QgZm9yIHRoZSBzY3JhdGNoIGNwdW1hc2spLgoKPj4gVGhpcyB3b3VsZCBo
ZWxwIHJlbW92aW5nIGFsbCB0aGUgc3RpbGwgZXhpc3RpbmcgY3B1bWFza3Mgb24gdGhlIHN0YWNr
Cj4+IGFuZCBhbnkgaWxsZWdhbCBuZXN0aW5nIHdvdWxkIGJlIGF2b2lkZWQuIFRoZSBvbmx5IHJl
bWFpbmluZyBxdWVzdGlvbgo+PiB3b3VsZCBiZSB0aGUgc2l6ZSBvZiB0aGUgYXJyYXkuCj4+Cj4+
IFRob3VnaHRzPwo+IAo+IEknbSBtb3N0bHkgd29ycmllZCBhYm91dCB0aGUgc2l6ZSBvZiBzdWNo
IHN0YWNrLCBzaW5jZSB3ZSB3b3VsZCB0aGVuCj4gYWxsb3cgbmVzdGVkIGNhbGxzIHRvIHRoZSBn
ZXRfIGNwdW1hc2sgaGVscGVyLiBBbHNvIEknbSBub3Qgc3VyZQo+IHdoZXRoZXIgd2Ugc2hvdWxk
IHByZXZlbnQgdGhlIHVzYWdlIGluIGludGVycnVwdCBjb250ZXh0IHRoZW4sIGluCj4gb3JkZXIg
dG8gdHJ5IHRvIGxpbWl0IHRoZSBuZXN0aW5nIGFzIG11Y2ggYXMgcG9zc2libGUuCgpObywgZXhj
bHVkaW5nIGludGVycnVwdCBjb250ZXh0IHdvdWxkIGFkZCB0aGUgbmVlZCBmb3Igc3BlY2lhbApw
dXJwb3NlIG1hc2tzIGFnYWluLgoKPiBJIHRoaW5rIHRoaXMgc2VyaWVzIGlzIGEgbW92ZSBpbiB0
aGUgcmlnaHQgZGlyZWN0aW9uLCBhbmQgd2UgY2FuIGFkZAo+IHRoZSBwZXItQ1BVIHN0YWNrIGFm
dGVyd2FyZHMgKGFzIHRoZSBnZXRfL3B1dF8gaGVscGVycyB3aWxsIGFscmVhZHkgYmUKPiB0aGVy
ZSkuCgpZZXMsIEkgY29tcGxldGVseSBhZ3JlZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
