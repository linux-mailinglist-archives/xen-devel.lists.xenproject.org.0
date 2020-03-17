Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 818FB18865F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Mar 2020 14:52:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jECaJ-0001BH-Ez; Tue, 17 Mar 2020 13:48:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wpLQ=5C=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jECaH-0001BB-Sj
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 13:48:41 +0000
X-Inumbo-ID: 026e292a-6856-11ea-b34e-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 026e292a-6856-11ea-b34e-bc764e2007e4;
 Tue, 17 Mar 2020 13:48:41 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id u12so22943531ljo.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Mar 2020 06:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dZWc6MKpBZAK1GCwUK0BKico7ZCpbM/BofEdwUYRiBU=;
 b=QjPWKa7hUy48xX7w3NW7u7jzOKj04YCfjLpVNbFk5G4XKxOFUkBoA1FpzBEx9o06QC
 OVEI526aG+u4DkK2uaD5SLF9jUVn8Zskt+7dPq59iSJZ8JmxewuAx1HRqgGKGHFUyRhj
 CSb56d0XpfmkkI8VVgs3I50Fc8zadElXHUapVePtOIFaWyBMeDiQzS1mpJWrUACEoKNm
 0x2++D36ioLaFtSHGRd87L/beNPgYtqWKgruGdeoaSO3gClUbzYEkQFTq7FjJDnBzPmN
 suaEBYzPpauW9RcDrUmaERmp2TqSrAFAYgNgZRETZ9yUxOQafXNdr2rAszvMTMf/bpGd
 Vmrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dZWc6MKpBZAK1GCwUK0BKico7ZCpbM/BofEdwUYRiBU=;
 b=BpVYVbtmEc0zgyCy+UpDCIbTFbM5P1LNoVSfs+RM9aT2LAJ+a1I1LpEsKKZOxzcuYL
 f1aeDsEoPyMJwuRIZdCVTDBJB8YvRhMIC7hr9jiNCstVRMV+nR9wpc1h6mzqyBAEc6dG
 Cp9E64UDOlNamJDjMCl4UEwcIZ5ZH1CpiAZoECLZS4FcX7v3mTc5hT54Way6R/DUU9Ux
 RoSBHBecyqglkBwBMdPNKJOKx2MQv/8qIT9bPSU/Z1BKdqbhy/vsPkHuxvrHA4Xwek6M
 /KoQ2v0BYJ6cLdMSyRXHlsdFDwJ1f+SswPbZ2f8GpNpwDtMsTD3eJt27eNZ3Q+E8gRim
 J4mg==
X-Gm-Message-State: ANhLgQ1nWWWi6qe02WeRikUSZiNTqpq1bhXv+/EYjADnhBWBp2Ipf+aa
 rI387uJjA0w9uSe7Ge3k26H7sBBIExVEY1nWxFU=
X-Google-Smtp-Source: ADFU+vt7EUzzUXp6l1x5arKnfZZhQCKGh7OIko7AEbvPo0wwpnUdkAodsUHIOlmUmfszzOCM7QgLs36PgKpLlp7xrA0=
X-Received: by 2002:a2e:8595:: with SMTP id b21mr2788338lji.184.1584452919931; 
 Tue, 17 Mar 2020 06:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
 <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
