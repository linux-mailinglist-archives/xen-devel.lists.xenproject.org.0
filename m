Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572061777AC
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 14:48:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j97rW-0002ti-No; Tue, 03 Mar 2020 13:45:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TLdZ=4U=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j97rV-0002td-RT
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 13:45:29 +0000
X-Inumbo-ID: 3e4c5e96-5d55-11ea-a16b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e4c5e96-5d55-11ea-a16b-12813bfff9fa;
 Tue, 03 Mar 2020 13:45:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1ED3BAFC5;
 Tue,  3 Mar 2020 13:45:28 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200303123058.27210-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
Date: Tue, 3 Mar 2020 14:45:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303123058.27210-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAyMCAxMzozMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMjUzOCw3ICsy
NTUyLDEwIEBAIHN0YXRpYyB2b2lkIHNjaGVkX3NsYXZlKHZvaWQpCj4gIAo+ICAgICAgbmV4dCA9
IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgY3B1LCBub3cpOwo+ICAgICAg
aWYgKCAhbmV4dCApCj4gKyAgICB7Cj4gKyAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9y
ZXNfcmN1bG9jayk7Cj4gICAgICAgICAgcmV0dXJuOwo+ICsgICAgfQoKVGhpcyBhbmQgLi4uCgo+
IEBAIC0yNTk5LDcgKzI2MTYsMTAgQEAgc3RhdGljIHZvaWQgc2NoZWR1bGUodm9pZCkKPiAgICAg
ICAgICBjcHVtYXNrX3JhaXNlX3NvZnRpcnEobWFzaywgU0NIRURfU0xBVkVfU09GVElSUSk7Cj4g
ICAgICAgICAgbmV4dCA9IHNjaGVkX3dhaXRfcmVuZGV6dm91c19pbihwcmV2LCAmbG9jaywgY3B1
LCBub3cpOwo+ICAgICAgICAgIGlmICggIW5leHQgKQo+ICsgICAgICAgIHsKPiArICAgICAgICAg
ICAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1bG9jayk7Cj4gICAgICAgICAgICAgIHJl
dHVybjsKPiArICAgICAgICB9CgouLi4gdGhpcyBsb29rIGxpa2UgaW5kZXBlbmRlbnQgZml4ZXMs
IGFzIG9uIEFybSwKc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKCkgY2FuIGFscmVhZHkgcmV0dXJu
IE5VTEwuIElmIHRoZXkgZ2V0CmZvbGRlZCBpbnRvIGhlcmUsIEkgdGhpbmsgdGhlIGRlc2NyaXB0
aW9uIHNob3VsZCBjbGFyaWZ5IHRoYXQKdGhlc2UgYXJlIG9ydGhvZ29uYWwgdG8gdGhlIHJlc3Qu
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
