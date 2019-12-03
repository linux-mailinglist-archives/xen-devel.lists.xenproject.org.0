Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A3F110458
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 19:38:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icD2X-0004xk-Md; Tue, 03 Dec 2019 18:36:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zB0y=ZZ=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1icD2V-0004xf-R5
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 18:36:47 +0000
X-Inumbo-ID: dc7712e3-15fb-11ea-81e8-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc7712e3-15fb-11ea-81e8-12813bfff9fa;
 Tue, 03 Dec 2019 18:36:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1575398207; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=YemqogsypOC9/ITXw549LUTuz8Wn0Mcyws4EE+IPprY=;
 b=D3XYsrNEj0muBlxjAY+CYyCquV2kI82x337pw7yIUQj6D4K3/84nrTu1W4iNOwJbFfMkc2Dx
 Xt3ekW6JrsJuylNGXgBkRPeiclbhMEqByzVFVMYh5tGL++V27PX3N3HdfvRbub8Kjk9Gpvr2
 Za4YZdb7R0p4PK3RkuCbyoUicKE=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5de6ab3e.7f911da4be30-smtp-out-n01;
 Tue, 03 Dec 2019 18:36:46 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j42so4945624wrj.12
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 10:36:46 -0800 (PST)
X-Gm-Message-State: APjAAAU/bjyK0GIqc8m2Azz0T11EbjXGatyiWV6qUTufjkqlY6e+QlUn
 +pAiPeR8PnKdNkPFj+uU+LJVdDZPUwKp2Pqoekg=
X-Google-Smtp-Source: APXvYqwrBskSDUSavrSrFDSJTAqaens0gHeAgBpJJYszLDAZdYSB51EfXKtIk1GcdLvqlHA2KmqgU3oOLaKeGCD9z0A=
X-Received: by 2002:adf:e5cf:: with SMTP id a15mr6707164wrn.140.1575398205525; 
 Tue, 03 Dec 2019 10:36:45 -0800 (PST)
MIME-Version: 1.0
References: <20191203171030.11680-1-andrew.cooper3@citrix.com>
 <CABfawhmfefUGEaL4vNd8AG=_H4vBZROv9SywuZORDrFBoDCcgg@mail.gmail.com>
 <b9a246ee-6d0d-c38b-6669-53c91d61cce1@citrix.com>
 <CABfawhm_Ba5Bh25=VSvoOLOxOGyiCKUBNkHouPq8uEDoFCZePQ@mail.gmail.com>
 <b9d02824-3d33-898b-7d74-d143ba06a914@citrix.com>
