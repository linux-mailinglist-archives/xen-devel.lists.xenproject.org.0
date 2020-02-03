Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA84115070D
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:23:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybf5-0006Be-SV; Mon, 03 Feb 2020 13:21:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iybf4-0006BU-57
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:21:10 +0000
X-Inumbo-ID: 0a60bf2a-4688-11ea-8e58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a60bf2a-4688-11ea-8e58-12813bfff9fa;
 Mon, 03 Feb 2020 13:21:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E283EAD07;
 Mon,  3 Feb 2020 13:21:08 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-6-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <542f323a-4c85-6709-88ad-640e2d0d12e9@suse.com>
Date: Mon, 3 Feb 2020 14:21:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131174930.31045-6-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 05/11] x86/hyperv: setup hypercall page
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiArc3RhdGljIHZvaWQgX19pbml0
IHNldHVwX2h5cGVyY2FsbF9wYWdlKHZvaWQpCj4gK3sKPiArICAgIHVuaW9uIGh2X3g2NF9tc3Jf
aHlwZXJjYWxsX2NvbnRlbnRzIGh5cGVyY2FsbF9tc3I7Cj4gKyAgICB1bmlvbiBodl9ndWVzdF9v
c19pZCBndWVzdF9pZDsKPiArICAgIHVuc2lnbmVkIGxvbmcgbWZuOwo+ICsKPiArICAgIEJVSUxE
X0JVR19PTihIVl9IWVBfUEFHRV9TSElGVCAhPSBQQUdFX1NISUZUKTsKPiArCj4gKyAgICByZG1z
cmwoSFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vlc3RfaWQucmF3KTsKPiArICAgIGlmICggIWd1
ZXN0X2lkLnJhdyApCj4gKyAgICB7Cj4gKyAgICAgICAgZ3Vlc3RfaWQucmF3ID0gZ2VuZXJhdGVf
Z3Vlc3RfaWQoKTsKPiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9HVUVTVF9PU19JRCwgZ3Vl
c3RfaWQucmF3KTsKPiArICAgIH0KPiArCj4gKyAgICByZG1zcmwoSFZfWDY0X01TUl9IWVBFUkNB
TEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArICAgIGlmICggIWh5cGVyY2FsbF9tc3Iu
ZW5hYmxlICkKPiArICAgIHsKPiArICAgICAgICBtZm4gPSBIVl9IQ0FMTF9NRk47Cj4gKyAgICAg
ICAgaHlwZXJjYWxsX21zci5lbmFibGUgPSAxOwo+ICsgICAgICAgIGh5cGVyY2FsbF9tc3IuZ3Vl
c3RfcGh5c2ljYWxfYWRkcmVzcyA9IG1mbjsKPiArICAgICAgICB3cm1zcmwoSFZfWDY0X01TUl9I
WVBFUkNBTEwsIGh5cGVyY2FsbF9tc3IuYXNfdWludDY0KTsKPiArICAgIH0gZWxzZSB7Cj4gKyAg
ICAgICAgbWZuID0gaHlwZXJjYWxsX21zci5ndWVzdF9waHlzaWNhbF9hZGRyZXNzOwo+ICsgICAg
fQoKTml0OiBTdHlsZS4gUHJlZmVyYWJseSBvbWl0IHRoZSBicmFjZXMgZnJvbSAiZWxzZSIgYWx0
b2dldGhlci4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
