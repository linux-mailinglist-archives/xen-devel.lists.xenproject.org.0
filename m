Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5650C8E67
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 18:32:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFhWN-0003iC-T5; Wed, 02 Oct 2019 16:30:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WSC0=X3=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iFhWM-0003i1-9Q
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 16:30:34 +0000
X-Inumbo-ID: ea096108-e531-11e9-97fb-bc764e2007e4
Received: from mail-io1-xd41.google.com (unknown [2607:f8b0:4864:20::d41])
 by localhost (Halon) with ESMTPS
 id ea096108-e531-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 16:30:15 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id b136so58338954iof.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Oct 2019 09:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DcGxwLvSa3+Q7cuSOC7nIDJ5f0WyeDEVoiYKyJDFbRM=;
 b=SpAkknkUbtI+AqspOq66QOboPfwYHFvg2StnQ8bVfgaRBVLm7q7n5hdwfnpxrheeEI
 GGA0aMgMd4sn4F3PSsJ6a8re8vHc8RnlbWTmC0g/sX2fT+nHSNHZUt2xwdEVICBe0xjy
 FkWPa1itnrYm42y9GFKSANasTWLlaIIJbLU5AZPHe2yKQv0UoGyYTy6NC3RcNcLo/gwQ
 gg9xJ2fu/yWUS3OWoibONoeo2ReJGn6W6gtI6j/Pz5p9l0itNfcJF4zTfauf60yQjAKt
 2Y6uXzp7VYEzMDYkO0IDLf3nhFzsY47DsoLx9NQDHXHlvM360uC6GOyhPvPTW2Nmfa8I
 7odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DcGxwLvSa3+Q7cuSOC7nIDJ5f0WyeDEVoiYKyJDFbRM=;
 b=NbFf0S46bSFi7Aupc5OzG26n52XcVweQ+LUpvOtuLsTaxiEgOkckhR7Fy8wm6Q1kdL
 exjkUjNsMKTEDzbr8qeykPTEI4TsGp1690Pa0j3aUovCdrfYAwsujjL6kcz+w3SbzRl7
 L8Euzr9AV6zcvY2utKsRGPyYyhM1vicyn1ZIA9RD+tZ3Y4tkvV/Q9Tu3O79IC0d0kcYh
 XluEx7kEy5cstZXgR170u8Ju4SP0JnPlxdqi67TUAiqGBpxJUOCNEi1JVd+IgFSmo+Ka
 IyntLrkhbxH4kHWjAZSPib0dphUyAJwyNc8RzCupjq6IOlwEDkO75PXBcD2nH1epXZq1
 oS0Q==
X-Gm-Message-State: APjAAAWPw04uCbiCfNSncCy1qAoYjdYsyhCdARDV8rQ2DT5toLxtq2hF
 aAK1S9jmeKnncZYYIBbMBLtDYNIbKU4IIkCjlI4=
X-Google-Smtp-Source: APXvYqwXmVcKXLrwEo06jWUEQVXV2GtvJr3zoQ6I/bfqLMMasH1UxwxigAUs0gT6yVIhKoiJJIKqnvGPxCyLr5Ad+iU=
X-Received: by 2002:a92:398a:: with SMTP id h10mr5181381ilf.260.1570033815041; 
 Wed, 02 Oct 2019 09:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <1513260853-3450-1-git-send-email-al1img@gmail.com>
 <20180206123635.xqjoqsq4dfgve73d@citrix.com>
 <CACvf2oV9sJPJ9cK6HsstthSmpuh6SC-y058qmV6_=zExRRgd5A@mail.gmail.com>
 <20180213120658.bshetw3jommut5nj@citrix.com>
 <CACvf2oWkY6=tHqQ=pYHj6cH+g01FrSrr_iJbu1qPrrnmeXgJYw@mail.gmail.com>
 <20180223174448.3vmc7a74vr6b42lx@citrix.com>
 <CACvf2oXkN6xfNmveFT2hQCPdicrdTe1pedLmCXsOVsx8OLBW-A@mail.gmail.com>
