Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 709E0FC656
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 13:30:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVEEs-0003Vg-5r; Thu, 14 Nov 2019 12:28:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9nsm=ZG=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iVEEq-0003VY-AC
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 12:28:40 +0000
X-Inumbo-ID: 469dc494-06da-11ea-b678-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 469dc494-06da-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573734515;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=4rRu4WR9cdCrMmaNwXxfIKJoqw8G+ks6COL52jln2vM=;
 b=b0dHPWymWNSRgEiVj4MWnWY+JRQGu/bVeSwh4k5XQzJ2LXqVv3mTfmb8
 BnjYOGQ4jzPS7Xb2TCjbgM1z416xCvXpi4eltPBGSJytMVTEupNNZLL/R
 L6XfrI6iw5pDw7uFFLGo2hKlYkrQltIQvZV5kByds4P5r5RQApWqfwnCP I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NB37sDliXegmtzPkA9iFYaknmBKX7+HawnGvC6XhiFYsvkXMNfo3WeAEqr1ZU3u5gep4yKm1mD
 rVA4F/hWxXMMiJcweRLbx8h1DxPj8T2cLmPFJuSyDWzFfEUbi1EWJd+BclmAo6Jc8mXXPNy0Mv
 ackb7u27/f5AF57gq2sMmGunhtnSrLe8q9BiKD5gjMq7+keIA/d+DlHiXoj4013Qo5I51GscRg
 4TKh+OD++z2KUrla1B+RAPdK49vmpiijYpR9as8icIDI2HMgM/C2wV151CHt5/ObxSVlTbd7zw
 nEE=
X-SBRS: 2.7
X-MesageID: 8319397
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,304,1569297600"; 
   d="scan'208";a="8319397"
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <d3141a4d-b1b8-cc8b-3171-73fe0e6dd1c9@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <b7d652b9-f307-1d83-3593-c7eca6d2920d@citrix.com>
Date: Thu, 14 Nov 2019 12:28:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <d3141a4d-b1b8-cc8b-3171-73fe0e6dd1c9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: restore DTE fields in
 amd_iommu_setup_domain_device()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAxMzo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQ29tbWl0IDFiMDBjMTZi
ZGYgKCJBTUQvSU9NTVU6IHByZS1maWxsIGFsbCBEVEVzIHJpZ2h0IGFmdGVyIHRhYmxlCj4gYWxs
b2NhdGlvbiIpIG1vdmVkIG91cnNlbHZlcyBpbnRvIGEgbW9yZSBzZWN1cmUgZGVmYXVsdCBzdGF0
ZSwgYnV0Cj4gZGlkbid0IHRha2Ugc3VmZmljaWVudCBjYXJlIHRvIGFsc28gdW5kbyB0aGUgZWZm
ZWN0cyB3aGVuIGhhbmRpbmcgYQo+IHByZXZpb3VzbHkgZGlzYWJsZWQgZGV2aWNlIGJhY2sgdG8g
YShub3RoZXIpIGRvbWFpbi4gUHV0IHRoZSBmaWVsZHMKPiB0aGF0IG1heSBoYXZlIGJlZW4gY2hh
bmdlZCBlbHNld2hlcmUgYmFjayB0byB0aGVpciBpbnRlbmRlZCB2YWx1ZXMKPiAoc29tZSBmaWVs
ZHMgYW1kX2lvbW11X2Rpc2FibGVfZG9tYWluX2RldmljZSgpIHRvdWNoZXMgZG9uJ3QKPiBjdXJy
ZW50bHkgZ2V0IHdyaXR0ZW4gYW55d2hlcmUgZWxzZSwgYW5kIGhlbmNlIGRvbid0IG5lZWQgbW9k
aWZ5aW5nCj4gaGVyZSkuCj4gCj4gUmVwb3J0ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGlu
dXhAZWlrZWxlbmJvb20uaXQ+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgo+IAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1k
X2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21t
dS5jCj4gQEAgLTExNCwxMSArMTE0LDIxIEBAIHN0YXRpYyB2b2lkIGFtZF9pb21tdV9zZXR1cF9k
b21haW5fZGV2aWMKPiAgCj4gICAgICBpZiAoICFkdGUtPnYgfHwgIWR0ZS0+dHYgKQo+ICAgICAg
ewo+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX2RldjsKPiArCj4g
ICAgICAgICAgLyogYmluZCBEVEUgdG8gZG9tYWluIHBhZ2UtdGFibGVzICovCj4gICAgICAgICAg
YW1kX2lvbW11X3NldF9yb290X3BhZ2VfdGFibGUoCj4gICAgICAgICAgICAgIGR0ZSwgcGFnZV90
b19tYWRkcihoZC0+YXJjaC5yb290X3RhYmxlKSwgZG9tYWluLT5kb21haW5faWQsCj4gICAgICAg
ICAgICAgIGhkLT5hcmNoLnBhZ2luZ19tb2RlLCB2YWxpZCk7Cj4gIAo+ICsgICAgICAgIC8qIFVu
ZG8gd2hhdCBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2aWNlKCkgbWF5IGhhdmUgZG9uZS4g
Ki8KPiArICAgICAgICBpdnJzX2RldiA9ICZnZXRfaXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKVty
ZXFfaWRdOwo+ICsgICAgICAgIGlmICggZHRlLT5pdF9yb290ICkKPiArICAgICAgICAgICAgZHRl
LT5pbnRfY3RsID0gSU9NTVVfREVWX1RBQkxFX0lOVF9DT05UUk9MX1RSQU5TTEFURUQ7Cj4gKyAg
ICAgICAgZHRlLT5pdiA9IGlvbW11X2ludHJlbWFwOwo+ICsgICAgICAgIGR0ZS0+ZXggPSBpdnJz
X2Rldi0+ZHRlX2FsbG93X2V4Y2x1c2lvbjsKPiArICAgICAgICBkdGUtPnN5c19tZ3QgPSBNQVNL
X0VYVFIoaXZyc19kZXYtPmRldmljZV9mbGFncywgQUNQSV9JVkhEX1NZU1RFTV9NR01UKTsKPiAr
Cj4gICAgICAgICAgaWYgKCBwY2lfYXRzX2RldmljZShpb21tdS0+c2VnLCBidXMsIHBkZXYtPmRl
dmZuKSAmJgo+ICAgICAgICAgICAgICAgaW9tbXVfaGFzX2NhcChpb21tdSwgUENJX0NBUF9JT1RM
Ql9TSElGVCkgKQo+ICAgICAgICAgICAgICBkdGUtPmkgPSBhdHNfZW5hYmxlZDsKPiAKClRlc3Rl
ZC1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpXaXRob3V0
IHRoaXMgY2hhbmdlIHdlIGdldCBzdGFibGUgVERScyBhdCBib290IHRpbWUgd2l0aCBHUFUgcGFz
c3Rocm91Z2gKb24gQU1EIG1hY2hpbmVzLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
