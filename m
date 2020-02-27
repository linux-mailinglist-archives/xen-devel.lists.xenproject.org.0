Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE2C171669
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2020 12:53:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7HhG-00040I-27; Thu, 27 Feb 2020 11:51:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ONkH=4P=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1j7HhE-00040D-AY
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2020 11:51:16 +0000
X-Inumbo-ID: 7539f23a-5957-11ea-b7e8-bc764e2007e4
Received: from mail-ed1-f68.google.com (unknown [209.85.208.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7539f23a-5957-11ea-b7e8-bc764e2007e4;
 Thu, 27 Feb 2020 11:51:15 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n18so2626300edw.9
 for <xen-devel@lists.xenproject.org>; Thu, 27 Feb 2020 03:51:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HUqDumU5XC4BYdl2t64WJrsFE54z4pt+d/m0yt8GEYk=;
 b=FL0KmNuiq+oL1ILtiZv/dD5X0zixvYdvGHmANmDEjR9KSSeMhzMQf21UzskUyN4Icz
 z9zZxTf4auFSYwy+h5njXXuDhVWuwJwG7RIzkqYKACXEnuaq5i1hNNLYpILEXmtX0tm2
 6O6d+7H6lGsO4/ZB2MqYSItQSBQtEdxk6nIFpxSXqC4khn9BxrBfHNddjyNAsttUzv/B
 yLknCydCRYKyUT2xp6twD+HQQhyJt1hky2KcHTgRpaysp5XTaU6jLbe15mBMCKSojsck
 Q3TG3EsaXNJhJYfr7Q3N422jx89VMjScjy1fuNRb1p9WSAQ43VSJHSMH3WWFozaqvTBM
 umPw==
X-Gm-Message-State: APjAAAXiNXPRBVL5uz1jZ84eMtigMngbvzgDQQS8NQajypJ4tY7Ecv2K
 clcCfkFBX5O8StvAwkugSDM=
X-Google-Smtp-Source: APXvYqxTOVWPQzXFRzfpyRMXzMeTdb/9GyUDncJkSJomEVRYcPdMst9RnQnl6YUemfwkIXuDIWbU1A==
X-Received: by 2002:a17:906:b80a:: with SMTP id
 dv10mr3897900ejb.115.1582804274731; 
 Thu, 27 Feb 2020 03:51:14 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-239.amazon.com.
 [54.240.197.239])
 by smtp.gmail.com with ESMTPSA id h61sm322525edd.49.2020.02.27.03.51.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 03:51:14 -0800 (PST)
To: Hongyan Xia <hongyxia@amazon.com>, xen-devel@lists.xenproject.org
References: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d7db8364-e34b-4bf3-c166-70483e46eb97@xen.org>
Date: Thu, 27 Feb 2020 11:51:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e8ba0fb1451ef89c36b21a2063590baed2432031.1582799255.git.hongyxia@amazon.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] x86/mm: switch to new APIs in
 arch_init_memory
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDI3LzAyLzIwMjAgMTA6MjcsIEhvbmd5YW4gWGlhIHdyb3RlOgo+IEZy
b206IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gVGhlIGZ1bmN0aW9uIHdpbGwg
bWFwIGFuZCB1bm1hcCBwYWdlcyBvbiBkZW1hbmQuCj4gCj4gU2luY2Ugd2Ugbm93IG1hcCBhbmQg
dW5tYXAgWGVuIFBURSBwYWdlcywgd2Ugd291bGQgbGlrZSB0byB0cmFjayB0aGUKPiBsaWZldGlt
ZSBvZiBtYXBwaW5ncyBzbyB0aGF0IDEpIHdlIGRvIG5vdCBkZXJlZmVyZW5jZSBtZW1vcnkgdGhy
b3VnaCBhCj4gdmFyaWFibGUgYWZ0ZXIgaXQgaXMgdW5tYXBwZWQsIDIpIHdlIGRvIG5vdCB1bm1h
cCBtb3JlIHRoYW4gb25jZS4KPiBUaGVyZWZvcmUsIHdlIGludHJvZHVjZSB0aGUgVU5NQVBfRE9N
QUlOX1BBR0UgbWFjcm8gdG8gbnVsbGlmeSB0aGUKPiB2YXJpYWJsZSBhZnRlciB1bm1hcHBpbmcs
IGFuZCBpZ25vcmUgTlVMTC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBj
aXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neXhpYUBhbWF6b24u
Y29tPgo+IAo+IC0tLQo+IENoYW5nZWQgaW4gdjI6Cj4gLSBsZXQgVU5NQVBfRE9NQUlOX1BBR0Ug
aXRzZWxmIGNoZWNrIHdoZXRoZXIgdGhlIGlucHV0IGlzIE5VTEwgdG8gYXZvaWQKPiAgICBhZGRp
bmcgdGhlIGNoZWNrIGluIHVubWFwX2RvbWFpbl9wYWdlLgo+IC0gcmV3b3JkIHRoZSBjb21taXQg
bWVzc2FnZS4KPiAtLS0KPiAgIHhlbi9hcmNoL3g4Ni9tbS5jICAgICAgICAgICAgIHwgMTQgKysr
KysrKystLS0tLS0KPiAgIHhlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5oIHwgIDcgKysrKysr
Kwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4g
aW5kZXggNzBiODdjNDgzMC4uOWZjZGNkZTViNyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTM1NiwxOSArMzU2LDIxIEBAIHZv
aWQgX19pbml0IGFyY2hfaW5pdF9tZW1vcnkodm9pZCkKPiAgICAgICAgICAgICAgIEFTU0VSVChy
b290X3BndF9wdl94ZW5fc2xvdHMgPCBST09UX1BBR0VUQUJMRV9QVl9YRU5fU0xPVFMpOwo+ICAg
ICAgICAgICAgICAgaWYgKCBsNF90YWJsZV9vZmZzZXQoc3BsaXRfdmEpID09IGw0X3RhYmxlX29m
ZnNldChzcGxpdF92YSAtIDEpICkKPiAgICAgICAgICAgICAgIHsKPiAtICAgICAgICAgICAgICAg
IGwzX3BnZW50cnlfdCAqbDN0YWIgPSBhbGxvY194ZW5fcGFnZXRhYmxlKCk7Cj4gKyAgICAgICAg
ICAgICAgICBtZm5fdCBsM21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7Cj4gICAKPiAt
ICAgICAgICAgICAgICAgIGlmICggbDN0YWIgKQo+ICsgICAgICAgICAgICAgICAgaWYgKCAhbWZu
X2VxKGwzbWZuLCBJTlZBTElEX01GTikgKQo+ICAgICAgICAgICAgICAgICAgIHsKPiAtICAgICAg
ICAgICAgICAgICAgICBjb25zdCBsM19wZ2VudHJ5X3QgKmwzaWRsZSA9Cj4gLSAgICAgICAgICAg
ICAgICAgICAgICAgIGw0ZV90b19sM2UoaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoc3Bs
aXRfdmEpXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgbDNfcGdlbnRyeV90ICpsM2lkbGUgPSBt
YXBfbDN0X2Zyb21fbDRlKAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgaWRsZV9wZ190
YWJsZVtsNF90YWJsZV9vZmZzZXQoc3BsaXRfdmEpXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAg
bDNfcGdlbnRyeV90ICpsM3RhYiA9IG1hcF9kb21haW5fcGFnZShsM21mbik7Cj4gICAKPiAgICAg
ICAgICAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBsM190YWJsZV9vZmZzZXQoc3BsaXRf
dmEpOyArK2kgKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgbDN0YWJbaV0gPSBsM2lkbGVb
aV07Cj4gICAgICAgICAgICAgICAgICAgICAgIGZvciAoIDsgaSA8IEwzX1BBR0VUQUJMRV9FTlRS
SUVTOyArK2kgKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgbDN0YWJbaV0gPSBsM2VfZW1w
dHkoKTsKPiAtICAgICAgICAgICAgICAgICAgICBzcGxpdF9sNGUgPSBsNGVfZnJvbV9tZm4odmly
dF90b19tZm4obDN0YWIpLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgc3Bs
aXRfbDRlID0gbDRlX2Zyb21fbWZuKGwzbWZuLCBfX1BBR0VfSFlQRVJWSVNPUl9SVyk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgVU5NQVBfRE9NQUlOX1BBR0UobDNpZGxlKTsKPiArICAgICAgICAg
ICAgICAgICAgICBVTk1BUF9ET01BSU5fUEFHRShsM3RhYik7Cj4gICAgICAgICAgICAgICAgICAg
fQo+ICAgICAgICAgICAgICAgICAgIGVsc2UKPiAgICAgICAgICAgICAgICAgICAgICAgKytyb290
X3BndF9wdl94ZW5fc2xvdHM7Cj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5f
cGFnZS5oIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgKPiBpbmRleCAzMjY2OWEzMzM5
Li5iZmMzYmY2YWViIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9kb21haW5fcGFnZS5o
Cj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbl9wYWdlLmgKPiBAQCAtNzIsNCArNzIsMTEg
QEAgc3RhdGljIGlubGluZSB2b2lkIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbChjb25zdCB2b2lk
ICp2YSkge307Cj4gICAKPiAgICNlbmRpZiAvKiAhQ09ORklHX0RPTUFJTl9QQUdFICovCj4gICAK
PiArI2RlZmluZSBVTk1BUF9ET01BSU5fUEFHRShwKSBkbyB7ICAgXAo+ICsgICAgaWYgKCBwICkg
eyAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgdW5tYXBfZG9tYWluX3BhZ2UocCk7
ICAgICAgIFwKPiArICAgICAgICAocCkgPSBOVUxMOyAgICAgICAgICAgICAgICAgXAo+ICsgICAg
fSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gK30gd2hpbGUgKCBmYWxzZSApCgpE
byB3ZSBuZWVkIHRvIGtlZXAgdGhlIGRvIHt9IHdoaWxlICgpPwoKQ2hlZXJzLAoKCi0tIApKdWxp
ZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
