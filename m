Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEB51281AE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 18:53:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiMQb-0002Kh-5Z; Fri, 20 Dec 2019 17:51:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ROLc=2K=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iiMQZ-0002KY-Iy
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 17:51:03 +0000
X-Inumbo-ID: 4956da70-2351-11ea-88e7-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4956da70-2351-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 17:51:02 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t2so10254291wrr.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 09:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+go2VOEDP5GfQJ1JWabDCW7dPUHrvEbhgukkEaeKFT4=;
 b=R5hihj98tLuHfyjrRL7IdxEoMiTAZzuj2DREB5zHRKE4f1yL1Au09UgNaKdjGYPlL0
 MKOjss+pPgG7rbbsloLLVNdDsfU4zacbfVShRYVjEVgUi+uXsez3Eksrr/Cw0wdvxoTc
 PQ2CP9B5lnz64rqJdoikCaQhofthpGQW2Qa1fud7WKfzrySnzCR0aTq4v5kIzACSCAHA
 KIzz+UY4bc1PDHEGNzn5B1cO1z2VH6Rw/X8MnEv6223sW5REGKZc9L0gyFlDuoETmwYd
 NkttmVbnLFNcSTqn3h7QmAtoTvq6QuLoRjbnEf5cl7AX7SlospsKBL0hOWhDNSA+AReW
 Nzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+go2VOEDP5GfQJ1JWabDCW7dPUHrvEbhgukkEaeKFT4=;
 b=plYjovQgCu0qwDLb9eo7QxnPzoewMvAJ2k94OG3pH+fhQF0jVZ+yZIHUwp7ZdnteJP
 mdqScdqDbeUzvm6CHwSGOv44rTCO4vt14F5ItTQ+GD0YHTTOKqj+WyU968+KhbpIJvSD
 TPDZqD/LmtwAknPbhKPLWJHvp2fDD1f3jEWyN7rOxqm/sJLDaDLnFaf6gUq/GGFlVfOF
 Yr3Khfgige2n0KsgUaSNR2cMlHbEuJTvKeTEdwqXpBsqDtv4SLzvmUuFIzP1kmpHHwNP
 a7Rq9ukQnw0EUFpikbCip8pLQA5mxvUy3WUEADbK3nQnVADmYQSudvyMHhaUOVtHvpN9
 VPiA==
X-Gm-Message-State: APjAAAWxh0qgL64er7lfa7z9ioQfKYOsUTbYB/MZ3G6mKuORcZ0XEHam
 JdTMfkJe/ooKSE3Anr9t8yxlAbs60jWSaOtYIBk=
X-Google-Smtp-Source: APXvYqxX0LPBU80XPAlJ4CpY/UjgcV3hvgfFhny6DnXY5mQgmiwZMvxy9gKTSdoKsxp6P8amama1pfwkPxj1ggkDBRI=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr16149469wru.353.1576864261406; 
 Fri, 20 Dec 2019 09:51:01 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <CABfawh=Si977UzkWKbYHoYEW+daLFQNLvOF8YvznxmmeM_BDaA@mail.gmail.com>
 <2122fc00-bf6e-cedd-3b49-d53065a40832@citrix.com>
In-Reply-To: <2122fc00-bf6e-cedd-3b49-d53065a40832@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 20 Dec 2019 10:50:25 -0700
Message-ID: <CABfawh=6SjqOT1nhfL+73FfQG34W=iJpUoGr6kT0oBdnyERrmA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 01/20] x86: make hvm_{get/set}_param
 accessible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjAsIDIwMTkgYXQgMTA6NDcgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyMC8xMi8yMDE5IDE3OjM2LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCAxMDozMiBBTSBBbmRy
