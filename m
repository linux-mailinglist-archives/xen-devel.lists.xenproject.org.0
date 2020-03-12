Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D88183629
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:30:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCQfx-0003Hn-AQ; Thu, 12 Mar 2020 16:27:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZoK0=45=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jCQfv-0003Hi-RQ
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:27:11 +0000
X-Inumbo-ID: 529b5fb6-647e-11ea-b1d1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 529b5fb6-647e-11ea-b1d1-12813bfff9fa;
 Thu, 12 Mar 2020 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584030430;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M4T3Df/jdoUhwdchiju0vIHUvm6Q9Tr9NDLvtKoKfNM=;
 b=gV9oTOOj95RAmKiK8jBIngMiMgJA4zAZMKwsa8bCFpX6PFR4fvwTjVCP
 PFekgjL7gopVOVWVMsvb1EihQihGXIZu4wxmElJ3jRnkni7V1kSivJtYp
 pI2Hk2v9to09TL+34Ln++g8LXTuL0HRS65O6Of7aCHy4GQBSIscBKE7XS o=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 73Zn+Qy9t4fAfhDcQLmQSUHAT1rnNKCSbNwPfu0KZ+W19QZ7gZWBwBlROy/xuJvNzYP+6vF543
 rprNJL++WHHsBt62YJ8pbbihTU2eZBWcMmGlNOLyjDXjJCb2nx6fZtNaKtAWPjQq9Ej5h8CQR9
 +sJzIrUDk4LMzo4B9IT9HnA0jy4JHjEoI5SGn83YYMpKAFxqUHCaGThiwzGEKbOhdRUNOmh4eQ
 Xeh1rChCGTpCGI6q5Gs4hz4YUzne8vel+cLDamNinvm/pcereB4sH2Xaf6NW/4jDIl8O+Oa7/r
 iKo=
X-SBRS: 2.7
X-MesageID: 14276154
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="14276154"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Dario Faggioli
 <dfaggioli@suse.com>, <xen-devel@lists.xenproject.org>
References: <158402056376.753.7091379488590272336.stgit@Palanthas>
 <03f34120-8420-a526-1b03-03601c169be1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <a4bddd49-6a9a-6f66-9154-745d0648b42b@citrix.com>
Date: Thu, 12 Mar 2020 16:27:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <03f34120-8420-a526-1b03-03601c169be1@suse.com>
Content-Language: en-US
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 0/2] xen: credit2: fix vcpu starvation due
 to too few credits
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
Cc: Charles Arnold <carnold@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Glen <glenbarney@gmail.com>, George Dunlap <george.dunlap@citrix.com>,
 Tomas Mozes <hydrapolic@gmail.com>, Sarah Newman <srn@prgmr.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMi8wMy8yMDIwIDE1OjUxLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDEyLjAzLjIw
