Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C171A261A0
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 12:21:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTOKI-0001Wl-Ra; Wed, 22 May 2019 10:18:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTOKH-0001WU-4R
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:18:25 +0000
X-Inumbo-ID: ee428a95-7c7a-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ee428a95-7c7a-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 10:18:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 04:18:23 -0600
Message-Id: <5CE521ED02000078002314AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 04:18:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
 <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
In-Reply-To: <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIyLjA1LjE5IGF0IDEyOjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDUvMjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gcHJlZW1w
dF9jb3VudCgpIGFuZCB0aGUgYXNzb2NpYXRlZCBwZXItY3B1IHZhcmlhYmxlIF9fcHJlZW1wdF9j
b3VudAo+PiBhcmUgdGVzdGVkIGluIGRlYnVnIGJ1aWxkIG9ubHkuIFNvIGRyb3AgdGhlbSBmb3Ig
bm9uLWRlYnVnIGJ1aWxkcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+IAo+IEknZCBiZSB0ZW1wdGVkIHRvIGZvbGQgcGF0Y2hlcyAyIGFuZCAz
IHRvZ2V0aGVyLCBiZWNhdXNlIHRoZXkgYXJlIGJvdGgKPiB0aGUgc2FtZSBjaGFuZ2UsIGFuZCBp
dCB3b3VsZCByZWR1Y2UgdGhlIGNodXJuLgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgaWRlYWxseSB3aXRoIHRoZQo+IHR3byBmb2xk
ZWQgaW50byBvbmUuCgpJJ20gYSBsaXR0bGUgc3VycHJpc2VkIGJ5IHRoaXM6IFdhc24ndCBpdCB5
b3Ugd2hvIGdlbmVyYWxseQp3YW50ZWQgd2hhdCBBU1NFUlQoKSBleHBhbmRzIHRvIChjb250cm9s
bGVkIGJ5IE5ERUJVRykKYmUgaW5kZXBlbmRlbnQgb2YgQ09ORklHX0RFQlVHLCBhdCBzb21lIHBv
aW50IGRvd24KdGhlIHJvYWQ/IEFyZW4ndCB5b3UgZXZlbiBoYXZpbmcgQVNTRVJUKClzIGVuYWJs
ZWQgaW4KcmVsZWFzZSBidWlsZHMgb2YgWGVuU2VydmVyLCBvciBhbSBJIG1pc3JlbWVtYmVyaW5n
PyBJZiBzbwpwYXRjaCAzIHdvdWxkIG1vdmUgdXMgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
