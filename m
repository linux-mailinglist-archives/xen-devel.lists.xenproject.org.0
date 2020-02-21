Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC051687F4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 20:56:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5EML-0005Sg-Bb; Fri, 21 Feb 2020 19:53:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wXTA=4J=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1j5EMK-0005Sb-S8
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 19:53:12 +0000
X-Inumbo-ID: ca191f4c-54e3-11ea-b0fd-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca191f4c-54e3-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582314792;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9laf6Qh/Gp09R1ogLD4kK3AZjDnIY4aEYqAZxbGEWGU=;
 b=R1BoRjW4+TNtlkZXykYYtC1UT8sz+DVo7DvcWFSby5u4abeHKnbITTtv
 rN+zTUJSVg7aR4eUs4RnwjrtnzQeA6IDEqHjamYd+Vj9ToH/i8ElYfOlm
 iB0X320RUqV2Hku1yqdLK3arTggGdvDWVZClgCULArxurkN/hn+k0msnZ E=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PYSwSZ3QeI7m4ecWT9ZYdaeVVi6IzQUirMoDxNyit/qMpOYD/ys8om51mK4tKs6bZZryzk+PzW
 oGzhb3Zti2zZhclZyZObsPREXMXyKeze5vPA7E3iyX94qtpgnDAhBqG749DTYlTDKMXpouhnTP
 FXwYhAU2p4s+yxEWy7imS8vsRDDmA/X8fZbMB+AvoFnYMDwVs5GN6YHu2kx0+0MRY675/nwDAQ
 +PTGiRrRgmhQAyE2cuPEsUQqEf6m2ryXQaGYDkOQ+dOO6WbRdHq9OVlHsn0ARxUeccLFwc3yct
 Gd0=
X-SBRS: 2.7
X-MesageID: 12818693
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,469,1574139600"; d="scan'208";a="12818693"
Date: Fri, 21 Feb 2020 19:53:08 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200221195308.GC2193@perard.uk.xensource.com>
References: <20200221185550.30545-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200221185550.30545-1-andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/build: Fix -mskip-rax-setup handling
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMjEsIDIwMjAgYXQgMDY6NTU6NTBQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBUaGUgd2F5IC1tc2tpcC1yYXgtc2V0dXAgaXMgY3VycmVudGx5IHNwZWNpZmllZCBy
ZXN1bHRzIGluIGNvbXBpbGVyIHN1cHBvcnQKPiBiZWluZyBldmFsdWF0ZWQgcGVyIHRyYW5zbGF0
aW9uIHVuaXQsIHJhdGhlciB0aGFuIHBlciBzdWJkaXIuICBTd2l0Y2ggdG8gdXNpbmcKPiBjYy1h
ZGQtb3B0aW9uIGluc3RlYWQuCj4gCj4gVGhpcyBkcm9wcyB0aGUgbnVtYmVyIG9mIGNhbGxvdXRz
IGZyb20gNDI4IHRvIDYwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiBDQzogUm9nZXIgUGF1IE1vbm7D
qSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gQ0M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBl
cmFyZEBjaXRyaXguY29tPgo+IAo+IFRoaXMgZHJvcHMgYWJvdXQgMC41cyBmcm9tIG15IGNjYWNo
ZS1hY2NlbGVyYXRlZCBidXQgb3RoZXJ3aXNlLWNsZWFuIGJ1aWxkLAo+IGFuZCB3aWxsIGxpa2Vs
eSBoYXZlIGEgbW9yZSBwcm9ub3VuY2VkIGRpZmZlcmVuY2Ugb24gb2xkZXIgaGFyZHdhcmUuICBJ
ZiBpdAo+IHdhbnRzIGJhY2twb3J0aW5nLCBpdCB3YW50cyB0byBnbyBiYWNrIGluIHRoaXMgZm9y
bS4KPiAKPiBBbHRlcm5hdGl2ZWx5LCBpdCB3b3VsZCBiZSBuaWNlIHRvIGdldCB0aGlzIG1vdmVk
IHRvIEtjb25maWcgdGltZS4gIEFudGhvbnk6Cj4gRG8geW91IGhhdmUgYW55IHBhcnQgb2YgeW91
ciBzZXJpZXMgYWxyZWFkeSBkb2luZyB0aGlzLCBvciBhbnkgc3VnZ2VzdGlvbnMgb24KPiBob3cg
YmVzdCB0byBkbyBpdCB3aXRob3V0IGNvbGxpZGluZyB3aXRoIHlvdXIgd29yaz8KClRoZSB2ZXJz
aW9uIG9mIG15IHNlcmllcyB0aGF0IEkndmUgc2VudCBzb21lIHRpbWUgYWdvICh2MikgYWxyZWFk
eSBkbwpiZXR0ZXIgdGhhbiB0aGlzIDotUCwgc2luY2UgdGhhdCB3b3VsZCBnZXQgY2FsbCBvbmx5
IG9uY2UgaW4KeGVuL01ha2VmaWxlIChpbnN0ZWFkIG9mIGV2ZXJ5dGltZSBSdWxlcy5tayBpcyBj
YWxsZWQgYWdhaW4pLgoKSSBkb24ndCBoYXZlIGEgYmV0dGVyIHN1Z2dlc3Rpb24gdGhhdCBjb3Vs
ZCB3b3JrIHdpdGhvdXQgY29sbGlkaW5nIHdpdGgKbXkgc2VyaWVzLCBidXQgaXQgd29uJ3QgYmUg
dG9vIGhhcmQgdG8gcmViYXNlLgoKVGhhbmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
