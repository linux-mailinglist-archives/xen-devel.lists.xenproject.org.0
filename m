Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BD31131AF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 19:02:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYv4-0008Gn-HZ; Wed, 04 Dec 2019 17:58:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icYv3-0008Gi-2o
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:58:33 +0000
X-Inumbo-ID: aebb55a6-16bf-11ea-9c09-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aebb55a6-16bf-11ea-9c09-bc764e2007e4;
 Wed, 04 Dec 2019 17:58:32 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id f8so187544edv.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 09:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e9gkQnU+5q50cQeHx8NRu5HJQyIM32Z6cVBwYXSVjIU=;
 b=TfH3rUb9CyqcTteFkO3C0xlnbKPaPL+cKMDbTylgoIZRtg9/X9I+YsgFYMbiZXeyWH
 6PlZPH1K/5P+XHiHenDCQt4FvrDjS/BrRzDZryGe9Twd6Hm2D/PuFfB0RuI7ndN7FRkU
 53yRO+n+zxjDbzNLl19rt+Ux9N0QapQxf/PcuW0FZFx9aDV2esnmpEXuzPCGcvshVi5c
 mRfJ/YtyltCIrh/P45bL1k1m4RChqhZSyzX/Jcbu3guo/ePbUMweg/D/uJvHeIaqg4Gm
 5uP20oOpH/SKLR8di/NnPJ5v5R0wamwgPJl5jM6Ru4CREPcSt4DIS2z6vz82RA/SVf34
 r3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e9gkQnU+5q50cQeHx8NRu5HJQyIM32Z6cVBwYXSVjIU=;
 b=Rn4steK6AN72HQ3RbeYhd4ENc8UA7S9x53zQ+iDyPfJUMWhpphBbc1pH5Hpikf0pGe
 Sy2jxdDMPedsKsHGxIz7B7++PfAoGyhCSir9ZP2Tedoi0vy1hq6oiN9X1GZ2tqm1SX9V
 m3vOd3YWB08HIiki5wiErpMjEw0iRttTigFtDA45vT0GPNvK4yHQ8s7i34sxV1Nozd/n
 J8kcE3P2LpUGKkmDBrpJX0hwX0s3YyzYwNrtPmcDxYtcoxnd5O2bgo5BjQoPKc2hyLEh
 MNkC82k5sJ/rvK7LaggWATnTzebBrZG8kSPl6ql7FOWhHSQFl9xXhvj8EgL5MSbl290O
 5ypA==
X-Gm-Message-State: APjAAAU9TRYVrcHQ0auIKeYqItWpTj7StiylsvH3HqoGoDEWI5cWGKni
 Gkms8GIoeGwrAwYZLcgBWIYAFoRt4gi4g4PijZsP4g==
X-Google-Smtp-Source: APXvYqyAOfG2c7wdnsuR/CLNurVK9MGZsX+GmC1nBIDZq14OwnspMmSoQUW6yoePy6mVNE4fFTYRVftmoUuum47tYGo=
X-Received: by 2002:aa7:d445:: with SMTP id q5mr5540834edr.16.1575482311052;
 Wed, 04 Dec 2019 09:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-2-pasha.tatashin@soleen.com>
 <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
In-Reply-To: <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 4 Dec 2019 12:58:20 -0500
Message-ID: <CA+CK2bBWVLZkFo5e8gQUuiqz_b2oCOtD7-9GkCwf9BsFn9wwaA@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH 1/3] arm/arm64/xen: use C inlines for
 privcmd_call
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Stefan Agner <stefan@agner.ch>,
 Russell King - ARM Linux admin <linux@armlinux.org.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Will Deacon <will@kernel.org>,
 boris.ostrovsky@oracle.com, Sasha Levin <sashal@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, James Morris <jmorris@namei.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 xen-devel@lists.xenproject.org, Vladimir Murzin <vladimir.murzin@arm.com>,
 Marc Zyngier <marc.zyngier@arm.com>, alexios.zavras@intel.com,
 Thomas Gleixner <tglx@linutronix.de>, allison@lohutok.net, jgross@suse.com,
 steve.capper@arm.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MDUgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVu
