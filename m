Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B6E162EF0
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 19:47:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j47qp-0001IX-KV; Tue, 18 Feb 2020 18:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pyH5=4G=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1j47qo-0001IS-Ke
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 18:44:06 +0000
X-Inumbo-ID: a336e560-527e-11ea-bc8e-bc764e2007e4
Received: from mail-lj1-x235.google.com (unknown [2a00:1450:4864:20::235])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a336e560-527e-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 18:44:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q8so24165889ljb.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 10:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=reHQ9S21MelXl3RVuT4m1bRQYeUVL9QsavIrmqD2ecE=;
 b=Ld3s2CgmhyC7JIh5dvzVSoNthy3RwC8gawyg3Hvc8r2CvKH0pBDxs72ZdRzH7R5WSz
 2XPsNHUBoK1sFBtlRHzj3QgsIcWbglVa5zolhZasYWbJMZ2VQ6DVxd+ndswzYsjuE0f6
 P4PCMbIYH8hpwmM6gRxq1WiE8V3o2jvogAnukCEp5P8Ue9mEdBM/iQaYM0YKVj4meFxq
 lJ3GObanYAioSj8OhY4j108ntPJAFrtzFBM277fv7JUg3KN/ybVuzSUO2HsdaOvghiAs
 REkX2ReXXXfGCjzbvG0i4b9H33SDcqLkVY2dMtkHljz/eMwm/p+YfpalNKGoll9XJ7q4
 NsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=reHQ9S21MelXl3RVuT4m1bRQYeUVL9QsavIrmqD2ecE=;
 b=c34kDP6Lb/5ab27BdbZDrG/D2wkguT/c52n6uSVWbGe2/z6vR73CDUMgMoO/ifASjM
 i4KTtbug4SlAnX1uKsOZuO2+HSQnIxbFLnn7b4nBHvZ60tqtgU2QurWFxlcBxXbrgX+c
 oqqZA7dKWvGcmBJYuJ/VUz7I08Q30fCkeUMjoCV9qdiOCZYupKle7yjMhyYy0KwUAoF7
 /YUjXr7rO6EGU7cs0J1XAy8AY3JSe3UTlXWmrsOPf8JrULaa+GaWMkpZE8HB49moMkuk
 0+gtNLpXpV+Mu/AcqtmlRu/GwbfgUZrVqX2SUaSSQa/5eo9i3REr7Ug5ys66W7KQasL5
 tkDA==
X-Gm-Message-State: APjAAAWasYtoyVIWPNrd/wd7WUDMN/tU/aTHNaxtmKhJ3opVHutNJt9H
 HefeD967yePE+nR9wLg43BuwTqtjU0jMLZBSh2M=
X-Google-Smtp-Source: APXvYqxHhOzdXtlbKJpGVYa7da2soQ7+LePFURQKH3DCvC3R7iP6DoDGVG7gWiaUnlfOAxvPuRJ31ksJMccvaZ1HxSI=
X-Received: by 2002:a2e:b5cb:: with SMTP id g11mr13376960ljn.210.1582051443979; 
 Tue, 18 Feb 2020 10:44:03 -0800 (PST)
