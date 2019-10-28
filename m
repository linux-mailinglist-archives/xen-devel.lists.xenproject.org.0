Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D6E7370
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 15:11:17 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP5ff-0001vo-75; Mon, 28 Oct 2019 14:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZIpA=YV=gmail.com=al1img@srs-us1.protection.inumbo.net>)
 id 1iP5fd-0001vh-3E
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 14:06:57 +0000
X-Inumbo-ID: 332169a8-f98c-11e9-a531-bc764e2007e4
Received: from mail-il1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 332169a8-f98c-11e9-a531-bc764e2007e4;
 Mon, 28 Oct 2019 14:06:56 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id t5so8270836ilh.10
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2019 07:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=f7XfFkJIdjgZXjSB/NnBIHuxHaQv8nwhQkH7/JwOtZE=;
 b=suKk3MDTPsg7YQ5sMBiXg7V333eVZ52d/QgetO1LfGEVijeuh6lUha13xfE4DdzRkN
 miW7ZmFHrGqA/dQwEYtWUjuFs5wdMEa8uo76Ruh9Q8OJ1seZf3pb+eYMXIKOrjOqHf5k
 tWhGY9rV86ZtsNB6ieoX2H6NbIH4On1pxGAMBHtVEb03ywrycAdEMtvXZoTyBa6ndbRB
 p1RWBTkmv1Akc55ef9DZOPzapVitCOmivPfBc0oixercX2maQ3jU1CsUDOUJvOKSEL4N
 u3qtg+bWWw76vqvkgGEGistuhwBjL/bDpVC97Mp/Da1Tm0Jq+x9jsn9OrrlZ2J3HUdz7
 fdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f7XfFkJIdjgZXjSB/NnBIHuxHaQv8nwhQkH7/JwOtZE=;
 b=ufP4ySlrYCWeUrq+iX6n7ap4HiQ2Ar0+doQ977vOu5QUIYsXYbJjjlmOO0pyagRAXj
 rvqRd29vS7LB7DPN77bq6c0MQAdOes3DXy3CR6xxwly+zrDpViHHANj6NjR4CdCayvsJ
 Vj95EuissC/ymmz//N6miDSb0e8ZZtbNin6tTFiQYiG0815hJNDzc4+0sKxJIr6yIxF9
 wqCx22psw2/93nVKjEzDf3Aai6E+/ldvgpq83xt6EiUV8oi5NiPv19lwswy1/0zba611
 UpDA2nruTgjoySLwJ8BxBnOqoTVVmrv75HdN2gdXCLXexN98GB2r2qTuFTkUYMJpLhBH
 5wWw==
X-Gm-Message-State: APjAAAXO1+XOGfjtGosfdp4QAHaq05taSrfoK27Zzg97ge2cfCC45OQv
 TrQanClB/tUlK2i/PzVvDY6oQF22JIDZoDl38Ng=
X-Google-Smtp-Source: APXvYqwtQ61cJmULkc/4xowMczo5wNhKULLi0C8Ag0TtypXs66bAFSLPD5mUkCZudLJKI9LdjD/1hK/0Qne0aEioygA=
X-Received: by 2002:a92:46c7:: with SMTP id d68mr21808667ilk.133.1572271615474; 
 Mon, 28 Oct 2019 07:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191008141024.10885-1-al1img@gmail.com>
 <20191008141024.10885-2-al1img@gmail.com>
 <23968.39034.34800.276030@mariner.uk.xensource.com>
 <CACvf2oV6iFM6x1bs8JPT28Eqny0gARh8MtSTedbgAP-m9CTP=w@mail.gmail.com>
 <23968.46591.386956.861918@mariner.uk.xensource.com>
 <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
