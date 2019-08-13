Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98D8BD34
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 17:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxYkj-0000Nf-40; Tue, 13 Aug 2019 15:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lz5Z=WJ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hxYki-0000NZ-GN
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 15:30:24 +0000
X-Inumbo-ID: 442330ee-bddf-11e9-a403-5788e5a06bb4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 442330ee-bddf-11e9-a403-5788e5a06bb4;
 Tue, 13 Aug 2019 15:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565710223;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=O8cOOOZyVVgRMNYC5VkjGfapw+S5XvawaT2fLyGlmgQ=;
 b=JBHeLdmQKOXQZHm/Ln2HtS0ceHtdTKWkQZ+YCHbtBIBC8lloLD+oUJnH
 HIN14pctzqyFodE2dUpghBOrsGYBYnk1mUc9LvauJxMfj7OjIUsFiiiZv
 fT9/ktdZMS89nzJmdNMSGCtFNJaHHncdLCfFcvYBX7KbfYLplqpvgoHhR 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2MnYZ8fSioBjiH8e/k09wd9HG1A7gVniGma9ukSttuZQ16J0YH2kbMu3rOLTo6o6c4UGRYxS2l
 s1CPOIeXaZjqq2Kq3aU6x9xM0Ka8J/Q8B8xS9l+WJxG7HYrZBPWAeT+PRbZFFRpncx0lhSIuHU
 dEPcxITiGlKgASUJEjGEJalPo1Uu+y0p+VLaPyEsYthDkstaVWqZy2KxWxUnuO5VPEUcbLa992
 s5StHO+3ul83dX5Lh49P2MJkh7PCxhI3X8EwralJx4g1s/AVCCCMa2/4d0cZweuw05wSGQ2JcZ
 nj0=
X-SBRS: 2.7
X-MesageID: 4361711
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,382,1559534400"; 
   d="scan'208";a="4361711"
