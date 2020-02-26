Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DA217010F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 15:21:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6xVU-0003iE-NK; Wed, 26 Feb 2020 14:17:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IXf/=4O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j6xVT-0003i9-KG
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 14:17:47 +0000
X-Inumbo-ID: c2c1759c-58a2-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c2c1759c-58a2-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 14:17:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 064E5B066;
 Wed, 26 Feb 2020 14:17:44 +0000 (UTC)
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20200211093122.5644-1-jgross@suse.com>
 <818b1594-87b3-477d-db37-4ee598793ab7@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <489c79ad-2bf9-e8f4-213c-00142870359a@suse.com>
Date: Wed, 26 Feb 2020 15:17:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <818b1594-87b3-477d-db37-4ee598793ab7@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAgMjM6MjUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBKdWVyZ2VuLAo+IAo+
IE9uIDExLzAyLzIwMjAgMDk6MzEsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vdHJhcHMuYyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4+IGluZGV4IDZm
OWJlYzIyZDMuLjMwYzRjMTgzMGIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2FybS90cmFwcy5j
Cj4+ICsrKyBiL3hlbi9hcmNoL2FybS90cmFwcy5jCj4+IEBAIC0yMyw3ICsyMyw2IEBACj4+IMKg
ICNpbmNsdWRlIDx4ZW4vaW9jYXAuaD4KPj4gwqAgI2luY2x1ZGUgPHhlbi9pcnEuaD4KPj4gwqAg
I2luY2x1ZGUgPHhlbi9saWIuaD4KPj4gLSNpbmNsdWRlIDx4ZW4vbGl2ZXBhdGNoLmg+Cj4+IMKg
ICNpbmNsdWRlIDx4ZW4vbWVtX2FjY2Vzcy5oPgo+PiDCoCAjaW5jbHVkZSA8eGVuL21tLmg+Cj4+
IMKgICNpbmNsdWRlIDx4ZW4vcGFyYW0uaD4KPj4gQEAgLTIyMzksMTEgKzIyMzgsNiBAQCBzdGF0
aWMgdm9pZCBjaGVja19mb3JfcGNwdV93b3JrKHZvaWQpCj4+IMKgwqDCoMKgwqAgewo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgbG9jYWxfaXJxX2VuYWJsZSgpOwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
ZG9fc29mdGlycSgpOwo+PiAtwqDCoMKgwqDCoMKgwqAgLyoKPj4gLcKgwqDCoMKgwqDCoMKgwqAg
KiBNdXN0IGJlIHRoZSBsYXN0IG9uZSAtIGFzIHRoZSBJUEkgd2lsbCB0cmlnZ2VyIHVzIHRvIGNv
bWUgCj4+IGhlcmUKPj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBhbmQgd2Ugd2FudCB0byBwYXRjaCB0
aGUgaHlwZXJ2aXNvciB3aXRoIGFsbW9zdCBubyBzdGFjay4KPj4gLcKgwqDCoMKgwqDCoMKgwqAg
Ki8KPj4gLcKgwqDCoMKgwqDCoMKgIGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpOwo+IAo+IFRo
ZSBjaGVjayBoZXJlIHdhcyBtZWFudCB0byBtYXRjaCB0aGUgeDg2IGNvdW50ZXJwYXJ0IGluIAo+
IHJlc2V0X3N0YWNrX2FuZF9qdW1wKCkuIEkgc3VzcGVjdCB5b3UgYWxzbyBuZWVkIHRvIHJlbW92
ZSBpdC4KCk5vdCByZWFsbHksIGFzIG9uIHg4NiBhbGwgcmVsZXZhbnQgbm9uLWlkbGUgY2FzZXMg
YXJlIGJlaW5nIHN3aXRjaGVkCnRvIHVzZSByZXNldF9zdGFja19hbmRfanVtcF9ub2xwKCkuCgoK
SnVlcmdlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
