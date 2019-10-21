Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C8EDEAB7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 13:21:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMVhx-0000JU-HT; Mon, 21 Oct 2019 11:18:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=miS7=YO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iMVhv-0000JP-RB
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 11:18:39 +0000
X-Inumbo-ID: 87267568-f3f4-11e9-944d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87267568-f3f4-11e9-944d-12813bfff9fa;
 Mon, 21 Oct 2019 11:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571656718;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=HlfMmFIIwZCsDfWRljqwgRnsXaQriOSgrS+bmg9uGLs=;
 b=Rx7165dkyRpMk+S/vlaR1aIOw8bWltQuwoUUQt3ssit1yWY62/+ypaTO
 cbJW9EZ32y69CFqew8O+MoWkj12fm0PIaBs2B3cRqmmps7nv7eUPQMm15
 2GU0DSGraA+ONmeIj4rrmzPtEN++cbAi1/n/byus+loBGesv96qbiawwj w=;
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
IronPort-SDR: GduF+7TCwAUBx7sBCzTb0/KBxOhdrsJDuaSQSeIMcaPYOogs1UOMV5bWMfLSqvLxfJf4bZyWu1
 lAihf9hxbY/IHvpewXY93uOPr8GHIJVNXenQpxcAlJgS3Ejwp7oB8J1jflr6EqI3pRsBVbodYb
 PELfeOuVlxhNqRMMTum6pwSjIpS+UxwyZEl0clAXMcfhICWbeEDQRjNqVFfKtgSL5Ka2u6/pTa
 M8SErfIU4G+WqcjHyI6gD+MOXVaSK5+uL7/tdxAYKM3JeFg1uJzg7mDjjUAPcIo3JsAhbOqQwH
 NHs=
