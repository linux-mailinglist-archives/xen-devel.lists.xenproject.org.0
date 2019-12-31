Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ACF12DA2C
	for <lists+xen-devel@lfdr.de>; Tue, 31 Dec 2019 17:12:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1imK5H-0001Zj-Fw; Tue, 31 Dec 2019 16:09:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Skpz=2V=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1imK5G-0001Ze-0i
 for xen-devel@lists.xenproject.org; Tue, 31 Dec 2019 16:09:26 +0000
X-Inumbo-ID: e96f1b32-2be7-11ea-a14f-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e96f1b32-2be7-11ea-a14f-12813bfff9fa;
 Tue, 31 Dec 2019 16:09:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1577808565; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=BXKyTB9uogNlAfmOpgYBz+eeEX+SkKO0XOPsrVB0dLY=;
 b=Hs9OkcNB/QLcgQsh2gtbKlGG3F7rEYn6P1uz8d4UREVjMW6GkjfYP1fp7gGS5ECnWaSeow3/
 FSnXdjFksCJGRYZqypO3Q5Fel6++mYGfkoO6eyympZWFJzlHsDcfnJVi61tbvT3k60X1csK2
 gRhgyQsqqhJry3I8B3lb0Fn8kHA=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5e0b72b2.7f9ba5496d70-smtp-out-n03;
 Tue, 31 Dec 2019 16:09:22 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t2so35515430wrr.1
 for <xen-devel@lists.xenproject.org>; Tue, 31 Dec 2019 08:09:21 -0800 (PST)
X-Gm-Message-State: APjAAAVi2tVTT7qzvHziyHYFKeorX21oFqhvKIALnBHM8ABYDaYUPy8w
 p8pZXBaKJltX1DHUn+Xw7q6g2iMdAXb8lv181r4=
X-Google-Smtp-Source: APXvYqzLMP+Zva5usaIA1A+TyTE1UTS0GCFDfKOPAVh/USLtXehmnmcne3Bx+I4wnFzyW7n0gQ6u40ICs3toCSKIjTo=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr71476962wru.353.1577808560243; 
 Tue, 31 Dec 2019 08:09:20 -0800 (PST)
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
In-Reply-To: <20191231151107.GJ11756@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 31 Dec 2019 09:08:43 -0700
X-Gmail-Original-Message-ID: <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
Message-ID: <CABfawhnqGE6OSAPxFP56-fOXDVMcb+fWN6GpjT-1EcSi29xYDQ@mail.gmail.com>
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

