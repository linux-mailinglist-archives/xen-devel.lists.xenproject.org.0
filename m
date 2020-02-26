Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0122417042A
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 17:20:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6zO3-0007sN-Q8; Wed, 26 Feb 2020 16:18:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5J6w=4O=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1j6zO2-0007sI-7i
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 16:18:14 +0000
X-Inumbo-ID: 96678f02-58b3-11ea-a490-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96678f02-58b3-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 16:18:13 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so4446953eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 08:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YX1+vYw3AxZSLcH3Xe10MHbvSwEbzUwkhRHNNlJ+HDg=;
 b=ifNBIVxTKOHDQsk5MDWh/cAummpeeKzJWZhLJ/vRnIjR5goptWh4o89QvKCBRnsvaa
 QnaxyxHKuNTKNL0O4A1Wb5YwhiT9L/hRsfvyIyB6Uo+CCCXgANldlTNJof6gE3AwNlIf
 4MOfKjsvmN3mtt2dBfQ5J40bUF20knSy31uQnDXcSz64mAMkqjj+qNwHHCrbdU1u/POm
 Hv/tHXk9a8FngpTTDJQwBeMFaWlIdb6qtmlQWqGDGYS5UQhLvdBSPa6gX1V6AwsTkQ9i
 61nIbW1sq90fuvovtkpNcg/yQ2kZh1n9N5Fa8xQfVwbTUSIQ9+YgobdMUgghz8ueCzEh
 z1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YX1+vYw3AxZSLcH3Xe10MHbvSwEbzUwkhRHNNlJ+HDg=;
 b=UhqSBFupya1LhsAtd7rf/ynyrTUgVRIplmWvG3/SV+JAgkstfeRO5RNLdnyTJti1yx
 Y6HA+kXxq5jcz2rqXk8jMhujfEEwL0VJLDeGuZS7Hw9noG5VO4bomK4f/SnsSjXs+qLd
 GPTeH1npFU/biHGiBMMDn4XUw9Ozqb2kRkEQcdaZ2lczyz+b/GQ2T2eldskHKxCuVkmL
 fgzF3UtLnMJrKTGaHFhfuBZWBvgwILFjzYmNaEtUHMlyIZNFJIzGySXhFN4S4QHDe3Si
 v1gOq5mLPBJ80Cw19+4WNju8F3Nu/W7jXRB5BiHQ/IUNEKzbbJ+hfke85aqRn4ZcGgBv
 4LxQ==
X-Gm-Message-State: APjAAAXEV/BMYT3DqG1TggG2cMPH13EI8No/GdWxLEe/30fxYML6zfKo
 Uu3UxaxlLb8wz55CXvia7uF/pX0CZBs=
X-Google-Smtp-Source: APXvYqxPmMwUVkSLvb4hjq0c0TLcuyLJGJKr/nt9DrAGJNEOxVXbclqNKs1hQxlo79FFN/j7RX4rpQ==
X-Received: by 2002:a50:ee91:: with SMTP id f17mr95532edr.130.1582733892730;
 Wed, 26 Feb 2020 08:18:12 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id f19sm113244ejb.7.2020.02.26.08.18.11
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2020 08:18:11 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id m3so3880003wmi.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2020 08:18:11 -0800 (PST)
X-Received: by 2002:a7b:c779:: with SMTP id x25mr6399727wmk.77.1582733891107; 
 Wed, 26 Feb 2020 08:18:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582658216.git.tamas.lengyel@intel.com>
 <8df741964b56c10ed912f9187dcb31aae7251085.1582658216.git.tamas.lengyel@intel.com>
 <20200226151247.GF24458@Air-de-Roger.citrite.net>
 <CABfawhn1mDFcP3saj3DzritNS2Zxzs5tsLeHuobwYAG3SYWOzA@mail.gmail.com>
 <20200226153621.GH24458@Air-de-Roger.citrite.net>
 <CABfawhkp6nvPt4KM8rOsE06D=h_1iyeCRi9aS2i3OvFBnHL6KA@mail.gmail.com>
 <20200226161036.GJ24458@Air-de-Roger.citrite.net>
