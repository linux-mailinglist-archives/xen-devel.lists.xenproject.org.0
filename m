Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587F4E02EB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2019 13:31:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMsIh-0002Lr-R5; Tue, 22 Oct 2019 11:26:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=je+c=YP=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMsIg-0002Lm-GH
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2019 11:26:06 +0000
X-Inumbo-ID: bc4c4522-f4be-11e9-bbab-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4c4522-f4be-11e9-bbab-bc764e2007e4;
 Tue, 22 Oct 2019 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571743565;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZZ01Hfoy9lhkML6y2pcQ3AX1dsZJq9lv/13n6e3IDHA=;
 b=IRJCMFWbRU8fQDOPnwjUOhcBw2H1GQ47JDh67AjNkbKU+ZfvWFIeu+dm
 Q6JPNcDaMDP6qd+oezU1sDXQoFVrGkJGfdOC4hgViVvuvYSoXRZ3+oe7M
 pIk69XaEwAWkjKyaZenswZMDTV5i+EQZOh0Ojlin5KzE+y6JbCTJewCwv E=;
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
IronPort-SDR: wf4D7jLq2kcHDOZ+c3rBoVayn8/T2F70c3cv/JQdT90+SoYwhryu8boMW4oUmCZGQDaFHdEAHe
 xseGvZTccqZJPsk7vTmGT/HK7F3fpSCPiish3FTCYpiLyTxGWlwGsyk956CTBp/M9lvQN2hex5
 WyY9i08+Y0ABYmADXsQCeeInOhemvJ4eKZ6fVniLFNao9dQdVhtVU+6DNz9BWlUUVGjmWwtfu6
 tJ+mZp6wGuy0A0+GFXlt5xFUKU1VXF9z/uN1FSDLpVAqT8BpLK8FBzN6ifLqEU11dDqCa9RG9z
 y+A=
X-SBRS: 2.7
X-MesageID: 7684938
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,326,1566878400"; 
   d="scan'208";a="7684938"
Date: Tue, 22 Oct 2019 13:25:57 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Message-ID: <20191022112557.GO17494@Air-de-Roger>
References: <99e719cc-936e-c3a7-c94e-ca92b6905960@citrix.com>
 <78a0e2bd-b061-99c5-aab7-970e8fc353bc@suse.com>
 <20191022105240.GN17494@Air-de-Roger>
 <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0d12857-1062-abbf-1151-66b9c060bf60@suse.com>
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

