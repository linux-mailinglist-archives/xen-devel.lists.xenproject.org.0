Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C8E0267
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 12:56:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMrmV-0007ty-VB; Tue, 22 Oct 2019 10:52:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=je+c=YP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMrmU-0007tt-TS
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 10:52:50 +0000
X-Inumbo-ID: 16d53972-f4ba-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 16d53972-f4ba-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 10:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571741569;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kSK+iVmKQp602wOPD2hnF7YCvVzVKJbQYXMnFUhBetQ=;
 b=DS+RhVsr7RtpkVSLlWz68k8lJAdRly2BQ0ETs6+FJ4+WOXu7sCvn4vng
 o6R4KS0x8f+bKUQg8ISaWZSDJ9k6/cLQZTNamJTvuYx4O19Kxcn8/Kueu
 XgOvR4IkBu14S6Rovzs2BSo8JbOV8/pMuqCxxDO4qC44VMSUsnm6ZEy+j c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T9Lsz6iRptTCgxKuuPgPHfCCJ+quEtt9VIxI5zO5VKpSnfrur6e8AZVxJ22tesxk00I0H1krip
 qORsodZ1PCW9VApx3+xlAFL8pcoqOLmHFsTNRnaVmZJKSLI1s5iavUa4YTJoPfWU/KtszhWkHf
 /7Tw3b/4438UuhVNY0NktMN4/Z7HehR1P0WenTVEdAV+pOjLb0CFyvroN8Wiv4qN2Gvj2LhwFG
 wGV9SuDAt7zKbRRSHFNuRelEePUZBb8EYGJ2ymaP7wZkJmCdP6wkVM8dIitkTpl60F6Fg5oxe0
 EF0=
X-SBRS: 2.7
X-MesageID: 7683248
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,326,1566878400"; 
   d="scan'208";a="7683248"
