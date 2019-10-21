Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB44DEA74
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 13:09:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMVWH-0007ht-W0; Mon, 21 Oct 2019 11:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=25w6=YO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iMVWH-0007ho-0m
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 11:06:37 +0000
X-Inumbo-ID: d8672a78-f3f2-11e9-944c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d8672a78-f3f2-11e9-944c-12813bfff9fa;
 Mon, 21 Oct 2019 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571655995;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=Sc20RiAaeBbMsM4oj39sPVlI6YhA/FFLYP6jgrVScPg=;
 b=R33Skz+0+nOsu+ChJfyvP2qio1IRhOmzaZ0L4meO1u8i1C3eKS+Xk1Ys
 6cEbapV7xEhIVTflC6za4jAyksMOZHNlvGUfiZg2aHAuIZBq03fyid705
 Z8ggkeHIyJSUC76vh5/x8Yg0pgDwUJZo838eoJd/WahqwChkgTEKHPI3E 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kgptdUGJvCvTFiPLIax3fK+d7Rika/PAao82H11BcdjiUIptqg+lUJLjvCqBoFQAb48Ho4T3t4
 ycfx8vcgxwvy+ErcZW92EQRag6UiCXyvhJr55ttTgoZO9SYkiNFocf0S1ckAHR7YKYSJ8OoHz6
 ochZf4IsNeILugfTyCvtJl4oqyEMT0wM0CSoMsGCuGzprwWRMyKQaCGmqzuiIbV4ph2++mjcL2
 r+wS4+FuNAElW7EoUJ0Vhc7lnio6sAlQVRmHMIMY+2cCtjHmDpWASbbRfnvYPQS/RBzF7YiZAk
 kEY=
X-SBRS: 2.7
X-MesageID: 7487377
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,323,1566878400"; 
   d="scan'208";a="7487377"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23981.37176.91376.271671@mariner.uk.xensource.com>
Date: Mon, 21 Oct 2019 12:06:32 +0100
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
In-Reply-To: <7002deb3-d5e2-19fa-0641-25eedac805a0@suse.com>
References: <osstest-142973-mainreport@xen.org>
 <7002deb3-d5e2-19fa-0641-25eedac805a0@suse.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SsO8cmdlbiBHcm/DnyB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW3hlbi11bnN0YWJsZSB0ZXN0
