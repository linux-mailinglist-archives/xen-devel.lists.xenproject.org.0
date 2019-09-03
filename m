Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE312A71A3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 19:28:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5CYF-0001H3-5f; Tue, 03 Sep 2019 17:25:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e6YO=W6=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i5CYD-0001Gy-GQ
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 17:25:05 +0000
X-Inumbo-ID: c450edd8-ce6f-11e9-b76c-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c450edd8-ce6f-11e9-b76c-bc764e2007e4;
 Tue, 03 Sep 2019 17:25:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id n2so368027wmk.4
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2019 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SQDL+4xWXdcRYDlAu7CMEFG9DvPfl/yhdfpbsfLsuc=;
 b=mnr5RXqSRUrveA07MzwWeA7s1+QJcVGUJeiEvSwRyAa+e+6/CjzCsSi6YRe6ky5LMv
 d94kxCW5Vc1sBn6bELSnXeP3BMM2bIuF6kLXjwEqMOMNHcp0Hu/fZruqIVLwT8eRjt0A
 4nAug+As60mD1r/taimEf9nEvJ/GWSpczifVadETtyB1MWLkZWIqeQl1JBNc08ToLnWo
 2glt3Gz1YDYCd2kNshzR1rcxs8Ii96NlbKHEQ73YXfiyOhQE+PWN6BlW7B9rJqJ8Kq00
 Cfb7/CayiQ0Xtf+cy+yIuwJD2QAxbYfvvXieXY8CMc6yIvJAbkH88C5xTLrU38PV4IZg
 n+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SQDL+4xWXdcRYDlAu7CMEFG9DvPfl/yhdfpbsfLsuc=;
 b=f0LllRJC4FWi5XHCxb0ZiIv217ognEiePGeqG8XL+jI77l7U1qDJy1Zt7YYN8qSmzt
 a7vd7F903qTLA5SMCIzsolW3x2XEQHXO7mnvnneHye2apKyMfad1eSw1jlkKjR18VNMV
 d3pumIl2QNMiHNIt7r77grSMetmQ0n1tkepfYKTfJsnOpmCPDavkJ49Z5Zw8iv4yZoa2
 /mo8W+eVBKHRrxlp1OMqhGknm57rFiMTNlVHNMoxRcjG8kVJiIYqyp4cNPW3JLErp6EB
 rwdKi/SpqQs5vfFTTt/C1NmaawbqOtqd+cUt3xLqU2KRzrgjWXoch1LI7qrCpCjMhE1F
 kDoA==
X-Gm-Message-State: APjAAAUdqQ7ZdyaYQ70gloHlmYksV8yrHoDMBZyNkAai0qXnCJY03Wq+
 zH0RmZFhi39DgMx2d6Le7iKbWZF578KPdqDl8XA=
X-Google-Smtp-Source: APXvYqzehtT69DrLpRCsHq9aQN3R8dwDvIHcliUe/eoPzIkJqa3NFpbbcfTayq7C+e+tp3uwH/g28JD2I5TfVdgxpmE=
X-Received: by 2002:a7b:c752:: with SMTP id w18mr432332wmk.129.1567531503712; 
 Tue, 03 Sep 2019 10:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
