Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224141427F6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 11:13:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itU0s-0005sY-2V; Mon, 20 Jan 2020 10:10:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itU0q-0005sO-5o
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 10:10:28 +0000
X-Inumbo-ID: 11bdb551-3b6d-11ea-b93e-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11bdb551-3b6d-11ea-b93e-12813bfff9fa;
 Mon, 20 Jan 2020 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579515025;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=B/KpiaefPeBhg+aCxG477Um0ecWriMIoX8FgBr2R96o=;
 b=Dg/wY+sZslfOtEET41zBuQsdOT4/bOuLrR56tuCPGJxL4AFjpQbmrI+c
 /pY/iAZV+7eVqoKZGPQESjWwhPcptgHojXEd+PcoX+fEs4fShMun+rZRf
 U6JOvd2ZqQujFqicPG4kCtYD3n0ptuiuJ/OL4xHnckSR2TNLQ/XKXb4AJ E=;
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
IronPort-SDR: yh0QcZbyVjzrjjXxUzQBAx8ZoxQ+4A4sgf5VgBirUM891Ae3cCeBN8H6ih0BsV4VnuwL/ee6Io
 0pmlH7a2b70amt2c1hcIhw5X219GC3jHebW+X58Ggx8B7O4qwBjA3OoyYdUtcmn0MW28Y1PIw9
 sZAmVffXEFzGtgb1FivmOWL8umIESCtVT+Ozs2no7as3Z8uxbdczFczzXRrAQ4ZirkmPYCeAfg
 6RGRKTP8FBEMc/NepUoWncs492/dr4Erqw2Op+MlxJRBiFH2I/kgffWpOEWIqxmG/Sur9BpXta
 hKo=
