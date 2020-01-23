Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F8146922
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 14:31:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iucYK-0004rH-P5; Thu, 23 Jan 2020 13:29:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iucYJ-0004qW-3T
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 13:29:43 +0000
X-Inumbo-ID: 69485bb2-3de4-11ea-be20-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 69485bb2-3de4-11ea-be20-12813bfff9fa;
 Thu, 23 Jan 2020 13:29:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 30AA4AAC7;
 Thu, 23 Jan 2020 13:29:41 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
References: <20200123122141.1419-1-pdurrant@amazon.com>
 <20200123122141.1419-2-pdurrant@amazon.com>
 <7143d805-b9ae-1bd2-f357-84a3529464cc@suse.com>
 <d01a743d24624e7caf8d0cb19b7184e2@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64239d7c-3c83-dae8-bc79-a7c8b68e4b7c@suse.com>
Date: Thu, 23 Jan 2020 14:29:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d01a743d24624e7caf8d0cb19b7184e2@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn
 type-safe
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDEuMjAyMCAxNDowOSwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0
cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIEphbgo+PiBCZXVsaWNoCj4+IFNlbnQ6IDIz
IEphbnVhcnkgMjAyMCAxMjo0NQo+PiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9u
LmNvLnVrPgo+PiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+OyBXZWkgTGl1
IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3Blcgo+PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNv
bT47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGludGVsLmNvbT47IHhlbi0KPj4gZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmc7IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDEvM10geDg2IC8gdm14
OiBtYWtlIGFwaWNfYWNjZXNzX21mbgo+PiB0eXBlLXNhZmUKPj4KPj4gT24gMjMuMDEuMjAyMCAx
MzoyMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+Pj4gVXNlIG1mbl90IHJhdGhlciB0aGFuIHVuc2ln
bmVkIGxvbmcgYW5kIGNoYW5nZSBwcmV2aW91cyB0ZXN0cyBhZ2FpbnN0IDAKPj4gdG8KPj4+IHRl
c3RzIGFnYWluc3QgSU5WQUxJRF9NRk4gKGFsc28gaW50cm9kdWNpbmcgaW5pdGlhbGl6YXRpb24g
dG8gdGhhdAo+PiB2YWx1ZSkuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxw
ZHVycmFudEBhbWF6b24uY29tPgo+Pj4gQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5A
aW50ZWwuY29tPgo+Pj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KPj4KPj4gTm8sIHRoaXMgaXNuJ3Qgd2hhdCB0aGUgUi1iIHdhcyBnaXZlbiBmb3IuCj4gCj4g
T2gsIHNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2Q7IEkgdGhvdWdodCB0aGUgUi1iIHdhcyBnb29kIGFz
IGxvbmcgYXMgaWRlbXBvdGVuY3kgd2FzIGVuc3VyZWQuCj4gCj4+Cj4+PiB2MjoKPj4+ICAtIFNl
dCBhcGljX2FjY2Vzc19tZm4gdG8gSU5WQUxJRF9NRk4gaW4gdm14X2ZyZWVfdmxhcGljX21hcHBp
bmcoKSB0bwo+PiBtYWtlCj4+PiAgICB0aGUgZnVuY3Rpb24gaWRlbXBvdGVudAo+Pgo+PiBBbmRy
ZXcgaGFkIHN1Z2dlc3RlZCB0byB1c2UgMCBpbnN0ZWFkIG9mIElOVkFMSURfTUZOLiBJIGRvbid0
IHNlZQo+PiBob3cgeW91IGFjaGlldmVkIGlkZW1wb3RlbmN5IHdpdGggdGhpcyBhZGp1c3RtZW50
LiBBaXVpCj4+IHZteF9mcmVlX3ZsYXBpY19tYXBwaW5nKCkgaXMgc3VwcG9zZWQgdG8gYWxzbyBy
dW4gY29ycmVjdGx5IGlmCj4+IHZteF9hbGxvY192bGFwaWNfbWFwcGluZygpIHdhcyBuZXZlciBj
YWxsZWQuCj4gCj4gSXQgd2lsbC4gdm14X2RvbWFpbl9pbml0aWFsaXNlKCkgd2lsbCBzZXQgYXBp
Y19hY2Nlc3NfbWZuIHRvIElOVkFMSURfTUZOCj4gc28gdm14X2ZyZWVfdmxhcGljX21hcHBpbmco
KSB3aWxsIGRvIG5vdGhpbmcuCgpJJ20gc29ycnksIGl0IHdhcyBpbXBsaWVkIHRoYXQgaXQgYWxz
byBuZWVkcyB0byB3b3JrIGlmCnZteF9kb21haW5faW5pdGlhbGlzZSgpIHdhcyBuZXZlciBjYWxs
ZWQuIEFuZHJldydzIGdvYWwgYWZ0ZXIKYWxsIGlzLCBhaXVpLCB0byBiZSBhYmxlIHRvIGNhbGwg
ImRlc3Ryb3kiIGZ1bmN0aW9ucyBvbiBlcnJvcgpwYXRocyBpcnJlc3BlY3RpdmUgb2YgaG93IGZh
ciAiY3JlYXRlIiBoYWQgbWFuYWdlZCB0byBwcm9ncmVzcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
