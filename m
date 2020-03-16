Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE67186783
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2020 10:10:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jDliM-00054Z-8g; Mon, 16 Mar 2020 09:07:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jDliK-00054U-Om
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2020 09:07:12 +0000
X-Inumbo-ID: 8578308c-6765-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8578308c-6765-11ea-a6c1-bc764e2007e4;
 Mon, 16 Mar 2020 09:07:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 855B3AE84;
 Mon, 16 Mar 2020 09:07:10 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60130f14-3fc5-e40d-fec6-2448fefa6fc4@suse.com>
 <8221cc7f-ad33-03da-5780-8a76fbdc404a@suse.com>
 <f10b1b9f-eeb1-11e9-0f64-b0557f6ac2f8@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <587987a7-5e28-36d7-ac15-b309b1964229@suse.com>
Date: Mon, 16 Mar 2020 10:07:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f10b1b9f-eeb1-11e9-0f64-b0557f6ac2f8@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/APIC: reduce rounding errors in
 calculations
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxNjo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMy8wMy8yMDIw
IDA5OjI2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gLS0tIGEveGVuL2FyY2gveDg2L2FwaWMuYwo+
PiArKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCj4+IEBAIC0xMjQ5LDE3ICsxMjQ5LDE2IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNhbGlicmF0ZV9BUElDX2Nsb2NrKHYKPj4gICAgICB0dDIgPSBhcGlj
X3JlYWQoQVBJQ19UTUNDVCk7Cj4+ICAgICAgdDIgPSByZHRzY19vcmRlcmVkKCk7Cj4+ICAKPj4g
LSAgICByZXN1bHQgPSAodHQxLXR0MikqQVBJQ19ESVZJU09SL0xPT1BTOwo+PiArICAgIGJ1c19m
cmVxID0gKHR0MSAtIHR0MikgKiBBUElDX0RJVklTT1IgKiBMT09QU19GUkFDOwo+PiAgCj4+IC0g
ICAgYXBpY19wcmludGsoQVBJQ19WRVJCT1NFLCAiLi4uLi4gQ1BVIGNsb2NrIHNwZWVkIGlzICVs
ZC4lMDRsZCBNSHouXG4iLAo+PiAtICAgICAgICAgICAgICAgICgobG9uZykodDIgLSB0MSkgLyBM
T09QUykgLyAoMTAwMDAwMCAvIEhaKSwKPj4gLSAgICAgICAgICAgICAgICAoKGxvbmcpKHQyIC0g
dDEpIC8gTE9PUFMpICUgKDEwMDAwMDAgLyBIWikpOwo+PiArICAgIGFwaWNfcHJpbnRrKEFQSUNf
VkVSQk9TRSwgIi4uLi4uIENQVSBjbG9jayBzcGVlZCBpcyAlbHUuJTA0bHUgTUh6LlxuIiwKPj4g
KyAgICAgICAgICAgICAgICAoKHVuc2lnbmVkIGxvbmcpKHQyIC0gdDEpICogTE9PUFNfRlJBQykg
LyAxMDAwMDAwLAo+PiArICAgICAgICAgICAgICAgICgodW5zaWduZWQgbG9uZykodDIgLSB0MSkg
KiBMT09QU19GUkFDIC8gMTAwKSAlIDEwMDAwKTsKPiAKPiBJZiBJJ20gbm90IG1pc3Rha2VuLCB0
aGlzIGV4cHJlc3Npb24gb25seSB3b3JrcyBiZWNhdXNlIG9mIHRoZSBMLT5SCj4gYXNzb2NpYXRp
dml0eSAoZ2l2ZW4gdGhlIHNhbWUgcHJlY2VkZW5jZSBvZiAqIGFuZCAvKSBncm91cGluZyBpdCBh
cwo+ICgodDItdDEpICogMTApwqAgLyAxMDAgYXMgb3Bwb3NlZCB0byAodDItdDEpICogKDEwIC8g
MTAwKSwgd2hlcmUgdGhlCj4gbGF0dGVyIHdvdWxkIHRydW5jYXRlIHRvIDAuwqAgSSB0aGluayBz
b21lIGV4dHJhIGJyYWNrZXRzIHdvdWxkIGhlbHAgZm9yCj4gY2xhcml0eS4KCldlbGwsIHllcywg
ZG9uZS4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGhhdmUgYmVlbiB0byBkcm9wIG1vcmUgb2YKdGhl
bS4KCj4gVGhhdCBzYWlkLCB3aGF0IGlzIHdyb25nIHdpdGgga2VlcGluZyB0aGUgb3JpZ2luYWwg
Zm9ybT8KClRoZSBzYW1lIGFzIGVsc2V3aGVyZSBpbiB0aGlzIHBhdGNoLCBhbmQgYXMgc2FpZCBp
biB0aGUgZGVzY3JpcHRpb24gLQp0aGVyZSdzIGJlZW4gcG9pbnRsZXNzIHJvdW5kaW5nIChyZWFs
bHk6IHRydW5jYXRpb24pIGVycm9ycyBoZXJlIGZyb20KZmlyc3QgZGl2aWRpbmcgYnkgSFogKHRv
IGJlIHByZWNpc2U6IGJ5IEhaLzEwKSBhbmQgdGhlbiBlZmZlY3RpdmVseQptdWx0aXBseWluZyBi
eSB0aGlzIHZhbHVlIGFnYWluLiBUaGUgb3JpZ2luYWwgZGl2aXNpb24tb25seSBhcmd1bWVudAp3
b3VsZCBub3QgYmUgYWZmZWN0ZWQgYWZhaWN0LCBidXQgdGhlIHJlbWFpbmRlciBvbmUgd291bGQu
IEZ1cnRoZXJtb3JlCkknZCBsaWtlIHRvIGF2b2lkIGhhdmluZyB0byByZXRhaW4gdGhlIExPT1BT
IGNvbnN0YW50LgoKPsKgIEkgcmVhbGlzZSB0aGlzCj4gaXMgb25seSBmb3IgYSBwcmludGsoKSwg
YnV0IHRoZSBkaXYgaW5zdHJ1Y3Rpb24gY2FuJ3QgYmUgc2hhcmVkIGJldHdlZW4KPiB0aGUgdHdv
IGhhbHZlcy4KClRoaXMgYmVpbmcgYW4gX19pbml0IGZ1bmN0aW9uLCBJIGRvbid0IHRoaW5rIHRo
ZSBudW1iZXIgb2YgZGl2aXNpb25zCmlzIGEgY29uY2VybiBoZXJlLCB0aGUgbW9yZSB0aGF0IHRo
ZSBjb21waWxlciAtIHdpdGggdGhlIGRpdmlzb3IKYmVpbmcgYSBjb25zdGFudCAtIHdpbGwgY29u
dmVydCB0aGVtIHRvIG11bHRpcGxpY2F0aW9ucyBhbnl3YXkuCgpKYW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
