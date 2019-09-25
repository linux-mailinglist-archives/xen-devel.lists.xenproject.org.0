Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AED62BE460
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 20:11:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDBhE-0000hP-5W; Wed, 25 Sep 2019 18:07:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLTF=XU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1iDBhD-0000hK-6f
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 18:07:23 +0000
X-Inumbo-ID: 51ad0968-dfbf-11e9-bf31-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by localhost (Halon) with ESMTPS
 id 51ad0968-dfbf-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 18:07:22 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x80so4924091lff.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2019 11:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=p48WCs3AfOJUTXhEymPrQ6PTodjLBaYakBkfe3O1pog=;
 b=aYq28rfRF8OSX+K5m/NiaRoyPN8tp5IIVEwptiGBWf2aMWZQsNm2BejqyTskXulHAK
 Hg7+pemqJKva66LTWoofr9NqEJcagic/wJcDInkd3DAY5j7enZIOIfDKFqs/yOvjvWbH
 w3HsIwIbigIdChoUuGzWSqlm8Bjvi1jEnKNDCv2xyeuE+9YA7CAGQW85MMy/UI9bna6/
 Xm+DwWpnZLbXC+l7t18RmGzR8AWK76sUxOgE8qVlOQuDBqGryURrkpxb/sOhCJjjCetq
 LFt+ZM8gh0BApR9HZQfN9DKMX2i7m0x4hBQzw2IFOfD6AhIvIQ2ubPHH6nWHH/YJ14La
 TDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=p48WCs3AfOJUTXhEymPrQ6PTodjLBaYakBkfe3O1pog=;
 b=BrPf6z8JlWWX/hETGrZvNWMCSJT0pkyMs1WLPmfItDJRUh7P6brVdW1DfeES+5x4mt
 Qp6ORJMmgmny4v5kzTXccDBtfHrWbz2Va2xKBzBsk0ttumi5zbX7GObvavmvDO0OoZIt
 +xMtEaaqkQ4uhY/06bJ18x8L2owjZOigSHBMRVWcysY/tfbtQxoQPry0zNovQ6m1Yxlv
 7Jq3/QIcle/2m1DCgzwmSaDzJ7QcQjlZ5HiG88jjrTtuz5ocnHAExedclvNssJVpEmgm
 c+Bj5tqNmNbir9tETOLBRv7qc7/TBYFwuhFZpWfWE4P8VCv1EKjfBvH5Xp0ME2zQq14D
 ec+g==
X-Gm-Message-State: APjAAAW9eGpxei8WeRAFr2sNRzcS+btDFDkEZ0UtO+SrjNFxmslogXdh
 RIEgGh+1bVpRVaTA05L8jgw=
X-Google-Smtp-Source: APXvYqyqo4OheEO/twXqd6IvGqBAE/TK6IoZr+laze2IsDQRklLqbN3/OlXI/Tex6uCc5dbb3uCSzg==
X-Received: by 2002:a19:14f:: with SMTP id 76mr6700053lfb.92.1569434840812;
 Wed, 25 Sep 2019 11:07:20 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id w30sm1286255lfn.82.2019.09.25.11.07.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 11:07:19 -0700 (PDT)
