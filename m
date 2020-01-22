Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250B145395
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 12:17:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuDxd-0006Dz-Qb; Wed, 22 Jan 2020 11:14:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vprz=3L=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1iuDxc-0006Du-5R
 for xen-devel@lists.xen.org; Wed, 22 Jan 2020 11:14:12 +0000
X-Inumbo-ID: 4b7b07ba-3d08-11ea-9fd7-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b7b07ba-3d08-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 11:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579691642;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=YC9wKYO2F887bScaa98MbaQDf7nZub7cD3iCoUuC+Ys=;
 b=PVIzommLml+RooQ3oHFE49nCVdAeXlPiBXsqtAevbdIO3mnhQtRkdlmJ
 fs8RlNx6KxFgjN/YNIE+vQn7ROgPreKwFubc0GRKdQnO1eSGqcdhge2/x
 jNhnQ/uQCRijlNGveXKSqmkzLp93ZpQB4uMWMRCR7lx6lwA8KqVnfe/Em k=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: CDfu/Z3EtczMTzpEfAZPSlKPw+H9ASx9SLknEvZtvXAO/orpurrTD7fm1oG1CbkTm3bPIKKqcE
 XaF9PXjKhkCPzXqCgi84uDCo+RemjNh/65gMfG8+ZZ32QMpk2RC0NKgTJq8q6iPECwlikBFfqV
 bNWSAvt0+CdPwyWK08v4vI4mmHD7OF7uJv1TROtgDcKH63Mx1udzWkdfW54vrsqOxfLeSxbvn+
 XUN/aD7Wd1oz8Blud63w7wAdtUBgarO5W3lgetyx+NK9hMzWiaFaFhoa303hiqKFVJdBXapkfq
 10Q=
X-SBRS: 2.7
X-MesageID: 11856945
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,349,1574139600"; d="scan'208";a="11856945"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, <xen-devel@lists.xen.org>,
 <kasan-dev@googlegroups.com>, <linux-mm@kvack.org>,
 <linux-kernel@vger.kernel.org>
References: <20200117125834.14552-1-sergey.dyasli@citrix.com>
 <20200117125834.14552-3-sergey.dyasli@citrix.com>
 <28aba070-fa53-5677-c2d2-97d06514dda8@oracle.com>
From: Sergey Dyasli <sergey.dyasli@citrix.com>
Autocrypt: addr=sergey.dyasli@citrix.com; keydata=
 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
Message-ID: <3570a312-04e9-c7f8-e348-e1c2dbd040db@citrix.com>
Date: Wed, 22 Jan 2020 11:13:54 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <28aba070-fa53-5677-c2d2-97d06514dda8@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/4] x86/xen: add basic KASAN support for
 PV kernel
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
Cc: Juergen Gross <jgross@suse.com>, "sergey.dyasli@citrix.com >>
 Sergey Dyasli" <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcvMDEvMjAyMCAxNDo1NiwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Cj4KPiBPbiAxLzE3
