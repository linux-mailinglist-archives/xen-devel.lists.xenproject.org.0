Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BE4181CF5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:54:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3do-0002MH-A3; Wed, 11 Mar 2020 15:51:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=V419=44=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jC3dm-0002MC-OD
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:51:26 +0000
X-Inumbo-ID: 29599256-63b0-11ea-affa-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 29599256-63b0-11ea-affa-12813bfff9fa;
 Wed, 11 Mar 2020 15:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583941885;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fpEBrcoad98PKJ9iYD9tgfBuIugiy+miSj7UXJP6kgE=;
 b=H/HAJ0SEku2rJc3/Nip1NFyLyowpq6t9XiiV5FrRzW2IPtR9Jk6E5EFw
 m+JcRyaTgnDAyMPTyhjI+X7AgXzvh3yA5iQU3Y3hUp5H9sXGtpnDTgGRB
 1w0dFsC0Ij7rZ0ml4525NJxnPT/s+fAPjrj+RCkGeVu3pQPM5NJV8JxYi k=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: q8g+iyZ+bQXMVpswYGw0v3NgSjsYu+KXadUG7G5kHHb8Co8dlxHBlsfRodurshz275Xh70btK1
 rGYkpR437DWEAu+6cGVeras/5zsv+XRJMoPpGXhNne4xBHA9KjP7ttt4dLpM3pNBDreRoDhKGP
 Qw8H4cqfQQiwdqcGJ+yHQisywWDEH8/XbD26BbSQtNj3+e8ObfnOodLOGWDNtPaXzOLCQU3IQ+
 IKdcj5X9+UkL+4N75uBp9zB1oOwebKgtum2/lWtHCOKJAogUSz8fyuY6cti7nwrLC3de6gpX/F
 pms=
