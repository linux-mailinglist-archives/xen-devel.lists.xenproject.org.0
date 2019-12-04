Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75DF113142
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:57:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icYsL-00085o-39; Wed, 04 Dec 2019 17:55:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cR3Y=Z2=soleen.com=pasha.tatashin@srs-us1.protection.inumbo.net>)
 id 1icYsK-00085i-6j
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:55:44 +0000
X-Inumbo-ID: 4a683e8e-16bf-11ea-aea8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a683e8e-16bf-11ea-aea8-bc764e2007e4;
 Wed, 04 Dec 2019 17:55:43 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c26so131282eds.8
 for <xen-devel@lists.xenproject.org>; Wed, 04 Dec 2019 09:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/QBiOCr7c4l7fZjKklo3yZ4ZIuYTkAcsgsNgIGBN47E=;
 b=CmqYRADbzr0G4HWvjRmoRSG65lHFiqcXXzx9WbxdkJJtwwFPkv6L6uhvSr8NbL8H00
 3ezARPSmbB3svk8QCSrCaesCNvwd3cCxpBYJrVUau6Y/wlyJqh4o0Q61o4n/Vfy08utU
 rk0ZgwPE6al6bX+5S8CbsYWWOIQm0TFRdeFGOXwPBKse5ivL13zdlezYWKuVzPkN9uth
 L9C3RaP8eZOybLz1t2XIHf9h1vtWINA35xwdU/D152hAFrl/3hd7BxjnxP8o466XkLlX
 QUO4JYN8wnAWLeM4QY3xtEPmN3f51q8sFeXANuD1LkDioIr9xfYxmX1myGmWjpW/iUdR
 5UIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/QBiOCr7c4l7fZjKklo3yZ4ZIuYTkAcsgsNgIGBN47E=;
 b=ldwqIfTjM1gqL0iBMIExx7XPKjxZsP16ZOxyFVSy6fYAW7k5K9+WzHjAJ37K3vblGt
 isbnt5ObxhfGwTVWDxwOkJ32+a8Bi3twgq9QRveaPvCddk5uQqWq6TSJnk2dCSHj4QTW
 E0sQNrrWiIXm4y1Q1KQtRNxdw5ts5EbyMY68JySRvDjnZKn3L1uBXLchzvtLdYqJh1/+
 BtBW9xbn7iVu7BiwgcsMGHURHLpnBDoCBrdyMjjsZGFL2m1KEUQFRNgdF/PArBNs1wxN
 cxS2JODx0Udd29UM4evNvG85rAntzrgFBIEDvH1amBvVCwpQqWcPnxFREuLU77jzSGOA
 S3KQ==
X-Gm-Message-State: APjAAAXo9+ESpcjDhy79EUC9/3ZHduUlDGoVwt2pYMREd+O1Qtpl7TpK
 Ton9nBfZ0O+LNDvay7Acu0bV6EdFdvqMjvqew8Lopw==
X-Google-Smtp-Source: APXvYqx7i07mE15LTmdSADtpXZLOKFffb5f4NXu7AgyOJ73gnljvL0fH/4Msr28AHfBKwp3ckEATIvL1W63kFa6ISew=
X-Received: by 2002:a50:84ab:: with SMTP id 40mr5637114edq.14.1575482142681;
 Wed, 04 Dec 2019 09:55:42 -0800 (PST)
MIME-Version: 1.0
References: <20191127184453.229321-1-pasha.tatashin@soleen.com>
 <20191127184453.229321-2-pasha.tatashin@soleen.com>
 <957930d0-8317-9086-c7a1-8de857f358c2@xen.org>
 <e785a585-8b71-8a49-285e-2bcb1437500b@citrix.com>
