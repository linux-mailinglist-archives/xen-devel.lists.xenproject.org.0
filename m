Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA160122FD7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 16:12:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihEUR-0007wF-GD; Tue, 17 Dec 2019 15:10:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihEUQ-0007w8-59
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 15:10:22 +0000
X-Inumbo-ID: 57549672-20df-11ea-8ef0-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 57549672-20df-11ea-8ef0-12813bfff9fa;
 Tue, 17 Dec 2019 15:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576595421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=nVa4eX/qnWU1Sb4qWZvi3opf2WLJwlkrg/dBiKr/oLM=;
 b=PRyr8gO+frZYkR2154pfWf0+QXiRtyWPmrBxutIJiyh2diiIRFl7vJJ9
 KGa9cdZR/JaV4OPmJ7HP//7B/0kTpG/PKUie1OOCoicITGxlFukvc1B9c
 qR12AH/sQQLvRaqnq9wUixtDG/Y75whhqemIhe7OpU2MzyY4qSLOEvvZH I=;
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
IronPort-SDR: IQF0pgvInHJ5LMHjmOLoMPRds0SxIWe/v7WaPrNAsK7nabqg8dsXXZ8vPPnsCfEN5OrCEOIo0x
 pxwX+NCm1WdF+J8+vQvOijXeyRwvI8s/okj/dbJbuaedxHccu9c8jIr4YLlGwLVrXbp/yS4/bY
 USF7WpfoclofRDrn8iI0cMK2tgOLyZ3oSC1mQ9imFSl6V0MKB1fOqJ4pJqg6jSO45hzipdc3dm
 UCtZbaNp5ugLk/iQoMwJW5pER1HfjOWgov14tmf1Mj5KGA0yaqXuQj6tvwTXckeJcLWQyJI8PS
 U6c=
