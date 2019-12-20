Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38129127717
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 09:24:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiDXW-0004Ly-FM; Fri, 20 Dec 2019 08:21:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DXd/=2K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iiDXU-0004Lt-FJ
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 08:21:36 +0000
X-Inumbo-ID: b7ad3b04-2301-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7ad3b04-2301-11ea-88e7-bc764e2007e4;
 Fri, 20 Dec 2019 08:21:27 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d139so8866232wmd.0
 for <xen-devel@lists.xenproject.org>; Fri, 20 Dec 2019 00:21:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dB19q9RS53e5rgR9GLbshq/jw7jCnWa/p/tbazNZCUU=;
 b=st8Ff/rwOqCHuwIyvFIx/gqxl+R0RQBU2bteQC3fY3E44Gub9s3kW/fVLxs+HtjUnW
 7ElbXcehk6Bj+2lEdIgO7Jxttn94aoTDk7x5XFRHAQjV+wNMii6grRSGlImt6Sxsl2rR
 79R6uthWzyhjJfnYd/Z+hClSQe20z90dQY+PCBjApeWfdWwrKyfKrFRjE0VZE8CiLINX
 L1FL+eVAQiFcFTGuuYg8vPToSAeuYQN0vaCEIC/pvQcbTTrRupnUU3E77bLoQwb3XX30
 oWgIctSsycoNScR7mxa9YRr/9J/4EA8aHuEzWGKLqfwhHQzePS70of/6KoV8gBqqV/N8
 cALg==
X-Gm-Message-State: APjAAAUdTAC5xOV1HRnzN6NUt+Uas86fomNERgnxwxrO53mFFRt+eqcb
 5KkxSlLbx5rgntC1X6C5LFE=
X-Google-Smtp-Source: APXvYqye1FRi+hbr+1h2ZSxGH75V2lBqoysHCE83rTcBAZdv8IkqtBgq3Dw5HnKX4z6Or/pmHqmwiQ==
X-Received: by 2002:a1c:a513:: with SMTP id o19mr13860403wme.156.1576830086746; 
 Fri, 20 Dec 2019 00:21:26 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-227.amazon.com.
 [54.240.197.227])
 by smtp.gmail.com with ESMTPSA id i16sm9181261wmb.36.2019.12.20.00.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Dec 2019 00:21:26 -0800 (PST)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <ee2f224a-7ad2-b4aa-9479-3d57b578ddb4@xen.org>
