Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B6C18CB1C
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 11:04:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFESM-0001Qh-6z; Fri, 20 Mar 2020 10:00:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFESL-0001Qc-4k
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 10:00:45 +0000
X-Inumbo-ID: a9aec7f2-6a91-11ea-a6c1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9aec7f2-6a91-11ea-a6c1-bc764e2007e4;
 Fri, 20 Mar 2020 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584698445;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=vMDc1e3WKTrXv1cyWfDK3rtL2unfFG0J1W0uqALyuWE=;
 b=IKW/wpw7OTmPooxs7ZNDeffnDWgk6Hzh4pd30sMyJho0IFqf2CcC8s8t
 0DP0Ui7zZH9hhAhhocgveMwAFhxAgiqDfaKbfAK/zMT9y8VpQ3KPhzWVu
 uhMsXbv/aJqxrgKkzU60Xx6GsWKhJVnadspSRwiCtyQati8ALH7iyn5lB c=;
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
IronPort-SDR: OGt5NVlpLac1UmuT8bg379KQBnEUwM0P3AmpsI/M/QI53BeYEBReAV5NjSAsEiuvgHt1QDC+pN
 t4Rh6Hrzz3HFY/Z4F7swHeI+ZFpW25dos2InQJvJaZb+tC04IPIBlgk37FAwfZhtnIxG5ZKZfv
 cdtMVV3TeHoAitQwjq51AiyPCjX/odDR7/BkS++rXh3+xfERi+hTMJh2WBwEas+A9mdzSTrUTD
 XG39t0YiOFvxhYtzog0QS4y6Rf+IjfCMMGvfUizmwG+MPkSC1B5YsAh/DXglSkz3B5HdfU9BBp
 KAc=
