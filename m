Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A716810A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 16:01:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59l9-0005Bv-RB; Fri, 21 Feb 2020 14:58:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aa0I=4J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j59l8-0005Bc-Df
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:58:30 +0000
X-Inumbo-ID: 9f2c79e2-54ba-11ea-bc8e-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f2c79e2-54ba-11ea-bc8e-bc764e2007e4;
 Fri, 21 Feb 2020 14:58:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59l5-00053V-Mg; Fri, 21 Feb 2020 14:58:27 +0000
Received: from [62.60.63.48] (helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j59l5-0001gF-E0; Fri, 21 Feb 2020 14:58:27 +0000
Date: Fri, 21 Feb 2020 14:58:24 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200221145824.bj5ohma6mvbsgshd@debian>
References: <4058e92ce21627731c49b588a95809dc0affd83a.1581015491.git.hongyxia@amazon.com>
 <20200221115017.tuo2i5db5mhd5yyt@debian>
 <2326943257e6f04bc9a858ef5667295651395c85.camel@amazon.com>
 <c373d061-4a1d-502b-98a3-d40ffa11ba47@suse.com>
 <20200221143608.jexjistjxuijqkme@debian>
 <7c4d3a86-091d-c3db-8bfd-1b2a14b1639f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7c4d3a86-091d-c3db-8bfd-1b2a14b1639f@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] x86/domain_page: implement pure per-vCPU
 mapping infrastructure
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
Cc: Wei Liu <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDM6NTU6MjhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMDIuMjAyMCAxNTozNiwgV2VpIExpdSB3cm90ZToKPiA+IE9uIEZyaSwgRmVi
IDIxLCAyMDIwIGF0IDAyOjMxOjA4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDIxLjAyLjIwMjAgMTM6NTIsIFhpYSwgSG9uZ3lhbiB3cm90ZToKPiA+Pj4gT24gRnJpLCAyMDIw
LTAyLTIxIGF0IDExOjUwICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4+Pj4gT24gVGh1LCBGZWIg
MDYsIDIwMjAgYXQgMDY6NTg6MjNQTSArMDAwMCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gPj4+Pj4g
KyAgICBpZiAoIGhhc2htZm4gIT0gbWZuICYmICF2Y2FjaGUtPnJlZmNudFtpZHhdICkKPiA+Pj4+
PiArICAgICAgICBfX2NsZWFyX2JpdChpZHgsIHZjYWNoZS0+aW51c2UpOwo+ID4+Pj4KPiA+Pj4+
IEFsc28sIHBsZWFzZSBmbHVzaCB0aGUgbGluZWFyIGFkZHJlc3MgaGVyZSBhbmQgdGhlIG90aGVy
IF9fY2xlYXJfYml0Cj4gPj4+PiBsb2NhdGlvbi4KPiA+Pj4KPiA+Pj4gSSBmbHVzaCB3aGVuIGEg
bmV3IGVudHJ5IGlzIHRha2luZyBhIHNsb3QuIFllYWgsIGl0J3MgcHJvYmFibHkgYmV0dGVyCj4g
Pj4+IHRvIGZsdXNoIGVhcmxpZXIgd2hlbmV2ZXIgYSBzbG90IGlzIG5vIGxvbmdlciBpbiB1c2Uu
Cj4gPj4KPiA+PiBRdWVzdGlvbiBpcyB3aGV0aGVyIHN1Y2ggaW5kaXZpZHVhbCBmbHVzaGVzIGFy
ZW4ndCBhY3R1YWxseQo+ID4+IG1vcmUgb3ZlcmhlYWQgdGhhbiBhIHNpbmdsZSBmbHVzaCBjb3Zl
cmluZyBhbGwgcHJldmlvdXNseQo+ID4+IHRvcm4gZG93biBlbnRyaWVzLCBkb25lIGF0IHN1aXRh
YmxlIHBvaW50cyAoc2VlIHRoZSBwcmVzZW50Cj4gPj4gaW1wbGVtZW50YXRpb24pLgo+ID4gCj4g
PiBJIGFza2VkIHRvIGZsdXNoIGJlY2F1c2UgSSB3YXMgcGFyYW5vaWQgYWJvdXQgbGVhdmluZyBz
dGFsZSBlbnRyeSBhZnRlcgo+ID4gdGhlIHNsb3QgaXMgcmVjbGFpbWVkLiBJIHRoaW5rIHRoZSBh
ZGRyZXNzIHdpbGwgYmUgZmx1c2hlZCB3aGVuIGEgbmV3Cj4gPiBlbnRyeSBpcyBpbnNlcnRlZC4K
PiA+IAo+ID4gU28gdGhlIHF1ZXN0aW9uIHdvdWxkIGJlIHdoZXRoZXIgd2UgY2FyZSBhYm91dCBs
ZWF2aW5nIGEgc3RhbGUgZW50cnkgaW4KPiA+IHBsYWNlIHVudGlsIGEgbmV3IG9uZSBpcyBpbnNl
cnRlZC4KPiAKPiBXZWxsLCB3ZSBhcHBhcmVudGx5IGRvbid0IGhhdmUgYW4gaXNzdWUgd2l0aCBz
dWNoIHRvZGF5LCBzbwo+IHVubGVzcyBleHBsaWNpdGx5IHN0YXRlZCB0byB0aGUgY29udHJhcnkg
SSB0aGluayBhbnkgcmVwbGFjZW1lbnQKPiBpbXBsZW1lbnRhdGlvbiBjYW4gYW5kIHNob3VsZCBt
YWtlIHRoZSBzYW1lIGFzc3VtcHRpb25zIC8KPiBndWFyYW50ZWVzLgoKSW4gdGhhdCBjYXNlLCBI
b25neWFuJ3MgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBzaG91bGQgYmUgZmluZS4gRmx1c2hpbmcK
aXMgZGVmZXJyZWQgdG8gdGhlIGxhc3QgcG9zc2libGUgbW9tZW50IC0tIHJpZ2h0IGJlZm9yZSBu
ZXh0IHVzZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
