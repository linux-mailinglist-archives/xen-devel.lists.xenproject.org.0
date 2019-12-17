Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F34012325E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 17:26:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihFdb-0000Pw-3f; Tue, 17 Dec 2019 16:23:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VK9c=2H=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ihFdZ-0000Pr-PZ
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 16:23:53 +0000
X-Inumbo-ID: 989f7e3a-20e9-11ea-88e7-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 989f7e3a-20e9-11ea-88e7-bc764e2007e4;
 Tue, 17 Dec 2019 16:23:45 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id t14so3849144wmi.5
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2019 08:23:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IIuaC/Qx4CsEOQmVt7liNBjyq93VLUHuN6K2BeBg148=;
 b=pQcMo0tILVP3Lqy8SZcCvEblRjM7ocmF3f/FQWv8gLDUoBHgZaiywpO8MKS7X+wqD4
 ylBHFbLYjzC1kSk2DymSb/C5WkoHx7Pi/zQsso9YD3hEgmBpHoP4xhcFUMV31vQUTCQk
 Goh98uyiqBsp1yLzxYjiu1sXu10Tyut4p6jDQbSyrAoCeXXx/TzpFQwVozFivZ0wbM7O
 Qx0ej0mJOJV+g/5tMPSV66FzTVFsMlxF/vjcuzEf/6GBvEyTTZQz1Xighrc29tI88245
 gkZilxYO+pu4R1XOSCO7g9nqgXa6dU/3rMHIMSNS6ZnQDzURan45jWdduNkS8B7aSDvh
 pkGw==
X-Gm-Message-State: APjAAAUQnwe0kGEUgqgErS4+skBQ6z9cs7TIcXz75EWfUg7pZkuUNck+
 5wFC/TfguhtMHPuq9dlwKEU=
X-Google-Smtp-Source: APXvYqwRMlrhHyYEuLYGAZfUyW7dC8vPU2mTxsTq5e0FzQRkEw0uijCZpk17idSDprG8ENP0pg9n0w==
X-Received: by 2002:a1c:7205:: with SMTP id n5mr6689116wmc.9.1576599824444;
 Tue, 17 Dec 2019 08:23:44 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id k8sm26364326wrl.3.2019.12.17.08.23.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 08:23:43 -0800 (PST)
To: Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org
References: <386d90786338008fa5f7f5b649f529da2dec14e9.1576593199.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e304b7ce-90c8-4780-4725-76d62c1385ca@xen.org>
Date: Tue, 17 Dec 2019 16:23:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <386d90786338008fa5f7f5b649f529da2dec14e9.1576593199.git.hongyxia@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/page_alloc: statically allocate
 bootmem_region_list
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDE3LzEyLzIwMTkgMTQ6MzMsIEhvbmd5YW4gWGlhIHdyb3RlOgo+IFRo
ZSBleGlzdGluZyBjb2RlIGFzc3VtZXMgdGhhdCB0aGUgZmlyc3QgbWZuIHBhc3NlZCB0byB0aGUg
Ym9vdAo+IGFsbG9jYXRvciBpcyBtYXBwZWQsIHdoaWNoIGNyZWF0ZXMgcHJvYmxlbXMgd2hlbiwg
ZS5nLiwgd2UgZG8gbm90IGhhdmUKPiBhIGRpcmVjdCBtYXAsIGFuZCBtYXkgY3JlYXRlIG90aGVy
IGJvb3RzdHJhcHBpbmcgcHJvYmxlbXMgaW4gdGhlCj4gZnV0dXJlLiBNYWtlIGl0IHN0YXRpYy4g
VGhlIHNpemUgaXMga2VwdCB0aGUgc2FtZSBhcyBiZWZvcmUgKDEgcGFnZSkuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSG9uZ3lhbiBYaWEgPGhvbmd5eGlhQGFtYXpvbi5jb20+Cj4gLS0tCj4gICB4ZW4v
Y29tbW9uL3BhZ2VfYWxsb2MuYyB8IDExICsrKysrLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vY29t
bW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gaW5kZXggN2NiMWJk
MzY4Yi4uN2FmYjY1MWI3OSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYwo+
ICsrKyBiL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4gQEAgLTI0NCw5ICsyNDQsMTIgQEAgUEFH
RV9MSVNUX0hFQUQocGFnZV9icm9rZW5fbGlzdCk7Cj4gICAgKi8KPiAgIG1mbl90IGZpcnN0X3Zh
bGlkX21mbiA9IElOVkFMSURfTUZOX0lOSVRJQUxJWkVSOwo+ICAgCj4gLXN0YXRpYyBzdHJ1Y3Qg
Ym9vdG1lbV9yZWdpb24gewo+ICtzdHJ1Y3QgYm9vdG1lbV9yZWdpb24gewo+ICAgICAgIHVuc2ln
bmVkIGxvbmcgcywgZTsgLyogTUZOcyBAcyB0aHJvdWdoIEBlLTEgaW5jbHVzaXZlIGFyZSBmcmVl
ICovCj4gLX0gKl9faW5pdGRhdGEgYm9vdG1lbV9yZWdpb25fbGlzdDsKPiArfTsKPiArLyogU3Rh
dGljYWxseSBhbGxvY2F0ZSBhIHBhZ2UgZm9yIGJvb3RtZW1fcmVnaW9uX2xpc3QuICovCj4gK3N0
YXRpYyBzdHJ1Y3QgYm9vdG1lbV9yZWdpb24gX19pbml0ZGF0YQo+ICsgICAgYm9vdG1lbV9yZWdp
b25fbGlzdFtQQUdFX1NJWkUvc2l6ZW9mKHN0cnVjdCBib290bWVtX3JlZ2lvbildOwoKTklUOiBz
cGFjZSBiZWZvcmUgYW5kIGFmdGVyIC8uCgpPdGhlciB0aGFuIHRoYXQ6CgpSZXZpZXdlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