X-SBRS: 2.7
X-MesageID: 11143037
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,341,1574139600"; d="scan'208";a="11143037"
Date: Mon, 20 Jan 2020 10:10:11 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: "Tian, Kevin" <kevin.tian@intel.com>
Message-ID: <20200120101011.GV11756@Air-de-Roger>
References: <osstest-145393-mainreport@xen.org>
 <20191231152925.GK11756@Air-de-Roger>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739A5A@SHSMSX104.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D739A5A@SHSMSX104.ccr.corp.intel.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [xen-unstable test] 145393: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 osstest service owner <osstest-admin@xenproject.org>, "Nakajima, 
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMTksIDIwMjAgYXQgMDI6MzY6MzJBTSArMDAwMCwgVGlhbiwgS2V2aW4gd3Jv
dGU6Cj4gPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+
IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDMxLCAyMDE5IDExOjMwIFBNCj4gPiAKPiA+IE9uIE1v
biwgRGVjIDMwLCAyMDE5IGF0IDA4OjE5OjIzUE0gKzAwMDAsIG9zc3Rlc3Qgc2VydmljZSBvd25l
ciB3cm90ZToKPiA+ID4gZmxpZ2h0IDE0NTM5MyB4ZW4tdW5zdGFibGUgcmVhbCBbcmVhbF0KPiA+
ID4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0NTM5
My8KPiA+ID4KPiA+ID4gUmVncmVzc2lvbnMgOi0oCj4gPiA+Cj4gPiA+IFRlc3RzIHdoaWNoIGRp
ZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAo+ID4gPiBpbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKPiA+ID4gIHRlc3QtYW1kNjQtYW1kNjQtcWVtdXUtbmVzdGVk
LWludGVsIDE3IGRlYmlhbi1odm0taW5zdGFsbC9sMS9sMiBmYWlsCj4gPiBSRUdSLiB2cy4gMTQ1
MDI1Cj4gPiAKPiA+IFdoaWxlIGRhOTI5MDYzOWViNWQ2YWMgZGlkIGZpeCB0aGUgdm1sYXVuY2gg
ZXJyb3IsIG5vdyB0aGUgTDEgZ3Vlc3QKPiA+IHNlZW1zIHRvIGxvb3NlIGludGVycnVwdHM6Cj4g
PiAKPiA+IFsgIDQxMi4xMjcwNzhdIE5FVERFViBXQVRDSERPRzogZXRoMCAoZTEwMDApOiB0cmFu
c21pdCBxdWV1ZSAwIHRpbWVkCj4gPiBvdXQKPiA+IFsgIDQxMi4xNTE4MzddIC0tLS0tLS0tLS0t
LVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQo+ID4gWyAgNDEyLjE2NDI4MV0gV0FSTklORzogQ1BV
OiAwIFBJRDogMCBhdCBuZXQvc2NoZWQvc2NoX2dlbmVyaWMuYzozMjAKPiA+IGRldl93YXRjaGRv
ZysweDI1Mi8weDI2MAo+ID4gWyAgNDEyLjE4NTgyMV0gTW9kdWxlcyBsaW5rZWQgaW46IHhlbl9n
bnRhbGxvYyBleHQ0IG1iY2FjaGUgamJkMiBlMTAwMAo+ID4gc3ltNTNjOHh4Cj4gPiBbICA0MTIu
MjA0Mzk5XSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA0LjE0LjE1
MCsgIzEKPiA+IFsgIDQxMi4yMjM5ODhdIEhhcmR3YXJlIG5hbWU6IFhlbiBIVk0gZG9tVSwgQklP
UyA0LjE0LXVuc3RhYmxlCj4gPiAxMi8zMC8yMDE5Cj4gPiBbICA0MTIuMjQxNjU3XSB0YXNrOiBm
ZmZmZmZmZjgyMjEzNDgwIHRhc2suc3RhY2s6IGZmZmZmZmZmODIyMDAwMDAKPiA+IFsgIDQxMi4y
NTY5NzldIFJJUDogZTAzMDpkZXZfd2F0Y2hkb2crMHgyNTIvMHgyNjAKPiA+IFsgIDQxMi4yNjg0
NDRdIFJTUDogZTAyYjpmZmZmODg4MDFmYzAzZTkwIEVGTEFHUzogMDAwMTAyODYKPiA+IFsgIDQx
Mi4yODE3MjddIFJBWDogMDAwMDAwMDAwMDAwMDAzOSBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNY
Ogo+ID4gMDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgNDEyLjMwMDA5N10gUkRYOiBmZmZmODg4MDFm
YzFkZTcwIFJTSTogZmZmZjg4ODAxZmMxNjI5OCBSREk6Cj4gPiBmZmZmODg4MDFmYzE2Mjk4Cj4g
PiBbICA0MTIuMzE4MjgzXSBSQlA6IGZmZmY4ODgwMDZjNmU0MWMgUjA4OiAwMDAwMDAwMDAwMDFm
MDY2IFIwOToKPiA+IDAwMDAwMDAwMDAwMDAyM2IKPiA+IFsgIDQxMi4zMzY1NDBdIFIxMDogZmZm
Zjg4ODAxZmMxYTNmMCBSMTE6IGZmZmZmZmZmODI4N2Q5NmQgUjEyOgo+ID4gZmZmZjg4ODAwNmM2
ZTAwMAo+ID4gWyAgNDEyLjM1NDY0M10gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIxNDogZmZmZjg4
ODAwNmUzYWM4MCBSMTU6Cj4gPiAwMDAwMDAwMDAwMDAwMDAxCj4gPiBbICA0MTIuMzczMDM0XSBG
UzogIDAwMDA3ZmEwNTI5M2VjYzAoMDAwMCkgR1M6ZmZmZjg4ODAxZmMwMDAwMCgwMDAwKQo+ID4g
a25sR1M6MDAwMDAwMDAwMDAwMDAwMAo+ID4gWyAgNDEyLjM5MzM2N10gQ1M6ICBlMDMzIERTOiAw
MDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMwo+ID4gWyAgNDEyLjQwODExMl0gQ1Iy
OiAwMDAwN2ZkODBmZjE2MDAwIENSMzogMDAwMDAwMDAwY2U3ODAwMCBDUjQ6Cj4gPiAwMDAwMDAw
MDAwMDQwNjYwCj4gPiBbICA0MTIuNDI2MzM4XSBDYWxsIFRyYWNlOgo+ID4gWyAgNDEyLjQzMjc0
N10gIDxJUlE+Cj4gPiBbICA0MTIuNDM4MTAyXSAgPyBkZXZfZGVhY3RpdmF0ZV9xdWV1ZS5jb25z
dHByb3AuMzMrMHg1MC8weDUwCj4gPiBbICA0MTIuNDUxODk2XSAgY2FsbF90aW1lcl9mbisweDJi
LzB4MTMwCj4gPiBbICA0MTIuNDY0MjA4XSAgcnVuX3RpbWVyX3NvZnRpcnErMHgzZDgvMHg0YjAK
PiA+IFsgIDQxMi40NzQ1OThdICA/IGhhbmRsZV9pcnFfZXZlbnRfcGVyY3B1KzB4M2MvMHg1MAo+
ID4gWyAgNDEyLjQ4NjQyNl0gIF9fZG9fc29mdGlycSsweDExNi8weDJjZQo+ID4gWyAgNDEyLjQ5
NTg4M10gIGlycV9leGl0KzB4Y2QvMHhlMAo+ID4gWyAgNDEyLjUwMzk5OV0gIHhlbl9ldnRjaG5f
ZG9fdXBjYWxsKzB4MjcvMHg0MAo+ID4gWyAgNDEyLjUxNDYyNl0gIHhlbl9kb19oeXBlcnZpc29y
X2NhbGxiYWNrKzB4MjkvMHg0MAo+ID4gWyAgNDEyLjUyNjY4NF0gIDwvSVJRPgo+ID4gWyAgNDEy
LjUzMjI1Ml0gUklQOiBlMDMwOnhlbl9oeXBlcmNhbGxfc2NoZWRfb3ArMHhhLzB4MjAKPiA+IFsg
IDQxMi41NDUwMzRdIFJTUDogZTAyYjpmZmZmZmZmZjgyMjAzZWEwIEVGTEFHUzogMDAwMDAyNDYK
PiA+IFsgIDQxMi41NTgzNDddIFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IGZmZmZmZmZmODIy
MTM0ODAgUkNYOgo+ID4gZmZmZmZmZmY4MTAwMTNhYQo+ID4gWyAgNDEyLjU3NjM5MF0gUkRYOiBm
ZmZmZmZmZjgyMjQ4M2U4IFJTSTogZGVhZGJlZWZkZWFkZjAwZCBSREk6Cj4gPiBkZWFkYmVlZmRl
YWRmMDBkCj4gPiBbICA0MTIuNTk0NTgwXSBSQlA6IDAwMDAwMDAwMDAwMDAwMDAgUjA4OiBmZmZm
ZmZmZmZmZmZmZmZmIFIwOToKPiA+IDAwMDAwMDAwMDAwMDAwMDAKPiA+IFsgIDQxMi42MTI4MzFd
IFIxMDogZmZmZmZmZmY4MjIwM2UzMCBSMTE6IDAwMDAwMDAwMDAwMDAyNDYgUjEyOgo+ID4gZmZm
ZmZmZmY4MjIxMzQ4MAo+ID4gWyAgNDEyLjYzMDk4MF0gUjEzOiAwMDAwMDAwMDAwMDAwMDAwIFIx
NDogZmZmZmZmZmY4MjIxMzQ4MCBSMTU6Cj4gPiBmZmZmZmZmZjgyMjM4ZTgwCj4gPiBbICA0MTIu
NjQ5MTM4XSAgPyB4ZW5faHlwZXJjYWxsX3NjaGVkX29wKzB4YS8weDIwCj4gPiBbICA0MTIuNjYw
NjcxXSAgPyB4ZW5fc2FmZV9oYWx0KzB4Yy8weDIwCj4gPiBbICA0MTIuNjcwMTc3XSAgPyBkZWZh
dWx0X2lkbGUrMHgyMy8weDExMAo+ID4gWyAgNDEyLjY3OTg2Ml0gID8gZG9faWRsZSsweDE2OC8w
eDFmMAo+ID4gWyAgNDEyLjY4ODY2Nl0gID8gY3B1X3N0YXJ0dXBfZW50cnkrMHgxNC8weDIwCj4g
PiBbICA0MTIuNjk5MDU5XSAgPyBzdGFydF9rZXJuZWwrMHg0YzMvMHg0Y2IKPiA+IFsgIDQxMi43
MDg4MDddICA/IHhlbl9zdGFydF9rZXJuZWwrMHg1MjcvMHg1MzAKPiA+IFsgIDQxMi43MjA3NzZd
IENvZGU6IGNiIGU5IGEwIGZlIGZmIGZmIDBmIDBiIDRjIDg5IGU3IGM2IDA1IDAwIGQ2IGM2IDAw
IDAxIGU4IDgyCj4gPiA4OSBmZCBmZiA4OSBkOSA0OCA4OSBjMiA0YyA4OSBlNiA0OCBjNyBjNyAz
MCBmYiAwMSA4MiBlOCA0NCBlOSBhNiBmZiA8MGY+IDBiIGU5Cj4gPiA1OCBmZSBmZiBmZiAwZiAx
ZiA4MCAwMCAwMCAwMCAwMCA0MSA1NyA0MSA1NiA0MSA1NSA0MQo+ID4gWyAgNDEyLjc2NzkwMF0g
LS0tWyBlbmQgdHJhY2UgZDllMzVjM2Y3MjVmNGI1NyBdLS0tCj4gPiBbICA0MTIuNzgwMTkzXSBl
MTAwMCAwMDAwOjAwOjA1LjAgZXRoMDogUmVzZXQgYWRhcHRlcgo+ID4gCj4gPiBUaGlzIG9ubHkg
aGFwcGVucyB3aGVuIEwxIGlzIHVzaW5nIHgyQVBJQyBhbmQgYSBndWVzdCBoYXMgYmVlbgo+ID4g
bGF1bmNoZWQgKGJ5IEwxKS4gUHJpb3IgdG8gbGF1bmNoaW5nIGFueSBndWVzdCBMMSBzZWVtcyB0
byBiZSBmdWxseQo+ID4gZnVuY3Rpb25hbC4gSSdtIGN1cnJlbnRseSB0cnlpbmcgdG8gZmlndXJl
IG91dCBob3cvd2hlbiB0aGF0IGludGVycnVwdAo+ID4gaXMgbG9zdCwgd2hpY2ggSSBiZXQgaXQn
cyByZWxhdGVkIHRvIHRoZSBtZXJnaW5nIG9mIHZtY3MgYmV0d2VlbiBMMQo+ID4gYW5kIEwyIGRv
bmUgaW4gTDAuCj4gPiAKPiA+IEFzIGEgd29ya2Fyb3VuZCBJIGNvdWxkIGRpc2FibGUgZXhwb3Np
bmcgeDJBUElDIGluIENQVUlEIHdoZW4gbmVzdGVkCj4gPiB2aXJ0dWFsaXphdGlvbiBpcyBlbmFi
bGVkIG9uIEludGVsLgo+ID4gCj4gCj4gYW55IHByb2dyZXNzIG9uIHRoaXMgcHJvYmxlbT8gUGxl
YXNlIGxldCBtZSBrbm93IGlmIEkgb3Zlcmxvb2tlZCBhIG1vcmUKPiByZWNlbnQgbWFpbC4gcG9z
c2libHkgaXQncyB1c2VmdWwgdG8gZnVsbHkgY29tcGFyZSB0aGUgQVBJQ3YgcmVsYXRlZCBzZXR0
aW5nCj4gaW4gdm1jczAyIGFuZCB2bWNzMTIuIEFsdGVybmF0aXZlbHksIHlvdSBtYXkgZGlzYWJs
ZSBhbGwgQVBJQ3YgZmVhdHVyZXMKPiB0byBzZWUgd2hldGhlciBBUElDdiBpcyB0aGUgbWFpbiBy
ZWFzb24uCgpIZWxsbywKClllcywgZm91bmQgb3V0IHdoYXQgd2FzIGNhdXNpbmcgdGhlIGlzc3Vl
LCBwYXRjaGVzIGFyZSBhdDoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMv
aHRtbC94ZW4tZGV2ZWwvMjAyMC0wMS9tc2cwMDQzNy5odG1sCgpUaGFua3MsIFJvZ2VyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
