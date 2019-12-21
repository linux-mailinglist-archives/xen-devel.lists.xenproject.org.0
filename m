Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A51128660
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 02:44:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiTi9-0007Sp-EA; Sat, 21 Dec 2019 01:37:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mlLp=2L=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1iiTi7-0007Sk-59
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 01:37:39 +0000
X-Inumbo-ID: 786116dc-2392-11ea-b6f1-bc764e2007e4
Received: from mail-qv1-xf43.google.com (unknown [2607:f8b0:4864:20::f43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 786116dc-2392-11ea-b6f1-bc764e2007e4;
 Sat, 21 Dec 2019 01:37:38 +0000 (UTC)
Received: by mail-qv1-xf43.google.com with SMTP id x1so4334738qvr.8
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 17:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p9c7ZuZYgrod1HNoHj2OM9tNP5+bdOo8F8r+9VpjlnA=;
 b=b0x/nkOdJ0tzBKycfS2OWDYNkJ8aOHQJQR8KVZU4SyIk2RJSFMZOwdYByKLoFymJug
 itNO1Hd0IJFof1KGQBxvMVgRM0kOQ0MA2yV0iMPhGx/3s5ZCvqA89PlgCBFPtxKmKMRT
 tZCZcxMR81ErleRElzUtrcrZELXBYaDs1k2aF63QxDdg9sZtyteQ0C/YdBAk1jOl5aBm
 etNn725QBL6qeYn56a+olyhXZIhl5tDrCtbJgTpk7vUokfWx9RjyZqqlrMFyVKCGNHxk
 aub9DB1JKeGpG4UfudnAlajV7ZIcP07aSzkvu0cc7bc7cPkWRszQNKoKJFAuxiURCd7H
 0PpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p9c7ZuZYgrod1HNoHj2OM9tNP5+bdOo8F8r+9VpjlnA=;
 b=fXNCznetoVgJLfL0+91EEtCSE/HhLmSLUEw7g49C6CJN1drpSkpBKawg4hli3TWb+8
 /X4XVWM7/si4UJVFO8TS1tRRetCsUBopMrZwDxKksZmGEab28EoyN7I9XJqy8M1Ccqv8
 jbBf+VMk6ouWhR+EO71NdYdfV6JKuNAX/POOC0pLmfREkyLRYUo8LAgONfMjlT1WqDVX
 O0Rq5uosBrK3rAOTeZ4SiIiV1LQM9f8e+pgq5rRbUEeASKIN2rsyEriu+8r0YKCLHvCw
 R6WvBVZCzPF30VFfF/d1RDBeh6MlJsZTmEBOgOuD4A6wcHPLMomgZ4Xzz2pqKH1Kbawj
 ZAWw==
X-Gm-Message-State: APjAAAWVZLDRHDyDYcVWSxuSSFZq1SCkrxxyx+LL1cbz4oWuQo+idZd0
 loblUi+jFFGnW3jE4ezY8uGjytm9NpROp5lKgKNF3A==
X-Google-Smtp-Source: APXvYqwIq8SkrXXrlTs6Pe28PTqsx/TNdDJdtysZIXNRlvEQJpRBm6N3FHDEORpxu1Udsw6E3FiB+E9DYhmRUAjEUoU=
X-Received: by 2002:ad4:5487:: with SMTP id q7mr15333705qvy.19.1576892257693; 
 Fri, 20 Dec 2019 17:37:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
 <CAMmSBy_EG6=20dHde7AHby48Q8aWoRLAX+LFWTTTuKeHi8M+dg@mail.gmail.com>
 <5db3b29a-2f07-c807-1ee2-503d779548f7@xen.org>
 <alpine.DEB.2.21.1912171029300.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy_EVnfw0yMpevhJ-PqXoKo1GgvojH1SXDMdm4FKGNDQPA@mail.gmail.com>
 <alpine.DEB.2.21.1912171058200.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy-bdEumC=6s6CVFweJWc50nh2-nkEmQ2jtkXjZzziD2_A@mail.gmail.com>
 <alpine.DEB.2.21.1912171737160.12921@sstabellini-ThinkPad-T480s>
 <CAMmSBy8nMc1xj4Lh4emdkxpnwBrYBWh9wOx_muHAuO2rs1HmmQ@mail.gmail.com>
 <CAMmSBy9Djc6CxLnq8br8Ha1HrsHUf8ry5c0U0spbT9YRR+0fZg@mail.gmail.com>
 <d77e7ec8-3b28-ee60-a180-794deb227099@xen.org>
 <CAMmSBy8LT4yZGoGKWTOtEeV4e=9+BQaAx+zFp1oUf6fi1PzY2A@mail.gmail.com>
 <87e4706e-5b7a-1025-5825-376ed801a6e4@xen.org>
 <CAMmSBy_26UqPHeuRC9Jw0g=1oe3jzrsxKsQXs4xB+y3xPLmm-w@mail.gmail.com>
 <86f35bc9-4059-b56f-d77d-c3aa44a75c75@xen.org>
 <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 20 Dec 2019 17:37:26 -0800
Message-ID: <CAMmSBy8B0T1j5XhaHHNXv=HWLKqNNfzb2hP=j+mAR2VOg5Y4sw@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgNDowMSBQTSBTdGVmYW5vIFN0YWJlbGxpbmkKPHNzdGFi
ZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCAxOSBEZWMgMjAxOSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+ID4gPiA+IEluIGZhY3QgbW9zdCBvZiBwZW9wbGUgb24gQXJtIGFyZSB1
c2luZyBHUlVCIHJhdGhlciB0aGFuIEVGSSBkaXJlY3RseSBhcwo+ID4gPiA+IHRoaXMgaXMgbW9y
ZSBmcmllbmRseSB0byB1c2UuCj4gPiA+ID4KPiA+ID4gPiBSZWdhcmRpbmcgdGhlIGRldmljZXRy
ZWUsIFhlbiBhbmQgTGludXggd2lsbCBjb21wbGV0ZWx5IGlnbm9yZSB0aGUKPiA+ID4gPiBtZW1v
cnkgbm9kZXMgaW4gWGVuIGlmIHVzaW5nIEVGSS4gVGhpcyBiZWNhdXNlIHRoZSBFRkkgbWVtb3J5
IG1hcCB3aWxsCj4gPiA+ID4gZ2l2ZSB5b3UgYW4gb3ZlcnZpZXcgb2YgdGhlIHBsYXRmb3JtIHdp
dGggdGhlIEVGSSByZWdpb25zIGluY2x1ZGVkLgo+ID4gPgo+ID4gPiBBaGEhIFNvIGluIHRoYXQg
c2Vuc2UgaXQgaXMgYSBidWcgaW4gWGVuIGFmdGVyIGFsbCwgcmlnaHQ/ICh0aGF0J3Mgd2hhdAo+
ID4gPiB5b3UncmUKPiA+ID4gcmVmZXJyaW5nIHRvIHdoZW4geW91IHNheSB5b3Ugbm93IHVuZGVy
c3RhbmQgd2hhdCBuZWVkcyB0byBnZXQgZml4ZWQpLgo+ID4KPiA+IFllcy4gVGhlIEVGSSBtZW1v
cnkgbWFwIGlzIGEgbGlzdCBvZiBleGlzdGluZyBtZW1vcnkgd2l0aCBhIHR5cGUgYXNzb2NpYXRl
ZCB0bwo+ID4gaXQgKENvbnZlbnRpb25hbCwgQm9vdFNlcnZpY2VDb2RlcywgTWVtb3J5TWFwcGVk
SU8uLi4pLgo+ID4KPiA+IFRoZSBPUy9IeXBlcnZpc29yIHdpbGwgaGF2ZSB0byBnbyB0aHJvdWdo
IHRoZW0gYW5kIGNoZWNrIHdoaWNoIHJlZ2lvbnMgYXJlCj4gPiB1c3VhYmxlLiBDb21wYXJlIHRv
IExpbnV4LCBYZW4gaGFzIGxpbWl0ZWQgaXRzZWxmIHRvIG9ubHkgYSBmZXcgdHlwZXMuCj4gPgo+
ID4gSG93ZXZlciwgSSB0aGluayB3ZSBjYW4gYmUgb24gYSBwYXIgd2l0aCBMaW51eCBoZXJlLgo+
Cj4gSSBnYXZlIGEgbG9vayBhdCB0aGUgTGludXggaW1wbGVtZW50YXRpb24sIHRoZSBpbnRlcmVz
dGluZyBiaXQgaXMKPiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9hcm0taW5pdC5jOmlzX3VzYWJsZV9t
ZW1vcnkgYXMgZmFyIGFzIEkgY2FuIHRlbGwuCj4gSSBhbHNvIGdhdmUgYSBsb29rIGF0IHRoZSBY
ZW4gc2lkZSwgd2hpY2ggaXMKPiB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290Lmg6ZWZpX3Byb2Nl
c3NfbWVtb3J5X21hcF9ib290aW5mby4gQXMgZ3Vlc3NlZCwKPiB0aGUgdHdvIGFyZSBub3QgcXVp
dGUgdGhlIHNhbWUuCj4KPiBPbmUgb2YgdGhlIG1haW4gZGlmZmVyZW5jZXMgaXMgdGhhdCBMaW51
eCB1c2VzIGFzICJTeXN0ZW0gUkFNIiBldmVuCj4gcmVnaW9ucyB0aGF0IHdlcmUgbWFya2VkIGFz
IEVGSV9CT09UX1NFUlZJQ0VTX0NPREUvREFUQSBhbmQKPiBFRklfTE9BREVSX0NPREUvREFUQSBi
ZWNhdXNlIHRoZXkgd2lsbCBnZXQgZnJlZWQgYW55d2F5LiBYZW4gZG9lc24ndAo+IGRvIHRoYXQg
dW5sZXNzIG1hcF9icyBpcyBzZXQuCj4KPiBJIHdyb3RlIGEgcXVpY2sgcGF0Y2ggdG8gaW1wbGVt
ZW50IHRoZSBMaW51eCBiZWhhdmlvciBvbiBYZW4sIG9ubHkKPiBsaWdodGx5IHRlc3RlZC4gSSBj
YW4gY29uZmlybSB0aGF0IEkgc2VlIG1vcmUgbWVtb3J5IHRoaXMgd2F5LiBIb3dldmVyLAo+IEkg
YW0gbm90IHN1cmUgd2UgYWN0dWFsbHkgd2FudCB0byBpbXBvcnQgdGhlIExpbnV4IGJlaGF2aW9y
IHdob2xlc2FsZS4KPgo+IEFueXdheSwgUm9tYW4sIGNvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtu
b3cgaWYgdGhpcyBwYXRjaCBzb2x2ZXMgdGhlCj4gaXNzdWU/CgpUcmllZCB0aGUgYXR0YWNoZWQg
cGF0Y2ggLS0gYnV0IGl0IHNlZW1zIEkgY2FuJ3QgYm9vdCBhdCBhbGwgd2l0aCB0aGlzLiBYZW4K
ZG9lc24ndCBwcmludCBhbnl0aGluZyBvbiB0aGUgY29uc29sZSBlaXRoZXIuCgpUbyBKdWxpZW4n
cyBwb2ludCAtLSBzaG91bGQgSSByZWR1Y2UgdGhlICMgb2YgdHlwZXMgYW5kIHRyeSBhZ2Fpbj8K
ClRoYW5rcywKUm9tYW4uCgo+Cj4KPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZWZpL2Vm
aS1ib290LmggYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPiBpbmRleCBjYTY1NWZmMDAz
Li5hZDE4ZmYzNjY5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+
ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+IEBAIC0xNDksMTAgKzE0OSwxNCBA
QCBzdGF0aWMgRUZJX1NUQVRVUyBfX2luaXQgZWZpX3Byb2Nlc3NfbWVtb3J5X21hcF9ib290aW5m
byhFRklfTUVNT1JZX0RFU0NSSVBUT1IgKgo+Cj4gICAgICBmb3IgKCBJbmRleCA9IDA7IEluZGV4
IDwgKG1tYXBfc2l6ZSAvIGRlc2Nfc2l6ZSk7IEluZGV4KysgKQo+ICAgICAgewo+IC0gICAgICAg
IGlmICggZGVzY19wdHItPlR5cGUgPT0gRWZpQ29udmVudGlvbmFsTWVtb3J5IHx8Cj4gLSAgICAg
ICAgICAgICAoIW1hcF9icyAmJgo+IC0gICAgICAgICAgICAgIChkZXNjX3B0ci0+VHlwZSA9PSBF
ZmlCb290U2VydmljZXNDb2RlIHx8Cj4gLSAgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09
IEVmaUJvb3RTZXJ2aWNlc0RhdGEpKSApCj4gKyAgICAgICAgaWYgKCBkZXNjX3B0ci0+QXR0cmli
dXRlID09IEVGSV9NRU1PUllfV0IgJiYKPiArICAgICAgICAgICAgIChkZXNjX3B0ci0+VHlwZSA9
PSBFZmlDb252ZW50aW9uYWxNZW1vcnkgfHwKPiArICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlw
ZSA9PSBFZmlMb2FkZXJDb2RlIHx8Cj4gKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0g
RWZpTG9hZGVyRGF0YSB8fAo+ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUFD
UElSZWNsYWltTWVtb3J5IHx8Cj4gKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZp
UGVyc2lzdGVudE1lbW9yeSB8fAo+ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVm
aUJvb3RTZXJ2aWNlc0NvZGUgfHwKPiArICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBF
ZmlCb290U2VydmljZXNEYXRhKSApCj4gICAgICAgICAgewo+ICAgICAgICAgICAgICBpZiAoICFt
ZW1pbmZvX2FkZF9iYW5rKCZib290aW5mby5tZW0sIGRlc2NfcHRyKSApCj4gICAgICAgICAgICAg
IHsKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oIGIveGVuL2luY2x1ZGUv
ZWZpL2VmaWRlZi5oCj4gaW5kZXggODZhN2UxMTFiZi4uZjQ2MjA3ODQwZiAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS9lZmkvZWZpZGVmLmgKPiArKysgYi94ZW4vaW5jbHVkZS9lZmkvZWZpZGVm
LmgKPiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIHR5cGVkZWYgZW51bSB7Cj4gICAgICBFZmlNZW1vcnlN
YXBwZWRJTywKPiAgICAgIEVmaU1lbW9yeU1hcHBlZElPUG9ydFNwYWNlLAo+ICAgICAgRWZpUGFs
Q29kZSwKPiArICAgIEVmaVBlcnNpc3RlbnRNZW1vcnksCj4gICAgICBFZmlNYXhNZW1vcnlUeXBl
Cj4gIH0gRUZJX01FTU9SWV9UWVBFOwo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