T24gVHVlLCBEZWMgMzEsIDIwMTkgYXQgODoxMSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIERlYyAzMSwgMjAxOSBhdCAwODowMDox
N0FNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBUdWUsIERlYyAzMSwgMjAx
OSBhdCAzOjQwIEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBEZWMgMzAsIDIwMTkgYXQgMDU6Mzc6MzhQTSAtMDcwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDU6
MjAgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAZ21haWwuY29tPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBIaSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBNb24sIDMwIERlYyAyMDE5
LCAyMDo0OSBUYW1hcyBLIExlbmd5ZWwsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90ZToKPiA+
ID4gPiA+Pgo+ID4gPiA+ID4+IE9uIE1vbiwgRGVjIDMwLCAyMDE5IGF0IDExOjQzIEFNIEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdyb3RlOgo+ID4gPiA+ID4+IEJ1dCBrZWVwIGluIG1p
bmQgdGhhdCB0aGUgImZvcmstdm0iIGNvbW1hbmQgZXZlbiB3aXRoIHRoaXMgdXBkYXRlCj4gPiA+
ID4gPj4gd291bGQgc3RpbGwgbm90IHByb2R1Y2UgZm9yIHlvdSBhICJmdWxseSBmdW5jdGlvbmFs
IiBWTSBvbiBpdHMgb3duLgo+ID4gPiA+ID4+IFRoZSB1c2VyIHN0aWxsIGhhcyB0byBwcm9kdWNl
IGEgbmV3IFZNIGNvbmZpZyBmaWxlLCBjcmVhdGUgdGhlIG5ldwo+ID4gPiA+ID4+IGRpc2ssIHNh
dmUgdGhlIFFFTVUgc3RhdGUsIGV0Yy4KPiA+ID4KPiA+ID4gSU1PIHRoZSBkZWZhdWx0IGJlaGF2
aW9yIG9mIHRoZSBmb3JrIGNvbW1hbmQgc2hvdWxkIGJlIHRvIGxlYXZlIHRoZQo+ID4gPiBvcmln
aW5hbCBWTSBwYXVzZWQsIHNvIHRoYXQgeW91IGNhbiBjb250aW51ZSB1c2luZyB0aGUgc2FtZSBk
aXNrIGFuZAo+ID4gPiBuZXR3b3JrIGNvbmZpZyBpbiB0aGUgZm9yayBhbmQgeW91IHdvbid0IG5l
ZWQgdG8gcGFzcyBhIG5ldyBjb25maWcKPiA+ID4gZmlsZS4KPiA+ID4KPiA+ID4gQXMgSnVsaWVu
IGFscmVhZHkgc2FpZCwgbWF5YmUgSSB3YXNuJ3QgY2xlYXIgaW4gbXkgcHJldmlvdXMgcmVwbGll
czoKPiA+ID4gSSdtIG5vdCBhc2tpbmcgeW91IHRvIGltcGxlbWVudCBhbGwgdGhpcywgaXQncyBm
aW5lIGlmIHRoZQo+ID4gPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgZm9yay12bSB4bCBjb21tYW5k
IHJlcXVpcmVzIHlvdSB0byBwYXNzIGNlcnRhaW4KPiA+ID4gb3B0aW9ucywgYW5kIHRoYXQgdGhl
IGRlZmF1bHQgYmVoYXZpb3IgaXMgbm90IGltcGxlbWVudGVkLgo+ID4gPgo+ID4gPiBXZSBuZWVk
IGFuIGludGVyZmFjZSB0aGF0J3Mgc2FuZSwgYW5kIHRoYXQncyBkZXNpZ25lZCB0byBiZSBlYXN5
IGFuZAo+ID4gPiBjb21wcmVoZW5zaXZlIHRvIHVzZSwgbm90IGFuIGludGVyZmFjZSBidWlsdCBh
cm91bmQgd2hhdCdzIGN1cnJlbnRseQo+ID4gPiBpbXBsZW1lbnRlZC4KPiA+Cj4gPiBPSywgc28g
SSB0aGluayB0aGF0IHdvdWxkIGxvb2sgbGlrZSAieGwgZm9yay12bSA8cGFyZW50X2RvbWlkPiIg
d2l0aAo+ID4gYWRkaXRpb25hbCBvcHRpb25zIGZvciB0aGluZ3MgbGlrZSBuYW1lLCBkaXNrLCB2
bGFuLCBvciBhIGNvbXBsZXRlbHkKPiA+IG5ldyBjb25maWcsIGFsbCBvZiB3aGljaCBhcmUgY3Vy
cmVudGx5IG5vdCBpbXBsZW1lbnRlZCwgKyBhbgo+ID4gYWRkaXRpb25hbCBvcHRpb24gdG8gbm90
IGxhdW5jaCBRRU1VIGF0IGFsbCwgd2hpY2ggd291bGQgYmUgdGhlIG9ubHkKPiA+IG9uZSBjdXJy
ZW50bHkgd29ya2luZy4gQWxzbyBrZWVwaW5nIHRoZSBzZXBhcmF0ZSAieGwgZm9yay1sYXVuY2gt
ZG0iCj4gPiBhcyBpcy4gSXMgdGhhdCB3aGF0IHdlIGFyZSB0YWxraW5nIGFib3V0Pwo+Cj4gSSB0
aGluayBmb3JrLWxhdW5jaC12bSBzaG91bGQganVzdCBiZSBhbiBvcHRpb24gb2YgZm9yay12bSAo
aWU6Cj4gLS1sYXVuY2gtZG0tb25seSBvciBzb21lIHN1Y2gpLiBJIGRvbid0IHRoaW5rIHRoZXJl
J3MgYSByZWFzb24gdG8gaGF2ZQo+IGEgc2VwYXJhdGUgdG9wLWxldmVsIGNvbW1hbmQgdG8ganVz
dCBsYXVuY2ggdGhlIGRldmljZSBtb2RlbC4KCkl0J3MganVzdCB0aGF0IHRoZSBmb3JrLWxhdW5j
aC1kbSBuZWVkcyB0aGUgZG9taWQgb2YgdGhlIGZvcmssIHdoaWxlCnRoZSBmb3JrLXZtIG5lZWRz
IHRoZSBwYXJlbnQncyBkb21pZC4gQnV0IEkgZ3Vlc3Mgd2UgY2FuIGludGVycHJldCB0aGUKImRv
bWlkIiByZXF1aXJlZCBpbnB1dCBkaWZmZXJlbnRseSBkZXBlbmRpbmcgb24gd2hpY2ggc3ViLW9w
dGlvbiBpcwpzcGVjaWZpZWQgZm9yIHRoZSBjb21tYW5kLiBMZXQncyBzZWUgaG93IGl0IHBhbnMg
b3V0LgoKVGhhbmtzLApUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
