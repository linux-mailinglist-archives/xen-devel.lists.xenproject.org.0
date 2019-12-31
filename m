Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C78212DA5C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 17:39:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imKVr-0003zt-BQ; Tue, 31 Dec 2019 16:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Skpz=2V=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1imKVp-0003zo-OW
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 16:36:53 +0000
X-Inumbo-ID: ba2277ee-2beb-11ea-88e7-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba2277ee-2beb-11ea-88e7-bc764e2007e4;
 Tue, 31 Dec 2019 16:36:43 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577810205; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=GeyE4rRE5iR3dv36+MmgtMw1KK+AxOtyqHxoO+teerQ=;
 b=kSSdDhuEPNf5yFS1uWnFumo1OcaOj9E5DpDFYKM1UxCO38q+EB/EDN7TvFUu4IEnVD+mZonR
 RD9eNDiUt1rls09oq5bA3b0Cvas+GjCXTPBuD3BShILbp9sQrbiRaE0BqALk6pAW6LXuxeB6
 zYcYndlzSz8rKZ0IxAklDmuyoNg=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mxa.mailgun.org with ESMTP id 5e0b7918.7f08bdd8cef0-smtp-out-n02;
 Tue, 31 Dec 2019 16:36:40 -0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id g17so35538685wro.2
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 08:36:39 -0800 (PST)
X-Gm-Message-State: APjAAAW9vC/uaNmAwvHUecWablr+VcU+ml0vASm4uNYCeVGemriQR8iP
 UCU8g5cSWw5nQJnB4CfMG4MOJhwi1lE0sYuJNu0=
X-Google-Smtp-Source: APXvYqx1CoA9dTzKdMtsMP/PBXEg/NuovJB2Q1itnszVquU2JHSe7grX8qXhMOzI3RtgJTUTMEsBJAAsJCASs5w8dCM=
X-Received: by 2002:adf:f586:: with SMTP id f6mr70458673wro.46.1577810198415; 
 Tue, 31 Dec 2019 08:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20191219094814.GB11756@Air-de-Roger>
 <CABfawhnVZmYOZb=wuc2TVDewH9nNtJBTBvJYUk-RDHLCGRVzPw@mail.gmail.com>
 <20191230175900.GF11756@Air-de-Roger>
 <CABfawhkiB=6zvTo6TBCE6y_-to65DFGDVRcqk7ANpSGdwwveFQ@mail.gmail.com>
 <3ff918fc-02a3-1413-4135-a378d65a19ab@xen.org>
 <CABfawh=Wvn16sWp8_MPy0kGAp-OhkCmug4nY272igyg+u4PKBw@mail.gmail.com>
 <CAF3u54B2+3q90jFftH+ZcuhdH6i8cOEpjiOjrVdNJCiBSzBtng@mail.gmail.com>
 <CABfawh=F8dsn4LLtdfYR4nb0djaswofEioDtqi2TKVJ0zCBK0Q@mail.gmail.com>
 <20191231104022.GG11756@Air-de-Roger>
 <CABfawh=tDFzsp61MmFxpmcBbNT2GXa4C=-eXD=044L1gdxPEpw@mail.gmail.com>
 <20191231151107.GJ11756@Air-de-Roger>
 <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
In-Reply-To: <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 31 Dec 2019 09:36:01 -0700
X-Gmail-Original-Message-ID: <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
Message-ID: <CABfawhkHK3FYuGTwm6A4Ni+_a6wdqHwDxbDYqofcNyS_kQT-Yw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 00/20] VM forking
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@gmail.com>,
 Alexandru Isaila <aisaila@bitdefender.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgOTowOCBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgODoxMSBBTSBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24g
