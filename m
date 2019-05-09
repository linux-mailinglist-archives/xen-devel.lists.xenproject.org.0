Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1181E18F98
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 19:49:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOn8J-0003ud-QM; Thu, 09 May 2019 17:47:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=przs=TJ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hOn8I-0003tk-Bh
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 17:47:02 +0000
X-Inumbo-ID: 727d6600-7282-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 727d6600-7282-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 17:47:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1557424020; h=Content-Transfer-Encoding: Content-Type: Cc: To:
 Subject: Message-ID: Date: From: In-Reply-To: References: MIME-Version:
 Sender; bh=MFipP0MKg9y95WWAQ9wgnUVhhw5rBgCGAbNUbTDRIOw=;
 b=Ry+NR6itdL0L7LzjA63YGz1MjECLtzQ4SuyV0UMqudshGev+p9wpbfyh28mRuyF1CHB4rr/e
 Qjfe59dKWL9OlObjm+UozezJIJvk+VOzKl+Cq39r/R0JkGc+NxvHUbFB4DyET5FX581OKm6y
 hzjFJcUWp2oVYWoflDuZWlH5LY8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mxa.mailgun.org with ESMTP id 5cd46793.7fb406a38af0-smtp-out-n03;
 Thu, 09 May 2019 17:46:59 -0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id b203so4323040wmb.4
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2019 10:46:59 -0700 (PDT)
X-Gm-Message-State: APjAAAX5ipRoTkCIcWCydPWAbw0ObhfV0F8KVnBS+OENJa6XnrcoljU4
 c2VLIX9AW3c9SjtxFLGFKPw/BTnaQSWxOvFs1w4=
X-Google-Smtp-Source: APXvYqybSQ0ihazMDntcIwjmfY79wRbfxgoW5waO8n7zjXUwQqSgI95a7lqwe08wG8vPzc4ZnMqdMYnW6Y6hdSmnBww=
X-Received: by 2002:a1c:cc10:: with SMTP id h16mr3976531wmb.39.1557424017838; 
 Thu, 09 May 2019 10:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <f3zRvkN8JOfpv5k6jz7TbWXz-sso4q6CGB-3S05mSco8SuDy0BoN5z5_Lj_-Xnto1FPMCkhE89trkq-_f6itwRZ5F4NI9MKrcqZk8cdT45A=@protonmail.com>
 <76bd924a-34b1-eb7c-d3be-6c33aa7729fc@citrix.com>
 <WL45-Mjyf7to-l_u4XAT3M46R6YcAECvEwl6SDzOWeLE_SOQUyF26Vj2cu0mScD47fS95OaBAWDddX7DL7yujvl03YffFRDoqrpRcFDSnxA=@protonmail.com>
 <oSx3iO5YqwrWedfgCT8yEj4jGrzisHnNA6d9XQIKAJJAOhr6TPANrqVHf6s56L8_WBgLtVMJv37Cypbr2emtg0ZKb25HdHo91eM1J1fVJHo=@protonmail.com>
 <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
In-Reply-To: <4f34ed81-8993-2e5d-9aea-89a6e2d98b44@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 9 May 2019 11:46:20 -0600
X-Gmail-Original-Message-ID: <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
Message-ID: <CABfawh=_Xg225Tfw-zS9iXXk2pdUG0MyBi3+Co5Urmh6EfTOXw@mail.gmail.com>
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