In-Reply-To: <CACvf2oXkN6xfNmveFT2hQCPdicrdTe1pedLmCXsOVsx8OLBW-A@mail.gmail.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Wed, 2 Oct 2019 19:30:03 +0300
Message-ID: <CACvf2oWONobmgCxw7pTJzr_J_r6Q=QnQ-j+jQTUc4zuh7rN4mA@mail.gmail.com>
To: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [Xen-devel] [PATCH] libxl: add libxl__is_driver_domain function
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMjYsIDIwMTggYXQgMTI6MTQgUE0gT2xla3NhbmRyIEdyeXRzb3YgPGFsMWlt
Z0BnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgMjMsIDIwMTggYXQgNzo0NCBQTSwg
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFR1ZSwgRmViIDEz
LCAyMDE4IGF0IDAzOjMyOjA0UE0gKzAyMDAsIE9sZWtzYW5kciBHcnl0c292IHdyb3RlOgo+PiA+
IE9uIFR1ZSwgRmViIDEzLCAyMDE4IGF0IDI6MDYgUE0sIFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+IHdyb3RlOgo+PiA+Cj4+ID4gPiBPbiBUdWUsIEZlYiAwNiwgMjAxOCBhdCAwMzowODo0
NVBNICswMjAwLCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToKPj4gPiA+ID4gT24gVHVlLCBGZWIg
NiwgMjAxOCBhdCAyOjM2IFBNLCBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPiB3cm90ZToK
Pj4gPiA+ID4KPj4gPiA+ID4gPiBPbiBUaHUsIERlYyAxNCwgMjAxNyBhdCAwNDoxNDoxMlBNICsw
MjAwLCBPbGVrc2FuZHIgR3J5dHNvdiB3cm90ZToKPj4gPiA+ID4gPiA+IEZyb206IE9sZWtzYW5k
ciBHcnl0c292IDxvbGVrc2FuZHJfZ3J5dHNvdkBlcGFtLmNvbT4KPj4gPiA+ID4gPiA+Cj4+ID4g
PiA+ID4gPiBXZSBoYXZlIGZvbGxvd2luZyBhcm0tYmFzZWQgc2V0dXA6Cj4+ID4gPiA+ID4gPgo+
PiA+ID4gPiA+ID4gLSBEb20wIHdpdGggeGVuIGFuZCB4ZW4gdG9vbHM7Cj4+ID4gPiA+ID4gPiAt
IERvbTEgd2l0aCBkZXZpY2UgYmFja2VuZHMgKGJ1dCBpdCBpcyBub3QgdGhlIGRyaXZlciBkb21h
aW4pOwo+PiA+ID4gPiA+Cj4+ID4gPiA+ID4gV2hhdCBpcyB5b3VyIGRlZmluaXRpb24gb2YgYSAi
ZHJpdmVyIGRvbWFpbiI/IFdoYXQgZG9lcyBpdCBkbyBpbiB0aGlzCj4+ID4gPiA+ID4gY2FzZT8K
Pj4gPiA+ID4gPgo+PiA+ID4gPiA+IEkgc2VlbSB0byBoYXZlIHNlZW4gcGVvcGxlIHVzZSB0aGlz
IHRlcm0gaW4gZGlmZmVyZW50IGNvbnRleHRzIHRvIG1lYW4KPj4gPiA+ID4gPiBzbGlnaHRseSBk
aWZmZXJlbnQgdGhpbmdzLiBJIG5lZWQgdG8gZmlndXJlIG91dCB3aGF0IHlvdSBhY3R1YWxseSBt
ZWFuCj4+ID4gPiA+ID4gZmlyc3QuCj4+ID4gPiA+ID4KPj4gPiA+ID4gPgo+PiA+ID4gPiBJIHNl
ZSBpbiB0aGUgbGlieGwveGwgc291cmNlcyB0aGF0IGNsb3NpbmcgUFYgZGV2aWNlcyBpcyBkb25l
IGRpZmZlcmVudGx5Cj4+ID4gPiA+IGluIGNhc2UgYmFja2VuZHMgYXJlIGluIERvbTAgYW5kIGFy
ZSBpbiBvdGhlciBkb21haW4uIEl0IGlzIGNhbGxlZCBhcwo+PiA+ID4gPiBkcml2ZXIgZG9tYWlu
IGluIHRoZSBzb3VyY2VzLiBTbywgSSBkb24ndCBoYXZlIGNsZWFyIHVuZGVyc3RhbmRpbmcKPj4g
PiA+ID4gd2hhdCBkb2VzIGl0IG1lYW4uIEluIG91ciBzZXR1cCBiYWNrZW5kcyBhcmUgaW4gRG9t
MSBhbmQgeGwgaXMgaW4gRG9tMC4KPj4gPiA+ID4gQW5kIEkgc2VlIHRoYXQgeGwgZG9zbid0IGNs
b3NlIFBWIGRldmljZSBvbiBkb21haW4gcmVib290IG9yIHNodXRkb3duLgo+PiA+ID4KPj4gPiA+
IERvIHlvdSBydW4geGwgZGV2ZCBpbiB5b3VyIGJhY2tlbmQgZG9tYWluPwo+PiA+ID4KPj4gPiA+
IFdlaS4KPj4gPiA+Cj4+ID4KPj4gPiBObyBJIGRvbid0Cj4+Cj4+IENhbiB5b3UgdHJ5IHRoYXQ/
IEkgdGhpbmsgeGwgZGV2ZCBzaG91bGQgY2xlYW4gdXAgdGhlIHN0YWxlIGVudHJpZXMgLS0KPj4g
dGhhdCdzIGhvdyB3ZSBlbnZpc2FnZSBkcml2ZXIgZG9tYWlucyB0byBiZSB1c2VkLgo+Pgo+PiBX
ZWkuCj4KPgo+IFdlIHdpbGwgY2hlY2sgdGhpcy4gVGhhbmtzLgo+Cj4gLS0KPiBCZXN0IFJlZ2Fy
ZHMsCj4gT2xla3NhbmRyIEdyeXRzb3YuCgoKTGV0IG1lIHJlbmV3IHRoaXMgdG9waWMuCgp4bCBk
ZXZkIGNsZWFucyB1cCB0aGUgc3RhdGUgZW50cmllcyBvbmx5IGZvciBzcGVjaWZpYyBkZXZpY2Vz
OiBWQkQsIFZJRiwgUURJU0suCkkgd29uZGVyLCBzaGFsbCB4bCBkZXZkIHBlcmZvcm0gY2xlYW5p
bmcgZm9yIGFsbCBvdGhlciBiYWNrZW5kcyBpbgpkcml2ZXIgZG9tYWluIGFzIHdlbGw/CgoKLS0g
CkJlc3QgUmVnYXJkcywKT2xla3NhbmRyIEdyeXRzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
