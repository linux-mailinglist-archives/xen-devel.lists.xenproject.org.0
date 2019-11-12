Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C95FF99CC
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 20:34:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUbsh-00076v-9z; Tue, 12 Nov 2019 19:31:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hK7o=ZE=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1iUbsf-00076q-Qx
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 19:31:14 +0000
X-Inumbo-ID: fb9ecf72-0582-11ea-984a-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fb9ecf72-0582-11ea-984a-bc764e2007e4;
 Tue, 12 Nov 2019 19:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2iY/ZUNI8Thu/ITXULbE52FtDFbjWq+I/15+/3g06Gg=; b=MgSmnnjJtolE5r0B6BsJHDRCRx
 uK0HP1ISVf4H3T/pSf+qFoDwu+oFA0b6Ln7WzIuY5n/Md1QN8vscWpXef2H4mCfMsvbCs/RNmt9uo
 9l39SaLYJEDqJq4dK9MRTdZ39GbxWB7XvM8eAPhRNRwOei9u/Mh7I5EBZwHR+6R01I7M=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:49068
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iUbtT-0003Q3-Vl; Tue, 12 Nov 2019 20:32:04 +0100
To: Jan Beulich <jbeulich@suse.com>
References: <03d0387a-fe11-866e-81dc-f4055374b0cd@eikelenboom.it>
 <55c0bc58-32bb-79da-b75f-a20946dac94f@suse.com>
 <55f3c0e3-7da7-f1ad-37cd-e5febdda4b09@eikelenboom.it>
 <1a8ea591-1ad9-514d-00ca-bd153f540d28@suse.com>
 <1df09247-dcb6-3587-7d86-978b08bbf77d@eikelenboom.it>
 <314a686c-55cb-e236-ee08-9b1f4d3c9878@suse.com>
 <3e3d1ec4-5de3-60d1-0d3d-d1fb44ee33ee@eikelenboom.it>
 <f2e55380-767e-a8e9-8dff-6b198243f0f5@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <4382cbd4-97ba-22cd-1c7e-c36f50be6633@eikelenboom.it>
Date: Tue, 12 Nov 2019 20:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f2e55380-767e-a8e9-8dff-6b198243f0f5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen-unstable: AMD-Vi: update_paging_mode Try to
 access pdev_list without aquiring pcidevs_lock.
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
 Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMTEvMjAxOSAxMjowNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTEuMTEuMjAxOSAy
