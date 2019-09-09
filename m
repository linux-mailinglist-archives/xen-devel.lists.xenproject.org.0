Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CBAE065
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 23:51:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7RWe-0003pZ-IL; Mon, 09 Sep 2019 21:48:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4VV/=XE=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1i7RWd-0003pU-Ef
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 21:48:43 +0000
X-Inumbo-ID: 9676de3c-d34b-11e9-a337-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9676de3c-d34b-11e9-a337-bc764e2007e4;
 Mon, 09 Sep 2019 21:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568065723;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=MtqZUegknBgsc7V9oe2SWxhatbu90YiITWhF1QMXFXQ=;
 b=F4DIFI/EDDd5RYgHb8mY4CERBWSpWiHV0kmLuz4WnFGUnuu8xeemaOcp
 YIDsVCZLGq5G0TyqBGa7ebTgoRizQWzDBVPhOvLGbWM/u+VfvzevLm+8p
 BrsRl3AwSf7wJCo3T+VrzVtmL7zq6v7Zhpb2i+N8uRk9q0buvGYUr+7Qp k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: hCi2gIgXCpOpzBw/5gQOHY8H5elKkQJt9aNlcE1NFqFo0yPRohSWIGMRxTs0CjTDo5YTJqiyFG
 fcBPotXRNk1rKG19cBsTmSUHUnMEDEHqgidlwyLuWBEDhq+OuqSeMlWtSehk032wQBIRjYTrip
 W5DSJDoTmhfi9f2U8/FI2WEzbl7yZ79GCST1SOY8/Ztw0KGg1q0VymaIA2tfcHShwTogFgolRP
 A6jg/uiT+vgu/xatzJ0Otyf8gvOgW7LMhSPpf46TGpWPsYTY7xHBqVZ1SbI++I9bx2WJucfliJ
 MBo=
X-SBRS: 2.7
X-MesageID: 5348248
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,487,1559534400"; 
   d="scan'208";a="5348248"
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
References: <1567556431-9809-1-git-send-email-igor.druzhinin@citrix.com>
 <5054ad91-5b87-652c-873a-b31758948bd7@oracle.com>
 <e3114d56-51cd-b973-1ada-f6a60a7e99cc@citrix.com>
 <43b7da04-5c42-80d8-898b-470ee1c91ed2@oracle.com>
 <adefac87-c2b3-b67f-fb4d-d763ce920bef@citrix.com>
 <1695c88d-e5ad-1854-cdef-3cd95c812574@oracle.com>
 <4d3bf854-51de-99e4-9a40-a64c581bdd10@citrix.com>
 <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <c45b8786-5735-a95d-bc40-61372c326037@citrix.com>
