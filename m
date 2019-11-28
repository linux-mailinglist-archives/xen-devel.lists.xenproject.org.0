Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C1710CCEC
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:39:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMmc-00020I-Hr; Thu, 28 Nov 2019 16:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaMmb-00020D-2q
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:36:45 +0000
X-Inumbo-ID: 434625ba-11fd-11ea-83b8-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 434625ba-11fd-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 16:36:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7EF04B1C3;
 Thu, 28 Nov 2019 16:36:43 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
Date: Thu, 28 Nov 2019 17:36:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191128135813.8893-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAxNDo1OCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9jb21t
b24vZ3JhbnRfdGFibGUuYwo+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+IEBAIC04
NCwxMSArODQsNDMgQEAgc3RydWN0IGdyYW50X3RhYmxlIHsKPiAgICAgIHN0cnVjdCBncmFudF90
YWJsZV9hcmNoIGFyY2g7Cj4gIH07Cj4gIAo+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9nbnR0
YWJfbGltaXQoY29uc3QgY2hhciAqcGFyYW0sIGNvbnN0IGNoYXIgKmFyZywKCk5vIF9faW5pdCBw
bGVhc2UgaGVyZSBhbmQgYmVsb3csIGZvciB0aGlzIGJlaW5nIHJ1bnRpbWUgb3B0aW9uCnBhcnNp
bmcgZnVuY3Rpb25zLgoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGludCAqdmFscCkKPiArewo+ICsgICAgY29uc3QgY2hhciAqZTsKPiArICAgIHVuc2ln
bmVkIGxvbmcgdmFsOwo+ICsKPiArICAgIHZhbCA9IHNpbXBsZV9zdHJ0b3VsKGFyZywgJmUsIDAp
Owo+ICsgICAgaWYgKCAqZSApCj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICsgICAg
aWYgKCB2YWwgPD0gSU5UX01BWCApCj4gKyAgICAgICAgKnZhbHAgPSB2YWw7Cj4gKyAgICBlbHNl
Cj4gKyAgICAgICAgcHJpbnRrKCJwYXJhbWV0ZXIgXCIlc1wiIHZhbHVlIFwiJXNcIiBpcyBvdXQg
b2YgcmFuZ2U7IHVzaW5nIHZhbHVlIFwiJXVcIlxuIiwKPiArICAgICAgICAgICAgICAgcGFyYW0s
IGFyZywgKnZhbHApOwoKQmV0dGVyIHN0b3JlIElOVF9NQVggaW4gdGhpcyBjYXNlIHJhdGhlciB0
aGFuIGxlYXZpbmcgdGhlIHZhbHVlCnVuY2hhbmdlZD8gT3Igb3RoZXJ3aXNlIC4uLgoKPiArICAg
IHJldHVybiAwOwoKLi4uIGF0IGxlYXN0IGRvbid0IHJldHVybiBzdWNjZXNzPwoKPiArfQo+ICsK
PiAgdW5zaWduZWQgaW50IF9fcmVhZF9tb3N0bHkgb3B0X21heF9ncmFudF9mcmFtZXMgPSA2NDsK
PiAtaW50ZWdlcl9ydW50aW1lX3BhcmFtKCJnbnR0YWJfbWF4X2ZyYW1lcyIsIG9wdF9tYXhfZ3Jh
bnRfZnJhbWVzKTsKPiArCj4gK3N0YXRpYyBpbnQgX19pbml0IHBhcnNlX2dudHRhYl9tYXhfZnJh
bWVzKGNvbnN0IGNoYXIgKmFyZykKPiArewo+ICsgICAgcmV0dXJuIHBhcnNlX2dudHRhYl9saW1p
dCgiZ250dGFiX21heF9mcmFtZXMiLCBhcmcsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZvcHRfbWF4X2dyYW50X2ZyYW1lcyk7Cj4gK30KPiArY3VzdG9tX3J1bnRpbWVfcGFyYW0o
ImdudHRhYl9tYXhfZnJhbWVzIiwgcGFyc2VfZ250dGFiX21heF9mcmFtZXMpOwo+ICAKPiAgdW5z
aWduZWQgaW50IF9fcmVhZF9tb3N0bHkgb3B0X21heF9tYXB0cmFja19mcmFtZXMgPSAxMDI0OwoK
QXMgaW5kaWNhdGVkIHRoaXMgd2FudHMgdG8gYmVjb21lIHN0YXRpYyBub3cuCgo+IC0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy9kb21j
dGwuaAo+IEBAIC04MiwxMyArODIsMTUgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWlu
IHsKPiAgICAgIHVpbnQzMl90IGlvbW11X29wdHM7Cj4gIAo+ICAgICAgLyoKPiAtICAgICAqIFZh
cmlvdXMgZG9tYWluIGxpbWl0cywgd2hpY2ggaW1wYWN0IHRoZSBxdWFudGl0eSBvZiByZXNvdXJj
ZXMgKGdsb2JhbAo+IC0gICAgICogbWFwcGluZyBzcGFjZSwgeGVuaGVhcCwgZXRjKSBhIGd1ZXN0
IG1heSBjb25zdW1lLgo+ICsgICAgICogVmFyaW91cyBkb21haW4gbGltaXRzLCB3aGljaCBpbXBh
Y3QgdGhlIHF1YW50aXR5IG9mIHJlc291cmNlcwo+ICsgICAgICogKGdsb2JhbCBtYXBwaW5nIHNw
YWNlLCB4ZW5oZWFwLCBldGMpIGEgZ3Vlc3QgbWF5IGNvbnN1bWUuICBGb3IKPiArICAgICAqIG1h
eF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMsIDwgMCBtZWFucyAidXNlIHRo
ZQo+ICsgICAgICogZGVmYXVsdCBtYXhpbXVtIHZhbHVlIGluIHRoZSBoeXBlcnZpc29yIi4KPiAg
ICAgICAqLwo+ICAgICAgdWludDMyX3QgbWF4X3ZjcHVzOwo+ICAgICAgdWludDMyX3QgbWF4X2V2
dGNobl9wb3J0Owo+IC0gICAgdWludDMyX3QgbWF4X2dyYW50X2ZyYW1lczsKPiAtICAgIHVpbnQz
Ml90IG1heF9tYXB0cmFja19mcmFtZXM7Cj4gKyAgICBpbnQzMl90IG1heF9ncmFudF9mcmFtZXM7
Cj4gKyAgICBpbnQzMl90IG1heF9tYXB0cmFja19mcmFtZXM7CgpXaGlsZSB0aGlzIG1heSB3YW50
IGJhY2twb3J0aW5nIGFpdWksIHdlIG5lZWQgdG8gYmUgYSBsaXR0bGUKY2FyZWZ1bCB3aXRoIHRo
ZSBpbnRlcmZhY2UgY2hhbmdlIGhlcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
