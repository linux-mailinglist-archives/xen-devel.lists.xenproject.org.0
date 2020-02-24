Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF0116A43C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 11:45:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6BCO-0004iY-OL; Mon, 24 Feb 2020 10:42:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=04fq=4M=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j6BCN-0004iT-9S
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 10:42:51 +0000
X-Inumbo-ID: 67408caa-56f2-11ea-8ae3-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 67408caa-56f2-11ea-8ae3-12813bfff9fa;
 Mon, 24 Feb 2020 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1582540971;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bfZCemgak/W5YRP8sSB1kivPUeNDHhlvNBitpF20l7Y=;
 b=RK/VhYphj9SUEQtLy2bTKHaRya+Tl6mvt3b31eRW8xgvGDT6Gq3Uhd1U
 Hov28K3IILn3hrtMVlsh3ll34mJf8ELom3HfteO67ASbJF9LXGznWIBRm
 /nHpidMVoESfv/0UdV+5jviuMLioalnwbiPxWRR6uu66mg132Dv4aHlay I=;
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
IronPort-SDR: YnIrfW04ZS1QXmaHdRoJK01kmRjv2KfiF5HK0DdtBLKKsoP+o4TI/MFipuAncyWLQKg8eQed+R
 /mxwmlQtNfweQ1lpZ8IKV24TE0oO1qrH6D0hUB4vfV6KSV6FhpiX+4f93k7bBv08nqOqtXboJ5
 Mfcc0bnChnODxzZMCT0EUPA3bUA49Oqrdq6lZs1qNtyTMZ7L20RIC09j/nhta2vY5AA89PTJu1
 s0zxovv/JG7K0P5gNgGiB9Ce5ReluIJbyxa8l7XeS7ea3SZxzXXmkCLXqi4btT+Lh7fBOPoSWJ
 X4s=
