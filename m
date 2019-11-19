Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D9C102ACE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 18:30:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX7I0-0000Oq-Pm; Tue, 19 Nov 2019 17:27:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0CLP=ZL=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iX7Hz-0000Oh-BZ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 17:27:43 +0000
X-Inumbo-ID: e2229ed8-0af1-11ea-a2ff-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2229ed8-0af1-11ea-a2ff-12813bfff9fa;
 Tue, 19 Nov 2019 17:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574184459;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=/PhmTFGnUrxkSiJSc7XbK72wvcOil3xpZPeFeRZw1/Y=;
 b=Z91IjQzgjNt4gpff7PEMiMtgyLpJSxJyTCcm9yxPG5wG199eFvMAx6xE
 QWotTtEHFuq4HriWw6O1hEhr6ACoxwm1MCCh3JKujY4Y6JHaIPJmohx0w
 G4qmABqeuSVSeOTBEX4B1jOuHTYFw3iBEPqfXITXx6NuWjHDRM6847bRb c=;
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
IronPort-SDR: dXF6RNJL5vvUzyD6mFDtCR8GmCSrOFd1LLOSrzvhKdQIM/3ZKm1INZ6E7oz+tlHogPaGYaJTaf
 +1c71xpvyB4Sy3t71TilhDfN78NZmEhfUF0JOwA4LBNdcDZZa9LnIGeED9IYdv655LIWhiCqh2
 y1p+jDZF42PTvyH383SOS71QTGG4MCLBG1I/sxcp7NKKuhSRDcKG8vevGRfe/mOsyzLQAJUknX
 UbVe1YCGGGJnbLE8MakRzlUJ7puEKXaHfn0x9yTmeqLkd03NJKC4sL29/iznQjnpT0IARZZkEP
 Z+8=
X-SBRS: 2.7
X-MesageID: 9085847
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,218,1571716800"; 
   d="scan'208";a="9085847"