XSAxNDI5NzM6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+IE9uIDIxLjEwLjE5IDEwOjIzLCBvc3N0
ZXN0IHNlcnZpY2Ugb3duZXIgd3JvdGU6Cj4gPiBmbGlnaHQgMTQyOTczIHhlbi11bnN0YWJsZSBy
ZWFsIFtyZWFsXQo+ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVz
dC9sb2dzLzE0Mjk3My8KPiA+IAo+ID4gUmVncmVzc2lvbnMgOi0oCj4gPiAKPiA+IFRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+ID4gaW5jbHVkaW5nIHRlc3Rz
IHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4gPiAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcHZzaGlt
ICAgMTggZ3Vlc3QtbG9jYWxtaWdyYXRlL3gxMCAgIGZhaWwgUkVHUi4gdnMuIDE0Mjc1MAo+IAo+
IFJvZ2VyLCBJIGJlbGlldmUgeW91IGhhdmUgbG9va2VkIGludG8gdGhhdCBvbmU/Cj4gCj4gSSBn
dWVzcyB0aGUgY29udmVyc2F0aW9uIHZpYSBJUkMgd2l0aCBJYW4gcmVnYXJkaW5nIHRoZSByYWNl
IGJldHdlZW4KPiBibGtiYWNrIGFuZCBPU1N0ZXN0IHdhcyByZWxhdGVkIHRvIHRoZSBpc3N1ZT8K
CkkgdGhpbmsgdGhpcyBmYWlsdXJlIGlzIHNvbWV0aGluZyBlbHNlLgoKV2hhdCBoYXBwZW5zIGhl
cmUgaXMgdGhpczoKCjIwMTktMTAtMjEgMDI6NTg6MzIgWiBleGVjdXRpbmcgc3NoIC4uLiAtdiBy
b290QDE3Mi4xNi4xNDUuMjA1IGRhdGUgCltib3VuY2ggb2Ygb3V0cHV0IGZyb20gc3NoXQpzdGF0
dXMgKHRpbWVkIG91dCkgYXQgT3NzdGVzdC9UZXN0U3VwcG9ydC5wbSBsaW5lIDU1MC4KMjAxOS0x
MC0yMSAwMjo1ODo0MiBaIGV4aXQgc3RhdHVzIDQKCjE3Mi4xNi4xNDUuMjA1IGlzIHRoZSBndWVz
dCBoZXJlLiAgSWUsIGBzc2ggZGF0ZSBndWVzdCcgdG9vayBsb25nZXIKdGhhbiAxMHMuCgpXZSBj
YW4gc2VlIHRoYXQgdGhlIGd1ZXN0IG5ldHdvcmtpbmcgaXMgd29ya2luZyBzb29uIGFmdGVyIHRo
ZQptaWdyYXRpb24gYmVjYXVzZSB3ZSBnb3QgbW9zdCBvZiB0aGUgd2F5IHRocm91Z2ggdGhlIHNz
aCBwcm90b2NvbApleGNoYW5nZS4gIE9uIHRoZSBwcmV2aW91cyByZXBldGl0aW9uIHRoZSBuZXh0
IG1lc3NhZ2UgZnJvbSBzc2ggd2FzCiAgIGRlYnVnMTogU1NIMl9NU0dfU0VSVklDRV9BQ0NFUFQg
cmVjZWl2ZWQKCkxvb2tpbmcgYXQKICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9y
Zy9vc3N0ZXN0L2xvZ3MvMTQyOTczL3Rlc3QtYW1kNjQtYW1kNjQteGwtcHZzaGltL3JpbWF2YTEt
LS12YXItbG9nLXhlbi1jb25zb2xlLWd1ZXN0LWRlYmlhbi5ndWVzdC5vc3N0ZXN0LS1pbmNvbWlu
Zy5sb2cKd2hpY2ggaXMsIEkgdGhpbmssIHRoZSBsb2cgb2YgdGhlICJuZXciIGluc3RhbmNlIG9m
IGd1ZXN0LCBhZnRlcgptaWdyYXRpb24sIHRoZXJlIGFyZSBtZXNzYWdlcyBhYm91dCBraWxsaW5n
IHZhcmlvdXMgc2VydmljZXMuICBFZwogIFsxOTE4MDY0NzM4LjgyMDU1MF0gc3lzdGVtZFsxXTog
c3lzdGVtZC11ZGV2ZC5zZXJ2aWNlOiBNYWluIHByb2Nlc3MKICBleGl0ZWQsIGNvZGU9a2lsbGVk
LCBzdGF0dXM9Ni9BQlJUClRoZXkgZG9uJ3Qgc2VlbSB0byBiZSBub3JtYWwuICBGb3IgZXhhbXBs
ZToKICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQy
ODY1L3Rlc3QtYW1kNjQtYW1kNjQteGwtcHZzaGltL3JpbWF2YTEtLS12YXItbG9nLXhlbi1jb25z
b2xlLWd1ZXN0LWRlYmlhbi5ndWVzdC5vc3N0ZXN0LS1pbmNvbWluZy5sb2cKaXMgdGhlIHByZXZp
b3VzIHhlbi11bnN0YWJsZSBmbGlnaHQgYW5kIGl0IGRvZXNuJ3QgaGF2ZSB0aGVtLiAgSQpsb29r
ZWQgaW4KICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3Mv
MTQyODY1L3Rlc3QtYW1kNjQtYW1kNjQteGwtcHZzaGltL3JpbWF2YTEtLS12YXItbG9nLXhlbi1j
b25zb2xlLWd1ZXN0LWRlYmlhbi5ndWVzdC5vc3N0ZXN0LmxvZy5negp0b28gYW5kIHRoYXQgaGFz
IHNvbWUgYWxhcm1pbmcgbWVzc2FnZXMgZnJvbSB0aGUga2VybmVsIGxpa2UKIFsgIDY4Ni42OTI2
NjBdIHJjdV9zY2hlZCBrdGhyZWFkIHN0YXJ2ZWQgZm9yIDE5MTgwOTIxMjMxMjggamlmZmllcyEK
IGcxODQ0Njc0NDA3MzcwOTU1MTM1OSBjMTg0NDY3NDQwNzM3MDk1NTEzNTggZjB4MCBSQ1VfR1Bf
V0FJVF9GUVMoMykKIC0+c3RhdGU9MHgwIC0+Y3B1PTAKYW5kIGFjY29tcGFueWluZyBzdGFjayB0
cmFjZXMuICBCdXQgdGhlIHRlc3QgcGFzc2VkIHRoZXJlLiAgSSB0aGluawp0aGF0IGlzIHByb2Jh
Ymx5IHNvbWV0aGluZyBlbHNlID8KCkFCUlQgc3VnZ2VzdHMgZ3Vlc3QgbWVtb3J5IGNvcnJ1cHRp
b24uCgo+IElmIHRoaXMgaXMgdGhlIGNhc2UsIGNvdWxkIHlvdSwgSWFuLCBwbGVhc2UgYWRkIHRo
ZSB3b3JrYXJvdW5kIHlvdSB3ZXJlCj4gdGhpbmtpbmcgb2YgdG8gT1NTdGVzdCAodW5jb25kaXRp
b25hbCBieSBub3csIG1heWJlIG1ha2UgaXQgY29uZHRpdGlvbmFsCj4gbGF0ZXIpPwoKSSBjYW4g
YWRkIHRoZSBibG9jayByYWNlIHdvcmthcm91bmQgYnV0IEkgZG9uJ3QgdGhpbmsgaXQgd2lsbCBo
ZWxwCndpdGggbWlncmF0aW9uIGFueXdheS4gIFRoZSBjYXNlIHdoZXJlIHRoaW5ncyBnbyB3cm9u
ZyBpcyBkZXN0cm95LgoKUm9nZXIsIGFtIEkgcmlnaHQgdGhhdCBhIG5vcm1hbCBndWVzdCBzaHV0
ZG93biBpcyByYWNlLWZyZWUgPyAgSSB0aGluawp3ZSB0ZWFyIHRoaW5ncyBkb3duIGluIGEgc2xv
d2VyIG1hbm5lciBhbmQgd2lsbCB0aGVyZWZvcmUgZW5kIHVwCndhaXRpbmcgZm9yIGJsa2JhY2sg
PyAgT3IgaXMgdGhhdCBub3QgdHJ1ZSA/CgpNYXliZSB0aGUgcmlnaHQgd29ya2Fyb3VuZCBpcyB0
byBkaXNhYmxlIHRoZSBjb2RlIGluIG9zc3Rlc3Qgd2hpY2gKdHJpZXMgdG8gY2xlYW4gdXAgYSBw
cmV2aW91cyBmYWlsZWQgcnVuLiAgSSB0aGluayB0aGUga2VybmVsIGRvZXNuJ3QKbWluZCBtdWx0
aXBsZSBibGtmcm9udHMgKG9yIGluZGVlZCBtdWx0aXBsZSBvdGhlciB0YXNrcykgdXNpbmcgdGhl
CnNhbWUgZGV2aWNlIGF0IG9uY2UuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
