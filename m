Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9B8140EB2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jan 2020 17:11:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1isUAp-0004oc-3M; Fri, 17 Jan 2020 16:08:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b9RF=3G=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1isUAo-0004oX-66
 for xen-devel@lists.xenproject.org; Fri, 17 Jan 2020 16:08:38 +0000
X-Inumbo-ID: 9997ae62-3943-11ea-b833-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9997ae62-3943-11ea-b833-bc764e2007e4;
 Fri, 17 Jan 2020 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579277310;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=NWB977ln+psGwRV3c7MJCYolz/DNPdp0xMF2NTwDHa8=;
 b=Zm1iKtrP/J+BIyd+SsBRk7RP2e5kqZAlpEz6m4arEkyqgLlCA58LyJX0
 VvWdC2do6o0dngksWsOxyjGuOGE8A+4Ytks3ocwipqalnbaw1AXFoMc6/
 pikqD+b78d6KA+DeGKKbnbEfk9noIgOHjt0iTA4L+WMoWgkVjXMtit0LA I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SRjZzEQplyGSQlqZkLcUuWF+PuR6spST6v5K2mamiEFX16h7Xu6G5owZORQWgzKlm5ImJuve7b
 KaNdL5ZeO4M7/lrZI0BN6ifne55nrp4YhMVcdpeH3KgqLebaSceKd8SQNPhfo/JLVML7IwNiiY
 tfzlbRpQS4b7asNBWPacdOSZRdXLNv21AUyDXW1bdaqULZRuVRTW2QMbCiU/krKmC7JOGvAVkt
 m0wT5gyu4VJnImznrfsQ3n888nuXMVtXIknFkDPGD702dihe8jEGCA5qk7XhgpuEFCy96T60n4
 Z60=
X-SBRS: 2.7
X-MesageID: 11250704
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,330,1574139600"; d="scan'208";a="11250704"
Date: Fri, 17 Jan 2020 17:08:22 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200117160822.GT11756@Air-de-Roger>
References: <20200117150948.45014-1-roger.pau@citrix.com>
 <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27d19d98-2209-8add-c66c-e06e51834172@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] x86/apic: fix disabling LVT0 in
 disconnect_bsp_APIC
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
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDQ6NTY6MDBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDEuMjAyMCAxNjowOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhl
IEludGVsIFNETSBzdGF0ZXM6Cj4gPiAKPiA+ICJXaGVuIGFuIGlsbGVnYWwgdmVjdG9yIHZhbHVl
ICgwIHRvIDE1KSBpcyB3cml0dGVuIHRvIGEgTFZUIGVudHJ5IGFuZAo+ID4gdGhlIGRlbGl2ZXJ5
IG1vZGUgaXMgRml4ZWQgKGJpdHMgOC0xMSBlcXVhbCAwKSwgdGhlIEFQSUMgbWF5IHNpZ25hbCBh
bgo+ID4gaWxsZWdhbCB2ZWN0b3IgZXJyb3IsIHdpdGhvdXQgcmVnYXJkIHRvIHdoZXRoZXIgdGhl
IG1hc2sgYml0IGlzIHNldCBvcgo+ID4gd2hldGhlciBhbiBpbnRlcnJ1cHQgaXMgYWN0dWFsbHkg
c2VlbiBvbiB0aGUgaW5wdXQuIgo+ID4gCj4gPiBBbmQgdGhhdCdzIGV4YWN0bHkgd2hhdCdzIGN1
cnJlbnRseSBkb25lIGluIGRpc2Nvbm5lY3RfYnNwX0FQSUMgd2hlbgo+ID4gdmlydF93aXJlX3Nl
dHVwIGlzIHRydWUgYW5kIExWVCBMSU5UMCBpcyBiZWluZyBtYXNrZWQuIEJ5IHdyaXRpbmcgb25s
eQo+ID4gQVBJQ19MVlRfTUFTS0VEIFhlbiBpcyBhY3R1YWxseSBzZXR0aW5nIHRoZSB2ZWN0b3Ig
dG8gMCBhbmQgdGhlCj4gPiBkZWxpdmVyeSBtb2RlIHRvIEZpeGVkICgwKSwgYW5kIGhlbmNlIGl0
IHRyaWdnZXJzIGFuIEFQSUMgZXJyb3IgZXZlbgo+ID4gd2hlbiB0aGUgTFZUIGVudHJ5IGlzIG1h
c2tlZC4KPiAKPiBCdXQgdGhlcmUgYXJlIG1hbnkgbW9yZSBpbnN0YW5jZXMgd2hlcmUgd2UgKGhh
dmUgYSByaXNrIHRvKSBkbyBzbywKPiBtb3N0IG5vdGFibHkgaW4gY2xlYXJfbG9jYWxfQVBJQygp
LiBUaGUgdHdvIHN0ZXAgbG9naWMgdGhlcmUgaXMKPiBhbnl3YXkgc29tZXdoYXQgaW4gY29uZmxp
Y3Qgd2l0aCB0aGUgY2l0YXRpb24gYWJvdmUuCgpjbGVhcl9sb2NhbF9BUElDIG1hc2tzIHRoZSBl
cnJvciB2ZWN0b3IgYmVmb3JlIGRvaW5nIGFueSB3cml0ZSwgYW5kCmNsZWFycyBFU1IgYWZ0ZXJ3
YXJkcywgdGhlcmUncyBhIGNvbW1lbnQgYXQgdGhlIHRvcDoKCiJNYXNraW5nIGFuIExWVCBlbnRy
eSBvbiBhIFA2IGNhbiB0cmlnZ2VyIGEgbG9jYWwgQVBJQyBlcnJvcgppZiB0aGUgdmVjdG9yIGlz
IHplcm8uIE1hc2sgTFZURVJSIGZpcnN0IHRvIHByZXZlbnQgdGhpcy4iCgpXZSBjb3VsZCBkbyB0
aGUgc2FtZSAoaWU6IG1hc2sgTFZURVJSIGZpcnN0IGFuZCBjbGVhciBFU1IgYWZ0ZXJ3YXJkcykK
aWYgdGhhdCBzZWVtcyBwcmVmZXJhYmxlLiBUaGVyZSdzIGEgbWF4bHZ0IGNoZWNrIGluIGNsZWFy
X2xvY2FsX0FQSUMsCmJ1dCB0aGUgc2RtIGRvZXNuJ3Qgc3BlY2lmeSBhbnl3YXkgdG8gY2hlY2sg
aWYgdGhlIGxhcGljIHdpbGwgYWNjZXB0IGEKbWFza2VkIHZlY3RvciAwIHdyaXRlIG9yIG5vdCwg
c28gbm90IHN1cmUgd2hldGhlciB3ZSBzaG91bGQgcmVwbGljYXRlCnRoYXQgY2hlY2sgb3IganVz
dCBkbyBpdCB1bmNvbmRpdGlvbmFsbHkgb24gYm90aCBkaXNjb25uZWN0X2JzcF9BUElDCmFuZCBj
bGVhcl9sb2NhbF9BUElDLgoKVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
