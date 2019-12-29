Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8012C750
	for <lists+xen-devel@lfdr.de>; Sun, 29 Dec 2019 19:04:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilcsc-0005xZ-Ny; Sun, 29 Dec 2019 18:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ck7v=2T=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ilcsb-0005xT-Pa
 for xen-devel@lists.xenproject.org; Sun, 29 Dec 2019 18:01:29 +0000
X-Inumbo-ID: 37d9fcf8-2a65-11ea-a1e1-bc764e2007e4
Received: from mail-ed1-f66.google.com (unknown [209.85.208.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37d9fcf8-2a65-11ea-a1e1-bc764e2007e4;
 Sun, 29 Dec 2019 18:01:21 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id c26so30501994eds.8
 for <xen-devel@lists.xenproject.org>; Sun, 29 Dec 2019 10:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sa4XgXA9WHLofHS6BMsnfBOsURqYXSZScKGrUhtAl3Y=;
 b=d6CBlwkbPLqBLNT2kEX0vRp5B9u7IPjuEqEvVJtXCSxCC1nDXa8rq6vDhtOoakmTp5
 ZEg5Iton5gAcNLZAJLnsN87mutbf+l/G63jDJF1zDviRfkC3G3OjSsBjbfntMxQPqvIl
 R3OuFU4HATK5sZL3lSWPOu78seTnbXp4QJBAeIl5n6EwGa252rvB1UetEnyuxh051JcN
 ++pBBGlMSW/JuDzS4wgy2pKJPgCwe2xzIYYIdbNeRNe5KTL7o1Q0uGd1XkgKZnSl2UcO
 12v+LZcFrBX+znMhQeXt/6CGneXO1+xKc0jMnI17VG/0NEyCqALTCLTiKsQSYn1JLUMB
 WUMQ==
X-Gm-Message-State: APjAAAUFxPq1Uv1ZRdSmG1YaG/80kEyUKYq/D+G+koUQagaQ3BmwtPGz
 hR3qGStTkuYKlNkz/BAvUc4=
X-Google-Smtp-Source: APXvYqxi9Sw2AfkdCyLfWNqdG4P7NVpLghoeQJA6+HignatnbMYp1OQsX+/0iNJhl7jeTfR5RDpw0Q==
X-Received: by 2002:a17:906:a950:: with SMTP id
 hh16mr65863327ejb.75.1577642480082; 
 Sun, 29 Dec 2019 10:01:20 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-231.amazon.com.
 [54.240.197.231])
 by smtp.gmail.com with ESMTPSA id t19sm5198693ejs.17.2019.12.29.10.01.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Dec 2019 10:01:19 -0800 (PST)
To: Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
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
 <CAMmSBy8B0T1j5XhaHHNXv=HWLKqNNfzb2hP=j+mAR2VOg5Y4sw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5d085390-15e0-4a62-ea0b-ee9ddd428d6d@xen.org>
Date: Sun, 29 Dec 2019 18:01:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAMmSBy8B0T1j5XhaHHNXv=HWLKqNNfzb2hP=j+mAR2VOg5Y4sw@mail.gmail.com>
Content-Language: en-GB
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMS8xMi8yMDE5IDAxOjM3LCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+IE9uIFRo
dSwgRGVjIDE5LCAyMDE5IGF0IDQ6MDEgUE0gU3RlZmFubyBTdGFiZWxsaW5pCj4gPHNzdGFiZWxs
aW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+PiBPbiBUaHUsIDE5IERlYyAyMDE5LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4+Pj4+IEluIGZhY3QgbW9zdCBvZiBwZW9wbGUgb24gQXJtIGFyZSB1c2lu
ZyBHUlVCIHJhdGhlciB0aGFuIEVGSSBkaXJlY3RseSBhcwo+Pj4+PiB0aGlzIGlzIG1vcmUgZnJp
ZW5kbHkgdG8gdXNlLgo+Pj4+Pgo+Pj4+PiBSZWdhcmRpbmcgdGhlIGRldmljZXRyZWUsIFhlbiBh
bmQgTGludXggd2lsbCBjb21wbGV0ZWx5IGlnbm9yZSB0aGUKPj4+Pj4gbWVtb3J5IG5vZGVzIGlu
IFhlbiBpZiB1c2luZyBFRkkuIFRoaXMgYmVjYXVzZSB0aGUgRUZJIG1lbW9yeSBtYXAgd2lsbAo+
Pj4+PiBnaXZlIHlvdSBhbiBvdmVydmlldyBvZiB0aGUgcGxhdGZvcm0gd2l0aCB0aGUgRUZJIHJl
Z2lvbnMgaW5jbHVkZWQuCj4+Pj4KPj4+PiBBaGEhIFNvIGluIHRoYXQgc2Vuc2UgaXQgaXMgYSBi
dWcgaW4gWGVuIGFmdGVyIGFsbCwgcmlnaHQ/ICh0aGF0J3Mgd2hhdAo+Pj4+IHlvdSdyZQo+Pj4+
IHJlZmVycmluZyB0byB3aGVuIHlvdSBzYXkgeW91IG5vdyB1bmRlcnN0YW5kIHdoYXQgbmVlZHMg
dG8gZ2V0IGZpeGVkKS4KPj4+Cj4+PiBZZXMuIFRoZSBFRkkgbWVtb3J5IG1hcCBpcyBhIGxpc3Qg
b2YgZXhpc3RpbmcgbWVtb3J5IHdpdGggYSB0eXBlIGFzc29jaWF0ZWQgdG8KPj4+IGl0IChDb252
ZW50aW9uYWwsIEJvb3RTZXJ2aWNlQ29kZXMsIE1lbW9yeU1hcHBlZElPLi4uKS4KPj4+Cj4+PiBU
aGUgT1MvSHlwZXJ2aXNvciB3aWxsIGhhdmUgdG8gZ28gdGhyb3VnaCB0aGVtIGFuZCBjaGVjayB3
aGljaCByZWdpb25zIGFyZQo+Pj4gdXN1YWJsZS4gQ29tcGFyZSB0byBMaW51eCwgWGVuIGhhcyBs
aW1pdGVkIGl0c2VsZiB0byBvbmx5IGEgZmV3IHR5cGVzLgo+Pj4KPj4+IEhvd2V2ZXIsIEkgdGhp
bmsgd2UgY2FuIGJlIG9uIGEgcGFyIHdpdGggTGludXggaGVyZS4KPj4KPj4gSSBnYXZlIGEgbG9v
ayBhdCB0aGUgTGludXggaW1wbGVtZW50YXRpb24sIHRoZSBpbnRlcmVzdGluZyBiaXQgaXMKPj4g
ZHJpdmVycy9maXJtd2FyZS9lZmkvYXJtLWluaXQuYzppc191c2FibGVfbWVtb3J5IGFzIGZhciBh
cyBJIGNhbiB0ZWxsLgo+PiBJIGFsc28gZ2F2ZSBhIGxvb2sgYXQgdGhlIFhlbiBzaWRlLCB3aGlj
aCBpcwo+PiB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290Lmg6ZWZpX3Byb2Nlc3NfbWVtb3J5X21h
cF9ib290aW5mby4gQXMgZ3Vlc3NlZCwKPj4gdGhlIHR3byBhcmUgbm90IHF1aXRlIHRoZSBzYW1l
Lgo+Pgo+PiBPbmUgb2YgdGhlIG1haW4gZGlmZmVyZW5jZXMgaXMgdGhhdCBMaW51eCB1c2VzIGFz
ICJTeXN0ZW0gUkFNIiBldmVuCj4+IHJlZ2lvbnMgdGhhdCB3ZXJlIG1hcmtlZCBhcyBFRklfQk9P
VF9TRVJWSUNFU19DT0RFL0RBVEEgYW5kCj4+IEVGSV9MT0FERVJfQ09ERS9EQVRBIGJlY2F1c2Ug
dGhleSB3aWxsIGdldCBmcmVlZCBhbnl3YXkuIFhlbiBkb2Vzbid0Cj4+IGRvIHRoYXQgdW5sZXNz
IG1hcF9icyBpcyBzZXQuCj4+Cj4+IEkgd3JvdGUgYSBxdWljayBwYXRjaCB0byBpbXBsZW1lbnQg
dGhlIExpbnV4IGJlaGF2aW9yIG9uIFhlbiwgb25seQo+PiBsaWdodGx5IHRlc3RlZC4gSSBjYW4g
Y29uZmlybSB0aGF0IEkgc2VlIG1vcmUgbWVtb3J5IHRoaXMgd2F5LiBIb3dldmVyLAo+PiBJIGFt
IG5vdCBzdXJlIHdlIGFjdHVhbGx5IHdhbnQgdG8gaW1wb3J0IHRoZSBMaW51eCBiZWhhdmlvciB3
aG9sZXNhbGUuCj4+Cj4+IEFueXdheSwgUm9tYW4sIGNvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtu
b3cgaWYgdGhpcyBwYXRjaCBzb2x2ZXMgdGhlCj4+IGlzc3VlPwo+IAo+IFRyaWVkIHRoZSBhdHRh
Y2hlZCBwYXRjaCAtLSBidXQgaXQgc2VlbXMgSSBjYW4ndCBib290IGF0IGFsbCB3aXRoIHRoaXMu
IFhlbgo+IGRvZXNuJ3QgcHJpbnQgYW55dGhpbmcgb24gdGhlIGNvbnNvbGUgZWl0aGVyLgoKVGhh
bmsgeW91IGZvciB0cnlpbmcgdGhlIHBhdGNoLiBEbyB5b3UgaGF2ZSBlYXJseXByaW50ayBlbmFi
bGVkIGZvciB0aGUgCmhpa2V5IGJvYXJkPwoKPiAKPiBUbyBKdWxpZW4ncyBwb2ludCAtLSBzaG91
bGQgSSByZWR1Y2UgdGhlICMgb2YgdHlwZXMgYW5kIHRyeSBhZ2Fpbj8KCiBGcm9tIG15IHVuZGVy
c3RhbmRpbmcsIHRoZSBmaWVsZCBBdHRyaWJ1dGUgaXMgYSBzZXJpZXMgb2YgZmxhZyB0ZWxsaW5n
IAp3aGF0IHRoZSByZWdpb24gY2FuIHN1cHBvcnQuCgpTbyBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBoYXZlIG90aGVyIGZsYWdzIHNldCBhdCB0aGUgc2FtZSB0aW1lIGFzIApFRklfTUVNT1JZX1dD
LiBIb3dldmVyLCB0aGUgY2hlY2sgaW4gdGhlIHBhdGNoIGJlbG93IGlzIGFuID09IGVxdWFsIGFu
ZCAKd291bGQgcG90ZW50aWFsbHkgZGlzY2FyZCBhIGxvdCBvZiByZWdpb25zIChpZiBub3QgYWxs
IHJlZ2lvbnMpLgoKSW4gb3RoZXIgd29yZHMuLi4KCj4+Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC9hcm0vZWZpL2VmaS1ib290LmggYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPj4g
aW5kZXggY2E2NTVmZjAwMy4uYWQxOGZmMzY2OSAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJt
L2VmaS9lZmktYm9vdC5oCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9lZmkvZWZpLWJvb3QuaAo+PiBA
QCAtMTQ5LDEwICsxNDksMTQgQEAgc3RhdGljIEVGSV9TVEFUVVMgX19pbml0IGVmaV9wcm9jZXNz
X21lbW9yeV9tYXBfYm9vdGluZm8oRUZJX01FTU9SWV9ERVNDUklQVE9SICoKPj4KPj4gICAgICAg
Zm9yICggSW5kZXggPSAwOyBJbmRleCA8IChtbWFwX3NpemUgLyBkZXNjX3NpemUpOyBJbmRleCsr
ICkKPj4gICAgICAgewo+PiAtICAgICAgICBpZiAoIGRlc2NfcHRyLT5UeXBlID09IEVmaUNvbnZl
bnRpb25hbE1lbW9yeSB8fAo+PiAtICAgICAgICAgICAgICghbWFwX2JzICYmCj4+IC0gICAgICAg
ICAgICAgIChkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNDb2RlIHx8Cj4+IC0gICAg
ICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRhKSkgKQo+PiAr
ICAgICAgICBpZiAoIGRlc2NfcHRyLT5BdHRyaWJ1dGUgPT0gRUZJX01FTU9SWV9XQiAmJgoKLi4u
IHRoaXMgc2hvdWxkIGJlIGRlc2NfcHRyLT5BdHRyaWJ1dGUgJiBFRklfTUVNT1JZX1dCLgoKQ2Fu
IHlvdSBnaXZlIGEgc3BpbiB3aXRoIHRoaXMgY2hhbmdlIGFuZCBzZWUgaG93IGZhciB5b3UgY2Fu
IGdvPwoKPj4gKyAgICAgICAgICAgICAoZGVzY19wdHItPlR5cGUgPT0gRWZpQ29udmVudGlvbmFs
TWVtb3J5IHx8Cj4+ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUxvYWRlckNv
ZGUgfHwKPj4gKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpTG9hZGVyRGF0YSB8
fAo+PiArICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlBQ1BJUmVjbGFpbU1lbW9y
eSB8fAo+PiArICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlQZXJzaXN0ZW50TWVt
b3J5IHx8Cj4+ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNl
c0NvZGUgfHwKPj4gKyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpQm9vdFNlcnZp
Y2VzRGF0YSkgKQo+PiAgICAgICAgICAgewo+PiAgICAgICAgICAgICAgIGlmICggIW1lbWluZm9f
YWRkX2JhbmsoJmJvb3RpbmZvLm1lbSwgZGVzY19wdHIpICkKPj4gICAgICAgICAgICAgICB7Cj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9lZmkvZWZpZGVmLmggYi94ZW4vaW5jbHVkZS9lZmkv
ZWZpZGVmLmgKPj4gaW5kZXggODZhN2UxMTFiZi4uZjQ2MjA3ODQwZiAxMDA2NDQKPj4gLS0tIGEv
eGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2VmaS9lZmlkZWYu
aAo+PiBAQCAtMTQ3LDYgKzE0Nyw3IEBAIHR5cGVkZWYgZW51bSB7Cj4+ICAgICAgIEVmaU1lbW9y
eU1hcHBlZElPLAo+PiAgICAgICBFZmlNZW1vcnlNYXBwZWRJT1BvcnRTcGFjZSwKPj4gICAgICAg
RWZpUGFsQ29kZSwKPj4gKyAgICBFZmlQZXJzaXN0ZW50TWVtb3J5LAo+PiAgICAgICBFZmlNYXhN
ZW1vcnlUeXBlCj4+ICAgfSBFRklfTUVNT1JZX1RZUEU7Cj4+CgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