Date: Tue, 13 Aug 2019 16:30:20 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190813153020.GC1289@perard.uk.xensource.com>
References: <20190813144827.6318-1-anthony.perard@citrix.com>
 <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ec7f229-e1b9-5919-1337-ecb29124b182@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH] libxlu: Handle += in config files
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMTMsIDIwMTkgYXQgMDQ6MDY6MzNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxMy8wOC8yMDE5IDE1OjQ4LCBBbnRob255IFBFUkFSRCB3cm90ZToKPiA+IEhh
bmRsZSArPSBvZiBib3RoIHN0cmluZ3MgYW5kIGxpc3RzLgo+ID4KPiA+IElmICs9IGlzIHVzZWQg
Zm9yIGNvbmZpZyBvcHRpb25zIGV4cGVjdGVkIHRvIGJlIG51bWJlcnMsIHRoZW4gYQo+ID4gd2Fy
bmluZyBpcyBwcmludGVkIGFuZCB0aGUgY29uZmlnIG9wdGlvbiBpZ25vcmVkIChiZWNhdXNlIHhs
IGlnbm9yZXMKPiA+IGNvbmZpZyBvcHRpb25zIHdpdGggZXJyb3JzKS4KPiA+Cj4gPiBUaGlzIGlz
IHRvIGJlIHVzZWQgZm9yIGRldmVsb3BtZW50IHB1cnBvc2VzLCB3aGVyZSBtb2RpZnlpbmcgY29u
ZmlnCj4gPiBvcHRpb24gY2FuIGJlIGRvbmUgb24gdGhlIGB4bCBjcmVhdGUnIGNvbW1hbmQgbGlu
ZS4KPiA+Cj4gPiBPbmUgY291bGQgaGF2ZSBhIGNtZGxpbmU9IGluIHRoZSBjZmcgZmlsZSwgYW5k
IHNwZWNpZnkgY21kbGluZSs9IG9uCj4gPiB0aGUgYHhsIGNyZWF0ZWAgY29tbWFuZCBsaW5lIHdp
dGhvdXQgdGhlIG5lZWQgdG8gd3JpdGUgdGhlIHdob2xlCj4gPiBjbWRsaW5lIGluIGB4bCcgY29t
bWFuZCBsaW5lIGJ1dCBzaW1wbHkgYXBwZW5kIHRvIHRoZSBvbmUgaW4gdGhlIGNmZyBmaWxlLgo+
ID4gT3IgYWRkIGFuIGV4dHJhIHZpZiBvciBkaXNrIGJ5IHNpbXBseSBoYXZpbmcgInZpZiArPSBb
ICcnLCBdOyIgaW4gdGhlCj4gPiBgeGwnIGNtZGxpbmUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gPiAtLS0KPiA+Cj4g
PiBOb3RlczoKPiA+ICAgICBDb21taXRlciwgdGhlIGxpYnhsdV9jZmdfPy5baGNdIGZpbGVzIG5l
ZWRzIHRvIGJlIHJlZ2VuZXJhdGVkLiAod2l0aCBtYWtlKQo+ID4gICAgIAo+ID4gICAgIFRoaXMg
aXMgYSBkaWZmZXJlbnQgcHJvcG9zYWwgdG8gQW5kcmV3J3MgcGF0Y2g6Cj4gPiAgICAgPDIwMTkw
ODA1MTQ0OTEwLjIwMjIzLTEtYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+ICAgICBbUEFU
Q0hdIHRvb2xzL3hsOiBNYWtlIGV4dHJhPSB1c2FibGUgaW4gY29tYmluYXRpb24gd2l0aCBjbWRs
aW5lPQo+IAo+IEkgZ2F2ZSB0aGlzIGEgc3BpbiwgYnV0IGdvdDoKPiAKPiBbcm9vdEBmdXNlYm90
IH5dIyAuL3hscGx1cyBjcmVhdGUgc2hpbS5jZmcKPiByYW1kaXNrPVwiL3Jvb3QvdGVzdHMvc2Vs
ZnRlc3QvdGVzdC1odm02NC1zZWxmdGVzdFwiCj4gY21kbGluZSs9XCJkb20wPXB2aFwgZG9tMC1p
b21tdT1ub25lXCIKPiBQYXJzaW5nIGNvbmZpZyBmcm9tIHNoaW0uY2ZnCj4gc2hpbS5jZmc6MTk6
IGNvbmZpZyBwYXJzaW5nIGVycm9yIG5lYXIgYCs9ImRvbTA9cHZoJzogbGV4aWNhbCBlcnJvcgo+
IHdhcm5pbmc6IENvbmZpZyBmaWxlIGxvb2tzIGxpa2UgaXQgY29udGFpbnMgUHl0aG9uIGNvZGUu
Cj4gd2FybmluZzrCoCBBcmJpdHJhcnkgUHl0aG9uIGlzIG5vIGxvbmdlciBzdXBwb3J0ZWQuCj4g
d2FybmluZzrCoCBTZWUgaHR0cDovL3dpa2kueGVuLm9yZy93aWtpL1B5dGhvbkluWGxDb25maWcK
PiBGYWlsZWQgdG8gcGFyc2UgY29uZmlnOiBJbnZhbGlkIGFyZ3VtZW50CgpFaXRoZXIgb2xkZXIg
dmVyc2lvbiBvZiBgZmxleCcgYmVoYXZlIGRpZmZlcmVudGx5LCBvciB5b3UgZG9uJ3QgaGF2ZSBp
dAppbnN0YWxsZWQgb24geW91ciBzeXN0ZW0uIGBtYWtlJyBzZWVtcyB0byBvbmx5IHByaW50IGEg
d2FybmluZyBpZgpgZmxleCcgaXMgbWlzc2luZy4KCkFsc28sIEkndmUgb25seSBkb25lIGNvbmNh
dGVuYXRpb24gb2Ygc3RyaW5nLCArPSBkb2Vzbid0IGFkZCBhICcgJyBpbgpiZXR3ZWVuLiBTbyBm
b3IgY21kbGluZSwgaXQgd291bGQgbmVlZHMgdG8gYmUgY21kbGluZSs9XCJcIGRvbTA9cHZoXCIu
CgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
