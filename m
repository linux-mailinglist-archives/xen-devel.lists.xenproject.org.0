Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F29CB9002
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 14:52:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBIMA-0007jk-GX; Fri, 20 Sep 2019 12:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IznQ=XP=amazon.de=prvs=15923ebf4=wipawel@srs-us1.protection.inumbo.net>)
 id 1iBIM9-0007jd-Kk
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 12:49:49 +0000
X-Inumbo-ID: 211b35f4-dba5-11e9-968c-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211b35f4-dba5-11e9-968c-12813bfff9fa;
 Fri, 20 Sep 2019 12:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568983788; x=1600519788;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=qPUsLsTKC5kf4JnfIje3KY+Vi3zTMASvZ0jZ5rwuzB8=;
 b=tE/siubOX1j9oItyXBY5Xw9HiyCEzhsMQC57zkLtfEuyVHEEDysDsgQR
 7O99Vp0cCA7wBGTp8bHPZnc4v0PCAfkcSJhFl5OyegbyGiYycZ7+/vq8u
 X/t1jliqGSdTp9wpdkyxaQ5cjpSuutsukjz1tLbqa4vQGMUaqWsMVZdpa E=;
X-IronPort-AV: E=Sophos;i="5.64,528,1559520000"; d="scan'208";a="703372609"
Received: from sea3-co-svc-lb6-vlan3.sea.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.22.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 20 Sep 2019 12:48:00 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id E75BCA2D07; Fri, 20 Sep 2019 12:47:47 +0000 (UTC)
Received: from EX13D05EUB001.ant.amazon.com (10.43.166.87) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 20 Sep 2019 12:47:47 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB001.ant.amazon.com (10.43.166.87) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 20 Sep 2019 12:47:46 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Fri, 20 Sep 2019 12:47:46 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [PATCH v3 07/12] livepatch: Add per-function applied/reverted
 state tracking marker
Thread-Index: AQHVbH5oHL5dkE/zME+4dV10uAi5vaczIgQAgAFoMYA=
Date: Fri, 20 Sep 2019 12:47:46 +0000
Message-ID: <39B1817B-1A9C-4B2B-88CB-7EA05F484B12@amazon.com>
References: <20190916105945.93632-1-wipawel@amazon.de>
 <20190916105945.93632-8-wipawel@amazon.de>
 <23d23d1d-efe7-9525-723e-42f944cfc55d@citrix.com>
