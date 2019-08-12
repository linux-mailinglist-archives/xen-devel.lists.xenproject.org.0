Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122D8A1DE
	for <lists+xen-devel@lfdr.de>; Mon, 12 Aug 2019 17:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxBoz-0002K0-Eu; Mon, 12 Aug 2019 15:01:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gta3=WI=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxBox-0002Jv-Nz
 for xen-devel@lists.xenproject.org; Mon, 12 Aug 2019 15:01:15 +0000
X-Inumbo-ID: 071bb069-bd12-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 071bb069-bd12-11e9-8980-bc764e045a96;
 Mon, 12 Aug 2019 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565622074;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=A12bmIoP7Rfwg+uaeHVuxfUqZUSwMJNi2U5EGRyfkuA=;
 b=GlyTKa/JE9IaRt6viDbHqAyjawvw+Y8X239xXSY+MJqu+zolY3g2BWvW
 +gdLFRvZbkFCvJ3EPUc2bcvKpYxjAqsUmo9CoBbWRyGFNHMOBpPozuz+l
 WW5zB1kUz5OCFVJ1PBzbvT71MhY1e8bl3JuyJpp5jYqybv+/0NHso4QUg E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4sPspH3ViMwv0P8lq7oJ7JIXqSDhZucWhhbEFLxx1GzQKVgaVJ+triS/3v+FjwijiGnWCxOieO
 3RHub0yaGCmCWlnYwYEyazYSyhA/+xHELsjeEJXC/20dEJCuxxJV+EBNPg7/9MfkQf6rvRMGba
 pZgy2Bzhy7BC5aK5gZIqSwmqbV7b9Uj7FkClNQErYmFZ5vMy6HUPAo15EWwbLHkE6W1wE7ZdcL
 Io4lI49rZ+v9vFSpkAj9qJmXcAbFGVUW+8EYDZFy8Y1nlsUf+HThQz9nGJl0urKAIYQtz0YeXi
 7K8=
X-SBRS: 2.7
X-MesageID: 4159503
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,377,1559534400"; 
   d="scan'208";a="4159503"
To: George Dunlap <george.dunlap@citrix.com>, Julien Grall
 <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
