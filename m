Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CC21424
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 09:25:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRXBi-0004Rj-Iw; Fri, 17 May 2019 07:21:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mYL4=TR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRXBh-0004Re-3v
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 07:21:53 +0000
X-Inumbo-ID: 6f49faec-7874-11e9-bc82-173214866a5a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6f49faec-7874-11e9-bc82-173214866a5a;
 Fri, 17 May 2019 07:21:49 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 17 May 2019 01:21:48 -0600
Message-Id: <5CDE610D020000780022FF42@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 17 May 2019 01:21:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-2-tamas@tklengyel.com>
In-Reply-To: <20190516213752.1701-2-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v5 2/4] x86/mem_sharing: copy a page_lock
 version to be internal to memshr
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDIzOjM3LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9tbS5oCj4gQEAgLTM1NiwyNCArMzU2LDE1IEBAIHN0cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSB7
Cj4gIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9iYWRfcGFnZSAqZ2V0X3BsYXRmb3JtX2JhZHBhZ2Vz
KHVuc2lnbmVkIGludCAqYXJyYXlfc2l6ZSk7Cj4gIAo+ICAvKiBQZXIgcGFnZSBsb2NrczoKPiAt
ICogcGFnZV9sb2NrKCkgaXMgdXNlZCBmb3IgdHdvIHB1cnBvc2VzOiBwdGUgc2VyaWFsaXphdGlv
biwgYW5kIG1lbW9yeSBzaGFyaW5nLgo+ICsgKiBwYWdlX2xvY2soKSBpcyB1c2VkIGZvciBwdGUg
c2VyaWFsaXphdGlvbi4KPiAgICoKPiAgICogQWxsIHVzZXJzIG9mIHBhZ2UgbG9jayBmb3IgcHRl
IHNlcmlhbGl6YXRpb24gbGl2ZSBpbiBtbS5jLCB1c2UgaXQKPiAgICogdG8gbG9jayBhIHBhZ2Ug
dGFibGUgcGFnZSBkdXJpbmcgcHRlIHVwZGF0ZXMsIGRvIG5vdCB0YWtlIG90aGVyIGxvY2tzIHdp
dGhpbgo+ICAgKiB0aGUgY3JpdGljYWwgc2VjdGlvbiBkZWxpbWl0ZWQgYnkgcGFnZV9sb2NrL3Vu
bG9jaywgYW5kIHBlcmZvcm0gbm8KPiAgICogbmVzdGluZy4KPiAgICoKPiAtICogQWxsIHVzZXJz
IG9mIHBhZ2UgbG9jayBmb3IgbWVtb3J5IHNoYXJpbmcgbGl2ZSBpbiBtbS9tZW1fc2hhcmluZy5j
LiBQYWdlX2xvY2sKPiAtICogaXMgdXNlZCBpbiBtZW1vcnkgc2hhcmluZyB0byBwcm90ZWN0IGFk
ZGl0aW9uIChzaGFyZSkgYW5kIHJlbW92YWwgKHVuc2hhcmUpCj4gLSAqIG9mIChnZm4sZG9tYWlu
KSB0dXBwbGVzIHRvIGEgbGlzdCBvZiBnZm4ncyB0aGF0IHRoZSBzaGFyZWQgcGFnZSBpcyBjdXJy
ZW50bHkKPiAtICogYmFja2luZy4gTmVzdGluZyBtYXkgaGFwcGVuIHdoZW4gc2hhcmluZyAoYW5k
IGxvY2tpbmcpIHR3byBwYWdlcyAtLSBkZWFkbG9jawo+IC0gKiBpcyBhdm9pZGVkIGJ5IGxvY2tp
bmcgcGFnZXMgaW4gaW5jcmVhc2luZyBvcmRlci4KPiAtICogQWxsIG1lbW9yeSBzaGFyaW5nIGNv
ZGUgcGF0aHMgdGFrZSB0aGUgcDJtIGxvY2sgb2YgdGhlIGFmZmVjdGVkIGdmbiBiZWZvcmUKPiAt
ICogdGFraW5nIHRoZSBsb2NrIGZvciB0aGUgdW5kZXJseWluZyBwYWdlLiBXZSBlbmZvcmNlIG9y
ZGVyaW5nIGJldHdlZW4gcGFnZV9sb2NrCj4gLSAqIGFuZCBwMm1fbG9jayB1c2luZyBhbiBtbS1s
b2Nrcy5oIGNvbnN0cnVjdC4KPiAtICoKPiAtICogVGhlc2UgdHdvIHVzZXJzIChwdGUgc2VyaWFs
aXphdGlvbiBhbmQgbWVtb3J5IHNoYXJpbmcpIGRvIG5vdCBjb2xsaWRlLCBzaW5jZQo+IC0gKiBz
aGFyaW5nIGlzIG9ubHkgc3VwcG9ydGVkIGZvciBodm0gZ3Vlc3RzLCB3aGljaCBkbyBub3QgcGVy
Zm9ybSBwdiBwdGUgdXBkYXRlcy4KPiArICogVGhlIHVzZSBvZiBQR1RfbG9ja2VkIGluIG1lbV9z
aGFyaW5nIGRvZXMgbm90IGNvbGxpZGUsIHNpbmNlIG1lbV9zaGFyaW5nIGlzCj4gKyAqIG9ubHkg
c3VwcG9ydGVkIGZvciBodm0gZ3Vlc3RzLCB3aGljaCBkbyBub3QgcGVyZm9ybSBwdiBwdGUgdXBk
YXRlcy4KCkhtbSwgSSB0aG91Z2h0IHdlIGhhZCBhZ3JlZWQgb24geW91IGFsc28gY29ycmVjdGlu
ZyB0aGUgd29yZGluZyBvZgp0aGUgc2VudGVuY2UgeW91IG5vdyByZXRhaW4gKGFzIHJlcXVlc3Rl
ZCkuIEFzIHNhaWQgYmVmb3JlLCBhIEhWTQooUFZIIHRvIGJlIHByZWNpc2UpIERvbTAgY2FuIHZl
cnkgd2VsbCBwZXJmb3JtIFBWIFBURSB1cGRhdGVzLCBqdXN0Cm5vdCBvbiBpdHNlbGYuIEkgaGFk
IHN1Z2dlc3RlZCB0aGUgd29yZGluZyAid2hpY2ggZG8gbm90IGhhdmUgUFYgUFRFcwp1cGRhdGVk
IiAtIEknZCBiZSBmaW5lIGZvciB0aGlzIHRvIGJlIGZvbGRlZCBpbiB3aGlsZSBjb21taXR0aW5n
LCB0byBhdm9pZAphbm90aGVyIHJvdW5kIHRyaXAuIFdpdGggdGhpcwpBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