Date: Tue, 19 Nov 2019 18:27:26 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20191119172726.GO72134@Air-de-Roger>
References: <20191029175720.7354-1-ian.jackson@eu.citrix.com>
 <bbcb318a-0774-ba98-6f83-49f0ee1c6598@citrix.com>
 <23992.34990.952195.433864@mariner.uk.xensource.com>
 <24010.40492.241066.724248@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24010.40492.241066.724248@mariner.uk.xensource.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] tools/configure: Honour
 XEN_COMPILE_ARCH and _TARGET_ for shim
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
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Olaf Hering <olaf@aepfle.de>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgMTIsIDIwMTkgYXQgMTE6NTc6MzJBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gSWFuIEphY2tzb24gd3JpdGVzICgiUmU6IFtYZW4tZGV2ZWxdIFtYRU4gUEFUQ0ggZm9y
LTQuMTNdIHRvb2xzL2NvbmZpZ3VyZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJH
RVRfIGZvciBzaGltIik6Cj4gPiBBbmRyZXcgQ29vcGVyIHdyaXRlcyAoIlJlOiBbWGVuLWRldmVs
XSBbWEVOIFBBVENIIGZvci00LjEzXSB0b29scy9jb25maWd1cmU6IEhvbm91ciBYRU5fQ09NUElM
RV9BUkNIIGFuZCBfVEFSR0VUXyBmb3Igc2hpbSIpOgo+ID4gPiBPbiAyOS8xMC8yMDE5IDE3OjU3
LCBJYW4gSmFja3NvbiB3cm90ZToKPiA+ID4gPiBUaGUgcHZzaGltIGNhbiBvbmx5IGJlIGJ1aWx0
IDY0LWJpdCBiZWNhdXNlIHRoZSBoeXBlcnZpc29yIGlzIG9ubHkKPiA+ID4gPiA2NC1iaXQgbm93
YWRheXMuICBUaGUgaHlwZXJ2aXNvciBidWlsZCBzdXBwb3J0cyBYRU5fQ09NUElMRV9BUkNIIGFu
ZAo+ID4gPiA+IFhFTl9UQVJHRVRfQVJDSCB3aGljaCBvdmVycmlkZSB0aGUgaW5mb3JtYXRpb24g
ZnJvbSB1bmFtZS4gIFRoZSBwdnNoaW0KPiA+ID4gPiBidWlsZCBydW5zIG91dCBvZiB0aGUgdG9v
bHMvIGRpcmVjdG9yeSBidXQgY2FsbHMgdGhlIGh5cGVydmlzb3IgYnVpbGQKPiA+ID4gPiBzeXN0
ZW0uCj4gPiA+ID4KPiA+ID4gPiBJZiBvbmUgcnVucyBpbiBhIExpbnV4IDMyLWJpdCB1c2VybGFu
ZCB3aXRoIGEgNjQtYml0IGtlcm5lbCwgb25lIHVzZWQKPiA+ID4gPiB0byBiZSBhYmxlIHRvIHNl
dCBYRU5fQ09NUElMRV9BUkNILiAgQnV0IG5vd2FkYXlzIHRoaXMgZG9lcyBub3Qgd29yay4KPiA+
ID4gCj4gPiA+IFRoaXMgbG9va3MgdG8gYmUgYSBidWdmaXggdG8gODg0NTE1NWM4MzFjNTllODY3
ZWUzZGQzMWVlNjNlMGNjNmM3ZGNmMiA/Cj4gPiA+IAo+ID4gPiBJbiBwYXJ0aWN1bGFyLCB0aGlz
IGRlbGV0ZWQgdGhlIGxvZ2ljIHRvIG9ubHkgYnVpbGQgdGhlIHNoaW0gZm9yCj4gPiA+IFhFTl9U
QVJHRVRfQVJDSCAhPSB4ODZfMzIuCj4gPiAKPiA+IFllcy4gIEkgaGF2ZSBhZGRlZCBhIG5vdGUg
YWJvdXQgdGhhdCB0byB0aGUgY29tbWl0IG1lc3NhZ2UgKHN0ZWFsaW5nCj4gPiB5b3VyIHRleHQs
IHRoYW5rcykgYW5kIG5vdyBJIGFtIENDaW5nIHRoZSBhdXRob3IgYW5kIHJlcXVlc3RlciBvZiB0
aGF0Cj4gPiBjb21taXQsIGZvciBmb3JtJ3Mgc2FrZS4KPiAKPiBBbmRyZXcsIGRpZCB5b3Ugd2Fu
dCB0byBhY2sgdGhpcyA/ICBPciBkbyB5b3UgaGF2ZSBmdXJ0aGVyIGNvbW1lbnRzID8KPiBJIGhh
dmUgYSByZWxlYXNlLWFjay4uLgo+IAo+IFRoYW5rcywKPiBJYW4uCj4gCj4gRnJvbSAxYThkZTM2
Njk5YjkwNDJjMzA3OTdlMDVmN2E1ZjQzMTNkN2Y3YWQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IERhdGU6
IFR1ZSwgMjkgT2N0IDIwMTkgMTc6NDU6MzAgKzAwMDAKPiBTdWJqZWN0OiBbUEFUQ0hdIHRvb2xz
L2NvbmZpZ3VyZTogSG9ub3VyIFhFTl9DT01QSUxFX0FSQ0ggYW5kIF9UQVJHRVRfIGZvcgo+ICBz
aGltCj4gTUlNRS1WZXJzaW9uOiAxLjAKPiBDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJz
ZXQ9VVRGLTgKPiBDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0Cj4gCj4gVGhlIHB2c2hp
bSBjYW4gb25seSBiZSBidWlsdCA2NC1iaXQgYmVjYXVzZSB0aGUgaHlwZXJ2aXNvciBpcyBvbmx5
Cj4gNjQtYml0IG5vd2FkYXlzLiAgVGhlIGh5cGVydmlzb3IgYnVpbGQgc3VwcG9ydHMgWEVOX0NP
TVBJTEVfQVJDSCBhbmQKPiBYRU5fVEFSR0VUX0FSQ0ggd2hpY2ggb3ZlcnJpZGUgdGhlIGluZm9y
bWF0aW9uIGZyb20gdW5hbWUuICBUaGUgcHZzaGltCj4gYnVpbGQgcnVucyBvdXQgb2YgdGhlIHRv
b2xzLyBkaXJlY3RvcnkgYnV0IGNhbGxzIHRoZSBoeXBlcnZpc29yIGJ1aWxkCj4gc3lzdGVtLgo+
IAo+IElmIG9uZSBydW5zIGluIGEgTGludXggMzItYml0IHVzZXJsYW5kIHdpdGggYSA2NC1iaXQg
a2VybmVsLCBvbmUgdXNlZAo+IHRvIGJlIGFibGUgdG8gc2V0IFhFTl9DT01QSUxFX0FSQ0guICBC
dXQgbm93YWRheXMgdGhpcyBkb2VzIG5vdCB3b3JrLgo+IGNvbmZpZ3VyZSBzZWVzIHRoZSB0YXJn
ZXQgY3B1IGFzIDY0LWJpdCBhbmQgdHJpZXMgdG8gYnVpbGQgcHZzaGltLgo+IFRoZSBidWlsZCBw
cmludHMKPiAgIGVjaG8gIioqKiBYZW4geDg2LzMyIHRhcmdldCBubyBsb25nZXIgc3VwcG9ydGVk
ISIKPiBhbmQgZG9lc24ndCBidWlsZCBhbnl0aGluZy4gIFRoZW4gdGhlIHN1YnNlcXVlbnQgTWFr
ZWZpbGVzIHRyeSB0bwo+IGluc3RhbGwgdGhlIG5vbi1idWlsdCBwaWVjZXMuCj4gCj4gRml4IHRo
aXMgYW5vbWFseSBieSBjYXVzaW5nIGNvbmZpZ3VyZSB0byBob25vdXIgdGhlIFhlbiBoeXBlcnZp
c29yIHdheQo+IG9mIHNldHRpbmcgdGhlIHRhcmdldCBhcmNoaXRlY3R1cmUuCj4gCj4gSW4gcHJp
bmNpcGxlIHRoaXMgdXNlciBiZWhhdmlvdXIgaXMgbm90IGhhbmRsZWQgcXVpdGUgcmlnaHQsIGJl
Y2F1c2UKPiBjb25maWd1cmUgd2lsbCBzdGlsbCBzZWUgNjQtYml0IGFuZCBzbyBhbGwgdGhlIGF1
dG9jb25mLWJhc2VkCj4gYXJjaGl0ZWN0dXJlIHRlc3Rpbmcgd2lsbCBzZWUgNjQtYml0IHJhdGhl
ciB0aGFuIDMyLWJpdCB4ODYuICBCdXQgdGhlCj4gdG9vbHMgYXJlIGluIGZhY3QgZ2VuZXJhbGx5
IHF1aXRlIHBvcnRhYmxlOiB0aGlzIHBhcnRpY3VsYXIgbG9jYXRpb24KPiBpbiBjb25maWd1cmV7
LmFjLH0gaXMgdGhlIG9ubHkgcGxhY2UgaW4gdG9vbHMvIHdoZXJlIDY0LWJpdCB4ODYgaXMKPiB0
cmVhdGVkIGRpZmZlcmVudGx5IGZyb20gMzItYml0IHg4Niwgc28gdGhlIGZpeCBpcyBzdWZmaWNp
ZW50IGFuZAo+IGNvcnJlY3QgZm9yIHRoaXMgdXNlIGNhc2UuCj4gCj4gSXQgcmVtYWlucyB0aGUg
Y2FzZSB0aGF0IFhFTl9DT01QSUxFX0FSQ0ggb3IgWEVOX1RBUkdFVF9BUkNIIHRvIGEKPiBub24t
eDg2IGFyY2hpdGVjdHVyZSwgd2hlbiBjb25maWd1cmUgdGhpbmtzIHRoaW5ncyBhcmUgeDg2LCBv
ciB2aWNlCj4gdmVyc2EsIHdpbGwgbm90IHdvcmsgcmlnaHQuCj4gCj4gKFRoaXMgaXMgYSBidWdm
aXggdG8gODg0NTE1NWM4MzFjCj4gICBwdnNoaW06IG1ha2UgUFYgc2hpbSBidWlsZCBzZWxlY3Rh
YmxlIGZyb20gY29uZmlndXJlCj4gd2hpY2ggaW5hZHZlcnRhbnRseSBkZWxldGVkIHRoZSBsb2dp
YyB0byBvbmx5IGJ1aWxkIHRoZSBzaGltIGZvcgo+IFhFTl9UQVJHRVRfQVJDSCAhPSB4ODZfMzIu
KQo+IAo+IEkgaGF2ZSByZXJ1biBhdXRvZ2VuLnNoLCBzbyB0aGlzIHBhdGNoIGNvbnRhaW5zIHRo
ZSBmaXggdG8gY29uZmlndXJlCj4gYXMgd2VsbCBhcyB0aGUgc291cmNlIGZpeCB0byBjb25maWd1
cmUuYWMuCj4gCj4gRml4ZXM6IDg4NDUxNTVjODMxYzU5ZTg2N2VlM2RkMzFlZTYzZTBjYzZjN2Rj
ZjIKPiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT4KPiBDQzogT2xhZiBIZXJpbmcgPG9sYWZAYWVwZmxlLmRlPgo+IENDOiBSb2dlciBQYXUgTW9u
bsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
