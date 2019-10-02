Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7113C453B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 02:58:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFSwY-0006qO-1h; Wed, 02 Oct 2019 00:56:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFSwW-0006qJ-R8
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 00:56:36 +0000
X-Inumbo-ID: 7b96b504-e4af-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7b96b504-e4af-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 00:56:36 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0994520842;
 Wed,  2 Oct 2019 00:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569977795;
 bh=mtHGiMcriX93hDLIeRWjYDHf2I2dEU2EK+r9HjMLmUs=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=pTGg+2pY58Smopzbq09IAo1zawkXXS9C4aY+NY+0OaEuvJdkZ3A6qo9nbjVqqTXGf
 8vevMRbhl7CTHaWAO6HyMfnOFpSvteBEB3w7dmfP5bcNbQBJex23pam4YHN/mLPCXE
 KlVFs0q5lUP15jlXmzbTL9Uaq6VpAlVvVs4055Do=
Date: Tue, 1 Oct 2019 17:56:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190924143515.8810-2-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011755590.2943@sstabellini-ThinkPad-T480s>
References: <20190924143515.8810-1-julien.grall@arm.com>
 <20190924143515.8810-2-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 1/2] xen/arm: Implement
 workaround for Cortex A-57 and Cortex A72 AT speculate
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyNCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEJvdGggQ29ydGV4LUE1
NyAoZXJyYXR1bSAxMzE5NTM3KSBhbmQgQ29ydGV4LUE3MiAoZXJyYXR1bSAxMzE5MzY3KSBjYW4K
PiBlbmQgd2l0aCBjb3JydXB0IFRMQnMgaWYgdGhleSBzcGVjdWxhdGUgYW4gQVQgaW5zdHJ1Y3Rp
b24gd2hpbGUgUzEvUzIKICAgICAgICAgICBeIGNvcnJ1cHRlZAoKPiBzeXN0ZW0gcmVnaXN0ZXJz
IGluIGluY29uc2lzdGVudCBzdGF0ZS4KPiAKPiBUaGUgd29ya2Fyb3VuZCBpcyB0aGUgc2FtZSBh
cyBmb3IgQ29ydGV4IEEtNzYgaW1wbGVtZW50ZWQgYnkgY29tbWl0Cj4gYTE4YmUwNmFjYSAieGVu
L2FybTogSW1wbGVtZW50IHdvcmthcm91bmQgZm9yIENvcnRleC1BNzYgZXJyYXR1bSAxMTY1NTIy
IiwKPiBzbyBpdCBpcyBvbmx5IG5lY2Vzc2FyeSB0byBwbHVtYiBpbiB0aGUgY3B1ZXJyYXRhIGZy
YW1ld29yay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KCgo+IC0tLQo+ICAgICBDaGFuZ2VzIGluIHYyOgo+ICAgICAgICAgLSBBZGQgbWlzc2lu
ZyB8Cj4gLS0tCj4gIGRvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0IHwgIDIgKysKPiAg
eGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jICAgICAgICAgfCAxMCArKysrKysrKysrCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kb2NzL21pc2Mv
YXJtL3NpbGljb24tZXJyYXRhLnR4dCBiL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0
Cj4gaW5kZXggNmNkMTM2NmYxNS4uMTFlNWE5ZGNlYyAxMDA2NDQKPiAtLS0gYS9kb2NzL21pc2Mv
YXJtL3NpbGljb24tZXJyYXRhLnR4dAo+ICsrKyBiL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJh
dGEudHh0Cj4gQEAgLTQ4LDUgKzQ4LDcgQEAgc3RhYmxlIGh5cGVydmlzb3JzLgo+ICB8IEFSTSAg
ICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzg1MjUyMyAgICAgICAgIHwgTi9BICAgICAg
ICAgICAgICAgICAgICAgfAo+ICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwg
IzgzMjA3NSAgICAgICAgIHwgQVJNNjRfRVJSQVRVTV84MzIwNzUgICAgfAo+ICB8IEFSTSAgICAg
ICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzgzNDIyMCAgICAgICAgIHwgQVJNNjRfRVJSQVRV
TV84MzQyMjAgICAgfAo+ICt8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwgIzEz
MTk1MzcgICAgICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAgfAo+ICt8IEFSTSAgICAgICAg
ICAgIHwgQ29ydGV4LUE3MiAgICAgIHwgIzEzMTkzNjcgICAgICAgIHwgTi9BICAgICAgICAgICAg
ICAgICAgICAgfAo+ICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE3NiAgICAgIHwgIzExNjU1
MjIgICAgICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAgfAo+ICB8IEFSTSAgICAgICAgICAg
IHwgTU1VLTUwMCAgICAgICAgIHwgIzg0Mjg2OSAgICAgICAgIHwgTi9BICAgICAgICAgICAgICAg
ICAgICAgfAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgYi94ZW4vYXJj
aC9hcm0vY3B1ZXJyYXRhLmMKPiBpbmRleCA2ZjQ4M2IyZDhkLi5kYTcyYjAyNDQyIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9jcHVlcnJhdGEuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9jcHVl
cnJhdGEuYwo+IEBAIC00ODEsNiArNDgxLDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXJtX2Nw
dV9jYXBhYmlsaXRpZXMgYXJtX2VycmF0YVtdID0gewo+ICAgICAgICAgIC5jYXBhYmlsaXR5ID0g
QVJNNjRfV09SS0FST1VORF9BVF9TUEVDVUxBVEUsCj4gICAgICAgICAgTUlEUl9SQU5HRShNSURS
X0NPUlRFWF9BNzYsIDAsIDIgPDwgTUlEUl9WQVJJQU5UX1NISUZUKSwKPiAgICAgIH0sCj4gKyAg
ICB7Cj4gKyAgICAgICAgLmRlc2MgPSAiQVJNIGVycmF0dW0gMTMxOTUzNyIsCj4gKyAgICAgICAg
LmNhcGFiaWxpdHkgPSBBUk02NF9XT1JLQVJPVU5EX0FUX1NQRUNVTEFURSwKPiArICAgICAgICBN
SURSX0FMTF9WRVJTSU9OUyhNSURSX0NPUlRFWF9BNzIpLAo+ICsgICAgfSwKPiArICAgIHsKPiAr
ICAgICAgICAuZGVzYyA9ICJBUk0gZXJyYXR1bSAxMzE5MzY3IiwKPiArICAgICAgICAuY2FwYWJp
bGl0eSA9IEFSTTY0X1dPUktBUk9VTkRfQVRfU1BFQ1VMQVRFLAo+ICsgICAgICAgIE1JRFJfQUxM
X1ZFUlNJT05TKE1JRFJfQ09SVEVYX0E1NyksCj4gKyAgICB9LAo+ICAgICAge30sCj4gIH07Cj4g
IAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
