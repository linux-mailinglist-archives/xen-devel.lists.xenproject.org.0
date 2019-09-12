Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3663B0E54
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 13:55:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8Ne3-00057p-98; Thu, 12 Sep 2019 11:52:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8Ne1-00057h-Qt
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 11:52:13 +0000
X-Inumbo-ID: c1ecf66e-d553-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1ecf66e-d553-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 11:52:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBFE3ADCF;
 Thu, 12 Sep 2019 11:52:11 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
 <443ba725-01b7-9174-3298-66f44ba3f1ec@suse.com>
 <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ea0eb1e-1063-b7ef-8cde-6f47f70e41e0@suse.com>
Date: Thu, 12 Sep 2019 13:52:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190912113542.bxnfmweacwfr3py4@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/9] x86/HVM: move NOFLUSH handling out of
 hvm_set_cr3()
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAxMzozNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBT
ZXAgMTEsIDIwMTkgYXQgMDU6MjM6MjBQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFRo
ZSBiaXQgaXMgbWVhbmluZ2Z1bCBvbmx5IGZvciBNT1YtdG8tQ1IzIGluc25zLCBub3QgYW55d2hl
cmUgZWxzZSwgaW4KPj4gcGFydGljdWxhciBub3Qgd2hlbiBsb2FkaW5nIG5lc3RlZCBndWVzdCBz
dGF0ZS4KPiAKPiBDYW4ndCB5b3UgdXNlIHRoZSBjdXJyZW50IHZjcHUgdG8gY2hlY2sgaWYgdGhl
IGd1ZXN0IGlzIGluIG5lc3RlZAo+IG1vZGUsIGFuZCBhdm9pZCBoYXZpbmcgdG8gZXhwbGljaXRs
eSBwYXNzIHRoZSBub2ZsdXNoIHBhcmFtZXRlcj8KCkV2ZW4gaWYgdGhpcyBpbXBsaWNhdGlvbiBo
ZWxkIHRvZGF5IChpdCBkb2Vzbid0IGFjY29yZGluZyB0bwp0aGUgdXNlcyBpbiBodm1lbXVsX3dy
aXRlX2NyKCkgYW5kIGh2bV9tb3ZfdG9fY3IoKSksIEkgZG9uJ3QKdGhpbmsgaW50cm9kdWNpbmcg
c3VjaCBhIGRlcGVuZGVuY3kgd291bGQgYmUgYSBnb29kIGlkZWEuCgo+PiBAQCAtMjI4MiwxMiAr
MjI4NywxMSBAQCBpbnQgaHZtX3NldF9jcjAodW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vCj4+ICAg
ICAgcmV0dXJuIFg4NkVNVUxfT0tBWTsKPj4gIH0KPj4gIAo+PiAtaW50IGh2bV9zZXRfY3IzKHVu
c2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbWF5X2RlZmVyKQo+PiAraW50IGh2bV9zZXRfY3IzKHVu
c2lnbmVkIGxvbmcgdmFsdWUsIGJvb2wgbm9mbHVzaCwgYm9vbCBtYXlfZGVmZXIpCj4gCj4gSSB3
b3VsZCByYXRoZXIgaW50cm9kdWNlIGEgZmx1c2ggcGFyYW1ldGVyIGluc3RlYWQsIEkgdGhpbmsg
bmVnYXRlZAo+IGJvb2xlYW5zIGFyZSBoYXJkZXIgdG8gcGFyc2UgbWVudGFsbHksIGFuZCBlYXNp
ZXIgdG8gZ2V0IHdyb25nLgoKSSBkaWQgYWN0dWFsbHkgY29uc2lkZXIgdGhpcywgYnV0IGRlY2lk
ZWQgYWdhaW5zdCBmb3IgdGhlCnJlYXNvbiBvZiB0aGlzICJubyBmbHVzaCIgYmVoYXZpb3IgYmVp
bmcgYSBsYXRlciBhZGRpdGlvbiB0bwp0aGUgZWZmZWN0cyBDUjMgd3JpdGVzIGhhdmUsIGkuZS4g
SSdkIGludGVudGlvbmFsbHkgbGlrZSBpdAp0byBiZSBpbiBsaW5lIHdpdGggWDg2X0NSM19OT0ZM
VVNILgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