T24gVHVlLCBPY3QgMjIsIDIwMTkgYXQgMDE6MDE6MDlQTSArMDIwMCwgSsO8cmdlbiBHcm/DnyB3
cm90ZToKPiBPbiAyMi4xMC4xOSAxMjo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9u
IFR1ZSwgT2N0IDIyLCAyMDE5IGF0IDExOjI3OjQxQU0gKzAyMDAsIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4gPiA+IE9uIDIxLjEwLjE5IDExOjUxLCBTZXJnZXkgRHlhc2xpIHdyb3RlOgo+ID4gPiA+
IEhlbGxvLAo+ID4gPiA+IAo+ID4gPiA+IFdoaWxlIHRlc3RpbmcgcHYtc2hpbSBmcm9tIGEgc25h
cHNob3Qgb2Ygc3RhZ2luZyA0LjEzIGJyYW5jaCAod2l0aCBjb3JlLQo+ID4gPiA+IHNjaGVkdWxp
bmcgcGF0Y2hlcyBhcHBsaWVkKSwgc29tZSBzb3J0IG9mIHNjaGVkdWxpbmcgaXNzdWVzIHdlcmUg
dW5jb3ZlcmVkCj4gPiA+ID4gd2hpY2ggdXN1YWxseSBsZWFkcyB0byBhIGd1ZXN0IGxvY2t1cCAo
c29tZXRpbWVzIHdpdGggc29mdCBsb2NrdXAgbWVzc2FnZXMKPiA+ID4gPiBmcm9tIExpbnV4IGtl
cm5lbCkuCj4gPiA+ID4gCj4gPiA+ID4gVGhpcyBoYXBwZW5zIG1vcmUgZnJlcXVlbnRseSBvbiBT
YW5keUJyaWRnZSBDUFVzLiBBZnRlciBlbmFibGluZwo+ID4gPiA+IENPTkZJR19ERUJVRyBpbiBw
di1zaGltLCB0aGUgZm9sbG93aW5nIGFzc2VydGlvbnMgZmFpbGVkOgo+ID4gPiA+IAo+ID4gPiA+
IE51bGwgc2NoZWR1bGVyOgo+ID4gPiA+IAo+ID4gPiA+ICAgICAgIEFzc2VydGlvbiAnbG9jayA9
PSBnZXRfc2NoZWRfcmVzKGktPnJlcy0+bWFzdGVyX2NwdSktPnNjaGVkdWxlX2xvY2snIGZhaWxl
ZCBhdCAuLi5hcmUveGVuLWRpci94ZW4tcm9vdC94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaDoy
NzgKPiA+ID4gPiAgICAgICAoZnVsbCBjcmFzaCBsb2c6IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5l
dC8xMTA4ODYxLyApCj4gPiA+ID4gCj4gPiA+ID4gQ3JlZGl0MSBzY2hlZHVsZXI6Cj4gPiA+ID4g
Cj4gPiA+ID4gICAgICAgQXNzZXJ0aW9uICdjcHVtYXNrX2N5Y2xlKGNwdSwgdW5pdC0+Y3B1X2hh
cmRfYWZmaW5pdHkpID09IGNwdScgZmFpbGVkIGF0IHNjaGVkX2NyZWRpdC5jOjM4Mwo+ID4gPiA+
ICAgICAgIChmdWxsIGNyYXNoIGxvZzogaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0LzExMDg4NjIv
ICkKPiA+ID4gPiAKPiA+ID4gPiBJJ20gY3VycmVudGx5IGludmVzdGlnYXRpb24gdGhvc2UsIGJ1
dCB3b3VsZCBhcHByZWNpYXRlIGFueSBoZWxwIG9yCj4gPiA+ID4gc3VnZ2VzdGlvbnMuCj4gPiA+
IAo+ID4gPiBBbmQgbm93IGEgbW9yZSBzYW5lIHBhdGNoIHRvIHRyeS4KPiA+ID4gCj4gPiA+IAo+
ID4gPiBKdWVyZ2VuCj4gPiA+IAo+ID4gCj4gPiA+ICBGcm9tIDIwNWI3NjIyYjg0YmM2NzhmOGEw
ZDZhYzEyMWRmZjE0NDM5ZmUzMzEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gPiA+IEZyb206
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiA+ID4gVG86IHhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwo+ID4gPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+ID4gPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+
ID4gQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiA+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBEYXRlOiBUdWUsIDIyIE9jdCAyMDE5IDExOjE0
OjA4ICswMjAwCj4gPiA+IFN1YmplY3Q6IFtQQVRDSF0geGVuL3B2aHNpbTogZml4IGNwdSBvbmxp
bmluZwo+ID4gPiAKPiA+ID4gU2luY2UgY29tbWl0IDhkM2MzMjZmNjc1NmQxICgieGVuOiBsZXQg
dmNwdV9jcmVhdGUoKSBzZWxlY3QgcHJvY2Vzc29yIikKPiA+ID4gdGhlIGluaXRpYWwgcHJvY2Vz
c29yIGZvciBhbGwgcHYtc2hpbSB2Y3B1cyB3aWxsIGJlIDAsIGFzIG5vIG90aGVyIGNwdXMKPiA+
ID4gYXJlIG9ubGluZSB3aGVuIHRoZSB2Y3B1cyBhcmUgY3JlYXRlZC4gQmVmb3JlIHRoYXQgY29t
bWl0IHRoZSB2Y3B1cwo+ID4gPiB3b3VsZCBoYXZlIHByb2Nlc3NvcnMgc2V0IG5vdCBiZWluZyBv
bmxpbmUgeWV0LCB3aGljaCB3b3JrZWQganVzdCBieQo+ID4gPiBjaGFuY2UuCgpTbyBhbGwgdkNQ
VXMgZm9yIHRoZSBzaGltIGhhdmUgdGhlaXIgaGFyZCBhZmZpbml0eSBzZXQgdG8gcENQVSMwIGlm
IEkKdW5kZXJzdGFuZCBpdCBjb3JyZWN0bHkuIEZyb20gbXkgcmVhZGluZyBvZiBzY2hlZF9zZXR1
cF9kb20wX3ZjcHVzIGl0CnNlZW1zIGxpa2UgaW4gdGhlIHNoaW0gY2FzZSBhbGwgc2NoZWQgdW5p
dHMgYXJlIHBpbm5lZCB0byB0aGVpciBpZCwKd2hpY2ggd291bGQgaW1wbHkgc2NoZWQgdW5pdHMg
IT0gMCBhcmUgbm90IHBpbm5lZCB0byBDUFUjMD8KCk9yIG1heWJlIHRoZXJlJ3Mgb25seSBvbmUg
c2NoZWQgdW5pdCB0aGF0IGNvbnRhaW5zIGFsbCB0aGUgc2hpbSB2Q1BVcz8KCj4gPiA+IFdoZW4g
dGhlIHB2LXNoaW0gdmNwdSBiZWNvbWVzIGFjdGl2ZSBpdCB3aWxsIGhhdmUgYSBoYXJkIGFmZmlu
aXR5Cj4gPiA+IG5vdCBtYXRjaGluZyBpdHMgaW5pdGlhbCBwcm9jZXNzb3IgYXNzaWdubWVudCBs
ZWFkaW5nIHRvIGZhaWxpbmcKPiA+ID4gQVNTRVJUKClzIG9yIG90aGVyIHByb2JsZW1zIGRlcGVu
ZGluZyBvbiB0aGUgc2VsZWN0ZWQgc2NoZWR1bGVyLgo+ID4gCj4gPiBJJ20gc2xpZ2h0bHkgbG9z
dCBoZXJlLCB3aG8gaGFzIHNldCB0aGlzIGhhcmQgYWZmaW5pdHkgb24gdGhlIHB2c2hpbQo+ID4g
dkNQVXM/Cj4gCj4gVGhhdCBpcyBkb25lIGluIHNjaGVkX3NldHVwX2RvbTBfdmNwdXMoKS4KPgo+
ID4gCj4gPiA+IEZpeCB0aGF0IGJ5IHJlZG9pbmcgdGhlIGFmZmluaXR5IHNldHRpbmcgYWZ0ZXIg
b25saW5pbmcgdGhlIGNwdSBidXQKPiA+ID4gYmVmb3JlIHRha2luZyB0aGUgdmNwdSB1cC4KPiA+
IAo+ID4gVGhlIGNoYW5nZSBzZWVtcyBmaW5lIHRvIG1lLCBidXQgSSBkb24ndCB1bmRlcnN0YW5k
IHdoeSB0aGUgbGFjayBvZgo+ID4gdGhpcyBjYW4gY2F1c2UgYXNzZXJ0cyB0byB0cmlnZ2VyLCBh
cyByZXBvcnRlZCBieSBTZXJnZXkuIEkgYWxzbwo+ID4gd29uZGVyIHdoeSBhIGNoYW5nZSB0byBw
aW4gdkNQVSMwIHRvIHBDUFUjMCBpcyBub3QgcmVxdWlyZWQsIGJlY2F1c2UKPiA+IHB2X3NoaW1f
Y3B1X3VwIGlzIG9ubHkgdXNlZCBmb3IgQVBzLgo+IAo+IFdoZW4gdmNwdSAwIGlzIGJlaW5nIGNy
ZWF0ZWQgcGNwdSAwIGlzIG9ubGluZSBhbHJlYWR5LiBTbyB0aGUgYWZmaW5pdHkKPiBzZXQgaW4g
c2NoZWRfc2V0dXBfZG9tMF92Y3B1cygpIGlzIGZpbmUgaW4gdGhhdCBjYXNlLgoKSUlSQyBhbGwg
c2hpbSB2Q1BVcyB3aGVyZSBwaW5uZWQgdG8gdGhlaXIgaWRlbnRpdHkgcENQVSBhdCBjcmVhdGlv
biwgYW5kCnRoZXJlIHdhcyBubyBuZWVkIHRvIGRvIHRoaXMgcGluaW5nIHdoZW4gdGhlIHZDUFUg
aXMgYnJvdWdodCBvbmxpbmUuIEkKZ3Vlc3MgdGhpcyBpcyBubyBsb25nZXIgcG9zc2libGUuCgpX
aGF0IGlzIG5vdCBjbGVhciB0byBtZSBpcyB3aHkgaGF2aW5nIGFsbCB2Q1BVcyBwaW5uZWQgdG8g
cENQVSMwIGNhbgpsZWFkIHRvIGFzc2VydGlvbnMgdHJpZ2dlcmluZywgc3VjaCBzY2VuYXJpbyBp
cyBub3QgZGVzaXJhYmxlLCBidXQKc2hvdWxkbid0IGxlYWQgdG8gY3Jhc2hlcy4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
