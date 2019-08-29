Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8994FA15FC
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:32:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HhI-0006A4-Nd; Thu, 29 Aug 2019 10:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8sxS=WZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i3HhH-00069z-DY
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:30:31 +0000
X-Inumbo-ID: 05eb1704-ca48-11e9-ae64-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05eb1704-ca48-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567074630;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=L9RPQd0MwmFEzhUkEDX1ZM0H0fJMvXP3nh/DPgkJKlc=;
 b=EK48BSdmJzwowzDpfWRSV457DaxX2ybuQbp3YuwokEZnyBETQ55qPML2
 ML/I50W8bCmJdW7ipd8hgWO8kz8WzWRfSEQczh7sdv5yD3I1DHtU9cW3g
 cj33Bo9fNff3AgzicIQfKMWn6D0kKm9OBToaPCQXpexMGT2seMyQlVCQ+ c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 84MFhopqCUSqRum3OcRXz1kOZaZEBB4YvSojy12mtUmWuGiGLSzWDBZ4T+3ayy/DI5A0DWQ6SQ
 41lNE1oDQ8WSB3qovt7ikZyCm86S42aQplGmmu33O2Kv8Pr9zUNGCnV9Ll85c6I1hlHdtPHIHG
 M7tneMZUmcz5ZeCSS1kWN1Fxe3udZ4DhyzZnFwdL1aLWcdu/uIgI2JHXljki5slsx7FouHHVeI
 DfLI020I3h9zLtbI85bggKOgi+WlLSLFj84QvcZbUA/A7K+A97VyL0KpqEl5TB4dQj3+9nMZMP
 UaA=
X-SBRS: 2.7
X-MesageID: 5138497
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="5138497"
Date: Thu, 29 Aug 2019 12:30:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190829103022.zyd5zak6cdsev2jk@Air-de-Roger>
References: <20190726133331.91482-1-roger.pau@citrix.com>
 <20190726133331.91482-3-roger.pau@citrix.com>
 <f46656a6-22f7-bece-30c2-9be66ab36ef4@suse.com>
 <20190820075806.ukodfbsyg3u5winm@Air-de-Roger>
 <8722ee9d-aa68-2871-06d9-e4eedd7797dc@suse.com>
 <23909.3349.210995.572901@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23909.3349.210995.572901@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/3] build: allow picking the env values for
 compiler variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTE6NTk6MzNBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCAyLzNdIGJ1aWxkOiBhbGxvdyBw