In-Reply-To: <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 17 Mar 2020 09:48:28 -0400
Message-ID: <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgNCwgMjAyMCBhdCAxMTowNiBBTSBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBGZWIgMTksIDIwMjAgYXQgMzoyNSBBTSBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIDE4LjAyLjIwMjAg
MjI6NDUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gPiA+IE9uIDE4LzAyLzIwMjAgMTg6NDMsIEph
c29uIEFuZHJ5dWsgd3JvdGU6Cj4gPiA+PiBPbiBNb24sIEZlYiAxNywgMjAyMCwgODoyMiBQTSBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+ID4+PiBP
biAxNy8wMi8yMDIwIDIwOjQxLCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+ID4gPj4+PiBPbiBNb24s
IEZlYiAxNywgMjAyMCBhdCAyOjQ2IFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+IHdyb3RlOgo+ID4gPj4+Pj4gV2UgaGF2ZSBtdWx0aXBsZSBidWdzLgo+ID4gPj4+
Pj4KPiA+ID4+Pj4+IEZpcnN0IGFuZCBmb3JlbW9zdCwgWGVuIHNlZW1zIHRvdGFsbHkgYnJva2Vu
IHdoZW4gcnVubmluZyBpbiBFeHRJTlQKPiA+ID4+Pj4+IG1vZGUuICBUaGlzIG5lZWRzIGFkZHJl
c3NpbmcsIGFuZCBvdWdodCB0byBiZSBzdWZmaWNpZW50IHRvIGxldCBYZW4KPiA+ID4+Pj4+IGJv
b3QsIGF0IHdoaWNoIHBvaW50IHdlIGNhbiB0cnkgdG8gZmlndXJlIG91dCB3aHkgaXQgaXMgdHJ5
aW5nIHRvIGZhbGwKPiA+ID4+Pj4+IGJhY2sgaW50byA0ODYoaXNoKSBjb21wYXRpYmlsaXR5IG1v
ZGUuCj4gPiA+PiBYZW4gaGFzICJlbmFibGVkIEV4dElOVCBvbiBDUFUjMCIgd2hpbGUgbGludXgg
aGFzICJtYXNrZWQgRXh0SU5UIG9uCj4gPiA+PiBDUFUjMCIgc28gbGludXggaXNuJ3QgdXNpbmcg
RXh0SU5UPwo+ID4gPgo+ID4gPiBJdCB3b3VsZCBhcHBlYXIgbm90LiAgRXZlbiBtb3JlIGNvbmNl
cm5pbmdseSwgb24gbXkgS2FieWxha2UgYm94LAo+ID4gPgo+ID4gPiAjIHhsIGRtZXNnIHwgZ3Jl
cCBFeHRJTlQKPiA+ID4gKFhFTikgZW5hYmxlZCBFeHRJTlQgb24gQ1BVIzAKPiA+ID4gKFhFTikg
bWFza2VkIEV4dElOVCBvbiBDUFUjMQo+ID4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSMy
Cj4gPiA+IChYRU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzMKPiA+ID4gKFhFTikgbWFza2VkIEV4
dElOVCBvbiBDUFUjNAo+ID4gPiAoWEVOKSBtYXNrZWQgRXh0SU5UIG9uIENQVSM1Cj4gPiA+IChY
RU4pIG1hc2tlZCBFeHRJTlQgb24gQ1BVIzYKPiA+ID4gKFhFTikgbWFza2VkIEV4dElOVCBvbiBD
UFUjNwo+ID4gPgo+ID4gPiB3aGljaCBhdCBmaXJzdCBnbGFuY2Ugc3VnZ2VzdHMgdGhhdCB3ZSBo
YXZlIHNvbWV0aGluZyBhc3ltbWV0cmljIGJlaW5nCj4gPiA+IHNldCB1cC4KPiA+Cj4gPiBUaGF0
J3MgcGVyZmVjdGx5IG5vcm1hbCAtIEV4dElOVCBtYXkgYmUgZW5hYmxlZCBvbiBqdXN0IG9uZSBD
UFUsCj4gPiBhbmQgdGhhdCdzIENQVTAgaW4gb3VyIGNhc2UgKHVudGlsIHN1Y2ggdGltZSB0aGF0
IHdlIHdvdWxkIHdhbnQKPiA+IHRvIGJlIGFibGUgdG8gb2ZmbGluZSBDUFUwKS4KPgo+IFRoYW5r
cywgSmFuLiAgTGludXggcHJpbnRzIG1hc2tlZCBFeHRJTlQgZm9yIGFsbCA4IENQVSB0aHJlYWRz
Lgo+Cj4gSSBpbnNlcnRlZCBfX3ByaW50X0lPX0FQSUMoKSBiZWZvcmUgdGhlICJJTy1BUElDICsg
dGltZXIgZG9lc24ndCB3b3JrIiBwYW5pYy4KPgo+IFVzaW5nIHZlY3Rvci1iYXNlZCBpbmRleGlu
Zwo+IElSUSB0byBwaW5nIG1hcHBpbmdzOgo+IElSUTI0MCAtPiAwOjIKPgo+IHdoZXJlIExpbnV4
IHByaW50cwo+IElSUTAgLT4gMDoyCj4KPiBUaGF0IG1heSBqdXN0IGJlIHRoZSBkaWZmZXJlbmNl
IGJldHdlZW4gWGVuIHByaW50aW5nIHRoZSBWZWN0b3IgdnMuCj4gTGludXggcHJpbnRpbmcgdGhl
IElSUSBudW1iZXIuCj4KPiBBbnkgcG9pbnRlcnMgdG8gd2hhdCBJIHNob3VsZCBpbnZlc3RpZ2F0
ZT8KCkkgZ290IGl0IHRvIGJvb3QgcGFzdCAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29yayIu
ICBJIHByb2dyYW1tZWQKdGhlIEhQRVQgdG8gcHJvdmlkZSBhIHBlcmlvZGljIHRpbWVyIGluIGhw
ZXRfcmVzdW1lKCkgb24gVDAuICBXaGVuIEkKYWN0dWFsbHkgZ290IGl0IHByb2dyYW1tZWQgcHJv
cGVybHksIGl0IHdvcmtlZCB0byBpbmNyZW1lbnQKcGl0MF90aWNrcy4gIEkgYWxzbyBtYWRlIHRp
bWVyX2ludGVycnVwdCgpIHVuY29uZGl0aW9uYWxseQpwaXQwX3RpY2tzKysgdGhvdWdoIHRoYXQg
bWF5IG5vdCBtYXR0ZXIuCgpOb3cgaXQgcGFuaWNzIGluIHB2X2Rlc3Ryb3lfZ2R0KCkgd2hlbiBp
dCBmYWlscyAiQVNTRVJUKHYgPT0gY3VycmVudAp8fCAhdmNwdV9jcHVfZGlydHkodikpOyIgd2hl
biBidWlsZGluZyBkb20wLiAgSSBoYXZlbid0IGludmVzdGlnYXRlZAp0aGF0IHlldC4KClJlZ2Fy
ZHMsCkphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
