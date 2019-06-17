Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9F848474
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 15:48:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcrxo-0006Wl-Ik; Mon, 17 Jun 2019 13:46:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LqB1=UQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hcrxm-0006Wg-Pp
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 13:46:22 +0000
X-Inumbo-ID: 49e24c28-9106-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 49e24c28-9106-11e9-8980-bc764e045a96;
 Mon, 17 Jun 2019 13:46:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 17 Jun 2019 07:46:20 -0600
Message-Id: <5D0799A70200007800238D1F@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 17 Jun 2019 07:46:15 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "George Dunlap" <George.Dunlap@eu.citrix.com>,
 "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <CABfawhkgpRyC95bVTKGhnN0+2GqoRJ7zentgKQud070YCxSb+A@mail.gmail.com>
In-Reply-To: <CABfawhkgpRyC95bVTKGhnN0+2GqoRJ7zentgKQud070YCxSb+A@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE3LjA2LjE5IGF0IDE0OjIzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MzggUE0gVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPiB3cm90ZToKPj4KPj4gQ2FsbGluZyBfcHV0X3BhZ2VfdHlwZSB3aGlsZSBh
bHNvIGhvbGRpbmcgdGhlIHBhZ2VfbG9jawo+PiBmb3IgdGhhdCBwYWdlIGNhbiBjYXVzZSBhIGRl
YWRsb2NrLgo+Pgo+PiBUaGUgY29tbWVudCBiZWluZyBkcm9wcGVkIGlzIGluY29ycmVjdCBzaW5j
ZSBpdCdzIG5vdyBvdXQtb2YtZGF0ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5n
eWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+IAo+IFBhdGNoIHBpbmcuIFVuY2xlYXIgd2hvc2Ug
QWNrIGlzIHN0cmljdGx5IG5lZWRlZCBhcyB0aGlzIGlzIG9ubHkKPiB0b3VjaGluZyBtZW1fc2hh
cmluZyBjb2RlIGFuZCBub3RoaW5nIGVsc2UuCgpJbiBzdWNoIGNhc2VzIEkgdGhpbmsgaXQgc2hv
dWxkIGJlIHRoZSBuZXh0LWxldmVsLXVwIG1haW50YWluZXIgd2hvc2UKYWNrIHNob3VsZCBiZSBj
aGFzZWQ7IGF0IGxlYXN0IHRoYXQncyB3aGF0IEkgdHlwaWNhbGx5IHdvdWxkIGRvLiBUaGlzCndv
dWxkIGJlIEdlb3JnZSBpbiB0aGlzIGNhc2VzIGFmYWljdC4gT3RoZXJ3aXNlLCBpZiBHZW9yZ2Ug
d291bGRuJ3QKaGF2ZSB0aGUgY3ljbGVzIHRvIGxvb2sgYXQgdGhpcyBjbG9zZWx5IGVub3VnaCB0
byBnaXZlIGFuIGFjaywgSSdkIGJlCmhhcHB5IHRvIHByb3ZpZGUgbWluZSBhcyAicmVwbGFjZW1l
bnQiLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
