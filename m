Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F05F145CB
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 10:11:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNYeP-00064K-37; Mon, 06 May 2019 08:07:05 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNYeN-00063R-Is
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:07:03 +0000
X-Inumbo-ID: ed675882-6fd5-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ed675882-6fd5-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 08:07:01 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 02:07:00 -0600
Message-Id: <5CCFEB1E020000780022C0B0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 02:06:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEC50200007800229EA0@prv1-mh.provo.novell.com>
 <20190503154306.n4uug6nnkd7zrj7y@Air-de-Roger>
In-Reply-To: <20190503154306.n4uug6nnkd7zrj7y@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/9] x86/IRQ: improve dump_irqs()
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDE3OjQzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjIzOjQ5QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiBEb24ndCBsb2cgYSBzdHJheSB0cmFpbGluZyBjb21tYS4gU2hvcnRlbiBhIGZldyBm
aWVsZHMuCj4+IAo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+Cj4gCj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgoKVGhhbmtzLgoKPj4gLSAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5u
cl9ndWVzdHM7IGkrKyApCj4+ICsgICAgICAgICAgICBmb3IgKCBpID0gMDsgaSA8IGFjdGlvbi0+
bnJfZ3Vlc3RzOyApCj4+ICAgICAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICAgICAgZCA9IGFj
dGlvbi0+Z3Vlc3RbaV07Cj4+ICsgICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaSsr
XTsKPiAKPiBQZXIgbXkgdGFzdGUgSSB3b3VsZCBsZWF2ZSB0aGUgaW5jcmVtZW50IGluIHRoZSBm
b3IsIGJ1dCBpdCdzIGp1c3QKPiB0YXN0ZS4KCklmIGl0IHdhcyBqdXN0IHRhc3RlLCBJJ2QgaGF2
ZSBsZWZ0IGl0IHRoZXJlLCBidXQgdGhlcmUgaXMKCiAgICAgICAgICAgICAgICBwcmludGsoImQl
ZDolM2QoJWMlYyVjKSVjIiwKICAgICAgICAgICAgICAgICAgICAgICBkLT5kb21haW5faWQsIHBp
cnEsCiAgICAgICAgICAgICAgICAgICAgICAgZXZ0Y2huX3BvcnRfaXNfcGVuZGluZyhkLCBpbmZv
LT5ldnRjaG4pID8gJ1AnIDogJy0nLAogICAgICAgICAgICAgICAgICAgICAgIGV2dGNobl9wb3J0
X2lzX21hc2tlZChkLCBpbmZvLT5ldnRjaG4pID8gJ00nIDogJy0nLAogICAgICAgICAgICAgICAg
ICAgICAgIGluZm8tPm1hc2tlZCA/ICdNJyA6ICctJywKICAgICAgICAgICAgICAgICAgICAgICBp
IDwgYWN0aW9uLT5ucl9ndWVzdHMgPyAnLCcgOiAnXG4nKTsKCndoaWNoIGRlcGVuZHMgb24gdGhl
IGVhcmx5IGluY3JlbWVudCAob3IgZWxzZSB3b3VsZCBuZWVkIGFkZGluZwoiICsgMSIgb3IgIiAt
IDEiIG9uIG9uZSBzaWRlIG9mIHRoZSA8IC4gSW4gZmFjdCB0aGlzIGNoYW5nZSBpcyB0aGUKImRv
bid0IGxvZyBhIHN0cmF5IHRyYWlsaW5nIGNvbW1hIiBwYXJ0LgoKSmFuCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
