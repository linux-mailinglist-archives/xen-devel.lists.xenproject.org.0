Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658ADBF54B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:52:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDV5X-0002bP-Qg; Thu, 26 Sep 2019 14:49:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9s5i=XV=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iDV5W-0002bK-45
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:49:46 +0000
X-Inumbo-ID: e0f31cb8-e06c-11e9-9657-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by localhost (Halon) with ESMTPS
 id e0f31cb8-e06c-11e9-9657-12813bfff9fa;
 Thu, 26 Sep 2019 14:49:44 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1569509385; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=gfd9nj7ivl1yG72moFpr3ngRd/XBdmSaFM5uoZ63OFE=;
 b=VJ7HVlbcYj7YPQLvRf0DNsEaIauQoavUj379ymOW0zVQOU47N92YInO3C/EJ+TdI82Q1EU+f
 BoKNNJvq6n6jhLpMg2PP0WdjLe7DmDWGIp3TmTWkhPa0LLc0beOZmo6c2C/GnKYHR+E1+gFe
 IH+nU85Wcd1ZhljuYsz9C8QQJB4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mxa.mailgun.org with ESMTP id 5d8cd005.7f5d9e2c4f70-smtp-out-n02;
 Thu, 26 Sep 2019 14:49:41 -0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id r3so3109108wrj.6
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 07:49:41 -0700 (PDT)
X-Gm-Message-State: APjAAAWOwIulDQGSbKMrxJyqZFbRwpovzUIKDnQuLIDciHTkZZwlGcEW
 ZShA7dFi3LmvVZPuiJ9cAHAk/6Sd16sScRRF77Q=
X-Google-Smtp-Source: APXvYqyfi7jdvcUTUs+kFMmSeI0GjdehpekZkgzsDOZU/QJx4aMkJr+Z3qkO2OuCksqEjXd3O8ArzRUYTXUG31MMOvI=
X-Received: by 2002:adf:f404:: with SMTP id g4mr3215494wro.353.1569509380100; 
 Thu, 26 Sep 2019 07:49:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1569425745.git.tamas.lengyel@intel.com>
 <e1fec257377046cf442842e27dff9bafc1f2bb27.1569425745.git.tamas.lengyel@intel.com>
 <2e648f3c-e5d3-c3eb-93d7-cde0a0058cb6@suse.com>
 <CABfawhmkT61ADXJkodO064-5aNFpUY4ZLSGPKmHVWhxxDay1Yw@mail.gmail.com>
 <6b1f5ed0-95e8-9aad-beb0-2399d667ba56@suse.com>
In-Reply-To: <6b1f5ed0-95e8-9aad-beb0-2399d667ba56@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 26 Sep 2019 08:49:05 -0600
X-Gmail-Original-Message-ID: <CABfawhnK-t7nLY2X+EZYf6mEW32ycNNF_N-BCo6hyc5B_zUckw@mail.gmail.com>
Message-ID: <CABfawhnK-t7nLY2X+EZYf6mEW32ycNNF_N-BCo6hyc5B_zUckw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [RFC PATCH for-next 04/18] x86/mem_sharing: cleanup
 code in various locations
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgODoyMCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gT24gMjYuMDkuMjAxOSAxNjowOSwgVGFtYXMgSyBMZW5neWVsIHdy
b3RlOgo+ID4gT24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTA6MTUgQU0gSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+PiBPbiAyNS4wOS4yMDE5IDE3OjQ4LCBUYW1hcyBL
IExlbmd5ZWwgd3JvdGU6Cj4gPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+Pj4g
KysrIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4+PiBAQCAtMTg3OSwxMiArMTg3OSwxMSBA
QCBpbnQgaHZtX2hhcF9uZXN0ZWRfcGFnZV9mYXVsdChwYWRkcl90IGdwYSwgdW5zaWduZWQgbG9u
ZyBnbGEsCj4gPj4+ICAgICAgaWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgKHAybXQgPT0gcDJt
X3JhbV9zaGFyZWQpICkKPiA+Pj4gICAgICB7Cj4gPj4+ICAgICAgICAgIEFTU0VSVChwMm1faXNf
aG9zdHAybShwMm0pKTsKPiA+Pj4gLSAgICAgICAgc2hhcmluZ19lbm9tZW0gPQo+ID4+PiAtICAg
ICAgICAgICAgKG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShjdXJyZCwgZ2ZuLCAwKSA8IDApOwo+
ID4+PiArICAgICAgICBzaGFyaW5nX2Vub21lbSA9IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShj
dXJyZCwgZ2ZuLCAwKTsKPiA+Pgo+ID4+IEkgZ3Vlc3MgdGhlIGltcGxpY2F0aW9uIGhlcmUgaXMg
dGhhdCB0aGUgZnVuY3Rpb24gY2FuIG9ubHkgcmV0dXJuCj4gPj4gLUVOT01FTT8gTm90IHZlcnkg
Zm9yd2FyZCBjb21wYXRpYmxlLCBidXQgd2VsbC4gSG93ZXZlciwgaWYgeW91Cj4gPj4gdG91Y2gg
dGhpcyBhbHJlYWR5LCBzaG91bGRuJ3QgeW91IGF0IGxlYXN0IG1ha2UgInNoYXJpbmdfZW5vbWVt
Igo+ID4+IGJvb2w/Cj4gPgo+ID4gQ29ycmVjdCwgdGhlcmUgaXMgYSBCVUdfT04gZm9yIGV2ZXJ5
IG90aGVyIHJjIHZhbHVlIGJ1dCBFTk9NRU0uIFdlCj4gPiBjb3VsZCB0dXJuIGl0IGludG8gYSBi
b29sIGJ1dCBJIGRvbid0IHNlZSBhIHJlYXNvbiBmb3IgaXQsIHBlcmhhcHMKPiA+IHRoZXJlIHdp
bGwgYmUgYW5vdGhlciByYyB2YWx1ZSBpbiB0aGUgZnV0dXJlIHRoYXQgd2Ugd2FudCB0byBoYW5k
bGUKPiA+IGdyYWNlZnVsbHkuCj4KPiBBdCB3aGljaCBwb2ludCB0aGUgdmFyaWFibGUncyBuYW1l
IHdpbGwgbm8gbG9uZ2VyIGJlIGFwcHJvcHJpYXRlLgo+IEhlbmNlIG15IHJlcXVlc3QgdG8gbWFr
ZSBpdCBib29sOyBhdCBzdWNoIGEgZnV0dXJlIHBvaW50IHRoZSBjb2RlCj4gd291bGQgbmVlZCB0
b3VjaGluZyBhZ2FpbiBhbnl3YXkgaWYgeW91ICh1bmRlcnN0YW5kYWJseSkgZG9uJ3QKPiB3YW50
IHRvIG1ha2UgbW9yZSB0aGFuIHB1cmVseSBjb3NtZXRpYyBjaGFuZ2VzIG5vdy4KCkJ5IHRoZSB3
YXksIGl0IGlzIG1hZGUgYm9vbCBpbiBwYXRjaCA3IG9mIHRoZSBzZXJpZXMgYmVjYXVzZSB0aGVy
ZSBpcwpubyBuZWVkIHRvIGNhbGwgdGhpcyBmdW5jdGlvbiBkaXJlY3RseSBoZXJlLgoKVGFtYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