Lm9yZz4gd3JvdGU6Cj4KPiBIaSwKPgo+IE9uIDI3LzExLzIwMTkgMTg6NDQsIFBhdmVsIFRhdGFz
aGluIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5
cGVyY2FsbC5oIGIvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiA+IGlu
ZGV4IDM1MjJjYmFlZDMxNi4uMWE3NGZiMjg2MDdmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9hcm02
NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiA+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVk
ZS9hc20veGVuL2h5cGVyY2FsbC5oCj4gPiBAQCAtMSArMSwyOSBAQAo+ID4gKyNpZm5kZWYgX0FT
TV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKPiA+ICsjZGVmaW5lIF9BU01fQVJNNjRfWEVOX0hZUEVS
Q0FMTF9ICj4gPiAgICNpbmNsdWRlIDx4ZW4vYXJtL2h5cGVyY2FsbC5oPgo+ID4gKyNpbmNsdWRl
IDxsaW51eC91YWNjZXNzLmg+Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSBsb25nIHByaXZjbWRf
Y2FsbCh1bnNpZ25lZCBpbnQgY2FsbCwgdW5zaWduZWQgbG9uZyBhMSwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYTIsIHVuc2lnbmVkIGxvbmcgYTMsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGE0LCB1bnNpZ25l
ZCBsb25nIGE1KQo+Cj4gSSByZWFsaXplIHRoYXQgcHJpdmNtZF9jYWxsIGlzIHRoZSBvbmx5IGh5
cGVyY2FsbCB1c2luZyBTb2Z0d2FyZSBQQU4gYXQKPiB0aGUgbW9tZW50LiBIb3dldmVyLCBkbV9v
cCBuZWVkcyB0aGUgc2FtZSBhcyBoeXBlcmNhbGwgd2lsbCBiZSBpc3N1ZWQKPiBmcm9tIHVzZXJz
cGFjZSBhcyB3ZWxsLgoKVGhlIGNsZWFuLXVwIEkgYW0gd29ya2luZyBvbiBub3cgaXMgc3BlY2lm
aWMgdG8gbW92aW5nIGN1cnJlbnQgUEFOCnVzZWFnZSB0byBDIHdyYXBzLiBPbmNlIGRtX29wIHJl
cXVpcmVzIHRvIHVzZSBQQU4gaXQgd2lsbCBuZWVkIHRvIGJlCnVzZWQgdGhlIEMgdmFyaWFudHMs
IGJlY2F1c2UgQVNNIHZlcnNpb25zIGFyZSBnb2luZyB0byBiZSByZW1vdmVkIGJ5CnRoaXMgc2Vy
aWVzLgoKPgo+IFNvIEkgd2FzIHdvbmRlcmluZyB3aGV0aGVyIHdlIHNob3VsZCBjcmVhdGUgYSBn
ZW5lcmljIGZ1bmN0aW9uIChlLmcuCj4gZG9feGVuX2h5cGVyY2FsbCgpIG9yIGRvX3hlbl91c2Vy
X2h5cGVyY2FsbCgpKSB0byBjb3ZlciB0aGUgdHdvIGh5cGVyY2FsbHM/Cj4KPiA+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL3hlbi9hcm0vaHlwZXJjYWxsLmggYi9pbmNsdWRlL3hlbi9hcm0vaHlwZXJj
YWxsLmgKPiA+IGluZGV4IGI0MDQ4NWU1NGQ4MC4uNjI0YzhhZDdlNDJhIDEwMDY0NAo+ID4gLS0t
IGEvaW5jbHVkZS94ZW4vYXJtL2h5cGVyY2FsbC5oCj4gPiArKysgYi9pbmNsdWRlL3hlbi9hcm0v
aHlwZXJjYWxsLmgKPiA+IEBAIC0zMCw4ICszMCw4IEBACj4gPiAgICAqIElOIFRIRSBTT0ZUV0FS
RS4KPiA+ICAgICovCj4gPgo+ID4gLSNpZm5kZWYgX0FTTV9BUk1fWEVOX0hZUEVSQ0FMTF9ICj4g
PiAtI2RlZmluZSBfQVNNX0FSTV9YRU5fSFlQRVJDQUxMX0gKPiA+ICsjaWZuZGVmIF9BUk1fWEVO
X0hZUEVSQ0FMTF9ICj4gPiArI2RlZmluZSBfQVJNX1hFTl9IWVBFUkNBTExfSAo+Cj4gVGhpcyBj
aGFuZ2UgZmVlbHMgYSBiaXQgb3V0IG9mIGNvbnRleHQuIENvdWxkIHlvdSBzcGxpdCBpdCBpbiBh
IHNlcGFyYXRlCj4gcGF0Y2g/CgpNYWtlcyBzZW5zZSwgSSBhbSBzcGxpdHRpbmcgdGhpcyBpbnRv
IGEgc2VwYXJhdGUgcGF0Y2guCgpUaGFuayB5b3UsClBhc2hhCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
