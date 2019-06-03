Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BAE232A20
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 09:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXhln-0000xq-V4; Mon, 03 Jun 2019 07:52:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXhlm-0000xh-C1
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 07:52:38 +0000
X-Inumbo-ID: 8cff5a06-85d4-11e9-94c9-a32cc7a05143
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8cff5a06-85d4-11e9-94c9-a32cc7a05143;
 Mon, 03 Jun 2019 07:52:36 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 01:52:35 -0600
Message-Id: <5CF4D1BF020000780023468C@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 01:52:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CF0F8530200007800233DE0@prv1-mh.provo.novell.com>
 <5CF0F9770200007800233E04@prv1-mh.provo.novell.com>
 <097ab8e6-8c76-f7c6-d992-09d1b38b3f44@citrix.com>
In-Reply-To: <097ab8e6-8c76-f7c6-d992-09d1b38b3f44@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] x86: further speed-up to hweight{32,
 64}()
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
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDIxOjIzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAwMjo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEFjY29yZGlu
ZyB0byBMaW51eCBjb21taXQgMDEzNjYxMWM2MiAoIm9wdGltaXplIGh3ZWlnaHQ2NCBmb3IgeDg2
XzY0IikKPj4gdGhpcyBpcyBhIGZ1cnRoZXIgaW1wcm92ZW1lbnQgb3ZlciB0aGUgdmFyaWFudCB1
c2luZyBvbmx5IGJpdHdpc2UKPj4gb3BlcmF0aW9ucy4gSXQncyBhbHNvIGEgc2xpZ2h0IGZ1cnRo
ZXIgY29kZSBzaXplIHJlZHVjdGlvbi4KPj4KPj4gU3VnZ2VzdGVkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gVGhpcyBzaG91bGQgYWxzbyBpbmNsdWRlIEFSTTY0
LCB3aGljaCBhbHNvIHVuY29uZGl0aW9uYWxseSBzZWxlY3RzCj4gSEFTX0ZBU1RfTVVMVElQTFkg
aW4gTGludXguCgpJJ3ZlIHZlcnkgaW50ZW50aW9uYWxseSBzcGxpdCB0aGUgQXJtIGNoYW5nZSBm
cm9tIHRoZSB4ODYgb25lOgpMb29raW5nIGF0IHRoZSBnZW5lcmF0ZWQgY29kZSBJJ20gdW5jb252
aW5jZWQgdGhpcyBpcyBhIHdpbgp0aGVyZSwgYW5kIGhlbmNlIEknZCBwcmVmZXIgaWYgc29tZW9u
ZSBjb3VsZCBtZWFzdXJlIHRoaXMuIEl0CmlzIGZvciB0aGlzIHJlYXNvbiB0aGF0IHBhdGNoIDMg
d2FzIGFjdHVhbGx5IHNlbnQgYXMgUkZDLgoKPiBBcyBmb3IgdGhlIHg4NiBzaWRlIG9mIHRoaW5n
cywgQWNrZWQtYnk6IEFuZHJldyBDb29wZXIKPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClRoYW5rcy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
