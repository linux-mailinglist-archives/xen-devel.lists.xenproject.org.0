Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A35A143C29
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:41:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itrrM-0003u4-BD; Tue, 21 Jan 2020 11:38:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aBqa=3K=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1itrrK-0003tz-EC
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:38:14 +0000
X-Inumbo-ID: 815f27f6-3c42-11ea-ba77-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 815f27f6-3c42-11ea-ba77-12813bfff9fa;
 Tue, 21 Jan 2020 11:38:12 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so2636208wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2020 03:38:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EBIpi4bGLcog16j9JNuRm9Yobw3+kGUy+TXSoBIfJpw=;
 b=uTXP4RLIjMMsnrvAa53B6F6lCduXpmlCOai11a2jqCF/29iMyAueNnGMCod7yvZIKV
 KTCvN8TAejKWJG9ECxvvM4DVA7AKGsicAhOj9jwnTLlql5M8Mxy+coQQlTbDEBUvStyS
 feyM2fF0028hIVlyEEEABqvdwoozGo146CM7PIuC21MTj2XhD78Qo4HlhY0hyZUc+qVp
 1CqXHzPTBamC4VArWtUj+jkO6kvzqJUZsCCIkiuUYxMXTGsuQq0SDDQV/Ow44P9/XYbo
 lMGPC3GOS26A/aiNNjyE9o8e9b1etAa605sGL2ffEr/u45dYKYVuObv/EElCp3ccckTn
 XCfw==
X-Gm-Message-State: APjAAAXxmytcZAoPbbXtu9AfxLNHPJ90zcsPgQ0qawJaFNFFn4PVt265
 OInSN1e9BOZc3FHzrJmY9U8=
