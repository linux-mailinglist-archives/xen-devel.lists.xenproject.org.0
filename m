Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E78C6E506
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 13:27:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoR0K-0008CQ-A4; Fri, 19 Jul 2019 11:24:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M1ZL=VQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hoR0I-0008CE-I1
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 11:24:46 +0000
X-Inumbo-ID: ce94a716-aa17-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce94a716-aa17-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 11:24:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1FD4BAFCB;
 Fri, 19 Jul 2019 11:24:43 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190528103313.1343-1-jgross@suse.com>
 <f2f3f5f2-8b9c-ac9c-00e8-1e601ec71070@citrix.com>
 <3cb1c2b777e623a55bf87dc12a155734667ab23e.camel@suse.com>
 <c8f4c719-ce7c-9ca0-7d5b-c34db3f21e38@citrix.com>
 <a57d18f4-e947-5c3e-3d8d-6e1371f0c9af@suse.com>
 <864742f0-9b84-e8fe-75be-fa94e217383f@citrix.com>
 <0e35dc11-5dac-4b24-942c-a8d365a8b193@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9e38bbef-ebe7-60e5-9021-7667b4ffdf64@suse.com>
Date: Fri, 19 Jul 2019 13:24:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <0e35dc11-5dac-4b24-942c-a8d365a8b193@suse.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [PATCH 00/60] xen: add core scheduling support
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 RobertVanVossen <robert.vanvossen@dornerworks.com>,
 Dario Faggioli <dfaggioli@suse.com>, Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMTkgMDc6NDEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMTguMDcuMTkgMTc6
MTQsIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+IE9uIDE4LzA3LzIwMTkgMTU6NDgsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBPbiAxNS4wNy4xOSAxNjowOCwgU2VyZ2V5IER5YXNsaSB3cm90ZToK
Pj4+PiBPbiAwNS8wNy8yMDE5IDE0OjU2LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+Pj4gT24g
RnJpLCAyMDE5LTA3LTA1IGF0IDE0OjE3ICswMTAwLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+Pj4+
Pj4gMSkgVGhpcyBjcmFzaCBpcyBxdWl0ZSBsaWtlbHkgdG8gaGFwcGVuOgo+Pj4+Pj4KPj4+Pj4+
IFsyMDE5LTA3LTA0IDE4OjIyOjQ2IFVUQ10gKFhFTikgWyAzNDI1LjIyMDY2MF0gV2F0Y2hkb2cg
dGltZXIgZGV0ZWN0cwo+Pj4+Pj4gdGhhdCBDUFUyIGlzIHN0dWNrIQo+Pj4+Pj4gWzIwMTktMDct
MDQgMTg6MjI6NDYgVVRDXSAoWEVOKSBbIDM0MjUuMjI2MjkzXSAtLS0tWyBYZW4tNC4xMy4wLQo+
Pj4+Pj4gOC4wLjYtZMKgIHg4Nl82NMKgIGRlYnVnPXnCoMKgIE5vdCB0YWludGVkIF0tLS0tCj4+
Pj4+PiBbLi4uXQo+Pj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6NDcgVVRDXSAoWEVOKSBbIDM0MjUu
NTAxOTg5XSBYZW4gY2FsbCB0cmFjZToKPj4+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10g
KFhFTikgWwo+Pj4+Pj4gMzQyNS41MDUyNzhdwqDCoMKgIFs8ZmZmZjgyZDA4MDIzZDU3OD5dIHZj
cHVfc2xlZXBfc3luYysweDUwLzB4NzEKPj4+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3IFVUQ10g
KFhFTikgWwo+Pj4+Pj4gMzQyNS41MTE1MThdwqDCoMKgIFs8ZmZmZjgyZDA4MDIwODM3MD5dIHZj
cHVfcGF1c2UrMHgyMS8weDIzCj4+Pj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0NyBVVENdIChYRU4p
IFsKPj4+Pj4+IDM0MjUuNTE3MzI2XcKgwqDCoCBbPGZmZmY4MmQwODAyM2UyNWQ+XQo+Pj4+Pj4g
dmNwdV9zZXRfcGVyaW9kaWNfdGltZXIrMHgyNy8weDczCj4+Pj4+PiBbMjAxOS0wNy0wNCAxODoy
Mjo0NyBVVENdIChYRU4pIFsKPj4+Pj4+IDM0MjUuNTI0MjU4XcKgwqDCoCBbPGZmZmY4MmQwODAy
MDk2ODI+XSBkb192Y3B1X29wKzB4MmM5LzB4NjY4Cj4+Pj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0
NyBVVENdIChYRU4pIFsKPj4+Pj4+IDM0MjUuNTMwMjM4XcKgwqDCoCBbPGZmZmY4MmQwODAyNGY5
NzA+XSBjb21wYXRfdmNwdV9vcCsweDI1MC8weDM5MAo+Pj4+Pj4gWzIwMTktMDctMDQgMTg6MjI6
NDcgVVRDXSAoWEVOKSBbCj4+Pj4+PiAzNDI1LjUzNjU2Nl3CoMKgwqAgWzxmZmZmODJkMDgwMzgz
OTY0Pl0gcHZfaHlwZXJjYWxsKzB4MzY0LzB4NTY0Cj4+Pj4+PiBbMjAxOS0wNy0wNCAxODoyMjo0
NyBVVENdIChYRU4pIFsKPj4+Pj4+IDM0MjUuNTQyNzE5XcKgwqDCoCBbPGZmZmY4MmQwODAzODU2
NDQ+XSBkb19lbnRyeV9pbnQ4MisweDI2LzB4MmQKPj4+Pj4+IFsyMDE5LTA3LTA0IDE4OjIyOjQ3
IFVUQ10gKFhFTikgWwo+Pj4+Pj4gMzQyNS41NDg4NzZdwqDCoMKgIFs8ZmZmZjgyZDA4MDM4ODM5
Yj5dIGVudHJ5X2ludDgyKzB4YmIvMHhjMAo+Pj4+Pj4KPj4+Pj4gTW1tLi4uIHZjcHVfc2V0X3Bl
cmlvZGljX3RpbWVyPwo+Pj4+Pgo+Pj4+PiBXaGF0IGtlcm5lbCBpcyB0aGlzIGFuZCB3aGVuIGRv
ZXMgdGhpcyBjcmFzaCBoYXBwZW4/Cj4+Pj4KPj4+PiBIaSBEYXJpbywKPj4+Pgo+Pj4+IEkgY2Fu
IGVhc2lseSByZXByb2R1Y2UgdGhpcyBjcmFzaCB1c2luZyBhIERlYmlhbiA3IFBWIFZNICgyIHZD
UFVzLCAKPj4+PiAyR0IgUkFNKQo+Pj4+IHdoaWNoIGhhcyB0aGUgZm9sbG93aW5nIGtlcm5lbDoK
Pj4+Pgo+Pj4+ICMgdW5hbWUgLWEKPj4+Pgo+Pj4+IExpbnV4IGxvY2FsaG9zdCAzLjIuMC00LWFt
ZDY0ICMxIFNNUCBEZWJpYW4gMy4yLjc4LTEgeDg2XzY0IEdOVS9MaW51eAo+Pj4+Cj4+Pj4gQWxs
IEkgbmVlZCB0byBkbyBpcyBzdXNwZW5kIGFuZCByZXN1bWUgdGhlIFZNLgo+Pj4KPj4+IEhhcHBl
bnMgd2l0aCBhIG1vcmUgcmVjZW50IGtlcm5lbCwgdG9vLgo+Pj4KPj4+IEkgY2FuIGVhc2lseSBy
ZXByb2R1Y2UgdGhlIGlzc3VlIHdpdGggYW55IFBWIGd1ZXN0IHdpdGggbW9yZSB0aGFuIDEgdmNw
dQo+Pj4gYnkgZG9pbmcgInhsIHNhdmUiIGFuZCB0aGVuICJ4bCByZXN0b3JlIiBhZ2Fpbi4KPj4+
Cj4+PiBXaXRoIHRoZSByZXByb2R1Y2VyIGJlaW5nIGF2YWlsYWJsZSBJJ20gbm93IGRpdmluZyBp
bnRvIHRoZSBpc3N1ZS4uLgo+Pgo+PiBPbmUgZnVydGhlciB0aGluZyB0byBhZGQgaXMgdGhhdCBJ
IHdhcyBhYmxlIHRvIGF2b2lkIHRoZSBjcmFzaCBieSAKPj4gcmV2ZXJ0aW5nCj4+Cj4+IMKgwqDC
oMKgeGVuL3NjaGVkOiByZXdvcmsgYW5kIHJlbmFtZSB2Y3B1X2ZvcmNlX3Jlc2NoZWR1bGUoKQo+
Pgo+PiB3aGljaCBpcyBhIHBhcnQgb2YgdGhlIHNlcmllcy4gVGhpcyBtYWRlIGFsbCB0ZXN0cyB3
aXRoIFBWIGd1ZXN0cyBwYXNzLgo+IAo+IFllYWgsIGJ1dCByZW1vdmluZyB0aGlzIHBhdGNoIGlz
IGp1c3QgcGFwZXJpbmcgb3ZlciBhIGdlbmVyYWwgaXNzdWUuCj4gVGhlIG1haW4gcHJvYmxlbSBz
ZWVtcyB0byBiZSBhIHZjcHUgdHJ5aW5nIHRvIHBhdXNlIGFub3RoZXIgdmNwdSBvZiB0aGUKPiBz
YW1lIHNjaGVkX3VuaXQuIEkgYWxyZWFkeSBoYXZlIGFuIGlkZWEgd2hhdCBpcyByZWFsbHkgaGFw
cGVuaW5nLCBJIGp1c3QKPiBuZWVkIHRvIHZlcmlmeSBpdC4KCldhcyBhbm90aGVyIHByb2JsZW0g
YXMgSSB0aG91Z2h0IGluaXRpYWxseSwgYnV0IEkndmUgZm91bmQgaXQuCgp4bCByZXN0b3JlIGlz
IHdvcmtpbmcgbm93LiA6LSkKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