In-Reply-To: <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 3 Sep 2019 11:24:26 -0600
Message-ID: <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCA5OjUzIEFNIEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4gd3JvdGU6Cj4KPiBPbiAwMi4wOS4yMDE5IDEwOjExLCBBbGV4YW5kcnUgU3RlZmFuIElT
QUlMQSB3cm90ZToKPiA+IEBAIC0xMzU1LDYgKzEzNTUsMjMgQEAgdm9pZCBwMm1faW5pdF9hbHRw
Mm1fZXB0KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpKQo+ID4gICAgICBlcHQgPSAm
cDJtLT5lcHQ7Cj4gPiAgICAgIGVwdC0+bWZuID0gcGFnZXRhYmxlX2dldF9wZm4ocDJtX2dldF9w
YWdldGFibGUocDJtKSk7Cj4gPiAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbaV0gPSBlcHQtPmVw
dHA7Cj4gPiArCj4gPiArICAgIGlmICggc2V0X3N2ZSApCj4gPiArICAgIHsKPiA+ICsgICAgICAg
IHVuc2lnbmVkIGxvbmcgZ2ZuID0gMCwgbWF4X2dwZm4gPSBkb21haW5fZ2V0X21heGltdW1fZ3Bm
bihkKTsKPiA+ICsKPiA+ICsgICAgICAgIGZvciggOyBnZm4gPCBtYXhfZ3BmbjsgKytnZm4gKQo+
ID4gKyAgICAgICAgewo+ID4gKyAgICAgICAgICAgIG1mbl90IG1mbjsKPiA+ICsgICAgICAgICAg
ICBwMm1fYWNjZXNzX3QgYTsKPiA+ICsgICAgICAgICAgICBwMm1fdHlwZV90IHQ7Cj4gPiArCj4g
PiArICAgICAgICAgICAgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkocDJtLCBfZ2ZuKGdmbiks
ICZtZm4sICZ0LCAmYSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBBUDJNR0VUX3F1ZXJ5KTsKPiA+ICsgICAgICAgICAgICBwMm0tPnNldF9lbnRyeShwMm0sIF9n
Zm4oZ2ZuKSwgbWZuLCBQQUdFX09SREVSXzRLLCB0LCBhLCB0cnVlKTsKPiA+ICsKPiA+ICsgICAg
ICAgIH0KPiA+ICsgICAgfQo+ID4gIH0KPgo+IEhvdyBsb25nIGlzIHRoaXMgbG9vcCBnb2luZyB0
byB0YWtlIGZvciBhIGh1Z2UgZ3Vlc3Q/IElPVyBob3cKPiBjb21lIHRoZXJlJ3Mgbm8gcHJlZW1w
dGlvbiBpbiBoZXJlLCBvciBzb21lIG90aGVyIG1lY2hhbmlzbQo+IHRvIGJvdW5kIGV4ZWN1dGlv
biB0aW1lPwoKQWxzbywgbG9va3MgdG8gbWUgeW91IHNob3VsZCBjaGVjayB3aGV0aGVyIHRoZSBt
Zm4gaXMgdmFsaWQgYmVmb3JlCmNhbGxpbmcgcDJtLT5zZXRfZW50cnkuCgo+Cj4gPiAtLS0gYS94
ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL2h2bV9vcC5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9wdWJs
aWMvaHZtL2h2bV9vcC5oCj4gPiBAQCAtMjQ0LDYgKzI0NCw3IEBAIHN0cnVjdCB4ZW5faHZtX2Fs
dHAybV92aWV3IHsKPiA+ICAgICAgLyogQ3JlYXRlIHZpZXcgb25seTogZGVmYXVsdCBhY2Nlc3Mg
dHlwZQo+ID4gICAgICAgKiBOT1RFOiBjdXJyZW50bHkgaWdub3JlZCAqLwo+ID4gICAgICB1aW50
MTZfdCBodm1tZW1fZGVmYXVsdF9hY2Nlc3M7IC8qIHhlbm1lbV9hY2Nlc3NfdCAqLwo+ID4gKyAg
ICB1aW50OF90IHNldF9zdmU7IC8qIGJvb2wgdmFsdWUgKi8KPiA+ICB9Owo+Cj4gVGhpcyBpbnRl
cmZhY2UgaXMsIGdpdmVuIHRoZSByaWdodCBjb25maWd1cmF0aW9uLCBhdmFpbGFibGUgdG8KPiBn
dWVzdHMuIEhlbmNlIHlvdSBjYW4ndCBzaW1wbHkgYWRkIGEgZmllbGQgaGVyZS4gSnVzdCBjb25z
aWRlcgo+IHdoYXQgaGFwcGVucyBmb3IgYW4gZXhpc3RpbmcgY2FsbGVyIHdoZW4gdGhlcmUgaXMg
cmFuZG9tIGRhdGEKPiBpbiB0aGUgZmllbGQgeW91IG5vdyBhc3NpZ24gYSBtZWFuaW5nLgoKUGVy
aGFwcyBpbnN0ZWFkIG9mIGV4dGVuZGluZyB0aGUgSFZNT1AgaXQgd291bGQgbWFrZSBtb3JlIHNl
bnNlIHRvCmp1c3QgYWRkIGEgeGwgY29uZmlnIG9wdGlvbiB0aGF0IGRlZmluZXMgdGhlICJkZWZh
dWx0IiBzdmUgYml0IGZvcgphbHRwMm0gdmlld3MgaW4gdGhlIGRvbWFpbj8KClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