X-Google-Smtp-Source: APXvYqz/V6EbOLeHpwHw2CZvfw+LL97DKPwklfUPbzfZNM6WTDNnMmgLMb2wowOfLenP9hEeBA+cRg==
X-Received: by 2002:a05:600c:2c01:: with SMTP id
 q1mr3835855wmg.179.1579606692057; 
 Tue, 21 Jan 2020 03:38:12 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-238.amazon.com.
 [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id u16sm3379993wmj.41.2020.01.21.03.38.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2020 03:38:11 -0800 (PST)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200121101301.421-1-jgross@suse.com>
 <20200121101301.421-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <958c5f52-143c-e72f-a421-1071e6e27654@xen.org>
Date: Tue, 21 Jan 2020 11:38:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121101301.421-2-jgross@suse.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen: add config option to include
 failing condition in BUG_ON() message
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDIxLzAxLzIwMjAgMTA6MTMsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4g
VG9kYXkgYSB0cmlnZ2VyaW5nIEJVR19PTigpIHdpbGwgb25seSBwcmludCBzb3VyY2UgZmlsZSBh
bmQgbGluZQo+IGluZm9ybWF0aW9uLiBBZGQgdGhlIHBvc3NpYmlsaXR5IHRvIHByaW50IHRoZSB0
cmlnZ2VyaW5nIGNvbmRpdGlvbiBsaWtlCj4gQVNTRVJUKCkuCgpBbnkgcmVhc29uIHRvIG9ubHkg
bGltaXQgdGhlIGNoYW5nZSBmb3IgQlVHX09OPyBIb3cgYWJvdXQgV0FSTl9PTj8KCj4gCj4gRG8g
dGhhdCBieSBpbnRyb2R1Y2luZyBCVUdfVkVSQk9TRSgpIGFuZCBhZGQgYSBLY29uZmlnIG9wdGlv
biB0byBtYWtlCj4gQlVHX09OIHVzZSBCVUdfVkVSQk9TRSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAtLS0KPiBWMzoKPiAtIG1vdmUga2Nv
bmZpZyBvcHRpb24gb3V0IG9mIERFQlVHIHx8IGV4cGVydCBzZWN0aW9uIChKYW4gQmV1bGljaCkK
PiAtIGZpeCBBUk0gYnVpbGQgKEphbiBCZXVsaWNoKQo+IC0gZWxpbWluYXRlIEJVR19PTl9WRVJC
T1NFKCkgKEphbiBCZXVsaWNoKQo+IC0tLQo+ICAgeGVuL0tjb25maWcuZGVidWcgICAgICAgICB8
IDggKysrKysrKy0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vYnVnLmggfCA2ICsrKystLQo+ICAg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9idWcuaCB8IDUgKysrLS0KPiAgIHhlbi9pbmNsdWRlL3hlbi9s
aWIuaCAgICAgfCA0ICsrKysKPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL0tjb25maWcuZGVidWcgYi94ZW4v
S2NvbmZpZy5kZWJ1Zwo+IGluZGV4IGIzNTExZTgxYTIuLjc1Yzg1NWU0YWUgMTAwNjQ0Cj4gLS0t
IGEveGVuL0tjb25maWcuZGVidWcKPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zwo+IEBAIC0xMSw2
ICsxMSwxMyBAQCBjb25maWcgREVCVUcKPiAgIAo+ICAgCSAgWW91IHByb2JhYmx5IHdhbnQgdG8g
c2F5ICdOJyBoZXJlLgo+ICAgCj4gK2NvbmZpZyBERUJVR19CVUdWRVJCT1NFCj4gKwlib29sICJW
ZXJib3NlIEJVR19PTiBtZXNzYWdlcyIKPiArCWRlZmF1bHQgREVCVUcKPiArCS0tLWhlbHAtLS0K
PiArCSAgSW4gY2FzZSBhIEJVR19PTiB0cmlnZ2VycyBhZGRpdGlvbmFsbHkgcHJpbnQgdGhlIHRy
aWdnZXJpbmcKPiArCSAgY29uZGl0aW9uIG9uIHRoZSBjb25zb2xlLgo+ICsKPiAgIGlmIERFQlVH
IHx8IEVYUEVSVCA9ICJ5Igo+ICAgCj4gICBjb25maWcgQ1JBU0hfREVCVUcKPiBAQCAtODEsNyAr
ODgsNiBAQCBjb25maWcgUEVSRl9BUlJBWVMKPiAgIAktLS1oZWxwLS0tCj4gICAJICBFbmFibGVz
IHNvZnR3YXJlIHBlcmZvcm1hbmNlIGNvdW50ZXIgYXJyYXkgaGlzdG9ncmFtcy4KPiAgIAo+IC0K
CldoaWxlIEkgYWdyZWUgdGhpcyBzaG91bGQgYmUgZHJvcHBlZCB0aGlzIGlzIGEgc3B1cmlvdXMg
bGluZSwgdGhpcyBmZWVscyAKYSBiaXQgb3V0IG9mIGNvbnRleHQuIFNvIEkgd291bGQgc3VnZ2Vz
dCB0byBtZW50aW9uIGl0IGluIHRoZSBjb21taXQgCm1lc3NhZ2Ugb3Igc3BsaXQgaXQgaW4gYSBz
ZXBhcmF0ZSBwYXRjaC4KCj4gICBjb25maWcgVkVSQk9TRV9ERUJVRwo+ICAgCWJvb2wgIlZlcmJv
c2UgZGVidWcgbWVzc2FnZXMiCj4gICAJZGVmYXVsdCBERUJVRwo+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9hc20tYXJtL2J1Zy5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9idWcuaAo+IGluZGV4
IDM2YzgwMzM1N2MuLjkwYjIzMWU3N2EgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFy
bS9idWcuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vYnVnLmgKPiBAQCAtNjAsMTEgKzYw
LDEzIEBAIHN0cnVjdCBidWdfZnJhbWUgewo+ICAgCj4gICAjZGVmaW5lIFdBUk4oKSBCVUdfRlJB
TUUoQlVHRlJBTUVfd2FybiwgX19MSU5FX18sIF9fRklMRV9fLCAwLCAiIikKPiAgIAo+IC0jZGVm
aW5lIEJVRygpIGRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+IC0gICAgQlVHX0ZSQU1FKEJVR0ZSQU1FX2J1ZywgIF9fTElORV9fLCBfX0ZJTEVfXywg
MCwgIiIpOyAgICAgICAgXAo+ICsjZGVmaW5lIEJVR19WRVJCT1NFKG1zZykgZG8geyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgQlVHX0ZSQU1FKEJVR0ZSQU1FX2J1
ZywgIF9fTElORV9fLCBfX0ZJTEVfXywgMCwgbXNnKTsgICAgICAgXAoKSSBhbSBhZnJhaWQgdGhp
cyBpcyBub3QgZ29pbmcgdG8gYmUgZW5vdWdoIHRvIG1ha2UgaXQgd29yayBvbiBBcm0uIFlvdSAK
YWxzbyBuZWVkIHRvIHVwZGF0ZSBkb19idWdfZnJhbWUoKSB0byBwcmludCB0aGUgc3RyaW5nLgoK
SSB3b3VsZCBhY3R1YWxseSBleHBlY3QgYSBzaW1pbGFyIGNoYW5nZSByZXF1aXJlZCBvbiB0aGUg
eDg2IHNpZGUuIERvIAp5b3UgbWluZCBleHBsYWluaW5nIGhvdyB0aGlzIHdvcmtzPwoKPiAgICAg
ICB1bnJlYWNoYWJsZSgpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gICB9IHdoaWxlICgwKQo+ICAgCj4gKyNkZWZpbmUgQlVHKCkgQlVHX1ZFUkJPU0Uo
IiIpCj4gKwo+ICAgI2RlZmluZSBhc3NlcnRfZmFpbGVkKG1zZykgZG8geyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICBCVUdfRlJBTUUoQlVHRlJBTUVfYXNzZXJ0LCBf
X0xJTkVfXywgX19GSUxFX18sIDEsIG1zZyk7ICAgICBcCj4gICAgICAgdW5yZWFjaGFibGUoKTsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS9hc20teDg2L2J1Zy5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9idWcu
aAo+IGluZGV4IDliYjRhMTk0MjAuLjQ2ZDI4Mjc3N2YgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9idWcuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvYnVnLmgKPiBAQCAt
NjAsMTAgKzYwLDExIEBAIHN0cnVjdCBidWdfZnJhbWUgewo+ICAgCj4gICAKPiAgICNkZWZpbmUg
V0FSTigpIEJVR19GUkFNRShCVUdGUkFNRV93YXJuLCBfX0xJTkVfXywgX19GSUxFX18sIDAsIE5V
TEwpCj4gLSNkZWZpbmUgQlVHKCkgZG8geyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gLSAgICBCVUdfRlJBTUUoQlVHRlJBTUVfYnVnLCAgX19MSU5FX18s
IF9fRklMRV9fLCAwLCBOVUxMKTsgICAgICBcCj4gKyNkZWZpbmUgQlVHX1ZFUkJPU0UobXNnKSBk
byB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICBCVUdfRlJBTUUo
QlVHRlJBTUVfYnVnLCAgX19MSU5FX18sIF9fRklMRV9fLCAwLCBtc2cpOyAgICAgICBcCj4gICAg
ICAgdW5yZWFjaGFibGUoKTsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICAgfSB3aGlsZSAoMCkKPiArI2RlZmluZSBCVUcoKSBCVUdfVkVSQk9TRShOVUxM
KQo+ICAgCj4gICAjZGVmaW5lIHJ1bl9pbl9leGNlcHRpb25faGFuZGxlcihmbikgQlVHX0ZSQU1F
KEJVR0ZSQU1FX3J1bl9mbiwgMCwgZm4sIDAsIE5VTEwpCj4gICAKPiBkaWZmIC0tZ2l0IGEveGVu
L2luY2x1ZGUveGVuL2xpYi5oIGIveGVuL2luY2x1ZGUveGVuL2xpYi5oCj4gaW5kZXggNWQ3MThi
YmRiYS4uNTQzYjc1OTUyYSAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiAr
KysgYi94ZW4vaW5jbHVkZS94ZW4vbGliLmgKPiBAQCAtMjIsNyArMjIsMTEgQEAKPiAgICNpbmNs
dWRlIDx4ZW4vc3RyaW5nLmg+Cj4gICAjaW5jbHVkZSA8YXNtL2J1Zy5oPgo+ICAgCj4gKyNpZmRl
ZiBDT05GSUdfREVCVUdfQlVHVkVSQk9TRQo+ICsjZGVmaW5lIEJVR19PTihwKSAgZG8geyBpZiAo
dW5saWtlbHkocCkpIEJVR19WRVJCT1NFKCNwKTsgIH0gd2hpbGUgKDApCj4gKyNlbHNlCj4gICAj
ZGVmaW5lIEJVR19PTihwKSAgZG8geyBpZiAodW5saWtlbHkocCkpIEJVRygpOyAgfSB3aGlsZSAo
MCkKPiArI2VuZGlmCj4gICAjZGVmaW5lIFdBUk5fT04ocCkgZG8geyBpZiAodW5saWtlbHkocCkp
IFdBUk4oKTsgfSB3aGlsZSAoMCkKPiAgIAo+ICAgI2lmIF9fR05VQ19fID4gNCB8fCAoX19HTlVD
X18gPT0gNCAmJiBfX0dOVUNfTUlOT1JfXyA+PSA2KQo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