MjozOCwgU2FuZGVyIEVpa2VsZW5ib29tIHdyb3RlOgo+PiBXaGVuIHN1cHBseWluZyAicGNpPW5v
bXNpIiB0byB0aGUgZ3Vlc3Qga2VybmVsLCB0aGUgZGV2aWNlIHdvcmtzIGZpbmUsCj4+IGFuZCBJ
IGRvbid0IGdldCB0aGUgIklOVkFMSURfREVWX1JFUVVFU1QiLgo+Pgo+PiBBZnRlciByZXZlcnRp
bmcgMWIwMGMxNmJkZiwgdGhlIGRldmljZSB3b3JrcyBmaW5lIAo+PiBhbmQgSSBkb24ndCBnZXQg
dGhlIElOVkFMSURfREVWX1JFUVVFU1QsIAo+IAo+IENvdWxkIHlvdSBnaXZlIHRoZSBwYXRjaCBi
ZWxvdyBhIHRyeT8gVGhhdCBjb21taXQgdG9vayBjYXJlIG9mIG9ubHkKPiBzZWN1cmluZyBvdXJz
ZWx2ZXMsIGJ1dCBub3Qgb2YgcmVsYXhpbmcgdGhpbmdzIGFnYWluIHdoZW4gYSBkZXZpY2UKPiBn
ZXRzIGhhbmRlZCB0byBhIGd1ZXN0IGZvciBhY3R1YWwgdXNlLgo+IAo+IEphbgoKSGkgSmFuLAoK
Q0MnZWQgSnVlcmdlbiwgYXMgaGUgc2VlbXMgdG8gYmUgZHJvcHBlZCBvZmYgdGhlIENDLWxpc3Qg
YXQgc29tZSB0aW1lLgoKSnVzdCB0ZXN0ZWQgdGhpcyBwYXRjaDogCnRoZSBkZXZpY2Ugd29ya3Mg
ZmluZSBhbmQgSSBkb24ndCBnZXQgdGhlIElOVkFMSURfREVWX1JFUVVFU1QuCgpUaGlzIHdhcyB0
aGUgbGFzdCByZW1haW5pbmcgaXNzdWUgYXJvdW5kIHBjaSBwYXNzdGhyb3VnaCBJIGVuY291bnRl
cmVkLCAKd2l0aCBhbGwgcGF0Y2hlcyBhcHBsaWVkICh5b3VycyBhbmQgQW50aG9ueSdzKSBwY2kg
cGFzc3Rocm91Z2ggZm9yIG1lIApzZWVtcyB0byB3b3JrIGFnYWluIGFzIEkgd2FzIHVzZWQgdG8u
CgpUaGFua3MgYWdhaW4gZm9yIGZpeGluZyB0aGUgaXNzdWVzIGFuZCBwcm92aWRpbmcgdGhlIHJp
Z2h0IGVkdWNhdGVkIGd1ZXNzZXMhCgotLQpTYW5kZXIKCgo+IEFNRC9JT01NVTogcmVzdG9yZSBE
VEUgZmllbGRzIGluIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWNlKCkKPiAKPiBDb21taXQg
MWIwMGMxNmJkZiAoIkFNRC9JT01NVTogcHJlLWZpbGwgYWxsIERURXMgcmlnaHQgYWZ0ZXIgdGFi
bGUKPiBhbGxvY2F0aW9uIikgbW92ZWQgb3Vyc2VsdmVzIGludG8gYSBtb3JlIHNlY3VyZSBkZWZh
dWx0IHN0YXRlLCBidXQKPiBkaWRuJ3QgdGFrZSBzdWZmaWNpZW50IGNhcmUgdG8gYWxzbyB1bmRv
IHRoZSBlZmZlY3RzIHdoZW4gaGFuZGluZyBhCj4gcHJldmlvdXNseSBkaXNhYmxlZCBkZXZpY2Ug
YmFjayB0byBhKG5vdGhlcikgZG9tYWluLiBQdXQgdGhlIGZpZWxkcwo+IHRoYXQgbWF5IGhhdmUg
YmVlbiBjaGFuZ2VkIGVsc2V3aGVyZSBiYWNrIHRvIHRoZWlyIGludGVuZGVkIHZhbHVlcwo+IChz
b21lIGZpZWxkcyBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2aWNlKCkgdG91Y2hlcyBkb24n
dAo+IGN1cnJlbnRseSBnZXQgd3JpdHRlbiBhbnl3aGVyZSBlbHNlLCBhbmQgaGVuY2UgZG9uJ3Qg
bmVlZCBtb2RpZnlpbmcKPiBoZXJlKS4KPiAKPiBSZXBvcnRlZC1ieTogU2FuZGVyIEVpa2VsZW5i
b29tIDxsaW51eEBlaWtlbGVuYm9vbS5pdD4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gLS0tIHVuc3RhYmxlLm9yaWcveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwo+ICsrKyB1bnN0YWJsZS94ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gQEAgLTExNCwxMSArMTE0LDIxIEBAIHN0
YXRpYyB2b2lkIGFtZF9pb21tdV9zZXR1cF9kb21haW5fZGV2aWMKPiAgCj4gICAgICBpZiAoICFk
dGUtPnYgfHwgIWR0ZS0+dHYgKQo+ICAgICAgewo+ICsgICAgICAgIGNvbnN0IHN0cnVjdCBpdnJz
X21hcHBpbmdzICppdnJzX2RldjsKPiArCj4gICAgICAgICAgLyogYmluZCBEVEUgdG8gZG9tYWlu
IHBhZ2UtdGFibGVzICovCj4gICAgICAgICAgYW1kX2lvbW11X3NldF9yb290X3BhZ2VfdGFibGUo
Cj4gICAgICAgICAgICAgIGR0ZSwgcGFnZV90b19tYWRkcihoZC0+YXJjaC5yb290X3RhYmxlKSwg
ZG9tYWluLT5kb21haW5faWQsCj4gICAgICAgICAgICAgIGhkLT5hcmNoLnBhZ2luZ19tb2RlLCB2
YWxpZCk7Cj4gIAo+ICsgICAgICAgIC8qIFVuZG8gd2hhdCBhbWRfaW9tbXVfZGlzYWJsZV9kb21h
aW5fZGV2aWNlKCkgbWF5IGhhdmUgZG9uZS4gKi8KPiArICAgICAgICBpdnJzX2RldiA9ICZnZXRf
aXZyc19tYXBwaW5ncyhpb21tdS0+c2VnKVtyZXFfaWRdOwo+ICsgICAgICAgIGlmICggZHRlLT5p
dF9yb290ICkKPiArICAgICAgICAgICAgZHRlLT5pbnRfY3RsID0gSU9NTVVfREVWX1RBQkxFX0lO
VF9DT05UUk9MX1RSQU5TTEFURUQ7Cj4gKyAgICAgICAgZHRlLT5pdiA9IGlvbW11X2ludHJlbWFw
Owo+ICsgICAgICAgIGR0ZS0+ZXggPSBpdnJzX2Rldi0+ZHRlX2FsbG93X2V4Y2x1c2lvbjsKPiAr
ICAgICAgICBkdGUtPnN5c19tZ3QgPSBNQVNLX0VYVFIoaXZyc19kZXYtPmRldmljZV9mbGFncywg
QUNQSV9JVkhEX1NZU1RFTV9NR01UKTsKPiArCj4gICAgICAgICAgaWYgKCBwY2lfYXRzX2Rldmlj
ZShpb21tdS0+c2VnLCBidXMsIHBkZXYtPmRldmZuKSAmJgo+ICAgICAgICAgICAgICAgaW9tbXVf
aGFzX2NhcChpb21tdSwgUENJX0NBUF9JT1RMQl9TSElGVCkgKQo+ICAgICAgICAgICAgICBkdGUt
PmkgPSBhdHNfZW5hYmxlZDsKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