In-Reply-To: <e785a585-8b71-8a49-285e-2bcb1437500b@citrix.com>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 4 Dec 2019 12:55:31 -0500
Message-ID: <CA+CK2bDV5pUYb5c-mkA9heE-CMg1MZdC=zz6zkDJDUZuuUpOmA@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
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
 Julien Grall <julien@xen.org>, Marc Zyngier <marc.zyngier@arm.com>,
 alexios.zavras@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 allison@lohutok.net, jgross@suse.com, steve.capper@arm.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, James Morse <james.morse@arm.com>,
 info@metux.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMTA6MTAgQU0gQW5kcmV3IENvb3Blcgo8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiAyOS8xMS8yMDE5IDE1OjA1LCBKdWxpZW4g
R3JhbGwgd3JvdGU6Cj4gPiBIaSwKPiA+Cj4gPiBPbiAyNy8xMS8yMDE5IDE4OjQ0LCBQYXZlbCBU
YXRhc2hpbiB3cm90ZToKPiA+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94
ZW4vaHlwZXJjYWxsLmgKPiA+PiBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20veGVuL2h5cGVyY2Fs
bC5oCj4gPj4gaW5kZXggMzUyMmNiYWVkMzE2Li4xYTc0ZmIyODYwN2YgMTAwNjQ0Cj4gPj4gLS0t
IGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS94ZW4vaHlwZXJjYWxsLmgKPiA+PiArKysgYi9hcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3hlbi9oeXBlcmNhbGwuaAo+ID4+IEBAIC0xICsxLDI5IEBACj4g
Pj4gKyNpZm5kZWYgX0FTTV9BUk02NF9YRU5fSFlQRVJDQUxMX0gKPiA+PiArI2RlZmluZSBfQVNN
X0FSTTY0X1hFTl9IWVBFUkNBTExfSAo+ID4+ICAgI2luY2x1ZGUgPHhlbi9hcm0vaHlwZXJjYWxs
Lmg+Cj4gPj4gKyNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gPj4gKwo+ID4+ICtzdGF0aWMg
aW5saW5lIGxvbmcgcHJpdmNtZF9jYWxsKHVuc2lnbmVkIGludCBjYWxsLCB1bnNpZ25lZCBsb25n
IGExLAo+ID4+ICsgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhMiwgdW5zaWduZWQgbG9u
ZyBhMywKPiA+PiArICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgYTQsIHVuc2lnbmVkIGxv
bmcgYTUpCj4gPgo+ID4gSSByZWFsaXplIHRoYXQgcHJpdmNtZF9jYWxsIGlzIHRoZSBvbmx5IGh5
cGVyY2FsbCB1c2luZyBTb2Z0d2FyZSBQQU4KPiA+IGF0IHRoZSBtb21lbnQuIEhvd2V2ZXIsIGRt
X29wIG5lZWRzIHRoZSBzYW1lIGFzIGh5cGVyY2FsbCB3aWxsIGJlCj4gPiBpc3N1ZWQgZnJvbSB1
c2Vyc3BhY2UgYXMgd2VsbC4KPgo+IEFuZCBkbV9vcCgpIHdvbid0IGJlIHRoZSBvbmx5IGV4YW1w
bGUgYXMgd2UgY29udGludWUgaW4gY2xlYW5pbmcgdXAgdGhlCj4gZ2FwaW5nIGhvbGUgdGhhdCBp
cyBwcml2Y21kLgo+Cj4gPiBTbyBJIHdhcyB3b25kZXJpbmcgd2hldGhlciB3ZSBzaG91bGQgY3Jl
YXRlIGEgZ2VuZXJpYyBmdW5jdGlvbiAoZS5nLgo+ID4gZG9feGVuX2h5cGVyY2FsbCgpIG9yIGRv
X3hlbl91c2VyX2h5cGVyY2FsbCgpKSB0byBjb3ZlciB0aGUgdHdvCj4gPiBoeXBlcmNhbGxzPwo+
Cj4gUHJvYmFibHkgYSBnb29kIGlkZWEuCgpJdCBzb3VuZHMgZ29vZCB0byBtZSwgYnV0IGxldCdz
IGtlZXAgaXQgb3V0c2lkZSBvZiB0aGlzIHNlcmllcy4KClRoYW5rIHlvdSwKUGFzaGEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
