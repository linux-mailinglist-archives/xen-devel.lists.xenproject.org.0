Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C82F104F23
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 10:24:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXifw-0007ga-5U; Thu, 21 Nov 2019 09:22:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0uFN=ZN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iXifu-0007gV-0J
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 09:22:54 +0000
X-Inumbo-ID: 7e4f8ed4-0c40-11ea-a326-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7e4f8ed4-0c40-11ea-a326-12813bfff9fa;
 Thu, 21 Nov 2019 09:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574328173;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TdYSHYkhclUZ9qBBFqCSGSICQzDJWNwZzg+rOiagSjE=;
 b=E+Anytgkyc5lttgcpYELftL9zgmEeddK4IvWHqnIFvFH4kBPd1NurXuw
 PsfhQXimx4aRj3xicsp02apR/OPryqBXZmYcfIxfO8Af/2Lc90qLvTSw0
 mq32QAbFIxEMDM2BlcNzxUQZCM5r969CuQ0MesMBYuTQqHHNqfLHaJHwa 8=;
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
IronPort-SDR: 2pS6qUG/JpfpBi7T2cZcNLzuSA+ABV1zT+LDvFHUnRiUwTA7hb6Jhj4OJ0P/UeEghVL2ixphTV
 y0eNsQcydLCEsTw1kYiPUiBWsRojT1pT3LB/5KtBpx3pm2W3220pnspQUHjWaFT/u+qgkA1xG6
 H8ZetcG2QQST07fd+h+/nmtIaPgDn7JmeZis2/pCoVMVFg+GNBvmRUcJ9M3z4SnW9XHVWnGrKl
 9gLsHXXb19/6vkU8c9GIBhOvZK9tJPpXyXTcI9qvnnaHUjWDOYBXnhQyJK1se7OaUKQa/uwq0p
 PcM=
X-SBRS: 2.7
X-MesageID: 9183809
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,224,1571716800"; 
   d="scan'208";a="9183809"
Date: Thu, 21 Nov 2019 10:22:43 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121092116.GR72134@Air-de-Roger>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <587cd745-2bdd-1542-3021-6c55a63ef666@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <587cd745-2bdd-1542-3021-6c55a63ef666@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George
 Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDk6NTM6NDRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTEuMjAxOSAwNzowNSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiA+IFdoZXJl