From: Oleksandr <olekstysh@gmail.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <5735846b-1a52-3260-39bd-e393c87dfb64@gmail.com>
Message-ID: <f6b6185c-33b9-fca4-ec0b-f405ff7c3cea@gmail.com>
Date: Wed, 25 Sep 2019 21:07:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5735846b-1a52-3260-39bd-e393c87dfb64@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, David Scott <dave@recoil.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpIFBhdWwKCgo+Pj4KPj4+IEkgbWF5IG1pc3Rha2UsIGJ1dCBsb29rcyBsaWtlCj4+Pgo+Pj4g
ODBmZjNkMzM4ZGM5MzI2MGI0MWZmZWVlYmIwZjg1MmMyZWRlZjljZSBpb21tdTogdGlkeSB1cAo+
Pj4gaW9tbXVfdXNlX2hhcF9wdCgpIGFuZCBuZWVkX2lvbW11X3B0X3N5bmMoKSBtYWNyb3MKPj4+
Cj4+PiB0cmlnZ2VycyBBU1NFUlRfVU5SRUFDSEFCTEUgb24gQXJtIGlmIG5vIElPTU1VIGhhcyBi
ZWVuIGZvdW5kIChJIGJ1aWx0Cj4+PiB3aXRoIG15IHBsYXRmb3JtJ3MgSU9NTVUgZHJpdmVyIGRp
c2FibGVkOiAjIENPTkZJR19JUE1NVV9WTVNBIGlzIG5vdCAKPj4+IHNldCkgLgo+Pj4KPj4+IFNv
LCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpdGgKPj4+
IGlvbW11X2hhcF9wdF9zaGFyZSBiZWluZyBzZXQgKENPTkZJR19JT01NVV9GT1JDRV9QVF9TSEFS
RT15KSB3aGljaCwKPj4+IGFjdHVhbGx5LCB0cmlnZ2VycyBBU1NFUlQuCj4+Pgo+PiBIZXJlIGEg
bWluaW1hbCBwYXRjaCwgbGVhdmluZyAnZm9yY2UgcHQgc2hhcmUnIGluIHBsYWNlLiBEb2VzIHRo
aXMgCj4+IGF2b2lkIHRoZSBwcm9ibGVtPwo+Pgo+PiAtLS04PC0tLQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9zeXNjdGwuYyBiL3hlbi9jb21tb24vc3lzY3RsLmMKPj4gaW5kZXggZTg3NjNj
N2ZkZi4uZjg4YTI4NWU3ZiAxMDA2NDQKPj4gLS0tIGEveGVuL2NvbW1vbi9zeXNjdGwuYwo+PiAr
KysgYi94ZW4vY29tbW9uL3N5c2N0bC5jCj4+IEBAIC0yNjgsOSArMjY4LDExIEBAIGxvbmcgCj4+
IGRvX3N5c2N0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9zeXNjdGxfdCkgdV9zeXNjdGwp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBwaS0+bWF4X21mbiA9IGdldF91cHBlcl9tZm5fYm91bmQo
KTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFyY2hfZG9fcGh5c2luZm8ocGkpOwo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKCBpb21tdV9lbmFibGVkICkKPj4gK8KgwqDCoMKgwqDCoMKgIHsKPj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGktPmNhcGFiaWxpdGllcyB8PSBYRU5fU1lTQ1RM
X1BIWVNDQVBfZGlyZWN0aW87Cj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIGlvbW11X2hhcF9wdF9z
aGFyZSApCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVO
X1NZU0NUTF9QSFlTQ0FQX2lvbW11X2hhcF9wdF9zaGFyZTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCBpb21tdV9oYXBfcHRfc2hhcmUgKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHBpLT5jYXBhYmlsaXRpZXMgfD0gCj4+IFhFTl9TWVNDVExfUEhZU0NBUF9pb21t
dV9oYXBfcHRfc2hhcmU7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Cj4+Cj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpZiAoIGNvcHlfdG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAxKSApCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FRkFVTFQ7Cj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVk
ZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+IGluZGV4IDdjMzAwM2Yz
ZjEuLjZhMTBhMjQxMjggMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCj4+IEBAIC02OCw4ICs2OCw2IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBjbGVhcl9pb21tdV9oYXBfcHRfc2hhcmUodm9pZCkKPj4gwqAgewo+PiDC
oCAjaWZuZGVmIGlvbW11X2hhcF9wdF9zaGFyZQo+PiDCoMKgwqDCoMKgIGlvbW11X2hhcF9wdF9z
aGFyZSA9IGZhbHNlOwo+PiAtI2VsaWYgaW9tbXVfaGFwX3B0X3NoYXJlCj4+IC3CoMKgwqAgQVNT
RVJUX1VOUkVBQ0hBQkxFKCk7Cj4+IMKgICNlbmRpZgo+PiDCoCB9Cj4+IC0tLTg8LS0tCj4+Cj4+
IMKgwqAgUGF1bAo+Cj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIGJ1dCBJIG5lZWQgc29tZSB0
aW1lIHRvIGNoZWNrIGl0IChub3cgSSBoYXZlIAo+IHNvbWUgdHJvdWJsZXMgd2l0aCBzdGFydGlu
ZyBndWVzdCBWTSkuIEkgd2lsbCBpbmZvcm0geW91IG9uY2UgSSBjaGVjay4KCgpXaXRoIHRoZSBw
YXRjaCBhcHBsaWVkLCB0aGUgaXNzdWUgSSBoYXZlIGZhY2VkIChkdXJpbmcgWGVuIGJvb3QpIGlz
IGdvbmUgCmF3YXkuIEJ1dCwgSSBoYXZlbid0IGFuYWx5emVkIHlvdXIgInBlci1kb21haW4gSU9N
TVUgY29udHJvbCBzZXJpZXMiIHlldCAKdG8gaGF2ZSBvcGluaW9uIHJlZ2FyZGluZyB5b3VyIHBh
dGNoIGl0c2VsZi4KCgpJIG5vdGljZWQgdGhlIGZvbGxvd2luZzoKCldoZW4gaW9tbXVfZW5hYmxl
ZCA9IGZhbHNlIChteSBjYXNlLCB3aGVuIElPTU1VIGRyaXZlciBpcyBkaXNhYmxlKSwgSSAKY2Fu
J3QgY3JlYXRlIGd1ZXN0IFZNIGlmICJkdGRldiIgcHJvcGVydHkgaXMgcHJlc2VudCBhbmQgY29u
dGFpbnMgRE1BIAptYXN0ZXJzIGluIHRoZSBkb21haW4gY29uZmlnOgoKUGFyc2luZyBjb25maWcg
ZnJvbSAveHQvZG9tLmNmZy9kb21kLmNmZwpFUlJPUjogcGFzc3Rocm91Z2ggbm90IHN1cHBvcnRl
ZCBvbiB0aGlzIHBsYXRmb3JtCgpFdmVuIGlmIEkgYWRkIHBhc3N0aHJvdWdoID0gImRpc2FibGVk
IiwgaXQgc3RpbGwgZGVuaWVzOgoKUGFyc2luZyBjb25maWcgZnJvbSAveHQvZG9tLmNmZy9kb21k
LmNmZwpFUlJPUjogcGFzc3Rocm91Z2ggZGlzYWJsZWQgYnV0IGRldmljZXMgYXJlIHNwZWNpZmll
ZAoKTG9va3MgbGlrZSwgY29ycmVjdCBiZWhhdmlvci4uLgoKCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
