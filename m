Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DEC918CB98
	for <lists+xen-devel@lfdr.de>; Fri, 20 Mar 2020 11:27:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jFEpP-0003HF-E1; Fri, 20 Mar 2020 10:24:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sjin=5F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jFEpN-0003HA-Ty
 for xen-devel@lists.xenproject.org; Fri, 20 Mar 2020 10:24:33 +0000
X-Inumbo-ID: fd459ffa-6a94-11ea-bd1b-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd459ffa-6a94-11ea-bd1b-12813bfff9fa;
 Fri, 20 Mar 2020 10:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584699873;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2B59yBXTM7BZ18Hhd0//iHW4fu5MaGiVaWxEXinQ4LY=;
 b=TT+pfzWyFJgELBfNeAr/lvwBXWeztJkgF3U6aEuM1s6RI+7/gmoLXSTL
 RMi9SdjbEHqs3rn+yn8ZxGOvZwalzeEaP2gCu+HnqXCeQc3NgzsFhVNVT
 encqQo3YxJop2LmrN1bwB8CugfeV6FG/dkQkgAfW4yPF2kvrIPu06HFVd E=;
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
IronPort-SDR: tHXwbHA97hTANwL3u8XE77v3kgVtReIyDCRDhtIvqwohoxspZ7fZApKakBeNjp5BOLTxoa5/Vb
 THnQxpbGnrWvnqcNJiQVKXkT4dSYhYkm/TglYVbKTT4qQ9f1I4XDyl9aobP0qy7psBR+/c6MgN
 NxTrTBglf2mhTyQOZJ+CHsAQdBEYzINv0a9DHqIw4B2DGTxHS95t4shN/tQzk3J6qEI76YubU4
 YiQ6uU/kFHab8bEK5gppPA6+Ano+tT//oUxN1/xJYnjoPW1t2urRzVpUPu10/RUaNRDv0aGWzR
 BEc=
X-SBRS: 2.7
X-MesageID: 14341761
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,284,1580792400"; d="scan'208";a="14341761"
Date: Fri, 20 Mar 2020 11:24:22 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200320102422.GV24458@Air-de-Roger.citrite.net>
References: <20200319173825.GQ24458@Air-de-Roger.citrite.net>
 <3d242660-7c28-5465-5da8-d126d2d347b4@xen.org>
 <20200319184305.GR24458@Air-de-Roger.citrite.net>
 <910d5530-893d-9401-46f6-4da22a400ce4@xen.org>
 <1fc54578-2b48-a713-f216-0c6fda205c9a@suse.com>
 <20200320090155.GS24458@Air-de-Roger.citrite.net>
 <75d1fe33-2ccd-234d-8bcf-5a167cf4145f@xen.org>
 <20200320094214.GT24458@Air-de-Roger.citrite.net>
 <20200320100033.GU24458@Air-de-Roger.citrite.net>
 <98a586a1-24e4-2839-270c-49dde5ed0cbf@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <98a586a1-24e4-2839-270c-49dde5ed0cbf@xen.org>
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

