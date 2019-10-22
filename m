Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 203C9E0584
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 15:53:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMuY7-00064T-FJ; Tue, 22 Oct 2019 13:50:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=je+c=YP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMuY6-00064O-Lt
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 13:50:10 +0000
X-Inumbo-ID: dc258e62-f4d2-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc258e62-f4d2-11e9-beca-bc764e2007e4;
 Tue, 22 Oct 2019 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571752208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=n7IvGfkGBm+Cazepp1P7Pb3ZDV5fa9i3aWvadSgAFwc=;
 b=KyXi2nwgT59SLhOkBpU1G/x1GXJTxASuS5TWxQH8FA2HOSvFWtQbO/ZM
 gfgA1aS/Zgt5TZWghxbX+DbiOhQKLCG77kNC1wp0oWVpAAH2UjxcY/YE2
 VLQSIZCd4ER1sWbkFLclEL1TPwsB8zSSQePZuIIu7VXsttBYeu9wl+XIk o=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 3UPFZ3kqXm3bwu9Gj02dX6mA9a3ux3dgLFr+IbOihXEq854FGdQAIinCjwRrWWJbmVL9gPvyfZ
 dnwtd4OqfjrNOJDhH9JvpM/rE6fxGmrGvrDiRBaR/DghwOPeONz2vhx7ZSWw0R9GQzTz6efwkC
 mZyb69+U1uApnDWc+BnF1Ha4gvER43VdNZgO0GyuRz+qMH76jv4fbOOnbQKFIu1CLXzVTAvhBC
 QaaFeL+7z8GQqZiiXGBtE7hkVW4pWgL/bKB07VE7S4b2i+oXP+47CUVH5BrLkLaSHlLElrZgo/
 8Qo=
X-SBRS: 2.7
X-MesageID: 7562020
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,327,1566878400"; 
   d="scan'208";a="7562020"
Date: Tue, 22 Oct 2019 15:50:01 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191022135001.GP17494@Air-de-Roger>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
 <20191022105240.GN17494@Air-de-Roger>
 <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
 <20191022112557.GO17494@Air-de-Roger>
 <e57f109a-d189-432f-5b06-bbfb3cf0d22a@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e57f109a-d189-432f-5b06-bbfb3cf0d22a@suse.com>
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
 George Dunlap <George.Dunlap@citrix.com>, Dario
 Faggioli <dfaggioli@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDE6NTA6NDRQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMi4xMC4xOSAxMzoyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDAxOjAxOjA5UE0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+IE9uIDIyLjEwLjE5IDEyOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
