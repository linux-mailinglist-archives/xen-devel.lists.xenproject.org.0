Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4322410B26D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 16:29:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZzCc-000866-88; Wed, 27 Nov 2019 15:26:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZzCa-000861-TM
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 15:26:00 +0000
X-Inumbo-ID: 36d52cd2-112a-11ea-a3b8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36d52cd2-112a-11ea-a3b8-12813bfff9fa;
 Wed, 27 Nov 2019 15:25:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6EBEAEEC;
 Wed, 27 Nov 2019 15:25:58 +0000 (UTC)
To: "Durrant, Paul" <pdurrant@amazon.com>
References: <20191120120859.1846-1-pdurrant@amazon.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D60E9FD@SHSMSX104.ccr.corp.intel.com>
 <01af44ec07cf464cba555114555ed75f@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c65ea5d0-5017-2cce-6e54-5ff4e3d40401@suse.com>
Date: Wed, 27 Nov 2019 16:26:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <01af44ec07cf464cba555114555ed75f@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86 / iommu: set up a scratch page in the
 quarantine domain
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
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTEuMjAxOSAxNjoxOCwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOgo+PiAtLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBUaWFuLCBLZXZpbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+Cj4+IFNlbnQ6IDI1IE5vdmVtYmVyIDIwMTkgMDg6MjIKPj4gVG86IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPj4g
Q2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIKPj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1
IE1vbm7DqQo+PiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0hd
IHg4NiAvIGlvbW11OiBzZXQgdXAgYSBzY3JhdGNoIHBhZ2UgaW4gdGhlIHF1YXJhbnRpbmUKPj4g
ZG9tYWluCj4+Cj4+PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwZHVycmFudEBhbWF6b24u
Y29tXQo+Pj4gU2VudDogV2VkbmVzZGF5LCBOb3ZlbWJlciAyMCwgMjAxOSA4OjA5IFBNCj4+Pgo+
Pj4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IGlvbW11X29wIHRvIGZhY2lsaXRhdGUgYSBw
ZXItaW1wbGVtZW50YXRpb24KPj4+IHF1YXJhbnRpbmUgc2V0IHVwLCBhbmQgdGhlbiBmdXJ0aGVy
IGNvZGUgZm9yIHg4NiBpbXBsZW1lbnRhdGlvbnMKPj4+IChhbWQgYW5kIHZ0ZCkgdG8gc2V0IHVw
IGEgcmVhZC93cm90ZSBzY3JhdGNoIHBhZ2UgdG8gc2VydmUgYXMgdGhlCj4+IHNvdXJjZS8KPj4+
IHRhcmdldCBmb3IgYWxsIERNQSB3aGlsc3QgYSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gZG9tX2lv
Lgo+Pj4KPj4+IFRoZSByZWFzb24gZm9yIGRvaW5nIHRoaXMgaXMgdGhhdCBzb21lIGhhcmR3YXJl
IG1heSBjb250aW51ZSB0byByZS10cnkKPj4+IERNQSwgZGVzcGl0ZSBGTFIsIGluIHRoZSBldmVu
dCBvZiBhbiBlcnJvci4gSGF2aW5nIGEgc2NyYXRjaCBwYWdlIG1hcHBlZAo+Pj4gd2lsbCBhbGxv
dyBwZW5kaW5nIERNQSB0byBkcmFpbiBhbmQgdGh1cyBxdWllc2NlIHN1Y2ggYnVnZ3kgaGFyZHdh
cmUuCj4+Cj4+IHRoZW4gdGhlcmUgaXMgbm8gZGlhZ25vc3RpY3MgYXQgYWxsIHNpbmNlIGFsbCBm
YXVsdHMgYXJlIHF1aWVzY2VudCBub3cuLi4KPj4gd2h5IGRvIHdlIHdhbnQgdG8gc3VwcG9ydCBz
dWNoIGJ1Z2d5IGhhcmR3YXJlPyBJcyBpdCBiZXR0ZXIgdG8gbWFrZQo+PiBpdCBhbiBkZWZhdWx0
LW9mZiBvcHRpb24gc2luY2UgYnVnZ3kgaXMgc3VwcG9zZWQgdG8gbmljaGUgY2FzZT8KPiAKPiBJ
IGd1ZXNzIGl0IGNvdWxkIGJlIGEgY29tbWFuZCBsaW5lIG9wdGlvbi4uLiBwZXJoYXBzIG1ha2lu
ZyB0aGUgbmV3Cj4gJ2lvbW11PXF1YXJhbnRpbmUnIGJvb2xlYW4gaW50byBzb21ldGhpbmcgbW9y
ZSBjb21wbGV4LCBidXQgSSdtIG5vdAo+IHN1cmUgaXQncyByZWFsbHkgd29ydGggaXQuIFBlcmhh
cHMgYSBjb21waWxlIHRpbWUgb3B0aW9uIHdvdWxkIGJlCj4gYmV0dGVyPwoKWWV0IGFub3RoZXIg
b3B0aW9uOiBIb3cgYWJvdXQgaW5zdGFsbGluZyB0aGUgc2NyYXRjaCBwYWdlIG1hcHBpbmdzCm9u
bHkgYWZ0ZXIgYSAoaGFuZGZ1bCBvZikgSU9NTVUgZmF1bHRzPyBCdXQgb2YgY291cnNlIHRoZXJl
IHdhcyB0aGUKcmVsYXRlZCBlYXJsaWVyIHF1ZXN0aW9uIG9mIHdoZXRoZXIgaW5kZWVkIG91ciB0
dXJuaW5nIG9mZiBvZiBidXMKbWFzdGVyaW5nIGRvZXNuJ3QgYWxyZWFkeSBoZWxwIHNpbGVuY2lu
ZyB0aGUgZmF1bHRzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