VHVlLCBEZWMgMzEsIDIwMTkgYXQgMDg6MDA6MTdBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gPiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCAzOjQwIEFNIFJvZ2VyIFBhdSBNb25u
w6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIE1vbiwg
RGVjIDMwLCAyMDE5IGF0IDA1OjM3OjM4UE0gLTA3MDAsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToK
PiA+ID4gPiA+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDU6MjAgUE0gSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gSGks
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIE1vbiwgMzAgRGVjIDIwMTksIDIwOjQ5IFRhbWFz
IEsgTGVuZ3llbCwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPj4KPiA+
ID4gPiA+ID4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDExOjQzIEFNIEp1bGllbiBHcmFsbCA8
anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gPj4gQnV0IGtlZXAgaW4gbWluZCB0aGF0
IHRoZSAiZm9yay12bSIgY29tbWFuZCBldmVuIHdpdGggdGhpcyB1cGRhdGUKPiA+ID4gPiA+ID4+
IHdvdWxkIHN0aWxsIG5vdCBwcm9kdWNlIGZvciB5b3UgYSAiZnVsbHkgZnVuY3Rpb25hbCIgVk0g
b24gaXRzIG93bi4KPiA+ID4gPiA+ID4+IFRoZSB1c2VyIHN0aWxsIGhhcyB0byBwcm9kdWNlIGEg
bmV3IFZNIGNvbmZpZyBmaWxlLCBjcmVhdGUgdGhlIG5ldwo+ID4gPiA+ID4gPj4gZGlzaywgc2F2
ZSB0aGUgUUVNVSBzdGF0ZSwgZXRjLgo+ID4gPiA+Cj4gPiA+ID4gSU1PIHRoZSBkZWZhdWx0IGJl
aGF2aW9yIG9mIHRoZSBmb3JrIGNvbW1hbmQgc2hvdWxkIGJlIHRvIGxlYXZlIHRoZQo+ID4gPiA+
IG9yaWdpbmFsIFZNIHBhdXNlZCwgc28gdGhhdCB5b3UgY2FuIGNvbnRpbnVlIHVzaW5nIHRoZSBz
YW1lIGRpc2sgYW5kCj4gPiA+ID4gbmV0d29yayBjb25maWcgaW4gdGhlIGZvcmsgYW5kIHlvdSB3
b24ndCBuZWVkIHRvIHBhc3MgYSBuZXcgY29uZmlnCj4gPiA+ID4gZmlsZS4KPiA+ID4gPgo+ID4g
PiA+IEFzIEp1bGllbiBhbHJlYWR5IHNhaWQsIG1heWJlIEkgd2Fzbid0IGNsZWFyIGluIG15IHBy
ZXZpb3VzIHJlcGxpZXM6Cj4gPiA+ID4gSSdtIG5vdCBhc2tpbmcgeW91IHRvIGltcGxlbWVudCBh
bGwgdGhpcywgaXQncyBmaW5lIGlmIHRoZQo+ID4gPiA+IGltcGxlbWVudGF0aW9uIG9mIHRoZSBm
b3JrLXZtIHhsIGNvbW1hbmQgcmVxdWlyZXMgeW91IHRvIHBhc3MgY2VydGFpbgo+ID4gPiA+IG9w
dGlvbnMsIGFuZCB0aGF0IHRoZSBkZWZhdWx0IGJlaGF2aW9yIGlzIG5vdCBpbXBsZW1lbnRlZC4K
PiA+ID4gPgo+ID4gPiA+IFdlIG5lZWQgYW4gaW50ZXJmYWNlIHRoYXQncyBzYW5lLCBhbmQgdGhh
dCdzIGRlc2lnbmVkIHRvIGJlIGVhc3kgYW5kCj4gPiA+ID4gY29tcHJlaGVuc2l2ZSB0byB1c2Us
IG5vdCBhbiBpbnRlcmZhY2UgYnVpbHQgYXJvdW5kIHdoYXQncyBjdXJyZW50bHkKPiA+ID4gPiBp
bXBsZW1lbnRlZC4KPiA+ID4KPiA+ID4gT0ssIHNvIEkgdGhpbmsgdGhhdCB3b3VsZCBsb29rIGxp
a2UgInhsIGZvcmstdm0gPHBhcmVudF9kb21pZD4iIHdpdGgKPiA+ID4gYWRkaXRpb25hbCBvcHRp
b25zIGZvciB0aGluZ3MgbGlrZSBuYW1lLCBkaXNrLCB2bGFuLCBvciBhIGNvbXBsZXRlbHkKPiA+
ID4gbmV3IGNvbmZpZywgYWxsIG9mIHdoaWNoIGFyZSBjdXJyZW50bHkgbm90IGltcGxlbWVudGVk
LCArIGFuCj4gPiA+IGFkZGl0aW9uYWwgb3B0aW9uIHRvIG5vdCBsYXVuY2ggUUVNVSBhdCBhbGws
IHdoaWNoIHdvdWxkIGJlIHRoZSBvbmx5Cj4gPiA+IG9uZSBjdXJyZW50bHkgd29ya2luZy4gQWxz
byBrZWVwaW5nIHRoZSBzZXBhcmF0ZSAieGwgZm9yay1sYXVuY2gtZG0iCj4gPiA+IGFzIGlzLiBJ
cyB0aGF0IHdoYXQgd2UgYXJlIHRhbGtpbmcgYWJvdXQ/Cj4gPgo+ID4gSSB0aGluayBmb3JrLWxh
dW5jaC12bSBzaG91bGQganVzdCBiZSBhbiBvcHRpb24gb2YgZm9yay12bSAoaWU6Cj4gPiAtLWxh
dW5jaC1kbS1vbmx5IG9yIHNvbWUgc3VjaCkuIEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhIHJlYXNv
biB0byBoYXZlCj4gPiBhIHNlcGFyYXRlIHRvcC1sZXZlbCBjb21tYW5kIHRvIGp1c3QgbGF1bmNo
IHRoZSBkZXZpY2UgbW9kZWwuCj4KPiBJdCdzIGp1c3QgdGhhdCB0aGUgZm9yay1sYXVuY2gtZG0g
bmVlZHMgdGhlIGRvbWlkIG9mIHRoZSBmb3JrLCB3aGlsZQo+IHRoZSBmb3JrLXZtIG5lZWRzIHRo
ZSBwYXJlbnQncyBkb21pZC4gQnV0IEkgZ3Vlc3Mgd2UgY2FuIGludGVycHJldCB0aGUKPiAiZG9t
aWQiIHJlcXVpcmVkIGlucHV0IGRpZmZlcmVudGx5IGRlcGVuZGluZyBvbiB3aGljaCBzdWItb3B0
aW9uIGlzCj4gc3BlY2lmaWVkIGZvciB0aGUgY29tbWFuZC4gTGV0J3Mgc2VlIGhvdyBpdCBwYW5z
IG91dC4KCkhvdyBkb2VzIHRoZSBmb2xsb3dpbmcgbG9vayBmb3IgdGhlIGludGVyZmFjZT8KCiAg
ICB7ICJmb3JrLXZtIiwKICAgICAgJm1haW5fZm9ya192bSwgMCwgMSwKICAgICAgIkZvcmsgYSBk
b21haW4gZnJvbSB0aGUgcnVubmluZyBwYXJlbnQgZG9taWQiLAogICAgICAiW29wdGlvbnNdIDxE
b21pZD4iLAogICAgICAiLWggICAgICAgICAgICAgICAgICAgICAgICAgICBQcmludCB0aGlzIGhl
bHAuXG4iCiAgICAgICItTiA8bmFtZT4gICAgICAgICAgICAgICAgICAgIEFzc2lnbiBuYW1lIHRv
IFZNIGZvcmsuXG4iCiAgICAgICItRCA8ZGlzaz4gICAgICAgICAgICAgICAgICAgIEFzc2lnbiBk
aXNrIHRvIFZNIGZvcmsuXG4iCiAgICAgICItQiA8YnJpZGdlICAgICAgICAgICAgICAgICAgIEFz
c2lnbiBicmlkZ2UgdG8gVk0gZm9yay5cbiIKICAgICAgIi1WIDx2bGFuPiAgICAgICAgICAgICAg
ICAgICAgQXNzaWduIHZsYW4gdG8gVk0gZm9yay5cbiIKICAgICAgIi1DIDxjb25maWc+ICAgICAg
ICAgICAgICAgICAgVXNlIGNvbmZpZyBmaWxlIGZvciBWTSBmb3JrLlxuIgogICAgICAiLVEgPHFl
bXUtc2F2ZS1maWxlPiAgICAgICAgICBVc2UgcWVtdSBzYXZlIGZpbGUgZm9yIFZNIGZvcmsuXG4i
CiAgICAgICItLWxhdW5jaC1kbSAgPHllc3xub3xsYXRlPiAgIExhdW5jaCBkZXZpY2UgbW9kZWwg
KFFFTVUpIGZvciBWTSBmb3JrLlxuIgogICAgICAiLS1mb3JrLXJlc2V0ICAgICAgICAgICAgICAg
ICBSZXNldCBWTSBmb3JrLlxuIgogICAgICAiLXAgICAgICAgICAgICAgICAgICAgICAgICAgICBE
byBub3QgdW5wYXVzZSBWTXMgYWZ0ZXIgZm9yay4iCiAgICAgICItaCAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFByaW50IHRoaXMgaGVscC5cbiIKICAgICAgIi1kICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRW5hYmxlIGRlYnVnIG1lc3NhZ2VzLlxuIgogICAgfSwKCkN1cnJlbnRseSB0aGUg
cGFydHMgdGhhdCBhcmUgaW1wbGVtZW50ZWQgd291bGQgbG9vayBsaWtlOgp4bCBmb3JrLXZtIC1w
IC0tbGF1bmNoLWRtIG5vIDxwYXJlbnRfZG9taWQ+CnhsIGZvcmstdm0gLXAgLS1sYXVuY2gtZG0g
bGF0ZSAtQyA8Y29uZmlnPiAtUSA8cWVtdS1zYXZlLWZpbGU+IDxmb3JrX2RvbWlkPgp4bCBmb3Jr
LXZtIC1wIC0tZm9yay1yZXNldCA8Zm9ya19kb21pZD4KClRhbWFzCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
