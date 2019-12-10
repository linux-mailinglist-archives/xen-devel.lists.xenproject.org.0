Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7AC1181CB
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 09:11:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieaa8-0002lt-Hy; Tue, 10 Dec 2019 08:09:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ieaa6-0002ln-Gr
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 08:09:18 +0000
X-Inumbo-ID: 5c6b9158-1b24-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5c6b9158-1b24-11ea-b6f1-bc764e2007e4;
 Tue, 10 Dec 2019 08:09:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4825B337;
 Tue, 10 Dec 2019 08:09:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <20191205223008.8623-4-andrew.cooper3@citrix.com>
 <88fc6e0d-0c1c-67fb-d50a-a15743ce23c9@suse.com>
 <e9672b4e-ef46-d52f-8044-4eb6069175ef@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <70dbdbd2-ce7a-bbe1-8c85-ff7bea4bc712@suse.com>
Date: Tue, 10 Dec 2019 09:09:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e9672b4e-ef46-d52f-8044-4eb6069175ef@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/6] xen/domctl: Consolidate hypercall
 continuation handling at the top level
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxODoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwOS8xMi8yMDE5
IDE2OjE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDUuMTIuMjAxOSAyMzozMCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IEBAIC0xMDgwLDYgKzEwNjgsOSBAQCBsb25nIGRvX2RvbWN0bChY
RU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwpCj4+PiAgICAgIGlm
ICggY29weWJhY2sgJiYgX19jb3B5X3RvX2d1ZXN0KHVfZG9tY3RsLCBvcCwgMSkgKQo+Pj4gICAg
ICAgICAgcmV0ID0gLUVGQVVMVDsKPj4+ICAKPj4+ICsgICAgaWYgKCByZXQgPT0gLUVSRVNUQVJU
ICkKPj4+ICsgICAgICAgIHJldCA9IGh5cGVyY2FsbF9jcmVhdGVfY29udGludWF0aW9uKF9fSFlQ
RVJWSVNPUl9kb21jdGwsCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiaCIsIHVfZG9tY3RsKTsKPj4gWW91IG1heSB3YW50IHRvIG1lbnRpb24gaW4gdGhl
IGRlc2NyaXB0aW9uIHRoZSBidWcgeW91IGZpeCBoZXJlOgo+PiBQcmV2aW91c2x5IHRoZSAtRUZB
VUxUIHJldHVybmluZyB2aXNpYmxlIGluIGNvbnRleHQgc2hvdWxkIGhhdmUKPj4gY2FuY2VsZWQg
YW55IGFjdGl2ZSBjb250aW51YXRpb24uCj4gCj4gVGhhdCB3b3VsZCBiZSBwcmVzdW1pbmcgSSdk
IGV2ZW4gc3BvdHRlZCBpdC4uLgo+IAo+IEhhdmluZyBsb29rZWQgdGhvdWdoIHRoZSBwYXRocyBv
bmNlIGFnYWluLCBJIGRvbid0IHRoaW5rIHRoZXJlIHdhcyBhCj4gcGF0aCB3aGljaCBjb250aW51
ZWQgYW5kIGhhZCBjb3B5YmFjayBzZXQsIHNvIHRoaXMgaXMgYXQgbW9zdCBhIGxhdGVudAo+IGJ1
Zy4KCkFoLCBnb29kLiBJIGFjdHVhbGx5IGZpcnN0IG1lYW50IHRvIGNoZWNrLCBidXQgdGhlbiBm
b3Jnb3QgYmVmb3JlCnNlbmRpbmcgdGhlIGVhcmxpZXIgcmVwbHkuCgpKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