Date: Fri, 20 Dec 2019 08:21:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1912191555240.9832@sstabellini-ThinkPad-T480s>
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
Cc: xen-devel@lists.xenproject.org, Roman Shaposhnik <roman@zededa.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8xMi8yMDE5IDAwOjAxLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
VGh1LCAxOSBEZWMgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEluIGZhY3QgbW9zdCBv
ZiBwZW9wbGUgb24gQXJtIGFyZSB1c2luZyBHUlVCIHJhdGhlciB0aGFuIEVGSSBkaXJlY3RseSBh
cwo+Pj4+IHRoaXMgaXMgbW9yZSBmcmllbmRseSB0byB1c2UuCj4+Pj4KPj4+PiBSZWdhcmRpbmcg
dGhlIGRldmljZXRyZWUsIFhlbiBhbmQgTGludXggd2lsbCBjb21wbGV0ZWx5IGlnbm9yZSB0aGUK
Pj4+PiBtZW1vcnkgbm9kZXMgaW4gWGVuIGlmIHVzaW5nIEVGSS4gVGhpcyBiZWNhdXNlIHRoZSBF
RkkgbWVtb3J5IG1hcCB3aWxsCj4+Pj4gZ2l2ZSB5b3UgYW4gb3ZlcnZpZXcgb2YgdGhlIHBsYXRm
b3JtIHdpdGggdGhlIEVGSSByZWdpb25zIGluY2x1ZGVkLgo+Pj4KPj4+IEFoYSEgU28gaW4gdGhh
dCBzZW5zZSBpdCBpcyBhIGJ1ZyBpbiBYZW4gYWZ0ZXIgYWxsLCByaWdodD8gKHRoYXQncyB3aGF0
Cj4+PiB5b3UncmUKPj4+IHJlZmVycmluZyB0byB3aGVuIHlvdSBzYXkgeW91IG5vdyB1bmRlcnN0
YW5kIHdoYXQgbmVlZHMgdG8gZ2V0IGZpeGVkKS4KPj4KPj4gWWVzLiBUaGUgRUZJIG1lbW9yeSBt
YXAgaXMgYSBsaXN0IG9mIGV4aXN0aW5nIG1lbW9yeSB3aXRoIGEgdHlwZSBhc3NvY2lhdGVkIHRv
Cj4+IGl0IChDb252ZW50aW9uYWwsIEJvb3RTZXJ2aWNlQ29kZXMsIE1lbW9yeU1hcHBlZElPLi4u
KS4KPj4KPj4gVGhlIE9TL0h5cGVydmlzb3Igd2lsbCBoYXZlIHRvIGdvIHRocm91Z2ggdGhlbSBh
bmQgY2hlY2sgd2hpY2ggcmVnaW9ucyBhcmUKPj4gdXN1YWJsZS4gQ29tcGFyZSB0byBMaW51eCwg
WGVuIGhhcyBsaW1pdGVkIGl0c2VsZiB0byBvbmx5IGEgZmV3IHR5cGVzLgo+Pgo+PiBIb3dldmVy
LCBJIHRoaW5rIHdlIGNhbiBiZSBvbiBhIHBhciB3aXRoIExpbnV4IGhlcmUuCj4gCj4gSSBnYXZl
IGEgbG9vayBhdCB0aGUgTGludXggaW1wbGVtZW50YXRpb24sIHRoZSBpbnRlcmVzdGluZyBiaXQg
aXMKPiBkcml2ZXJzL2Zpcm13YXJlL2VmaS9hcm0taW5pdC5jOmlzX3VzYWJsZV9tZW1vcnkgYXMg
ZmFyIGFzIEkgY2FuIHRlbGwuCj4gSSBhbHNvIGdhdmUgYSBsb29rIGF0IHRoZSBYZW4gc2lkZSwg
d2hpY2ggaXMKPiB4ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290Lmg6ZWZpX3Byb2Nlc3NfbWVtb3J5
X21hcF9ib290aW5mby4gQXMgZ3Vlc3NlZCwKPiB0aGUgdHdvIGFyZSBub3QgcXVpdGUgdGhlIHNh
bWUuCj4gCj4gT25lIG9mIHRoZSBtYWluIGRpZmZlcmVuY2VzIGlzIHRoYXQgTGludXggdXNlcyBh
cyAiU3lzdGVtIFJBTSIgZXZlbgo+IHJlZ2lvbnMgdGhhdCB3ZXJlIG1hcmtlZCBhcyBFRklfQk9P
VF9TRVJWSUNFU19DT0RFL0RBVEEgYW5kCj4gRUZJX0xPQURFUl9DT0RFL0RBVEEgYmVjYXVzZSB0
aGV5IHdpbGwgZ2V0IGZyZWVkIGFueXdheS4gWGVuIGRvZXNuJ3QKPiBkbyB0aGF0IHVubGVzcyBt
YXBfYnMgaXMgc2V0LgoKV2VsbCwgbWFwX2JzIGlzIHVzZWQgdG8gcmVxdWVzdCB0byBtYXAgdGhl
IGJvb3Qgc2VydmljZXMgaW50byBYZW4gUFQuIEluIApvdGhlciB3b3JkcywgeW91IGNhbid0IGNv
bnNpZGVyIHRoZW0gYXMgdXN1YWJsZSBpZiB0aGF0IG9wdGlvbiBpcyBzZXQuCgo+IAo+IEkgd3Jv
dGUgYSBxdWljayBwYXRjaCB0byBpbXBsZW1lbnQgdGhlIExpbnV4IGJlaGF2aW9yIG9uIFhlbiwg
b25seQo+IGxpZ2h0bHkgdGVzdGVkLiBJIGNhbiBjb25maXJtIHRoYXQgSSBzZWUgbW9yZSBtZW1v
cnkgdGhpcyB3YXkuIEhvd2V2ZXIsCj4gSSBhbSBub3Qgc3VyZSB3ZSBhY3R1YWxseSB3YW50IHRv
IGltcG9ydCB0aGUgTGludXggYmVoYXZpb3Igd2hvbGVzYWxlLgoKVGhpcyBpcyBub3Qgd2hhdCBJ
IGhhZCBpbiBtaW5kLCB3ZSBzdGlsbCBuZWVkIHRvIGtlZXAgWGVuIGJlaGF2aW9yIGZvciAKYm9v
dCBzZXJ2aWNlcyBhbmQgZW5zdXJlIHRoZSByZWdpb24gYXJlIHJlY29yZGVkL3NraXBwZWQgYXMg
ZXhwZWN0ZWQgCihzZWUgbW9yZSBiZWxvdykuCgo+IAo+IEFueXdheSwgUm9tYW4sIGNvdWxkIHlv
dSBwbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhpcyBwYXRjaCBzb2x2ZXMgdGhlCj4gaXNzdWU/Cj4g
CgpQbGVhc2Ugc2VlIGEgY291cGxlIG9mIGNvbW1lbnRzIGJlbG93LgoKPiAKPiAKPiBkaWZmIC0t
Z2l0IGEveGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIGIveGVuL2FyY2gvYXJtL2VmaS9lZmkt
Ym9vdC5oCj4gaW5kZXggY2E2NTVmZjAwMy4uYWQxOGZmMzY2OSAxMDA2NDQKPiAtLS0gYS94ZW4v
YXJjaC9hcm0vZWZpL2VmaS1ib290LmgKPiArKysgYi94ZW4vYXJjaC9hcm0vZWZpL2VmaS1ib290
LmgKPiBAQCAtMTQ5LDEwICsxNDksMTQgQEAgc3RhdGljIEVGSV9TVEFUVVMgX19pbml0IGVmaV9w
cm9jZXNzX21lbW9yeV9tYXBfYm9vdGluZm8oRUZJX01FTU9SWV9ERVNDUklQVE9SICoKPiAgIAo+
ICAgICAgIGZvciAoIEluZGV4ID0gMDsgSW5kZXggPCAobW1hcF9zaXplIC8gZGVzY19zaXplKTsg
SW5kZXgrKyApCj4gICAgICAgewo+IC0gICAgICAgIGlmICggZGVzY19wdHItPlR5cGUgPT0gRWZp
Q29udmVudGlvbmFsTWVtb3J5IHx8Cj4gLSAgICAgICAgICAgICAoIW1hcF9icyAmJgo+IC0gICAg
ICAgICAgICAgIChkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNDb2RlIHx8Cj4gLSAg
ICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNlc0RhdGEpKSApCj4g
KyAgICAgICAgaWYgKCBkZXNjX3B0ci0+QXR0cmlidXRlID09IEVGSV9NRU1PUllfV0IgJiYKClRo
aXMgaXMgbm90IHF1aXRlIHRoZSBzYW1lIGFzIExpbnV4LiBUaGV5IHVzZToKCmRlc2NfcHRyLT5B
dHRyaWJ1dGUgJiBFRklfTUVNT1JZX1dCCgpCdXQgSSBkb24ndCBzZWUgd2h5IEF0dHJpYnV0ZSBz
aG91bGQgYmUgc3RyaWN0bHkgZXF1YWwgdG8gRUZJX01FTU9SWV9XQi4KCj4gKyAgICAgICAgICAg
ICAoZGVzY19wdHItPlR5cGUgPT0gRWZpQ29udmVudGlvbmFsTWVtb3J5IHx8Cj4gKyAgICAgICAg
ICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpTG9hZGVyQ29kZSB8fAo+ICsgICAgICAgICAgICAg
IGRlc2NfcHRyLT5UeXBlID09IEVmaUxvYWRlckRhdGEgfHwKPiArICAgICAgICAgICAgICBkZXNj
X3B0ci0+VHlwZSA9PSBFZmlBQ1BJUmVjbGFpbU1lbW9yeSB8fAoKTGludXggd2lsbCBleHBsaWN0
bHkgcmVzZXJ2ZSB0aGUgQUNQSSByZWdpb24gKHNlZSB0aGUgY2FsbGVyIG9mIAppc191c2FibGVf
bWVtb3J5KCkpLiBGb3IgdXMgdGhpcyBpcyBkb25lIGluIHRoZSAiZWxzZSBpZiIgcGFydC4KCj4g
KyAgICAgICAgICAgICAgZGVzY19wdHItPlR5cGUgPT0gRWZpUGVyc2lzdGVudE1lbW9yeSB8fAo+
ICsgICAgICAgICAgICAgIGRlc2NfcHRyLT5UeXBlID09IEVmaUJvb3RTZXJ2aWNlc0NvZGUgfHwK
PiArICAgICAgICAgICAgICBkZXNjX3B0ci0+VHlwZSA9PSBFZmlCb290U2VydmljZXNEYXRhKSAp
Cj4gICAgICAgICAgIHsKPiAgICAgICAgICAgICAgIGlmICggIW1lbWluZm9fYWRkX2JhbmsoJmJv
b3RpbmZvLm1lbSwgZGVzY19wdHIpICkKPiAgICAgICAgICAgICAgIHsKPiBkaWZmIC0tZ2l0IGEv
eGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oIGIveGVuL2luY2x1ZGUvZWZpL2VmaWRlZi5oCj4gaW5k
ZXggODZhN2UxMTFiZi4uZjQ2MjA3ODQwZiAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9lZmkv
ZWZpZGVmLmgKPiArKysgYi94ZW4vaW5jbHVkZS9lZmkvZWZpZGVmLmgKPiBAQCAtMTQ3LDYgKzE0
Nyw3IEBAIHR5cGVkZWYgZW51bSB7Cj4gICAgICAgRWZpTWVtb3J5TWFwcGVkSU8sCj4gICAgICAg
RWZpTWVtb3J5TWFwcGVkSU9Qb3J0U3BhY2UsCj4gICAgICAgRWZpUGFsQ29kZSwKPiArICAgIEVm
aVBlcnNpc3RlbnRNZW1vcnksCj4gICAgICAgRWZpTWF4TWVtb3J5VHlwZQo+ICAgfSBFRklfTUVN
T1JZX1RZUEU7Cj4gICAKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
