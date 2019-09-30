Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DFEC1F74
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:44:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEt7N-000548-RH; Mon, 30 Sep 2019 10:41:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H1QO=XZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iEt7L-00053z-I8
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:41:23 +0000
X-Inumbo-ID: d8006fe8-e36e-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d8006fe8-e36e-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:41:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CAE28ADDD;
 Mon, 30 Sep 2019 10:41:21 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190930052135.11257-1-jgross@suse.com>
 <20190930052135.11257-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d38c981f-5f81-f205-8962-a53b26201fd5@suse.com>
Date: Mon, 30 Sep 2019 12:41:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930052135.11257-4-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 03/19] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAwNzoyMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBJbiBzZXZlcmFsIHBs
YWNlcyB0aGVyZSBpcyBzdXBwb3J0IGZvciBtdWx0aXBsZSB2Y3B1cyBwZXIgc2NoZWQgdW5pdAo+
IG1pc3NpbmcuIEFkZCB0aGF0IG1pc3Npbmcgc3VwcG9ydCAod2l0aCB0aGUgZXhjZXB0aW9uIG9m
IGluaXRpYWwKPiBhbGxvY2F0aW9uKSBhbmQgbWlzc2luZyBoZWxwZXJzIGZvciB0aGF0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiBSZXZpZXdl
ZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiAtLS0KPiBSRkMgVjI6
Cj4gLSBmaXggdmNwdV9ydW5zdGF0ZV9oZWxwZXIoKQo+IFYxOgo+IC0gYWRkIHNwZWNpYWwgaGFu
ZGxpbmcgZm9yIGlkbGUgdW5pdCBpbiB1bml0X3J1bm5hYmxlKCkgYW5kCj4gICB1bml0X3J1bm5h
YmxlX3N0YXRlKCkKPiBWMjoKPiAtIGhhbmRsZSBhZmZpbml0eV9icm9rZW4gY29ycmVjdGx5IChK
YW4gQmV1bGljaCkKPiBWMzoKPiAtIHR5cGUgZm9yIGNwdSAtPnVuc2lnbmVkIGludCAoSmFuIEJl
dWxpY2gpCj4gLS0tCj4gIHhlbi9jb21tb24vZG9tYWluLmMgICAgICAgIHwgIDUgKysrKy0KCkFj
a2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