Date: Mon, 12 Aug 2019 16:01:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDgvMjAxOSAxNTo1MywgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiA4LzgvMTkgMTA6
MTMgQU0sIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gSGkgSmFuLAo+Pgo+PiBPbiAwOC8wOC8yMDE5
IDEwOjA0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9uIDA4LjA4LjIwMTkgMTA6NDMsIEFuZHJl
dyBDb29wZXIgd3JvdGU6Cj4+Pj4gT24gMDgvMDgvMjAxOSAwNzoyMiwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+Pj4+IE9uIDA3LjA4LjIwMTkgMjE6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4+Pj4+
PiAtLS0gL2Rldi9udWxsCj4+Pj4+PiArKysgYi9kb2NzL2dsb3NzYXJ5LnJzdAo+Pj4+Pj4gQEAg
LTAsMCArMSwzNyBAQAo+Pj4+Pj4gK0dsb3NzYXJ5Cj4+Pj4+PiArPT09PT09PT0KPj4+Pj4+ICsK
Pj4+Pj4+ICsuLiBUZXJtcyBzaG91bGQgYXBwZWFyIGluIGFscGhhYmV0aWNhbCBvcmRlcgo+Pj4+
Pj4gKwo+Pj4+Pj4gKy4uIGdsb3NzYXJ5OjoKPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgIGNvbnRyb2wg
ZG9tYWluCj4+Pj4+PiArwqDCoMKgwqAgQSA6dGVybTpgZG9tYWluYCwgY29tbW9ubHkgZG9tMCwg
d2l0aCB0aGUgcGVybWlzc2lvbiBhbmQKPj4+Pj4+IHJlc3BvbnNpYmlsaXR5Cj4+Pj4+PiArwqDC
oMKgwqAgdG8gY3JlYXRlIGFuZCBtYW5hZ2Ugb3RoZXIgZG9tYWlucyBvbiB0aGUgc3lzdGVtLgo+
Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqAgZG9tYWluCj4+Pj4+PiArwqDCoMKgwqAgQSBkb21haW4gaXMg
WGVuJ3MgdW5pdCBvZiByZXNvdXJjZSBvd25lcnNoaXAsIGFuZCBnZW5lcmFsbHkgaGFzCj4+Pj4+
PiBhdCB0aGUKPj4+Pj4+ICvCoMKgwqDCoCBtaW5pbXVtIHNvbWUgUkFNIGFuZCB2aXJ0dWFsIENQ
VXMuCj4+Pj4+PiArCj4+Pj4+PiArwqDCoMKgwqAgVGhlIHRlcm1zIDp0ZXJtOmBkb21haW5gIGFu
ZCA6dGVybTpgZ3Vlc3RgIGFyZSBjb21tb25seSB1c2VkCj4+Pj4+PiArwqDCoMKgwqAgaW50ZXJj
aGFuZ2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQgdGhpbmdzLgo+Pj4+Pj4g
Kwo+Pj4+Pj4gK8KgwqDCoMKgIEEgZ3Vlc3QgaXMgYSBzaW5nbGUgdmlydHVhbCBtYWNoaW5lLgo+
Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqDCoMKgIENvbnNpZGVyIHRoZSBjYXNlIG9mIGxpdmUgbWlncmF0
aW9uIHdoZXJlLCBmb3IgYSBwZXJpb2Qgb2YKPj4+Pj4+IHRpbWUsIG9uZQo+Pj4+Pj4gK8KgwqDC
oMKgIGd1ZXN0IHdpbGwgYmUgY29tcHJpc2VkIG9mIHR3byBkb21haW5zLCB3aGlsZSBpdCBpcyBp
biB0cmFuc2l0Lgo+Pj4+Pj4gKwo+Pj4+Pj4gK8KgwqAgZG9taWQKPj4+Pj4+ICvCoMKgwqDCoCBU
aGUgbnVtZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmluZyA6dGVybTpgZG9tYWluYC7CoCBJdCBp
cwo+Pj4+Pj4gdW5pcXVlIHRvIGEKPj4+Pj4+ICvCoMKgwqDCoCBzaW5nbGUgaW5zdGFuY2Ugb2Yg
WGVuLCB1c2VkIGFzIHRoZSBpZGVudGlmaWVyIGluIHZhcmlvdXMgQVBJcywKPj4+Pj4+IGFuZCBp
cwo+Pj4+Pj4gK8KgwqDCoMKgIHR5cGljYWxseSBhbGxvY2F0ZWQgc2VxdWVudGlhbGx5IGZyb20g
MC4KPj4+Pj4+ICsKPj4+Pj4+ICvCoMKgIGd1ZXN0Cj4+Pj4+PiArwqDCoMKgwqAgU2VlIDp0ZXJt
OmBkb21haW5gCj4+Pj4+IEkgdGhpbmsgeW91IHdhbnQgdG8gbWVudGlvbiB0aGUgdXN1YWwgZGlz
dGluY3Rpb24gaGVyZTogRG9tMCBpcywKPj4+Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5v
dCBjb25zaWRlcmVkIGEgZ3Vlc3QuCj4+Pj4gVG8gYmUgaG9uZXN0LCBJIGhhZCB0b3RhbGx5IGZv
cmdvdHRlbiBhYm91dCB0aGF0LsKgIEkgZ3Vlc3Mgbm93IGlzIHRoZQo+Pj4+IHByb3BlciB0aW1l
IHRvIHJlaGFzaCBpdCBpbiBwdWJsaWMuCj4+Pj4KPj4+PiBJIGRvbid0IHRoaW5rIHRoZSB3YXkg
aXQgY3VycmVudGx5IGdldHMgdXNlZCBoYXMgYSBjbGVhciBvciBjb2hlcmVudCBzZXQKPj4+PiBv
ZiBydWxlcywgYmVjYXVzZSBJIGNhbid0IHRoaW5rIG9mIGFueSB0byBkZXNjcmliZSBob3cgaXQg
ZG9lcyBnZXQgdXNlZC4KPj4+Pgo+Pj4+IEVpdGhlciB0aGVyZSBhcmUgYSBjbGVhciBhbmQgY29o
ZXJlbnQgKGFuZCBzaW1wbGUhKSBzZXQgb2YgcnVsZXMgZm9yCj4+Pj4gd2hhdCB3ZSBtZWFuIGJ5
ICJndWVzdCIsIGF0IHdoaWNoIHBvaW50IHRoZXkgY2FuIGxpdmUgaGVyZSBpbiB0aGUKPj4+PiBn
bG9zc2FyeSwgb3IgdGhlIGZ1enp5IHdheSBpdCBpcyBjdXJyZW50IHVzZWQgc2hvdWxkIGNlYXNl
Lgo+Pj4gV2hhdCdzIGZ1enp5IGFib3V0IERvbTAgbm90IGJlaW5nIGEgZ3Vlc3QgKGR1ZSB0byBi
ZWluZyBhIHBhcnQgb2YgdGhlCj4+PiBob3N0IGluc3RlYWQpPwo+PiBEb20wIGlzIG5vdCBwYXJ0
IG9mIHRoZSBob3N0IGlmIHlvdSBhcmUgdXNpbmcgYW4gaGFyZHdhcmUgZG9tYWluLiBJCj4+IGFj
dHVhbGx5IHRob3VnaHQgd2UgcmVuYW1lZCBldmVyeXRoaW5nIGluIFhlbiBmcm9tIERvbTAgdG8g
aHdkb20gdG8KPj4gYXZvaWQgdGhlIGNvbmZ1c2lvbi4KPj4KPj4gSSBhbHNvIHdvdWxkIHJhdGhl
ciBhdm9pZCB0byB0cmVhdCAiZG9tMCIgYXMgbm90IGEgZ3Vlc3QuIEluIG5vcm1hbAo+PiBzZXR1
cCB0aGlzIGlzIGEgbW9yZSBwcml2aWxlZ2UgZ3Vlc3QsIGluIG90aGVyIHNldHVwIHRoaXMgbWF5
IGp1c3QgYmUgYQo+PiBub3JtYWwgZ3Vlc3QgKHRoaW5rIGFib3V0IHBhcnRpdGlvbmluZykuCj4g
QSBsaXRlcmFsIGd1ZXN0IGlzIHNvbWVvbmUgd2hvIGRvZXNuJ3QgbGl2ZSBpbiB0aGUgYnVpbGRp
bmcgKG9yIHdvcmsgaW4KPiB0aGUgYnVsaWRpbmcsIGlmIHlvdSdyZSBpbiBhIGhvdGVsKS4gIFRo
ZSBmYWN0IHRoYXQgdGhlIHN0YWZmIGNsZWFuaW5nCj4gcm9vbXMgYXJlIHJlc3RyaWN0ZWQgaW4g
dGhlaXIgcHJpdmlsZWdlcyBkb2Vzbid0IG1ha2UgdGhlbSBndWVzdHMgb2YgdGhlCj4gaG90ZWwu
Cj4KPiBUaGUgdG9vbHN0YWNrIGRvbWFpbiwgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlIGRyaXZl
ciBkb21haW4sIHRoZQo+IHhlbnN0b3JlIGRvbWFpbiwgYW5kIHNvIG9uIGFyZSBhbGwgcGFydCBv
ZiB0aGUgaG9zdCBzeXN0ZW0sIGRlc2lnbmVkIHRvCj4gYWxsb3cgeW91IHRvIHVzZSBYZW4gdG8g
ZG8gdGhlIHRoaW5nIHlvdSBhY3R1YWxseSB3YW50IHRvIGRvOiBSdW4gZ3Vlc3RzLgo+Cj4gQW5k
IGl0J3MgaW1wb3J0YW50IHRoYXQgd2UgaGF2ZSBhIHdvcmQgdGhhdCBkaXN0aW5ndWlzaGVzICJk
b21haW5zIHRoYXQKPiB3ZSBvbmx5IGNhcmUgYWJvdXQgYmVjYXVzZSB0aGV5IG1ha2UgaXQgcG9z
c2libGUgdG8gcnVuIG90aGVyIGRvbWFpbnMiLAo+IGFuZCAiZG9tYWlucyB0aGF0IHdlIGFjdHVh
bGx5IHdhbnQgdG8gcnVuIi4gICJndWVzdCAvIGhvc3QiIGlzIGEgbmF0dXJhbAo+IHRlcm1pbm9s
b2d5IGZvciB0aGVzZS4KPgo+IFdlIGFscmVhZHkgaGF2ZSB0aGUgd29yZCAiZG9tYWluIiwgd2hp
Y2ggaW5jbHVkZXMgZG9tMCwgZHJpdmVyIGRvbWFpbnMsCj4gdG9vbHN0YWNrIGRvbWFpbnMsIGhh
cmR3YXJlIGRvbWFpbnMsIGFzIHdlbGwgYXMgZ3Vlc3QgZG9tYWlucy4gIFdlIGRvbid0Cj4gbmVl
ZCAiZ3Vlc3QiIHRvIGJlIGEgc3lub255bSBmb3IgImRvbWFpbiIuCgpTby4uLgoKUGxlYXNlIGNh
biBzb21lb25lIHByb3Bvc2Ugd29yZGluZyBzaW1wbGUsIGNsZWFyIHdvcmRpbmcgZm9yIHdoYXQK
Imd1ZXN0IiBtZWFucy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
