Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F1CBC9FA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:17:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iClZB-0006Wb-VA; Tue, 24 Sep 2019 14:13:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IFsf=XT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iClZA-0006WW-EC
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:13:20 +0000
X-Inumbo-ID: 753a2d9c-ded5-11e9-961e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 753a2d9c-ded5-11e9-961e-12813bfff9fa;
 Tue, 24 Sep 2019 14:13:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CBF3337;
 Tue, 24 Sep 2019 07:13:18 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C39A3F59C;
 Tue, 24 Sep 2019 07:13:18 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190924110749.18210-1-julien.grall@arm.com>
 <87a7ataiwd.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <387853ef-b3c2-d3d4-5442-333309df0c35@arm.com>
Date: Tue, 24 Sep 2019 15:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87a7ataiwd.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: Implement workaround for
 Cortex A-57 and Cortex A72 AT speculate
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjQvMDkvMjAxOSAxNTowNiwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gCj4gCj4gSnVsaWVuIEdyYWxsIHdyaXRlczoKPiAKPj4gQm90aCBDb3J0ZXgtQTU3IChl
cnJhdHVtIDEzMTk1MzcpIGFuZCBDb3J0ZXgtQTcyIChlcnJhdHVtIDEzMTkzNjcpIGNhbgo+PiBl
bmQgd2l0aCBjb3JydXB0IFRMQnMgaWYgdGhleSBzcGVjdWxhdGUgYW4gQVQgaW5zdHJ1Y3Rpb24g
d2hpbGUgUzEvUzIKPj4gc3lzdGVtIHJlZ2lzdGVycyBpbiBpbmNvbnNpc3RlbnQgc3RhdGUuCj4+
Cj4+IFRoZSB3b3JrYXJvdW5kIGlzIHRoZSBzYW1lIGFzIGZvciBDb3J0ZXggQS03NiBpbXBsZW1l
bnRlZCBieSBjb21taXQKPj4gYTE4YmUwNmFjYSAieGVuL2FybTogSW1wbGVtZW50IHdvcmthcm91
bmQgZm9yIENvcnRleC1BNzYgZXJyYXR1bSAxMTY1NTIyIiwKPj4gc28gaXQgaXMgb25seSBuZWNl
c3NhcnkgdG8gcGx1bWIgaW4gdGhlIGNwdWVycmF0YSBmcmFtZXdvcmsuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gV2l0aCBhIGZldyBu
aXRzOgo+IAo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNo
dWtAZXBhbS5jb20+Cj4gCj4+IC0tLQo+PiAgIGRvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEu
dHh0IHwgIDIgKysKPj4gICB4ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMgICAgICAgICB8IDEwICsr
KysrKysrKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPj4KPj4gZGlm
ZiAtLWdpdCBhL2RvY3MvbWlzYy9hcm0vc2lsaWNvbi1lcnJhdGEudHh0IGIvZG9jcy9taXNjL2Fy
bS9zaWxpY29uLWVycmF0YS50eHQKPj4gaW5kZXggNmNkMTM2NmYxNS4uY2YxOTNhNmQ0ZCAxMDA2
NDQKPj4gLS0tIGEvZG9jcy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQKPj4gKysrIGIvZG9j
cy9taXNjL2FybS9zaWxpY29uLWVycmF0YS50eHQKPj4gQEAgLTQ4LDUgKzQ4LDcgQEAgc3RhYmxl
IGh5cGVydmlzb3JzLgo+PiAgIHwgQVJNICAgICAgICAgICAgfCBDb3J0ZXgtQTU3ICAgICAgfCAj
ODUyNTIzICAgICAgICAgfCBOL0EgICAgICAgICAgICAgICAgICAgICB8Cj4+ICAgfCBBUk0gICAg
ICAgICAgICB8IENvcnRleC1BNTcgICAgICB8ICM4MzIwNzUgICAgICAgICB8IEFSTTY0X0VSUkFU
VU1fODMyMDc1ICAgIHwKPj4gICB8IEFSTSAgICAgICAgICAgIHwgQ29ydGV4LUE1NyAgICAgIHwg
IzgzNDIyMCAgICAgICAgIHwgQVJNNjRfRVJSQVRVTV84MzQyMjAgICAgfAo+PiArfCBBUk0gICAg
ICAgICAgICB8IENvcnRleC1BNTcgICAgICB8ICMxMzE5NTM3ICAgICAgICB8IE4vQQo+PiArfCBB
Uk0gICAgICAgICAgICB8IENvcnRleC1BNzIgICAgICB8ICMxMzE5MzY3ICAgICAgICB8IE4vQQo+
IExvb2tzIGxpa2UgeW91IG1pc3NlZCB0aGUgbGFzdCB8LgoKSSB3aWxsIGRvIGl0LgoKPiAKPiBB
bHNvLCBpcyB0aGlzICJBUk0iIG9yICJBcm0iPyBJIGJlbGlldmUgeW91IGFza2VkIG1lIHRvIHVz
ZXIgdGhlIGxhdHRlci4KClRoaXMgcGF0Y2ggbmVlZHMgdG8gYmUgYmFja3BvcnRlZCwgc28gSSBm
ZWx0IGl0IHdhcyBiZXR0ZXIgdG8ga2VlcCBjb25zaXN0ZW5jeSAKZm9yIG5vdy4gSSBjYW4gYWRk
IGEgcGF0Y2ggb24gdG9wIHRvIHJlbmFtZSBhbGwgb2YgdGhlbS4KCj4gCj4+ICAgfCBBUk0gICAg
ICAgICAgICB8IENvcnRleC1BNzYgICAgICB8ICMxMTY1NTIyICAgICAgICB8IE4vQSAgICAgICAg
ICAgICAgICAgICAgIHwKPj4gICB8IEFSTSAgICAgICAgICAgIHwgTU1VLTUwMCAgICAgICAgIHwg
Izg0Mjg2OSAgICAgICAgIHwgTi9BICAgICAgICAgICAgICAgICAgICAgfAo+PiBkaWZmIC0tZ2l0
IGEveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jIGIveGVuL2FyY2gvYXJtL2NwdWVycmF0YS5jCj4+
IGluZGV4IDZmNDgzYjJkOGQuLmRhNzJiMDI0NDIgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9jcHVlcnJhdGEuYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vY3B1ZXJyYXRhLmMKPj4gQEAgLTQ4
MSw2ICs0ODEsMTYgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhcm1fY3B1X2NhcGFiaWxpdGllcyBh
cm1fZXJyYXRhW10gPSB7Cj4+ICAgICAgICAgICAuY2FwYWJpbGl0eSA9IEFSTTY0X1dPUktBUk9V
TkRfQVRfU1BFQ1VMQVRFLAo+PiAgICAgICAgICAgTUlEUl9SQU5HRShNSURSX0NPUlRFWF9BNzYs
IDAsIDIgPDwgTUlEUl9WQVJJQU5UX1NISUZUKSwKPj4gICAgICAgfSwKPj4gKyAgICB7Cj4+ICsg
ICAgICAgIC5kZXNjID0gIkFSTSBlcnJhdHVtIDEzMTk1MzciLAo+PiArICAgICAgICAuY2FwYWJp
bGl0eSA9IEFSTTY0X1dPUktBUk9VTkRfQVRfU1BFQ1VMQVRFLAo+PiArICAgICAgICBNSURSX0FM
TF9WRVJTSU9OUyhNSURSX0NPUlRFWF9BNzIpLAo+PiArICAgIH0sCj4+ICsgICAgewo+PiArICAg
ICAgICAuZGVzYyA9ICJBUk0gZXJyYXR1bSAxMzE5MzY3IiwKPj4gKyAgICAgICAgLmNhcGFiaWxp
dHkgPSBBUk02NF9XT1JLQVJPVU5EX0FUX1NQRUNVTEFURSwKPj4gKyAgICAgICAgTUlEUl9BTExf
VkVSU0lPTlMoTUlEUl9DT1JURVhfQTU3KSwKPj4gKyAgICB9LAo+PiAgICAgICB7fSwKPj4gICB9
Owo+IAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
