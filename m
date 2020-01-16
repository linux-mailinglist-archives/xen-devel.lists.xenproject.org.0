Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFC13D9FF
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 13:30:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is4Eo-0005Fg-1l; Thu, 16 Jan 2020 12:27:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=342x=3F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1is4Em-0005Fb-JR
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 12:27:00 +0000
X-Inumbo-ID: 78f7dd50-385b-11ea-b89f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78f7dd50-385b-11ea-b89f-bc764e2007e4;
 Thu, 16 Jan 2020 12:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579177612;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xG0JFN8etevyjTK2EWJEwuik8P/Onq41MQbZIpUOHYM=;
 b=RANLjKhfr7m5JCjGYviUqLaDhlTCT0hhkA7EaUmcWHPz8Ub5PiEJVueB
 GBSSq2P6tp12U0GshNF6yz4mTvD3Dmbxj9kG2zn/VcgOWr28Esu5fptJg
 jLbfnG7UJbzZZhGXfThboxe/qke4bEDcnlVbyymYwquIr5wpHpfZsX/SL o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4zP4qOtvlK7gC3wPmnzNr1EwmTX8rSp0aPpGn3ddDl5bsi2KVQxaOqXEmugc01R5SFEZvRGdY0
 RtxIXHcaNw9dnWPG9Ag6092BQJIZK+5Hi/s0ddRZH+zBsBQ01kee7fQWgmJH7BH4Nz07rnn3V6
 fzOtOEclmgAe2WsAsjx9GBoKZIkcuZ858QifLpe0GZ2ILxtNUN8Uv030Pm2qkQmTeeIdTm+dSk
 Xsr5RFjkwxTWlYdatpv3ZyLXAcEqUXujwpu8vOzDxcxaBdhuXWdJuub8bI3mtUc4imi+l33OZS
 Ars=
