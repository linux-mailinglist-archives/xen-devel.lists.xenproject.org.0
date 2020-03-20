Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED5F18CA9C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 10:45:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFEAa-00088F-J6; Fri, 20 Mar 2020 09:42:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFEAZ-00088A-C3
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 09:42:23 +0000
X-Inumbo-ID: 18dd23f6-6a8f-11ea-bec1-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18dd23f6-6a8f-11ea-bec1-bc764e2007e4;
 Fri, 20 Mar 2020 09:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584697342;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=i9JDBvLIKoIdS+lEV1FFZldf0q9xgU9dXcnxY1XZoe8=;
 b=e3WUAqBZNOFb5TNxv7vGub2ckXLovsPly1l0Twzqmu0Pahh+u3ZR0vlV
 UdftQOvkI9bHD6jrdGSpDHcrxnL2/JVO08ucYvrtj5vyNg6imeKHiVscJ
 GnUPhgGG0OuabXG6OQuDdx2FpfHHy1yru1KKY3rwBisdI4NCUviWgJY+E 4=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: /CBBHTUtXCYx5piQtE3hUhFKpVn1ZtfX294ykCWd568UXoHYWdWYiBeTxNiN42FoyuIPaxYONb
 IFDVKcTLG3AhA/xw61ySPGT4xeHrnKT7OzFr0AzP4ypOp/zqBKLtooc4knRjLL0XQdYResu94g
 svpMifvwIvID5/z09G8Hb9XpgW2kEqU/pwr7IYYuKw95YwMvQTtMr9vtcutQy6naL6nyjPr7i2
 Sv1TidrmlVFOMOhRAaf2rD88RGyGiXptcQAUDh5HVs+GoUNzBcMGLz5OaXfThJmtw1nuxKh3C+
 8e8=
