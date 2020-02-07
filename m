Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23087155CDE
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2020 18:29:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j07Kc-0003XQ-Rb; Fri, 07 Feb 2020 17:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kGlu=33=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j07Kb-0003XL-NV
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2020 17:22:17 +0000
X-Inumbo-ID: 63240c86-49ce-11ea-a759-bc764e2007e4
Received: from mail-ed1-x543.google.com (unknown [2a00:1450:4864:20::543])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63240c86-49ce-11ea-a759-bc764e2007e4;
 Fri, 07 Feb 2020 17:22:16 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id j17so348027edp.3
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2020 09:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YOxZQUCsXk6i6i2srObw9tC7sN//9rO4rw5wpgXc7o0=;
 b=CbJqv334HtcOixDzxRcwgLhWyRwq+Gxanw7e+/N6X41I6PjLMhYXblrDZX8dNtgFg4
 0+NNpgRSbWYQEFLl3qCg6kyoEDgDQI1na6xW7RpHeDiKEdHBKZ1IapCgDSsBnENgC+OG
 HKEEOY6nbERw9bYhNOUCxwBfZBmJ0nFTrYaylAKV0FMWgD4vJJfZ09e+8GGOEPK81JyI
 sQ8ycTZQCFcIRYcD5mZYIKaZq1CocuOkNwOIHLwJ/kGSjJPQGKrP3H6L32x6SUFmTgdR
 q67gVLOTbUwahzs3OkPTgIw2cCZJuHp9Hh+KjH6vqDT7LjUeS3Wj8tqJhIvs29rbiS6X
 QcMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YOxZQUCsXk6i6i2srObw9tC7sN//9rO4rw5wpgXc7o0=;
 b=ee8ghE1FshepoeZBbtZskWWVfy+YJnlOq2j/kDkrahiIxJw6DO8TrahOjWvSzI4NwH
 WBJoUt82o2d9chxqS3dE5lkrb3sG4SIa53yJUqPZmBI2v42udlhMmp5yAw4O9jzceed8
 tFoTyqLUj404NoDnmTiPFxKR1AY+btKWfixUkGBmarpDPJA0Hy51iwND9ftJCmKKbd9x
 THCqcsBiWU1xCHac3F8E/Zyp8KGhDnh+m/08rIIW3pfK+wTLO6Wl/HjX4El7Lr2+p/ih
 vRh74qxl36wf9ATmn3JnnEq9wBZ7O8JffnVz1kARxKn4l8MX/NCdWVtK4EHu0PQ/eMLY
 gGMA==
X-Gm-Message-State: APjAAAWtrnlEWfgp4Ebhl7fGx5Ze1cruo/pwJ5kjfSYpH0jiAucR2rZC
 o0PraHDiijU9RWRMhphDz/qoHDBQwrc=
X-Google-Smtp-Source: APXvYqyZoBotRjhWzFDiZiNDk2dZRvq1TPGKEfwtTQDHNY0WX69DUk1L7P5Luefprd1g3XRig1OuQg==
X-Received: by 2002:a17:907:20a8:: with SMTP id
 pw8mr318501ejb.248.1581096135693; 
 Fri, 07 Feb 2020 09:22:15 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id r13sm430486ejb.27.2020.02.07.09.22.14
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2020 09:22:14 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id g1so3325121wmh.4
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2020 09:22:14 -0800 (PST)
X-Received: by 2002:a1c:a404:: with SMTP id n4mr5402153wme.186.1581096134012; 
 Fri, 07 Feb 2020 09:22:14 -0800 (PST)
MIME-Version: 1.0
References: <da353fee-b7f7-73ab-9ebe-632b4ea4152d@suse.com>
 <5ecf685c-7109-4ad6-cba9-bb138f750268@suse.com>
 <20200207095249.GB4679@Air-de-Roger>
 <86e31583-7f4c-c365-17f1-92b82acb5d81@suse.com>
 <CABfawhkcHMbiRFSp9WoP2ZPXgOjaWU02tmmOqRafo8VmoQaBCw@mail.gmail.com>