In-Reply-To: <20200226161036.GJ24458@Air-de-Roger.citrite.net>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Wed, 26 Feb 2020 09:17:35 -0700
X-Gmail-Original-Message-ID: <CABfawhmrM3iS5QMkMz78b8K25s9V947yJPBULAs4D5Bt7FUDXQ@mail.gmail.com>
Message-ID: <CABfawhmrM3iS5QMkMz78b8K25s9V947yJPBULAs4D5Bt7FUDXQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [Xen-devel] [PATCH v10 1/3] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgOToxMCBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEZlYiAyNiwgMjAyMCBhdCAwODo1ODow
NUFNIC0wNzAwLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gPiBPbiBXZWQsIEZlYiAyNiwgMjAy
MCBhdCA4OjM2IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBGZWIgMjYsIDIwMjAgYXQgMDg6MjA6MzBBTSAtMDcwMCwg
VGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gPiA+ID4gPiArc3RhdGljIGludCBwb3B1bGF0ZV9z
cGVjaWFsX3BhZ2VzKHN0cnVjdCBkb21haW4gKmNkKQo+ID4gPiA+ID4gPiArewo+ID4gPiA+ID4g
PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBwMm1fZ2V0X2hvc3RwMm0oY2QpOwo+ID4g
PiA+ID4gPiArICAgIHN0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcGFyYW1zW10gPQo+ID4gPiA+
ID4gPiArICAgIHsKPiA+ID4gPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX1NUT1JFX1BGTiwKPiA+
ID4gPiA+ID4gKyAgICAgICAgSFZNX1BBUkFNX0lPUkVRX1BGTiwKPiA+ID4gPiA+ID4gKyAgICAg
ICAgSFZNX1BBUkFNX0JVRklPUkVRX1BGTiwKPiA+ID4gPiA+ID4gKyAgICAgICAgSFZNX1BBUkFN
X0NPTlNPTEVfUEZOCj4gPiA+ID4gPiA+ICsgICAgfTsKPiA+ID4gPiA+ID4gKyAgICB1bnNpZ25l
ZCBpbnQgaTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+ID4gPiArICAgIGZvciAoIGk9MDsgaTw0OyBp
KysgKQo+ID4gPiA+ID4KPiA+ID4gPiA+IE5pdDogY2FuIHlvdSBwbGVhc2UgYWRkIHNvbWUgc3Bh
Y2VzIGFyb3VuZCB0aGUgb3BlcmF0b3JzPwo+ID4gPiA+Cj4gPiA+ID4gU3VyZS4KPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+ID4gKyAgICB7Cj4gPiA+ID4gPiA+ICsgICAgICAgIHVpbnQ2NF90
IHZhbHVlID0gMDsKPiA+ID4gPiA+ID4gKyAgICAgICAgbWZuX3QgbmV3X21mbjsKPiA+ID4gPiA+
ID4gKyAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiA+ID4gPiA+ID4gKwo+ID4gPiA+
ID4gPiArICAgICAgICBpZiAoIGh2bV9nZXRfcGFyYW0oY2QsIHBhcmFtc1tpXSwgJnZhbHVlKSB8
fCAhdmFsdWUgKQo+ID4gPiA+ID4gPiArICAgICAgICAgICAgY29udGludWU7Cj4gPiA+ID4gPiA+
ICsKPiA+ID4gPiA+ID4gKyAgICAgICAgaWYgKCAhKHBhZ2UgPSBhbGxvY19kb21oZWFwX3BhZ2Uo
Y2QsIDApKSApCj4gPiA+ID4gPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsKPiA+ID4g
PiA+ID4gKwo+ID4gPiA+ID4gPiArICAgICAgICBuZXdfbWZuID0gcGFnZV90b19tZm4ocGFnZSk7
Cj4gPiA+ID4gPiA+ICsgICAgICAgIHNldF9ncGZuX2Zyb21fbWZuKG1mbl94KG5ld19tZm4pLCB2
YWx1ZSk7Cj4gPiA+ID4gPiA+ICsKPiA+ID4gPiA+ID4gKyAgICAgICAgcmV0dXJuIHAybS0+c2V0
X2VudHJ5KHAybSwgX2dmbih2YWx1ZSksIG5ld19tZm4sIFBBR0VfT1JERVJfNEssCj4gPiA+ID4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3J3LCBwMm0tPmRlZmF1
bHRfYWNjZXNzLCAtMSk7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gSSB0aGluayB5b3UgYWxzbyBuZWVk
IHRvIGNvcHkgdGhlIGNvbnRlbnRzIGZyb20gdGhlIHBhcmVudCBwYWdlIGhlcmUuCj4gPiA+ID4K
PiA+ID4gPiBUaGUgdG9vbHN0YWNrIHNpbXBseSBjbGVhcnMgdGhlc2UgcGFnZXMgZHVyaW5nIHJl
c3RvcmUgc28gSSdtIG5vdCBzdXJlCj4gPiA+ID4gKHNlZSBodHRwczovL3hlbmJpdHMueGVuLm9y
Zy9naXR3ZWIvP3A9eGVuLmdpdDthPWJsb2I7Zj10b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4
Nl9odm0uYztoPTNmNzgyNDhmMzJmZWMyMzlkYjc3YjBlNDgzYjAxOTUyMTFlNmI5NzQ7aGI9SEVB
RCNsNjEpLgo+ID4gPiA+IEkgZG9uJ3Qgc2VlIHdoeSB5b3Ugd291bGQgaGF2ZSB0byBjbGVhciB0
aGUgcGFnZXMgZmlyc3QgaWYgdGhleSBnZXQKPiA+ID4gPiBvdmVyd3JpdHRlbiBieSBzYXZlZCB2
ZXJzaW9ucyBsYXRlci4gT3IgdGhlc2UgcGFnZXMgYXJlIGV4cGVjdGVkIHRvIGJlCj4gPiA+ID4g
dG9ybi1kb3duIGJ5IHRoZSBzYXZlL3Jlc3RvcmUgYXdhcmUgZ3Vlc3RzPwo+ID4gPgo+ID4gPiBH
dWVzdHMgdXNpbmcgdGhvc2UgcGFnZXMga25vdyB0aGV5IGFyZSB0b3JuIGRvd24gZHVyaW5nIHN1
c3BlbmQvcmVzdW1lCj4gPiA+IGFuZCBleHBlY3QgdG8gZmluZCBhIGNsZWFuIHN0YXRlIHdoZW4g
cmVzdW1pbmcuIFRoYXQncyBub3QgdGhlIGNhc2Ugd2l0aAo+ID4gPiBmb3JraW5nIGhvd2V2ZXIs
IGFzIHRoZSBndWVzdCBpcyBjb21wbGV0ZWx5IHVuYXdhcmUgb2YgdGhlIGZvcmsKPiA+ID4gaGFw
cGVuaW5nLgo+ID4gPgo+ID4gPiBPbmUgdGhpbmcgSSdtIG5vdCBzdXJlIG9mIGlzIHdoZXRoZXIg
dGhlIGJhY2tlbmRzICh4ZW5zdG9yZWQsCj4gPiA+IHhlbmNvbnNvbGVkKSB3aWxsIGNvcGUgd2l0
aCB0aG9zZSBwYWdlcyBiZWluZyBhbHJlYWR5IHBvcHVsYXRlZCBvbgo+ID4gPiBndWVzdCBjcmVh
dGlvbi4KPiA+ID4KPiA+ID4gQUZBSUNUIGFub3RoZXIgaXNzdWUgaXMgdGhhdCB4ZW5zdG9yZSB3
YXRjaGVzIGFyZSBub3QgY29waWVkIG92ZXIgZnJvbQo+ID4gPiB0aGUgcGFyZW50LCBzbyBhbnkg
d2F0Y2hlcyB0aGUgcGFyZW50IG1pZ2h0IGhhdmUgc2V0IHdpbGwgbm90IGZpcmUgb24KPiA+ID4g
dGhlIGNoaWxkLiBUaGF0IHdvdWxkIHJlcXVpcmUgc29tZSBraW5kIG9mIGludGVyYWN0aW9uIHdp
dGggeGVuc3RvcmVkCj4gPiA+IGluIG9yZGVyIHRvIHJlcXVlc3QgYSBndWVzdCBzdGF0ZSB0byBi
ZSBjb3BpZWQgb3ZlciB0byBhbm90aGVyIGd1ZXN0Lgo+ID4KPiA+IFNvdW5kcyBsaWtlIGl0IG1v
c3QgbGlrZWx5IHdvdWxkIG5lZWQgdG8gYmUgaGFuZGxlZCBpZiB0aGUgZ3Vlc3QgdXNlcwo+ID4g
dGhlbS4gSSdtIG5vdCBzdXJlIGlmIGEgZGVmYXVsdCBMaW51eCBIVk0gZ3Vlc3QgdXNlcyB0aGVt
IHRob3VnaC4KPgo+IExpbnV4IFBWSFZNIGRvZXMgdXNlIHhlbnN0b3JlIHdhdGNoZXMgdG8gbW9u
aXRvciBiYWNrZW5kIHN0YXRlCj4gY2hhbmdlcywgYnV0IGl0IHdvdWxkIHJlcXVpcmUgYSBub24t
dHJpdmlhbCBhbW91bnQgb2Ygd29yayB0byBjbG9uZQo+IHRoZSBzdGF0ZSBvZiBQViBkZXZpY2Vz
LCBzbyBJIGd1ZXNzIGl0J3Mgc29tZXRoaW5nIHRvIGJlIGxlZnQgYXMgYQo+IFRPRE8gaXRlbS4K
Pgo+ID4gQQo+ID4gV2luZG93cyBIVk0gZ3Vlc3Qgd2l0aG91dCB0aGUgUFYgZHJpdmVycyBpcyBj
ZXJ0YWlubHkgbm90IFhlbiBhd2FyZSBzbwo+ID4gdGhlcmUgdGhpbmdzIGFscmVhZHkgd29yayBq
dXN0IGZpbmUgYW5kIHRoYXQgaXMgb3VyIHByaW1hcnkgdGFyZ2V0IGZvcgo+ID4gb3VyIHVzZS1j
YXNlLiBQVkhWTS9QVkggTGludXggZ3Vlc3RzIGFyZSBub3QuIFNvIHRoYXQncyByZWFsbHkgb3V0
c2lkZQo+ID4gdGhlIHNjb3BlIG9mIHdoYXQgSSBjYW4gY29udHJpYnV0ZSBhdCB0aGUgbW9tZW50
Lgo+Cj4gU3VyZS4KPgo+IENhbiB5b3UgcGxlYXNlIGFkZCBhIFRPRE8gaXRlbSBoZXJlIHRvIG5v
dGUgdGhhdCB0aGUgY29udGVudHMgb2YgdGhvc2UKPiBzcGVjaWFsIHBhZ2VzIGxpa2VseSBuZWVk
IHRvIGJlIGNvcGllZCBvdmVyLCBhbmQgdGhhdCB0aGUgc3RhdGUgb2YgUFYKPiBkZXZpY2VzIGFu
ZCBpbnRlcmZhY2VzIHRoYXQgcmVseSBvbiBiYWNrZW5kcyBydW5uaW5nIGluIHVzZXJzcGFjZSBp
cwo+IG5vdCBoYW5kbGVkIGF0IGFsbC4KPgoKT2YgY291cnNlLiBJIHdpbGwgZmluaXNoIHVwIHRo
ZSBQViB0aW1lciBwYXJ0cyBhbmQgY29weWluZyB0aGUgc2hhcmVkCmluZm8gcGFnZSwgYnV0IHdp
bGwgbGVhdmUgdGhlIHJlc3QgYXMgVE9ETy4gSG9wZWZ1bGx5IHRoaXMgd2lsbCBnZXQgYXQKbGVh
c3QgYSBkZWZhdWx0IExpbnV4IEhWTSBmb3JrIHdvcmtpbmcgdGhlIHNhbWUgd2F5IGFzIFdpbmRv
d3MgZG9lcywKYnV0IGlmIG5vdCB0aGVuIEknbGwgdW5mb3J0dW5hdGVseSBoYXZlIHRvIGxlYXZl
IGl0IGFzLWlzIGZvciBub3cuCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