X-SBRS: 2.7
X-MesageID: 14340746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14340746"
Date: Fri, 20 Mar 2020 11:00:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320100033.GU24458@Air-de-Roger.citrite.net>
References: <20200319154716.34556-2-roger.pau@citrix.com>
 <83b8dc44-6ecf-9bdf-957b-3c502e4df926@xen.org>
 <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <20200320094214.GT24458@Air-de-Roger.citrite.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200320094214.GT24458@Air-de-Roger.citrite.net>
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
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMTA6NDI6MTRBTSArMDEwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAwOToxMjoxNkFNICswMDAwLCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4gPiBIaSBSb2dlciwKPiA+IAo+ID4gT24gMjAvMDMvMjAyMCAwOTow
MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gRnJpLCBNYXIgMjAsIDIwMjAgYXQg
MDg6MjE6MTlBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+ID4gT24gMTkuMDMuMjAy
MCAyMDowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiAKPiA+
ID4gPiA+IE9uIDE5LzAzLzIwMjAgMTg6NDMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6Cj4gPiA+
ID4gPiA+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBH
cmFsbCB3cm90ZToKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiBP
biAxOS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4gPiA+
ID4gT24gVGh1LCBNYXIgMTksIDIwMjAgYXQgMDQ6MjE6MjNQTSArMDAwMCwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4gIMKgID4+IFdoeSBjYW4ndCB5b3Uga2VlcCBmbHVzaF90
bGJfbWFzaygpIGhlcmU/Cj4gPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEJlY2F1c2Ug
ZmlsdGVyZWRfZmx1c2hfdGxiX21hc2sgaXMgdXNlZCBpbiBwb3B1bGF0ZV9waHlzbWFwLCBhbmQK
PiA+ID4gPiA+ID4gPiA+IGNoYW5nZXMgdG8gdGhlIHBoeW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1
c2ggb24gQU1EIGhhcmR3YXJlLgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IEkgYW0gYWZy
YWlkIHRoaXMgZG9lcyBub3QgeWV0IGV4cGxhaW4gbWUgd2h5IGZsdXNoX3RsYl9tYXNrKCkgY291
bGQgbm90IGJlCj4gPiA+ID4gPiA+ID4gdXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBB
TUQgaGFyZHdhcmUuCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBDdXJyZW50IGJlaGF2aW9yIHBy
ZXZpb3VzIHRvIHRoaXMgcGF0Y2ggaXMgdG8gZmx1c2ggdGhlIEFTSURzIG9uCj4gPiA+ID4gPiA+
IGV2ZXJ5IFRMQiBmbHVzaC4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IGZsdXNoX3RsYl9tYXNr
IGlzIHRvbyB3aWRlbHkgdXNlZCBvbiB4ODYgaW4gcGxhY2VzIHdoZXJlIHRoZXJlJ3Mgbm8KPiA+
ID4gPiA+ID4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcgYXNz
aXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4gPiA+ID4gPiA+IHdoZW4gcnVubmluZyBuZXN0ZWQsIHNp
bmNlIHRob3NlIGFzc2lzdGVkIGZsdXNoZXMgcGVyZm9ybWVkIGJ5IEwwCj4gPiA+ID4gPiA+IGRv
bid0IGZsdXNoIHRoZSBMMiBndWVzdHMgVExCcy4KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEkg
Y291bGQga2VlcCBjdXJyZW50IGJlaGF2aW9yIGFuZCBsZWF2ZSBmbHVzaF90bGJfbWFzayBhbHNv
IGZsdXNoaW5nIHRoZQo+ID4gPiA+ID4gPiBBU0lEcywgYnV0IHRoYXQgc2VlbXMgd3JvbmcgYXMg
dGhlIGZ1bmN0aW9uIGRvZXNuJ3QgaGF2ZSBhbnl0aGluZyBpbgo+ID4gPiA+ID4gPiBpdCdzIG5h
bWUgdGhhdCBzdWdnZXN0cyBpdCBhbHNvIGZsdXNoZXMgdGhlIGluLWd1ZXN0IFRMQnMgZm9yIEhW
TS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gSSBhZ3JlZSB0aGUgbmFtZSBpcyBjb25mdXNpbmcsIEkg
aGFkIHRvIGxvb2sgYXQgdGhlIGltcGxlbWVudGF0aW9uIHRvIHVuZGVyc3RhbmQgd2hhdCBpdCBk
b2VzLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBIb3cgYWJvdXQgcmVuYW1pbmcgKG9yIGludHJvZHVj
aW5nKSB0aGUgZnVuY3Rpb24gdG8gZmx1c2hfdGxiX2FsbF9ndWVzdHNfbWFzaygpIG9yIGZsdXNo
X3RsYl9hbGxfZ3Vlc3RzX2NwdW1hc2soKSkgPwo+ID4gPiA+IAo+ID4gPiA+IEFuZCB0aGlzIHdv
dWxkIHRoZW4gZmx1c2ggX29ubHlfIGd1ZXN0IFRMQnM/Cj4gPiA+IAo+ID4gPiBObywgSSB0aGlu
ayBmcm9tIEp1bGllbidzIHByb3Bvc2FsIChpZiBJIHVuZGVyc3Rvb2QgaXQgY29ycmVjdGx5KQo+
ID4gPiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrIHdvdWxkIGRvIHdoYXQgZmx1c2hfdGxiX21h
c2sgY3VycmVudGx5IGRvZXMKPiA+ID4gcHJldmlvdXMgdG8gdGhpcyBwYXRjaCAoZmx1c2ggWGVu
J3MgVExCcyArIEhWTSBBU0lEcykuCj4gPiAKPiA+IEl0IGxvb2tzIGxpa2UgdGhlcmUgbWlnaHQg
YmUgY29uZnVzaW9uIG9uIHdoYXQgImd1ZXN0IFRMQnMiIG1lYW5zLiBJbiBteQo+ID4gdmlldyB0
aGlzIG1lYW5zIGFueSBUTEJzIGFzc29jaWF0ZWQgZGlyZWN0bHkgb3IgaW5kaXJlY3RseSB3aXRo
IHRoZSBndWVzdC4KPiA+IE9uIEFybSwgdGhpcyB3b3VsZCBiZSBudWtlOgo+ID4gICAgLSBndWVz
dCB2aXJ0dWFsIGFkZHJlc3MgLT4gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyBUTEIgZW50cnkKPiA+
ICAgIC0gZ3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyAtPiBob3N0IHBoeXNpY2FsIGFkZHJlc3MgVExC
IGVudHJ5Cj4gPiAgICAtIGd1ZXN0IHZpcnR1YWwgYWRkcmVzcyAtPiBob3N0IHBoeXNpY2FsIGFk
ZHJlc3MgVExCIGVudHJ5Cj4gCj4gQUZBSUNUIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlIHdp
bGwgZmx1c2ggYW55IG9mIHRoZSBhYm92ZSwgd2hpbGUKPiBWUElEIGZsdXNoIG9uIEludGVsIHdp
bGwgb25seSBmbHVzaCB0aGUgZmlyc3QgaXRlbSAoZ3Vlc3QgbGluZWFyIHRvCgpTb3JyeSwgZG9p
bmcgdG9vIG1hbnkgdGhpbmdzIGF0IHRoZSBzYW1lIHRpbWUuIE9uIEludGVsIFZQSUQgZmx1c2hl
cwp3aWxsIGdldCByaWQgb2YgZ3Vlc3QgdmlydHVhbCB0byBndWVzdCBwaHlzaWNhbCBvciBob3N0
IHBoeXNpY2FsLCBidXQKbm90IG9mIGd1ZXN0IHBoeXNpY2FsIHRvIGhvc3QgcGh5c2ljYWwsIHlv
dSBuZWVkIGFuIEVQVCBmbHVzaCB0bwphY2NvbXBsaXNoIHRoYXQuCgpSb2dlci4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