ZXcgQ29vcGVyCj4gPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24g
MjAvMTIvMjAxOSAxNzoyNywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4+PiBPbiBGcmksIERl
YyAyMCwgMjAxOSBhdCA5OjQ3IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3Jv
dGU6Cj4gPj4+PiBPbiAxOC4xMi4yMDE5IDIwOjQwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
Pj4+Pj4gQ3VycmVudGx5IHRoZSBodm0gcGFyYW1ldGVycyBhcmUgb25seSBhY2Nlc3NpYmxlIHZp
YSB0aGUgSFZNT1AgaHlwZXJjYWxscy4gQnkKPiA+Pj4+PiBleHBvc2luZyBodm1fe2dldC9zZXR9
X3BhcmFtIGl0IHdpbGwgYmUgcG9zc2libGUgZm9yIFZNIGZvcmtpbmcgdG8gY29weSB0aGUKPiA+
Pj4+PiBwYXJhbWV0ZXJzIGRpcmVjdGx5IGludG8gdGhlIGNsb25lIGRvbWFpbi4KPiA+Pj4+IEhh
dmluZyBwZWVrZWQgYWhlYWQgYXQgcGF0Y2ggMTcsIHdoZXJlIHRoaXMgZ2V0cyB1c2VkLCBJIHdv
bmRlciB3aHkKPiA+Pj4+IHlvdSB3YW50IGEgcGFpciBvZiBvbmUtYnktb25lIGZ1bmN0aW9ucywg
cmF0aGVyIHRoYW4gYSBjb3B5LWFsbCBvbmUuCj4gPj4+PiBUaGlzIHRoZW4gd291bGRuJ3QgcmVx
dWlyZSBleHBvc3VyZSBvZiB0aGUgZnVuY3Rpb25zIHlvdSB0b3VjaCBoZXJlLgo+ID4+PiBXZWxs
LCBwcm92aWRlZCB0aGVyZSBpcyBubyBzdWNoIGZ1bmN0aW9uIGluIGV4aXN0ZW5jZSB0b2RheSBp
dCB3YXMKPiA+Pj4ganVzdCBlYXNpZXIgdG8gdXNlIHdoYXQncyBhbHJlYWR5IGF2YWlsYWJsZS4g
SSBzdGlsbCB3b3VsZG4ndCB3YW50IHRvCj4gPj4+IGltcGxlbWVudCBhIG9uZS1zaG90IGZ1bmN0
aW9uIGxpa2UgdGhhdCBiZWNhdXNlIHRoaXMgc2FtZSBjb2RlLXBhdGggaXMKPiA+Pj4gc2hhcmVk
IGJ5IHRoZSBzYXZlLXJlc3RvcmUgb3BlcmF0aW9ucyBvbiB0aGUgdG9vbHN0YWNrIHNpZGUsIHNv
IGF0Cj4gPj4+IGxlYXN0IEkgaGF2ZSBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0aGF0IGl0IHdv
bid0IGJyZWFrIG9uIG1lIGluIHRoZQo+ID4+PiBmdXR1cmUuCj4gPj4gSW4gcGFydGljdWxhciwg
YSBudW1iZXIgb2YgdGhlIHNldCBvcGVyYXRpb25zIGFyZSBkaXN0aW5jdGx5Cj4gPj4gbm9uLXRy
aXZpYWwuICAoT1RPSCwgdGhvc2UgYXJlIG5vdCBsb25nIGZvciB0aGlzIHdvcmxkLCBhbmQgc2hv
dWxkIGJlCj4gPj4gY3JlYXRpb24gWDg2X0VNVV8qIGNvbnN0YW50cyBpbnN0ZWFkKS4KPiA+Pgo+
ID4gSSBhY3R1YWxseSB3YW50ZWQgdG8gYXNrIGFib3V0IHRoYXQuIEluCj4gPiBodHRwczovL3hl
bmJpdHMueGVuLm9yZy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj10b29scy9saWJ4Yy94Y19z
cl9zYXZlX3g4Nl9odm0uYztoPTk3YThjNDk4MDdmMTkyYzQ3MjA5NTI1ZjUxZTRkNzlhNTBjNjZj
ZWM7aGI9SEVBRCNsNjEKPiA+IHRoZSB0b29sc3RhY2sgb25seSBzZWxlY3RzIGNlcnRhaW4gSFZN
IHBhcmFtcyB0byBiZSBzYXZlZCAoYW5kCj4gPiByZXN0b3JlZCBsYXRlcikuIEkgb3JpZ2luYWxs
eSBmb2xsb3dlZCB0aGUgc2FtZSBsb2dpYyBpbiB0aGUgZm9yawo+ID4gY29kZS1wYXRoIGJ1dCBh
ZnRlciBhIGxvdCBvZiBleHBlcmltZW50cyBpdCBsb29rcyBsaWtlIGl0J3MgYWN0dWFsbHkKPiA+
IE9LIHRvIGdyYWIgYWxsIHBhcmFtcyBidXQgb25seSBjYWxsIHNldF9wYXJhbSBvbiB0aGUgb25l
cyB0aGF0IGhhdmUgYQo+ID4gbm9uLXplcm8gdmFsdWUuIFNvIHNldHRpbmcgc29tZSBwYXJhbXMg
d2l0aCBhIHplcm8gdmFsdWUgaGFzIGNlcnRhaW5seQo+ID4gbGVhZCB0byBjcmFzaGVzLCBidXQg
b3RoZXJ3aXNlIGl0IHNlZW1zIHRvICJqdXN0IHdvcmsiIHRvIGNvcHkgYWxsIHRoZQo+ID4gcmVz
dC4KPgo+IEkgdGhpbmsgeW91J3JlIHRyeWluZyB0byBhc2NyaWJlIGFueSBmb3JtIG9mIGRlc2ln
bi9wbGFuIHRvIGEgc3lzdGVtCj4gd2hpY2ggaGFkIG5vbmUuIDopCj4KPiBUaGUgY29kZSB5b3Ug
cXVvdGUgd2FzIGxpa2UgdGhhdCBiZWNhdXNlIHRoYXQgaXMgaG93IGxlZ2FjeSBtaWdyYXRpb24K
PiB3b3JrZWQuICBUaGF0IHNhaWQsIGVsaWRpbmcgZW1wdHkgcmVjb3JkcyB3YXMgYW4gZWZmb3J0
LXNhdmluZyBleGVyY2lzZQo+IChhdm9pZCByZWR1bmRhbnQgaHlwZXJjYWxscyBvbiBkZXN0aW5h
dGlvbiBzaWRlKSwgbm90IGJlY2F1c2UgdGhlcmUgd2FzCj4gYW55IHN1Z2dlc3Rpb24gdGhhdCBh
dHRlbXB0aW5nIHRvIGV4cGxpY2l0bHkgc2V0IDAgd291bGQgY3Jhc2guCj4KPiBEbyB5b3UgaGF2
ZSBhbnkgaWRlYSB3aGljaCBwYXJhbSB3YXMgY2F1c2luZyBwcm9ibGVtcz8KClllcywgSFZNX1BB
UkFNX0lERU5UX1BUIHdhcyBvbmUgc3VyZS4gVGhlcmUgbWF5IGhhdmUgYmVlbiBvdGhlcnMgKEkK
ZG9uJ3QgcmVjYWxsIG5vdykgYnV0IHNpbXBseSBjaGVja2luZyBmb3Igbm9uLXplcm8gdmFsdWUg
YmVmb3JlCmNhbGxpbmcgc2V0X3BhcmFtIHJlc29sdmVkIGV2ZXJ5dGhpbmcuCgpUYW1hcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
