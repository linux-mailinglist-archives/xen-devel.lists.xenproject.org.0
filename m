Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC0410B40F
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 18:04:31 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia0hT-0002XT-44; Wed, 27 Nov 2019 17:01:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zCzl=ZT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ia0hR-0002Wx-37
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 17:01:57 +0000
X-Inumbo-ID: 9d820eb7-1137-11ea-a3ba-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9d820eb7-1137-11ea-a3ba-12813bfff9fa;
 Wed, 27 Nov 2019 17:01:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5AB9EAEC1;
 Wed, 27 Nov 2019 17:01:55 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191126150112.12704-1-andrew.cooper3@citrix.com>
 <20191126150112.12704-3-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <30056ba9-bbe0-39f5-ecf5-1174ebedc664@suse.com>
Date: Wed, 27 Nov 2019 18:02:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126150112.12704-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] AMD/IOMMU: Render IO_PAGE_FAULT errors
 in a more useful manner
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNjowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBAQCAtNTYwLDE4ICs1
NTcsMjYgQEAgc3RhdGljIHZvaWQgcGFyc2VfZXZlbnRfbG9nX2VudHJ5KHN0cnVjdCBhbWRfaW9t
bXUgKmlvbW11LCB1MzIgZW50cnlbXSkKPiAgCj4gICAgICBpZiAoIGNvZGUgPT0gSU9NTVVfRVZF
TlRfSU9fUEFHRV9GQVVMVCApCj4gICAgICB7Cj4gLSAgICAgICAgZGV2aWNlX2lkID0gaW9tbXVf
Z2V0X2RldmlkX2Zyb21fZXZlbnQoZW50cnlbMF0pOwo+IC0gICAgICAgIGRvbWFpbl9pZCA9IGdl
dF9maWVsZF9mcm9tX3JlZ191MzIoZW50cnlbMV0sCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJT01NVV9FVkVOVF9ET01BSU5fSURfTUFTSywKPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VX0VWRU5UX0RPTUFJTl9J
RF9TSElGVCk7Cj4gLSAgICAgICAgZmxhZ3MgPSBnZXRfZmllbGRfZnJvbV9yZWdfdTMyKGVudHJ5
WzFdLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJT01NVV9FVkVO
VF9GTEFHU19NQVNLLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
T01NVV9FVkVOVF9GTEFHU19TSElGVCk7Cj4gLSAgICAgICAgYWRkcj0gKHU2NCopIChlbnRyeSAr
IDIpOwo+IC0gICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJBTUQtVmk6ICIKPiAtICAgICAgICAg
ICAgICAgIiVzOiBkb21haW4gPSAlZCwgZGV2aWNlIGlkID0gJSN4LCAiCj4gLSAgICAgICAgICAg
ICAgICJmYXVsdCBhZGRyZXNzID0gJSMiUFJJeDY0IiwgZmxhZ3MgPSAlI3hcbiIsCj4gLSAgICAg
ICAgICAgICAgIGNvZGVfc3RyLCBkb21haW5faWQsIGRldmljZV9pZCwgKmFkZHIsIGZsYWdzKTsK
PiArICAgICAgICB1bnNpZ25lZCBpbnQgYmRmOwo+ICsgICAgICAgIHVpbnQxNl90IGRldmljZV9p
ZCA9IE1BU0tfRVhUUihlbnRyeVswXSwgSU9NTVVfQ01EX0RFVklDRV9JRF9NQVNLKTsKCnMvQ01E
L0VWRU5ULyBhbmQgdGhlbgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
