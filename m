Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B8C18038E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 17:32:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBhlR-0008SE-Cp; Tue, 10 Mar 2020 16:29:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhAh=43=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jBhlP-0008S9-GC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 16:29:51 +0000
X-Inumbo-ID: 5cf30b0a-62ec-11ea-ade6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cf30b0a-62ec-11ea-ade6-12813bfff9fa;
 Tue, 10 Mar 2020 16:29:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47CEAAB92;
 Tue, 10 Mar 2020 16:29:49 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200310072853.27567-1-jgross@suse.com>
 <20200310072853.27567-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <758b6a3a-a08e-4b83-9523-0fcb02f705a7@suse.com>
Date: Tue, 10 Mar 2020 17:29:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310072853.27567-3-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/6] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDMuMjAyMCAwODoyOCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTQzLDUxICsx
NDMsNzUgQEAgc3RhdGljIGludCBxaGltYXJrID0gMTAwMDA7Cj4gIHN0YXRpYyBpbnQgcWxvd21h
cmsgPSAxMDA7Cj4gIHN0YXRpYyBpbnQgcnNpbnRlcnZhbCA9IDEwMDA7Cj4gIAo+IC1zdHJ1Y3Qg
cmN1X2JhcnJpZXJfZGF0YSB7Cj4gLSAgICBzdHJ1Y3QgcmN1X2hlYWQgaGVhZDsKPiAtICAgIGF0
b21pY190ICpjcHVfY291bnQ7Cj4gLX07Cj4gKy8qCj4gKyAqIHJjdV9iYXJyaWVyKCkgaGFuZGxp
bmc6Cj4gKyAqIGNwdV9jb3VudCBob2xkcyB0aGUgbnVtYmVyIG9mIGNwdSByZXF1aXJlZCB0byBm
aW5pc2ggYmFycmllciBoYW5kbGluZy4KPiArICogQ3B1cyBhcmUgc3luY2hyb25pemVkIHZpYSBz
b2Z0aXJxIG1lY2hhbmlzbS4gcmN1X2JhcnJpZXIoKSBpcyByZWdhcmRlZCB0bwo+ICsgKiBiZSBh
Y3RpdmUgaWYgY3B1X2NvdW50IGlzIG5vdCB6ZXJvLiBJbiBjYXNlIHJjdV9iYXJyaWVyKCkgaXMg
Y2FsbGVkIG9uCj4gKyAqIG11bHRpcGxlIGNwdXMgaXQgaXMgZW5vdWdoIHRvIGNoZWNrIGZvciBj
cHVfY291bnQgYmVpbmcgbm90IHplcm8gb24gZW50cnkKPiArICogYW5kIHRvIGNhbGwgcHJvY2Vz
c19wZW5kaW5nX3NvZnRpcnFzKCkgaW4gYSBsb29wIHVudGlsIGNwdV9jb3VudCBkcm9wcyB0bwo+
ICsgKiB6ZXJvLCBhcyBzeW5jaW5nIGhhcyBiZWVuIHJlcXVlc3RlZCBhbHJlYWR5IGFuZCB3ZSBk
b24ndCBuZWVkIHRvIHN5bmMKPiArICogbXVsdGlwbGUgdGltZXMuCj4gKyAqIEluIG9yZGVyIHRv
IGF2b2lkIGhhbmdzIHdoZW4gcmN1X2JhcnJpZXIoKSBpcyBjYWxsZWQgbXV0aXBsZSB0aW1lcyBv
biB0aGUKPiArICogc2FtZSBjcHUgaW4gZmFzdCBzZXF1ZW5jZSBhbmQgYSBzbGF2ZSBjcHUgY291
bGRuJ3QgZHJvcCBvdXQgb2YgdGhlCj4gKyAqIGJhcnJpZXIgaGFuZGxpbmcgZmFzdCBlbm91Z2gg
YSBzZWNvbmQgY291bnRlciBkb25lX2NvdW50IGlzIG5lZWRlZC4KPiArICovCj4gK3N0YXRpYyBh
dG9taWNfdCBjcHVfY291bnQgPSBBVE9NSUNfSU5JVCgwKTsKPiArc3RhdGljIGF0b21pY190IGRv
bmVfY291bnQgPSBBVE9NSUNfSU5JVCgwKTsKCkZyb20gaXRzIHVzZSBiZWxvdyB0aGlzIGxvb2tz
IG1vcmUgbGlrZSAidG9kb19jb3VudCIgb3IKInBlbmRpbmdfY291bnQiLgoKPiArdm9pZCByY3Vf
YmFycmllcih2b2lkKQo+ICB7Cj4gLSAgICBhdG9taWNfdCBjcHVfY291bnQgPSBBVE9NSUNfSU5J
VCgwKTsKPiAtICAgIHJldHVybiBzdG9wX21hY2hpbmVfcnVuKHJjdV9iYXJyaWVyX2FjdGlvbiwg
JmNwdV9jb3VudCwgTlJfQ1BVUyk7Cj4gKyAgICB1bnNpZ25lZCBpbnQgbl9jcHVzOwo+ICsKPiAr
ICAgIHdoaWxlICggIWdldF9jcHVfbWFwcygpICkKPiArICAgIHsKPiArICAgICAgICBwcm9jZXNz
X3BlbmRpbmdfc29mdGlycXMoKTsKPiArICAgICAgICBpZiAoICFhdG9taWNfcmVhZCgmY3B1X2Nv
dW50KSApCj4gKyAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICAgY3B1X3JlbGF4KCk7
Cj4gKyAgICB9Cj4gKwo+ICsgICAgbl9jcHVzID0gbnVtX29ubGluZV9jcHVzKCk7Cj4gKwo+ICsg
ICAgaWYgKCBhdG9taWNfY21weGNoZygmY3B1X2NvdW50LCAwLCBuX2NwdXMpID09IDAgKQo+ICsg
ICAgewo+ICsgICAgICAgIGF0b21pY19hZGQobl9jcHVzLCAmZG9uZV9jb3VudCk7Cj4gKyAgICAg
ICAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKCZjcHVfb25saW5lX21hcCwgUkNVX1NPRlRJUlEpOwo+
ICsgICAgfQo+ICsKPiArICAgIHdoaWxlICggYXRvbWljX3JlYWQoJmRvbmVfY291bnQpICkKCkRv
bid0IHlvdSBsZWF2ZSBhIHdpbmRvdyBmb3IgcmFjZXMgaGVyZSwgaW4gdGhhdCBkb25lX2NvdW50
CmdldHMgc2V0IHRvIG5vbi16ZXJvIG9ubHkgYWZ0ZXIgc2V0dGluZyBjcHVfY291bnQ/IEEgQ1BV
Cmxvc2luZyB0aGUgY21weGNoZyBhdHRlbXB0IGFib3ZlIG1heSBvYnNlcnZlIGRvbmVfY291bnQK
c3RpbGwgYmVpbmcgemVybywgYW5kIGhlbmNlIGV4aXQgd2l0aG91dCB3YWl0aW5nIGZvciB0aGUK
Y291bnQgdG8gYWN0dWFsbHkgX2Ryb3BfIHRvIHplcm8uCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
