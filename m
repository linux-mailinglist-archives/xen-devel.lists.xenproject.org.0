Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C56812A3E3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 19:21:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijol1-0008Ip-GL; Tue, 24 Dec 2019 18:18:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijol0-0008Ik-0K
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 18:18:10 +0000
X-Inumbo-ID: b7a334da-2679-11ea-88e7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7a334da-2679-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577211480;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kXUbmerLqaCBo5uROYzKksnbnduYFQHOtR6jyokFDFg=;
 b=TsYHCyqLzl63VdltedYzagrz0+k+BOQTKBlEQR2udrJJPThTN0UixZ1Z
 6u9xl5LxSRXLlU1q0QKnGABYimNMOb9GjM5Nuuyqo5R0DPMvN3LGkLxOE
 jvpfo/ziggPvmHUSe6DI8w8ePQxAZKqOkxNvLFrN1Vu3HW936UVA6qFo4 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nYDK+zE+b/EabRJTW7QdFK9eWeiMo28UpgpDnu0FcfYeSic1+gDIoiz/fMbyM1N7SMK5gk6dkW
 SF77T66q7MX/SvgS/Nkrg/9caAkhcyduIm2GAMm2yneYo+XSys0Lo+b8hYVoeCf2gqB/PTll9V
 ik30q5SWDp58wJF3VLXUu6GAYaqpZSGNcM5wztPn+JroWt9nnT5HXX7DIjLeWJOFcp87Dl3rZ/
 wzSACvHut2H9GGLfCOiw/M6BFA2IeePsxNS7Vo9rlKn7M0niRGCe9RghfWRYpUNYrE5Ih+ltWr
 pZY=