In-Reply-To: <b9d02824-3d33-898b-7d74-d143ba06a914@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 3 Dec 2019 13:36:09 -0500
X-Gmail-Original-Message-ID: <CABfawhke-KiCjKnjKCB=BJRvGCaj8swM8HMKG82uW4deaRPeqg@mail.gmail.com>
Message-ID: <CABfawhke-KiCjKnjKCB=BJRvGCaj8swM8HMKG82uW4deaRPeqg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH] x86/debug: Plumb pending_dbg through the
 monitor and devicemodel interfaces
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>, Jan Beulich <JBeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjIzIFBNIEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gMDMvMTIvMjAxOSAxODoxNiwgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMywgMjAxOSBhdCAxOjA5IFBNIEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+IE9uIDAzLzEyLzIw
MTkgMTg6MDUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPiA+Pj4+IGRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS9wdWJsaWMvdm1fZXZlbnQuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5o
Cj4gPj4+PiBpbmRleCA5NTkwODNkOGM0Li43NjY3NmZmNGMwIDEwMDY0NAo+ID4+Pj4gLS0tIGEv
eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50LmgKPiA+Pj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy92bV9ldmVudC5oCj4gPj4+PiBAQCAtMjgxLDYgKzI4MSw3IEBAIHN0cnVjdCB2bV9ldmVu
dF9kZWJ1ZyB7Cj4gPj4+PiAgICAgIHVpbnQzMl90IGluc25fbGVuZ3RoOwo+ID4+Pj4gICAgICB1
aW50OF90IHR5cGU7ICAgICAgICAvKiBIVk1PUF9UUkFQXyogKi8KPiA+Pj4+ICAgICAgdWludDhf
dCBfcGFkWzNdOwo+ID4+Pj4gKyAgICB1aW50NjRfdCBwZW5kaW5nX2RiZzsKPiA+Pj4gVGhpcyBp
cyBqdXN0IGEgbml0cGljayBidXQgSSB3b3VsZCBwcmVmZXIgaWYgd2UgaGFkIHRoZSBfcGFkIGZp
ZWxkIGFzCj4gPj4+IHRoZSBsYXN0IGVsZW1lbnQgaW4gdGhlIHN0cnVjdCBhbmQga2VlcCBhbGwg
NjQtYml0IG1lbWJlcnMgdXAgaW4gdGhlCj4gPj4+IGZyb250Lgo+ID4+IFdlbGwgdGhlIHJlYXNv
biBJIGRpZCBpdCBsaWtlIHRoaXMgaXMgdGhhdCB0aGlzIHZlcnNpb24gd2lsbCBjb250aW51ZSB0
bwo+ID4+IGZ1bmN0aW9uIHdpdGggb2xkZXIgaW50cm9zcGVjdGlvbiBjb2RlLiAgVGhlIGV4dHJh
IGZpZWxkIGlzIHdpdGhpbiBhCj4gPj4gdW5pb24gYW5kIG5vIG90aGVyIGRhdGEgbW92ZXMuCj4g
Pj4KPiA+PiBCeSByZXBvc2l0aW9uaW5nIHRvIHRoZSBzdGFydCwgaXQgd2lsbCBhbG1vc3QgY2Vy
dGFpbmx5IGJyZWFrIG9sZGVyCj4gPj4gaW50cm9zcGVjdGlvbiBjb2RlIGV2ZW4gdGhvdWdoIGl0
IGNvbXBpbGVkIGNvcnJlY3RseS4KPiA+Pgo+ID4+IFlvdXIgY2hvaWNlLgo+ID4gV2UgYXJlIGFs
cmVhZHkgYnVtcGluZyB0aGUgaW50ZXJmYWNlIHZlcnNpb24gZm9yIHRoZSBuZXh0IHJlbGVhc2Ug
c28KPiA+IG9sZCBpbnRyb3NwZWN0aW9uIGNvZGUgYnkgZGVzaWduIHdpbGwgc3RvcCB3b3JraW5n
LiBXZSBtYWtlIG5vIEFCSQo+ID4gc3RhYmlsaXR5IGd1YXJhbnRlZXMgYmV0d2VlbiBpbnRlcmZh
Y2UgdmVyc2lvbnMgc28gdGhpcyBpcyBhCj4gPiBub24taXNzdWUuCj4KPiBPayBmaW5lLiAgVXBk
YXRlZCBsb2NhbGx5LCBidXQgSSB3b24ndCBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNo
Cj4ganVzdCBmb3IgdGhpcyBkZWx0YS4KPgo+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJs
aWMvdm1fZXZlbnQuaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gaW5kZXggNzY2
NzZmZjRjMC4uOGMyNGE1ODk2NCAxMDA2NDQKPiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMvdm1f
ZXZlbnQuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3B1YmxpYy92bV9ldmVudC5oCj4gQEAgLTI3OCwx
MCArMjc4LDEwIEBAIHN0cnVjdCB2bV9ldmVudF9zaW5nbGVzdGVwIHsKPgo+ICBzdHJ1Y3Qgdm1f
ZXZlbnRfZGVidWcgewo+ICAgICAgdWludDY0X3QgZ2ZuOwo+ICsgICAgdWludDY0X3QgcGVuZGlu
Z19kYmc7Cj4gICAgICB1aW50MzJfdCBpbnNuX2xlbmd0aDsKPiAgICAgIHVpbnQ4X3QgdHlwZTsg
ICAgICAgIC8qIEhWTU9QX1RSQVBfKiAqLwo+ICAgICAgdWludDhfdCBfcGFkWzNdOwo+IC0gICAg
dWludDY0X3QgcGVuZGluZ19kYmc7Cj4gIH07CgpXaXRoIHRoZSBhYm92ZSBhZGp1c3RtZW50OgoK
QWNrZWQtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
