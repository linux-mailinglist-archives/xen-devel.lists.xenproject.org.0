Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8CA15BC59
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:07:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BMv-0006ad-JS; Thu, 13 Feb 2020 10:05:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XmNm=4B=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j2BMu-0006aY-HN
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:05:12 +0000
X-Inumbo-ID: 51e37a5a-4e48-11ea-ade5-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51e37a5a-4e48-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581588311;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=0DJSNZ22YtuRQCePi//zq4ebwA5In6DCuCHS4o3GEEY=;
 b=IHZegBo9nJ0FKSXqZbQYcC2RGxuJ3x98VYZkFr4Vd/vH0CzDr3EveNCq
 OaZ+pzysYMa98bt6L/9udQYkf2yDlsVb2YKSbLuVtxizoLsyquzg4qqBZ
 8PDTFioccuaTCf2NzwBQoGNTpySzVUcibjYNHRxArGD2nF4T16lgG6prM w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: XKAvvI2LK+O4fmMwECZQttMvL+GsVqI83JMyhBX2mJuHHoRPkZcf2gptUgwpqoOrXikOJX1mt6
 wcziLQwFXh/pA+s6Pil3ZC42Jc0Ztr5D2Q1l94lF8BE9Eur51tDNeuXM2i3HWpQ/z4Q/CXON7j
 imtCwQPl7yaQXlXyK47m5n2FNwfnHLtQ7xjBREAIQT7up7S32vnuuMBzu1ek1J0aBJ95LS8Ll6
 yMJGGCrZoJRQ8o7wISAzRtZaCE3XC1Fp8OX5VoXQdR/w6QpeaCHsz22zqA10U9eM2b63zARYkS
 0Hg=
X-SBRS: 2.7
X-MesageID: 12393985
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,436,1574139600"; d="scan'208";a="12393985"
Date: Thu, 13 Feb 2020 11:05:03 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213100503.GW4679@Air-de-Roger>
References: <20200212164949.56434-1-roger.pau@citrix.com>
 <72a1c94b-fd3b-3d47-4963-d92c6293000c@xen.org>
 <c09e9d06-af6b-014e-9d0c-027cdfe753d4@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c09e9d06-af6b-014e-9d0c-027cdfe753d4@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NTM6NDNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDIuMjAyMCAyMjowNSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gT24gMTIv
MDIvMjAyMCAxNzo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4+IENvbW1pdDoKPiA+Pgo+
ID4+IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThlYzgyZmY3YTUKPiA+PiB4ODYvc21w
OiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRoYW5kIHdoZW4gcG9zc2libGUKPiA+
IAo+ID4gVGhlcmUgaXMgYSBtb3JlIHN1YnRsZSBwcm9ibGVtIGludHJvZHVjZWQgYnkgdGhpcyBw
YXRjaC4gSSB0aG91Z2h0IEkgCj4gPiB3b3VsZCBtZW50aW9uIGl0IGhlcmUganVzdCBpbiBjYXNl
IHRoaXMgYWZmZWN0IHRoZSBhcHByb2FjaCB5b3UgaGF2ZSAKPiA+IGNob3NlbiBpbiB0aGlzIHNl
cmllcy4KPiA+IAo+ID4gZ2V0X2NwdV9tYXBzKCkgaXMgdXNlZCBieSBzdG9wX21hY2hpbmVfcnVu
KCkgdG8gc2VyaWFsaXplIHRoZSBjYWxsZXJzLiAKPiA+IElmIHRoZSBsYXR0ZXIgZmFpbHMgdG8g
YWNxdWlyZSB0aGUgbG9jaywgaXQgd2lsbCBiYWlsIG91dC4gCj4gPiBVbmZvcnR1bmF0ZWx5LCBy
Y3VfYmFycmllcigpIGlzIGltcGxlbWVudGVkIHVzaW5nIHN0b3BfbWFjaGluZV9ydW4oKSBhbmQg
Cj4gPiB3aWxsIGJlIHR1cm5lZCB0byBwcmV0dHkgbXVjaCBhIE5PUCBpZiB0aGUgbGF0dGVyIGZh
aWxzIChlLmcgdGhlIGxvY2sgCj4gPiBjYW5ub3QgYmUgYWNxdWlyZWQpLgo+ID4gCj4gPiBUaGlz
IG1lYW5zIHRoYXQgdGhlIHJjdV9iYXJyaWVyKCkgd2lsbCBub3QgZG8gdGhlIGV4cGVjdGVkIGpv
YiBhbmQgCj4gPiBwb3RlbnRpYWxseSBpbnRyb2R1Y2UgdW5rbm93biBpc3N1ZXMgKGUuZyB1c2Ut
YWZ0ZXItZnJlZS4uLikuCj4gPiAKPiA+IEJlZm9yZSB5b3VyIHBhdGNoLCBpdCB3b3VsZCBoYXZl
IGJlZW4gcHJldHR5IGhhcmQgdG8gaGl0IHRoZSBwcm9ibGVtIAo+ID4gYWJvdmUuIEFmdGVyLCB5
b3UgY2FuIHJhY2UgbW9yZSBlYXNpbHkgd2l0aCByY3VfYmFycmllcigpIGFzIHNlbmRpbmcgSVBJ
IAo+ID4gaXMgcHJldHR5IGNvbW1vbi4KPiA+IAo+ID4gU2FkbHksIEkgZG9uJ3QgaGF2ZSBhIHN1
Z2dlc3Rpb24geWV0IGhvdyB0byBmaXggdGhpcyBwcm9ibGVtLgo+IAo+IEEgZnJlcXVlbnQgdXNl
IGxpa2Ugb24gdGhlIElQSSBzZW5kaW5nIHBhdGggc3VnZ2VzdHMgdGhlIGxvY2sgbWF5Cj4gd2Fu
dCB0byBiZWNvbWUgYW4gci93IG9uZSwgd2hlcmUgYm90aCBwYXJ0aWVzIHlvdSBtZW50aW9uIHdh
bnQgdG8KPiBhY3F1aXJlIGl0IGluIHJlYWQgbW9kZS4KCkknbSBhbHJlYWR5IHByZXBhcmluZyBh
IHBhdGNoIGluIHRoaXMgZGlyZWN0aW9uLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