X-SBRS: 2.7
X-MesageID: 14198164
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="14198164"
Date: Wed, 11 Mar 2020 16:51:18 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200311155118.GD24458@Air-de-Roger.citrite.net>
References: <20200228120753.38036-1-roger.pau@citrix.com>
 <20200228120753.38036-3-roger.pau@citrix.com>
 <6a031b3f-5807-572d-682b-9a0b05f0703d@suse.com>
 <20200311153437.GC24458@Air-de-Roger.citrite.net>
 <cd51c415-dfd4-42c4-caf9-2a19ddeb8b3f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd51c415-dfd4-42c4-caf9-2a19ddeb8b3f@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v5 2/2] x86: add accessors for scratch cpu
 mask
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDQ6Mzc6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTEuMDMuMjAyMCAxNjozNCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IEZyaSwgRmViIDI4LCAyMDIwIGF0IDAxOjQyOjU4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+ID4+IE9uIDI4LjAyLjIwMjAgMTM6MDcsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+Pj4g
Q3VycmVudCB1c2FnZSBvZiB0aGUgcGVyLUNQVSBzY3JhdGNoIGNwdW1hc2sgaXMgZGFuZ2Vyb3Vz
IHNpbmNlCj4gPj4+IHRoZXJlJ3Mgbm8gd2F5IHRvIGZpZ3VyZSBvdXQgaWYgdGhlIG1hc2sgaXMg
YWxyZWFkeSBiZWluZyB1c2VkIGV4Y2VwdAo+ID4+PiBmb3IgbWFudWFsIGNvZGUgaW5zcGVjdGlv
biBvZiBhbGwgdGhlIGNhbGxlcnMgYW5kIHBvc3NpYmxlIGNhbGwgcGF0aHMuCj4gPj4+Cj4gPj4+
IFRoaXMgaXMgdW5zYWZlIGFuZCBub3QgcmVsaWFibGUsIHNvIGludHJvZHVjZSBhIG1pbmltYWwg
Z2V0L3B1dAo+ID4+PiBpbmZyYXN0cnVjdHVyZSB0byBwcmV2ZW50IG5lc3RlZCB1c2FnZSBvZiB0
aGUgc2NyYXRjaCBtYXNrIGFuZCB1c2FnZQo+ID4+PiBpbiBpbnRlcnJ1cHQgY29udGV4dC4KPiA+
Pj4KPiA+Pj4gTW92ZSB0aGUgZGVjbGFyYXRpb24gb2Ygc2NyYXRjaF9jcHVtYXNrIHRvIHNtcC5j
IGluIG9yZGVyIHRvIHBsYWNlIHRoZQo+ID4+PiBkZWNsYXJhdGlvbiBhbmQgdGhlIGFjY2Vzc29y
cyBhcyBjbG9zZSBhcyBwb3NzaWJsZS4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPj4KPiA+PiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4gCj4gPiBQaW5nPyBUaGlzIHNlZW1z
IHRvIGhhdmUgdGhlIHJlcXVpcmVkIFJCLCBidXQgaGFzbid0IGJlZW4gY29tbWl0dGVkLgo+IAo+
IFdoaWxlIGFzIHBlciB0aGUgUi1iIHRoaXMgdGVjaG5pY2FsbHkgaXMgZmluZSwgSSBjb250aW51
ZSB0byBiZQo+IHVuY2VydGFpbiB3aGV0aGVyIHdlIGFjdHVhbGx5IHdhbnQgdG8gZ28gdGhpcyBm
YXIuCgpJZiB0aGlzIGhhZCBiZWVuIGluIHBsYWNlIDU1MDBkMjY1YTJhOGZhNiAoJ3g4Ni9zbXA6
IHVzZSBBUElDIEFMTEJVVApkZXN0aW5hdGlvbiBzaG9ydGhhbmQgd2hlbiBwb3NzaWJsZScpIHdv
dWxkbid0IGhhdmUgaW50cm9kdWNlZCBhCmJvZ3VzIHVzYWdlIG9mIHRoZSBzY3JhdGNoIHBlciBj
cHUgbWFzaywgYXMgdGhlIGNoZWNrIHdvdWxkIGhhdmUKdHJpZ2dlcmVkLgoKQWZ0ZXIgZmluZGlu
ZyB0aGF0IG9uZSBvZiBteSBjb21taXRzIGludHJvZHVjZWQgYSBidWcgSSB1c3VhbGx5IGRvIHRo
ZQpleGVyY2lzZSBvZiB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGljaCBjaGVja3Mgb3Igc2FmZWd1
YXJkcyB3b3VsZCBoYXZlCnByZXZlbnRlZCBpdCwgYW5kIGhlbmNlIGNhbWUgdXAgd2l0aCB0aGlz
IHBhdGNoLgoKSSB3b3VsZCBhbHNvIGxpa2UgdG8gbm90ZSB0aGF0IHRoaXMgYWRkcyAwIG92ZXJo
ZWFkIHRvIG5vbi1kZWJ1ZwpidWlsZHMuCgo+IEFuZHJldywgYXMKPiBwZXIgYSBkaXNjdXNzaW9u
IHdlIGhhZCB3aGVuIEkgd2FzIHBvbmRlcmluZyB3aGV0aGVyIHRvIGNvbW1pdAo+IHRoaXMsIGFs
c28gbG9va3MgdG8gaGF2ZSBzaW1pbGFyIGNvbmNlcm5zICh3aGljaCBpaXJjIGhlIHNhaWQgaGUK
PiBoYWQgdm9pY2VkIG9uIGlyYykuCgpJcyB0aGUgY29uY2VybiBvbmx5IHJlbGF0ZWQgdG8gdGhl
IGZhY3QgdGhhdCB5b3UgaGF2ZSB0byB1c2UgdGhlCmdldC9wdXQgYWNjZXNzb3JzIGFuZCB0aHVz
IG1vcmUgbGluZXMgb2YgY29kZSBhcmUgYWRkZWQsIG9yIGlzIHRoZXJlCnNvbWV0aGluZyBlbHNl
PwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
