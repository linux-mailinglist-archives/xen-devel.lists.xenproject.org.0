Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B23181C56
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 16:31:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC3HQ-0007r9-Al; Wed, 11 Mar 2020 15:28:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u1yM=44=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jC3HO-0007qy-Q3
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 15:28:18 +0000
X-Inumbo-ID: eee61f32-63ac-11ea-92cf-bc764e2007e4
Received: from mail-qv1-xf2f.google.com (unknown [2607:f8b0:4864:20::f2f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eee61f32-63ac-11ea-92cf-bc764e2007e4;
 Wed, 11 Mar 2020 15:28:18 +0000 (UTC)
Received: by mail-qv1-xf2f.google.com with SMTP id fc12so1049464qvb.6
 for <xen-devel@lists.xenproject.org>; Wed, 11 Mar 2020 08:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=ds7UDnU02xmCTcgJPbSVFy1HoBYCfYqJaR1ONjFzKYw=;
 b=jGBgdi3fSOHmWtZFKTFZr42b3h0oqGbcAEFy2FKi8/5AwD/woAm1MOs/Q1F5x7fz0L
 CcFB9r/HmbxnI5GFi/CTJiVxDwREqaKqwMkaKoua7lCD2bhCb2QUfjth5zt2ejk3XrQK
 FyuFwW0pbb6vMjAd7oq1M/qDG3MTxy/bsHbxVIy1gbGohT2gBNlSSFnofBP4FG4GesLx
 ZQ+uG/FYqUQhChoUN47toCOwvvB08oIeAPR1bpsrD6JODaO441akra8IRqEE1+pfBmFp
 NUwlNrZEKY3hCHaSfqu5KuoxWu7tYuz6ZkCelQFgkKgZmYKfHl/ZvRGNUMTOSFeW3R7Z
 L9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=ds7UDnU02xmCTcgJPbSVFy1HoBYCfYqJaR1ONjFzKYw=;
 b=nslwAPxfI9G2LRQTYCo4KKG0kJ9KNSdP1nSJBgxE3mg3hErZchnw3PaatHOZTSPSqM
 BKhohjnGTwMhx/JSe7yDeXvNNOyUQECFfDnbkGkCUW4VMrzz7nBDSX1e7Tjm6j+uJmuC
 qmQYnSrhTar3MPSxfDRpsBivDJw00Ek0VnfvyamRAM3tZi5mIi0sKfZ74KAW5QDZN1I0
 TIyDCSLvY5ejeySfWOUFVcF/Fm1qxCbxiwCz/3bLTPhK07u1vK5pRxng8UgbTZBADbA6
 dzwHPqRZb6b16J18QM7PLQCe0HCXzkbg+m8tDtQKb63Flhap2SJNXfMGdUchT+pwaeCO
 14/Q==
X-Gm-Message-State: ANhLgQ1YYKdHJGfwuGIZDgvGyyt7t3ulsZoS/W5RWJoT63ONKrKQTUnk
 RqClVJ20Hs01/P73yw0byu0=
X-Google-Smtp-Source: ADFU+vvKdvT20HcMZM3rmWg/0m0vj809x1tkLPzkjZl5fQODmYBcKPs12NF37F1E3oFiH43QwnXzSw==
X-Received: by 2002:a0c:fb06:: with SMTP id c6mr3436941qvp.122.1583940497833; 
 Wed, 11 Mar 2020 08:28:17 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id p35sm5980091qtk.2.2020.03.11.08.28.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 08:28:17 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200309102304.1251-1-paul@xen.org>
 <20200309102304.1251-7-paul@xen.org>
 <54fbff7c-118f-bfa7-3d2c-c1d6a2305a1f@suse.com>
 <004201d5f702$0905fbc0$1b11f340$@xen.org>
 <fc440f97-59b8-5018-8d69-fa5e10b70e97@suse.com>
In-Reply-To: <fc440f97-59b8-5018-8d69-fa5e10b70e97@suse.com>
Date: Wed, 11 Mar 2020 15:28:14 -0000
Message-ID: <004501d5f7b9$b00e1120$102a3360$@xen.org>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQH8MQiuRQX2aixYfaKKXR3nYohrUgI6fEqtAma3droBjqrtsAKIC2i7p7FJv2A=
Subject: Re: [Xen-devel] [PATCH v5 6/6] domain: use PGC_extra domheap page
 for shared_info
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KPiBTZW50OiAxMSBNYXJjaCAyMDIwIDA5OjE3Cj4gVG86IHBhdWxAeGVuLm9y
Zwo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7ICdQYXVsIER1cnJhbnQnIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgJ1N0ZWZhbm8gU3RhYmVsbGluaScKPiA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz47ICdKdWxpZW4gR3JhbGwnIDxqdWxpZW5AeGVuLm9yZz47ICdWb2xvZHlteXIg
QmFiY2h1aycKPiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyAnQW5kcmV3IENvb3Blcicg
PGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyAnR2VvcmdlIER1bmxhcCcKPiA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPjsgJ0lhbiBKYWNrc29uJyA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNv
bT47ICdLb25yYWQgUnplc3p1dGVrIFdpbGsnCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyAn
V2VpIExpdScgPHdsQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSA2LzZdIGRvbWFp
bjogdXNlIFBHQ19leHRyYSBkb21oZWFwIHBhZ2UgZm9yIHNoYXJlZF9pbmZvCj4gCj4gT24gMTAu
MDMuMjAyMCAxODozMywgUGF1bCBEdXJyYW50IHdyb3RlOgo+ID4+IC0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+ID4+
IFNlbnQ6IDA5IE1hcmNoIDIwMjAgMTU6NTYKPiA+Pgo+ID4+IE9uIDA5LjAzLjIwMjAgMTE6MjMs
IHBhdWxAeGVuLm9yZyB3cm90ZToKPiA+Pj4gLS0tIGEveGVuL2NvbW1vbi90aW1lLmMKPiA+Pj4g
KysrIGIveGVuL2NvbW1vbi90aW1lLmMKPiA+Pj4gQEAgLTk5LDYgKzk5LDE4IEBAIHZvaWQgdXBk
YXRlX2RvbWFpbl93YWxsY2xvY2tfdGltZShzdHJ1Y3QgZG9tYWluICpkKQo+ID4+PiAgICAgIHVp
bnQzMl90ICp3Y192ZXJzaW9uOwo+ID4+PiAgICAgIHVpbnQ2NF90IHNlYzsKPiA+Pj4KPiA+Pj4g
KyAgICBpZiAoIGQgIT0gY3VycmVudC0+ZG9tYWluICkKPiA+Pj4gKyAgICB7Cj4gPj4+ICsgICAg
ICAgIC8qCj4gPj4+ICsgICAgICAgICAqIFdlIG5lZWQgdG8gY2hlY2sgaXNfZHlpbmcgaGVyZSBh
cywgaWYgaXQgaXMgc2V0LCB0aGUKPiA+Pj4gKyAgICAgICAgICogc2hhcmVkX2luZm8gbWF5IGhh
dmUgYmVlbiBmcmVlZC4gVG8gZG8gdGhpcyBzYWZlbHkgd2UgbmVlZAo+ID4+PiArICAgICAgICAg
KiBob2xkIHRoZSBkb21haW4gbG9jay4KPiA+Pj4gKyAgICAgICAgICovCj4gPj4+ICsgICAgICAg
IGRvbWFpbl9sb2NrKGQpOwo+ID4+PiArICAgICAgICBpZiAoIGQtPmlzX2R5aW5nICkKPiA+Pj4g
KyAgICAgICAgICAgIGdvdG8gdW5sb2NrOwo+ID4+PiArICAgIH0KPiA+Pgo+ID4+IFRoaXMgc2hv
dWxkbid0IGhhcHBlbiB2ZXJ5IG9mdGVuLCBidXQgaXQncyBwcmV0dHkgaGVhdnkgYSBsb2NrLgo+
ID4+IEl0J3MgYSBmdW5kYW1lbnRhbCBhc3BlY3Qgb2YgeGVuaGVhcCBwYWdlcyB0aGF0IHRoZWly
IGRpc3Bvc2FsCj4gPj4gY2FuIGIgZSBkZWxheSB1bnRpbCBhbG1vc3QgdGhlIGxhc3QgbW9tZW50
IG9mIGd1ZXN0IGNsZWFudXAuIEkKPiA+PiBjb250aW51ZSB0byB0aGluayBpdCdzIG5vdCByZWFs
bHkgYSBnb29kIGlkZWFsIHRvIGhhdmUgc3BlY2lhbAo+ID4+IHB1cnBvc2UgYWxsb2NhdGlvbiAo
YW5kIG1hcHBpbmcpIGFjY29tcGFuaWVkIGJ5IHRoZXNlIHBhZ2VzCj4gPj4gZ2V0dGluZyB0YWtl
biBjYXJlIG9mIGJ5IHRoZSBnZW5lcmljIHJlbGlucXVpc2gtcmVzb3VyY2VzIGxvZ2ljCj4gPj4g
aGVyZSAoZnJvbSBhIG1vcmUgZ2VuZXJhbCBwb3Ygc3VjaCBpcyBvZiBjb3Vyc2Ugb2Z0ZW4gbmlj
ZSB0bwo+ID4+IGhhdmUpLiBJbnN0ZWFkIG9mIGZyZWVpbmcgdGhlc2UgcGFnZXMgdGhlcmUsIGNv
dWxkbid0IHRoZXkganVzdAo+ID4+IGJlIHRha2VuIG9mZiBkLT5wYWdlX2xpc3QsIHdpdGggdGhl
IHVubWFwcGluZyBhbmQgZnJlZWluZyBsZWZ0Cj4gPj4gYXMgaXQgd2FzPwo+ID4KPiA+IEkgZG9u
J3QgdGhpbmsgdGhpcyBjYW4gYmUgYWNoaWV2ZWQgd2l0aG91dCBiZWluZyBhYmxlIGRlLWFzc2ln
bgo+ID4gcGFnZXMgYW5kIEkgZG9uJ3QgcmVhbGx5IHdhbnQgdG8gaGF2ZSB0byBpbnZlbnQgbmV3
IGxvZ2ljIHRvIGRvCj4gPiB0aGF0IChiYXNpY2FsbHkgcmUtaW1wbGVtZW50aW5nIHdoYXQgaGFw
cGVucyB0byB4ZW5oZWFwIHBhZ2VzKS4KPiAKPiBXaGVyZSdzIHRoZSBjb25uZWN0aW9uIHRvIGJl
aW5nIGFibGUgdG8gZGUtYXNzaWduIHBhZ2VzIGhlcmU/Cj4gVGhlcmUnbGwgYmUgb25lIHdoZW4g
dGhlIHNhbWUgY29udmVyc2lvbiBpcyB0byBiZSBkb25lIGZvcgo+IGdudHRhYiBjb2RlLCBidXQg
SSBkb24ndCBzZWUgaXQgaGVyZSAtIHRoZSBzaGFyZWQgaW5mbyBwYWdlIGlzCj4gbmV2ZXIgdG8g
YmUgZGUtYXNzaWduZWQuIEFzIHRvIGdudHRhYiBjb2RlLCBJIHRoaW5rIGl0IHdhcwo+IG5vdGVk
IGJlZm9yZSB0aGF0IHdlIG1heSBiZSBiZXR0ZXIgb2ZmIG5vdCAidW5wb3B1bGF0aW5nIgo+IHN0
YXR1cyBwYWdlcyB3aGVuIHN3aXRjaGluZyBiYWNrIGZyb20gdjIgdG8gdjEuIEF0IHdoaWNoIHBv
aW50Cj4gdGhlIGRlLWFzc2lnbm1lbnQgbmVlZCB3b3VsZCBnbyBhd2F5IHRoZXJlLCB0b28uCgpP
aywgbWF5YmUgSSdtIG1pc3VuZGVyc3RhbmRpbmcgc29tZXRoaW5nIHRoZW4uIFdlIG5lZWQgdG8g
Y2FsbCBmcmVlX2RvbWhlYXBfcGFnZXMoKSBvbiBhbGwgcGFnZXMgYXNzaWduZWQgdG8gYSBkb21h
aW4gc28gdGhhdCB0aGUgZG9tYWluIHJlZmVyZW5jZXMgZ2V0IGRyb3BwZWQuIFRoZSB4ZW5wYWdl
IHJlZiBpcyBkcm9wcGVkIHdoZW4gZC0+eGVuaGVhcF9wYWdlcyA9PSAwLiBUaGUgZG9taGVhcCBy
ZWYgaXMgZHJvcHBlZCB3aGVuIGRvbWFpbl9hZGp1c3RfdG90X3BhZ2VzKCkgcmV0dXJucyB6ZXJv
LiAoVGhpcyBpcyB3aGF0IEkgbWVhbnQgYnkgZGUtYXNzaWduaW5nLi4uIGJ1dCB0aGF0IHdhcyBw
cm9iYWJseSBhIHBvb3IgY2hvaWNlIG9mIHdvcmRzKS4gU28sIGJlY2F1c2UgZG9tYWluX2FkanVz
dF90b3RfcGFnZXMoKSByZXR1cm5zIGQtPnRvdF9wYWdlcyAod2hpY2ggaW5jbHVkZXMgdGhlIGV4
dHJhX3BhZ2VzIGNvdW50KSBpdCB3b24ndCBmYWxsIHRvIHplcm8gdW50aWwgdGhlIGxhc3QgcHV0
X3BhZ2UoKSBvbiBhbnkgUEdDX2V4dHJhIHBhZ2UuIFNvIGhvdyBpcyBpdCBwb3NzaWJsZSB0byBm
cmVlIHNoYXJlZF9pbmZvIGluIGRvbWFpbiBkZXN0cm95PyBXZSdsbCBuZXZlciBnZXQgdGhhdCBm
YXIsIGJlY2F1c2UgdGhlIGRvbWhlYXAgcmVmIHdpbGwgbmV2ZXIgZ2V0IGRyb3BwZWQuIEkgZ3Vl
c3MgdGhpcyBjb3VsZCBiZSBmaXhlZCBieSBoYXZpbmcgZG9tYWluX2FkanVzdF90b3RfcGFnZXMo
KSByZXR1cm4gdGhlIHNhbWUgdmFsdWVzIGFzIGRvbWFpbl90b3RfcGFnZXMoKSAoaS5lLiB0b3Rf
cGFnZXMgLSBleHRyYV9wYWdlcykuIElzIHRoYXQgd2hhdCB5b3UncmUgc3VnZ2VzdGluZz8KCj4g
Cj4gPiBJIHJlYWxseSBkb24ndCB0aGluayBpdCBpcyB0aGF0IGJhZCB0byBkZWFsIHdpdGggc2hh
cmVkIGluZm8KPiA+IGFuZCBncmFudCB0YWJsZSBwYWdlcyBhcyBkb21oZWFwIHBhZ2VzLiBZZXMs
IHdlIGhhdmUgdG8gYmUKPiA+IGNhcmVmdWwsIGJ1dCBpbiB0aGlzIGNhc2UgdGhlIGxvY2sgaXMg
b25seSB0YWtlbiBpbiBhCj4gPiB0b29sc3RhY2sgdXBkYXRlIG9mIHRoZSB3YWxsY2xvY2sgYW5k
LCBhcGFydCBmcm9tIHN0YXJ0IG9mCj4gPiBkYXkgYWNjZXNzLCBJIHRoaW5rIHRoaXMgaXMgbGlt
aXRlZCB0byBYRU5fRE9NQ1RMX3NldHRpbWVvZmZzZXQKPiA+IGFuZCBYRU5fRE9NQ1RMX3NldHZj
cHVjb250ZXh0IG5laXRoZXIgb2Ygd2hpY2ggSSBiZWxpZXZlIGlzCj4gPiBwYXJ0aWN1bGFybHkg
cGVyZm9ybWFuY2UtY3JpdGljYWwuCj4gCj4gSXQncyBub3QsIEkgYWdyZWUgKGFuZCBoZW5jZSBJ
IGhhZCBzdGFydGVkIG15IHByZXZpb3VzIHJlcGx5Cj4gYWxzbyB3aXRoICJUaGlzIHNob3VsZG4n
dCBoYXBwZW4gdmVyeSBvZnRlbiIpLiBIb3cgYWxsIG9mIHRoaXMKPiBpcyBnb2luZyB0byBsb29r
IGxpa2Ugd2l0aCB0aGUgbmV3IGV4dHJhX3BhZ2VfbGlzdCBJJ2xsIGhhdmUKPiB0byBzZWUgYW55
d2F5LiBCdXQgZm9yIG5vdyBJIHJlbWFpbiB1bmNvbnZpbmNlZCBvZiB0aGUgd2FudCAvCj4gbmVl
ZCB0byBkZS1hbGxvY2F0ZSB0aGUgc2hhcmVkIGluZm8gcGFnZSBlYXJseS4KPiAKCldlbGwgaG9w
ZWZ1bGx5IEkndmUgZXhwbGFpbmVkIGFib3ZlIHdoeSB0aGF0IGlzIGN1cnJlbnRseSBuZWNlc3Nh
cnkgaWYgaXQgYmVjb21lcyBhIGRvbWhlYXAgcGFnZS4KCiAgUGF1bAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
