Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D15115EC
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 11:00:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7XJ-0003US-0v; Thu, 02 May 2019 08:57:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hM7XH-0003UN-Ec
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:57:47 +0000
X-Inumbo-ID: 53d64dc8-6cb8-11e9-b4d2-8f6713e23ef3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53d64dc8-6cb8-11e9-b4d2-8f6713e23ef3;
 Thu, 02 May 2019 08:57:35 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 02:57:34 -0600
Message-Id: <5CCAB0FC020000780022B12F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 02:57:32 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Razvan Cojocaru" <rcojocaru@bitdefender.com>
References: <20190501235731.1486-1-tamas@tklengyel.com>
 <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
In-Reply-To: <59f57a48-b1da-7362-4024-c890cf357bf0@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/vm_event: add gdtr_base to the vm_event
 structure
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDEwOjI1LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gNS8yLzE5IDI6NTcgQU0sIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4gUmVjZWl2
aW5nIHRoaXMgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBpbnRyb3NwZWN0aW5nIDMyLWJpdCBXaW5k
b3dzIHdoZW4gdGhlCj4+IGV2ZW50IGJlaW5nIHRyYXBwZWQgaGFwcGVuZWQgd2hpbGUgaW4gcmlu
ZzMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3ll
bC5jb20+Cj4+IENjOiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+
Cj4+IENjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgo+PiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4K
Pj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IC0tLQo+PiAg
IHhlbi9hcmNoL3g4Ni92bV9ldmVudC5jICAgICAgIHwgNSArKysrKwo+PiAgIHhlbi9pbmNsdWRl
L3B1YmxpYy92bV9ldmVudC5oIHwgMyArKy0KPj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni92
bV9ldmVudC5jIGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPj4gaW5kZXggNTFjMzQ5M2IxZC4u
ODczNzg4ZTMyZiAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPj4gKysr
IGIveGVuL2FyY2gveDg2L3ZtX2V2ZW50LmMKPj4gQEAgLTE3OSw2ICsxNzksMTAgQEAgc3RhdGlj
IHZvaWQgdm1fZXZlbnRfcGFja19zZWdtZW50X3JlZ2lzdGVyKGVudW0gCj4geDg2X3NlZ21lbnQg
c2VnbWVudCwKPj4gICAgICAgICAgIHJlZy0+ZXNfc2VsID0gc2VnLnNlbDsKPj4gICAgICAgICAg
IGJyZWFrOwo+PiAgIAo+PiArICAgIGNhc2UgeDg2X3NlZ19nZHRyOgo+PiArICAgICAgICByZWct
PmdkdHJfYmFzZSA9IHNlZy5iYXNlOwo+PiArICAgICAgICBicmVhazsKPiAKPiBQbGVhc2UgYWxz
byBhZGQgbGltaXQsIGFyLCBzZWwsIGxpa2UgdGhlIG90aGVycyBkby4KClRoZXJlJ3Mgbm8gYXIg
b3Igc2VsIGZvciBHRFQgKGFuZCBJRFQpLiBJbnN0ZWFkLCBiZWNhdXNlIG9mIC4uLgoKPiBJbiBh
ZGRpdGlvbiB0byAKPiBtYWtpbmcgdGhpcyBtb2RpZmljYXRpb24gbG9vayBsZXNzIHN0cmFuZ2Ug
KHNpbmNlLCBpbiBjb250cmFzdCB0byB0aGUgCj4gZnVuY3Rpb24gbmFtZSwgbm90aGluZyBpcyBw
YWNrZWQgZm9yIGdkdHJfYmFzZSksIGl0IHdpbGwgYWxzbyBzYXZlIAo+IGZ1dHVyZSB3b3JrIGZv
ciBhcHBsaWNhdGlvbnMgd2FudGluZyB0byB1c2UgZ2R0ciB3aGljaCBhbHNvIHJlcXVpcmUgCj4g
YmFja3dhcmRzIGNvbXBhdGliaWxpdHkgd2l0aCBwcmV2aW91cyB2bV9ldmVudCB2ZXJzaW9ucy4K
PiAKPiBBcyB5b3Uga25vdywgZm9yIGVhY2ggc3VjaCBtb2RpZmljYXRpb24gd2UgbmVlZCB0byBo
YXZlIGEgc2VwYXJhdGUgCj4gdm1fZXZlbnRfdlggaGVhZGVyIGluIG91ciBhcHBsaWNhdGlvbnMg
c28gdGhhdCB3ZSdyZSByZWFkeSB0byBjcmVhdGUgYSAKPiByaW5nIGJ1ZmZlciB1c2luZyByZXF1
ZXN0cyBhbmQgcmVwbGllcyBvZiB0aGUgcmlnaHQgc2l6ZSwgYW5kIGFsc28gdG8gYmUgCj4gYWJs
ZSB0byBwcm9wZXJseSBpbnRlcnByZXQgdGhlIHJpbmcgYnVmZmVyIGRhdGEsIHNvIHRoZSBsZWFz
dCBmcmVxdWVudCAKPiBjaGFuZ2VzIHRvIHRoZSB2bV9ldmVudCBzdHJ1Y3QsIHRoZSBiZXR0ZXIu
CgouLi4gdGhpcyBJIHdvbmRlciB3aGV0aGVyIHRoZSBJRFQgZGV0YWlscyBzaG91bGRuJ3QgZ2V0
IGFkZGVkIGF0CnRoZSBzYW1lIHRpbWUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
