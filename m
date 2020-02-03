Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEB4150650
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 13:44:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyb2m-0002ap-SR; Mon, 03 Feb 2020 12:41:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MGDo=3X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyb2l-0002ak-BK
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 12:41:35 +0000
X-Inumbo-ID: 82ae75c2-4682-11ea-b211-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82ae75c2-4682-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 12:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580733694;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=YTJhoQfIiOlZ01J6Z11TVmSE1tKCB01ieoG80UgsCDE=;
 b=AYHkUKqfM+/rPyvDLsNDtxXtBLlmE6Q3tIFIzjG8UEdsvb9JOtssVn4D
 CObm2K5+U26SVvzpYZbQexA9h6HrYwzdCnqbFvEAhKUFsacs1wUMMhWOL
 TMoWPCwWYmdAI7NKEJVF+DsBnss31PlAFVsrK9AdMe51KQZF39MrNPEuH g=;
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
IronPort-SDR: oD3ofvduLqXq3d4Ad5sP8Tv7fZMhsb1EIVA1bHQR15zmdiJFejC+WjYpwyqOq41yAtmEiwrL4S
 LHxa1YUAKBbLsNFHzAV6TYa6w3i3zpDuFzEFb/c3jbCGutB8JG8C+F5wiDWLhEghpJlRio4/y3
 QWZLzrG5H3RWbQ+cT6MtHMDwmhIiCGV//fZL19kbfGWLNxl3p7CO0s+MZa+WaLqbEo0uoeEbip
 EKBICLViMOPmQS5+mrhQAlLQL00NMRTnXjt1NVLOB83ekKuejArQMoeaFlTSMn+jom6ItdX1zG
 7rg=