aWNraW5nIHRoZSBlbnYgdmFsdWVzIGZvciBjb21waWxlciB2YXJpYWJsZXMiKToKPiA+IE9uIDIw
LjA4LjIwMTkgMDk6NTgsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiBJIGRvbid0IGhh
dmUgdGhpbmdzICdsZWZ0JyBpbiB0aGUgZW52aXJvbm1lbnQsIG5laXRoZXIgaGF2ZSBtb3N0IGJ1
aWxkCj4gPiA+IHN5c3RlbXMgQUZBSUsuIEkgZG8gaGF2ZSB0aGluZ3Mgc2V0IHRoYXQgSSB3YW50
IHRoZSBidWlsZCB0bwo+ID4gPiBhY2tub3dsZWRnZSwgaW5zdGVhZCBvZiBmaWdodCBhZ2FpbnN0
IGl0Lgo+ID4gCj4gPiBNeSB2aWV3IGlzIHRoaXM6IFhFTl8qIHRoaW5ncyBjb21pbmcgZnJvbSB0
aGUgZW52aXJvbm1lbnQgYXJlIGZpbmUuCj4gPiBHZW5lcmljIChpLmUuIHByb2plY3QgYWdub3N0
aWMpIHZhcmlhYmxlcyAobGlrZSBDQykgb3RvaCB3b3VsZAo+ID4gYmV0dGVyIGJlIGlnbm9yZWQs
IGFzIGl0J3Mgbm90IGNsZWFyIGZvciB3aGF0IHB1cnBvc2UgdGhleSd2ZSBiZWVuCj4gPiBzZXQu
IChJc3RyIGEgY2FzZSB3aGVyZSBzb21lIEZPUlRJRlkgb3B0aW9uIHdhcyBzZXQgYnkgUlBNIGJ1
aWxkCj4gPiBlbnZpcm9ubWVudHMsIGJyZWFraW5nIG91ciBidWlsZC4pIFRoZXkgbWF5IHdlbGwg
aGF2ZSBiZWVuIG1lYW50Cj4gPiBmb3Igc29tZSBvdGhlciBwcm9qZWN0Lgo+IAo+IENDIGlzIHNl
dCAqc3BlY2lmaWNhbGx5IHRvIGNhdXNlIGJ1aWxkIHN5c3RlbXMncyBsaWtlIFhlbidzIHRvIHVz
ZQo+IHRoYXQgY29tcGlsZXIqLiAgVGhhdCBpcyBpdHMgcHVycG9zZS4gIEl0IHNob3VsZCBiZSBo
b25vdXJlZCwgbm90Cj4gaWdub3JlZC4KPiAKPiBMaWtld2lzZSBGT1JUSUZZLCBldmVuIHRob3Vn
aCBpdCBicm9rZSBzb21ldGhpbmcuICBGT1JUSUZZX1NPVVJDRSB3YXMKPiBzZXQgc3BlY2lmaWNh
bGx5IHRvIGNhdXNlIHRoZSBjaGFuZ2VzIGl0IGRpZC4gIFRoZSBwZW9wbGUgd2hvIHNldCBpdAo+
IGRpZG4ndCBzZWUgYWxsIHRoZSBpbXBsaWNhdGlvbnMsIGJ1dCB0aGF0IGNoYW5nZSAqd2FzKiB0
aGVpciBkZXNpZ24KPiBpbnRlbnQgYW5kIHRoZSBidWdzIHdlcmUgcmVhbCBidWdzIGluIHdoYXQg
dGhleSB3ZXJlIHRyeWluZyB0byBkby4KPiAKPiA+IFF1ZXN0aW9uIGlzIHdoZXRoZXIgdG8gdGFr
ZSB0aGUgYWJvdmUganVzdCBmb3IgdGhlIGh5cGVydmlzb3IgcGFydAo+ID4gb2YgdGhlIGJ1aWxk
LCBvciBhbHNvIHRoZSB0b29sIHN0YWNrIGV0YyBvbmVzLgo+IAo+ICpEZWZpbml0ZWx5KiBmb3Ig
dGhlIHRvb2xzdGFjayBidWlsZCwgd2Ugc2hvdWxkIGhvbm91ciBDQyBldCBhbC4KPiAKPiBUaGUg
aHlwZXJ2aXNvciBpcyBhIG1vcmUgc3VidGxlIHF1ZXN0aW9uIGJlY2F1c2UgcGVvcGxlIHdobyBz
ZXQgdGhlc2UKPiB2YXJpYWJsZXMgb2Z0ZW4gZm9yZ2V0IHRvIHRoaW5rIGFib3V0IGtlcm5lbCBj
b2RlLCBlbWJlZGRlZCBjb2RlLAo+IGV0Yy4gIFRoYXQncyB3aGF0IGhhcHBlbmVkIHdpdGggRk9S
VElGWV9TT1VSQ0UuICBIb3dldmVyLCBJIHdvdWxkCj4gYXJndWUgdGhhdCBpdCBpcyBiZXR0ZXIs
IGluIHN1Y2ggYSBzaXR1YXRpb24sIHRvIGhvbm91ciB0aGUgdmFyaWFibGUKPiBhbmQgYnJlYWsg
dGhlIGJ1aWxkLCB0aGFuIGl0IGlzIHRvIHNpbXBseSBpZ25vcmUgaXQuCgpJIGZ1bGx5IGFncmVl
LiBJdCdzIHRydWUgdGhhdCBzb21lIGJ1aWxkIHN5c3RlbXMgd2lsbCBsaWtlbHkgYnJlYWsKYnVs
ZGluZyBYZW4sIGJ1dCB0aGF0J3MgYSBidWlsZCBzeXN0ZW0gaXNzdWUsIGFuZCB3ZSBzaG91bGRu
J3QgdHJ5IHRvCndvcmsgYXJvdW5kIHRoaXMgaW4gWGVuLiBBcyBzYWlkIGJlZm9yZSwgd2hhdCBi
dWlsZCBzeXN0ZW1zIChsaWtlCnRyYXZpcyBvciBnaXRsYWIgZm9yIGluc3RhbmNlKSBzZXQgaW4g
dGhlIGVudmlyb25tZW50IHNob3VsZCBiZQphY2tub3dsZWRnZWQgYnkgWGVuLCBvciBlbHNlIHdl
IGFyZSBmb3JjaW5nIGV2ZXJ5b25lIHRvIGhhdmUgY3VzdG9tCndvcmthcm91bmRzIGZvciBidWls
ZGluZyBYZW4uCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
