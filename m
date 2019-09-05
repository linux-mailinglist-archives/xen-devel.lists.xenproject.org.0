Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80515A9F49
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 12:10:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5oek-0000vx-Tv; Thu, 05 Sep 2019 10:06:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ezPI=XA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5oej-0000vs-GI
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 10:06:21 +0000
X-Inumbo-ID: cebedb4e-cfc4-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cebedb4e-cfc4-11e9-b299-bc764e2007e4;
 Thu, 05 Sep 2019 10:06:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 98A57AC0C;
 Thu,  5 Sep 2019 10:06:19 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190904134608.18425-1-jgross@suse.com>
 <20190904134608.18425-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5210e461-71f8-b8ba-0698-13019be9d77c@suse.com>
Date: Thu, 5 Sep 2019 12:06:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904134608.18425-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 3/4] xen: refactor debugtrace data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNTo0NiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiAtLS0gYS94ZW4vY29t
bW9uL2RlYnVndHJhY2UuYwo+ICsrKyBiL3hlbi9jb21tb24vZGVidWd0cmFjZS5jCj4gQEAgLTE1
LDM1ICsxNSw0MSBAQAo+ICAjaW5jbHVkZSA8eGVuL3dhdGNoZG9nLmg+Cj4gIAo+ICAvKiBTZW5k
IG91dHB1dCBkaXJlY3QgdG8gY29uc29sZSwgb3IgYnVmZmVyIGl0PyAqLwo+IC1zdGF0aWMgdm9s
YXRpbGUgaW50IGRlYnVndHJhY2Vfc2VuZF90b19jb25zb2xlOwo+ICtzdGF0aWMgdm9sYXRpbGUg
Ym9vbCBkZWJ1Z3RyYWNlX3NlbmRfdG9fY29uc29sZTsKPiAgCj4gLXN0YXRpYyBjaGFyICAgICAg
ICAqZGVidWd0cmFjZV9idWY7IC8qIERlYnVnLXRyYWNlIGJ1ZmZlciAqLwo+IC1zdGF0aWMgdW5z
aWduZWQgaW50IGRlYnVndHJhY2VfcHJkOyAvKiBQcm9kdWNlciBpbmRleCAgICAgKi8KPiAtc3Rh
dGljIHVuc2lnbmVkIGludCBkZWJ1Z3RyYWNlX3ByZF9sYXN0Owo+IC1zdGF0aWMgdW5zaWduZWQg
aW50IGRlYnVndHJhY2Vfa2lsb2J5dGVzID0gMTI4LCBkZWJ1Z3RyYWNlX2J5dGVzOwo+IC1zdGF0
aWMgdW5zaWduZWQgaW50IGRlYnVndHJhY2VfdXNlZDsKPiArc3RydWN0IGRlYnVndHJhY2VfZGF0
YSB7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGJ5dGVzOyAvKiBTaXplIG9mIGJ1ZmZlci4gKi8KPiAr
ICAgIHVuc2lnbmVkIGxvbmcgcHJkOyAgIC8qIFByb2R1Y2VyIGluZGV4LiAqLwo+ICsgICAgdW5z
aWduZWQgbG9uZyBwcmRfbGFzdDsKCkknZCBzdGlsbCBsaWtlIHRoaXMgY2hhbmdlIGZyb20gaW50
IHRvIGxvbmcgbWVudGlvbmVkIC8ganVzdGlmaWVkCmluIHRoZSBkZXNjcmlwdGlvbi4gV2l0aCB0
aGlzClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
