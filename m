Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCA910CBFA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 16:45:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaLwq-0005fs-T1; Thu, 28 Nov 2019 15:43:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaLwp-0005fn-NC
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 15:43:15 +0000
X-Inumbo-ID: c837d47f-11f5-11ea-a3d4-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c837d47f-11f5-11ea-a3d4-12813bfff9fa;
 Thu, 28 Nov 2019 15:43:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E6137B4A3;
 Thu, 28 Nov 2019 15:43:11 +0000 (UTC)
To: Hans van Kranenburg <hans@knorrie.org>,
 George Dunlap <george.dunlap@citrix.com>, "Durrant, Paul"
 <pdurrant@amazon.com>, Ian Jackson <ian.jackson@citrix.com>
References: <20191126171747.3185988-1-george.dunlap@citrix.com>
 <20191126171747.3185988-2-george.dunlap@citrix.com>
 <24029.25218.75565.126333@mariner.uk.xensource.com>
 <c95b8096d1054d88bce16310aafe978a@EX13D32EUC003.ant.amazon.com>
 <24030.22924.67150.575753@mariner.uk.xensource.com>
 <19cdd60b0df341d38f94fa6433ef568c@EX13D32EUC003.ant.amazon.com>
 <bdbaf3d0-4b78-cbc9-3943-5bc4cfd7cb27@knorrie.org>
 <414ed314-29fc-1b16-9516-790e53a65a4c@citrix.com>
 <5c90ac64-f5ed-744e-0d48-4e3aa2139a30@knorrie.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <00744244-2587-2483-df78-7f400255e2dd@suse.com>
