Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30DFFC717
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 14:14:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVEvU-0000mu-Rb; Thu, 14 Nov 2019 13:12:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwvT=ZG=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iVEvS-0000mp-PT
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 13:12:42 +0000
X-Inumbo-ID: 701da5a4-06e0-11ea-a24d-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 701da5a4-06e0-11ea-a24d-12813bfff9fa;
 Thu, 14 Nov 2019 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573737161;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=TTFKsrJ4hBhnfGMBEsB7wfQYUKFrDhS3eLE8QioFh+o=;
 b=QYms0LrObvfcmDPZ2bOG8YN8Re9+CdsrqUtiBNn861DCCq3RsN2LI1Fv
 A3fvSk4EuiwB1ik+VsbD83OprXT3eYE1ozAOvotmTG0WtGnSI0kG5ifoV
 nN+nb79IuvuX5C7hRZHVhHcfRT8b8jcgw0UaCwQy98J9XvOxx9xzO4XLg E=;
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
IronPort-SDR: ySMDeXK2h48xUe+W99ZZ4P5HKQ2NxlVQ4Ubbs2rJp/H0hBlH4N+j+I08nmKbkneZwdMhDAyiNO
 ESrhWruPr1PFTeUQ0GnRMuyw0xnOjv6phehFU0ijN+lXSyjBbBi5BTyBjvzxkYQUIJoUgZex5I
 GhYGHq6Y6MoMVGAHBbiM0z7wiuuKFHTl9FDcy32uSNtJaetTWg4TrmgE5FMs5CxAR7e2a02Ual
 dgXYOkFQ6gX8GuLLYuZWZVd9mEPraoa3PrjdJx6PMGHa8Zlq27K0r3qo5c3yFyV5FUfjhd43hK
 bpY=
