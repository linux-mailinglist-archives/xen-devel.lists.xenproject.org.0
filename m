Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D014CE1C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 17:20:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwq1u-0000dz-9e; Wed, 29 Jan 2020 16:17:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WAbB=3S=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1iwq1s-0000du-Oy
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 16:17:24 +0000
X-Inumbo-ID: d5225680-42b2-11ea-b211-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5225680-42b2-11ea-b211-bc764e2007e4;
 Wed, 29 Jan 2020 16:17:24 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id q9so315592wmj.5
 for <xen-devel@lists.xenproject.org>; Wed, 29 Jan 2020 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6Odc1bBF8gq/PRTWcZhipbFS52PCM54vkmTtGTKPeFI=;
 b=qEW1qrAXlxzvAfX89n3EV8eUPCbMnvz7N+R1wi6EQU9T+0F0NMvDYllH98R0ZPKL6x
 ah1fsa1u/FeHLvX4YIJGKhxmvTUTBKjSzhxb9iAlLUcc7bWYKRynQjJWlrn2DUKrfn++
 k015InsX/z5rs9kjVR1/Ag/dEhQJdtdzPeXThwxMFD9rqUhZgf87EzLHpvsdh9mcBbky
 aUVmSJgdmQXCSW58s9CON/n6VlCG0BYAN0Pwxw2JbgWX2z/5PG9rbrM7GPYhmsNNBRtb
 aS5l+6FxSt8s1g2brMvPqs1OawkS60m4jY15eruvJTWlZg2BJTCt1TNGOPrJ/lAG9X1/
 7tuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Odc1bBF8gq/PRTWcZhipbFS52PCM54vkmTtGTKPeFI=;
 b=Ymc17b1vRu6zBOXKgp/QyIwbk6UnZUonBqsi5kaasdiO7vYhP/Uxi3Z6prli8dV3vv
 ETRuBqhhQqmtadHKj5ZhMY/3APqb7FsCdKEmXDoMIsoRetgStYylviyAjVrLd5QYQQZn
 A++QDmhjJ3EvrkJH+SrY3xg0Sl8pGZ0wcr3lBxGUxRoVX8WVpbZnLylz4u/+4+h4yIRE
 N31rp5hvgAsGSo6llo4BAGDBl3u3TcBrzBIQlBCp4AEDXpBLBmp1BD/HYM5O1MieyuTi
 QvJsFfZIhI4CXmDxlK2abyIvOyqnTZSmN3yBlsKM+eSM0wDjSd4swJ/4CcYElwvDurS3
 GfGQ==
X-Gm-Message-State: APjAAAWgPUMAfnajPnKocg9Z+fDYD4HLouJoKrtxS81XKrbKbbS2VCEZ
 u7gZap7yaNNDskUFB+44pSCex6wmR/vWZSQslrA=
X-Google-Smtp-Source: APXvYqy/TFEOb1j/hFN9oTHPg94NgUoCeTuapfBNVxsAobhwQSL6ohGkThPTqX6c9Box7XjJnK5wuIvxQoVR5mynfdE=
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr22580wmg.154.1580314643097; 
 Wed, 29 Jan 2020 08:17:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <ae2142231342bfc6fb9731303130a2c0fa381576.1580148227.git.tamas.lengyel@intel.com>
 <88661ce4-ef90-c525-586a-4668d4b0001e@suse.com>
 <CABfawhnZTSzh5X0Zctiikw7xhMEDdSGTnW2-eBVC_FsGN9-Ksg@mail.gmail.com>
 <1835b6f4-7361-8979-5a0e-27df5148873a@suse.com>
 <CABfawhkBh-EFjq_HDMaTbtHo=toDcM-C6NwEgCN4i7hZWNNeCA@mail.gmail.com>
 <8143473f-c87d-a0d1-e211-c94b1dc7f5c8@suse.com>
 <CABfawh==quyX5uG1Rh5V8rbDO_SnNr-mA-=DSFn8ejvaXe_ZgA@mail.gmail.com>
 <CABfawhnzLSuEqR6nbJo_nZRxYig74onVbfEcKJehEj93eFPmwg@mail.gmail.com>
