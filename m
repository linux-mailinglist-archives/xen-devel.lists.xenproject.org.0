Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F071680D5
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:53:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j59eD-0004Ti-5y; Fri, 21 Feb 2020 14:51:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jzOO=4J=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j59eB-0004TU-Dz
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:51:19 +0000
X-Inumbo-ID: 9dab1891-54b9-11ea-868f-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9dab1891-54b9-11ea-868f-12813bfff9fa;
 Fri, 21 Feb 2020 14:51:18 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so2189808wmi.5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Feb 2020 06:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kM0QfpCHFyjvQhpIv5RSiOUByekduc0BHzDnViQldH8=;
 b=Kz1udUJJ3uFBZrbydPLLtUlKsLxrl2dkdna+ZOV0ywP58k1Zgu7K7jJqIXXrCbpsVZ
 yBSohVA2VyUzSeLD36KzOos7NhvJA9Ubh0SaX3D/6Qnmr8u2UmYmug9BxSIcX+LIZagZ
 sBC7674cZmvyVi8GNkNBZpCzaPVy9yrx9K4MiUmNxi0CE+k4gR5cPh50igbPB2mZjcXs
 9YkMbgX4Dqr4hbo1CFUk/maYoQqvDYcdG1Cm/+hVpEsMWkcbEKujIlG6J6lKHpPykmgQ
 t7eaE/QA7JS1oV/dONVRSQlShBWgH+FVC1bPTYfrgdwQ70wFw1WpK8J0BBqSZBkx8Eja
 DQKg==
X-Gm-Message-State: APjAAAUUDfiJU2QY/HLHGFkbWkANMTMy1pi1g2EeBLb7Rt0lKrz/mYed
 eoJeXgr5+bTfOpBiQtFQg3euAW2XJvFyJA==
