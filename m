Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA03CF500
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 10:28:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHkoH-0002jk-Bk; Tue, 08 Oct 2019 08:25:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=aTbt=YB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iHkoF-0002jf-Rb
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 08:25:31 +0000
X-Inumbo-ID: 3068b7d0-e9a5-11e9-96dc-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3068b7d0-e9a5-11e9-96dc-bc764e2007e4;
 Tue, 08 Oct 2019 08:25:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A02E7AE09;
 Tue,  8 Oct 2019 08:25:29 +0000 (UTC)
To: Paul Durrant <paul@xen.org>
References: <20191001151159.861-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <597ea92f-fa61-b47b-448a-1e6f4aebe994@suse.com>
Date: Tue, 8 Oct 2019 10:25:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191001151159.861-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13 v2] x86/mm: don't needlessly veto
 migration
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMjAxOSAxNzoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9tbS9wYWdpbmcuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcuYwo+IEBAIC0y
MDksMTUgKzIwOSwxNSBAQCBzdGF0aWMgaW50IHBhZ2luZ19mcmVlX2xvZ19kaXJ0eV9iaXRtYXAo
c3RydWN0IGRvbWFpbiAqZCwgaW50IHJjKQo+ICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gIAo+IC1p
bnQgcGFnaW5nX2xvZ19kaXJ0eV9lbmFibGUoc3RydWN0IGRvbWFpbiAqZCwgYm9vbF90IGxvZ19n
bG9iYWwpCj4gK2ludCBwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZShzdHJ1Y3QgZG9tYWluICpkLCBi
b29sIGxvZ19nbG9iYWwpCj4gIHsKPiAgICAgIGludCByZXQ7Cj4gIAo+IC0gICAgaWYgKCBpc19p
b21tdV9lbmFibGVkKGQpICYmIGxvZ19nbG9iYWwgKQo+ICsgICAgaWYgKCBoYXNfYXJjaF9wZGV2
cyhkKSAmJiBpb21tdV91c2VfaGFwX3B0KGQpICYmIGxvZ19nbG9iYWwgKQoKVG8gdW5ibG9jayBh
IHB1c2ggdG8gbWFzdGVyLCB0aGUgaXNfaW9tbXVfZW5hYmxlZCgpIC0+IGhhc19hcmNoX3BkZXZz
KCkKdHJhbnNmb3JtYXRpb24gaGVyZSBpcyBuZWVkZWQgYWZhaWN0LiBTaW5jZSB0aGUgb3RoZXIg
aGFsZiBvZiB0aGUKY2hhbmdlIGhlcmUgKGFuZCBhIGNvcnJlc3BvbmRpbmcgY2hhbmdlIHRvIGFz
c2lnbl9kZXZpY2UoKSkgY29udGludWVzCnRvIGJlIGNvbnRyb3ZlcnNpYWwsIGNvdWxkIHdlIGFn
cmVlIG9uIHNwbGl0dGluZyB0aGlzIHBhdGNoIGludG8gdHdvPwooSSdkIGJlIGZpbmUgZG9pbmcg
dGhlIGxlZ3dvcmsuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
