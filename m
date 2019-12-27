Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF15112B510
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 15:10:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikqHD-0005XB-C1; Fri, 27 Dec 2019 14:07:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=blbd=2R=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1ikqHC-0005X6-Fg
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 14:07:38 +0000
X-Inumbo-ID: 3c78b5c4-28b2-11ea-88e7-bc764e2007e4
Received: from mail-wm1-x344.google.com (unknown [2a00:1450:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c78b5c4-28b2-11ea-88e7-bc764e2007e4;
 Fri, 27 Dec 2019 14:07:37 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so8150397wmc.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Dec 2019 06:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SxHM2eeXZXhCuLKpTbmlxvLAmonChXELXfS+1VvOfqk=;
 b=uc6kMD2Hafh+6wP/pEvF+v12s1aVLi9TeCIroNxzx+BBAIm7MiKZfrUE2NDqL524MF
 +DKiXyjKjOQ5e2WR2e5M+LHQ4Q4DzqLL272056XfWQQClbOvphZLBEC4FHLG2GMOBL4E
 j+o6BHagO6TKkULBTtempz4VMhbVz2yj4lyfc5IoFniYdqXjYNWb8Vmhiaux1ckKGJXG
 Rng2dJHkl+sLbRDsUVxP5byW1qnWbs4cyH5pECkyYeu2G4c6srkqmjn3Q2QoTw6xMjiQ
 JzxmCKHJuoEgjUPlWW0ZYchqz8XFUEIu2Jtg7BkbRKeHWzW0sKzBiqkAju4FkrM/FncI
 C2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SxHM2eeXZXhCuLKpTbmlxvLAmonChXELXfS+1VvOfqk=;
 b=s3wDrHhlW3vgWj+T7V3RiO4RfFaOB8ZEv/2HTNkGWHPFk2MnVPD3GsaRvgbzpqDRzt
 UDgsIlmRvy1mi+IfSyVbNYYxZ8ns2XAZloykHw9Q9M6NCnfDENJ9crwwh4LjlmkamQfm
 YJtF4tglKhYDC+W/oeeJkqAgIdBVb/nsR1vmB9ixmS/QhLpquOaUUKX6kP4y9MLeTWV1
 nPziXLM6Ip5ojQCrA4RzuusjeY0JCZLQRNwkYejnAxpLYFjelGRxVLzssUxIwW/JV7v7
 vgCGEMLGwIAgqsf9UCGS2DvSoy0xl0PNspodvGgy+KVkyMgJAvXad69GmesDG9YH9V9X
 DsJw==
X-Gm-Message-State: APjAAAWB8212LbKoJwHC3XtOX3MIniyeO6r7CXhjQ4ixD5+/jC1M6fwH
 kFR1HD7P6sA5TRY3JIqReYaxwx9QReCLN2qoJys=
X-Google-Smtp-Source: APXvYqwyagXLXjOmSJvqTWudtMWRcx+clxorJUW8ceHwOb6BxXOj27O5fMLkr+c7wtxCvj74grIbb1CsmPjMxX0cNAY=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr20595575wme.125.1577455656754; 
 Fri, 27 Dec 2019 06:07:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <0987641ced136706961cf419eb5ed83d1302357b.1576697796.git.tamas.lengyel@intel.com>
 <ba37b587-6a4a-ecd8-3e2f-400e2755b24d@suse.com>
 <CABfawhmGQz8cAQWv-pkTXTNNXS-ML6wDcCon5ONAUZr_VP8WUA@mail.gmail.com>
 <530c2a0e-c79a-b540-8d6a-9d50e22bff41@citrix.com>
 <dab59394-756a-95de-76ac-c4fb34ee85a2@suse.com>
 <CABfawhmeMQtpwjubk_YLO26Lo+6JvZtVtqKWexgjE3VR8SNZZQ@mail.gmail.com>
 <279e2e11-3928-b7ef-4dda-632ce58c650d@suse.com>
 <CABfawhmzVwedYq-iYTSAYEjXkPR_4PBz+MR=eTJwKfHbux-9gQ@mail.gmail.com>
 <694f476c-cd5d-54c5-7b4a-02bfc7015778@suse.com>
In-Reply-To: <694f476c-cd5d-54c5-7b4a-02bfc7015778@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Fri, 27 Dec 2019 07:06:59 -0700
Message-ID: <CABfawhkkqKHdh1ULOhxmOGZRb2tWPJyHoa1kz-dQVrc2JPkQyw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgNjo0NCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjcuMTIuMjAxOSAxNDoxMCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gRnJpLCBEZWMgMjcsIDIwMTkgYXQgMTowNCBBTSBKYW4gQmV1bGljaCA8SkJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gKHJlLXNlbmRpbmcsIGFzIEkgc3RpbGwg
ZG9uJ3Qgc2VlIHRoZSBtYWlsIGhhdmluZyBhcHBlYXJlZCBvbiB0aGUgbGlzdCkKPiA+Pgo+ID4+
IE9uIDIzLjEyLjIwMTkgMTU6NTUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4gT24gTW9u
LCBEZWMgMjMsIDIwMTkgYXQgMjozNyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
IHdyb3RlOgo+ID4+Pj4KPiA+Pj4+IE9uIDIwLjEyLjIwMTkgMTg6MzIsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4gPj4+Pj4gT24gMjAvMTIvMjAxOSAxNzoyNywgVGFtYXMgSyBMZW5neWVsIHdyb3Rl
Ogo+ID4+Pj4+PiBPbiBGcmksIERlYyAyMCwgMjAxOSBhdCA5OjQ3IEFNIEphbiBCZXVsaWNoIDxq
YmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+Pj4+PiBPbiAxOC4xMi4yMDE5IDIwOjQwLCBU
YW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPj4+Pj4+Pj4gQ3VycmVudGx5IHRoZSBodm0gcGFyYW1l
dGVycyBhcmUgb25seSBhY2Nlc3NpYmxlIHZpYSB0aGUgSFZNT1AgaHlwZXJjYWxscy4gQnkKPiA+
Pj4+Pj4+PiBleHBvc2luZyBodm1fe2dldC9zZXR9X3BhcmFtIGl0IHdpbGwgYmUgcG9zc2libGUg
Zm9yIFZNIGZvcmtpbmcgdG8gY29weSB0aGUKPiA+Pj4+Pj4+PiBwYXJhbWV0ZXJzIGRpcmVjdGx5
IGludG8gdGhlIGNsb25lIGRvbWFpbi4KPiA+Pj4+Pj4+IEhhdmluZyBwZWVrZWQgYWhlYWQgYXQg
cGF0Y2ggMTcsIHdoZXJlIHRoaXMgZ2V0cyB1c2VkLCBJIHdvbmRlciB3aHkKPiA+Pj4+Pj4+IHlv
dSB3YW50IGEgcGFpciBvZiBvbmUtYnktb25lIGZ1bmN0aW9ucywgcmF0aGVyIHRoYW4gYSBjb3B5
LWFsbCBvbmUuCj4gPj4+Pj4+PiBUaGlzIHRoZW4gd291bGRuJ3QgcmVxdWlyZSBleHBvc3VyZSBv
ZiB0aGUgZnVuY3Rpb25zIHlvdSB0b3VjaCBoZXJlLgo+ID4+Pj4+PiBXZWxsLCBwcm92aWRlZCB0
aGVyZSBpcyBubyBzdWNoIGZ1bmN0aW9uIGluIGV4aXN0ZW5jZSB0b2RheSBpdCB3YXMKPiA+Pj4+
Pj4ganVzdCBlYXNpZXIgdG8gdXNlIHdoYXQncyBhbHJlYWR5IGF2YWlsYWJsZS4gSSBzdGlsbCB3
b3VsZG4ndCB3YW50IHRvCj4gPj4+Pj4+IGltcGxlbWVudCBhIG9uZS1zaG90IGZ1bmN0aW9uIGxp
a2UgdGhhdCBiZWNhdXNlIHRoaXMgc2FtZSBjb2RlLXBhdGggaXMKPiA+Pj4+Pj4gc2hhcmVkIGJ5
IHRoZSBzYXZlLXJlc3RvcmUgb3BlcmF0aW9ucyBvbiB0aGUgdG9vbHN0YWNrIHNpZGUsIHNvIGF0
Cj4gPj4+Pj4+IGxlYXN0IEkgaGF2ZSBhIHJlYXNvbmFibGUgYXNzdW1wdGlvbiB0aGF0IGl0IHdv
bid0IGJyZWFrIG9uIG1lIGluIHRoZQo+ID4+Pj4+PiBmdXR1cmUuCj4gPj4+Pj4KPiA+Pj4+PiBJ
biBwYXJ0aWN1bGFyLCBhIG51bWJlciBvZiB0aGUgc2V0IG9wZXJhdGlvbnMgYXJlIGRpc3RpbmN0
bHkKPiA+Pj4+PiBub24tdHJpdmlhbC4KPiA+Pj4+Cj4gPj4+PiBIb3cgaXMgdHJpdmlhbCBvciBu
b3QgcmVsYXRlZCB0byB0aGVyZSBiZWluZyBvbmUgZnVuY3Rpb24gZG9pbmcKPiA+Pj4+IHRoZSBs
b29waW5nIHdhbnRlZCBoZXJlIHZzIHRoZSBsb29waW5nIGJlaW5nIGRvbmUgYnkgdGhlIGNhbGxl
cgo+ID4+Pj4gYXJvdW5kIHRoZSB0d28gcGVyLWVudGl0eSBjYWxscz8KPiA+Pj4KPiA+Pj4gSSBk
b24ndCByZWFsbHkgZ2V0IHdoeSB3b3VsZCBpdCBtYXR0ZXIgd2hlcmUgdGhlIGxvb3BpbmcgaXMg
YmVpbmcKPiA+Pj4gZG9uZT8gRXZlbiBpZiBJIHdlcmUgdG8gYWRkIGEgc2luZ2xlIGZ1bmN0aW9u
IHRvIGRvIHRoaXMsIGl0IHdvdWxkIGRvCj4gPj4+IHRoZSBzYW1lIGxvb3BpbmcgYW5kIGp1c3Qg
Y2FsbCB0aGUgbm93IGludGVybmFsbHkga2VwdCBnZXQvc2V0IHBhcmFtcwo+ID4+PiBmdW5jdGlv
bnMuCj4gPj4KPiA+PiBUaGUgZGlmZmVyZW5jZSAodG8gbWUpIGlzIHdoYXQgbGV2ZWwgb2YgY29u
dHJvbCBnZXRzIGV4cG9zZWQgb3V0c2lkZQo+ID4+IG9mIHRoZSBmaWxlLiBGb3IgZXhhbXBsZSBJ
IGFsc28gZGlzbGlrZSBleHRlcm5hbCBjb2RlIGRvaW5nIHRoaXMKPiA+PiBzb21ld2hhdCBvZGQg
KGJ1dCBuZWNlc3NhcnkgYXMgcGVyIHlvdXIgY29tbXVuaWNhdGlvbiB3aXRoIEFuZHJldykKPiA+
PiBjaGVja2luZyBhZ2FpbnN0IHplcm8gdmFsdWVzLiBTdWNoIGFyZSBpbXBsZW1lbnRhdGlvbiBk
ZXRhaWxzIHdoaWNoCj4gPj4gd291bGQgYmV0dGVyIG5vdCBiZSBzY2F0dGVyIGFyb3VuZC4KPiA+
Cj4gPiBCdXQgeW91IGRvIHJlYWxpemUgdGhhdCBib3RoIG9mIHRoZXNlIGZ1bmN0aW9ucyBhcmUg
YWxyZWFkeSBleHBvc2VkCj4gPiB2aWEgaHlwZXJjYWxscz8gU28gaXQncyBPSyB0byBjYWxsIHRo
ZW0gZnJvbSB0aGUgdG9vbHN0YWNrIGJ1dCBub3QKPiA+IGZyb20gb3RoZXIgcGFydHMgb2YgWGVu
IGl0c2VsZj8gSSBkb24ndCBzZWUgbXVjaCByZWFzb24gdGhlcmUuCj4KPiBSaWdodCBub3cgd2Ug
aGF2ZSBleGFjdGx5IG9uZSBwYXRoIGVhY2ggYWxsb3dpbmcgdGhpcyBnZXQvc2V0LiBBZGRpbmcK
PiBhIDJuZCAoZnJvbSBvdXRzaWRlIG9mIGh2bS5jKSBvcGVucyB0aGUgZG9vciBmb3IgcG9zc2li
bGUgcmFjZXMKPiBiZXR3ZWVuIHRoZSB2YXJpb3VzIChmb3Igbm93IGp1c3QgdHdvKSBwb3NzaWJs
ZSBjYWxsIHNpdGVzLiBOb3RpY2luZwo+IGEgcG9zc2libGUgcHJvYmxlbSB3aGVuIGFkZGluZyBu
ZXcgY29kZSBpcyBpbW8gcXVpdGUgYSBiaXQgbW9yZQo+IGxpa2VseSBpZiBldmVyeXRoaW5nIGxp
dmVzIGNlbnRyYWxpemVkIGluIG9uZSBwbGFjZS4gSU9XICJleHBvc3VyZSIKPiBoZXJlIGlzbid0
IG1lYW50IHNvIG11Y2ggaW4gdGhlIHNlbnNlIG9mIHdoYXQgZW50aXR5IGluIHRoZSBzeXN0ZW0K
PiBnZXRzIHRvIGRyaXZlIHRoZSBkYXRhLCBidXQgd2hpY2ggZW50aXRpZXMgd2l0aGluIFhlbiBt
YXkgcGxheSB3aXRoCj4gaXQuCgpTdXJlLCBJJ2xsIG1vdmUgdGhlIGxvb3AgdG8gaHZtLmMgdGhl
bi4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