PiA+IE9uIFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDExOjI3OjQxQU0gKzAyMDAsIErDvHJnZW4gR3Jv
w58gd3JvdGU6Cj4gPiA+ID4gPiBTaW5jZSBjb21taXQgOGQzYzMyNmY2NzU2ZDEgKCJ4ZW46IGxl
dCB2Y3B1X2NyZWF0ZSgpIHNlbGVjdCBwcm9jZXNzb3IiKQo+ID4gPiA+ID4gdGhlIGluaXRpYWwg
cHJvY2Vzc29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNw
dXMKPiA+ID4gPiA+IGFyZSBvbmxpbmUgd2hlbiB0aGUgdmNwdXMgYXJlIGNyZWF0ZWQuIEJlZm9y
ZSB0aGF0IGNvbW1pdCB0aGUgdmNwdXMKPiA+ID4gPiA+IHdvdWxkIGhhdmUgcHJvY2Vzc29ycyBz
ZXQgbm90IGJlaW5nIG9ubGluZSB5ZXQsIHdoaWNoIHdvcmtlZCBqdXN0IGJ5Cj4gPiA+ID4gPiBj
aGFuY2UuCj4gPiAKPiA+IFNvIGFsbCB2Q1BVcyBmb3IgdGhlIHNoaW0gaGF2ZSB0aGVpciBoYXJk
IGFmZmluaXR5IHNldCB0byBwQ1BVIzAgaWYgSQo+IAo+IE5vLCB0aGUgaGFyZCBhZmZpbml0eSBp
cyBzZXQgdG8gcGNwdSModmNwdS1pZCksIGJ1dCB0aGUgaW5pdGlhbCBjcHUgdG8KPiBydW4gb24g
aXMgcGNwdSMwIGFzIG5vIG90aGVyIGNwdSBpcyBvbmxpbmUgd2hlbiB0aGUgdmNwdXMgYXJlIGJl
aW5nCj4gY3JlYXRlZCwgYW5kIHYtPnByb2Nlc3NvciBzaG91bGQgYWx3YXlzIGJlIGEgdmFsaWQg
b25saW5lIGNwdS4KCk9oLCBJIGRpZG4ndCBrbm93IHYtPnByb2Nlc3NvciBtdXN0IGFsd2F5cyBi
ZSB2YWxpZCwgZXZlbiBmb3Igb2ZmbGluZQp2Q1BVcy4gSSdtIHF1aXRlIHN1cmUgdGhlIHNoaW0g
cHJldmlvdXNseSBzZXQgdi0+cHJvY2Vzc29yIHRvIHBDUFVzCnRoYXQgd2hlcmUgbm90IHlldCBv
bmxpbmUuCgo+ID4gdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkuIEZyb20gbXkgcmVhZGluZyBvZiBz
Y2hlZF9zZXR1cF9kb20wX3ZjcHVzIGl0Cj4gPiBzZWVtcyBsaWtlIGluIHRoZSBzaGltIGNhc2Ug
YWxsIHNjaGVkIHVuaXRzIGFyZSBwaW5uZWQgdG8gdGhlaXIgaWQsCj4gPiB3aGljaCB3b3VsZCBp
bXBseSBzY2hlZCB1bml0cyAhPSAwIGFyZSBub3QgcGlubmVkIHRvIENQVSMwPwo+IAo+IFJpZ2h0
Lgo+IAo+ID4gCj4gPiBPciBtYXliZSB0aGVyZSdzIG9ubHkgb25lIHNjaGVkIHVuaXQgdGhhdCBj
b250YWlucyBhbGwgdGhlIHNoaW0gdkNQVXM/Cj4gCj4gTm8uCj4gCj4gPiAKPiA+ID4gPiA+IFdo
ZW4gdGhlIHB2LXNoaW0gdmNwdSBiZWNvbWVzIGFjdGl2ZSBpdCB3aWxsIGhhdmUgYSBoYXJkIGFm
ZmluaXR5Cj4gPiA+ID4gPiBub3QgbWF0Y2hpbmcgaXRzIGluaXRpYWwgcHJvY2Vzc29yIGFzc2ln
bm1lbnQgbGVhZGluZyB0byBmYWlsaW5nCj4gPiA+ID4gPiBBU1NFUlQoKXMgb3Igb3RoZXIgcHJv
YmxlbXMgZGVwZW5kaW5nIG9uIHRoZSBzZWxlY3RlZCBzY2hlZHVsZXIuCj4gPiA+ID4gCj4gPiA+
ID4gSSdtIHNsaWdodGx5IGxvc3QgaGVyZSwgd2hvIGhhcyBzZXQgdGhpcyBoYXJkIGFmZmluaXR5
IG9uIHRoZSBwdnNoaW0KPiA+ID4gPiB2Q1BVcz8KPiA+ID4gCj4gPiA+IFRoYXQgaXMgZG9uZSBp
biBzY2hlZF9zZXR1cF9kb20wX3ZjcHVzKCkuCj4gPiA+IAo+ID4gPiA+IAo+ID4gPiA+ID4gRml4
IHRoYXQgYnkgcmVkb2luZyB0aGUgYWZmaW5pdHkgc2V0dGluZyBhZnRlciBvbmxpbmluZyB0aGUg
Y3B1IGJ1dAo+ID4gPiA+ID4gYmVmb3JlIHRha2luZyB0aGUgdmNwdSB1cC4KPiA+ID4gPiAKPiA+
ID4gPiBUaGUgY2hhbmdlIHNlZW1zIGZpbmUgdG8gbWUsIGJ1dCBJIGRvbid0IHVuZGVyc3RhbmQg
d2h5IHRoZSBsYWNrIG9mCj4gPiA+ID4gdGhpcyBjYW4gY2F1c2UgYXNzZXJ0cyB0byB0cmlnZ2Vy
LCBhcyByZXBvcnRlZCBieSBTZXJnZXkuIEkgYWxzbwo+ID4gPiA+IHdvbmRlciB3aHkgYSBjaGFu
Z2UgdG8gcGluIHZDUFUjMCB0byBwQ1BVIzAgaXMgbm90IHJlcXVpcmVkLCBiZWNhdXNlCj4gPiA+
ID4gcHZfc2hpbV9jcHVfdXAgaXMgb25seSB1c2VkIGZvciBBUHMuCj4gPiA+IAo+ID4gPiBXaGVu
IHZjcHUgMCBpcyBiZWluZyBjcmVhdGVkIHBjcHUgMCBpcyBvbmxpbmUgYWxyZWFkeS4gU28gdGhl
IGFmZmluaXR5Cj4gPiA+IHNldCBpbiBzY2hlZF9zZXR1cF9kb20wX3ZjcHVzKCkgaXMgZmluZSBp
biB0aGF0IGNhc2UuCj4gPiAKPiA+IElJUkMgYWxsIHNoaW0gdkNQVXMgd2hlcmUgcGlubmVkIHRv
IHRoZWlyIGlkZW50aXR5IHBDUFUgYXQgY3JlYXRpb24sIGFuZAo+ID4gdGhlcmUgd2FzIG5vIG5l
ZWQgdG8gZG8gdGhpcyBwaW5pbmcgd2hlbiB0aGUgdkNQVSBpcyBicm91Z2h0IG9ubGluZS4gSQo+
ID4gZ3Vlc3MgdGhpcyBpcyBubyBsb25nZXIgcG9zc2libGUuCj4gCj4gVGhlIHByb2JsZW0gaXMg
bm90IHRoZSBwaW5uaW5nLCBidXQgdGhlIGluaXRpYWwgY3B1IHN0b3JlZCBpbgo+IHYtPnByb2Nl
c3Nvci4gVGhpcyByZXN1bHRzIGluIHYtPnByb2Nlc3NvciBub3QgYmVpbmcgc2V0IGluIHRoZSBo
YXJkCj4gYWZmaW5pdHkgbWFzayBvZiB0aGUgdmNwdSAob3IgYmV0dGVyOiB1bml0KSB3aGljaCB0
aGVuIHRyaWdnZXJzIHRoZQo+IHByb2JsZW1zLgoKSSBndWVzcyBqdXN0IHNldHRpbmcgdi0+cHJv
Y2Vzc29yIGluIHB2X3NoaW1fY3B1X3VwIGRpcmVjdGx5IHdvdWxkIGJlCnRvbyBpbnRydXNpdmU/
CgpJbiBhbnkgY2FzZSwgaXQgc2VlbXMgZGFuZ2Vyb3VzIHRvIGFsbG93IHZDUFVzIChldmVuIHdo
ZW4gb2ZmbGluZSkgdG8KYmUgaW4gYSBzdGF0ZSB0aGF0IHdoZW4gd29rZW4gdXAgd2lsbCBjYXVz
ZSBhc3NlcnRpb25zIGluc2lkZSB0aGUKc2NoZWR1bGluZyBsb2dpYy4gSWU6IGl0IHdvdWxkIGJl
IGJlc3QgSU1PIHRvIG5vdCBzZXQgdGhlIGhhcmQKYWZmaW5pdHkgaW4gc2NoZWRfc2V0dXBfZG9t
MF92Y3B1cyBhbmQgaW5zdGVhZCBzZXQgaXQgd2hlbiB0aGUgcENQVSBpcwpicm91Z2h0IG9ubGlu
ZSwgb3IgbWF5YmUgaGF2ZSB2Y3B1X3dha2Ugc2VsZWN0IGEgc3VpdGFibGUgdi0+cHJvY2Vzc29y
CnZhbHVlPwoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
