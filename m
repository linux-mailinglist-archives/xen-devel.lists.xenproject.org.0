Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CD12D367
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 03:38:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVnUX-0002UV-7J; Wed, 29 May 2019 01:34:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YOWO=T5=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hVnUV-0002UO-IX
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 01:34:55 +0000
X-Inumbo-ID: f5cda044-81b1-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f5cda044-81b1-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 01:34:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1559093694; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=PyhOAjOt0t83C39kTbfYKUsQB1EV+5bAFehqC53g1b8=;
 b=IAhQaMqnAFlxkIGXr1Vf6Kz5OECeJm0MT0Cola7KbWGzmMm25ETnCMZOH+v0AVcaN3pRuLGa
 /4qRTlCqivf+xFFqL5wawPqED+bbyyRKX9TEmaUVQhHWYGwA5MtmM5J7tmNOqzz/GbZMCFQE
 srstthXi1BV+5HZplQtan2eYrZ0=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mxa.mailgun.org with ESMTP id 5cede1bd.7f9f7d6d5fb0-smtp-out-n02;
 Wed, 29 May 2019 01:34:53 -0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id j24so778195ljg.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2019 18:34:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWU/v21ROHObjWIPgzwZLlZf2EdGBzU5ToID0Z/Yo8HonzgKAVT
 B+4BuBf2MM1tqEPKzd/6Qtg3HQq3zZB00gYm9ng=
X-Google-Smtp-Source: APXvYqygKJf6NUCe9gLb/lMzgeSDKCAbmPMCoArfgWGxXBsDmn5uBf4qBmW4Kz9Iw5kB4fZzFWl/usjgG86tTSfPFlw=
X-Received: by 2002:a2e:87c9:: with SMTP id v9mr39334728ljj.100.1559093691396; 
 Tue, 28 May 2019 18:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
 <rQKAjmE5sqmoHfveLrCC3tRz7edgAIkDUG5CRgmBhF975OXX_8ZdIsCFturwHzr04jeYiq5MPE5gHG3SeltMz5ZnrIs0XcO0QO_OXeBGhTg=@protonmail.com>
 <cf45071e-19dd-7afb-b9cf-55bb425d0908@citrix.com>
 <VDYDkg9Ke3s5AvTA6Dxcn9OU8vKyA-VlOf0K5B_IRIQs0F9B-XSWYjDPcQ-_TIe3qbVy410qpk5cIcL6KXYJAIr31L2qAr1ryodOkQSiUvk=@protonmail.com>
 <0b97ca78-81f3-a45e-a651-05d2a420dc83@citrix.com>