X-SBRS: 2.7
X-MesageID: 8856064
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8856064"
Date: Thu, 14 Nov 2019 14:12:29 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191114131229.GC72134@Air-de-Roger>
References: <c46e975b-ef68-f09a-2790-3c4fb503cbf9@suse.com>
 <20191114093820.GB72134@Air-de-Roger>
 <d0bb88b8-2cf6-c631-4f96-a90d921be850@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d0bb88b8-2cf6-c631-4f96-a90d921be850@suse.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86: fix clang .macro retention check
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, JulienGrall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMTQsIDIwMTkgYXQgMTI6NDM6MzNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTQuMTEuMjAxOSAxMDozOCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIE5vdiAxMywgMjAxOSBhdCAwNjowMTo0MFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiAtLS0gYS94ZW4vYXJjaC94ODYvUnVsZXMubWsKPiA+PiArKysgYi94ZW4vYXJjaC94
ODYvUnVsZXMubWsKPiA+PiBAQCAtODIsNiArNjQsNiBAQCAkKGNhbGwgYXMtb3B0aW9uLWFkZCxD
RkxBR1MsQ0MsIi5pbmNsdWRlCj4gPj4gICMgQ2hlY2sgd2hldGhlciBjbGFuZyBrZWVwcyAubWFj
cm8tcyBiZXR3ZWVuIGFzbSgpLXM6Cj4gPj4gICMgaHR0cHM6Ly9idWdzLmxsdm0ub3JnL3Nob3df
YnVnLmNnaT9pZD0zNjExMAo+ID4+ICAkKGNhbGwgYXMtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsXAo+
ID4+IC0gICAgICAgICAgICAgICAgICAgICAiLm1hY3JvIEZPT1xuLmVuZG1cIik7IGFzbSB2b2xh
dGlsZSAoXCIubWFjcm8gRk9PXG4uZW5kbSIsXAo+ID4+ICsgICAgICAgICAgICAgICAgICAgICAi
Lm1hY3JvIEZPT1xuLmVuZG0iJCQoY2xvc2UpOyBhc20gdm9sYXRpbGUgJCQob3BlbikiLm1hY3Jv
IEZPT1xuLmVuZG0iLFwKPiA+IAo+ID4gVGhhbmtzLCB3aGlsZSBoZXJlIGNvdWxkIHlvdSBhbHNv
IHJlcGxhY2UgdGhlICdcbicgd2l0aCBhICc7Jz8gJ1xuJwo+ID4gZG9lc24ndCB3b3JrIHByb3Bl
cmx5IGFuZCBnaXZlcyBtZSB0aGUgZm9sbG93aW5nIGVycm9yOgo+ID4gCj4gPiA8c3RkaW4+OjE6
MzI6IGVycm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3IsLVdp
bnZhbGlkLXBwLXRva2VuXQo+ID4gdm9pZCBfKHZvaWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFj
cm8gRk9PCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4gPHN0ZGluPjox
OjMyOiBlcnJvcjogZXhwZWN0ZWQgc3RyaW5nIGxpdGVyYWwgaW4gJ2FzbScKPiA+IDxzdGRpbj46
Mzo2OiBlcnJvcjogbWlzc2luZyB0ZXJtaW5hdGluZyAnIicgY2hhcmFjdGVyIFstV2Vycm9yLC1X
aW52YWxpZC1wcC10b2tlbl0KPiA+IC5lbmRtIiApOyB9Cj4gPiAgICAgIF4KPiA+IDxzdGRpbj46
MzoxMjogZXJyb3I6IGV4cGVjdGVkICcpJwo+ID4gLmVuZG0iICk7IH0KPiA+ICAgICAgICAgICAg
Xgo+ID4gPHN0ZGluPjoxOjI5OiBub3RlOiB0byBtYXRjaCB0aGlzICcoJwo+ID4gdm9pZCBfKHZv
aWQpIHsgYXNtIHZvbGF0aWxlICggICIubWFjcm8gRk9PCj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgo+ID4gPHN0ZGluPjozOjEyOiBlcnJvcjogZXhwZWN0ZWQgJ30nCj4gPiAuZW5k
bSIgKTsgfQo+ID4gICAgICAgICAgICBeCj4gPiA8c3RkaW4+OjE6MTQ6IG5vdGU6IHRvIG1hdGNo
IHRoaXMgJ3snCj4gPiB2b2lkIF8odm9pZCkgeyBhc20gdm9sYXRpbGUgKCAgIi5tYWNybyBGT08K
PiA+ICAgICAgICAgICAgICBeCj4gCj4gU28gdGhpcyBtdXN0IGJlIHlldCBhbm90aGVyIGlzc3Vl
IC0gSSBkaWQgc3BlY2lmaWNhbGx5IGxvb2sgYXQgdGhlIHdoYXQKPiBnZXRzIGhhbmRlZCB0byB0
aGUgY29tcGlsZXIsIGFuZCBJIGRpZCBub3Qgc2VlIHRoZSBhYm92ZS4gSSB3b25kZXIKPiB3aGV0
aGVyIHRoYXQncyBhbHNvIHJlbGF0ZWQgdG8gdGhlIFwiIHRoYXQgSSBmb3VuZCBuZWNlc3Nhcnkg
dG8gZHJvcCAtCj4gd2l0aCB3aGF0IHlvdSBzYXkgSSdkIGV4cGVjdCB0aGUgdW4tZXNjYXBlZCBk
b3VibGUgcXVvdGVzIHdvbid0IHdvcmsKPiBmb3IgeW91LgoKQUZBSUsgdGhvc2Ugd29yayBmaW5l
LgoKPiBJIHN1cHBvc2UgdGhvdWdoIHRoaXMgdW4tZXNjYXBpbmcgKG9yIG5vdCkgaGFwcGVucyBh
dCBhIGxldmVsCj4gb3RoZXIgdGhhbiB0aGUgY29tcGlsZXIsIGkuZS4gZWl0aGVyIGEgZGlmZmVy
ZW5jZSBpbiBzaGVsbCBvciBpbiBtYWtlCj4gYmVoYXZpb3IuCgpNYXliZSwgSSdtIG5vdCBhbiBl
eHBlcnQgb24gc2hlbGxzIG9yIG1ha2VmaWxlcy4gVGhpcyB0aW1lIEkndmUgdGVzdGVkCndpdGgg
RGViaWFuIDkuNSBpbnN0ZWFkIG9mIEZyZWVCU0QsIHNvIGl0J3MgbGlrZWx5IHRoYXQgd2hhdCB3
YXMgdGhlcmUKd29ya2VkIGZpbmUgb24gRnJlZUJTRCB3aGljaCBJJ20gcXVpdGUgc3VyZSB3YXMg
d2hhdCBJIHRlc3RpbmcgYWdhaW5zdApiYWNrIHdoZW4gSSBhZGRlZCB0aGlzIGNoZWNrLgoKVGhp
cyBpcyB3aGF0IEkgdXNlZCB0byB0ZXN0OgoKR05VIE1ha2UgNC4xCkdOVSBiYXNoLCB2ZXJzaW9u
IDQuNC4xMigxKS1yZWxlYXNlICh4ODZfNjQtcGMtbGludXgtZ251KQoKTm90IHN1cmUgd2hldGhl
ciB0aGVyZSBhcmUgb3RoZXIgdXRpbGl0aWVzIGludm9sdmVkIGluIHRoaXMgYmVoYXZpb3IuCgo+
IElPVyBJIGRvbid0IHRoaW5rIGp1c3QgcmVwbGFjaW5nIFxuIGJ5IDsgd2lsbCBkby4KCkkgY2Fu
IGdpdmUgeW91ciBwYXRjaCBhIHRyeSB3aXRoIEZyZWVCU0QsIGJ1dCB0aGF0J3Mgbm90IGdvaW5n
IHRvCmV4cGxhaW4gdGhlIGRpZmZlcmVudCBiZWhhdmlvciBJJ20gYWZyYWlkLgoKVGhhbmtzLCBS
b2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