X-SBRS: 2.7
X-MesageID: 14756809
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14756809"
Date: Fri, 20 Mar 2020 10:42:14 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320094214.GT24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-1-roger.pau@citrix.com>
 <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86/tlb: introduce a flush HVM ASIDs
 flag
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMDk6MTI6MTZBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIFJvZ2VyLAo+IAo+IE9uIDIwLzAzLzIwMjAgMDk6MDEsIFJvZ2VyIFBhdSBNb25u
w6kgd3JvdGU6Cj4gPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAwODoyMToxOUFNICswMTAwLCBK
YW4gQmV1bGljaCB3cm90ZToKPiA+ID4gT24gMTkuMDMuMjAyMCAyMDowNywgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+ID4gPiA+IEhpLAo+ID4gPiA+IAo+ID4gPiA+IE9uIDE5LzAzLzIwMjAgMTg6NDMs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+ID4gPiBPbiBUaHUsIE1hciAxOSwgMjAyMCBh
dCAwNjowNzo0NFBNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiA+IAo+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gT24gMTkvMDMvMjAyMCAxNzozOCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE1hciAxOSwgMjAyMCBhdCAwNDoyMToyM1BN
ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gIMKgID4+IFdoeSBjYW4n
dCB5b3Uga2VlcCBmbHVzaF90bGJfbWFzaygpIGhlcmU/Cj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gQmVjYXVzZSBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayBpcyB1c2VkIGluIHBvcHVsYXRl
X3BoeXNtYXAsIGFuZAo+ID4gPiA+ID4gPiA+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJl
IGFuIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlLgo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
SSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5ZXQgZXhwbGFpbiBtZSB3aHkgZmx1c2hfdGxiX21h
c2soKSBjb3VsZCBub3QgYmUKPiA+ID4gPiA+ID4gdXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJ
RCBvbiBBTUQgaGFyZHdhcmUuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IEN1cnJlbnQgYmVoYXZpb3Ig
cHJldmlvdXMgdG8gdGhpcyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24KPiA+ID4gPiA+
IGV2ZXJ5IFRMQiBmbHVzaC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gZmx1c2hfdGxiX21hc2sgaXMg
dG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBwbGFjZXMgd2hlcmUgdGhlcmUncyBubwo+ID4gPiA+
ID4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcgYXNzaXN0ZWQg
Zmx1c2hlcyAoYnkgTDApCj4gPiA+ID4gPiB3aGVuIHJ1bm5pbmcgbmVzdGVkLCBzaW5jZSB0aG9z
ZSBhc3Npc3RlZCBmbHVzaGVzIHBlcmZvcm1lZCBieSBMMAo+ID4gPiA+ID4gZG9uJ3QgZmx1c2gg
dGhlIEwyIGd1ZXN0cyBUTEJzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBJIGNvdWxkIGtlZXAgY3Vy
cmVudCBiZWhhdmlvciBhbmQgbGVhdmUgZmx1c2hfdGxiX21hc2sgYWxzbyBmbHVzaGluZyB0aGUK
PiA+ID4gPiA+IEFTSURzLCBidXQgdGhhdCBzZWVtcyB3cm9uZyBhcyB0aGUgZnVuY3Rpb24gZG9l
c24ndCBoYXZlIGFueXRoaW5nIGluCj4gPiA+ID4gPiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBp
dCBhbHNvIGZsdXNoZXMgdGhlIGluLWd1ZXN0IFRMQnMgZm9yIEhWTS4KPiA+ID4gPiAKPiA+ID4g
PiBJIGFncmVlIHRoZSBuYW1lIGlzIGNvbmZ1c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1w
bGVtZW50YXRpb24gdG8gdW5kZXJzdGFuZCB3aGF0IGl0IGRvZXMuCj4gPiA+ID4gCj4gPiA+ID4g
SG93IGFib3V0IHJlbmFtaW5nIChvciBpbnRyb2R1Y2luZykgdGhlIGZ1bmN0aW9uIHRvIGZsdXNo
X3RsYl9hbGxfZ3Vlc3RzX21hc2soKSBvciBmbHVzaF90bGJfYWxsX2d1ZXN0c19jcHVtYXNrKCkp
ID8KPiA+ID4gCj4gPiA+IEFuZCB0aGlzIHdvdWxkIHRoZW4gZmx1c2ggX29ubHlfIGd1ZXN0IFRM
QnM/Cj4gPiAKPiA+IE5vLCBJIHRoaW5rIGZyb20gSnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkgdW5k
ZXJzdG9vZCBpdCBjb3JyZWN0bHkpCj4gPiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrIHdvdWxk
IGRvIHdoYXQgZmx1c2hfdGxiX21hc2sgY3VycmVudGx5IGRvZXMKPiA+IHByZXZpb3VzIHRvIHRo
aXMgcGF0Y2ggKGZsdXNoIFhlbidzIFRMQnMgKyBIVk0gQVNJRHMpLgo+IAo+IEl0IGxvb2tzIGxp
a2UgdGhlcmUgbWlnaHQgYmUgY29uZnVzaW9uIG9uIHdoYXQgImd1ZXN0IFRMQnMiIG1lYW5zLiBJ
biBteQo+IHZpZXcgdGhpcyBtZWFucyBhbnkgVExCcyBhc3NvY2lhdGVkIGRpcmVjdGx5IG9yIGlu
ZGlyZWN0bHkgd2l0aCB0aGUgZ3Vlc3QuCj4gT24gQXJtLCB0aGlzIHdvdWxkIGJlIG51a2U6Cj4g
ICAgLSBndWVzdCB2aXJ0dWFsIGFkZHJlc3MgLT4gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyBUTEIg
ZW50cnkKPiAgICAtIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MgLT4gaG9zdCBwaHlzaWNhbCBhZGRy
ZXNzIFRMQiBlbnRyeQo+ICAgIC0gZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGhvc3QgcGh5c2lj
YWwgYWRkcmVzcyBUTEIgZW50cnkKCkFGQUlDVCBBU0lEIGZsdXNoIG9uIEFNRCBoYXJkd2FyZSB3
aWxsIGZsdXNoIGFueSBvZiB0aGUgYWJvdmUsIHdoaWxlClZQSUQgZmx1c2ggb24gSW50ZWwgd2ls
bCBvbmx5IGZsdXNoIHRoZSBmaXJzdCBpdGVtIChndWVzdCBsaW5lYXIgdG8KZ3Vlc3QgcGh5c2lj
YWwpLiBXaGVuIHVzaW5nIEVQVCBvbiBJbnRlbCB5b3UgbmVlZCB0byBpc3N1ZSBFUFQgZmx1c2hl
cwp3aGVuIG1vZGlmeWluZyB0aGUgcDJtLCB3aGljaCB3aWxsIGdldCByaWQgb2YgdGhlIGxhc3Qg
dHdvIHR5cGVzIG9mCmNhY2hlZCB0cmFuc2xhdGlvbnMgKGd1ZXN0LXBoeXNpY2FsIG1hcHBpbmdz
IGFuZCBjb21iaW5lZCBtYXBwaW5ncyBpbgpJbnRlbCBzcGVhaykuCgpTbyB0aGUgcmVzcG9uc2Ug
aXMgJ2l0IGRlcGVuZHMnIG9uIHdoZXRoZXIgdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUgaXMKSW50
ZWwgb3IgQU1ELiBUaGF0J3Mgd2h5IHRoZSBjb25zdGFudCB3YXMgcmVuYW1lZCBmcm9tCkZMVVNI
X0hWTV9HVUVTVFNfVExCIHRvIEZMVVNIX0hWTV9BU0lEX0NPUkUuCgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
