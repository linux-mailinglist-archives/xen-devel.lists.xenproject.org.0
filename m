Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A561512D892
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 13:16:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imGP7-0008Fu-JP; Tue, 31 Dec 2019 12:13:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gg/0=2V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1imGP6-0008Fp-RR
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 12:13:40 +0000
X-Inumbo-ID: f9ccb214-2bc6-11ea-a0ea-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9ccb214-2bc6-11ea-a0ea-12813bfff9fa;
 Tue, 31 Dec 2019 12:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577794420;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=wSCQZY9BYF0AGYMuM5CrS1gaYsIIktAOvUQiAvrWfBI=;
 b=Pori7o45a5Mlt6eE5Sqbwkb0ivEBKJsowq2gi9mgOwnT4waob0fWftth
 5D6b77I3cBkF4dP/4y6TB5H+2KthHXJQuMEqGJzaHax6/mprhKPepL4WT
 WU+qmu3W+nCvONstfsk1gdmD6tZmUA+Qy4wow5XdUh5HfJFiDmsMkRv+g c=;
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
IronPort-SDR: 9dxR8avm+x+j5IQvg90xKTi5b0nlhhJRyV3rhtMWYI81eVFkT4swX/nw9XX19XwPFy6Ijorqci
 B/WO89JWBqDP+yh1OVhFUnEGMJKF1td6F3mnyBurGxx6rCoMudFh8wnJW70t8NBlG2e6WLqaxk
 khpyt7nlsbH8/ma41Dn87kNOs2hyIGgjsJ9seowTRpcKGknC/iTt+7QVBRPg2Gk/5uSbZsPiDd
 l2nMd+9SWx4wTAZ+ruE8F8L0W1J7LeLg0tlqnNFN5zgC9CF9JImhqCnhWEolvby26PlgimVwJP
 X/8=
X-SBRS: 2.7
X-MesageID: 10743318
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,379,1571716800"; d="scan'208";a="10743318"
Date: Tue, 31 Dec 2019 13:13:33 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191231121333.GI11756@Air-de-Roger>
References: <20191224124453.47183-1-roger.pau@citrix.com>
 <7e6ca9ea-89d4-80a6-d1e5-622ea87bf8a9@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e6ca9ea-89d4-80a6-d1e5-622ea87bf8a9@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMDM6MDM6NTdQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyNC8xMi8yMDE5IDEyOjQ0LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBJ
ZiB0aGUgZmx1c2ggbWFzayBtYXRjaGVzIHRoZSBtYXNrIG9mIG9ubGluZSBDUFVzIHVzZSB0aGUg
QVBJQyBBTExCVVQKPiA+IGRlc3RpbmF0aW9uIHNob3J0aGFuZCBpbiBvcmRlciB0byBzZW5kIGFu
IElQSSB0byBhbGwgQ1BVcyBvbiB0aGUKPiA+IHN5c3RlbSBleGNlcHQgdGhlIGN1cnJlbnQgb25l
LiBUaGlzIGNhbiBvbmx5IGJlIHNhZmVseSB1c2VkIHdoZW4gbm8KPiA+IENQVSBob3RwbHVnIG9y
IHVucGx1ZyBvcGVyYXRpb25zIGFyZSB0YWtpbmcgcGxhY2UsIG5vIG9mZmxpbmUgQ1BVcyBvcgo+
ID4gdGhvc2UgaGF2ZSBiZWVuIG9ubGluZWQgYW5kIHBhcmtlZCBhbmQgZmluYWxseSB3aGVuIGFs
bCBDUFVzIGluIHRoZQo+ID4gc3lzdGVtIGhhdmUgYmVlbiBhY2NvdW50ZWQgZm9yIChpZTogdGhl
IG51bWJlciBvZiBDUFVzIGRvZXNuJ3QgZXhjZWVkCj4gPiBOUl9DUFVTIGFuZCBBUElDIElEcyBh
cmUgYmVsb3cgTUFYX0FQSUNTKS4KPiA+Cj4gPiBUaGlzIGlzIHNwZWNpYWxseSBiZW5lZmljaWFs
IHdoZW4gdXNpbmcgdGhlIFBWIHNoaW0sIHNpbmNlIHVzaW5nIHRoZQo+ID4gc2hvcnRoYW5kIGF2
b2lkcyBwZXJmb3JtaW5nIGFuIEFQSUMgcmVnaXN0ZXIgd3JpdGUgKG9yIG11bHRpcGxlIG9uZXMK
PiA+IGlmIHVzaW5nIHhBUElDIG1vZGUpIGZvciBlYWNoIGRlc3RpbmF0aW9uIGluIHRoZSBmbHVz
aCBtYXNrLgo+ID4KPiA+IFRoZSBsb2NrIHRpbWUgb24gYSAzMiB2Q1BVIGd1ZXN0IHVzaW5nIHRo
ZSBzaGltIHdpdGhvdXQgdGhlIHNob3J0aGFuZAo+ID4gaXM6Cj4gPgo+ID4gR2xvYmFsIGxvY2sg
Zmx1c2hfbG9jazogYWRkcj1mZmZmODJkMDgwNGIyMWMwLCBsb2NrdmFsPWY2MDJmNjAyLCBub3Qg
bG9ja2VkCj4gPiAgIGxvY2s6MjI4NDU1OTM4KDc5NDA2MDY1NTczMTM1KSwgYmxvY2s6MjA1OTA4
NTgwKDU1NjQxNjYwNTc2MTUzOSkKPiA+Cj4gPiBBdmVyYWdlIGxvY2sgdGltZTogMzQ3NTc3bnMK
PiA+Cj4gPiBXaGlsZSB0aGUgc2FtZSBndWVzdCB1c2luZyB0aGUgc2hvcnRoYW5kOgo+ID4KPiA+
IEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRiNDFjMCwgbG9ja3ZhbD1k
OWM0ZDliYywgY3B1PTEyCj4gPiAgIGxvY2s6MTg5MDc3NSg0MTY3MTkxNDgwNTQpLCBibG9jazox
NjYzOTU4KDI1MDAxNjEyODI5NDkpCj4gPgo+ID4gQXZlcmFnZSBsb2NrIHRpbWU6IDIyMDM5NW5z
Cj4gPgo+ID4gQXBwcm94aW1hdGVseSBhIDEvMyBpbXByb3ZlbWVudCBpbiB0aGUgbG9jayB0aW1l
Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgo+IAo+IFdoaWxlIHRoZXNlIGFyZSBnb29kIHN0YXRzLCBJJ20gc29tZXdoYXQgaGVz
aXRhbnQgYWJvdXQgaGFja2luZyB0aGlzIGluCj4gbGlrZSB0aGlzLsKgIEZvciBvbmUsIGl0IGlz
IGEgc3Vic3RhbnRpYWwgYW1vdW50IG9mIGFkLWhvYyBsb2dpYyBpbgo+IGZsdXNoX2FyZWFfbWFz
aygpCj4gCj4gU2hvcnRoYW5kIHNhZmV0eSByZWFsbHkgc2hvdWxkIGJlIHBhcnQgb2YgdGhlIGFw
aWMgZHJpdmVyLCBub3QgcGFydCBvZgo+IHRoZSBUTEIgbG9naWMuCgpZZXMsIEkndmUgY29kZWQg
aXQgdGhpcyB3YXkgYmVjYXVzZSB0aGVyZSBhcmUgYWxyZWFkeSBzaW1pbGFyIEFQSUMKaG9va3Mg
KGllOiBzZW5kX0lQSV9zZWxmKS4gSSBjYW4gbWVyZ2UgdGhlIHNob3J0aGFuZCBmdW5jdGlvbmFs
aXR5CndpdGggc2VuZF9JUElfbWFzayBpZiB0aGF0J3MgcHJlZmVycmVkLgoKVGhhbmtzLCBSb2dl
ci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