T24gVGh1LCBNYXkgOSwgMjAxOSBhdCAxMDo0MyBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDA5LzA1LzIwMTkgMTc6MTksIE1hdGhpZXUg
VGFycmFsIHdyb3RlOgo+ID4gTGUgbWFyZGksIG1haSA3LCAyMDE5IDI6MDEgUE0sIE1hdGhpZXUg
VGFycmFsIDxtYXRoaWV1LnRhcnJhbEBwcm90b25tYWlsLmNvbT4gYSDDqWNyaXQgOgo+ID4KPiA+
Pj4gR2l2ZW4gaG93IG1hbnkgRVBUIGZsdXNoaW5nIGJ1Z3MgSSd2ZSBhbHJlYWR5IGZvdW5kIGlu
IHRoaXMgYXJlYSwgSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgdGhlcmUgYXJlIGZ1cnRoZXIg
b25lcyBsdXJraW5nLiAgSWYgaXQgaXMgYW4gRVBUIGZsdXNoaW5nIGJ1ZywgdGhpcyBkZWx0YSBz
aG91bGQgbWFrZSBpdCBnbyBhd2F5LCBidXQgaXQgd2lsbCBjb21lIHdpdGggYSBoZWZ0eSBwZXJm
IGhpdC4KPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5j
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+Pj4gaW5kZXggMjgzZWI3Yi4uMDE5MzMz
ZCAxMDA2NDQKPiA+Pj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+Pj4gKysr
IGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiA+Pj4gQEAgLTQyODUsOSArNDI4NSw3IEBA
IGJvb2wgdm14X3ZtZW50ZXJfaGVscGVyKGNvbnN0IHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdz
KQo+ID4+PiAgICAgICAgICAgICAgfQo+ID4+PiAgICAgICAgICB9Cj4gPj4+Cj4gPj4+IC0gICAg
ICAgIGlmICggaW52ICkKPiA+Pj4gLSAgICAgICAgICAgIF9faW52ZXB0KGludiA9PSAxID8gSU5W
RVBUX1NJTkdMRV9DT05URVhUIDogSU5WRVBUX0FMTF9DT05URVhULAo+ID4+PiAtICAgICAgICAg
ICAgICAgICAgICAgaW52ID09IDEgPyBzaW5nbGUtPmVwdHAgICAgICAgICAgOiAwKTsKPiA+Pj4g
KyAgICAgICAgX19pbnZlcHQoSU5WRVBUX0FMTF9DT05URVhULCAwKTsKPiA+Pj4gICAgICB9Cj4g
Pj4+Cj4gPj4+ICAgb3V0Ogo+ID4+IEkgY2FuIGdpdmUgdGhpcyBhIHRyeSwgYW5kIHNlZSBpZiBp
dCByZXNvbHZlcyB0aGUgcHJvYmxlbSAhCj4gPiBKdXN0IHRlc3RlZCwgb24gWGVuIDQuMTIuMCwg
YW5kIHRoZSBidWcgaXMgc3RpbGwgaGVyZS4KPiA+IFdpbmRvd3MgNyBpcyBoYXZpbmcgQlNPRHMg
d2l0aCA0IFZDUFVzLgo+ID4gSSBkaWRuJ3Qgbm90aWNlZCBhIGhlZnR5IHBlcmZvcm1hbmNlIGlt
cGFjdCB0aG91Z2guCj4gPgo+ID4gRG8gd2UgaGF2ZSBvdGhlciBjYWNoZXMgdG8gaW52YWxpZGF0
ZSA/Cj4gPiBTb21ldGhpbmcgZWxzZSB0aGF0IGkgc2hvdWxkIHRlc3QgPwo+ID4KPiA+IEkgZG9u
J3QgZmVlbCBjb21mb3J0YWJsZSBkaWdnaW5nIGludG8gWGVuJ3MgY29kZSwgZXNwZWNpYWxseSBm
b3Igc29tZXRoaW5nIGFzIGNvbXBsaWNhdGVkIGFzIHBhZ2UgdGFibGUgYW5kIG1lbW9yeSBtYW5h
Z2VtZW50LAo+ID4gaW5jcmVhc2VkIGJ5IHRoZSBjb21wbGV4aXR5IG9mIGFsdHAybS4KPiA+IFdo
YXQgaSBjYW4gZG8gaG93ZXZlciwgaXMgdGVzdCB5b3VyIGlkZWFzIGFuZCBwYXRjaGVzIGFuZCBy
ZXBvcnQgdGhlIGluZm9ybWF0aW9uIEkgY2FuIGdhdGhlciBvbiB0aGlzIGlzc3VlLgo+ID4KPiA+
IE5vdGU6IEkgdGVzdGVkIHdpdGggdGhlIGxhdGVzdCBjb21taXRzIG9uIERyYWt2dWYvbWFzdGVy
LCBlc3BlY2lhbGx5Ogo+ID4gIkFkZCBhIFZNIHBhdXNlIGZvciBzaGFkb3cgY29weSByZWZyZXNo
IG9wZXJhdGlvbiIKPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS90a2xlbmd5ZWwvZHJha3Z1Zi9wdWxs
LzYyNgo+ID4KPiA+IEB0YW1hcywgZGlkIHlvdSBtYWRlIHRoaXMgcGF0Y2ggdG8gZml4IHRoZXNl
IGtpbmQgb2YgcmFjZSBjb25kaXRpb25zIGlzc3VlIHRoYXQgaSdtIHJlcG9ydGluZyA/Cj4gPiBP
ciB3YXMgaXQgdG90YWxseSB1bnJlbGF0ZWQgPwo+Cj4gV2l0aCB0aGUgYWJvdmUgY2hhbmdlIGlu
IHBsYWNlIGFuZCBCU09EcyBzdGlsbCBoYXBwZW5pbmcsIEknbSBmYWlybHkKPiBjb252aW5jZWQg
dGhhdCBpdCBub3QgYSBUTEIgZmx1c2hpbmcgaXNzdWUuCj4KPiBUaGVyZWZvcmUsIHRoZSBjb25j
bHVzaW9uIHRvIGRyYXcgaXMgdGhhdCBpdCBpcyBhIGxvZ2ljYWwgYnVnIHNvbWV3aGVyZS4KCkkg
YWdyZWUuCgo+Cj4gRmlyc3Qgb2YgYWxsIC0gZW5zdXJlIHlvdSBhcmUgdXNpbmcgdXAtdG8tZGF0
ZSBtaWNyb2NvZGUuICBUaGUgbnVtYmVyIG9mCj4gZXJyYXRhIHdoaWNoIGhhdmUgYmVlbiBkaXNj
b3ZlcmVkIGJ5IHBlb3BsZSBhc3NvY2lhdGVkIHdpdGggdGhlIFhlbgo+IGNvbW11bml0eSBpcyBs
YXJnZS4KPgo+IFRoZSBtaWNyb2NvZGUgaXMgYXZhaWxhYmxlIGZyb20KPiBodHRwczovL2dpdGh1
Yi5jb20vaW50ZWwvSW50ZWwtTGludXgtUHJvY2Vzc29yLU1pY3JvY29kZS1EYXRhLUZpbGVzLyBh
bmQKPiBodHRwczovL2FuZHJld2Nvb3AteGVuLnJlYWR0aGVkb2NzLmlvL2VuL2xhdGVzdC9hZG1p
bi1ndWlkZS9taWNyb2NvZGUtbG9hZGluZy5odG1sCj4gaXMgc29tZSBkb2N1bWVudGF0aW9uIEkg
cHJlcGFyZWQgZWFybGllci4KPgo+IEJleW9uZCB0aGF0LCBJIHRoaW5rIGl0IHdvdWxkIGhlbHAg
dG8ga25vdyBleGFjdGx5IGhvdyBsaWJ2bWkgaXMKPiBtYW5pcHVsYXRpbmcgdGhlIGd1ZXN0LgoK
SSBhbHJlYWR5IHN1Z2dlc3RlZCB0byBNYXRoaWV1IHRvIHRyeSB0byByZXByb2R1Y2UgdGhlIGlz
c3VlIHVzaW5nIHRoZQp4ZW4tYWNjZXNzIHRlc3QgdG9vbCB0aGF0J3MgaW4gdGhlIFhlbiB0cmVl
IHRvIGN1dCBvdXQgYWxsIHRoYXQKY29tcGxleGl0eS4gV2l0aG91dCBiZWluZyBhYmxlIHRvIGxp
bWl0IHRoZSBzY29wZSBvZiB0aGUgYnVnIGFuZCBiZWluZwphYmxlIHRvIHJlcHJvZHVjaWJsZSB0
cmlnZ2VyIGl0IEkgc2VlIGxpdHRsZSBjaGFuY2Ugb2YgZmluZGluZyB0aGUKcm9vdCBjYXVzZS4g
VW5mb3J0dW5hdGVseSBJIGRvbid0IGhhdmUgdGhlIHRpbWUgdG8gZG8gdGhhdCBteXNlbGYuCgpU
YW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