IGRvIHdlIHN0YW5kIHdpdGggWGVuIDQuMTMgcmVnYXJkaW5nIGJsb2NrZXJzIGFuZCByZWxhdGVk
IHBhdGNoZXM/Cj4gPiAKPiA+IDEuIE9TU3Rlc3QgZmFpbHVyZSByZWdhcmRpbmcgbmVzdGVkIHRl
c3Q6Cj4gPiAgICAgSSdtIG5vdCBxdWl0ZSBzdXJlIHdoZXRoZXIgdGhlIGN1cnJlbnRseSBkZWJh
dGVkIHBhdGNoIG9mIEFuZHJldyBpcwo+ID4gICAgIGZpeGluZyB0aGUgcHJvYmxlbS4gSWYgbm90
LCBkbyB3ZSBrbm93IHdoYXQgaXMgbWlzc2luZyBvciBob3cgdG8KPiA+ICAgICBhZGRyZXNzIHRo
ZSBpc3N1ZT8gSWYgeWVzLCBjb3VsZCB3ZSBwbGVhc2UgY29tZSB0byBhbiBhZ3JlZW1lbnQ/Cj4g
PiAgICAgQXMgYW4gYWx0ZXJuYXRpdmU6IGFueSB0aG91Z2h0cyBhYm91dCBpZ25vcmluZyB0aGlz
IHRlc3QgZmFpbHVyZSBmb3IKPiA+ICAgICA0LjEzLVJDMyAoSU9XOiBkb2luZyBhIGZvcmNlIHB1
c2gpPwo+IAo+IEknZCByZWNvbW1lbmQgYWdhaW5zdCBkb2luZyBzbywgaW4gcGFydGljdWxhciBz
ZWVpbmcgdGhhdCBhbGwgc3RhYmxlCj4gdHJlZXMgYXJlIGFsc28gYWZmZWN0ZWQuCj4gCj4gQW5k
cmV3J3MgcGF0Y2ggbWF5IGVuZCB1cCBiZWluZyBhIHByZXJlcSB0byB0aGUgZnVsbCBmaXgsIGJ1
dCB0aGlzCj4gbG9va3MgdG8gbm90IGJlIGVudGlyZWx5IGNsZWFyIHlldCBhdCB0aGlzIHBvaW50
LiAoSSdtIGhhdmluZyBhCj4gaGFyZCB0aW1lIHNlZWluZyBhIGZhaXIgc29sdXRpb24gd2l0aG91
dCB0aGlzIGNoYW5nZS4pCj4gCj4gPiAyLiBSeXplbi9Sb21lIGZhaWx1cmVzIHdpdGggV2luZG93
cyBndWVzdHM6Cj4gPiAgICAgV2hhdCBpcyB0aGUgY3VycmVudGx5IHBsYW5uZWQgd2F5IHRvIGFk
ZHJlc3MgdGhlIHByb2JsZW0/IFdobyBpcwo+ID4gICAgIHdvcmtpbmcgb24gdGhhdD8KPiA+IAo+
ID4gMy4gUGVuZGluZyBwYXRjaGVzIGZvciA0LjEzOgo+ID4gICAgIENvdWxkIEkgcGxlYXNlIGhh
dmUgZmVlZGJhY2sgd2hpY2ggcGF0Y2hlcyB0YWdnZWQgYXMgImZvci00LjEzIiBhcmUKPiA+ICAg
ICBmaXhpbmcgcmVhbCByZWdyZXNzaW9ucyBvciBpc3N1ZXM/IEkgZG9uJ3Qgd2FudCB0byB0YWtl
IGFueSBwYXRjaGVzCj4gPiAgICAgbm90IGZpeGluZyByZWFsIHByb2JsZW1zIGFmdGVyIFJDMywg
YW5kIEkgaG9wZSB0byBiZSBhYmxlIHRvIGdldCBhCj4gPiAgICAgcHVzaCByYXRoZXIgc29vbmVy
IHRoYW4gbGF0ZXIgdG8gYmUgYWJsZSB0byBsZXQgSWFuIGN1dCBSQzMuCj4gCj4gQWNjb3JkaW5n
IHRvIG15IGxpc3QgaXQncwo+IEFNRC9JT01NVTogcmUtd29yayBtb2RlIHVwZGF0aW5nIFtyZWdy
ZXNzaW9uXQo+IGJ1aWxkOiBwcm92aWRlIG9wdGlvbiB0byBkaXNhbWJpZ3VhdGUgc3ltYm9sIG5h
bWVzIFtpc3N1ZV0KPiB4ODYvdm14OiBhbHdheXMgc3luYyBQSVIgdG8gSVJSIGJlZm9yZSB2bWVu
dHJ5IFtpc3N1ZV0KCldpbGwgcGluZyBLZXZpbiBub3cgZm9yIGZlZWRiYWNrIG9uIHRoZSBhYm92
ZS4KCkkgdGhpbms6Cgp4ODYvdmxhcGljOiBhbGxvdyBzZXR0aW5nIEFQSUNfU1BJVl9GT0NVU19E
SVNBQkxFRCBpbiB4MkFQSUMgbW9kZSBbMF0KClNob3VsZCBhbHNvIGJlIGNvbnNpZGVyZWQsIHNp
bmNlIGl0J3MgYW4gaXNzdWUuCgpUaGFua3MsIFJvZ2VyLgoKWzBdIGh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMS9tc2cwMTE1My5odG1s
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
