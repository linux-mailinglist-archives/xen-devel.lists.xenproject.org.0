Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5223E108EBD
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 14:22:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZEHO-00030B-Or; Mon, 25 Nov 2019 13:19:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yJnJ=ZR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZEHM-000306-WF
 for xen-devel@lists.xen.org; Mon, 25 Nov 2019 13:19:49 +0000
X-Inumbo-ID: 3f53736e-0f86-11ea-b08b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3f53736e-0f86-11ea-b08b-bc764e2007e4;
 Mon, 25 Nov 2019 13:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 94817B174;
 Mon, 25 Nov 2019 13:19:44 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191122164723.1302-1-sergey.dyasli@citrix.com>
 <20191125022219.GA4712@gao-cwp>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fa7cc02b-8137-e837-4f50-8d50fa357b41@suse.com>
Date: Mon, 25 Nov 2019 14:19:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191125022219.GA4712@gao-cwp>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xen.org, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAwMzoyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gT24gRnJpLCBOb3YgMjIsIDIw
MTkgYXQgMDQ6NDc6MjNQTSArMDAwMCwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPj4gQ3VycmVudGx5
IGlmIGEgdXNlciB0cmllcyB0byBsaXZlLWxvYWQgdGhlIHNhbWUgb3Igb2xkZXIgdWNvZGUgcmV2
aXNpb24KPj4gdGhhbiBDUFUgYWxyZWFkeSBoYXMsIGhlIHdpbGwgZ2V0IGEgc2luZ2xlIG1lc3Nh
Z2UgaW4gWGVuIGxvZyBsaWtlOgo+Pgo+PiAgICAoWEVOKSAxMjggY29yZXMgYXJlIHRvIHVwZGF0
ZSB0aGVpciBtaWNyb2NvZGUKPj4KPj4gTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBw
ZW4gYW5kIHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQo+PiBjb25mdXNpbmcuIEZpeCB0aGlz
IGJ5IHN0YXJ0aW5nIHVjb2RlIHVwZGF0ZSBvbmx5IHdoZW4gdGhlIHByb3ZpZGVkCj4+IHVjb2Rl
IHJldmlzaW9uIGlzIGhpZ2hlciB0aGFuIHRoZSBjdXJyZW50bHkgY2FjaGVkIG9uZSAoaWYgYW55
KS4KPj4gVGhpcyBpcyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVfY2Fj
aGUgZXhpc3RzLCBhbGwgQ1BVcwo+PiBpbiB0aGUgc3lzdGVtIHNob3VsZCBoYXZlIGF0IGxlYXN0
IHRoYXQgdWNvZGUgcmV2aXNpb24uCj4+Cj4+IEFkZGl0aW9uYWxseSwgcHJpbnQgYSB1c2VyIGZy
aWVuZGx5IG1lc3NhZ2UgaWYgbm8gbmV3ZXIgdWNvZGUgY2FuIGJlCj4+IGZvdW5kIGluIHRoZSBw
cm92aWRlZCBibG9iLiBUaGlzIGFsc28gcmVxdWlyZXMgaWdub3JpbmcgLUVOT0RBVEEgaW4KPj4g
QU1ELXNpZGUgY29kZSwgb3RoZXJ3aXNlIHRoZSBtZXNzYWdlIGdpdmVuIHRvIHRoZSB1c2VyIGlz
Ogo+Pgo+PiAgICAoWEVOKSBQYXJzaW5nIG1pY3JvY29kZSBibG9iIGVycm9yIC02MQo+Pgo+PiBX
aGljaCBhY3R1YWxseSBtZWFucyB0aGF0IGEgdWNvZGUgYmxvYiB3YXMgcGFyc2VkIGZpbmUsIGJ1
dCBubyBtYXRjaGluZwo+PiB1Y29kZSB3YXMgZm91bmQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFNl
cmdleSBEeWFzbGkgPHNlcmdleS5keWFzbGlAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
Q2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAKPiBJIHdvbmRlciB3aGV0aGVyIGl0IGlz
IGJldHRlciB0byBwdXQgdGhlIGNvbXBhcmlzb24gLi4uCj4gCj4+IEBAIC02NDEsNiArNjQ3LDgg
QEAgaW50IG1pY3JvY29kZV91cGRhdGUoWEVOX0dVRVNUX0hBTkRMRV9QQVJBTShjb25zdF92b2lk
KSBidWYsIHVuc2lnbmVkIGxvbmcgbGVuKQo+PiAgICAgaWYgKCAhcGF0Y2ggKQo+PiAgICAgewo+
PiAgICAgICAgIHJldCA9IC1FTk9FTlQ7Cj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklO
RyAibWljcm9jb2RlOiBjb3VsZG4ndCBmaW5kIGFueSBuZXdlciByZXZpc2lvbiBpbiAiCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAidGhlIHByb3ZpZGVkIGJsb2IhXG4iKTsKPj4g
ICAgICAgICBnb3RvIHB1dDsKPj4gICAgIH0KPiAKPiAuLi4gYWZ0ZXIgdGhpcyBpZigpLiBUaGVu
IHlvdSBuZWVkbid0IG1vZGlmeSBhbnkgdmVuZG9yLXNwZWNpZmljIGNvZGUuCgpZZWFoLCB0aGlz
IHdvdWxkIHNlZW0gdG8gYWxsb3cgcmVkdWNpbmcgY29kZSBjaHVybiBieSBxdWl0ZSBhIGJpdC4K
CkFsc28gSSB0aGluayB0aGUgQU1EIHNpZGUgLUVOT0RBVEEgaWdub3Jpbmcgd291bGQgYmV0dGVy
IGdvIGludG8KdGhpcwoKICAgIGlmICggZXJyb3IgKQogICAgewogICAgICAgIHhmcmVlKG1jX2Ft
ZC0+ZXF1aXZfY3B1X3RhYmxlKTsKICAgICAgICB4ZnJlZShtY19hbWQpOwogICAgICAgIGdvdG8g
b3V0OwogICAgfQoKYmxvY2sgaW4gY3B1X3JlcXVlc3RfbWljcm9jb2RlKCksIHRodXMgYWxsb3dp
bmcgcG90ZW50aWFsIGZ1dHVyZQp1bnJlbGF0ZWQgLUVPTkRBVEEgdG8gbm90IGFsc28gZ2V0IGln
bm9yZWQuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