LzIwIDc6NTggQU0sIFNlcmdleSBEeWFzbGkgd3JvdGU6Cj4+IC0tLSBhL2FyY2gveDg2L21tL2th
c2FuX2luaXRfNjQuYwo+PiArKysgYi9hcmNoL3g4Ni9tbS9rYXNhbl9pbml0XzY0LmMKPj4gQEAg
LTEzLDYgKzEzLDkgQEAKPj4gICAjaW5jbHVkZSA8bGludXgvc2NoZWQvdGFzay5oPgo+PiAgICNp
bmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4+ICAgKyNpbmNsdWRlIDx4ZW4veGVuLmg+Cj4+ICsj
aW5jbHVkZSA8eGVuL3hlbi1vcHMuaD4KPj4gKwo+PiAgICNpbmNsdWRlIDxhc20vZTgyMC90eXBl
cy5oPgo+PiAgICNpbmNsdWRlIDxhc20vcGdhbGxvYy5oPgo+PiAgICNpbmNsdWRlIDxhc20vdGxi
Zmx1c2guaD4KPj4gQEAgLTMzMiw2ICszMzUsMTEgQEAgdm9pZCBfX2luaXQga2FzYW5fZWFybHlf
aW5pdCh2b2lkKQo+PiAgICAgICBmb3IgKGkgPSAwOyBwZ3RhYmxlX2w1X2VuYWJsZWQoKSAmJiBp
IDwgUFRSU19QRVJfUDREOyBpKyspCj4+ICAgICAgICAgICBrYXNhbl9lYXJseV9zaGFkb3dfcDRk
W2ldID0gX19wNGQocDRkX3ZhbCk7Cj4+ICAgKyAgICBpZiAoeGVuX3B2X2RvbWFpbigpKSB7Cj4+
ICsgICAgICAgIHBnZF90ICpwdl90b3BfcGd0ID0geGVuX3B2X2thc2FuX2Vhcmx5X2luaXQoKTsK
Pj4gKyAgICAgICAga2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhwdl90b3BfcGd0KTsKPj4gKyAgICB9
Cj4+ICsKPgo+Cj4gSSdkIHN1Z2dlc3QgcmVwbGFjaW5nIHRoaXMgd2l0aCB4ZW5fa2FzYW5fZWFy
bHlfaW5pdCgpIGFuZCBkb2luZyBldmVyeXRoaW5nLCBpbmNsdWRpbmcgUFYgY2hlY2ssIHRoZXJl
LiBUaGlzIHdheSBub24tWGVuIGNvZGUgd29uJ3QgbmVlZCB0byBiZSBhd2FyZSBvZiBYZW4tc3Bl
Y2lmaWMgZGV0YWlscyBzdWNoIGFzIGd1ZXN0IHR5cGVzLgoKVGhpcyB3b3VsZCByZXF1aXJlIGV4
cG9ydGluZyBrYXNhbl9tYXBfZWFybHlfc2hhZG93KCkgdmlhIGthc2FuLmguCkknbSBmaW5lIHdp
dGggZWl0aGVyIGFwcHJvYWNoLgoKPj4gICAgICAga2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhlYXJs
eV90b3BfcGd0KTsKPj4gICAgICAga2FzYW5fbWFwX2Vhcmx5X3NoYWRvdyhpbml0X3RvcF9wZ3Qp
Owo+PiAgIH0KPj4gQEAgLTM2OSw2ICszNzcsOCBAQCB2b2lkIF9faW5pdCBrYXNhbl9pbml0KHZv
aWQpCj4+ICAgICAgICAgICAgICAgICAgIF9fcGdkKF9fcGEodG1wX3A0ZF90YWJsZSkgfCBfS0VS
TlBHX1RBQkxFKSk7Cj4+ICAgICAgIH0KPj4gICArICAgIHhlbl9wdl9rYXNhbl9waW5fcGdkKGVh
cmx5X3RvcF9wZ3QpOwo+PiArCj4KPiBBbmQgZHJvcCAiX3B2IiBoZXJlIChhbmQgYmVsb3cpIGZv
ciB0aGUgc2FtZSByZWFzb24uCgpUaGlzIGlzIGEgcmVhc29uYWJsZSBzdWdnZXN0aW9uLgoKPj4g
ICAgICAgbG9hZF9jcjMoZWFybHlfdG9wX3BndCk7Cj4+ICAgICAgIF9fZmx1c2hfdGxiX2FsbCgp
Owo+PiAgIEBAIC00MzMsNiArNDQzLDggQEAgdm9pZCBfX2luaXQga2FzYW5faW5pdCh2b2lkKQo+
PiAgICAgICBsb2FkX2NyMyhpbml0X3RvcF9wZ3QpOwo+PiAgICAgICBfX2ZsdXNoX3RsYl9hbGwo
KTsKPj4gICArICAgIHhlbl9wdl9rYXNhbl91bnBpbl9wZ2QoZWFybHlfdG9wX3BndCk7Cj4+ICsK
Pj4KCi0tClRoYW5rcywKU2VyZ2V5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