MIME-Version: 1.0
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
In-Reply-To: <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 18 Feb 2020 13:43:52 -0500
Message-ID: <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Aaron Janse <aaron@ajanse.me>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBGZWIgMTcsIDIwMjAsIDg6MjIgUE0gQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAxNy8wMi8yMDIwIDIwOjQxLCBKYXNvbiBBbmRy
eXVrIHdyb3RlOgo+ID4gT24gTW9uLCBGZWIgMTcsIDIwMjAgYXQgMjo0NiBQTSBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiBPbiAxNy8wMi8yMDIw
IDE5OjE5LCBKYXNvbiBBbmRyeXVrIHdyb3RlOgo+ID4+PiBlbmFibGluZyB2ZWNPbiBUdWUsIERl
YyAzMSwgMjAxOSBhdCA1OjQzIEFNIEFhcm9uIEphbnNlIDxhYXJvbkBhamFuc2UubWU+IHdyb3Rl
Ogo+ID4+Pj4gT24gVHVlLCBEZWMgMzEsIDIwMTksIGF0IDEyOjI3IEFNLCBBbmRyZXcgQ29vcGVy
IHdyb3RlOgo+ID4+Pj4+IElzIHRoZXJlIGFueSBmdWxsIGJvb3QgbG9nIGluIHRoZSBiYWQgY2Fz
ZT8gIERlYnVnZ2luZyB2aWEgZGl2aW5hdGlvbgo+ID4+Pj4+IGlzbid0IGFuIGVmZmVjdGl2ZSB3
YXkgdG8gZ2V0IHRoaW5ncyBkb25lLgo+ID4+Pj4gQWdyZWVkLiBJIGluY2x1ZGVkIHNvbWUgbW9y
ZSB2ZXJib3NlIGxvZ3MgdG93YXJkcyB0aGUgZW5kIG9mIHRoZSBlbWFpbCAodHlwZWQgdXAgYnkg
aGFuZCkuCj4gPj4+Pgo+ID4+Pj4gQXR0YWNoZWQgYXJlIHBpY3R1cmVzIGZyb20gYSBzbG93LW1v
dGlvbiB2aWRlbyBvZiBteSBsYXB0b3AgYm9vdGluZy4gTm90ZSB0aGF0IEkgYWxzbyBpbmNsdWRl
ZCBhIHBpY3R1cmUgb2YgYSBzdGFjayB0cmFjZSB0aGF0IGhhcHBlbnMgaW1tZWRpYXRlbHkgYmVm
b3JlIHJlYm9vdC4gSXQgZG9lc24ndCBsb29rIHJlbGF0ZWQsIGJ1dCBJIHdhbnRlZCB0byBpbmNs
dWRlIGl0IGFueXdheS4KPiA+Pj4+Cj4gPj4+PiBJIHRoaW5rIHRoZSBvcmlnaW5hbCBlbWFpbCBz
aG91bGQgaGF2ZSBzYWlkICI0LjguNSIgaW5zdGVhZCBvZiAiNC4wLjUuIiBSZWdhcmRsZXNzLCBl
dmVyeW9uZSBvbiB0aGlzIG1haWxpbmcgbGlzdCBjYW4gbm93IHNlZSBhbGwgdGhlIGJvb3QgbG9n
cyB0aGF0IEkndmUgc2Vlbi4KPiA+Pj4+Cj4gPj4+PiBBdHRhY2hpbmcgYSBzZXJpYWwgY29uc29s
ZSBzZWVtcyBsaWtlIGl0IHdvdWxkIGJlIGRpZmZpY3VsdCB0byBkbyBvbiB0aGlzIGxhcHRvcCwg
b3RoZXJ3aXNlIEkgd291bGQgaGF2ZSBzZW50IHRoZSBsb2dzIGFzIGEgdHh0IGZpbGUuCj4gPj4+
IEknbSBzZWVpbmcgWGVuIHBhbmljOiAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29yayIgb24g
YSBEZWxsCj4gPj4+IExhdGl0dWRlIDcyMDAgMi1pbi0xLiAgRmVkb3JhIDMxIExpdmUgVVNCIGlt
YWdlIGJvb3RzIHN1Y2Nlc3NmdWxseS4KPiA+Pj4gTm8gd2F5IHRvIGdldCBzZXJpYWwgb3V0cHV0
LiAgSSBtYW51YWxseSByZWNyZWF0ZWQgdGhlIG91dHB1dCBiZWZvcmUKPiA+Pj4gZnJvbSB0aGUg
dmdhIGRpc3BsYXkuCj4gPj4gV2UgaGF2ZSBtdWx0aXBsZSBidWdzLgo+ID4+Cj4gPj4gRmlyc3Qg
YW5kIGZvcmVtb3N0LCBYZW4gc2VlbXMgdG90YWxseSBicm9rZW4gd2hlbiBydW5uaW5nIGluIEV4
dElOVAo+ID4+IG1vZGUuICBUaGlzIG5lZWRzIGFkZHJlc3NpbmcsIGFuZCBvdWdodCB0byBiZSBz
dWZmaWNpZW50IHRvIGxldCBYZW4KPiA+PiBib290LCBhdCB3aGljaCBwb2ludCB3ZSBjYW4gdHJ5
IHRvIGZpZ3VyZSBvdXQgd2h5IGl0IGlzIHRyeWluZyB0byBmYWxsCj4gPj4gYmFjayBpbnRvIDQ4
Nihpc2gpIGNvbXBhdGliaWxpdHkgbW9kZS4KClhlbiBoYXMgImVuYWJsZWQgRXh0SU5UIG9uIENQ
VSMwIiB3aGlsZSBsaW51eCBoYXMgIm1hc2tlZCBFeHRJTlQgb24KQ1BVIzAiIHNvIGxpbnV4IGlz
bid0IHVzaW5nIEV4dElOVD8KCkkgY29weSBhbmQgcGFzdGVkIHRoZSBsaW51eCBzZXR1cF9sb2Nh
bF9BUElDKCkgaW50byBYZW4gYW5kIHRoZW4KbWFzc2FnZWQgaXQgaW50byBjb21waWxpbmcsICBO
b3cgWGVuIHJlcG9ydHMgbWFza2VkIEV4dElOVCwgYnV0IHN0aWxsCmZhaWxzIHRvIGVuYWJsZSB0
aGUgdGltZXIuCgo+ID4+PiBJIHRlc3RlZCBMaW51eCB3aXRoIGludGVsX2lvbW11PW9uIGFuZCB0
aGF0IGJvb3RlZCBzdWNjZXNzZnVsbHkuCj4gPj4+IFVuZGVyIFhlbiwgdGhpcyBzeXN0ZW0gc2V0
cyBpb21tdV94MmFwaWNfZW5hYmxlZCA9IHRydWUsIHNvCj4gPj4+IGZvcmNlX2lvbW11IGlzIHNl
dCBhbmQgaW9tbXU9MCBjYW5ub3QgZGlzYWJsZSB0aGUgaW9tbXUuCj4gPj4+IGZhaWxzLiAgT2gs
IEkgY2FuIGRpc2FibGUgeDJhcGljIGFuZCB0aGVuIGRpc2FibGUgaW9tbXUKPiA+Pj4KPiA+Pj4g
eDJhcGljPTEgLT4gZmFpbHVyZSBhYm92ZQo+ID4+PiB4MmFwaWM9MCBpb21tdT0wIC0+IGZhaWx1
cmUgYWJvdmUKPiA+Pj4gY2xvY2tzb3VyY2U9YWNwaSAtPiBkb2Vzbid0IGhlbHAKPiA+Pj4gY2xv
Y2tzb3VyY2U9cGl0IC0+IGhhbmdzIGFmdGVyICJsb2FkIHRyYWNraW5nIHdpbmRvdyBsZW5ndGgg
MTA3Mzc0MTgyNCBucyIKPiA+PiBOb25lIG9mIHRoZXNlIGFyZSBzdXJwcmlzaW5nLCBnaXZlbiB0
aGF0IFhlbiBjYW4ndCBtYWtlIGFueSBpbnRlcnJ1cHRzCj4gPj4gd29yayBhdCBhbGwuCj4gPj4K
PiA+Pj4gbm9hcGljIC0+IEJVRyBpbiBpbml0X2JzcF9BUElDCj4gPj4gVGhpcyBpcyBhIHN1cnBy
aXNlLiAgSXRzIGNsZWFybHkgYSBidWcgaW4gWGVuLiAgKE9UT0gsIEkndmUgYmVlbgo+ID4+IHRo
cmVhdGVuaW5nIHRvIHJpcCBhbGwgb2YgdGhhdCBsb2dpYyBvdXQsIGJlY2F1c2UgdGhlcmUgaXMg
bm8gc3VjaCB0aGluZwo+ID4+IGFzIGEgNjRiaXQgY2FwYWJsZSBzeXN0ZW0gd2l0aG91dCBhbiBp
bnRlZ3JhdGVkIEFQSUMuKQo+ID4gSXQncyBhIEdQRiBbZXJyb3JfY29kZT0wMDAwXSBhdCBpbml0
X2JzcF9BUElDKzB4NTMgd2hpY2ggaXMKPiA+ICAgICAweGZmZmY4MmQwODA0MjhmODYgPCs2ND46
ICAgIGplICAgICAweGZmZmY4MmQwODA0MjhmYzkgPGluaXRfYnNwX0FQSUMrMTMxPgo+ID4gICAg
IDB4ZmZmZjgyZDA4MDQyOGY4OCA8KzY2PjogICAgb3IgICAgICQweGZmLCVhbAo+ID4gICAgIDB4
ZmZmZjgyZDA4MDQyOGY4YSA8KzY4PjogICAgdGVzdCAgICVzaWwsJXNpbAo+ID4gICAgIDB4ZmZm
ZjgyZDA4MDQyOGY4ZCA8KzcxPjogICAgamUgICAgIDB4ZmZmZjgyZDA4MDQyOGZkOCA8aW5pdF9i
c3BfQVBJQysxNDY+Cj4gPiAgICAgMHhmZmZmODJkMDgwNDI4ZjhmIDwrNzM+OiAgICBtb3YgICAg
JDB4ODBmLCVlY3gKPiA+ICAgICAweGZmZmY4MmQwODA0MjhmOTQgPCs3OD46ICAgIG1vdiAgICAk
MHgwLCVlZHgKPiA+ICAgICAweGZmZmY4MmQwODA0MjhmOTkgPCs4Mz46ICAgIHdybXNyCj4gPgo+
ID4gUkFYIGlzIDB4M2ZmCj4gPgo+ID4gVGhpcyBpcyBpbW1lZGlhdGVseSBhZnRlciBYZW4gcHJp
bnRzICJTd2l0Y2hlZCB0byBBUElDIGRyaXZlciB4MmFwaWNfY2x1c3RlciIKPgo+IEhtbSwgaW4g
d2hpY2ggY2FzZSBpdCBpc24ndCBhIEJVRyBzcGVjaWZpY2FsbHksIGJ1dCBtZXJlbHkgYSBjcmFz
aC4KPiAweDNmZiB0byBTUElWIGlzIHRyeWluZyB0byBzZXQgcmVzZXJ2ZWQgYml0cywgc28gaXQg
aXMgbm8gc3VycHJpc2UgdGhhdAo+IHRoZXJlIGlzIGEgI0dQLgoKWWVhaCwgSSB1c2VkIHRoZSB3
cm9uZyB3b3JkLiAgVGhlcmUgd2FzIGEgYmFja3RyYWNlIGFuZCBpdCByZWJvb3RlZApxdWlja2x5
LCBzbyBJIGRpZG4ndCBoYXZlIGRldGFpbHMgd2hlbiBJIHdyb3RlIHRoZSBmaXJzdCBlbWFpbC4g
IEkKcmUtcmFuIGFmdGVyd2FyZCB0byBjYXB0dXJlIHRoZSBpbmZvLgoKPiBJbiB3aGljaCBjYXNl
IHRoaXMgY2FuIHNhZmVseSBiZSBmaWxlZCB1bmRlciAiZXZlbiBtb3JlIGNvbGxhdGVyYWwKPiBk
YW1hZ2UgZnJvbSBmYWlsaW5nIHRvIHNldCB1cCBhbnkga2luZCBvZiBpbnRlcnJ1cHQgaGFuZGxp
bmciLgo+Cj4gPj4+IE9uZSBvdGhlciB0aGluZyB0aGF0IG1pZ2h0IGJlIG5vdGV3b3J0aHkuICBM
aW51eCBvbmx5IHByaW50cyBBQ1BJIElSUTAKPiA+Pj4gYW5kIElSUTkgdXNlZCBieSBvdmVycmlk
ZSB3aGVyZSBYZW4gbGlzdHMgSVJRIDAsIDIgJiA5Lgo+ID4+IEh1aCAtIHRoaXMgaXMgc3VwcG9z
ZWQgdG8gY29tZSBkaXJlY3RseSBmcm9tIHRoZSBBQ1BJIHRhYmxlcywgc28gTGludXgKPiA+PiBh
bmQgWGVuIHNob3VsZCBiZSB1c2luZyB0aGUgc2FtZSBzb3VyY2Ugb2YgaW5mb3JtYXRpb24uCj4g
Pj4KPiA+Pj4gQmVsb3cgaXMgdGhlIHJlLWNvbnN0cnVjdGVkIFhlbiBjb25zb2xlIG91dHB1dC4g
IFRoZSBTTUJJT1MgbGluZSBpcwo+ID4+PiB0aGUgZmlyc3QgdGhpbmcgZGlzcGxheWVkIG9uIHRo
ZSBWR0Egb3V0cHV0Lgo+ID4+IFllcyAtIGl0IGlzIHRoZSBmaXJzdCB0aGluZyBwcmludGVkIGFm
dGVyIHZlc2FfaW5pdCgpIHdoaWNoIEkgdGhpbmsgaXMgYQo+ID4+IG1hbmlmZXN0YXRpb24gb2Yg
YSBwcmV2aW91cyBFRkkgYnVnIEkndmUgcmVwb3J0ZWQuICBEb2VzIGJvb3Rpbmcgd2l0aAo+ID4+
IC1iYXNldmlkZW8gaGVscD8gIChObyBuZWVkIHRvIHRyYW5zY3JpYmUgdGhlIG91dHB1dCwgbWFu
dWFsbHkuICBKdXN0Cj4gPj4gbmVlZCB0byBrbm93IGlmIGl0IGxldHMgeW91IHNlZSB0aGUgZnVs
bCBsb2cuKQo+ID4gSSdtIGJvb3RpbmcgZ3J1Yi0+eGVuLmd6IHNvIC1iYXNldmlkZW8gaXNuJ3Qg
ZGlyZWN0bHkgYXBwbGljYWJsZS4gIE15Cj4gPiBhdHRlbXB0IGF0IHNldHRpbmcgYSBib290IGVu
dHJ5IGZhaWxlZCwgc28gSSdsbCBoYXZlIHRvIHRyeSB0aGF0Cj4gPiBhZ2Fpbi4KPgo+IEFoIG9r
LiAgT25lIHRoaW5nIHdoaWNoIFhlbiguZ3opIG5lZWRzIHRvIGRvIGlzIHRvIHRha2UgdmlkZW8g
ZGV0YWlscwo+IGZyb20gdGhlIGJvb3Rsb2FkZXIgcmF0aGVyIHRoYW4gdHJ5aW5nIHRvIGZpZ3Vy
ZSB0aGVtIG91dCBpdHNlbGYuCj4KPiBCeSBkZWZhdWx0LCBYZW4uZ3ogd2lsbCB0cnkgYW5kIHdy
aXRlIGludG8gdGhlIGxlZ2FjeSB2Z2EgcmFuZ2Ugd2hpY2gKPiBtb3N0IGxpa2VseSBpc24ndCB3
b3JraW5nIGluIGFuIEVGSSBzeXN0ZW0uCj4KPiAoQXMgYSBzbGlnaHQgdGFuZ2VudCwgSXQgaXMg
cG9zc2libGUgdG8gdGVzdCB4ZW4uZWZpIHZpYSBncnViIHdpdGggYQo+IHN1aXRhYmxlIGNoYWlu
bG9hZGVyIHN0YW56YSwgYnV0IHhlbi5lZmkgaXMgZGVmaWNpZW50IGluIGVub3VnaAo+IGltcG9y
dGFudCB3YXlzIHRoYXQgSSdkIGF2b2lkIGl0IHVubGVzcyBhYnNvbHV0ZWx5IG5lY2Vzc2FyeS4p
CgpJIHRoaW5rIEkgdHJpZWQgY2hhaW5sb2FkZXIgYXQgc29tZSBwb2ludCBhbmQgcmVjZWl2ZWQg
YW4gIlVuc3VwcG9ydGVkCnJlbG9jYXRpb24gdHlwZSIgZXJyb3IuCgpUaGlzIERlbGwgZG9lc24n
dCB3YW50IHRvIGJvb3QgbXkgeGVuLmVmaS4gIEFmdGVyIHNlbGVjdGluZyBhIGJvb3QKZW50cnks
IHRoZXJlIGlzIGEgMy00IHNlY29uZCBwYXVzZSBhbmQgdGhlbiBFRkkgcHJpbnRzICAiUHJlc3MK
RjEvVm9sdW1lVXAga2V5IHRvIHJldHJ5IGJvb3QuIgoKLUphc29uCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
