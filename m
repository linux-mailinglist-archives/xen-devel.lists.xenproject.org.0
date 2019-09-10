Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9DDAEBAF
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:36:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7gIY-0000ho-SB; Tue, 10 Sep 2019 13:35:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6bdU=XF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7gIX-0000hW-IR
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:35:09 +0000
X-Inumbo-ID: ce2d5106-d3cf-11e9-ac1f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce2d5106-d3cf-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 13:35:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8D11AF5B;
 Tue, 10 Sep 2019 13:35:07 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-2-roger.pau@citrix.com>
 <7a37466e-4bb8-2358-f940-42aa5426bdcb@suse.com>
 <20190910133315.i35z5jfmbxwl4kyi@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d26f3f92-7b4d-82a5-121d-d3caec79b56a@suse.com>
Date: Tue, 10 Sep 2019 15:35:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190910133315.i35z5jfmbxwl4kyi@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 01/11] ioreq: fix
 hvm_all_ioreq_servers_add_vcpu fail path cleanup
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDkuMjAxOSAxNTozMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBT
ZXAgMTAsIDIwMTkgYXQgMDM6Mjg6NTdQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDAzLjA5LjIwMTkgMTg6MTQsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5jCj4+
PiBAQCAtMTE5NSw3ICsxMTk1LDcgQEAgaW50IGh2bV9hbGxfaW9yZXFfc2VydmVyc19hZGRfdmNw
dShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAgcmV0dXJuIDA7Cj4+
PiAgCj4+PiAgIGZhaWw6Cj4+PiAtICAgIHdoaWxlICggaWQtLSAhPSAwICkKPj4+ICsgICAgd2hp
bGUgKCBpZCsrICE9IE1BWF9OUl9JT1JFUV9TRVJWRVJTICkKPj4+ICAgICAgewo+Pj4gICAgICAg
ICAgcyA9IEdFVF9JT1JFUV9TRVJWRVIoZCwgaWQpOwo+Pgo+PiBXaXRoIFBhdWwncyBSLWIgSSB3
YXMgYWJvdXQgdG8gY29tbWl0IHRoaXMsIGJ1dCBkb2Vzbid0IHRoaXMKPj4gbmVlZCB0byBiZSAr
K2lkPyAoSWYgc28sIEknbGwgYmUgaGFwcHkgdG8gZml4IHdoaWxlIGNvbW1pdHRpbmcuKQo+IAo+
IFRoZSBpbmNyZW1lbnQgaXMgYWxyZWFkeSBkb25lIGluIHRoZSBsb29wIGNvbmRpdGlvbi4KClRo
YXQncyB0aGUgaW5jcmVtZW50IEkgbWVhbi4gSSdtIHNvcnJ5IGZvciB0aGUgYW1iaWd1aXR5OyBJ
CmRpZG4ndCB3YW50IHRvIGN1dCB0b28gbXVjaCBvZiB0aGUgY29udGV4dC4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