IDE0OjQ0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4gSGVsbG8gZXZlcnlvbmUsCj4+Cj4+IFRo
ZXJlIGhhdmUgYmVlbiByZXBvcnRzIG9mIGEgQ3JlZGl0MiBpc3N1ZSBkdWUgdG8gd2hpY2ggdkNQ
VXMgd2hlcmUKPj4gYmVpbmcgc3RhcnZlZCwgdG8gdGhlIHBvaW50IHRoYXQgZ3Vlc3Qga2VybmVs
IHdvdWxkIGNvbXBsYWluIG9yIGV2ZW4KPj4gY3Jhc2guCj4+Cj4+IFNlZSB0aGUgZm9sbG93aW5n
IHhlbi11c2VycyBhbmQgeGVuLWRldmVsIHRocmVhZHM6Cj4+IGh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tdXNlcnMvMjAyMC0wMi9tc2cwMDAxOC5odG1sCj4+
Cj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tdXNlcnMv
MjAyMC0wMi9tc2cwMDAxNS5odG1sCj4+Cj4+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAyMC0wMi9tc2cwMTE1OC5odG1sCj4+Cj4+Cj4+IEkg
ZGlkIHNvbWUgaW52ZXN0aWdhdGlvbnMsIGFuZCBmaWd1cmVkIG91dCB0aGF0IHRoZSB2Q1BVcyBp
biBxdWVzdGlvbgo+PiBhcmUgbm90IHNjaGVkdWxlZCBmb3IgbG9uZyB0aW1lIGludGVydmFscyBi
ZWNhdXNlIHRoZXkgc29tZWhvdyBtYW5hZ2UgdG8KPj4gYmUgZ2l2ZW4gYW4gYW1vdW50IG9mIGNy
ZWRpdHMgd2hpY2ggaXMgbGVzcyB0aGFuIHRoZSBjcmVkaXQgdGhlIGlkbGUKPj4gdkNQVSBoYXMu
Cj4+Cj4+IEFuIGV4YW1wbGUgb2YgdGhpcyBzaXR1YXRpb24gaXMgc2hvd24gaGVyZS4gSW4gZmFj
dCwgd2UgY2FuIHNlZSBkMHYxCj4+IHNpdHRpbmcgaW4gdGhlIHJ1bnF1ZXVlIHdoaWxlIGFsbCB0
aGUgQ1BVcyBhcmUgaWRsZSwgYXMgaXQgaGFzCj4+IC0xMjU0MjM4MjcwIGNyZWRpdHMsIHdoaWNo
IGlzIHNtYWxsZXIgdGhhbiAtMl4zMCA9IOKIkjEwNzM3NDE4MjQ6Cj4+Cj4+IMKgwqDCoMKgIChY
RU4pIFJ1bnF1ZXVlIDA6Cj4+IMKgwqDCoMKgIChYRU4pwqDCoCBuY3B1c8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgID0gMjgKPj4gwqDCoMKgwqAgKFhFTinCoMKgIGNwdXPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgID0gMC0yNwo+PiDCoMKgwqDCoCAoWEVOKcKgwqAgbWF4X3dlaWdodMKg
wqDCoMKgwqDCoMKgwqAgPSAyNTYKPj4gwqDCoMKgwqAgKFhFTinCoMKgIHBpY2tfYmlhc8KgwqDC
oMKgwqDCoMKgwqDCoCA9IDIyCj4+IMKgwqDCoMKgIChYRU4pwqDCoCBpbnN0bG9hZMKgwqDCoMKg
wqDCoMKgwqDCoMKgID0gMQo+PiDCoMKgwqDCoCAoWEVOKcKgwqAgYXZlbG9hZMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgPSAyOTMzOTEgKH4xMTElKQo+PiDCoMKgwqDCoCAoWEVOKcKgwqAgaWRsZXJz
Ogo+PiAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwMDAwMDAwMCwwZmZm
ZmZmZgo+PiDCoMKgwqDCoCAoWEVOKcKgwqAgdGlja2xlZDoKPj4gMDAsMDAwMDAwMDAsMDAwMDAw
MDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAsMDAwMDAwMDAKPj4gwqDCoMKgwqAgKFhFTinC
oMKgIGZ1bGx5IGlkbGUgY29yZXM6Cj4+IDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAwMDAwMDAwLDAw
MDAwMDAwLDAwMDAwMDAwLDBmZmZmZmZmCj4+IMKgwqDCoMKgIFsuLi5dCj4+IMKgwqDCoMKgIChY
RU4pIFJ1bnF1ZXVlIDA6Cj4+IMKgwqDCoMKgIChYRU4pIENQVVswMF0gcnVucT0wLCBzaWJsaW5n
PTAwLC4uLiwgY29yZT0wMCwuLi4KPj4gwqDCoMKgwqAgKFhFTikgQ1BVWzAxXSBydW5xPTAsIHNp
Ymxpbmc9MDAsLi4uLCBjb3JlPTAwLC4uLgo+PiDCoMKgwqDCoCBbLi4uXQo+PiDCoMKgwqDCoCAo
WEVOKSBDUFVbMjZdIHJ1bnE9MCwgc2libGluZz0wMCwuLi4sIGNvcmU9MDAsLi4uCj4+IMKgwqDC
oMKgIChYRU4pIENQVVsyN10gcnVucT0wLCBzaWJsaW5nPTAwLC4uLiwgY29yZT0wMCwuLi4KPj4g
wqDCoMKgwqAgKFhFTikgUlVOUToKPj4gwqDCoMKgwqAgKFhFTinCoMKgwqDCoCAwOiBbMC4xXSBm
bGFncz0wIGNwdT01IGNyZWRpdD0tMTI1NDIzODI3MCBbdz0yNTZdCj4+IGxvYWQ9MjYyMTQ0ICh+
MTAwJSkKPj4KPj4gVGhpcyBoYXBwZW5zIGJhY2F1c2UgLS1hbHRob3VnaCB2ZXJ5IHJhcmVseS0t
IHZDUFVzIGFyZSBhbGxvd2VkIHRvCj4+IGV4ZWN1dGUgZm9yIG11Y2ggbW9yZSB0aGFuIHRoZSBz
Y2hlZHVsZXIgd291bGQgd2FudCB0aGVtIHRvLgo+Pgo+PiBGb3IgZXhhbXBsZSwgSSBoYXZlIGEg
dHJhY2Ugc2hvd2luZyB0aGF0IGNzY2hlZDJfc2NoZWR1bGUoKSBpcwo+PiBpbnZva2VkIGF0Cj4+
IHQ9NTc5NzA3NDYxNTVucy4gQXQgdD01Nzk3MDc0NzY1OG5zICgrMTUwM25zKSB0aGUgc190aW1l
ciBpcyBzZXQgdG8KPj4gZmlyZSBhdCB0PTU3OTc5NDg1MDgzbnMsIGkuZS4sIDg3Mzg5MjhucyBp
biBmdXR1cmUuIFRoYXQncyBiZWNhdXNlCj4+IGNyZWRpdAo+PiBvZiBzbmV4dCBpcyBleGFjdGx5
IHRoYXQgODczODkyOG5zLiBUaGVuLCB3aGF0IEkgc2VlIGlzIHRoYXQgdGhlIG5leHQKPj4gY2Fs
bCB0byBidXJuX2NyZWRpdHMoKSwgY29taW5nIGZyb20gY3NjaGVkMl9zY2hlZHVsZSgpIGZvciB0
aGUgc2FtZSB2Q1BVCj4+IGhhcHBlbnMgYXQgdD02MDA4MzI4MzYxN25zLiBUaGF0IGlzICphIGxv
dCogKDIxMDM3OTg1MzRucykgbGF0ZXIgdGhhbgo+PiB3aGVuIHdlIGV4cGVjdGVkIGFuZCBhc2tl
ZC4gT2YgY291cnNlLCB0aGF0IGFsc28gbWVhbnMgdGhhdCBkZWx0YSBpcwo+PiAyMTEyNTM3NDYy
bnMsIGFuZCB0aGVyZWZvcmUgY3JlZGl0cyB3aWxsIHNpbmsgdG8gLTIxMDM3OTg1MzQhCj4KPiBD
dXJyZW50IGlkZWFzIGFyZToKPgo+IC0gQ291bGQgaXQgYmUgdGhlIHZjcHUgaXMgYnVzeSBmb3Ig
dmVyeSBsb25nIHRpbWUgaW4gdGhlIGh5cGVydmlzb3I/Cj4gwqAgU28gZWl0aGVyIGZpZ2h0aW5n
IHdpdGggYW5vdGhlciB2Y3B1IGZvciBhIGxvY2ssIGRvaW5nIGEgbG9uZwo+IMKgIHJ1bm5pbmcg
aHlwZXJjYWxsLCAuLi4KClVzaW5nIHdhdGNoZG9nPTIgbWlnaHQgY2F0Y2ggdGhhdC7CoCAoVGhl
cmUgaXMgYSBjb3VudGluZyBpc3N1ZSB3aGljaApJJ3ZlIG5vdCBoYWQgdGltZSB0byBmaXggeWV0
LCB3aGljaCBtYWtlcyB0aGUgd2F0Y2hkb2cgbW9yZSBmcmFnaWxlIHdpdGgKYSBzbWFsbGVyIHRp
bWVvdXQsIGJ1dCAyIHNob3VsZCBiZSBvay4pCgo+Cj4gLSBUaGUgdGltZXIgdXNlZCBpcyBub3Qg
cmVsaWFibGUuCj4KPiAtIFRoZSB0aW1lIGJhc2UgaXMgbm90IHJlbGlhYmxlICh0c2Mgb3Igd2hh
dGV2ZXIgaXMgdXNlZCBmb3IgZ2V0dGluZwo+IMKgIHRoZSB0aW1lIGhhcyBqdW1wZWQgMiBzZWNv
bmRzIGludG8gdGhlIGZ1dHVyZSkuCgpXb3J0aCBpbnN0cnVtZW50aW5nIHRoZSBUU0MgcmVuZGV6
dm91cyBmb3IgdW5leHBlY3RlZGx5IGxhcmdlIGp1bXBzPwoKPgo+IC0gU3lzdGVtIG1hbmFnZW1l
bnQgbW9kZSBoYXMga2lja2VkIGluLgoKU01NIGhhbmRsZXJzIG5lZWQgdG8gcmVuZGV6dm91cyB0
byBrZWVwIHRoZWlyIHNlY3JldHMgc2VjcmV0IHRoZXNlIGRheXMsCmJ1dCBJIHN1cHBvc2UgdGhp
cyBpcyBhbHdheXMgYSBwb3NzaWJpbGl0eS4KClRoZXJlIGFyZSBub24tYXJjaGl0ZWN0dXJhbCBT
TUlfQ09VTlQgTVNScyAoMHgzNCBvbiBJbnRlbCwgY2FuJ3QKcmVtZW1iZXIgQU1EIG9mZiB0aGUg
dG9wIG9mIG15IGhlYWQpIHdoaWNoIGNhbiBiZSB1c2VkIHRvIHNlZSBpZiBhbnkKaGF2ZSBvY2N1
cnJlZCwgYW5kIHRoaXMgaGFzIHByb3ZlZCB1c2VmdWwgaW4gdGhlIHBhc3QgZm9yIGRlYnVnZ2lu
Zy4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