Date: Mon, 9 Sep 2019 22:48:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bc3da154-d451-02cf-6154-5e0dc721a6e6@oracle.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pci: try to reserve MCFG areas earlier
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
Cc: jgross@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDkvMjAxOSAyMDoxOSwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+IE9uIDkvOC8xOSA3
OjM3IFBNLCBJZ29yIERydXpoaW5pbiB3cm90ZToKPj4gT24gMDkvMDkvMjAxOSAwMDozMCwgQm9y
aXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4gT24gOS84LzE5IDU6MTEgUE0sIElnb3IgRHJ1emhpbmlu
IHdyb3RlOgo+Pj4+IE9uIDA4LzA5LzIwMTkgMTk6MjgsIEJvcmlzIE9zdHJvdnNreSB3cm90ZToK
Pj4+Pj4gT24gOS82LzE5IDc6MDAgUE0sIElnb3IgRHJ1emhpbmluIHdyb3RlOgo+Pj4+Pj4gT24g
MDYvMDkvMjAxOSAyMzozMCwgQm9yaXMgT3N0cm92c2t5IHdyb3RlOgo+Pj4+Pj4+IFdoZXJlIGlz
IE1DRkcgcGFyc2VkPyBwY2lfYXJjaF9pbml0KCk/Cj4+Pj4+Pj4+IEl0IGhhcHBlbnMgdHdpY2U6
Cj4+Pj4+PiAxKSBmaXJzdCB0aW1lIGVhcmx5IG9uZSBpbiBwY2lfYXJjaF9pbml0KCkgdGhhdCBp
cyBhcmNoX2luaXRjYWxsIC0gdGhhdAo+Pj4+Pj4gdGltZSBwY2lfbW1jZmdfbGlzdCB3aWxsIGJl
IGZyZWVkIGltbWVkaWF0ZWx5IHRoZXJlIGJlY2F1c2UgTUNGRyBhcmVhIGlzCj4+Pj4+PiBub3Qg
cmVzZXJ2ZWQgaW4gRTgyMDsKPj4+Pj4+IDIpIHNlY29uZCB0aW1lIGxhdGUgb25lIGluIGFjcGlf
aW5pdCgpIHdoaWNoIGlzIHN1YnN5c3RlbV9pbml0Y2FsbCByaWdodAo+Pj4+Pj4gYmVmb3JlIHdo
ZXJlIFBDSSBlbnVtZXJhdGlvbiBzdGFydHMgLSB0aGlzIHRpbWUgQUNQSSB0YWJsZXMgd2lsbCBi
ZQo+Pj4+Pj4gY2hlY2tlZCBmb3IgYSByZXNlcnZlZCByZXNvdXJjZSBhbmQgcGNpX21tY2ZnX2xp
c3Qgd2lsbCBiZSBmaW5hbGx5Cj4+Pj4+PiBwb3B1bGF0ZWQuCj4+Pj4+Pgo+Pj4+Pj4gVGhlIHBy
b2JsZW0gaXMgdGhhdCBvbiBhIHN5c3RlbSB0aGF0IGRvZXNuJ3QgaGF2ZSBNQ0ZHIGFyZWEgcmVz
ZXJ2ZWQgaW4KPj4+Pj4+IEU4MjAgcGNpX21tY2ZnX2xpc3QgaXMgZW1wdHkgYmVmb3JlIGFjcGlf
aW5pdCgpIGFuZCBvdXIgUENJIGhvb2tzIGFyZQo+Pj4+Pj4gY2FsbGVkIGluIHRoZSBzYW1lIHBs
YWNlLiBTbyBNQ0ZHIGlzIHN0aWxsIG5vdCBpbiB1c2UgYnkgWGVuIGF0IHRoaXMKPj4+Pj4+IHBv
aW50IHNpbmNlIHdlIGhhdmVuJ3QgcmVhY2hlZCBvdXIgeGVuX21jZmdfbGF0ZSgpLgo+Pj4+PiBX
b3VsZCBpdCBiZSBwb3NzaWJsZSBmb3IgdXMgdG8gcGFyc2UgTUNGRyBvdXJzZWx2ZXMgaW4gcGNp
X3hlbl9pbml0KCk/IEkKPj4+Pj4gcmVhbGl6ZSB0aGF0IHdlJ2QgYmUgZG9pbmcgdGhpcyB0d2lj
ZSAob3IgbWF5YmUgZXZlbiB0aHJlZSB0aW1lcyBzaW5jZQo+Pj4+PiBhcHBhcmVudGx5IGJvdGgg
cGNpX2FyY2hfaW5pdCgpwqAgYW5kIGFjcGlfaW5pKCkgZG8gaXQpLgo+Pj4+Pgo+Pj4+IEkgZG9u
J3QgdGhpbmUgaXQgbWFrZXMgc2Vuc2U6Cj4+Pj4gYSkgaXQgbmVlZHMgdG8gYmUgZG9uZSBhZnRl
ciBBQ1BJIGlzIGluaXRpYWxpemVkIHNpbmNlIHdlIG5lZWQgdG8gcGFyc2UKPj4+PiBpdCB0byBm
aWd1cmUgb3V0IHRoZSBleGFjdCByZXNlcnZlZCByZWdpb24gLSB0aGF0J3Mgd2h5IGl0J3MgY3Vy
cmVudGx5Cj4+Pj4gZG9uZSBpbiBhY3BpX2luaXQoKSAoc2VlIGNvbW1pdCBtZXNzYWdlIGZvciB0
aGUgcmVhc29ucyB3aHkpCj4+PiBIbW0uLi4gV2Ugc2hvdWxkIGJlIGFibGUgdG8gcGFyc2UgQUNQ
SSB0YWJsZXMgYnkgdGhlIHRpbWUKPj4+IHBjaV9hcmNoX2luaXQoKSBpcyBjYWxsZWQuIEluIGZh
Y3QsIGlmIHlvdSBsb29rIGF0Cj4+PiBwY2lfbW1jZmdfZWFybHlfaW5pdCgpIHlvdSB3aWxsIHNl
ZSB0aGF0IGl0IGRvZXMganVzdCB0aGF0Lgo+Pj4KPj4gVGhlIHBvaW50IGlzIG5vdCB0byBwYXJz
ZSBNQ0ZHIGFmdGVyIGFjcGlfaW5pdCBidXQgdG8gcGFyc2UgRFNEVCBmb3IKPj4gcmVzZXJ2ZWQg
cmVzb3VyY2Ugd2hpY2ggY291bGQgYmUgZG9uZSBvbmx5IGFmdGVyIEFDUEkgaW5pdGlhbGl6YXRp
b24uCj4gCj4gT0ssIEkgdGhpbmsgSSB1bmRlcnN0YW5kIG5vdyB3aGF0IHlvdSBhcmUgdHJ5aW5n
IHRvIGRvIC0tLSB5b3UgYXJlCj4gZXNzZW50aWFsbHkgdHJ5aW5nIHRvIGFjY291bnQgZm9yIHRo
ZSByYW5nZSBpbnNlcnRlZCBieQo+IHNldHVwX21jZmdfbWFwKCksIHJpZ2h0Pwo+IAoKQWN0dWFs
bHksIHBjaV9tbWNmZ19sYXRlX2luaXQoKSB0aGF0J3MgY2FsbGVkIG91dCBvZiBhY3BpX2luaXQo
KSAtCnRoYXQncyB3aGVyZSBNQ0ZHIGFyZWFzIGFyZSBwcm9wZXJseSBzaXplZC4gc2V0dXBfbWNm
Z19tYXAoKSBpcyBtb3N0bHkKZm9yIGJ1cyBob3RwbHVnIHdoZXJlIE1DRkcgYXJlYSBpcyBkaXNj
b3ZlcmVkIGJ5IGV2YWx1YXRpbmcgX0NCQSBtZXRob2Q7CmZvciBjb2xkLXBsdWdnZWQgYnVzZXMg
aXQganVzdCBjb25maXJtcyB0aGF0IE1DRkcgYXJlYSBpcyBhbHJlYWR5CnJlZ2lzdGVyZWQgYmVj
YXVzZSBpdCBpcyBtYW5kYXRlZCBmb3IgdGhlbSB0byBiZSBpbiBNQ0ZHIHRhYmxlIGF0IGJvb3Qg
dGltZS4KCj4gVGhlIG90aGVyIHF1ZXN0aW9uIEkgaGF2ZSBpcyB3aHkgeW91IHRoaW5rIGl0J3Mg
d29ydGgga2VlcGluZwo+IHhlbl9tY2ZnX2xhdGUoKSBhcyBhIGxhdGUgaW5pdGNhbGwuIEhvdyBj
b3VsZCBNQ0ZHIGluZm8gYmUgdXBkYXRlZAo+IGJldHdlZW4gYWNwaV9pbml0KCkgYW5kIGxhdGVf
aW5pdGNhbGxzIGJlaW5nIHJ1bj8gSSdkIHRoaW5rIGl0IGNhbiBvbmx5Cj4gaGFwcGVuIHdoZW4g
YSBuZXcgZGV2aWNlIGlzIGhvdHBsdWdnZWQuCj4gCgpJdCB3YXMgYSBwcmVjYXV0aW9uIGFnYWlu
c3Qgc2V0dXBfbWNmZ19tYXAoKSBjYWxscyB0aGF0IG1pZ2h0IGFkZCBuZXcKYXJlYXMgdGhhdCBh
cmUgbm90IGluIE1DRkcgdGFibGUgYnV0IGZvciBzb21lIHJlYXNvbiBoYXZlIF9DQkEgbWV0aG9k
LgpJdCdzIG9idmlvdXNseSBhICJmaXJtd2FyZSBpcyBicm9rZW4iIHNjZW5hcmlvIHNvIEkgZG9u
J3QgaGF2ZSBzdHJvbmcKZmVlbGluZ3MgdG8ga2VlcCBpdCBoZXJlLiBXaWxsIHByZWZlciB0byBy
ZW1vdmUgaW4gdjIgaWYgeW91IHdhbnQuCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