In-Reply-To: <CACvf2oXrw9KdbYq__+Q7bSEPi7Gx8ZnjMTatQRj38Kw80-ywYA@mail.gmail.com>
From: Oleksandr Grytsov <al1img@gmail.com>
Date: Mon, 28 Oct 2019 16:06:44 +0200
Message-ID: <CACvf2oXGzmZquomG5xH=DsCuybFR7b=k8HoOA-tU2ZytoJJfPg@mail.gmail.com>
To: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [Xen-devel] [PATCH v1 1/2] libxl: introduce new backend type
 VINPUT
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>, "wl@xen.org" <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgNDoyNiBQTSBPbGVrc2FuZHIgR3J5dHNvdiA8YWwxaW1n
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCA4OjA0IFBNIElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+Cj4gPiBPbGVrc2Fu
ZHIgR3J5dHNvdiB3cml0ZXMgKCJSZTogW1BBVENIIHYxIDEvMl0gbGlieGw6IGludHJvZHVjZSBu
ZXcgYmFja2VuZCB0eXBlIFZJTlBVVCIpOgo+ID4gPiBPbiBGcmksIE9jdCAxMSwgMjAxOSBhdCA1
OjU4IFBNIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4g
PiBJIHRoaW5rIGl0IHdhcyBhNDhlMDBmMTRhMmQgImxpYnhsOiBhZGQgYmFja2VuZCB0eXBlIGFu
ZCBpZCB0byB2a2IiCj4gPiA+ID4gd2hpY2ggaW50cm9kdWNlZCB3aGF0IHlvdSBhcmUgY2FsbGlu
ZyAidXNlciBzcGFjZSIgYmFja2VuZHMuICBJdAo+ID4gPiA+IGFwcGVhcnMgdGhhdCB0aGUgdmti
IGJhY2tlbmQgdHlwZSBlbnVtIHdhcyBpbnRyb2R1Y2VkIHRoZXJlCj4gPiA+ID4gc3BlY2lmaWNh
bGx5IHRvIGRpc3Rpbmd1aXNoIGJldHdlZW4gdGhlc2UgdHdvIHNpdHVhdGlvbnMuICBGb3IgcmVh
c29ucwo+ID4gPiA+Cj4gPiA+ID4gQW0gSSB3cm9uZyA/ICBJZiBub3QsIHdoeSBpcyB0aGlzIG5v
dCB3b3JraW5nIG9yIG5vdCBzdWl0YWJsZSA/Cj4gPiA+Cj4gPiA+IFlvdSBhcmUgcmlnaHQuIEl0
IGlzIG5vdCB3b3JraW5nIGluIHNvbWUgY2FzZXMgZHVlIHRvIFFFTVVfQkFDS0VORCBtYWNyby4K
PiA+ID4gUUVNVV9CQUNLRU5EIHRyZWF0cyBib3RoIGJhY2tlbmRzIGFzIFFFTVUuIEFzIHJlc3Vs
dCB4bCBwZXJmb3JtcyBkZXZpY2UKPiA+ID4gaG90cGx1ZyBvbiBhZGQvcmVtb3ZlIGRldmljZS4g
V2hpY2ggaXMgbm90IGV4cGVjdGVkIGluIGNhc2UgInVzZXIKPiA+ID4gc3BhY2UiIGJhY2tlbmQu
Cj4gPgo+ID4gVGhlbiBwZXJoYXBzIHRoaXMgbWFjcm8gbmVlZHMgdG8gYmUgYWRqdXN0ZWQgb3Ig
Y2FsbGVkIG9ubHkKPiA+IGNvbmRpdGlvbmFsbHkgb3Igc29tZXRoaW5nID8KPgo+IEkgaGFkIGFu
IGlkZWEgdG8gbW92ZSB0aGlzIG1hY3JvIHRvIGxpYnhsX19kZXZpY2VfdHlwZSBhbmQgbGV0IGRl
dmljZQo+IGl0c2VsZiBkZWNpZGVzCj4gaWYgaXQgaXMgcWVtdSBiYWNrZW5kLiBCdXQgaW4gY2Fz
ZSBvZiBWS0JEIGl0IHdpbGwgcmVhZCBYUyB0byBkZXRlcm1pbmUgYmFja2VuZAo+IHR5cGUuIEkg
Z3Vlc3MgaXQgaXMgb2suCj4KPiA+Cj4gPiA+IEluIHRoaXMgcGF0Y2ggSSBwcm9wb3NlIHNvbHV0
aW9uIHNpbWlsYXIgdG8gVlVTQiBkZXZpY2UuIFdoZXJlIFZVU0IKPiA+ID4gdXNlZCBmb3IgZnJv
bnRlbmQgYW5kIGRlcGVuZHMgb24gYmFja2VuZCAoa2VybmVsIG9yIFFFTVUpIGVpdGhlcgo+ID4g
PiBWVVNCIG9yIFFVU0IgdXNlZCBmb3IgYmFja2VuZCBkZXZpY2UgdHlwZSBlLmcuIHVzZSBkaWZm
ZXJlbnQgYmFja2VuZAo+ID4gPiBkZXZpY2UgdHlwZSBmb3IgZGlmZmVyZW50IGJhY2tlbmRzLgo+
ID4KPiA+IEkgY29uZmVzcyBJIGRvbid0IHF1aXRlIGZvbGxvdyBhbGwgdGhlIFZVU0Igc3R1ZmYg
YnV0IEkgZG9uJ3QgdGhpbmsgaXQKPiA+IGlzIG5lY2Vzc2FyaWx5IGEgZ29vZCBtb2RlbC4KPgo+
IElmIHlvdSBkb24ndCBtaW5kIHRvIG1vdmUgUUVNVV9CQUNLRU5EIG1hY3J0byB0byBsaWJ4bF9f
ZGV2aWNlX3R5cGUgdGhlbgo+IG5vIG5lZWQgdG8gYWRkIG5ldyBkZXZpY2UgdHlwZSBhdCBhbGwu
Cj4KPiA+Cj4gPiA+IEludHJvZHVjaW5nIG5ldyBiYWNrZW5kIGRldmljZSB0eXBlIGZvciBWS0JE
IGFsc28gYWxsb3dzIHRvIGhhdmUKPiA+ID4gYm90aCBiYWNrZW5kcyAoUUVNVSBhbmQgbm9uIFFF
TVUpIHJ1biBpbiBzYW1lIGRvbWFpbi4gTm90IHN1cmUgaWYgaXQKPiA+ID4gaXMgdXNlZnVsIHNj
ZW5hcmlvIGJ1dCB3aXRoIHRoaXMgcHJvcG9zYWwgaXQgaXMgcG9zc2libGUgZnJvbQo+ID4gPiB0
ZWNobmljYWwgcG9pbnQgb2Ygdmlldy4KPiA+Cj4gPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRo
aXMgaXMgbm90IHBvc3NpYmxlIHNpbXBseSBieSBoYXZpbmcgYQo+ID4gZGlmZmVyZW50IGJhY2tl
bmQgdHlwZS4KPiA+Cj4gPiA+ID4gSSBhbHNvIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZSAidXNl
ciBzcGFjZSIga2JkIGJhY2tlbmQgc2VlbXMgdG8gYmUKPiA+ID4gPiAibGludXgiIGluIHRoZSBl
bnVtLgo+ID4gPgo+ID4gPiBJIGFncmVlIHRoaXMgaXMgbm90IHNvIGdvb2QgbmFtZS4gQnV0IEkg
ZG9uJ3Qga25vdyBob3cgdG8gY2FsbAo+ID4gPiBiYWNrZW5kcyB3aGljaCBhcmUgbm90IHJ1bm5p
bmcKPiA+ID4gaW5zaWRlIFFFTVUgaW4gZ2VuZXJhbC4KPiA+Cj4gPiBJIHRoaW5rIHRoaXMgd291
bGQgYmUgdXNlYWJsZSBvbiBmcmVlYnNkID8gICJsaW51eCIgZGVmaW5pdGVseSBzZWVtcwo+ID4g
d3JvbmcuICBJIHNlZSBpdCBoYXNuJ3QgYmVlbiBpbiBhIHJlbGVhc2Ugc28gaXQgaXMgbm90IHRv
byBsYXRlIHRvCj4gPiByZW5hbWUgaXQsIHN1YmplY3QgdG8gZGlzY3Vzc2lvbiB3aXRoIEp1ZXJn
ZW4gYXMgUk0uCj4gPgo+ID4gPiA+IFdoZXJlIGlzIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0aGlz
IHVzZXIgc3BhY2UKPiA+ID4gPiBiYWNrZW5kID8KPiA+ID4KPiA+ID4gV2UgaGF2ZSBleHRlbmRl
ZCBrYmQgaW50ZXJmYWNlIChrYmRpZi5oKSB0byBzdXBwb3J0IG11bHRpLXRvdWNoIGV2ZW50cwo+
ID4gPiBhcyB3ZWxsLiBBbmQgd2UgaGF2ZQo+ID4gPiBpbXBsZW1lbnRlZCBvd24ga2JkIGJhY2tl
bmQgaHR0cHM6Ly9naXRodWIuY29tL3hlbi10cm9vcHMvZGlzcGxfYmUvCj4gPiA+IEl0IGlzIGlu
dGVncmF0ZWQgd2l0aCBkaXNwbGF5IGJhY2tlbmQgYXMgYm90aCB1c2Ugd2F5bGFuZCBBUEkuCj4g
Pgo+ID4gR3JlYXQuCj4gPgo+ID4gPiA+IElzIGl0IGJlIGNvbnRyb2xsZWQgZW50aXJlbHkgdGhy
b3VnaCB4ZW5zdG9yZSA/Cj4gPiA+Cj4gPiA+IFllcyBpdCBpcyBjb250cm9sbGVkIGVudGlyZWx5
IHRocm91Z2ggeGVuc3RvcmU6IGxpYiB4bCBjcmVhdGVzCj4gPiA+IGZyb250ZW5kL2JhY2tlbmQg
ZW50cmllcyB3aXRoCj4gPiA+IGluaXRpYWwgc3RhdGVzIGFuZCBjb25maWd1cmF0aW9uLgo+ID4K
PiA+IEFuZCB5b3VyIGRpc3BsYXkgYmFja2VuZCBpbiAidHJvb3BzIiAoaXMgdGhhdCB0aGUgbmFt
ZSBvZiB5b3VyCj4gPiBwcm9qZWN0KSBjaGVja3Mgd2hldGhlciB0aGUgYmFja2VuZCB0eXBlIGlz
IHNldCB0byAibGludXgiLCBzbyB0aGF0IGl0Cj4gPiBrbm93cyB0byBpZ25vcmUgb25lcyB0aGF0
IHNheSAicWVtdSIgPwo+ID4KPiA+IE1heWJlICJsaW51eCIgc2hvdWxkIGJlICJ0cm9vcHMiLi4u
Cj4gPgo+Cj4gSXQgZG9lc24ndCBsb29rIGFzIGdlbmVyaWMgc29sdXRpb24uIElmIHNvbWUgdXNl
ciBpbXBsZW1lbnRzIG93biBiYWNrZW5kCj4gaXQgc2hvdWxkIGFkZCBuZXcgZW50cnkgaW50byBi
YWNrZW5kIHR5cGUgZW51bS4KPiBXaGF0IGFib3V0IHRvIGhhdmUganVzdCBzdHJpbmcgdmFsdWUg
aW5zdGVhZCBvZiBlbnVtPyBJbiBjYXNlIFFFTVUKPiB3ZSBkb24ndCBoYXZlIHN1Y2ggZW50cnkg
YXQgYWxsIGJ1dCBpbiBjYXNlIGN1c3RvbSBiYWNrZW5kIHRoZSB1c2VyCj4gY2FuJ3QgcHV0IGFu
eSBzdHJpbmcgdmFsdWUgaGVyZSB0byBiZSByZWNvZ25pemVkIGJ5IGhpcyBiYWNrZW5kLgo+Cj4g
PiBJYW4uCgpwaW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