X-SBRS: 2.7
X-MesageID: 7189625
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7189625"
Date: Mon, 21 Oct 2019 13:18:28 +0200
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191021111828.GJ17494@Air-de-Roger>
References: <osstest-142973-mainreport@xen.org>
 <7002deb3-d5e2-19fa-0641-25eedac805a0@suse.com>
 <23981.37176.91376.271671@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23981.37176.91376.271671@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [xen-unstable test] 142973: regressions - FAIL
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MDY6MzJQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJs
ZSB0ZXN0XSAxNDI5NzM6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gT24gMjEuMTAuMTkgMTA6
MjMsIG9zc3Rlc3Qgc2VydmljZSBvd25lciB3cm90ZToKPiA+ID4gZmxpZ2h0IDE0Mjk3MyB4ZW4t
dW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVj
dC5vcmcvb3NzdGVzdC9sb2dzLzE0Mjk3My8KPiA+ID4gCj4gPiA+IFJlZ3Jlc3Npb25zIDotKAo+
ID4gPiAKPiA+ID4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcs
Cj4gPiA+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUgcnVuOgo+ID4gPiAgIHRl
c3QtYW1kNjQtYW1kNjQteGwtcHZzaGltICAgMTggZ3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCAgIGZh
aWwgUkVHUi4gdnMuIDE0Mjc1MAo+ID4gCj4gPiBSb2dlciwgSSBiZWxpZXZlIHlvdSBoYXZlIGxv
b2tlZCBpbnRvIHRoYXQgb25lPwo+ID4gCj4gPiBJIGd1ZXNzIHRoZSBjb252ZXJzYXRpb24gdmlh
IElSQyB3aXRoIElhbiByZWdhcmRpbmcgdGhlIHJhY2UgYmV0d2Vlbgo+ID4gYmxrYmFjayBhbmQg
T1NTdGVzdCB3YXMgcmVsYXRlZCB0byB0aGUgaXNzdWU/Cj4gCj4gSSB0aGluayB0aGlzIGZhaWx1
cmUgaXMgc29tZXRoaW5nIGVsc2UuCgpJIGFncmVlLgoKPiBXaGF0IGhhcHBlbnMgaGVyZSBpcyB0
aGlzOgo+IAo+IDIwMTktMTAtMjEgMDI6NTg6MzIgWiBleGVjdXRpbmcgc3NoIC4uLiAtdiByb290
QDE3Mi4xNi4xNDUuMjA1IGRhdGUgCj4gW2JvdW5jaCBvZiBvdXRwdXQgZnJvbSBzc2hdCj4gc3Rh
dHVzICh0aW1lZCBvdXQpIGF0IE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gbGluZSA1NTAuCj4gMjAx
OS0xMC0yMSAwMjo1ODo0MiBaIGV4aXQgc3RhdHVzIDQKPiAKPiAxNzIuMTYuMTQ1LjIwNSBpcyB0
aGUgZ3Vlc3QgaGVyZS4gIEllLCBgc3NoIGRhdGUgZ3Vlc3QnIHRvb2sgbG9uZ2VyCj4gdGhhbiAx
MHMuCj4gCj4gV2UgY2FuIHNlZSB0aGF0IHRoZSBndWVzdCBuZXR3b3JraW5nIGlzIHdvcmtpbmcg
c29vbiBhZnRlciB0aGUKPiBtaWdyYXRpb24gYmVjYXVzZSB3ZSBnb3QgbW9zdCBvZiB0aGUgd2F5
IHRocm91Z2ggdGhlIHNzaCBwcm90b2NvbAo+IGV4Y2hhbmdlLiAgT24gdGhlIHByZXZpb3VzIHJl
cGV0aXRpb24gdGhlIG5leHQgbWVzc2FnZSBmcm9tIHNzaCB3YXMKPiAgICBkZWJ1ZzE6IFNTSDJf
TVNHX1NFUlZJQ0VfQUNDRVBUIHJlY2VpdmVkCj4gCj4gTG9va2luZyBhdAo+ICAgaHR0cDovL2xv
Z3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0Mjk3My90ZXN0LWFtZDY0
LWFtZDY0LXhsLXB2c2hpbS9yaW1hdmExLS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1kZWJp
YW4uZ3Vlc3Qub3NzdGVzdC0taW5jb21pbmcubG9nCj4gd2hpY2ggaXMsIEkgdGhpbmssIHRoZSBs
b2cgb2YgdGhlICJuZXciIGluc3RhbmNlIG9mIGd1ZXN0LCBhZnRlcgo+IG1pZ3JhdGlvbiwgdGhl
cmUgYXJlIG1lc3NhZ2VzIGFib3V0IGtpbGxpbmcgdmFyaW91cyBzZXJ2aWNlcy4gIEVnCj4gICBb
MTkxODA2NDczOC44MjA1NTBdIHN5c3RlbWRbMV06IHN5c3RlbWQtdWRldmQuc2VydmljZTogTWFp
biBwcm9jZXNzCj4gICBleGl0ZWQsIGNvZGU9a2lsbGVkLCBzdGF0dXM9Ni9BQlJUCj4gVGhleSBk
b24ndCBzZWVtIHRvIGJlIG5vcm1hbC4gIEZvciBleGFtcGxlOgo+ICAgaHR0cDovL2xvZ3MudGVz
dC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0Mjg2NS90ZXN0LWFtZDY0LWFtZDY0
LXhsLXB2c2hpbS9yaW1hdmExLS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1kZWJpYW4uZ3Vl
c3Qub3NzdGVzdC0taW5jb21pbmcubG9nCj4gaXMgdGhlIHByZXZpb3VzIHhlbi11bnN0YWJsZSBm
bGlnaHQgYW5kIGl0IGRvZXNuJ3QgaGF2ZSB0aGVtLiAgSQo+IGxvb2tlZCBpbgo+ICAgaHR0cDov
L2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0Mjg2NS90ZXN0LWFt
ZDY0LWFtZDY0LXhsLXB2c2hpbS9yaW1hdmExLS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1k
ZWJpYW4uZ3Vlc3Qub3NzdGVzdC5sb2cuZ3oKPiB0b28gYW5kIHRoYXQgaGFzIHNvbWUgYWxhcm1p
bmcgbWVzc2FnZXMgZnJvbSB0aGUga2VybmVsIGxpa2UKPiAgWyAgNjg2LjY5MjY2MF0gcmN1X3Nj
aGVkIGt0aHJlYWQgc3RhcnZlZCBmb3IgMTkxODA5MjEyMzEyOCBqaWZmaWVzIQo+ICBnMTg0NDY3
NDQwNzM3MDk1NTEzNTkgYzE4NDQ2NzQ0MDczNzA5NTUxMzU4IGYweDAgUkNVX0dQX1dBSVRfRlFT
KDMpCj4gIC0+c3RhdGU9MHgwIC0+Y3B1PTAKPiBhbmQgYWNjb21wYW55aW5nIHN0YWNrIHRyYWNl
cy4gIEJ1dCB0aGUgdGVzdCBwYXNzZWQgdGhlcmUuICBJIHRoaW5rCj4gdGhhdCBpcyBwcm9iYWJs
eSBzb21ldGhpbmcgZWxzZSA/CgpBRkFJQ1QgdGhlcmUncyBjb3JydXB0aW9uIHdoZW4gbWlncmF0
aW5nIGFuZCBhbHNvIHNvbWUga2luZCBvZgpsb2NrdXAsIG5vdCBzdXJlIGlmIHRob3NlIGFyZSBy
ZWxhdGVkIG9yIG5vdCB5ZXQuCgo+IEFCUlQgc3VnZ2VzdHMgZ3Vlc3QgbWVtb3J5IGNvcnJ1cHRp
b24uCj4gCj4gPiBJZiB0aGlzIGlzIHRoZSBjYXNlLCBjb3VsZCB5b3UsIElhbiwgcGxlYXNlIGFk
ZCB0aGUgd29ya2Fyb3VuZCB5b3Ugd2VyZQo+ID4gdGhpbmtpbmcgb2YgdG8gT1NTdGVzdCAodW5j
b25kaXRpb25hbCBieSBub3csIG1heWJlIG1ha2UgaXQgY29uZHRpdGlvbmFsCj4gPiBsYXRlcik/
Cj4gCj4gSSBjYW4gYWRkIHRoZSBibG9jayByYWNlIHdvcmthcm91bmQgYnV0IEkgZG9uJ3QgdGhp
bmsgaXQgd2lsbCBoZWxwCj4gd2l0aCBtaWdyYXRpb24gYW55d2F5LiAgVGhlIGNhc2Ugd2hlcmUg
dGhpbmdzIGdvIHdyb25nIGlzIGRlc3Ryb3kuCj4gCj4gUm9nZXIsIGFtIEkgcmlnaHQgdGhhdCBh
IG5vcm1hbCBndWVzdCBzaHV0ZG93biBpcyByYWNlLWZyZWUgPyAgSSB0aGluawo+IHdlIHRlYXIg
dGhpbmdzIGRvd24gaW4gYSBzbG93ZXIgbWFubmVyIGFuZCB3aWxsIHRoZXJlZm9yZSBlbmQgdXAK
PiB3YWl0aW5nIGZvciBibGtiYWNrID8gIE9yIGlzIHRoYXQgbm90IHRydWUgPwoKSXQgZG9lc24n
dCByZWFsbHkgbWF0dGVyIHdoZXRoZXIgc2h1dGRvd24gb3IgZGVzdHJveSBpcyB1c2VkLCB0aGUK
aXNzdWUgaXMgdGhhdCBibGtiYWNrIHN3aXRjaGVzIHRvIHN0YXRlIDYgKENsb3NlZCkgYmVmb3Jl
IHRoZSBkaXNrIGlzCmNsb3NlZCwgYW5kIGhlbmNlIHRoZXJlJ3Mgbm8gd2F5IGZvciB0aGUgdG9v
bHN0YWNrIHRvIGRldGVjdCB3aGVuIHRoZQpkaXNrIGhhcyBhY3R1YWxseSBiZWVuIHJlbGVhc2Vk
LgoKPiAKPiBNYXliZSB0aGUgcmlnaHQgd29ya2Fyb3VuZCBpcyB0byBkaXNhYmxlIHRoZSBjb2Rl
IGluIG9zc3Rlc3Qgd2hpY2gKPiB0cmllcyB0byBjbGVhbiB1cCBhIHByZXZpb3VzIGZhaWxlZCBy
dW4uICBJIHRoaW5rIHRoZSBrZXJuZWwgZG9lc24ndAo+IG1pbmQgbXVsdGlwbGUgYmxrZnJvbnRz
IChvciBpbmRlZWQgbXVsdGlwbGUgb3RoZXIgdGFza3MpIHVzaW5nIHRoZQo+IHNhbWUgZGV2aWNl
IGF0IG9uY2UuCgpTaW5jZSB0aGUgYWN0aW9uIHdoZW4gdGhlIGRpc2sgaXMgZm91bmQgdG8gYmUg
aW4gdXNlIGlzIHRvIHRyeSB0bwp1bm1vdW50IGl0LCBtYXliZSBvc3N0ZXN0IHNob3VsZCBtYWtl
IHN1cmUgdGhlIGRpc2sgaXMgYWN0dWFsbHkKbW91bnRlZCBmaXJzdCBieSBwYXJzaW5nIHRoZSBv
dXRwdXQgb2YgbW91bnQ/IChvciBtYXliZSB0aGVyZSdzIGEKYmV0dGVyIHdheSB0byBkbyBpdCkK
ClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