X-Google-Smtp-Source: APXvYqyXn7cb7yzUf6SWqRoeq9K/HhiXKqMAPQww6orBO+wNVMnC1q4qUxyyMMW/akL/h3froCWHug==
X-Received: by 2002:a05:600c:2c47:: with SMTP id
 r7mr4212701wmg.123.1582296677401; 
 Fri, 21 Feb 2020 06:51:17 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-235.amazon.com.
 [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id 5sm4310981wrc.75.2020.02.21.06.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Feb 2020 06:51:16 -0800 (PST)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20200220173116.88915-1-roger.pau@citrix.com>
 <83d48223-21eb-be54-985c-085449661892@xen.org>
 <20200221091005.GT4679@Air-de-Roger>
 <ac7ffe8b-06b0-655e-e842-cbc5d47ea85f@suse.com>
 <240c6e13-0b10-214f-cf8d-d1ab64eb441f@suse.com>
 <e5be3888-6252-f03c-675d-8d7dfd9330b8@xen.org>
 <21c59ebb-e396-447f-5ac1-d7e2efd76bb5@suse.com>
 <430123f5-afa9-4364-b703-f26279a7c585@xen.org>
 <21dcd066-87b0-4498-ba18-bfec718c7f1d@suse.com>
 <5005d791-7d8f-ca03-4c16-7dc9d19bc8e6@xen.org>
 <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6163a60b-5a7f-90c0-1ba3-e9a96f8e88f2@xen.org>
Date: Fri, 21 Feb 2020 14:51:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <92fa042e-a880-8b56-4255-c8d19654908b@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] rwlock: allow recursive read locking
 when already locked in write mode
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyMS8wMi8yMDIwIDE0OjM1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+IE9uIDIxLjAyLjIw
IDE1OjMyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDIxLzAyLzIwMjAgMTQ6MTYs
IErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMCAxNToxMSwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+IEhpIEp1ZXJnZW4sCj4+Pj4KPj4+PiBPbiAyMS8wMi8yMDIwIDE0OjA2LCBK
w7xyZ2VuIEdyb8OfIHdyb3RlOgo+Pj4+PiBPbiAyMS4wMi4yMCAxNDo0OSwgSnVsaWVuIEdyYWxs
IHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAyMS8wMi8yMDIwIDEzOjQ2LCBKw7xyZ2Vu
IEdyb8OfIHdyb3RlOgo+Pj4+Pj4+IE9uIDIxLjAyLjIwIDE0OjM2LCBKYW4gQmV1bGljaCB3cm90
ZToKPj4+Pj4+Pj4gT24gMjEuMDIuMjAyMCAxMDoxMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToK
Pj4+Pj4+Pj4+IE9uIFRodSwgRmViIDIwLCAyMDIwIGF0IDA3OjIwOjA2UE0gKzAwMDAsIEp1bGll
biBHcmFsbCB3cm90ZToKPj4+Pj4+Pj4+PiBIaSwKPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IE9uIDIw
LzAyLzIwMjAgMTc6MzEsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+Pj4+Pj4+Pj4gQWxsb3cg
YSBDUFUgYWxyZWFkeSBob2xkaW5nIHRoZSBsb2NrIGluIHdyaXRlIG1vZGUgdG8gYWxzbyAKPj4+
Pj4+Pj4+Pj4gbG9jayBpdCBpbgo+Pj4+Pj4+Pj4+PiByZWFkIG1vZGUuIFRoZXJlJ3Mgbm8gaGFy
bSBpbiBhbGxvd2luZyByZWFkIGxvY2tpbmcgYSByd2xvY2sgCj4+Pj4+Pj4+Pj4+IHRoYXQncwo+
Pj4+Pj4+Pj4+PiBhbHJlYWR5IG93bmVkIGJ5IHRoZSBjYWxsZXIgKGllOiBDUFUpIGluIHdyaXRl
IG1vZGUuIEFsbG93aW5nIAo+Pj4+Pj4+Pj4+PiBzdWNoCj4+Pj4+Pj4+Pj4+IGFjY2Vzc2VzIGlz
IHJlcXVpcmVkIGF0IGxlYXN0IGZvciB0aGUgQ1BVIG1hcHMgdXNlLWNhc2UuCj4+Pj4+Pj4+Pj4+
Cj4+Pj4+Pj4+Pj4+IEluIG9yZGVyIHRvIGRvIHRoaXMgcmVzZXJ2ZSAxNGJpdHMgb2YgdGhlIGxv
Y2ssIHRoaXMgYWxsb3dzIAo+Pj4+Pj4+Pj4+PiB0byBzdXBwb3J0Cj4+Pj4+Pj4+Pj4+IHVwIHRv
IDE2Mzg0IENQVXMuIEFsc28gcmVkdWNlIHRoZSB3cml0ZSBsb2NrIG1hc2sgdG8gMiBiaXRzOiAK
Pj4+Pj4+Pj4+Pj4gb25lIHRvCj4+Pj4+Pj4+Pj4+IHNpZ25hbCB0aGVyZSBhcmUgcGVuZGluZyB3
cml0ZXJzIHdhaXRpbmcgb24gdGhlIGxvY2sgYW5kIHRoZSAKPj4+Pj4+Pj4+Pj4gb3RoZXIgdG8K
Pj4+Pj4+Pj4+Pj4gc2lnbmFsIHRoZSBsb2NrIGlzIG93bmVkIGluIHdyaXRlIG1vZGUuIE5vdGUg
dGhlIHdyaXRlIAo+Pj4+Pj4+Pj4+PiByZWxhdGVkIGRhdGEKPj4+Pj4+Pj4+Pj4gaXMgdXNpbmcg
MTZiaXRzLCB0aGlzIGlzIGRvbmUgaW4gb3JkZXIgdG8gYmUgYWJsZSB0byBjbGVhciBpdCAKPj4+
Pj4+Pj4+Pj4gKGFuZAo+Pj4+Pj4+Pj4+PiB0aHVzIHJlbGVhc2UgdGhlIGxvY2spIHVzaW5nIGEg
MTZiaXQgYXRvbWljIHdyaXRlLgo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBUaGlzIHJlZHVjZXMg
dGhlIG1heGltdW0gbnVtYmVyIG9mIGNvbmN1cnJlbnQgcmVhZGVycyBmcm9tIAo+Pj4+Pj4+Pj4+
PiAxNjc3NzIxNiB0bwo+Pj4+Pj4+Pj4+PiA2NTUzNiwgSSB0aGluayB0aGlzIHNob3VsZCBzdGls
bCBiZSBlbm91Z2gsIG9yIGVsc2UgdGhlIGxvY2sgCj4+Pj4+Pj4+Pj4+IGZpZWxkCj4+Pj4+Pj4+
Pj4+IGNhbiBiZSBleHBhbmRlZCBmcm9tIDMyIHRvIDY0Yml0cyBpZiBhbGwgYXJjaGl0ZWN0dXJl
cyAKPj4+Pj4+Pj4+Pj4gc3VwcG9ydCBhdG9taWMKPj4+Pj4+Pj4+Pj4gb3BlcmF0aW9ucyBvbiA2
NGJpdCBpbnRlZ2Vycy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IEZXSVcsIGFybTMyIGlzIGFibGUg
dG8gc3VwcG9ydCBhdG9taWMgb3BlcmF0aW9ucyBvbiA2NC1iaXQgCj4+Pj4+Pj4+Pj4gaW50ZWdl
cnMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gwqDCoCBzdGF0aWMgaW5saW5lIHZvaWQgX3dyaXRl
X3VubG9jayhyd2xvY2tfdCAqbG9jaykKPj4+Pj4+Pj4+Pj4gwqDCoCB7Cj4+Pj4+Pj4+Pj4+IC3C
oMKgwqAgLyoKPj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICogSWYgdGhlIHdyaXRlciBmaWVsZCBpcyBh
dG9taWMsIGl0IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4KPj4+Pj4+Pj4+
Pj4gLcKgwqDCoMKgICogT3RoZXJ3aXNlLCBhbiBhdG9taWMgc3VidHJhY3Rpb24gd2lsbCBiZSB1
c2VkIHRvIAo+Pj4+Pj4+Pj4+PiBjbGVhciBpdC4KPj4+Pj4+Pj4+Pj4gLcKgwqDCoMKgICovCj4+
Pj4+Pj4+Pj4+IC3CoMKgwqAgYXRvbWljX3N1YihfUVdfTE9DS0VELCAmbG9jay0+Y250cyk7Cj4+
Pj4+Pj4+Pj4+ICvCoMKgwqAgLyogU2luY2UgdGhlIHdyaXRlciBmaWVsZCBpcyBhdG9taWMsIGl0
IGNhbiBiZSBjbGVhcmVkIAo+Pj4+Pj4+Pj4+PiBkaXJlY3RseS4gKi8KPj4+Pj4+Pj4+Pj4gK8Kg
wqDCoCBBU1NFUlQoX2lzX3dyaXRlX2xvY2tlZF9ieV9tZShhdG9taWNfcmVhZCgmbG9jay0+Y250
cykpKTsKPj4+Pj4+Pj4+Pj4gK8KgwqDCoCBCVUlMRF9CVUdfT04oX1FSX1NISUZUICE9IDE2KTsK
Pj4+Pj4+Pj4+Pj4gK8KgwqDCoCB3cml0ZV9hdG9taWMoKHVpbnQxNl90ICopJmxvY2stPmNudHMs
IDApOwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSSB0aGluayB0aGlzIGlzIGFuIGFidXNlIHRvIGNh
c3QgYW4gYXRvbWljX3QoKSBkaXJlY3RseSBpbnRvIGEgCj4+Pj4+Pj4+Pj4gdWludDE2X3QuIFlv
dQo+Pj4+Pj4+Pj4+IHdvdWxkIGF0IGxlYXN0IHdhbnQgdG8gdXNlICZsb2NrLT5jbnRzLmNvdW50
ZXIgaGVyZS4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBTdXJlLCBJIHdhcyB3b25kZXJpbmcgYWJvdXQg
dGhpcyBteXNlbGYuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gV2lsbCB3YWl0IGZvciBtb3JlIGNvbW1l
bnRzLCBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgY2FuIGJlIGZpeGVkIAo+Pj4+Pj4+Pj4gdXBvbgo+
Pj4+Pj4+Pj4gY29tbWl0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBpc3N1ZXMuCj4+Pj4+Pj4+Cj4+
Pj4+Pj4+IEl0J3MgbW9yZSB0aGFuIGp1c3QgYWRkaW5nIGFub3RoZXIgZmllbGQgc3BlY2lmaWVy
IGhlcmUuIEEgY2FzdCAKPj4+Pj4+Pj4gbGlrZQo+Pj4+Pj4+PiB0aGlzIG9uZSBpcyBlbmRpYW5u
ZXNzLXVuc2FmZSwgYW5kIGhlbmNlIGEgdHJhcCB3YWl0aW5nIGZvciBhIGJpZwo+Pj4+Pj4+PiBl
bmRpYW4gcG9ydCBhdHRlbXB0IHRvIGZhbGwgaW50by4gQXQgdGhlIHZlcnkgbGVhc3QgdGhpcyBz
aG91bGQgCj4+Pj4+Pj4+IGNhdXNlCj4+Pj4+Pj4+IGEgYnVpbGQgZmFpbHVyZSBvbiBiaWcgZW5k
aWFuIHN5c3RlbXMsIGV2ZW4gYmV0dGVyIHdvdWxkIGJlIGlmIAo+Pj4+Pj4+PiBpdCB3YXMKPj4+
Pj4+Pj4gZW5kaWFubmVzcy1zYWZlLgo+Pj4+Pj4+Cj4+Pj4+Pj4gV291bGRuJ3QgYSB1bmlvbiBi
ZSB0aGUgYmV0dGVyIGNob2ljZT8KPj4+Pj4+Cj4+Pj4+PiBZb3Ugd291bGQgbm90IGJlIGFibGUg
dG8gdXNlIGF0b21pY190IGluIHRoYXQgY2FzZSBhcyB5b3UgY2FuJ3QgCj4+Pj4+PiBhc3N1bWUg
dGhlIGxheW91dCBvZiB0aGUgc3RydWN0dXJlLgo+Pj4+Pgo+Pj4+PiB1bmlvbiByd2xvY2t3b3Jk
IHsKPj4+Pj4gwqDCoMKgwqAgYXRvbWljX3QgY250czsKPj4+Pj4gwqDCoMKgwqAgdWludDMyX3Qg
dmFsOwo+Pj4+PiDCoMKgwqDCoCBzdHJ1Y3Qgewo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQx
Nl90IHdyaXRlOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIHVpbnQxNl90IHJlYWRlcnM7Cj4+Pj4+
IMKgwqDCoMKgIH07Cj4+Pj4+IH07Cj4+Pj4+Cj4+Pj4+IHN0YXRpYyBpbmxpbmUgY29uc3QgdWlu
dDMyX3QgX3FyX2JpYXMoCj4+Pj4+IMKgwqDCoMKgIGNvbnN0IHVuaW9uIHJ3bG9ja3dvcmQgewo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIC53cml0ZSA9IDAsCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqAg
LnJlYWRlcnMgPSAxCj4+Pj4+IMKgwqDCoMKgIH0geDsKPj4+Pj4KPj4+Pj4gwqDCoMKgwqAgcmV0
dXJuIHgudmFsOwo+Pj4+PiB9Cj4+Pj4+Cj4+Pj4+IC4uLgo+Pj4+PiDCoMKgwqDCoCBjbnRzID0g
YXRvbWljX2FkZF9yZXR1cm4oX3FyX2JpYXMoKSwgJmxvY2stPmNudHMpOwo+Pj4+PiAuLi4KPj4+
Pj4KPj4+Pj4gSSBndWVzcyB0aGlzIHNob3VsZCBkbyB0aGUgdHJpY2ssIG5vPwo+Pj4+Cj4+Pj4g
WW91IGFyZSBhc3N1bWluZyB0aGUgYXRvbWljX3QgbGF5b3V0IHdoaWNoIEkgd291bGQgcmF0aGVy
IG5vIHdhbnQgdG8gCj4+Pj4gaGFwcGVuLgo+Pj4KPj4+IFRoYXQgYWxyZWFkeSBoYXBwZW5lZC4g
cndsb2NrLmggYWxyZWFkeSBhc3N1bWVzIGF0b21pY190IHRvIGJlIDMyIGJpdHMKPj4+IHdpZGUu
IEkgYWdyZWUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGhhdmUgYW4gYXRvbWljMzJfdCB0eXBlIGZv
ciB0aGlzCj4+PiB1c2UgY2FzZS4KPj4KPj4gSSBkb24ndCB0aGluayB5b3UgdW5kZXJzdG9vZCBt
eSBwb2ludCBoZXJlLiBBbiBhdG9taWMzMl90IHdpbGwgbm90IGJlIAo+PiBiZXR0ZXIgYXMgeW91
IHN0aWxsIGFzc3VtZSB0aGUgbGF5b3V0IG9mIHRoZSBzdHJ1Y3R1cmUuIEkuZSB0aGUgCj4+IHN0
cnVjdHVyZSBoYXMgb25seSBvbmUgZmllbGQuCj4gCj4gSSBkb24ndCB1bmRlcnN0YW5kIHlvdXIg
cmVhc29uaW5nIGhlcmUsIHNvcnJ5Lgo+IAo+IEFyZSB5b3Ugc2F5aW5nIHRoYXQgYSBzdHJ1Y3R1
cmUgb2YgdHdvIHVpbnQxNl90IGlzbid0IGtub3duIHRvIGJlIDMyCj4gYml0cyBsb25nPwoKWW91
IGFyZSBhc3N1bWluZyB0aGF0IGF0b21pY190IHdpbGwgYWx3YXlzIGJlOgoKc3RydWN0CnsKICAg
aW50IGNvdW50ZXI7Cn0KCldoYXQgaWYgd2UgZGVjaWRlIHRvIHR1cm4gaW50bwoKc3RydWN0CnsK
ICAgYm9vbCBhOwogICBpbnQgY291bnRlcjsKfQoKWW91IHdvdWxkIGF0IGxlYXN0IHdhbnQgYSBC
VUlMRF9CVUdfT04oKSBhcyBhdCB0aGUgY29tcGlsZXIgd2lsbCB0aHJvdyAKeW91IGFuIGVycm9y
IHJhdGhlciB0aGFuIGhhcHBpbHkgY291bnRpbnVpbmcuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