Date: Tue, 22 Oct 2019 12:52:40 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191022105240.GN17494@Air-de-Roger>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] PV-shim 4.13 assertion failures during vcpu_wake()
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMTE6Mjc6NDFBTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMS4xMC4xOSAxMTo1MSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiA+IEhlbGxv
LAo+ID4gCj4gPiBXaGlsZSB0ZXN0aW5nIHB2LXNoaW0gZnJvbSBhIHNuYXBzaG90IG9mIHN0YWdp
bmcgNC4xMyBicmFuY2ggKHdpdGggY29yZS0KPiA+IHNjaGVkdWxpbmcgcGF0Y2hlcyBhcHBsaWVk
KSwgc29tZSBzb3J0IG9mIHNjaGVkdWxpbmcgaXNzdWVzIHdlcmUgdW5jb3ZlcmVkCj4gPiB3aGlj
aCB1c3VhbGx5IGxlYWRzIHRvIGEgZ3Vlc3QgbG9ja3VwIChzb21ldGltZXMgd2l0aCBzb2Z0IGxv
Y2t1cCBtZXNzYWdlcwo+ID4gZnJvbSBMaW51eCBrZXJuZWwpLgo+ID4gCj4gPiBUaGlzIGhhcHBl
bnMgbW9yZSBmcmVxdWVudGx5IG9uIFNhbmR5QnJpZGdlIENQVXMuIEFmdGVyIGVuYWJsaW5nCj4g
PiBDT05GSUdfREVCVUcgaW4gcHYtc2hpbSwgdGhlIGZvbGxvd2luZyBhc3NlcnRpb25zIGZhaWxl
ZDoKPiA+IAo+ID4gTnVsbCBzY2hlZHVsZXI6Cj4gPiAKPiA+ICAgICAgQXNzZXJ0aW9uICdsb2Nr
ID09IGdldF9zY2hlZF9yZXMoaS0+cmVzLT5tYXN0ZXJfY3B1KS0+c2NoZWR1bGVfbG9jaycgZmFp
bGVkIGF0IC4uLmFyZS94ZW4tZGlyL3hlbi1yb290L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC1pZi5o
OjI3OAo+ID4gICAgICAoZnVsbCBjcmFzaCBsb2c6IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8x
MTA4ODYxLyApCj4gPiAKPiA+IENyZWRpdDEgc2NoZWR1bGVyOgo+ID4gCj4gPiAgICAgIEFzc2Vy
dGlvbiAnY3B1bWFza19jeWNsZShjcHUsIHVuaXQtPmNwdV9oYXJkX2FmZmluaXR5KSA9PSBjcHUn
IGZhaWxlZCBhdCBzY2hlZF9jcmVkaXQuYzozODMKPiA+ICAgICAgKGZ1bGwgY3Jhc2ggbG9nOiBo
dHRwczovL3Bhc3RlLmRlYmlhbi5uZXQvMTEwODg2Mi8gKQo+ID4gCj4gPiBJJ20gY3VycmVudGx5
IGludmVzdGlnYXRpb24gdGhvc2UsIGJ1dCB3b3VsZCBhcHByZWNpYXRlIGFueSBoZWxwIG9yCj4g
PiBzdWdnZXN0aW9ucy4KPiAKPiBBbmQgbm93IGEgbW9yZSBzYW5lIHBhdGNoIHRvIHRyeS4KPiAK
PiAKPiBKdWVyZ2VuCj4gCgo+IEZyb20gMjA1Yjc2MjJiODRiYzY3OGY4YTBkNmFjMTIxZGZmMTQ0
MzlmZTMzMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+Cj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENj
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEFuZHJldyBDb29wZXIgPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gQ2M6
ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gRGF0ZTogVHVlLCAy
MiBPY3QgMjAxOSAxMToxNDowOCArMDIwMAo+IFN1YmplY3Q6IFtQQVRDSF0geGVuL3B2aHNpbTog
Zml4IGNwdSBvbmxpbmluZwo+IAo+IFNpbmNlIGNvbW1pdCA4ZDNjMzI2ZjY3NTZkMSAoInhlbjog
bGV0IHZjcHVfY3JlYXRlKCkgc2VsZWN0IHByb2Nlc3NvciIpCj4gdGhlIGluaXRpYWwgcHJvY2Vz
c29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNwdXMKPiBh
cmUgb25saW5lIHdoZW4gdGhlIHZjcHVzIGFyZSBjcmVhdGVkLiBCZWZvcmUgdGhhdCBjb21taXQg
dGhlIHZjcHVzCj4gd291bGQgaGF2ZSBwcm9jZXNzb3JzIHNldCBub3QgYmVpbmcgb25saW5lIHll
dCwgd2hpY2ggd29ya2VkIGp1c3QgYnkKPiBjaGFuY2UuCj4gCj4gV2hlbiB0aGUgcHYtc2hpbSB2
Y3B1IGJlY29tZXMgYWN0aXZlIGl0IHdpbGwgaGF2ZSBhIGhhcmQgYWZmaW5pdHkKPiBub3QgbWF0
Y2hpbmcgaXRzIGluaXRpYWwgcHJvY2Vzc29yIGFzc2lnbm1lbnQgbGVhZGluZyB0byBmYWlsaW5n
Cj4gQVNTRVJUKClzIG9yIG90aGVyIHByb2JsZW1zIGRlcGVuZGluZyBvbiB0aGUgc2VsZWN0ZWQg
c2NoZWR1bGVyLgoKSSdtIHNsaWdodGx5IGxvc3QgaGVyZSwgd2hvIGhhcyBzZXQgdGhpcyBoYXJk
IGFmZmluaXR5IG9uIHRoZSBwdnNoaW0KdkNQVXM/Cgo+IEZpeCB0aGF0IGJ5IHJlZG9pbmcgdGhl
IGFmZmluaXR5IHNldHRpbmcgYWZ0ZXIgb25saW5pbmcgdGhlIGNwdSBidXQKPiBiZWZvcmUgdGFr
aW5nIHRoZSB2Y3B1IHVwLgoKVGhlIGNoYW5nZSBzZWVtcyBmaW5lIHRvIG1lLCBidXQgSSBkb24n
dCB1bmRlcnN0YW5kIHdoeSB0aGUgbGFjayBvZgp0aGlzIGNhbiBjYXVzZSBhc3NlcnRzIHRvIHRy
aWdnZXIsIGFzIHJlcG9ydGVkIGJ5IFNlcmdleS4gSSBhbHNvCndvbmRlciB3aHkgYSBjaGFuZ2Ug
dG8gcGluIHZDUFUjMCB0byBwQ1BVIzAgaXMgbm90IHJlcXVpcmVkLCBiZWNhdXNlCnB2X3NoaW1f
Y3B1X3VwIGlzIG9ubHkgdXNlZCBmb3IgQVBzLgoKSSB3b3VsZCBleHBlY3QgdGhhdCBwdnNoaW0g
Z3Vlc3QgdkNQVXMgaGF2ZSBubyBoYXJkIGFmZmluaXR5IEFUTSwgYW5kCnRoYXQgd2hlbiBhIHBD
UFUgKGZyb20gdGhlIHNoaW0gUG9WKSBpcyBicm91Z2h0IG9ubGluZSBpdCB3aWxsIGJlCmFkZGVk
IHRvIHRoZSBwb29sIG9mIGF2YWlsYWJsZSBwQ1BVIGZvciB0aGUgc2hpbSB0byBzY2hlZHVsZSB2
Q1BVcwpvbi4KCj4gRml4ZXM6IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQgdmNwdV9jcmVhdGUo
KSBzZWxlY3QgcHJvY2Vzc29yIikKPiBSZXBvcnRlZC1ieTogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5
LmR5YXNsaUBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9z
c0BzdXNlLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L3B2L3NoaW0uYyB8IDIgKysKPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvcHYvc2hpbS5jIGIveGVuL2FyY2gveDg2L3B2L3NoaW0uYwo+IGluZGV4IDVlZGJjZDlhYzUu
LjQzMjllYWFlZmUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L3NoaW0uYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9wdi9zaGltLmMKPiBAQCAtODM3LDYgKzgzNyw4IEBAIGxvbmcgcHZfc2hp
bV9jcHVfdXAodm9pZCAqZGF0YSkKPiAgICAgICAgICAgICAgICAgICAgICB2LT52Y3B1X2lkLCBy
Yyk7Cj4gICAgICAgICAgICAgIHJldHVybiByYzsKPiAgICAgICAgICB9Cj4gKwo+ICsgICAgICAg
IHZjcHVfc2V0X2hhcmRfYWZmaW5pdHkodiwgY3B1bWFza19vZih2LT52Y3B1X2lkKSk7Cj4gICAg
ICB9Cj4gIAo+ICAgICAgd2FrZSA9IHRlc3RfYW5kX2NsZWFyX2JpdChfVlBGX2Rvd24sICZ2LT5w
YXVzZV9mbGFncyk7Cj4gLS0gCj4gMi4xNi40Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