In-Reply-To: <CABfawhkcHMbiRFSp9WoP2ZPXgOjaWU02tmmOqRafo8VmoQaBCw@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Fri, 7 Feb 2020 10:21:37 -0700
X-Gmail-Original-Message-ID: <CABfawhm+_xA_-Bcv9easAq6d0uQe_hBt4AS_ioigYCCNNhDPRA@mail.gmail.com>
Message-ID: <CABfawhm+_xA_-Bcv9easAq6d0uQe_hBt4AS_ioigYCCNNhDPRA@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH] x86/p2m: drop p2m_access_t parameter from
 set_mmio_p2m_entry()
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgNywgMjAyMCBhdCAxMDoxNiBBTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIgNywgMjAyMCBhdCA5OjU0IEFNIEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gMDcuMDIuMjAy
MCAxMDo1MiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+ID4gT24gRnJpLCBGZWIgMDcsIDIw
MjAgYXQgMDk6MDg6MTVBTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+PiBPbiAwNi4w
Mi4yMDIwIDE2OjIwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+ID4gPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
Cj4gPiA+Pj4gQEAgLTMwMzcsOSArMzAzNyw4IEBAIHN0YXRpYyBpbnQgdm14X2FsbG9jX3ZsYXBp
Y19tYXBwaW5nKHN0cnUKPiA+ID4+PiAgICAgIHNoYXJlX3hlbl9wYWdlX3dpdGhfZ3Vlc3QocGcs
IGQsIFNIQVJFX3J3KTsKPiA+ID4+PiAgICAgIGQtPmFyY2guaHZtLnZteC5hcGljX2FjY2Vzc19t
Zm4gPSBtZm47Cj4gPiA+Pj4KPiA+ID4+PiAtICAgIHJldHVybiBzZXRfbW1pb19wMm1fZW50cnko
ZCwgcGFkZHJfdG9fcGZuKEFQSUNfREVGQVVMVF9QSFlTX0JBU0UpLCBtZm4sCj4gPiA+Pj4gLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBBR0VfT1JERVJfNEssCj4gPiA+Pj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9nZXRfaG9zdHAybShkKS0+ZGVmYXVsdF9hY2Nl
c3MpOwo+ID4gPj4+ICsgICAgcmV0dXJuIHNldF9tbWlvX3AybV9lbnRyeShkLCBnYWRkcl90b19n
Zm4oQVBJQ19ERUZBVUxUX1BIWVNfQkFTRSksIG1mbiwKPiA+ID4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUEFHRV9PUkRFUl80Syk7Cj4gPiA+Pj4gIH0KPiA+ID4+Cj4gPiA+PiBV
cG9uIDJuZCB0aG91Z2h0IC0gZG9lcyB0aGlzIHJlYWxseSB3YW50IHRvIHVzZSBkZWZhdWx0IGFj
Y2Vzcz8KPiA+ID4+IEV4ZWN1dGUgcGVybWlzc2lvbiBmb3IgdGhpcyBwYWdlIGxvb2tzIGEgbGl0
dGxlIHN1c3BpY2lvdXMuCj4gPiA+PiBJc24ndCBpdCB0aGUgY2FzZSB0aGF0IHRoaXMgcGFnZSBk
b2Vzbid0IChub3JtYWxseT8pIGdldAo+ID4gPj4gYWNjZXNzZWQgYXQgYWxsLCBhbmQgaW5zdGVh
ZCBpdHMgYWRkcmVzcyBzZXJ2ZXMgYXMgYW4gaW5kaWNhdG9yCj4gPiA+PiB0byB0aGUgQ1BVPyAo
SSBldmVuIHZhZ3VlbHkgcmVjYWxsIGl0IGhhdmluZyBiZWVuIGNvbnNpZGVyZWQgdG8KPiA+ID4+
IGNvbnNvbGlkYXRlIHRoaXMsIHRvIGUuZy4gYSBzaW5nbGUgcGFnZSBwZXIgZG9tYWluLikgSW4g
d2hpY2gKPiA+ID4+IGNhc2UgZXZlbiBwMm1fYWNjZXNzX24gbWlnaHQgYmUgZ29vZCBlbm91Z2g/
Cj4gPiA+Cj4gPiA+IEhtLCBJIHRoaW5rIHAybV9hY2Nlc3NfbiBpcyBub3QgZW5vdWdoLCBhcyB0
aGF0IHdvdWxkIHRyaWdnZXIgYW4gRVBUCj4gPiA+IGZhdWx0IHdoaWNoIGhhcyBwcmVmZXJlbmNl
IG92ZXIgdGhlIEFQSUMgYWNjZXNzIFZNIGV4aXQgKHNlZSAyOS40LjEKPiA+ID4gUHJpb3JpdHkg
b2YgQVBJQy1BY2Nlc3MgVk0gRXhpdHMpLgo+ID4KPiA+IEFoLCB5ZXMsIHJlYWRpbmcgdGhhdCB0
ZXh0IEkgYWdyZWUuIEhhdmluZyBqdXN0IGEgc2luZ2xlIHN1Y2ggcGFnZQo+ID4gcGVyIGRvbWFp
biB3b3VsZCBzdGlsbCBzZWVtIHBvc3NpYmxlLCB0aG91Z2guIEFsdGhvdWdoLCBpZiB3ZSBtZWFu
dAo+ID4gdG8gc3VwcG9ydCBhIGd1ZXN0IG1vdmluZyB0aGUgQVBJQyBiYXNlIGFkZHJlc3MsIHRo
ZW4gd2UgY291bGRuJ3QsCj4gPiBhZ2Fpbi4KPiA+Cj4gPiA+IEkgdGhpbmsgc2V0dGluZyBpdCB0
byBwMm1fYWNjZXNzX3J3IHNob3VsZCBiZSBlbm91Z2gsIGFuZCB3ZSB3b3VsZCBnZXQKPiA+ID4g
RVBUIGZhdWx0cyB3aGVuIHRyeWluZyB0byBleGVjdXRlIGZyb20gQVBJQyBwYWdlLgo+ID4KPiA+
IFRoZW4gdGhlIG90aGVyIHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlcmUncyBhbnkgdXNlIGZvciBp
bnRyb3NwZWN0aW9uCj4gPiB0byBmdXJ0aGVyIGxpbWl0IHBlcm1pc3Npb25zIG9uIHRoaXMgKGtp
bmQgb2YgZmFrZSkgcGFnZS4gVGFtYXM/Cj4KPiBJJ20gbm90IGF3YXJlIG9mIGFueSB1c2UtY2Fz
ZSB0aGF0IHdvdWxkIHJlc3RyaWN0IHRoZSBFUFQgcGVybWlzc2lvbgo+IGZvciBNTUlPIHBhZ2Vz
LiBUaGF0IHNhaWQsIGFuIGFwcGxpY2F0aW9uIGNvdWxkIHN0aWxsIHJlcXVlc3QgdGhhdCB0bwo+
IGJlIHNldCBsYXRlciBvbi4gU2luY2UgdGhpcyBmdW5jdGlvbiBoZXJlIGdldHMgY2FsbGVkIGlu
Cj4gdm14X2RvbWFpbl9pbml0aWFsaXNlIEkgc3VzcGVjdCBhIG1lbV9hY2Nlc3MgdXNlciBkaWRu
J3QgZXZlbiBoYXZlIGEKPiBjaGFuY2UgdG8gY2hhbmdlIHRoZSBkZWZhdWx0X2FjY2VzcyB0byBh
bnl0aGluZyBjdXN0b20gc28gSSB2ZW50dXJlIGl0Cj4gd291bGQgYmUgc2FmZSB0byBjaG9vc2Ug
d2hhdGV2ZXIgcGVybWlzc2lvbiBpcyBzZW5zaWJsZS4gSWYgYW55b25lCj4gd2FudHMgdG8gbWVz
cyB3aXRoIHRoZSBwZXJtaXNzaW9uIGxhdGVyIHRoZXkgY2FuIGRvIHRoYXQgcmVnYXJkbGVzcyBv
Zgo+IHdoYXQgd2FzIHNldCBoZXJlLgoKT25lIHRoaW5nIHRvIGFkZCB0aG91Z2ggcmVnYXJkaW5n
IHVzaW5nIHAybV9hY2Nlc3NfcncgaGVyZSBpcyB0aGF0IGluCmNhc2Ugc29tZXRoaW5nIHdvdWxk
IHRyaWdnZXIgYW4gWCB2aW9sYXRpb24gaXQgd291bGQgbGVhZCB0byBhbiBldmVudApiZWluZyBz
ZW50IHRvIGEgdm1fZXZlbnQgc3Vic2NyaWJlciwgd2hpY2ggdGhleSBtYXkgbm90IGJlIGFibGUg
dG8KbWFrZSBzZW5zZSBvZi4gU28gSSB3b3VsZCBzdWdnZXN0IHRoYXQgaWYgeW91IHdhbnQgdG8g
bWFrZSB0aGlzCnBhZ2V0YWJsZSBlbnRyeSBSL1cgb25seSB0byB1c2UgYSBwMm1fdHlwZSBmb3Ig
dGhhdCBpbnN0ZWFkIG9mIGEKcDJtX2FjY2Vzcy4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