In-Reply-To: <CABfawhnzLSuEqR6nbJo_nZRxYig74onVbfEcKJehEj93eFPmwg@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Wed, 29 Jan 2020 09:16:46 -0700
Message-ID: <CABfawhnzJxgiuGjXf2L6dGmf59Kz6_phsLQR-uobQRiqQ6-WJw@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/9] x86/mem_sharing: use default_access
 in add_to_physmap
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
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMjksIDIwMjAgYXQgOTowOSBBTSBUYW1hcyBLIExlbmd5ZWwKPHRhbWFzLmsu
bGVuZ3llbEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzo1
NiBBTSBUYW1hcyBLIExlbmd5ZWwKPiA8dGFtYXMuay5sZW5neWVsQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPgo+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNzo0NCBBTSBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiAyOS4wMS4yMDIwIDE1OjA1LCBU
YW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4gT24gV2VkLCBKYW4gMjksIDIwMjAgYXQgNjoy
NyBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4gPiA+Pgo+ID4g
PiA+PiBPbiAyOC4wMS4yMDIwIDE4OjAyLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4+
PiBPbiBUdWUsIEphbiAyOCwgMjAyMCBhdCA5OjU2IEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6Cj4gPiA+ID4+Pj4KPiA+ID4gPj4+PiBPbiAyNy4wMS4yMDIwIDE5OjA2
LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiA+ID4+Pj4+IFdoZW4gcGx1Z2dpbmcgYSBob2xl
IGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJtaXNzaW9uCj4g
PiA+ID4+Pj4+IHJldHVybmVkIGJ5IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyBhcyBpdCBjYW4gYmUg
bm9uLXNlbnNpY2FsLCBsZWFkaW5nIHRvCj4gPiA+ID4+Pj4+IHNwdXJpb3VzIHZtX2V2ZW50cyBi
ZWluZyBzZW50IG91dCBmb3IgYWNjZXNzIHZpb2xhdGlvbnMgYXQgdW5leHBlY3RlZAo+ID4gPiA+
Pj4+PiBsb2NhdGlvbnMuIE1ha2UgdXNlIG9mIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaW5zdGVhZC4K
PiA+ID4gPj4+Pgo+ID4gPiA+Pj4+IEFzIGJlZm9yZSwgdG8gbWUgImNhbiBiZSBub24tc2Vuc2lj
YWwiIGlzIGluc3VmZmljaWVudCBhcyBhIHJlYXNvbgo+ID4gPiA+Pj4+IGhlcmUuIElmIGl0IGNh
biBhbHNvIGJlIGEgImdvb2QiIHZhbHVlLCBpdCBzdGlsbCByZW1haW5zIHVuY2xlYXIKPiA+ID4g
Pj4+PiB3aHkgaW4gdGhhdCBjYXNlIHAybS0+ZGVmYXVsdF9hY2Nlc3MgaXMgbmV2ZXJ0aGVsZXNz
IHRoZSByaWdodAo+ID4gPiA+Pj4+IHZhbHVlIHRvIHVzZS4KPiA+ID4gPj4+Cj4gPiA+ID4+PiBJ
IGhhdmUgYWxyZWFkeSBleHBsYWluZWQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBh
dGNoIHdoeSBJCj4gPiA+ID4+PiBzYWlkICJjYW4gYmUiLiBGb3Jnb3QgdG8gY2hhbmdlIHRoZSBj
b21taXQgbWVzc2FnZSBmcm9tICJjYW4gYmUiIHRvCj4gPiA+ID4+PiAiaXMiLgo+ID4gPiA+Pgo+
ID4gPiA+PiBDaGFuZ2luZyBqdXN0IHRoZSBjb21taXQgbWVzc2FnZSB3b3VsZCBiZSBlYXN5IHdo
aWxlIGNvbW1pdHRpbmcuCj4gPiA+ID4+IEJ1dCBldmVuIHdpdGggdGhlIGNoYW5nZSBJIHdvdWxk
IGFzayB3aHkgdGhpcyBpcy4gTG9va2luZyBhdAo+ID4gPiA+PiBlcHRfZ2V0X2VudHJ5KCkgKGFu
ZCBhc3N1bWluZyBwMm1fcHRfZ2V0X2VudHJ5KCkgd2lsbCB3b3JrCj4gPiA+ID4+IHNpbWlsYXJs
eSwgbWludXMgdGhlIHAybV9hY2Nlc3NfdCB3aGljaCBjYW4ndCBjb21lIG91dCBvZiB0aGUKPiA+
ID4gPj4gUFRFIGp1c3QgeWV0KSwgSSBzZWUKPiA+ID4gPj4KPiA+ID4gPj4gICAgIGlmICggaXNf
ZXB0ZV92YWxpZChlcHRfZW50cnkpICkKPiA+ID4gPj4gICAgIHsKPiA+ID4gPj4gICAgICAgICAq
dCA9IHAybV9yZWNhbGNfdHlwZShyZWNhbGMgfHwgZXB0X2VudHJ5LT5yZWNhbGMsCj4gPiA+ID4+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXB0X2VudHJ5LT5zYV9wMm10LCBwMm0sIGdm
bik7Cj4gPiA+ID4+ICAgICAgICAgKmEgPSBlcHRfZW50cnktPmFjY2VzczsKPiA+ID4gPj4KPiA+
ID4gPj4gbmVhciBpdHMgZW5kLiBXaGljaCBtZWFucyBldmVuIGEgaG9sZSBjYW4gaGF2ZSBpdHMg
YWNjZXNzIGZpZWxkCj4gPiA+ID4+IHNldC4gU28gaXQncyBzdGlsbCBub3QgY2xlYXIgdG8gbWUg
ZnJvbSB0aGUgZGVzY3JpcHRpb24gd2h5Cj4gPiA+ID4+IHAybS0+ZGVmYXVsdF9hY2Nlc3MgaXMg
dW5pZm9ybWx5IHRoZSB2YWx1ZSB0byB1c2UuIFdvdWxkbid0IHlvdQo+ID4gPiA+PiByYXRoZXIg
d2FudCB0byBvdmVycmlkZSB0aGUgb3JpZ2luYWwgdmFsdWUgb25seSBpZiBpdCdzCj4gPiA+ID4+
IHAybV9hY2Nlc3NfbiB0b2dldGhlciB3aXRoIHAybV9pbnZhbGlkIG9yIHAybV9tbWlvX2RtIChi
dXQgbm90Cj4gPiA+ID4+IHBhZ2VkLW91dCBwYWdlcyk/Cj4gPiA+ID4KPiA+ID4gPiBBdCB0aGlz
IHBvaW50IEkgd291bGQganVzdCByYXRoZXIgc3RhdGUgdGhhdCBhZGRfdG9fcGh5c21hcCBvbmx5
IHdvcmtzCj4gPiA+ID4gb24gYWN0dWFsIGhvbGVzLCBub3Qgd2l0aCBwYWdlZC1vdXQgcGFnZXMu
IEluIGZhY3QsIEkgd291bGQgbGlrZSB0bwo+ID4gPiA+IHNlZSBtZW1fcGFnaW5nIGJlaW5nIGRy
b3BwZWQgZnJvbSB0aGUgY29kZWJhc2UgZW50aXJlbHkgc2luY2UgaXQncwo+ID4gPiA+IGJlZW4g
YWJhbmRvbmVkIGZvciB5ZWFycyBhbmQgbm9vbmUgZXhwcmVzc2luZyBhbnkgaW50ZXJlc3QgaW4g
a2VlcGluZwo+ID4gPiA+IGl0LiBJbiB0aGUgaW50ZXJpbSBJIHdvdWxkIHJhdGhlciBub3Qgc3Bl
bmQgdW5uZWNlc3NhcnkgY3ljbGVzIG9uCj4gPiA+ID4gc3BlY3VsYXRpbmcgYWJvdXQgcG90ZW50
aWFsIGNvcm5lci1jYXNlcyBvZiBtZW1fcGFnaW5nIHdoZW4gbm9vbmUKPiA+ID4gPiBhY3R1YWxs
eSB1c2VzIGl0Lgo+ID4gPiA+Cj4gPiA+ID4+IE9mIGNvdXJzZSB0aGVuIHRoZSBxdWVzdGlvbiBp
cyB3aGV0aGVyIHRoZXJlCj4gPiA+ID4+IHdvdWxkbid0IGJlIGFuIGFtYmlndWl0eSB3aXRoIHAy
bV9hY2Nlc3NfbiBoYXZpbmcgZ290IHNldAo+ID4gPiA+PiBleHBsaWNpdGx5IG9uIHRoZSBwYWdl
LiBCdXQgbWF5YmUgdGhpcyBpcyBpbXBvc3NpYmxlIGZvcgo+ID4gPiA+PiBwMm1faW52YWxpZCAv
IHAybV9tbWlvX2RtPwo+ID4gPiA+Cj4gPiA+ID4gQXMgZmFyIGFzIG1lbV9hY2Nlc3MgcGVybWlz
c2lvbnMgZ28sIEkgZG9uJ3Qga25vdyBvZiBhbnkgdXNlY2FzZSB0aGF0Cj4gPiA+ID4gd291bGQg
c2V0IG1lbV9hY2Nlc3MgcGVybWlzc2lvbiBvbiBhIGhvbGUgZXZlbiBpZiBieSBsb29rcyBvZiBp
dCBpdCBpcwo+ID4gPiA+IHRlY2huaWNhbGx5IHBvc3NpYmxlLiBBdCB0aGlzIHBvaW50IEkgd291
bGQgcmF0aGVyIGp1c3QgcHV0IHRoaXMKPiA+ID4gPiBjb3JuZXItY2FzZSdzIGRlc2NyaXB0aW9u
IGluIGEgY29tbWVudC4KPiA+ID4KPiA+ID4gSSB0aGluayBJIHdvdWxkIGFjayBhIHJldmlzZWQg
cGF0Y2ggaGF2aW5nIHRoaXMgcHJvcGVybHkgZXhwbGFpbmVkLgo+ID4KPiA+IFRoYXQncyBmaW5l
LCBJJ2xsIGFkZCBzb21lIGNvbW1lbnRzIHRvIHRoaXMgZWZmZWN0IGFuZCByZXdvcmQgdGhlCj4g
PiBjb21taXQgbWVzc2FnZS4KPiA+Cj4KPiBBY3R1YWxseSwgbG9va2luZyBhdCB0aGUgaW1wbGVt
ZW50YXRpb24gb2YgcDJtX3NldF9tZW1fYWNjZXNzIGl0J3Mgbm90Cj4gY2xlYXIgdG8gbWUgd2hl
dGhlciB3ZSBjYW4gZXZlbiBoYXZlIGEgaG9sZSB3aXRoIGEgbWVtX2FjY2Vzcwo+IHBlcm1pc3Np
b24gc2V0LiBDYW4geW91IGhhdmUgYSAiaG9sZSIgdHlwZSB3aXRoIGEgdmFsaWQgZ2ZuPyBJZiBu
b3QsCj4gdGhpcyBpcyBhIG5vbi1pc3N1ZSBzaW5jZSBwMm1fc2V0X21lbV9hY2Nlc3Mgb25seSBz
ZXRzIG1lbV9hY2Nlc3MKPiBwZXJtaXNzaW9ucyB0aGF0IHBhc3MgIWdmbl9lcShnZm4sIElOVkFM
SURfR0ZOKS4KCk5ldmVyIG1pbmQsIG9mIGNvdXJzZSBnZm4gY2FuIGJlIGFueXRoaW5nIChpZSB2
YWxpZCkgc2luY2UgaXQncyBub3QKdGllZCB0byB3aGV0aGVyIHRoZSBlbnRyeSBhY3R1YWxseSBl
eGlzdHMgb3Igbm90LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