X-SBRS: 2.7
X-MesageID: 10487969
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,352,1571716800"; d="scan'208";a="10487969"
Date: Tue, 24 Dec 2019 19:17:52 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191224181752.GE11756@Air-de-Roger>
References: <20191224101810.45915-1-roger.pau@citrix.com>
 <8264d39f-4f5e-e7c0-f0e0-6be23feba3c3@citrix.com>
 <20191224124258.GC11756@Air-de-Roger>
 <950e6538-40f4-c698-75d9-f532bccfae52@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <950e6538-40f4-c698-75d9-f532bccfae52@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] x86/hvm: always expose x2APIC feature in
 max HVM cpuid policy
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMDQ6MDA6MjdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8xMi8yMDE5IDEyOjQyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBEZWMgMjQsIDIwMTkgYXQgMTI6MjM6MTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBPbiAyNC8xMi8yMDE5IDEwOjE4LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4g
Pj4+IE9uIGhhcmR3YXJlIHdpdGhvdXQgeDJBUElDIHN1cHBvcnQgWGVuIGVtdWxhdGVkIGxvY2Fs
IEFQSUMgd2lsbAo+ID4+PiBwcm92aWRlIHN1Y2ggbW9kZSwgYW5kIGhlbmNlIHRoZSBmZWF0dXJl
IHNob3VsZCBiZSBzZXQgaW4gdGhlIG1heGltdW0KPiA+Pj4gSFZNIGNwdWlkIHBvbGljeS4KPiA+
Pj4KPiA+Pj4gTm90IGV4cG9zaW5nIGl0IGluIHRoZSBtYXhpbXVtIHBvbGljeSByZXN1bHRzIGlu
IEhWTSBkb21haW5zIG5vdAo+ID4+PiBnZXR0aW5nIHN1Y2ggZmVhdHVyZSBleHBvc2VkIHVubGVz
cyBpdCdzIGFsc28gc3VwcG9ydGVkIGJ5IHRoZQo+ID4+PiB1bmRlcmx5aW5nIGhhcmR3YXJlLgo+
ID4+Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KPiA+PiB4MmFwaWMgaGFzIG5ldmVyIGJlZW4gZXhwb3NlZCB2aWEgdGhpcyBtZWNo
YW5pc20sIGR1ZSB0byBpdHMgZWZmZWN0cyBvbgo+ID4+IHRvcG9sb2d5IGNhbGN1bGF0aW9ucy4K
PiA+IFdlbGwsIGl0J3MgZXhwb3NlZCBpbiBodm1fbWF4X2NwdWlkX3BvbGljeSBpZiBpdCdzIHBy
ZXNlbnQgaW4gdGhlCj4gPiBoYXJkd2FyZS4gSU1PIGl0J3Mga2luZCBvZiB3ZWlyZCB0aGF0IHRo
ZSBwcmVzZW5jZSBvZiB0aGUgeDJBUElDIGZlYXR1cmUKPiA+IG9uIHRoZSBtYXggcG9saWN5IGRl
cGVuZHMgb24gdGhlIHVuZGVybHlpbmcgaGFyZHdhcmUsIHdoZW4gaXQncyBhbHdheXMKPiA+IHN1
cHBvcnRlZCBieSB0aGUgZW11bGF0ZWQgdmxhcGljLgo+ID4KPiA+IEkgdGhpbmsgeDJBUElDIG11
c3QgZWl0aGVyIGFsd2F5cyBiZSBwYXJ0IG9mIHRoZSBtYXggcG9saWN5LCBvciBuZXZlciwKPiA+
IG9yIGVsc2UgaXQncyB2ZXJ5IGVhc3kgdG8gY2F1c2UgcmVncmVzc2lvbnMgYmVjYXVzZSBpdCdz
IG5vdCBzbyBlYXN5Cj4gPiB0byBmaW5kIGEgYm94IHdpdGhvdXQgeDJBUElDLgo+IAo+IEhtbSAt
IHRoaXMgZG9lcyBoaWdobGlnaHQgdGhlIGluY29uc2lzdGVuY3kgaW4gdGhlIGV4aXN0aW5nIGxv
Z2ljLsKgIEknbQo+IG5vdCBvdmVybHkgc3VycHJpc2VkIC0gdGhpcyBpcyBhIHJlbW5hbnQgb2Yg
dGhlIG9sZCBtb2RlbCB3aGljaCBoYXNuJ3QKPiBiZWVuIHJld3JpdHRlbiB5ZXQuCgpJIGNvdWxk
IGRvIHNvbWV0aGluZyBsaWtlOgoKZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4
Ni5jIGIvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKaW5kZXggNTE5ZDZkOGJkMC4uYTdhZGM0
MTg1NCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMKKysrIGIvdG9vbHMv
bGlieGMveGNfY3B1aWRfeDg2LmMKQEAgLTY0MSw2ICs2NDEsNyBAQCBpbnQgeGNfY3B1aWRfYXBw
bHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKICAgICAgICAgcC0+
ZXh0ZC5pdHNjID0gdHJ1ZTsKICAgICAgICAgcC0+YmFzaWMudm14ID0gdHJ1ZTsKICAgICAgICAg
cC0+ZXh0ZC5zdm0gPSB0cnVlOworICAgICAgICBwLT5iYXNpYy54MmFwaWMgPSB0cnVlOwogICAg
IH0KIAogICAgIHJjID0geDg2X2NwdWlkX2NvcHlfdG9fYnVmZmVyKHAsIGxlYXZlcywgJm5yX2xl
YXZlcyk7CgpCdXQgaXQgc2VlbXMga2luZCBvZiBib2d1cyB0byBtZSB0aGF0IHN1Y2ggZmVhdHVy
ZSBpcyBub3QgcGFydCBvZiB0aGUKaHZtX21heF9jcHVpZF9wb2xpY3ksIGF0IHRoZSBlbmQgb2Yg
ZGF5IHRoZSB0b29sc3RhY2sgaGFzIG5vIGtub3dsZWRnZQpvZiB3aGV0aGVyIHRoZSBoeXBlcnZp
c29yIHByb3ZpZGVzIGEgeDJBUElDIGludGVyZmFjZSBvciBub3QgKGFwYXJ0CmZyb20gdXMgaGFy
ZGNvZGluZyBpdCBpbiB0aGUgdG9vbHMgbGlrZSB0aGUgYWJvdmUgcGF0Y2gpLgoKPiA+Cj4gPj4g
SXQgaGFzIGhvd2V2ZXIgYWx3YXlzIGJlZW4gZG93biB0byB0aGUgdG9vbHN0YWNrIHRvIG9wdCBp
biwgYW5kIFhlbgo+ID4+IHBlcm1pdHMgdGhpcyB2aWEgcmVjYWxjdWxhdGVfY3B1aWRfcG9saWN5
KCksIG9uIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZQo+ID4+IHRvb2xzdGFjayBrbmV3IHdoYXQg
aXQgd2FzIGRvaW5nIFdSVCB0b3BvbG9neSAoYWxsIGV2aWRlbmNlIGFjdHVhbGx5IHRvCj4gPj4g
dGhlIGNvbnRyYXJ5KS4KPiA+IEhtLCBJIGNhbiB0cnkgdG8gZm9yY2UgdGhlIHNldHRpbmcgaW4g
bGlieGMuCj4gPgo+ID4+IElmIHdlJ3JlIHNlZWluZyBhIHJlY2VudCBjaGFuZ2UgaW4gYmVoYXZp
b3VyLCB0aGVuIGl0IHdpbGwgYmUgZnJvbSBsaWJ4Yy4KPiA+IElJUkMgeDJBUElDIHdhcyBhbHdh
eXMgZXhwb3NlZCB0byBIVk0gZ3Vlc3RzIHJlZ2FyZGxlc3Mgb2YgdGhlCj4gPiB1bmRlcmx5aW5n
IGhhcmR3YXJlIHN1cHBvcnQuCj4gCj4gSSBoYXZlIGEgc3VzcGljaW9uIHRoYXQgdGhpcyBtYXkg
aGF2ZSBiZWVuIGJyb2tlbiBieSBjL3MgM2UwYzgyNzJmIGluCj4gMjAxNS4uLgoKSSBjb3VsZCBz
d2VhciBYZW4gd2FzIGV4cG9zaW5nIHRoZSB4MkFQSUMgQ1BVSUQgZmVhdHVyZSBvbiB0aGUgYm94
IEknbQpjdXJyZW50bHkgdGVzdGluZyBkdXJpbmcgdGhlIDQuMTMgZGV2ZWxvcG1lbnQgY3ljbGUs
IG9yIGVsc2UgSSBkaWQKaGFjayBpdCBteXNlbGYgZm9yIGRldmVsb3BtZW50IHB1cnBvc2VzIGFu
ZCBjb21wbGV0ZWx5IGZvcmdvdCB0byBzZW5kCmEgcGF0Y2ggYWZ0ZXJ3YXJkcy4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
