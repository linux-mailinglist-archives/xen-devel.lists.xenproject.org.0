Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFB9162AB5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 17:34:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j45mU-00067S-HZ; Tue, 18 Feb 2020 16:31:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u3z7=4G=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j45mT-00067N-2M
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 16:31:29 +0000
X-Inumbo-ID: 1c968dec-526c-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c968dec-526c-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 16:31:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4C69AC159;
 Tue, 18 Feb 2020 16:31:27 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200217111740.7298-1-andrew.cooper3@citrix.com>
 <20200217111740.7298-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f3b2686-7d47-3899-2621-a8a45d2bbf02@suse.com>
Date: Tue, 18 Feb 2020 17:31:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200217111740.7298-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/3] xen/x86: Rename and simplify
 async_event_* infrastructure
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDIuMjAyMCAxMjoxNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvcHYvaXJldC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3B2L2lyZXQuYwo+IEBAIC0yNywx
NSArMjcsMTUgQEAgc3RhdGljIHZvaWQgYXN5bmNfZXhjZXB0aW9uX2NsZWFudXAoc3RydWN0IHZj
cHUgKmN1cnIpCj4gIHsKPiAgICAgIHVuc2lnbmVkIGludCB0cmFwOwo+ICAKPiAtICAgIGlmICgg
IWN1cnItPmFyY2guYXN5bmNfZXhjZXB0aW9uX21hc2sgKQo+ICsgICAgaWYgKCAhY3Vyci0+YXJj
aC5hc3luY19ldmVudF9tYXNrICkKPiAgICAgICAgICByZXR1cm47Cj4gIAo+IC0gICAgaWYgKCAh
KGN1cnItPmFyY2guYXN5bmNfZXhjZXB0aW9uX21hc2sgJiAoY3Vyci0+YXJjaC5hc3luY19leGNl
cHRpb25fbWFzayAtIDEpKSApCj4gLSAgICAgICAgdHJhcCA9IF9fc2NhbmJpdChjdXJyLT5hcmNo
LmFzeW5jX2V4Y2VwdGlvbl9tYXNrLCBWQ1BVX1RSQVBfTk9ORSk7Cj4gKyAgICBpZiAoICEoY3Vy
ci0+YXJjaC5hc3luY19ldmVudF9tYXNrICYgKGN1cnItPmFyY2guYXN5bmNfZXZlbnRfbWFzayAt
IDEpKSApCj4gKyAgICAgICAgdHJhcCA9IF9fc2NhbmJpdChjdXJyLT5hcmNoLmFzeW5jX2V2ZW50
X21hc2ssIDApOwoKVGhlIHRyYW5zZm9ybWF0aW9uIGp1c3QgYnkgaXRzZWxmIGlzIGNsZWFybHkg
bm90ICJubyBmdW5jdGlvbmFsCmNoYW5nZSI7IGl0IGlzIHRvZ2V0aGVyIHdpdGggdGhlIHByaW9y
IGlmKCksIGJ1dCBpdCB0b29rIG1lIGEKbGl0dGxlIHRvIGNvbnZpbmNlIG15c2VsZi4gSSBkb24n
dCByZWNhbGwgd2h5IFZDUFVfVFJBUF9OT05FIHdhcwp1c2VkIGhlcmUgb3JpZ2luYWxseSAocG9z
c2libHkganVzdCBiZWNhdXNlIG9mIGl0IGJlaW5nIHplcm8pLApidXQgSSB0aGluayB0aGUgbGF0
ZXN0IG5vdyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlClZDUFVfVFJBUF9MQVNUICsgMSBpbnN0
ZWFkLCBhcyAwIG5vdyBoYXMgYW4gYWN0dWFsIG1lYW5pbmcuCgo+IEBAIC01NTcsMTIgKzU0Niwy
MiBAQCBzdHJ1Y3QgYXJjaF92Y3B1Cj4gIAo+ICAgICAgc3RydWN0IHZwbXVfc3RydWN0IHZwbXU7
Cj4gIAo+IC0gICAgc3RydWN0IHsKPiAtICAgICAgICBib29sICAgIHBlbmRpbmc7Cj4gLSAgICAg
ICAgdWludDhfdCBvbGRfbWFzazsKPiAtICAgIH0gYXN5bmNfZXhjZXB0aW9uX3N0YXRlW1ZDUFVf
VFJBUF9MQVNUXTsKPiAtI2RlZmluZSBhc3luY19leGNlcHRpb25fc3RhdGUodCkgYXN5bmNfZXhj
ZXB0aW9uX3N0YXRlWyh0KS0xXQo+IC0gICAgdWludDhfdCBhc3luY19leGNlcHRpb25fbWFzazsK
PiArICAgIHVuaW9uIHsKPiArI2RlZmluZSBWQ1BVX1RSQVBfTk1JICAgICAgICAgIDAKPiArI2Rl
ZmluZSBWQ1BVX1RSQVBfTUNFICAgICAgICAgIDEKPiArI2RlZmluZSBWQ1BVX1RSQVBfTEFTVCAg
ICAgICAgIFZDUFVfVFJBUF9NQ0UKPiArICAgICAgICBzdHJ1Y3Qgewo+ICsgICAgICAgICAgICBi
b29sICAgIHBlbmRpbmc7Cj4gKyAgICAgICAgICAgIHVpbnQ4X3Qgb2xkX21hc2s7Cj4gKyAgICAg
ICAgfSBhc3luY19ldmVudFtWQ1BVX1RSQVBfTEFTVCArIDFdOwo+ICsgICAgICAgIHN0cnVjdCB7
Cj4gKyAgICAgICAgICAgIGJvb2wgICAgbm1pX3BlbmRpbmc7Cj4gKyAgICAgICAgICAgIHVpbnQ4
X3Qgbm1pX29sZF9tYXNrOwo+ICsgICAgICAgICAgICBib29sICAgIG1jZV9wZW5kaW5nOwo+ICsg
ICAgICAgICAgICB1aW50OF90IG1jZV9vbGRfbWFzazsKPiArICAgICAgICB9Owo+ICsgICAgfTsK
CkhvdyBhYm91dAoKICAgIHVuaW9uIHsKI2RlZmluZSBWQ1BVX1RSQVBfTk1JICAgICAgICAgIDAK
I2RlZmluZSBWQ1BVX1RSQVBfTUNFICAgICAgICAgIDEKI2RlZmluZSBWQ1BVX1RSQVBfTEFTVCAg
ICAgICAgIFZDUFVfVFJBUF9NQ0UKICAgICAgICBzdHJ1Y3QgYXN5bmNfZXZlbnRfc3RhdGUgewog
ICAgICAgICAgICBib29sICAgIHBlbmRpbmc7CiAgICAgICAgICAgIHVpbnQ4X3Qgb2xkX21hc2s7
CiAgICAgICAgfSBhc3luY19ldmVudFtWQ1BVX1RSQVBfTEFTVCArIDFdOwogICAgICAgIHN0cnVj
dCB7CiAgICAgICAgICAgIHN0cnVjdCBhc3luY19ldmVudF9zdGF0ZSBubWk7CiAgICAgICAgICAg
IHN0cnVjdCBhc3luY19ldmVudF9zdGF0ZSBtY2U7CiAgICAgICAgfTsKICAgIH07Cgooc3RydWN0
dXJlIHRhZyBzdWJqZWN0IHRvIGltcHJvdmVtZW50KT8KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
