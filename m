Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5572215BC39
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:56:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BBo-0005Gs-8J; Thu, 13 Feb 2020 09:53:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2BBm-0005Gn-NI
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:53:42 +0000
X-Inumbo-ID: b6eea950-4e46-11ea-b86c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b6eea950-4e46-11ea-b86c-12813bfff9fa;
 Thu, 13 Feb 2020 09:53:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57F1FADE0;
 Thu, 13 Feb 2020 09:53:41 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <72a1c94b-fd3b-3d47-4963-d92c6293000c@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c09e9d06-af6b-014e-9d0c-027cdfe753d4@suse.com>
Date: Thu, 13 Feb 2020 10:53:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <72a1c94b-fd3b-3d47-4963-d92c6293000c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/3] x86: fixes/improvements for scratch
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDIuMjAyMCAyMjowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEyLzAyLzIwMjAg
MTc6NDksIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4gQ29tbWl0Ogo+Pgo+PiA1NTAwZDI2NWEy
YThmYTYzZDYwYzA4YmViNTQ5ZGU4ZWM4MmZmN2E1Cj4+IHg4Ni9zbXA6IHVzZSBBUElDIEFMTEJV
VCBkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3NzaWJsZQo+IAo+IFRoZXJlIGlzIGEgbW9y
ZSBzdWJ0bGUgcHJvYmxlbSBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2guIEkgdGhvdWdodCBJIAo+
IHdvdWxkIG1lbnRpb24gaXQgaGVyZSBqdXN0IGluIGNhc2UgdGhpcyBhZmZlY3QgdGhlIGFwcHJv
YWNoIHlvdSBoYXZlIAo+IGNob3NlbiBpbiB0aGlzIHNlcmllcy4KPiAKPiBnZXRfY3B1X21hcHMo
KSBpcyB1c2VkIGJ5IHN0b3BfbWFjaGluZV9ydW4oKSB0byBzZXJpYWxpemUgdGhlIGNhbGxlcnMu
IAo+IElmIHRoZSBsYXR0ZXIgZmFpbHMgdG8gYWNxdWlyZSB0aGUgbG9jaywgaXQgd2lsbCBiYWls
IG91dC4gCj4gVW5mb3J0dW5hdGVseSwgcmN1X2JhcnJpZXIoKSBpcyBpbXBsZW1lbnRlZCB1c2lu
ZyBzdG9wX21hY2hpbmVfcnVuKCkgYW5kIAo+IHdpbGwgYmUgdHVybmVkIHRvIHByZXR0eSBtdWNo
IGEgTk9QIGlmIHRoZSBsYXR0ZXIgZmFpbHMgKGUuZyB0aGUgbG9jayAKPiBjYW5ub3QgYmUgYWNx
dWlyZWQpLgo+IAo+IFRoaXMgbWVhbnMgdGhhdCB0aGUgcmN1X2JhcnJpZXIoKSB3aWxsIG5vdCBk
byB0aGUgZXhwZWN0ZWQgam9iIGFuZCAKPiBwb3RlbnRpYWxseSBpbnRyb2R1Y2UgdW5rbm93biBp
c3N1ZXMgKGUuZyB1c2UtYWZ0ZXItZnJlZS4uLikuCj4gCj4gQmVmb3JlIHlvdXIgcGF0Y2gsIGl0
IHdvdWxkIGhhdmUgYmVlbiBwcmV0dHkgaGFyZCB0byBoaXQgdGhlIHByb2JsZW0gCj4gYWJvdmUu
IEFmdGVyLCB5b3UgY2FuIHJhY2UgbW9yZSBlYXNpbHkgd2l0aCByY3VfYmFycmllcigpIGFzIHNl
bmRpbmcgSVBJIAo+IGlzIHByZXR0eSBjb21tb24uCj4gCj4gU2FkbHksIEkgZG9uJ3QgaGF2ZSBh
IHN1Z2dlc3Rpb24geWV0IGhvdyB0byBmaXggdGhpcyBwcm9ibGVtLgoKQSBmcmVxdWVudCB1c2Ug
bGlrZSBvbiB0aGUgSVBJIHNlbmRpbmcgcGF0aCBzdWdnZXN0cyB0aGUgbG9jayBtYXkKd2FudCB0
byBiZWNvbWUgYW4gci93IG9uZSwgd2hlcmUgYm90aCBwYXJ0aWVzIHlvdSBtZW50aW9uIHdhbnQg
dG8KYWNxdWlyZSBpdCBpbiByZWFkIG1vZGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