In-Reply-To: <23d23d1d-efe7-9525-723e-42f944cfc55d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.196]
Content-ID: <6B94AA8B55A2AF4987E1BEC37E6D3CA9@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 07/12] livepatch: Add per-function
 applied/reverted state tracking marker
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, "Pohlack, 
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMTkuIFNlcCAyMDE5LCBhdCAxNzoxOCwgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIDkvMTYvMTkgMTE6NTkgQU0sIFBhd2VsIFdp
ZWN6b3JraWV3aWN6IHdyb3RlOgo+PiBMaXZlcGF0Y2ggb25seSB0cmFja3MgYW4gZW50aXJlIHBh
eWxvYWQgYXBwbGllZC9yZXZlcnRlZCBzdGF0ZS4gQnV0LAo+PiB3aXRoIGFuIG9wdGlvbiB0byBz
dXBwbHkgdGhlIGFwcGx5X3BheWxvYWQoKSBhbmQvb3IgcmV2ZXJ0X3BheWxvYWQoKQo+PiBmdW5j
dGlvbnMgYXMgb3B0aW9uYWwgaG9va3MsIGl0IGJlY29tZXMgcG9zc2libGUgdG8gaW50ZXJtaXgg
dGhlCj4+IGV4ZWN1dGlvbiBvZiB0aGUgb3JpZ2luYWwgYXBwbHlfcGF5bG9hZCgpL3JldmVydF9w
YXlsb2FkKCkgZnVuY3Rpb25zCj4+IHdpdGggdGhlaXIgZHluYW1pY2FsbHkgc3VwcGxpZWQgY291
bnRlcnBhcnRzLgo+PiBJdCBpcyBpbXBvcnRhbnQgdGhlbiB0byB0cmFjayB0aGUgY3VycmVudCBz
dGF0ZSBvZiBldmVyeSBmdW5jdGlvbgo+PiBiZWluZyBwYXRjaGVkIGFuZCBwcmV2ZW50IHNpdHVh
dGlvbnMgb2YgdW5pbnRlbnRpb25hbCBkb3VibGUtYXBwbHkKPj4gb3IgdW5hcHBsaWVkIHJldmVy
dC4KPj4gVG8gc3VwcG9ydCB0aGF0LCBpdCBpcyBuZWNlc3NhcnkgdG8gZXh0ZW5kIHB1YmxpYyBp
bnRlcmZhY2Ugb2YgdGhlCj4+IGxpdmVwYXRjaC4gVGhlIHN0cnVjdCBsaXZlcGF0Y2hfZnVuYyBn
ZXRzIGFkZGl0aW9uYWwgZmllbGQgaG9sZGluZwo+PiB0aGUgYXBwbGllZC9yZXZlcnRlZCBzdGF0
ZSBtYXJrZXIuCj4+IFRvIHJlZmxlY3QgdGhlIGxpdmVwYXRjaCBwYXlsb2FkIEFCSSBjaGFuZ2Us
IGJ1bXAgdGhlIHZlcnNpb24gZmxhZwo+PiBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJTSU9OIHVwIHRv
IDIuCj4+IFtBbmQgYWxzbyB1cGRhdGUgdGhlIHRvcCBvZiB0aGUgZGVzaWduIGRvY3VtZW50XQo+
IHNuaXA+IEBAIC04MzQsNiArODM5LDggQEAgc3RydWN0IGxpdmVwYXRjaF9mdW5jIHsKPj4gICAg
ICB1aW50MzJfdCBvbGRfc2l6ZTsKPj4gICAgICB1aW50OF90IHZlcnNpb247ICAgICAgICAvKiBN
VVNUIGJlIExJVkVQQVRDSF9QQVlMT0FEX1ZFUlNJT04uICovCj4+ICAgICAgdWludDhfdCBvcGFx
dWVbMzFdOwo+PiArICAgIHVpbnQ4X3QgYXBwbGllZDsKPj4gKyAgICB1aW50OF90IF9wYWRbN107
Cj4+ICB9Owo+PiAgdHlwZWRlZiBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMgbGl2ZXBhdGNoX2Z1bmNf
dDsKPj4gICNlbmRpZgo+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5o
IGIveGVuL2luY2x1ZGUveGVuL2xpdmVwYXRjaC5oCj4+IGluZGV4IDJhZWM1MzJlZTIuLjI4Zjk1
MzY3NzYgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9saXZlcGF0Y2guaAo+PiArKysg
Yi94ZW4vaW5jbHVkZS94ZW4vbGl2ZXBhdGNoLmgKPj4gQEAgLTEwOSw2ICsxMDksMzEgQEAgc3Rh
dGljIGlubGluZSBpbnQgbGl2ZXBhdGNoX3ZlcmlmeV9kaXN0YW5jZShjb25zdCBzdHJ1Y3QgbGl2
ZXBhdGNoX2Z1bmMgKmZ1bmMpCj4+ICAgICAgICByZXR1cm4gMDsKPj4gIH0KPj4gKwo+PiArc3Rh
dGljIGlubGluZSBib29sX3QgaXNfZnVuY19hcHBsaWVkKGNvbnN0IHN0cnVjdCBsaXZlcGF0Y2hf
ZnVuYyAqZnVuYykKPiAKPiBVc2UgYm9vbCByYXRoZXIgdGhhbiBib29sX3QgKHRocm91Z2hvdXQg
dGhlIHBhdGNoKS4KPiAKCkFDSy4KCj4+ICt7Cj4+ICsgICAgaWYgKCBmdW5jLT5hcHBsaWVkID09
IExJVkVQQVRDSF9GVU5DX0FQUExJRUQgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcHJpbnRrKFhF
TkxPR19XQVJOSU5HIExJVkVQQVRDSCAiJXM6ICVzIGhhcyBiZWVuIGFscmVhZHkgYXBwbGllZCBi
ZWZvcmVcbiIsCj4+ICsgICAgICAgICAgICAgICAgX19mdW5jX18sIGZ1bmMtPm5hbWUpOwo+IAo+
IEhvdyBhYm91dCBkcm9wcGluZyB0aGlzIGZ1bmN0aW9uIGFuZCBoYXZpbmcgYSB3cmFwcGVyIGZ1
bmN0aW9uIGxpa2UgdGhpczoKPiAKPiBjb21tb25fbGl2ZXBhdGNoX2FwcGx5KCkgewo+ICAgIGlm
IChmdW5jLT5hcHBsaWVkID09IExJVkVQQVRDSF9GVU5DX0FQUExJRUQpIHsKPiAgICAgICAgV0FS
TiguLi4pCj4gICAgICAgIHJldHVybgo+ICAgIH0KPiAKPiAgICBhcmNoX2xpdmVwYXRjaF9hcHBs
eSgpCj4gCj4gICAgZnVuYy0+YXBwbGllZCA9IExJVkVQQVRDSF9GVU5DX0FQUExJRUQKPiB9Cj4g
Cj4gVGhpcyBjb3VsZCBiZSB1c2VkIGJ5IHRoZSBub3JtYWwgYXBwbHkgY29kZSBhbmQgYW55IGFw
cGx5IGhvb2tzLgo+IAo+IFRoaXMgYXZvaWRzIGhhdmluZyBkdXBsaWNhdGUgY29kZSBpbiBlYWNo
IG9mIHRoZSBhcmNoaXRlY3R1cmVzIHRoYXQgaXMgbm90IGFyY2ggc3BlY2lmaWMgYW5kIGFsc28g
YXZvaWRzIGhhdmluZyBhIHN0YXRlIHF1ZXJ5aW5nIGZ1bmN0aW9uIGVtaXQgYSB3YXJuaW5nIHdo
aWNoIHNlZW1zIG9kZCB0byBtZS4KPiAKClllcy4gVGhhdCBtYWtlcyBhIGxvdCBvZiBzZW5zZS4g
TGV0IG1lIGRvIHRoYXQuCgpUaGFua3MuCgo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsKPj4gKyAg
ICB9Cj4+ICsKPj4gKyAgICByZXR1cm4gZmFsc2U7Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbmxp
bmUgYm9vbF90IGlzX2Z1bmNfcmV2ZXJ0ZWQoY29uc3Qgc3RydWN0IGxpdmVwYXRjaF9mdW5jICpm
dW5jKQo+PiArewo+PiArICAgIGlmICggIWZ1bmMtPm9sZF9hZGRyIHx8IGZ1bmMtPmFwcGxpZWQg
PT0gTElWRVBBVENIX0ZVTkNfTk9UX0FQUExJRUQgKQo+PiArICAgIHsKPj4gKyAgICAgICAgcHJp
bnRrKFhFTkxPR19XQVJOSU5HIExJVkVQQVRDSCAiJXM6ICVzIGhhcyBub3QgYmVlbiBhcHBsaWVk
IGJlZm9yZVxuIiwKPj4gKyAgICAgICAgICAgICAgICBfX2Z1bmNfXywgZnVuYy0+bmFtZSk7Cj4+
ICsgICAgICAgIHJldHVybiB0cnVlOwo+PiArICAgIH0KPj4gKwo+PiArICAgIHJldHVybiBmYWxz
ZTsKPj4gK30KPj4gKwo+PiAgLyoKPj4gICAqIFRoZXNlIGZ1bmN0aW9ucyBhcmUgY2FsbGVkIGFy
b3VuZCB0aGUgY3JpdGljYWwgcmVnaW9uIHBhdGNoaW5nIGxpdmUgY29kZSwKPj4gICAqIGZvciBh
biBhcmNoaXRlY3R1cmUgdG8gdGFrZSBtYWtlIGFwcHJvcHJhdGllIGdsb2JhbCBzdGF0ZSBhZGp1
c3RtZW50cy4KPj4gQEAgLTExNyw3ICsxNDIsNyBAQCBpbnQgYXJjaF9saXZlcGF0Y2hfcXVpZXNj
ZSh2b2lkKTsKPj4gIHZvaWQgYXJjaF9saXZlcGF0Y2hfcmV2aXZlKHZvaWQpOwo+PiAgCj4gLS0g
Cj4gUm9zcyBMYWdlcndhbGwKCkJlc3QgUmVnYXJkcywKUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoK
CgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgK
MTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFs
ZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRl
ciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