X-SBRS: 2.7
X-MesageID: 12880867
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,479,1574139600"; d="scan'208";a="12880867"
Date: Mon, 24 Feb 2020 11:42:42 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200224104242.GK4679@Air-de-Roger>
References: <20200224084400.94482-1-roger.pau@citrix.com>
 <20200224084400.94482-2-roger.pau@citrix.com>
 <6a22dad2-946a-ae9f-2304-61f60e0d7f8c@xen.org>
 <20200224100919.GH4679@Air-de-Roger>
 <63c23677-1dbd-3dce-d67a-ea86c5683cc7@xen.org>
 <20200224102355.GJ4679@Air-de-Roger>
 <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <01f7434f-295c-06de-5576-a4c5af1d3048@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v3 1/2] atomic: add atomic_and operations
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjQsIDIwMjAgYXQgMTA6Mjk6NDBBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpLAo+IAo+IE9uIDI0LzAyLzIwMjAgMTA6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3Jv
dGU6Cj4gPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAxMDoxOTo0NEFNICswMDAwLCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gT24gMjQvMDIvMjAyMCAxMDowOSwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gPiBPbiBNb24sIEZlYiAyNCwgMjAyMCBhdCAx
MDowMjo1M0FNICswMDAwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gPiA+ID4gPiBIaSBSb2dlciwK
PiA+ID4gPiA+IAo+ID4gPiA+ID4gVGhlIGxvZ2ljIGZvciBBcm02NCBhbmQgQXJtMzIgbG9va3Mg
Z29vZCB0byBtZS4gSSBqdXN0IGhhdmUgb25lIHF1ZXN0aW9uCj4gPiA+ID4gPiBiZWxvdy4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gT24gMjQvMDIvMjAyMCAwODo0MywgUm9nZXIgUGF1IE1vbm5lIHdy
b3RlOgo+ID4gPiA+ID4gPiBUbyB4ODYgYW5kIEFybS4gVGhpcyBwZXJmb3JtcyBhbiBhdG9taWMg
QU5EIG9wZXJhdGlvbiBhZ2FpbnN0IGFuCj4gPiA+ID4gPiA+IGF0b21pY190IHZhcmlhYmxlIHdp
dGggdGhlIHByb3ZpZGVkIG1hc2suCj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiBSZXF1ZXN0ZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gPiAgICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaCB8
IDE3ICsrKysrKysrKysrKysrKysrCj4gPiA+ID4gPiA+ICAgICB4ZW4vaW5jbHVkZS9hc20tYXJt
L2FybTY0L2F0b21pYy5oIHwgMTQgKysrKysrKysrKysrKysKPiA+ID4gPiA+ID4gICAgIHhlbi9p
bmNsdWRlL2FzbS14ODYvYXRvbWljLmggICAgICAgfCAgOCArKysrKysrKwo+ID4gPiA+ID4gPiAg
ICAgMyBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCj4gPiA+ID4gPiA+IAo+ID4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9hdG9taWMuaCBiL3hl
bi9pbmNsdWRlL2FzbS1hcm0vYXJtMzIvYXRvbWljLmgKPiA+ID4gPiA+ID4gaW5kZXggYzAzZWI2
ODRjZC4uNDYzNzM4MWJjYyAxMDA2NDQKPiA+ID4gPiA+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9hcm0zMi9hdG9taWMuaAo+ID4gPiA+ID4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJt
L2FybTMyL2F0b21pYy5oCj4gPiA+ID4gPiA+IEBAIC05Niw2ICs5NiwyMyBAQCBzdGF0aWMgaW5s
aW5lIGludCBhdG9taWNfc3ViX3JldHVybihpbnQgaSwgYXRvbWljX3QgKnYpCj4gPiA+ID4gPiA+
ICAgICAJcmV0dXJuIHJlc3VsdDsKPiA+ID4gPiA+ID4gICAgIH0KPiA+ID4gPiA+ID4gK3N0YXRp
YyBpbmxpbmUgdm9pZCBhdG9taWNfYW5kKHVuc2lnbmVkIGludCBtLCBhdG9taWNfdCAqdikKPiA+
ID4gPiA+IAo+ID4gPiA+ID4gQWxsIHRoZSBhdG9taWMgaGVscGVycyBoYXZlIHRha2VuIGEgc2ln
bmVkIGludCBzbyBmYXIgYmVjYXVzZSB0aGUgY291bnRlciBpcwo+ID4gPiA+ID4gYW4gaW50LiBB
bnkgcmVhc29uIHRvIGRpdmVyZ2UgZnJvbSB0aGF0Pwo+ID4gPiA+IAo+ID4gPiA+IFNpbmNlIHRo
aXMgaXMgbm90IGFuIGFyaXRobWV0aWMgb3BlcmF0aW9uIEkgZmVsdCB1bnNpZ25lZCBpbnQgd2Fz
IGEKPiA+ID4gPiBtb3JlIHN1aXRhYmxlIHR5cGUgdG8gZGVzY3JpYmUgYSBiaXRtYXNrOiBpdCBm
ZWx0IHdlaXJkIHRvIHBhc3MgYQo+ID4gPiA+IGJpdG1hc2sgd2l0aCB0eXBlIGludCwgYmVjYXVz
ZSBzaWduZWRuZXNzIGRvZXNuJ3QgbWFrZSBzZW5zZSB3aGVuCj4gPiA+ID4gcmVmZXJyaW5nIHRv
IGEgbWFzay4KPiA+ID4gCj4gPiA+IEF0IHNvbWUgcG9pbnQgSSB3b3VsZCBsaWtlIHRvIGhhdmUg
bWFjcm8gZ2VuZXJhdGluZyBhbGwgdGhlIGF0b21pY3MgaW4gb24KPiA+ID4gQXJtIGluIHRoZSBz
YW1lIHdheSBhIExpbnV4IChzZWUgYXNtLWdlbmVyaWMvYXRvbWljLmgpLiBUaGlzIGlzIHRvIGF2
b2lkCj4gPiA+IGR1cGxpY2F0aW9uIGFuZCBtYWtlIGVhc3kgdG8gaW50cm9kdWNlIEFybXY4LjEg
TFNFIGF0b21pY3MuIFNvIEkgd291bGQgbGlrZQo+ID4gPiB0byBhdm9pZCBpbnRyb2R1Y2luZyBk
aWZmZXJlbmNlIGluIHRoZSBwcm90b3R5cGUgdW5sZXNzIGl0IGlzIHN0cmljbHkKPiA+ID4gbmVj
ZXNzYXJ5Lgo+ID4gCj4gPiBXaHkgbm90IGhhdmUgdGhlIG1hY3JvIGdlbmVyYXRvciBmdW5jdGlv
biBnZXQgcGFzc2VkIHRoZSB0eXBlIG9mIHRoZQo+ID4gcGFyYW1ldGVyPwo+IAo+IEl0IGlzIG5v
dCB3b3J0aCBpdCBmb3IgYSBzaW1wbGUgb3BlcmF0aW9uIGFuZCBJIGRvbid0IHdhbnQgdG8gZGl2
ZXJnZSB0b28KPiBtdWNoIG9mIGF0b21pY3MgZnJvbSBMaW51eC4KCkhtLCBJJ20gd291bGQgcmF0
aGVyIGtlZXAgaXQgYXMgdW5zaWduZWQgZm9yIHR5cGUgY29oZXJlbmN5LCBidXQgaWYKeDg2IG1h
aW50YWluZXJzIGFyZSBhbHNvIGhhcHB5IHRvIGhhdmUgdGhlIHR5cGUgY2hhbmdlZCB0byBpbnQg
b24geDg2CnRoZW4gSSB3b24ndCBvcHBvc2UgdG8gaXQuCgpSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