Date: Thu, 28 Nov 2019 16:43:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5c90ac64-f5ed-744e-0d48-4e3aa2139a30@knorrie.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMTkgMTY6MzMsIEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4gT24gMTEvMjgv
MTkgMzo1NCBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvMjcvMTkgMTA6MzIgUE0s
IEhhbnMgdmFuIEtyYW5lbmJ1cmcgd3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gT24gMTEvMjcv
MTkgMTI6MTMgUE0sIER1cnJhbnQsIFBhdWwgd3JvdGU6Cj4+Pj4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4+Pj4+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29t
Pgo+Pj4+PiBTZW50OiAyNyBOb3ZlbWJlciAyMDE5IDExOjEwCj4+Pj4+IFsuLi5dCj4+Pj4+IFN1
YmplY3Q6IFJFOiBbWGVuLWRldmVsXSBbUEFUQ0ggZm9yLTQuMTMgMi8yXSBSYXRpb25hbGl6ZSBt
YXhfZ3JhbnRfZnJhbWVzCj4+Pj4+IGFuZCBtYXhfbWFwdHJhY2tfZnJhbWVzIGhhbmRsaW5nCj4+
Pj4+Cj4+Pj4+IER1cnJhbnQsIFBhdWwgd3JpdGVzICgiUkU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBm
b3ItNC4xMyAyLzJdIFJhdGlvbmFsaXplCj4+Pj4+IG1heF9ncmFudF9mcmFtZXMgYW5kIG1heF9t
YXB0cmFja19mcmFtZXMgaGFuZGxpbmciKToKPj4+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQo+Pj4+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVu
cHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZgo+Pj4+PiBJYW4KPj4+Pj4+PiBKYWNrc29uCj4+Pj4+
Pj4gSSBoYXZlIHNlZW4gcmVwb3J0cyBvZiB1c2VycyB3aG8gcmFuIG91dCBvZiBncmFudC9tYXB0
cmFjayBmcmFtZXMKPj4+Pj4+PiBiZWNhdXNlIG9mIHVwZGF0ZXMgdG8gdXNlIG11bHRpcmluZyBw
cm90b2NvbHMgZXRjLiAgVGhlIGVycm9yIG1lc3NhZ2VzCj4+Pj4+Pj4gYXJlIG5vdCB2ZXJ5IGdv
b2QgYW5kIHRoZSByZWNvbW1lbmRlZCB3b3JrYXJvdW5kIGhhcyBiZWVuIHRvIGluY3JlYXNlCj4+
Pj4+Pj4gdGhlIGRlZmF1bHQgbGltaXQgb24gdGhlIGh5cGVydmlzb3IgY29tbWFuZCBsaW5lLgo+
Pj4+Pj4+Cj4+Pj4+Pj4gSXQgaXMgaW1wb3J0YW50IHRoYXQgd2UgZG9uJ3QgYnJlYWsgdGhhdCB3
b3JrYXJvdW5kIQo+Pj4+Pj4KPj4+Pj4+IEFsYXMgaXQgaGFzIGFwcGFyZW50bHkgYmVlbiBicm9r
ZW4gZm9yIHNldmVyYWwgcmVsZWFzZXMgbm93IDotKAo+Pj4+Pgo+Pj4+PiBJIGd1ZXNzIGF0IGxl
YXN0IGluIERlYmlhbiAod2hlcmUgSSBoYXZlIHNlZW4gdGhpcykgd2UgaGF2ZW4ndAo+Pj4+PiBy
ZWxlYXNlZCB3aXRoIGFueSBhZmZlY3RlZCB2ZXJzaW9ucyB5ZXQuLi4KPj4+Pgo+Pj4+IEkgYmVs
aWV2ZSB0aGUgcHJvYmxlbSB3YXMgaW50cm9kdWNlIGluIDQuMTAsIHNvIEkgdGhpbmsgaXQgd291
bGQgYmUgcHJ1ZGVudCB0byBhbHNvIGJhY2stcG9ydCB0aGUgZmluYWwgZml4IHRvIHN0YWJsZSB0
cmVlcyBmcm9tIHRoZW4gb24uCj4+Pgo+Pj4gWWVzLCB0aGUgbWF4IGdyYW50IGZyYW1lIGlzc3Vl
IGhhcyBoaXN0b3JpY2FsbHkgYWx3YXlzIGJlZW4gYSBwYWluZnVsCj4+PiBleHBlcmllbmNlIGZv
ciBlbmQgdXNlcnMsIGFuZCBYZW4gNC4xMSB3aGljaCB3ZSBub3cgaGF2ZSBpbiB0aGUgY3VycmVu
dAo+Pj4gRGViaWFuIHN0YWJsZSBoYXMgbWFkZSBpdCB3b3JzZSBjb21wYXJlZCB0byBwcmV2aW91
cyB2ZXJzaW9ucyBpbmRlZWQuCj4+Cj4+IFRoaXMgcmF0aGVyIHN1Z2dlc3RzIHRoYXQgdGhlIGRl
ZmF1bHQgdmFsdWUgaXNuJ3QgdmVyeSB3ZWxsIGNob3Nlbi4KPj4gSWRlYWxseSBzb21lIGludmVz
dGlnYXRpb24gd291bGQgYmUgZG9uZSB0byBpbXByb3ZlIHRoZSBkZWZhdWx0IHNpemluZzsKPj4g
ZW5kLXVzZXJzIHNob3VsZG4ndCBoYXZlIHRvIGtub3cgYW55dGhpbmcgYWJvdXQgZ3JhbnQgdGFi
bGUgZnJhbWVzLgo+IAo+IE1vc3Qgb2YgdGhlIHByb2JsZW1zIHN0YXJ0ZWQgaGFwcGVuaW5nIGEg
ZmV3IHllYXJzIGFnbyB3aGVuIHVzaW5nIGEKPiBuZXdlciBMaW51eCB0aGF0IGdvdCBhbGwga2lu
ZHMgb2YgbXVsdGlxdWV1ZSBibG9jayBzdHVmZiBmb3IgZGlzayBhbmQKPiBuZXR3b3JrIGVuYWJs
ZWQgb24gdG9wIG9mIGFuIG9sZGVyIFhlbi4gKGUuZy4gaW4gRGViaWFuIHVzaW5nIHRoZSBMaW51
eAo+IDQuOSBiYWNrcG9ydHMga2VybmVsIG9uIHRvcCBvZiBYZW4gNC40IGluIEplc3NpZSkuCj4g
Cj4gVGhlIGRlZmF1bHQgZm9yIHRoZSBoeXBlcnZpc29yIG9wdGlvbiBoYXMgYWxyZWFkeSBiZWVu
IGRvdWJsZWQgZnJvbSAzMgo+IHRvIDY0LCB3aGljaCBJIHRoaW5rIGlzIHN1ZmZpY2llbnQuIEhv
d2V2ZXIsIGhhdmluZyB0aGUgdG9vbHN0YWNrIHJldmVydAo+IGl0IGJhY2sgdG8gMzIgYWdhaW4g
aXMgbm90IHZlcnkgaGVscGZ1bCwgYnV0IHRoYXQncyB3aGF0IHRoaXMgdGhyZWFkIGlzCj4gYWJv
dXQgdG8gc29sdmUuIDopCj4gCj4gQSB3aGlsZSBhZ28gSSBkaWQgc29tZSB0ZXN0aW5nOgo+ICAg
ICBodHRwczovL2J1Z3MuZGViaWFuLm9yZy9jZ2ktYmluL2J1Z3JlcG9ydC5jZ2k/YnVnPTg4MDU1
NCMxMTkKPiAKPiBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIGNhdXNlIG5yX2ZyYW1lcyB0byBnbyBv
dmVyIDY0IGluIGFueSB0ZXN0IG15c2VsZiwKPiBhbmQgYWxzbyBoYXZlIG5ldmVyIHNlZW4gdmFs
dWVzIHRoYXQgaGlnaCBpbiBwcm9kdWN0aW9uIHVzZS4gVGhlIGFib3ZlCj4gZGViaWFuIGJ1ZyBh
bHNvIGRvZXMgbm90IGNvbnRhaW4gYW55IG90aGVyIHJlcG9ydCBmcm9tIGFueW9uZSB3aXRoIGEK
PiBudW1iZXIgYWJvdmUgNjQuIFRoZXJlIGFyZSByZXBvcnRzIG9mIHVzZXJzIHNldHRpbmcgaXQg
dG8gMjU2IGFuZCB0aGVuCj4gbm90IGNhcmluZyBhYm91dCBpdCBhbnkgbW9yZSwgYnV0IHRoZXkg
ZGlkbid0IHJlcG9ydCB0aGUgeGVuX2RpYWcgb3V0cHV0Cj4gYmFjayBhZnRlciB0aGF0LCBzbyB0
aGVyZSdzIG5vIHJlYWwgZGF0YS4KCkkgaGF2ZSBzZWVuIGd1ZXN0cyBuZWVkaW5nIDI1Ni4KCk15
IExpbnV4IGtlcm5lbCBwYXRjaGVzIHJlZHVjaW5nIHRoZSBkZWZhdWx0IG1heC4gbnVtYmVyIG9m
IHF1ZXVlcyBpbgpuZXRmcm9udC9uZXRiYWNrIHRvIDggbWFkZSB0aGluZ3MgbXVjaCBiZXR0ZXIg
KG9uIGEgbGFyZ2UgaG9zdCBydW5uaW5nCmEgZ3Vlc3Qgd2l0aCA2NCB2Y3B1cyB1c2luZyA4IG5l
dHdvcmsgaW50ZXJmYWNlcyB3YXMgYmxvd2luZyB1cCByYXRoZXIKZmFzdCkuCgoKSnVlcmdlbgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
