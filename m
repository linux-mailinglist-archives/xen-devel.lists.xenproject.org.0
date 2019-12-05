Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2F5113D97
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:11:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icn4y-0006Hy-Ge; Thu, 05 Dec 2019 09:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icn4x-0006Ht-Rv
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:05:43 +0000
X-Inumbo-ID: 6956efb4-173e-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6956efb4-173e-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 09:05:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8D74B035;
 Thu,  5 Dec 2019 09:05:40 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-5-andrew.cooper3@citrix.com>
 <2d347b3a-7b2e-d28a-59d0-2206bc215206@suse.com>
 <d4fc4cfe-b4d0-5c26-12dc-df1631f8d49b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50acce40-7a70-3dad-af18-8320b809fcd3@suse.com>
Date: Thu, 5 Dec 2019 10:05:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d4fc4cfe-b4d0-5c26-12dc-df1631f8d49b@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/svm: Use named (bit)fields for task
 switch exit info
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAyMTowNCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBOZXQgZGVsdGEgaXM6
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKPiBi
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNiLmgKPiBpbmRleCAwMmI1ZTg2YjQ5Li44
NjQ2MThjY2Y5IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL3N2bS92bWNi
LmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9zdm0vdm1jYi5oCj4gQEAgLTQxOSwx
NyArNDE5LDE1IEBAIHN0cnVjdCB2bWNiX3N0cnVjdCB7Cj4gwqDCoMKgwqAgdTY0IGludGVycnVw
dF9zaGFkb3c7wqDCoMKgwqDCoMKgIC8qIG9mZnNldCAweDY4ICovCj4gwqDCoMKgwqAgdTY0IGV4
aXRjb2RlO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogb2Zmc2V0IDB4NzAgKi8KPiDC
oMKgwqDCoCB1bmlvbiB7Cj4gLcKgwqDCoMKgwqDCoMKgIHU2NCBleGl0aW5mbzE7wqDCoMKgwqDC
oMKgwqDCoMKgIC8qIG9mZnNldCAweDc4ICovCj4gK8KgwqDCoMKgwqDCoMKgIHN0cnVjdCB7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdWludDY0X3QgZXhpdGluZm8xOyAvKiBvZmZzZXQgMHg3
OCAqLwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGV4aXRpbmZvMjsgLyogb2Zm
c2V0IDB4ODAgKi8KPiArwqDCoMKgwqDCoMKgwqAgfTsKPiDCoMKgwqDCoMKgwqDCoMKgIHVuaW9u
IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB1aW50MTZfdCBzZWw7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fSB0YXNrX3N3aXRjaDsKPiAtwqDCoMKgwqDCoMKgwqAgfSBlMTsKPiAtwqDCoMKgIH07Cj4gLcKg
wqDCoCB1bmlvbiB7Cj4gLcKgwqDCoMKgwqDCoMKgIHU2NCBleGl0aW5mbzI7wqDCoMKgwqDCoMKg
wqDCoMKgIC8qIG9mZnNldCAweDgwICovCj4gLcKgwqDCoMKgwqDCoMKgIHVuaW9uIHsKPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdWludDY0X3QgOjQ4Owo+ICsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB1aW50MzJfdCBlYzsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJf
dCA6NDsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29swqDCoMKgwqAgaXJl
dDoxOwo+IEBAIC00NDAsNyArNDM4LDcgQEAgc3RydWN0IHZtY2Jfc3RydWN0IHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50MzJfdCA6MzsKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBib29swqDCoMKgwqAgcmY6MTsKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfSB0YXNrX3N3aXRjaDsKPiAtwqDCoMKgwqDCoMKgwqAgfSBlMjsKPiArwqDCoMKgwqDC
oMKgwqAgfSBlaTsKPiDCoMKgwqDCoCB9Owo+IMKgwqDCoMKgIGludGluZm9fdCBleGl0aW50aW5m
bzvCoMKgwqDCoMKgIC8qIG9mZnNldCAweDg4ICovCj4gwqDCoMKgwqAgdTY0IF9ucF9lbmFibGU7
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIG9mZnNldCAweDkwIC0gY2xlYW5iaXQgNCAqLwo+
IAo+IExHVE0uCgpBbmQgdGhlIHJlc3VsdCB0aGVuClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
