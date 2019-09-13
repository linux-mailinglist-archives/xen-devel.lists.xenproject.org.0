Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF112B1AAA
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:20:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hiO-0007wE-8V; Fri, 13 Sep 2019 09:18:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8hiN-0007w9-GJ
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:18:03 +0000
X-Inumbo-ID: 62fb32f6-d607-11e9-b76c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 62fb32f6-d607-11e9-b76c-bc764e2007e4;
 Fri, 13 Sep 2019 09:18:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 36FA9AE2C;
 Fri, 13 Sep 2019 09:18:02 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-15-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26e8598c-5a81-2deb-581b-a3f3a85c8ec3@suse.com>
Date: Fri, 13 Sep 2019 11:18:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-15-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 14/16] microcode: rendezvous CPUs in NMI
 handler and load ucode
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gQEAgLTQxOSwxNCArNDY1LDIz
IEBAIHN0YXRpYyBpbnQgY29udHJvbF90aHJlYWRfZm4oY29uc3Qgc3RydWN0IG1pY3JvY29kZV9w
YXRjaCAqcGF0Y2gpCj4gICAgICAgICAgcmV0dXJuIHJldDsKPiAgICAgIH0KPiAgCj4gLSAgICAv
KiBMZXQgcHJpbWFyeSB0aHJlYWRzIGxvYWQgdGhlIGdpdmVuIHVjb2RlIHVwZGF0ZSAqLwo+IC0g
ICAgc2V0X3N0YXRlKExPQURJTkdfRU5URVIpOwo+IC0KPiArICAgIC8qIENvbnRyb2wgdGhyZWFk
IGxvYWRzIHVjb2RlIGZpcnN0IHdoaWxlIG90aGVycyBhcmUgaW4gTk1JIGhhbmRsZXIuICovCj4g
ICAgICByZXQgPSBtaWNyb2NvZGVfb3BzLT5hcHBseV9taWNyb2NvZGUocGF0Y2gpOwo+ICAgICAg
aWYgKCAhcmV0ICkKPiAgICAgICAgICBhdG9taWNfaW5jKCZjcHVfdXBkYXRlZCk7Cj4gICAgICBh
dG9taWNfaW5jKCZjcHVfb3V0KTsKPiAgCj4gKyAgICBpZiAoIHJldCA9PSAtRUlPICkKPiArICAg
IHsKPiArICAgICAgICBwcmludGsoWEVOTE9HX0VSUgo+ICsgICAgICAgICAgICAgICAiTGF0ZSBs
b2FkaW5nIGFib3J0ZWQ6IENQVSV1IGZhaWxlZCB0byB1cGRhdGUgdWNvZGVcbiIsIGNwdSk7Cj4g
KyAgICAgICAgc2V0X3N0YXRlKExPQURJTkdfRVhJVCk7Cj4gKyAgICAgICAgcmV0dXJuIHJldDsK
PiArICAgIH0KPiArCj4gKyAgICAvKiBMZXQgcHJpbWFyeSB0aHJlYWRzIGxvYWQgdGhlIGdpdmVu
IHVjb2RlIHVwZGF0ZSAqLwo+ICsgICAgc2V0X3N0YXRlKExPQURJTkdfRU5URVIpOwoKT25lIG1v
cmUgcXVlc3Rpb24gLSB3aHkgdGhpcyBkZWZlcnJhbCBvZiBzZXR0aW5nIHN0YXRlIHRvIEVOVEVS
PyBJZgppdCdzIG5lZWRlZCwgaXQgc2hvdWxkIGJlIGV4cGxhaW5lZCBpbiB0aGUgZGVzY3JpcHRp
b24uCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