T24gRnJpLCBNYXIgMjAsIDIwMjAgYXQgMTA6MDg6MzNBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDIwLzAzLzIwMjAgMTA6MDAsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAxMDo0MjoxNEFNICswMTAwLCBSb2dlciBQ
YXUgTW9ubsOpIHdyb3RlOgo+ID4gPiBPbiBGcmksIE1hciAyMCwgMjAyMCBhdCAwOToxMjoxNkFN
ICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gSGkgUm9nZXIsCj4gPiA+ID4gCj4g
PiA+ID4gT24gMjAvMDMvMjAyMCAwOTowMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4g
PiA+IE9uIEZyaSwgTWFyIDIwLCAyMDIwIGF0IDA4OjIxOjE5QU0gKzAxMDAsIEphbiBCZXVsaWNo
IHdyb3RlOgo+ID4gPiA+ID4gPiBPbiAxOS4wMy4yMDIwIDIwOjA3LCBKdWxpZW4gR3JhbGwgd3Jv
dGU6Cj4gPiA+ID4gPiA+ID4gSGksCj4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gT24gMTkv
MDMvMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9u
IFRodSwgTWFyIDE5LCAyMDIwIGF0IDA2OjA3OjQ0UE0gKzAwMDAsIEp1bGllbiBHcmFsbCB3cm90
ZToKPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4g
PiBPbiAxOS8wMy8yMDIwIDE3OjM4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPiA+ID4g
PiA+ID4gPiA+IE9uIFRodSwgTWFyIDE5LCAyMDIwIGF0IDA0OjIxOjIzUE0gKzAwMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPiA+ID4gPiA+ID4gPiA+ID4gPiAgIMKgID4+IFdoeSBjYW4ndCB5b3Ug
a2VlcCBmbHVzaF90bGJfbWFzaygpIGhlcmU/Cj4gPiA+ID4gPiA+ID4gPiA+ID4gCj4gPiA+ID4g
PiA+ID4gPiA+ID4gQmVjYXVzZSBmaWx0ZXJlZF9mbHVzaF90bGJfbWFzayBpcyB1c2VkIGluIHBv
cHVsYXRlX3BoeXNtYXAsIGFuZAo+ID4gPiA+ID4gPiA+ID4gPiA+IGNoYW5nZXMgdG8gdGhlIHBo
eW1hcCByZXF1aXJlIGFuIEFTSUQgZmx1c2ggb24gQU1EIGhhcmR3YXJlLgo+ID4gPiA+ID4gPiA+
ID4gPiAKPiA+ID4gPiA+ID4gPiA+ID4gSSBhbSBhZnJhaWQgdGhpcyBkb2VzIG5vdCB5ZXQgZXhw
bGFpbiBtZSB3aHkgZmx1c2hfdGxiX21hc2soKSBjb3VsZCBub3QgYmUKPiA+ID4gPiA+ID4gPiA+
ID4gdXBkYXRlZCBzbyBpdCBmbHVzaCB0aGUgQVNJRCBvbiBBTUQgaGFyZHdhcmUuCj4gPiA+ID4g
PiA+ID4gPiAKPiA+ID4gPiA+ID4gPiA+IEN1cnJlbnQgYmVoYXZpb3IgcHJldmlvdXMgdG8gdGhp
cyBwYXRjaCBpcyB0byBmbHVzaCB0aGUgQVNJRHMgb24KPiA+ID4gPiA+ID4gPiA+IGV2ZXJ5IFRM
QiBmbHVzaC4KPiA+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+ID4gZmx1c2hfdGxiX21hc2sg
aXMgdG9vIHdpZGVseSB1c2VkIG9uIHg4NiBpbiBwbGFjZXMgd2hlcmUgdGhlcmUncyBubwo+ID4g
PiA+ID4gPiA+ID4gbmVlZCB0byBmbHVzaCB0aGUgQVNJRHMuIFRoaXMgcHJldmVudHMgdXNpbmcg
YXNzaXN0ZWQgZmx1c2hlcyAoYnkgTDApCj4gPiA+ID4gPiA+ID4gPiB3aGVuIHJ1bm5pbmcgbmVz
dGVkLCBzaW5jZSB0aG9zZSBhc3Npc3RlZCBmbHVzaGVzIHBlcmZvcm1lZCBieSBMMAo+ID4gPiA+
ID4gPiA+ID4gZG9uJ3QgZmx1c2ggdGhlIEwyIGd1ZXN0cyBUTEJzLgo+ID4gPiA+ID4gPiA+ID4g
Cj4gPiA+ID4gPiA+ID4gPiBJIGNvdWxkIGtlZXAgY3VycmVudCBiZWhhdmlvciBhbmQgbGVhdmUg
Zmx1c2hfdGxiX21hc2sgYWxzbyBmbHVzaGluZyB0aGUKPiA+ID4gPiA+ID4gPiA+IEFTSURzLCBi
dXQgdGhhdCBzZWVtcyB3cm9uZyBhcyB0aGUgZnVuY3Rpb24gZG9lc24ndCBoYXZlIGFueXRoaW5n
IGluCj4gPiA+ID4gPiA+ID4gPiBpdCdzIG5hbWUgdGhhdCBzdWdnZXN0cyBpdCBhbHNvIGZsdXNo
ZXMgdGhlIGluLWd1ZXN0IFRMQnMgZm9yIEhWTS4KPiA+ID4gPiA+ID4gPiAKPiA+ID4gPiA+ID4g
PiBJIGFncmVlIHRoZSBuYW1lIGlzIGNvbmZ1c2luZywgSSBoYWQgdG8gbG9vayBhdCB0aGUgaW1w
bGVtZW50YXRpb24gdG8gdW5kZXJzdGFuZCB3aGF0IGl0IGRvZXMuCj4gPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gSG93IGFib3V0IHJlbmFtaW5nIChvciBpbnRyb2R1Y2luZykgdGhlIGZ1bmN0
aW9uIHRvIGZsdXNoX3RsYl9hbGxfZ3Vlc3RzX21hc2soKSBvciBmbHVzaF90bGJfYWxsX2d1ZXN0
c19jcHVtYXNrKCkpID8KPiA+ID4gPiA+ID4gCj4gPiA+ID4gPiA+IEFuZCB0aGlzIHdvdWxkIHRo
ZW4gZmx1c2ggX29ubHlfIGd1ZXN0IFRMQnM/Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IE5vLCBJIHRo
aW5rIGZyb20gSnVsaWVuJ3MgcHJvcG9zYWwgKGlmIEkgdW5kZXJzdG9vZCBpdCBjb3JyZWN0bHkp
Cj4gPiA+ID4gPiBmbHVzaF90bGJfYWxsX2d1ZXN0c19tYXNrIHdvdWxkIGRvIHdoYXQgZmx1c2hf
dGxiX21hc2sgY3VycmVudGx5IGRvZXMKPiA+ID4gPiA+IHByZXZpb3VzIHRvIHRoaXMgcGF0Y2gg
KGZsdXNoIFhlbidzIFRMQnMgKyBIVk0gQVNJRHMpLgo+ID4gPiA+IAo+ID4gPiA+IEl0IGxvb2tz
IGxpa2UgdGhlcmUgbWlnaHQgYmUgY29uZnVzaW9uIG9uIHdoYXQgImd1ZXN0IFRMQnMiIG1lYW5z
LiBJbiBteQo+ID4gPiA+IHZpZXcgdGhpcyBtZWFucyBhbnkgVExCcyBhc3NvY2lhdGVkIGRpcmVj
dGx5IG9yIGluZGlyZWN0bHkgd2l0aCB0aGUgZ3Vlc3QuCj4gPiA+ID4gT24gQXJtLCB0aGlzIHdv
dWxkIGJlIG51a2U6Cj4gPiA+ID4gICAgIC0gZ3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGd1ZXN0
IHBoeXNpY2FsIGFkZHJlc3MgVExCIGVudHJ5Cj4gPiA+ID4gICAgIC0gZ3Vlc3QgcGh5c2ljYWwg
YWRkcmVzcyAtPiBob3N0IHBoeXNpY2FsIGFkZHJlc3MgVExCIGVudHJ5Cj4gPiA+ID4gICAgIC0g
Z3Vlc3QgdmlydHVhbCBhZGRyZXNzIC0+IGhvc3QgcGh5c2ljYWwgYWRkcmVzcyBUTEIgZW50cnkK
PiA+ID4gCj4gPiA+IEFGQUlDVCBBU0lEIGZsdXNoIG9uIEFNRCBoYXJkd2FyZSB3aWxsIGZsdXNo
IGFueSBvZiB0aGUgYWJvdmUsIHdoaWxlCj4gPiA+IFZQSUQgZmx1c2ggb24gSW50ZWwgd2lsbCBv
bmx5IGZsdXNoIHRoZSBmaXJzdCBpdGVtIChndWVzdCBsaW5lYXIgdG8KPiA+IAo+ID4gU29ycnks
IGRvaW5nIHRvbyBtYW55IHRoaW5ncyBhdCB0aGUgc2FtZSB0aW1lLiBPbiBJbnRlbCBWUElEIGZs
dXNoZXMKPiA+IHdpbGwgZ2V0IHJpZCBvZiBndWVzdCB2aXJ0dWFsIHRvIGd1ZXN0IHBoeXNpY2Fs
IG9yIGhvc3QgcGh5c2ljYWwsIGJ1dAo+ID4gbm90IG9mIGd1ZXN0IHBoeXNpY2FsIHRvIGhvc3Qg
cGh5c2ljYWwsIHlvdSBuZWVkIGFuIEVQVCBmbHVzaCB0bwo+ID4gYWNjb21wbGlzaCB0aGF0Lgo+
IEFyZSB5b3Ugc3VnZ2VzdGluZyB0aGF0IG9uIHg4NiwgZmx1c2hfdGxiX21hc2soKSB3b3VsZCBu
b3QgbnVrZSB0aGUgZ3Vlc3QKPiBwaHlzaWNhbCB0byBob3N0IHBoeXNpY2FsIGVudHJpZXM/IElm
IHNvLCBob3cgaXMgaXQgbWVhbnQgdG8gYmUgc2FmZT8KCllvdSBpc3N1ZSBFUFQgZmx1c2hlcyBp
biB0aGF0IGNhc2Ugd2hlbiBhbiBFUFQgbW9kaWZpY2F0aW9uIGlzCnBlcmZvcm1lZC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