In-Reply-To: <0b97ca78-81f3-a45e-a651-05d2a420dc83@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 28 May 2019 18:34:14 -0700
X-Gmail-Original-Message-ID: <CABfawhm3Qt6PNCHqR=u9_Q=UCGvQmftrcpoMLxa=sdNaPJmEiw@mail.gmail.com>
Message-ID: <CABfawhm3Qt6PNCHqR=u9_Q=UCGvQmftrcpoMLxa=sdNaPJmEiw@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [VMI] Possible race-condition in altp2m APIs
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBBbmQgc29tZSBxdWVzdGlvbnMuCj4KPiAxKSBJJ20gZ3Vlc3NpbmcgdGhlIGRyYWt2dWZfaW5q
ZWN0X3RyYXAoZHJha3Z1ZiwgMHgyOTNlNmEwLCAwKSBjYWxsIGlzIHNwZWNpZmljIHRvIHRoZSBl
eGFjdCB3aW5kb3dzIGtlcm5lbCBpbiB1c2U/Cj4KPiAyKSBJbiB2bWlfaW5pdCgpLCB3aGF0IGlz
IHRoZSBwdXJwb3NlIG9mIGZtYXNrIGFuZCB6ZXJvX3BhZ2VfZ2ZuPyAgWW91IGFkZCBvbmUgZXh0
cmEgZ2ZuIHRvIHRoZSBndWVzdCwgY2FsbGVkIHplcm9fcGFnZSwgYW5kIGZpbGwgaXQgd2l0aCAx
J3MgZnJvbSBmbWFzay4KPgo+IDMpIFlvdSBjcmVhdGUgdHdvIGFsdHAybSdzLCBidXQgYm90aCBo
YXZlIHRoZSBzYW1lIGRlZmF1bHQgYWNjZXNzLiAgSXMgdGhpcyBkZWxpYmVyYXRlLCBvciBhIGJ1
Zz8gIElmIGRlbGliZXJhdGUsIHdoeT8KPgo+IEZpbmFsbHksIGFuZCBwcm9iYWJseSB0aGUgc291
cmNlIG9mIHRoZSBtZW1vcnkgY29ycnVwdGlvbi4uLgo+Cj4gNCkgV2hlbiBpbmplY3RpbmcgYSB0
cmFwLCB5b3UgYWxsb2NhdGUgYSBuZXcgZ2ZuLCBtZW1jcHkoKSB0aGUgY29udGVudHMgYW5kIGlu
c2VydCBhIDB4Y2MgKHNvIGZhciBzbyBnb29kKS4gIFlvdSB0aGVuIHJlbWFwIHRoZSBleGVjdXRh
YmxlIHZpZXcgdG8gcG9pbnQgYXQgdGhlIG5ldyBnZm4gd2l0aCBhIGJyZWFrcG9pbnQgaW4gKGZp
bmUpLCBhbmQgcmVtYXAgdGhlIHJlYWRhYmxlIHZpZXcgdG8gcG9pbnQgYXQgdGhlIHplcm9fcGFn
ZSwgd2hpY2ggaXMgZnVsbCBvZiAxJ3MgKHVoLW9oKS4KPgo+IFdoYXQgaXMgdGhpcyBmaW5hbCBz
dGVwIHRyeWluZyB0byBhY2hpZXZlPyAgSXQgZ3VhcmFudGVlcyB0aGF0IHBhdGNoLWd1YXJkIHdp
bGwgZXZlbnR1YWxseSBub3RpY2UgYW5kIEJTT0QgeW91ciBWTSBmb3IgY3JpdGljYWwgc3RydWN0
dXJlIGNvcnJ1cHRpb24uICBUaGUgcmVhZC1vbmx5IHZpZXcgbmVlZHMgdG8gcG9pbnQgdG8gdGhl
IG9yaWdpbmFsIGdmbiB3aXRoIG9ubHkgcmVhZCBwZXJtaXNzaW9ucywgc28gd2hlbiBXaW5kb3dz
IHJlYWRzIHRoZSBnZm4gYmFjaywgaXQgc2VlcyB3aGF0IGl0IGV4cGVjdHMuICBZb3UgYWxzbyBu
ZWVkIHRvIHByb2hpYml0IHdyaXRlcyB0byBlaXRoZXIgZ2ZuIHNvIHlvdSBjYW4gc3BvdCB3cml0
ZXMgKHVubGlrZWx5IGluIHRoaXMgY2FzZSBidXQgaW1wb3J0YW50IGZvciBnZW5lcmFsIGludHJv
c3BlY3Rpb24pIHNvIHlvdSBjYW4gcHJvcGFnYXRlIHRoZSBjaGFuZ2UgdG8gYm90aCBjb3BpZXMu
CgpJIGNhbiBhbnN3ZXIgdGhlc2UgcXVlc3Rpb25zIGJhc2VkIG9uIGhvdyBJJ3ZlIHNldCBpdCB1
cCBpbiBEUkFLVlVGCihoYXZlbid0IGNoZWNrZWQgTWF0aGl1ZSdzIGltcGxlbWVudGF0aW9uIGFu
ZCBJIHdvbid0IGJlIGFibGUgZm9yIGEKd2hpbGUgYXMgSSdtIHRyYXZlbGluZyBhdCB0aGUgbW9t
ZW50KS4gVGhlIHJlYXNvbiB3ZSBoYXZlIG11bHRpcGxlIEVQVAp2aWV3cyBpcyB0byBtYWtlIGl0
IGFsbCBtdWx0aS12Q1BVIHNhZmUuIFN3YXBwaW5nIHRoZSB2aWV3cyBhcm91bmQgY2FuCmJlIGRv
bmUgcGVyLXZDUFUgYW5kIHdlIGRvbid0IGhhdmUgdG8gcmVtb3ZlL3JlYXBwbHkgYnJlYWtwb2lu
dHMgYWxsCnRoZSB0aW1lIGFuZCBwYXVzZSB0aGUgZW50aXJlIGRvbWFpbiB3aGlsZSBkb2luZyBz
by4KClRoZXJlIGFyZSB0aHJlZSB2aWV3cyBiZWluZyB1c2VkOiB0aGUgZGVmYXVsdCAoaG9zdHAy
bSk7IHRoZQpleGVjdXRlLXZpZXcgd2hpY2ggaXMgYWN0aXZlIGJ5IGRlZmF1bHQgYW5kIGhhcyB0
aGUgcmVtYXBwZWQKc2hhZG93LWNvcGllcyBvZiB0aGUgcGFnZXMgd2l0aCBicmVha3BvaW50cyBp
bmplY3RlZCBhdCB0aGUgdmVyeSBlbmQKb2YgdGhlIGd1ZXN0cycgcGh5c21hcDsgYW5kIHRoZSBy
ZWFkLW9ubHkgdmlldyB0aGF0IGlzIG9ubHkgdXNlZCB3aGVuCnNvbWVvbmUgaXMgdHJ5aW5nIHRv
IHJlYWQgdGhlIGFjdHVhbCBhZGRyZXNzIG9mIGEgc2hhZG93LWNvcHkgYXQgdGhlCmVuZCBvZiB0
aGUgcGh5c21hcCAoaWUuIG5vdCB2aWEgdGhlIHJlbWFwcGVkIGdmbikuCgpUaGUgcmVhZC1vbmx5
IHZpZXcgaGFzIGFsbCBzaGFkb3ctY29weSBnZm4ncyByZW1hcHBlZCB0byB0aGF0IG9uZSBwYWdl
CmZ1bGwgb2YgMSdzLCBiZWNhdXNlIGlmIHlvdSByZWFkIHJhbmRvbSBsYXJnZSBnZm4ncyBpbiB0
aGUgZ3Vlc3RzJwptZW1vcnkgc3BhY2UgdGhhdCdzIHdoYXQgWGVuJ3MgZW11bGF0b3IgcmV0dXJu
cy4gSXQgaXMgY2FsbGVkCnplcm9fcGFnZSBiZWNhdXNlIEkgb3JpZ2luYWxseSBndWVzc2VkIHRo
YXQgdGhvc2UgcGFnZXMgc2hvdWxkIGJlIGFsbAowIGJ1dCBpdCB0dXJuZWQgb3V0IEkgd2FzIHdy
b25nLiBKdXN0IGhhdmVuJ3QgY2hhbmdlIHRoZSBuYW1lIG9mIGl0CnlldC4gVGhpcyBwYWdlIGlz
IHRoZXJlIGJlY2F1c2Ugd2Ugd2FudCB0byBhdm9pZCBzb21lb25lIGJlaW5nIGFibGUgdG8KZmlu
ZCBvdXQgdGhhdCB0aGVyZSBhcmUgc2hhZG93IHBhZ2VzIHByZXNlbnQuIEl0IHdvdWxkIGJlIHF1
aXRlCm9idmlvdXMgc29tZXRoaW5nIGlzICJvZGQiIHdoZW4geW91IGNhbiBmaW5kIGNvcGllcyBv
ZiB0aGUgV2luZG93cwprZXJuZWwgbWVtb3J5IHBhZ2VzIGF0IHRoZSBlbmQgb2YgdGhlIG1lbW9y
eSBzcGFjZS4gU28gdGhlIHNoYWRvdwpwYWdlcycgcmVhbCBHRk4gbWVtX2FjY2VzcyBpcyByZXN0
cmljdGVkIGluIHRoZSBleGVjdXRlIHZpZXcsIHdoaWNoCmFsbG93cyB1cyB0byBzd2l0Y2ggdG8g
dGhlIHJlYWQtb25seSB2aWV3IHdpdGggTVRGIGVuYWJsZWQgYW5kIHRoZW4KYmFjayBhZnRlcndh
cmRzLiBUaGF0IHdheSB0aGUgc2hhZG93IHBhZ2VzIGFyZSBub3QgdmlzaWJsZSB0byB0aGUKZ3Vl
c3QsIGlmIHNvbWVvbmUgdHJpZXMgdG8gcmVhZCB0aGVtIHRoZXkgcmV0dXJuIHRoZSBzYW1lIHZh
bHVlIGFuZApiZWhhdmUgdGhlIHNhbWUgYXMgYWxsIG90aGVyIHVubWFwcGVkIGdmbidzIGluIHRo
YXQgbWVtb3J5IHJlZ2lvbi4KClNvIHNpbmNlIHRoZSByZWFkLW9ubHkgdmlldyB3aXRoIGFsbCB0
aGUgMSdzIGlzIHJhcmVseSB1c2VkLCBsZXQncwp0YWxrIGFib3V0IHdoeSBwYXRjaGd1YXJkIGNh
bid0IG5vdGljZSBjaGFuZ2VzIHRvIHRoZSBrZXJuZWw6IHRoZQpleGVjdXRlLXZpZXcgaGFzIGFs
bCBwYWdlcyB0aGF0IHdlcmUgYnJlYWtwb2ludGVkIHJlbWFwcGVkIGFuZCBtYXJrZWQKZXhlY3V0
ZS1vbmx5LiBXaGVuIHBhdGNoZ3VhcmQgdHJpZXMgdG8gcmVhZCB0aGVzZSBwYWdlcywgdGhlIHZp
ZXcgaXMKc3dhcHBlZCBiYWNrIHRvIHRoZSBob3N0cDJtIHdpdGggTVRGIGVuYWJsZWQuIFRoZW4g
aW4gdGhlIE1URiBjYWxsYmFjawp0aGUgdmlldyBpcyBzd2FwcGVkIGJhY2sgdG8gdGhlIGV4ZWN1
dGUtdmlldy4gVGhpcyBtZWFucyB0aGF0CnBhdGNoZ3VhcmQgb25seSBldmVyIHJlYWRzIHRoZSBv
cmlnaW5hbCBwYWdlIGZyb20gdGhlIGhvc3RwMm0uIElmIHRoZQpwYWdlIGlzIGJlaW5nIHdyaXR0
ZW4gdG8sIHRoZSBzYW1lIGRhbmNlIGhhcHBlbnMgd2l0aCB0aGUgYWRkaXRpb24gb2YKdGhlIHdo
b2xlIHBhZ2UgYmVpbmcgcmUtY29waWVkIHRvIHRoZSBzaGFkb3cgbG9jYXRpb24gYW5kIHRoZQpi
cmVha3BvaW50cyBiZWluZyByZWFwcGxpZWQgb24gdGhlIHNoYWRvdyBjb3B5LiBUaGlzIGNvcHkg
aGFwcGVucwp3aGlsZSB0aGUgd2hvbGUgZG9tYWluIGlzIHBhdXNlZCB0byBhdm9pZCByYWNlLWNv
bmRpdGlvbi4KCkkgaG9wZSB0aGlzIG1ha2VzIHNlbnNlLgoKVGFtYXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
