Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B0A4B91B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hda1O-0004os-TW; Wed, 19 Jun 2019 12:49:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hda1N-0004on-CU
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:49:01 +0000
X-Inumbo-ID: 99fa3b5e-9290-11e9-a24e-df3876c7ecf6
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99fa3b5e-9290-11e9-a24e-df3876c7ecf6;
 Wed, 19 Jun 2019 12:48:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 06:48:56 -0600
Message-Id: <5D0A2F300200007800239AB0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 06:48:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B8623020000780021F2B2@prv1-mh.provo.novell.com>
 <11c3c9c9-d1df-f9a7-a816-886026d3f34b@citrix.com>
In-Reply-To: <11c3c9c9-d1df-f9a7-a816-886026d3f34b@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 38/50] x86emul: support of AVX512*
 population count insns
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE0OjIyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTUvMDMvMjAxOSAxMTowMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IC0tLSBhL3hl
bi90b29scy9nZW4tY3B1aWQucHkKPj4gKysrIGIveGVuL3Rvb2xzL2dlbi1jcHVpZC5weQo+PiBA
QCAtMjY5LDcgKzI2OSw3IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6Cj4+ICAgICAgICAg
ICMgQVZYNTEyIGV4dGVuc2lvbnMgYWN0aW5nIChzb2xlbHkpIG9uIHZlY3RvcnMgb2YgYnl0ZXMv
d29yZHMgYXJlIG1hZGUKPj4gICAgICAgICAgIyBkZXBlbmRlbnRzIG9mIEFWWDUxMkJXIChhcyB0
byByZXF1aXJpbmcgd2lkZXIgdGhhbiAxNi1iaXQgbWFzawo+PiAgICAgICAgICAjIHJlZ2lzdGVy
cyksIGRlc3BpdGUgdGhlIFNETSBub3QgZm9ybWFsbHkgbWFraW5nIHRoaXMgY29ubmVjdGlvbi4K
Pj4gLSAgICAgICAgQVZYNTEyQlc6IFtBVlg1MTJfVkJNSSwgQVZYNTEyX1ZCTUkyXSwKPj4gKyAg
ICAgICAgQVZYNTEyQlc6IFtBVlg1MTJfVkJNSSwgQVZYNTEyX0JJVEFMRywgQVZYNTEyX1ZCTUky
XSwKPiAKPiBUaGlzIG9yZGVyaW5nIGxvb2tzIHN1c3BlY3QuICBCSVRBTEcgc2hvdWxkIGdvIGxh
c3QsIGdpdmVuIGl0cyBwb3NpdGlvbgo+IGluIHRoZSBmZWF0dXJlIGxlYWYuCgpBZnRlciByZS1i
YXNpbmcgdGhpcyBub3cgaXMKCkBAIC0yNjgsNyArMjY4LDcgQEAgZGVmIGNydW5jaF9udW1iZXJz
KHN0YXRlKToKICAgICAgICAgIyBBVlg1MTIgZXh0ZW5zaW9ucyBhY3RpbmcgKHNvbGVseSkgb24g
dmVjdG9ycyBvZiBieXRlcy93b3JkcyBhcmUgbWFkZQogICAgICAgICAjIGRlcGVuZGVudHMgb2Yg
QVZYNTEyQlcgKGFzIHRvIHJlcXVpcmluZyB3aWRlciB0aGFuIDE2LWJpdCBtYXNrCiAgICAgICAg
ICMgcmVnaXN0ZXJzKSwgZGVzcGl0ZSB0aGUgU0RNIG5vdCBmb3JtYWxseSBtYWtpbmcgdGhpcyBj
b25uZWN0aW9uLgotICAgICAgICBBVlg1MTJCVzogW0FWWDUxMl9CRjE2LCBBVlg1MTJfVkJNSSwg
QVZYNTEyX1ZCTUkyXSwKKyAgICAgICAgQVZYNTEyQlc6IFtBVlg1MTJfQkYxNiwgQVZYNTEyX0JJ
VEFMRywgQVZYNTEyX1ZCTUksIEFWWDUxMl9WQk1JMl0sCiAKICAgICAgICAgIyBUaGUgZmVhdHVy
ZXM6CiAgICAgICAgICMgICAqIFNpbmdsZSBUaHJlYWQgSW5kaXJlY3QgQnJhbmNoIFByZWRpY3Rv
cnMKCkkgZG9uJ3QgdGhpbmsgb3JkZXJpbmcgYmFzZWQgb24gKHBvdGVudGlhbGx5IHVucmVsYXRl
ZCkgbGVhdmVzIHNob3VsZApiZSBhIGNyaXRlcmlhIGhlcmUuIEluc3RlYWQsIGFzIGluZGljYXRl
ZCBiZWZvcmUsIEkgdGhpbmsgd2UnZCBiZQpiZXR0ZXIgb2ZmIHVzaW5nIGFscGhhYmV0aWNhbCBz
b3J0aW5nIGZvciBzdWNoIGxvbmdlciBkZXBlbmRlbmN5Cmxpc3RzLiBJJ2QgYmUgaGFwcHkgdG8g
cmUtc29ydCB0aGUgQVZYNTEyRiBvbmUgYXMgd2VsbC4KCj4gV2l0aCB0aGlzIGZpeGVkLCBBY2tl
ZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkknbSBub3Qg
Z29pbmcgdG8gYXBwbHkgdGhpcyB3aXRob3V0IGZ1cnRoZXIgY2xhcmlmaWNhdGlvbiBieSB5b3Ug
YXMKcGVyIHRoZSBhYm92ZSBwb2ludC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