X-SBRS: 2.7
X-MesageID: 12276472
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,397,1574139600"; d="scan'208";a="12276472"
Date: Mon, 3 Feb 2020 13:41:27 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <20200203124127.GV4679@Air-de-Roger>
References: <ebd9cf75-36cd-c064-661d-88a49445ecce@eikelenboom.it>
 <20200203122319.GU4679@Air-de-Roger>
 <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3bcb67a6-3156-f4b0-5ac6-58ca61038cec@eikelenboom.it>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] Xen-unstable: pci-passthrough regression bisected
 to: x86/smp: use APIC ALLBUT destination shorthand when possible
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMDMsIDIwMjAgYXQgMDE6MzA6NTVQTSArMDEwMCwgU2FuZGVyIEVpa2VsZW5i
b29tIHdyb3RlOgo+IE9uIDAzLzAyLzIwMjAgMTM6MjMsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6
Cj4gPiBPbiBNb24sIEZlYiAwMywgMjAyMCBhdCAwOTozMzo1MUFNICswMTAwLCBTYW5kZXIgRWlr
ZWxlbmJvb20gd3JvdGU6Cj4gPj4gSGkgUm9nZXIsCj4gPj4KPiA+PiBMYXN0IHdlZWsgSSBlbmNv
dW50ZXJlZCBhbiBpc3N1ZSB3aXRoIHRoZSBQQ0ktcGFzc3Rocm91Z2ggb2YgYSBVU0IgY29udHJv
bGxlci4gCj4gPj4gSW4gdGhlIGd1ZXN0IEkgZ2V0Ogo+ID4+ICAgICBbIDExNDMuMzEzNzU2XSB4
aGNpX2hjZCAwMDAwOjAwOjA1LjA6IHhIQ0kgaG9zdCBub3QgcmVzcG9uZGluZyB0byBzdG9wIGVu
ZHBvaW50IGNvbW1hbmQuCj4gPj4gICAgIFsgMTE0My4zMzQ4MjVdIHhoY2lfaGNkIDAwMDA6MDA6
MDUuMDogeEhDSSBob3N0IGNvbnRyb2xsZXIgbm90IHJlc3BvbmRpbmcsIGFzc3VtZSBkZWFkCj4g
Pj4gICAgIFsgMTE0My4zNDczNjRdIHhoY2lfaGNkIDAwMDA6MDA6MDUuMDogSEMgZGllZDsgY2xl
YW5pbmcgdXAKPiA+PiAgICAgWyAxMTQzLjM1NjQwN10gdXNiIDEtMjogVVNCIGRpc2Nvbm5lY3Qs
IGRldmljZSBudW1iZXIgMgo+ID4+Cj4gPj4gQmlzZWN0aW9uIHR1cm5lZCB1cCBhcyB0aGUgY3Vs
cHJpdDogCj4gPj4gICAgY29tbWl0IDU1MDBkMjY1YTJhOGZhNjNkNjBjMDhiZWI1NDlkZThlYzgy
ZmY3YTUKPiA+PiAgICB4ODYvc21wOiB1c2UgQVBJQyBBTExCVVQgZGVzdGluYXRpb24gc2hvcnRo
YW5kIHdoZW4gcG9zc2libGUKPiA+IAo+ID4gU29ycnkgdG8gaGVhciB0aGF0LCBsZXQgc2VlIGlm
IHdlIGNhbiBmaWd1cmUgb3V0IHdoYXQncyB3cm9uZy4KPiAKPiBObyBwcm9ibGVtLCB0aGF0IGlz
IHdoeSBJIHRlc3Qgc3R1ZmYgOikKPiAKPiA+PiBJIHZlcmlmaWVkIGJ5IHJldmVydGluZyB0aGF0
IGNvbW1pdCBhbmQgbm93IGl0IHdvcmtzIGZpbmUgYWdhaW4uCj4gPiAKPiA+IERvZXMgdGhlIHNh
bWUgY29udHJvbGxlciB3b3JrIGZpbmUgd2hlbiB1c2VkIGluIGRvbTA/Cj4gCj4gV2lsbCB0ZXN0
IHRoYXQsIGJ1dCBhcyBhbGwgb3RoZXIgcGNpIGRldmljZXMgaW4gZG9tMCB3b3JrIGZpbmUsCj4g
SSBhc3N1bWUgdGhpcyBjb250cm9sbGVyIHdvdWxkIGFsc28gd29yayBmaW5lIGluIGRvbTAgKGFz
IGl0IGhhcyBhbHNvCj4gd29ya2VkIGZpbmUgZm9yIGFnZXMgd2l0aCBQQ0ktcGFzc3Rocm91Z2gg
dG8gdGhhdCBndWVzdCBhbmQgc3RpbGwgd29ya3MKPiBmaW5lIHdoZW4gcmV2ZXJ0aW5nIHRoZSBy
ZWZlcmVuY2VkIGNvbW1pdCkuCgpJcyB0aGlzIHRoZSBvbmx5IGRldmljZSB0aGF0IGZhaWxzIHRv
IHdvcmsgd2hlbiBkb2luZyBwY2ktcGFzc3Rocm91Z2gsCm9yIG90aGVyIGRldmljZXMgYWxzbyBk
b24ndCB3b3JrIHdpdGggdGhlIG1lbnRpb25lZCBjaGFuZ2UgYXBwbGllZD8KCkhhdmUgeW91IHRl
c3RlZCBvbiBvdGhlciBib3hlcz8KCj4gSSBkb24ndCBrbm93IGlmIHlvdXIgY2hhbmdlIGNhbiBz
b21laG93IGhhdmUgYSBzaWRlIGVmZmVjdAo+IG9uIGxhdGVuY3kgYXJvdW5kIHRoZSBwcm9jZXNz
aW5nIG9mIHBjaS1wYXNzdGhyb3VnaCA/CgpIbSwgdGhlIG1lbnRpb25lZCBjb21taXQgc2hvdWxk
IHNwZWVkIHVwIGJyb2FkY2FzdCBJUElzLCBidXQgSSBkb24ndApzZWUgaG93IGl0IGNvdWxkIHNs
b3cgZG93biBvdGhlciBpbnRlcnJ1cHRzLiBBbHNvIEkgd291bGQgdGhpbmsgdGhlCmRvbWFpbiBp
cyBub3QgcmVjZWl2aW5nIGludGVycnVwdHMgZnJvbSB0aGUgZGV2aWNlLCByYXRoZXIgdGhhbgpp
bnRlcnJ1cHRzIGJlaW5nIHNsb3cuCgpDYW4geW91IGFsc28gcGFzdGUgdGhlIG91dHB1dCBvZiBs
c3BjaSAtdiBmb3IgdGhhdCB4SENJIGRldmljZSBmcm9tCmRvbTA/CgpUaGFua3MsIFJvZ2VyLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