X-SBRS: 2.7
X-MesageID: 9807000
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9807000"
Date: Tue, 17 Dec 2019 16:10:12 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217151012.GA11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-3-andrew.cooper3@citrix.com>
 <20191217115241.GT11756@Air-de-Roger>
 <e9003fba-83e8-1509-224e-5374cd9a99a1@citrix.com>
 <20191217121813.GX11756@Air-de-Roger>
 <b98724c9-6702-ef1f-c6c0-74c6f5fceb20@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b98724c9-6702-ef1f-c6c0-74c6f5fceb20@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 2/6] x86/suspend: Don't bother saving %cr3,
 %ss or flags
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTI6MjY6MjRQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8xMi8yMDE5IDEyOjE4LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBEZWMgMTcsIDIwMTkgYXQgMTI6MDY6MDFQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBPbiAxNy8xMi8yMDE5IDExOjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+
ID4+PiBPbiBGcmksIERlYyAxMywgMjAxOSBhdCAwNzowNDozMlBNICswMDAwLCBBbmRyZXcgQ29v
cGVyIHdyb3RlOgo+ID4+Pj4gVGhlIHRyYW1wb2xpbmUgaGFzIGFscmVhZHkgc2V0IHVwIHRoZSBp
ZGxlIHBhZ2V0YWJsZXMgKHdoaWNoIGFyZSB0aGUgY29ycmVjdAo+ID4+Pj4gb25lcyB0byB1c2Up
LCBhbmQgc2FuaXRpc2VkIHRoZSBmbGFncyBzdGF0ZS4KPiA+Pj4gSSB3b25kZXIgd2h5IGRvIHdl
IGhhdmUgd2FrZXVwLlMgYW5kIHdha2V1cF9wcm90LlMsIGl0IHdvdWxkIGJlIGVhc2llcgo+ID4+
PiB0byBmb2xsb3cgaWYgaXQgYWxsIHdhcyBpbiB0aGUgc2FtZSBmaWxlIElNTy4KPiA+PiB3YWtl
dXAuUyBpcyB0aGUgMTZiaXQgZW50cnkgcG9pbnQsIGFuZCBsaXZlcyBpbiB0aGUgdHJhbXBvbGlu
ZSBiZWxvdyAxTS4KPiA+Pgo+ID4+IHdha2V1cF9wcm90LlMgaXMgYSBiaXQgb2YgbG9naWMgd2hp
Y2ggbGl2ZXMgaW4gdGhlIG1haW4gaHlwZXJ2aXNvci4KPiA+Pgo+ID4+IFRoZSBuYW1pbmcgY291
bGQgcHJvYmFibHkgZG8gd2l0aCBzb21lIGltcHJvdmVtZW50LCBidXQgdGhleSBjYW4ndAo+ID4+
IGZlYXNpYmx5IGJlIHBhcnQgb2YgdGhlIHNhbWUgZmlsZS4KPiA+IEhtLCBJJ20gbm90IHN1cmUg
SSBmb2xsb3cuIElzbid0IHRoaXMgdHJhbXBvbGluZSBjb3BpZWQgYnkgWGVuIGluIGEKPiA+IHN1
aXRhYmxlIHBvc2l0aW9uIGJlbG93IHRoZSAxTSBib3VuZGFyeSwgYW5kIGhlbmNlIGNvdWxkIHVz
ZSBzeW1ib2xzCj4gPiBpbiBvcmRlciB0byBmaWd1cmUgb3V0IHdoaWNoIHBhcnQgdG8gY29weT8K
PiA+Cj4gPiBJZTogYm90aCB0aGUgbG93IGFuZCB0aGUgaGlnaCBwYXJ0IGNvdWxkIGxpdmUgaW4g
dGhlIHNhbWUgZmlsZSBhcyBsb25nCj4gPiBhcyBYZW4ga25vd3MgaG93IHRvIGRpZmZlcmVudGlh
dGUgdGhvc2UgYW5kIHdoaWNoIGNodW5rIG5lZWRzCj4gPiBwb3NpdGlvbmluZyBiZWxvdyAxTT8K
PiAKPiBUaGVyZSBpcyBvbmUgdHJhbXBvbGluZS5TIChhbmQgdHJhbXBvbGluZS5vKSB3aGljaCBn
YXRoZXJzIHRvZ2V0aGVyCj4gdmFyaW91cyBmaWxlcyAoaW5jbHVkaW5nIHdha2V1cC5TKSB0byBj
b25zdHJ1Y3QgdGhlIHRyYW1wb2xpbmUuCgpPaCwgSSBzZWUgaXQncyBhbGwgaW5jbHVkZWQgdG8g
bWFrZSBhIHNpbmdsZSB1bml0LCBhbmQgdGhlIHN5bWJvbHMKdXNlZCB0byBtYXJrIHRoZSBzdGFy
dCBhbmQgZW5kIG9mIHRoZSB0cmFtcG9saW5lIGNodW5rIGFyZSBkZWZpbmVkCm91dHNpZGUgb2Yg
dGhlIGluY2x1ZGVkIGZpbGUuCgo+IEl0IGlzIG5vdCBzb21ldGhpbmcgd2hpY2ggY2FuIGJlIGNv
bnN0cnVjdGVkIHNpbXBseSBieSBwdXR0aW5nIGNvZGUvZGF0YQo+IGluIHRoZSByZXF1aXNpdGUg
c2VjdGlvbnMuwqAgVGhlcmUgYXJlIHR3byBtYWluIGVudHJ5cG9pbnRzLCBvbmUgd2l0aCBhCj4g
NGsgYWxpZ25tZW50IHJlcXVpcmVtZW50LCBvbmUgd2l0aCAxNiBieXRlIGFsaWdubWVudCwgYW5k
IHdlIHNwbGl0IHRoZQo+IHRyYW1wb2xpbmUgaW50byB0d28gcGFydHMgLSBvbmUgd2hpY2ggaXMg
QlNQLW9ubHkgYW5kIGlzIHNldmVyYWwgcGFnZXMKPiBpbiBzaXplLCBhbmQgb25lIHdoaWNoIGlz
IHBvc3QtYm9vdCB3aGljaCBpcyBvbmx5IGEgc2luZ2xlIHBhZ2UuCgpHaXZlbiB0aGUgc2l6ZSBv
ZiBzM19yZXN1bWUgSSB3b3VsZCBndWVzcyB0aGVyZSdzIHNwYWNlIGluIHRoYXQgc2luZ2xlCnBh
Z2UgdG8gZml0IGl0LCBidXQgc2luY2UgaXQgZG9lc24ndCBuZWVkIHRvIGxpdmUgYmVsb3cgdGhl
IDFNCmJvdW5kYXJ5IGl0IGNvdWxkIGJlIHNlZW4gYXMgYSB3YXN0ZS4KCkFueXdheSwgbGVhdmlu
ZyBpdCBhcy1pcyBpcyBmaW5lIHNpbmNlIHBsYWNpbmcgaXQgaW4gd2FrZXVwLlMgd291bGQgYmUK
YSB3YXN0ZSBvZiBzcGFjZSBvciByZXF1aXJlIHNvbWUgcmVzdHJ1Y3R1cmluZyBvZiBob3cgdGhl
IHRyYW1wb2xpbmUKY29kZSBpcyBhc3NlbWJsZWQuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