X-SBRS: 2.7
X-MesageID: 11000456
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,326,1574139600"; d="scan'208";a="11000456"
Date: Thu, 16 Jan 2020 13:25:32 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200116122532.GQ11756@Air-de-Roger>
References: <1579030581-7929-1-git-send-email-igor.druzhinin@citrix.com>
 <20200115094703.GH11756@Air-de-Roger>
 <f9b7c06e-54df-bfb2-44d5-b3ef38f2a725@suse.com>
 <20200115115338.GL11756@Air-de-Roger>
 <c13cbf1e-2e1d-dc17-ec90-a1098a11ec58@suse.com>
 <20200115134408.GN11756@Air-de-Roger>
 <e7f91928-6013-75fc-d7ec-0a70654f4b64@suse.com>
 <20200116093354.GP11756@Air-de-Roger>
 <b7a410db-5305-dc52-775b-88f07740bf5a@suse.com>
 <dfd1b200-c09a-f984-7414-cd3c10387f33@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dfd1b200-c09a-f984-7414-cd3c10387f33@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/time: update TSC stamp on restore from
 deep C-state
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, Jan Beulich <jbeulich@suse.com>,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMTYsIDIwMjAgYXQgMTI6MDk6MTJQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTYvMDEvMjAyMCAwOTozOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAx
Ni4wMS4yMDIwIDEwOjMzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+IE9uIFdlZCwgSmFu
IDE1LCAyMDIwIGF0IDA1OjIxOjE2UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBP
biAxNS4wMS4yMDIwIDE0OjQ0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+Pj4gT24gV2Vk
LCBKYW4gMTUsIDIwMjAgYXQgMDE6NDk6MjJQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
Pj4+Pj4gV2hhdCBJJ20gdGhlbiB3b3JyaWVkIGFib3V0IGlzIHRvbwo+ID4+Pj4+IGxpdHRsZSBw
cm9ncmVzcyBvYnNlcnZhYmxlIGJ5IGd1ZXN0cy4gVGhlIFBWIHRpbWUgcHJvdG9jb2wKPiA+Pj4+
PiBvdWdodCB0byBiZSBmaW5lIGluIHRoaXMgcmVnYXJkIChhbmQgY29uc3VtZXJzIG9mIHJhdyBU
U0MgdmFsdWVzCj4gPj4+Pj4gYXJlIG9uIHRoZWlyIG93biBhbnl3YXkpLCBidXQgd291bGRuJ3Qg
eW91IG5lZWQgdG8gdXBkYXRlIFRTQwo+ID4+Pj4+IG9mZnNldHMgb2YgSFZNIGd1ZXN0cyBpbiBv
cmRlciB0byBjb21wZW5zYXRlIGZvciB0aGUgZWxhcHNlZAo+ID4+Pj4+IHRpbWU/Cj4gPj4+Pgo+
ID4+Pj4gVGhhdCB3aWxsIGJlIGRvbmUgd2hlbiB0aGUgSFZNIHZDUFUgZ2V0cyBzY2hlZHVsZWQg
aW4gYXMgcGFydCBvZiB0aGUKPiA+Pj4+IHVwZGF0ZV92Y3B1X3N5c3RlbV90aW1lIGNhbGwgQUZB
SUNULiBjc3RhdGVfcmVzdG9yZV90c2Mgd2lsbCBhbHdheXMgYmUKPiA+Pj4+IGNhbGxlZCB3aXRo
IHRoZSBpZGxlIHZDUFUgY29udGV4dCwgYW5kIGhlbmNlIHRoZXJlJ3MgYWx3YXlzIGdvaW5nIHRv
Cj4gPj4+PiBiZSBhIHZDUFUgc3dpdGNoIGJlZm9yZSBzY2hlZHVsaW5nIGFueXRoaW5nIGVsc2Uu
Cj4gPj4+Cj4gPj4+IFdoaWNoIHN0ZXAgd291bGQgdGhpcyBiZT8gQWxsIEkgc2VlIGlzIGEgY2Fs
bCB0byBodm1fc2NhbGVfdHNjKCkuCj4gPj4+IEluIHRpbWUuYyBvbmx5IHRzY19zZXRfaW5mbygp
IGNhbGxzIGh2bV9zZXRfdHNjX29mZnNldCgpLgo+ID4+Cj4gPj4gTXkgYmFkLCBJJ3ZlIG1pc3Rh
a2VuIHRoZSBzY2FsaW5nIHdpdGggdGhlIG9mZnNldC4KPiA+Pgo+ID4+IEFjY291bnRpbmcgZm9y
IHRoZSBvZmZzZXQgaW4gdXBkYXRlX3ZjcHVfc3lzdGVtX3RpbWUgc2VlbXMgcXVpdGUKPiA+PiBt
b3JlIGNvbXBsaWNhdGVkIHRoYXQganVzdCB1cGRhdGluZyB0aGUgVFNDIGhlcmUsIHNvOgo+ID4+
Cj4gPj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29t
Pgo+ID4gCj4gPiBBbmQgdGhlbiAocHJlZmVyYWJseSB3aXRoICJkZWVwIiBkcm9wcGVkIGZyb20g
dGhlIGRlc2NyaXB0aW9uLAo+ID4gaWYgeW91LCBJZ29yLCBhZ3JlZSwgYW5kIHdoaWNoIGNhbiBi
ZSBkb25lIHdoaWxlIGNvbW1pdHRpbmcpCj4gPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+IAo+IE5vIG9iamVjdGlvbi4gRllJIEkgdGVzdGVkIFJvZ2VyJ3MgYXBw
cm9hY2ggdGhpcyBuaWdodCBhbmQgaXQgc2VlbXMKPiB0byB3b3JrIGF0IGxlYXN0IGluIHNlbnNl
IG9mIGZpeGluZyB0aGUgb3JpZ2luYWwgaXNzdWUuCgpSaWdodCwgYnV0IEhWTSBndWVzdHMgdXNp
bmcgYSB0aW1la2VlcGluZyBhcHByb2FjaCBzaW1pbGFyIHRvIHdoYXQgWGVuCmRvZXMgKHJlYWQg
dGhlIHBsYXRmb3JtIHRpbWVyIHBlcmlvZGljYWxseSBhbmQgY2FsY3VsYXRlIHRpbWUgYmFzZWQg
b24KdGhlIGxhc3QgcmVhZCBwbHVzIHRoZSBUU0MgZGVsdGEpIHdvdWxkIGdldCB3cm9uZyAoYmVo
aW5kIHRoZSByZWFsCnRpbWUpIHJlc3VsdHMgQUZBSUNULgoKUm9nZXIuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
