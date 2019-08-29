Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9697CA1562
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:06:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HHP-0002Y1-6W; Thu, 29 Aug 2019 10:03:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HHN-0002Xw-QZ
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:03:45 +0000
X-Inumbo-ID: 493e8a08-ca44-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 493e8a08-ca44-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 10:03:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3F680B646;
 Thu, 29 Aug 2019 10:03:44 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <131d5f04-7ef9-9a2b-3009-2a93587186ef@suse.com>
Date: Thu, 29 Aug 2019 12:03:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567069347-22841-1-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC Patch] xen/pt: Emulate FLR capability
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org,
 Paul Durrant <paul.durrant@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMDguMjAxOSAxMTowMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gQ3VycmVudGx5LCBmb3IgYSBI
Vk0gb24gWGVuLCBubyByZXNldCBtZXRob2QgaXMgdmlydHVhbGl6ZWQuIFNvIGluIGEgVk0ncwo+
IHBlcnNwZWN0aXZlLCBhc3NpZ25lZCBkZXZpY2VzIGNhbm5vdCBiZSByZXNldC4gQnV0IHNvbWUg
ZGV2aWNlcyByZWx5IG9uIFBDSQo+IHJlc2V0IHRvIHJlY292ZXIgZnJvbSBoYXJkd2FyZSBoYW5n
cy4gV2hlbiBiZWluZyBhc3NpZ25lZCB0byBhIFZNLCB0aG9zZQo+IGRldmljZXMgY2Fubm90IGJl
IHJlc2V0IGFuZCB3b24ndCB3b3JrIGFueSBsb25nZXIgaWYgYSBoYXJkd2FyZSBoYW5nIG9jY3Vy
cy4KPiBXZSBoYXZlIHRvIHJlYm9vdCBWTSB0byB0cmlnZ2VyIFBDSSByZXNldCBvbiBob3N0IHRv
IHJlY292ZXIgdGhlIGRldmljZS4KCkRpZCB5b3UgY29uc2lkZXIgYSBob3QtdW5wbHVnLCByZXNl
dCAoYnkgaG9zdCksIGhvdC1wbHVnIGN5Y2xlIGluc3RlYWQ/Cgo+ICtzdGF0aWMgaW50IHhlbl9w
dF9kZXZjdGxfcmVnX3dyaXRlKFhlblBDSVBhc3N0aHJvdWdoU3RhdGUgKnMsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgWGVuUFRSZWcgKmNmZ19lbnRyeSwgdWludDE2X3Qg
KnZhbCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBkZXZf
dmFsdWUsIHVpbnQxNl90IHZhbGlkX21hc2spCj4gK3sKPiArICAgIGlmIChzLT5yZWFsX2Rldmlj
ZS5pc19yZXNldGFibGUgJiYgKCp2YWwgJiBQQ0lfRVhQX0RFVkNUTF9CQ1JfRkxSKSkgewo+ICsg
ICAgICAgIHhlbl9wdF9yZXNldChzKTsKPiArICAgIH0KPiArICAgIHJldHVybiB4ZW5fcHRfd29y
ZF9yZWdfd3JpdGUocywgY2ZnX2VudHJ5LCB2YWwsIGRldl92YWx1ZSwgdmFsaWRfbWFzayk7CgpJ
IHRoaW5rIHlvdSBhbHNvIG5lZWQgdG8gY2xlYXIgdGhlIGJpdCBiZWZvcmUgaGFuZGluZyBvbiB0
aGUgcmVxdWVzdCwKc3VjaCB0aGF0IHJlYWRzIHdpbGwgYWx3YXlzIG9ic2VydmUgaXQgY2xlYXIu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
