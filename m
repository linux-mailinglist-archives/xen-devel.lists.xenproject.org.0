Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BFF14CCEB
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:01:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwooZ-0000aR-Pf; Wed, 29 Jan 2020 14:59:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwooY-0000aJ-5i
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 14:59:34 +0000
X-Inumbo-ID: f51d5350-42a7-11ea-88f1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f51d5350-42a7-11ea-88f1-12813bfff9fa;
 Wed, 29 Jan 2020 14:59:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CC6FFAC7C;
 Wed, 29 Jan 2020 14:59:31 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-2-liuwe@microsoft.com>
 <da7d04bd-b2cf-996b-df83-49d928040ae1@suse.com>
 <20200128151520.al3xp7yxntdpq5el@debian>
 <345b5392-2f89-0a37-bac8-e88b0714028c@suse.com>
 <20200129144248.w7dk6h5dxl75hpg4@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b32dbbf3-f685-29c5-86c3-9f52f2db6a63@suse.com>
Date: Wed, 29 Jan 2020 15:59:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200129144248.w7dk6h5dxl75hpg4@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/7] x86: provide executable fixmap
 facility
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
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDEuMjAyMCAxNTo0MiwgV2VpIExpdSB3cm90ZToKPiBPbiBUdWUsIEphbiAyOCwgMjAy
MCBhdCAwNDozODo0MlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjguMDEuMjAy
MCAxNjoxNSwgV2VpIExpdSB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDIzLCAyMDIwIGF0IDEyOjA0
OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDIyLjAxLjIwMjAgMjE6MjMs
IFdlaSBMaXUgd3JvdGU6Cj4+Pj4+IFRoaXMgYWxsb3dzIHVzIHRvIHNldCBhc2lkZSBzb21lIGFk
ZHJlc3Mgc3BhY2UgZm9yIGV4ZWN1dGFibGUgbWFwcGluZy4KPj4+Pj4gVGhpcyBmaXhlZCBtYXAg
cmFuZ2Ugc3RhcnRzIGZyb20gWEVOX1ZJUlRfRU5EIHNvIHRoYXQgaXQgaXMgd2l0aGluIHJlYWNo
Cj4+Pj4+IG9mIHRoZSAudGV4dCBzZWN0aW9uLgo+Pj4+Pgo+Pj4+PiBTaGlmdCB0aGUgcGVyY3B1
IHN0dWIgcmFuZ2UgYW5kIGxpdmVwYXRjaCByYW5nZSBhY2NvcmRpbmdseS4KPj4+Pgo+Pj4+IEht
bSwgdGhlIGxpdmVwYXRjaCByYW5nZSBnZXRzIHNocnVuaywgbm90IHNoaWZ0ZWQsIGJ1dCB5ZXMu
IElzIHRoZXJlCj4+Pj4gYSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkgeW91IG1vdmUgdGhlIHN0dWJz
IGFyZWEgZG93bj8gSXQgbG9va3MgYXMgaWYKPj4+PiB0aGUgcGF0Y2ggd291bGQgYmUgc21hbGxl
ciBvdmVyYWxsIGlmIHlvdSBkaWRuJ3QuIChQb3NzaWJseSBkb3duCj4+Pj4gdGhlIHJvYWQgdGhl
IHN0dWJzIGFyZWEgY291bGQgYmUgbWFkZSBwYXJ0IG9mIHRoZSBGSVhBRERSX1ggcmFuZ2UKPj4+
PiBhbnl3YXkuKQo+Pj4KPj4+IEkgdGhpbmsgaGF2aW5nIGEgd2VsbC1rbm93biBmaXhlZCBhZGRy
ZXNzIGlzIG1vcmUgdXNlZnVsIGZvciBkZWJ1Z2dpbmcuCj4+Pgo+Pj4gR29pbmcgdGhlIG90aGVy
IHdheSBhcm91bmQgd291bGQgbWVhbiB0aGUgaHlwZXJjYWxsIHBhZ2UgbG9jYXRpb24KPj4+IGJl
Y29tZXMgZGVwZW5kZW50IG9uIHRoZSBudW1iZXIgb2YgQ1BVcyBjb25maWd1cmVkLgo+Pgo+PiBE
ZXBlbmRpbmcgb24gaG93IGZ1dHVyZSBpbnNlcnRpb25zIGFyZSBkb25lIGludG8KPj4gZW51bSBm
aXhlZF9hZGRyZXNzZXNfeCwgdGhlIGFkZHJlc3MgYWxzbyB3b24ndCBiZSAid2VsbC1rbm93biBm
aXhlZCIuCj4gCj4gR29pbmcgYmFjayB0byB0aGlzLCBub3QgbW92aW5nIHN0dWJzIHdpbGwgbWFr
ZSB0aGUgY2hhbmdlIHRvCj4gYWxsb2Nfc3R1Yl9wYWdlIGJlY29tZSB1bm5lY2Vzc2FyeSAob25l
IGxpbmUpOyBvbiB0aGUgb3RoZXIgaGFuZCBpdAo+IG1ha2VzIEZJWF9YX0FERFJfU1RBUlQgYmVj
b21lIFhFTl9WSVJUX0VORCAtIE5SX0NQVVMgKiBQQUdFX1NJWkUgLQo+IFBBR0VfU0laRS4KPiAK
PiBBcmUgeW91IHJlYWxseSBjb25jZXJuZWQgYWJvdXQgdGhpcz8gSSBjYW4gbWFrZSB0aGUgY2hh
bmdlIGlmIHlvdSByZWFsbHkKPiB3YW50IHRoYXQsIGJ1dCBpdCBpcyBqdXN0IHdvcmsgd2l0aCBu
byBhcHBhcmVudCBiZW5lZml0LgoKSG1tLCBpbmRlZWQsIGl0J3MganVzdCBvbmUgbGluZS4gTm90
IHN1cmUgd2h5IEkgdGhvdWdodCB0aGVyZQp3b3VsZCBiZSBtb3JlIG9mIGFuIGVmZmVjdC4gTGVh
dmUgaXQgYXMgaXMsIGFuZCBzb3JyeSBmb3IgdGhlCm5vaXNlLgoKPj4+Pj4gLS0tIGEveGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9maXhtYXAuaAo+Pj4+PiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2Zp
eG1hcC5oCj4+Pj4+IEBAIC0xNSw2ICsxNSw5IEBACj4+Pj4+ICAjaW5jbHVkZSA8YXNtL3BhZ2Uu
aD4KPj4+Pj4gIAo+Pj4+PiAgI2RlZmluZSBGSVhBRERSX1RPUCAoVk1BUF9WSVJUX0VORCAtIFBB
R0VfU0laRSkKPj4+Pj4gKyNkZWZpbmUgRklYQUREUl9YX1RPUCAoWEVOX1ZJUlRfRU5EIC0gUEFH
RV9TSVpFKQo+Pj4+PiArLyogVGhpcyBjb25zdGFudCBpcyBkZXJpdmVkIGZyb20gZW51bSBmaXhl
ZF9hZGRyZXNzZXNfeCBiZWxvdyAqLwo+Pj4+PiArI2RlZmluZSBNQVhfRklYQUREUl9YX1NJWkUg
KDIgPDwgUEFHRV9TSElGVCkKPj4+Pgo+Pj4+IElmIHRoaXMgY2FuJ3QgYmUgcHJvcGVybHkgZGVy
aXZlZCwgdGhlbiBhIEJVSUxEX0JVR19PTigpIGlzIG5lZWRlZC4KPj4+PiBCdXQgZGlkbid0IHdl
IGRpc2N1c3Mgb24gaXJjIGFscmVhZHkgcG9zc2libGUgYXBwcm9hY2hlcyBvZiBob3cgdG8KPj4+
PiBkZXJpdmUgaXQgZnJvbSB0aGUgZW51bT8gRGlkIG5vbmUgb2YgdGhpcyB3b3JrPwo+Pj4KPj4+
IFRoZSBvbmx5IG9wdGlvbiBJIHJlbWVtYmVyIGRpc2N1c3Npbmcgd2FzIHRvIGRlZmluZSBtYWNy
b3MgaW5zdGVhZCBvZgo+Pj4gdXNpbmcgZW51bS4gSSBzYWlkIGF0IHRoZSB0aW1lIGF0IHdvdWxk
IG1ha2UgdXMgbG9zZSB0aGUgYWJpbGl0eSB0bwo+Pj4gZHluYW1pY2FsbHkgc2l6ZSB0aGlzIGFy
ZWEuCj4+Pgo+Pj4gSWYgdGhlcmUgYXJlIG90aGVyIHdheXMgdGhhdCBJIG1pc3NlZCwgbGV0IG1l
IGtub3cuCj4+Cj4+IEkgc2VlbSB0byByZWNhbGwgcmVjb21tZW5kaW5nIHRvIGV4cG9ydCBhYnNv
bHV0ZSBzeW1ib2xzIGZyb20KPj4gYXNzZW1ibHkgY29kZS4gVGhlIHF1ZXN0aW9uIGlzIGhvdyBl
YXNpbHkgdXNhYmxlIHRoZXkgd291bGQKPj4gYmUgZnJvbSBDLCBvciBob3cgY2x1bXN5IHRoZSBy
ZXN1bHRpbmcgY29kZSB3b3VsZCBsb29rLgo+IAo+IEV2ZW4gaWYgSSB1c2UgYWJzb2x1dGUgc3lt
Ym9sIEkgd291bGQgc3RpbGwgbmVlZCB0byBkZWZpbmUgYSBtYWNybyBmb3IKPiBpdC4gVGhlcmUg
aXMgbm8gd2F5IGFyb3VuZCBpdCwgYmVjYXVzZSBlbnVtIGNhbid0IGJlIHVzZWQgaW4gYXNtIG9y
Cj4gbGlua2VyIHNjcmlwdC4KCkknbSBhZnJhaWQgSSBkb24ndCB1bmRlcnN0YW5kLiBXaHkgYSBt
YWNybz8gVGhlIGFic29sdXRlIHN5bWJvbCB3b3VsZApiZSB0aGVyZSB0byBjb21tdW5pY2F0ZSB0
aGUgcmVsZXZhbnQgKGVudW0tZGVyaXZlZCkgdmFsdWUgdG8gdGhlCmxpbmtlciBzY3JpcHQuIEku
ZS4gd2l0aAoKZW51bSB7IGUwLCBlMSwgZTIgfTsKCmluIHNvbWUgQyBmaWxlCgphc20gKCAiLmVx
dSBHQkxfZTIsICVjMDsgLmdsb2JhbCBHQkxfZTIiIDo6ICJpIiAoZTIpICk7Cgp3aGljaCBJIHRo
ZW4gaG9wZSB3b3VsZCBhbGxvdyB5b3UgdG8gdXNlIEdCTF9lMiBpbiB0aGUgbGlua2VyCnNjcmlw
dCBBU1NFUlQoKS4KCj4gSSB3YW50IHRvIGtlZXAgdXNpbmcgZW51bSBiZWNhdXNlIHRoYXQgd291
bGQgYWxsb3cgdXMgdG8gc2l6ZSB0aGUgYXJlYQo+IGFjY29yZGluZyB0byBLY29uZmlnLgoKT2Yg
Y291cnNlLCBJIGZ1bGx5IGFncmVlIHdpdGggdGhpcyBnb2FsLgoKSmFuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
