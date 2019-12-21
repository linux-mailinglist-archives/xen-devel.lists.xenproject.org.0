Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5A0128903
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2019 13:12:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iidXP-0006vr-L0; Sat, 21 Dec 2019 12:07:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hm2O=2L=amazon.com=prvs=251716dec=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iidXO-0006vm-5K
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2019 12:07:14 +0000
X-Inumbo-ID: 678f9bbe-23ea-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 678f9bbe-23ea-11ea-b6f1-bc764e2007e4;
 Sat, 21 Dec 2019 12:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576930025; x=1608466025;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sLyXZCxHwdvBMjqHfJj9iCnZ90JaAsfg66yPK2JU84c=;
 b=gwOXcDOan+eFep0k/vqAHH4VnMElxPl+iNnzpVAiUWqaYiCfcj11VJoQ
 i/Yn6zBYgYMy1e3vca7ORjIYGqgAMsjFiYJ4G3FbcEQ8kf+tJHNfHtddv
 IQ0DSCGqilXqt6qY2acuc+PoElq0Q3+Uwq+FrVuGDkXLOwyJZ52YmVD3Q o=;
IronPort-SDR: gYcMHf7CYQh6/wkKIHiWbc02sCaNaWKMzloAvfuRUv7uGfN8cA7riOwkDHW00li3MiplslyNLt
 2mhpY+2XP7sA==
X-IronPort-AV: E=Sophos;i="5.69,338,1571702400"; 
   d="scan'208";a="8698143"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 21 Dec 2019 12:07:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-1c1b5cdd.us-west-2.amazon.com (Postfix) with ESMTPS
 id 262C9A22F9; Sat, 21 Dec 2019 12:07:01 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:07:01 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Sat, 21 Dec 2019 12:07:00 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Sat, 21 Dec 2019 12:07:00 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Wei Liu <wl@xen.org>, Xen Development List <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 5/4] x86/viridian: drop a wrong invalid value from
 reference TSC implementation
Thread-Index: AQHVt3tsHkpLNhC5kEKtuCjhMLNKb6fEfa+A
Date: Sat, 21 Dec 2019 12:06:59 +0000
Message-ID: <affb8b6f87f744ec865101401d4f9131@EX13D32EUC003.ant.amazon.com>
References: <20191220195135.20130-1-liuwe@microsoft.com>
 <20191220212103.4192-1-liuwe@microsoft.com>
In-Reply-To: <20191220212103.4192-1-liuwe@microsoft.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.67]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 5/4] x86/viridian: drop a wrong invalid
 value from reference TSC implementation
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdlaS5saXUueGVu
QGdtYWlsLmNvbT4gT24gQmVoYWxmIE9mIFdlaSBMaXUKPiBTZW50OiAyMCBEZWNlbWJlciAyMDE5
IDIxOjIxCj4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc+Cj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBNaWNo
YWVsIEtlbGxleQo+IDxtaWtlbGxleUBtaWNyb3NvZnQuY29tPjsgV2VpIExpdSA8bGl1d2VAbWlj
cm9zb2Z0LmNvbT47IFBhdWwgRHVycmFudAo+IDxwYXVsQHhlbi5vcmc+OyBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1vbm7DqQo+IDxyb2dlci5w
YXVAY2l0cml4LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggNS80XSB4ODYvdmlyaWRpYW46IGRyb3Ag
YSB3cm9uZyBpbnZhbGlkIHZhbHVlIGZyb20KPiByZWZlcmVuY2UgVFNDIGltcGxlbWVudGF0aW9u
Cj4gCj4gVGhlIG9ubHkgaW52YWxpZCB2YWx1ZSBtZW50aW9uZWQgaW4gSHlwZXItViBUTEZTIDUu
MGMgaXMgMC4gTWljaGFlbAo+IEtlbGxleSBjb25maXJtZWQgdGhhdCAweEZGRkZGRkZGIHdhcyBu
ZXZlciB1c2VkIFswXS4KPiAKPiBbMF0gaHR0cHM6Ly9saXN0cy54ZW4ub3JnL2FyY2hpdmVzL2h0
bWwveGVuLWRldmVsLzIwMTktMTIvbXNnMDE1NjQuaHRtbAo+IAo+IFNpZ25lZC1vZmYtYnk6IFdl
aSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9odm0vdmly
aWRpYW4vdGltZS5jIHwgMTMgKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL3ZpcmlkaWFuL3RpbWUuYwo+IGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMK
PiBpbmRleCA2YjJkNzQ1ZjNhLi5iODI4MGExYTYwIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdmlyaWRpYW4vdGltZS5jCj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90
aW1lLmMKPiBAQCAtNDUsMTQgKzQ1LDkgQEAgc3RhdGljIHZvaWQgdXBkYXRlX3JlZmVyZW5jZV90
c2MoY29uc3Qgc3RydWN0IGRvbWFpbgo+ICpkLCBib29sIGluaXRpYWxpemUpCj4gICAgICBpZiAo
ICFob3N0X3RzY19pc19zYWZlKCkgfHwgZC0+YXJjaC52dHNjICkKPiAgICAgIHsKPiAgICAgICAg
ICAvKgo+IC0gICAgICAgICAqIFRoZSBzcGVjaWZpY2F0aW9uIHN0YXRlcyB0aGF0IHZhbGlkIHZh
bHVlcyBvZiBUc2NTZXF1ZW5jZQo+IHJhbmdlCj4gLSAgICAgICAgICogZnJvbSAwIHRvIDB4RkZG
RkZGRkUuIFRoZSB2YWx1ZSAweEZGRkZGRkZGIGlzIHVzZWQgdG8gaW5kaWNhdGUKPiAtICAgICAg
ICAgKiB0aGlzIG1lY2hhbmlzbSBpcyBubyBsb25nZXIgYSByZWxpYWJsZSBzb3VyY2Ugb2YgdGlt
ZSBhbmQgdGhhdAo+IC0gICAgICAgICAqIHRoZSBWTSBzaG91bGQgZmFsbCBiYWNrIHRvIGEgZGlm
ZmVyZW50IHNvdXJjZS4KPiAtICAgICAgICAgKgo+IC0gICAgICAgICAqIFNlcnZlciAyMDEyICg2
LjIga2VybmVsKSBhbmQgMjAxMiBSMiAoNi4zIGtlcm5lbCkgYWN0dWFsbHkKPiAtICAgICAgICAg
KiB2aW9sYXRlIHRoZSBzcGVjLiBhbmQgcmVseSBvbiBhIHZhbHVlIG9mIDAgdG8gaW5kaWNhdGUg
dGhhdAo+IHRoaXMKPiAtICAgICAgICAgKiBlbmxpZ2h0ZW5tZW50IHNob3VsZCBubyBsb25nZXIg
YmUgdXNlZC4KPiArICAgICAgICAgKiBUaGUgdmFsdWUgMCBpcyB1c2VkIHRvIGluZGljYXRlIHRo
aXMgbWVjaGFuaXNtIGlzIG5vIGxvbmdlciBhCj4gKyAgICAgICAgICogcmVsaWFibGUgc291cmNl
IG9mIHRpbWUgYW5kIHRoYXQgdGhlIFZNIHNob3VsZCBmYWxsIGJhY2sgdG8gYQo+ICsgICAgICAg
ICAqIGRpZmZlcmVudCBzb3VyY2UuCj4gICAgICAgICAgICovCj4gICAgICAgICAgcC0+dHNjX3Nl
cXVlbmNlID0gMDsKPiAKPiBAQCAtNzcsNyArNzIsNyBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfcmVm
ZXJlbmNlX3RzYyhjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+IGJvb2wgaW5pdGlhbGl6ZSkKPiAg
ICAgIHNtcF93bWIoKTsKPiAKPiAgICAgIHNlcSA9IHAtPnRzY19zZXF1ZW5jZSArIDE7Cj4gLSAg
ICBpZiAoIHNlcSA9PSAweEZGRkZGRkZGIHx8IHNlcSA9PSAwICkgLyogQXZvaWQgYm90aCAnaW52
YWxpZCcgdmFsdWVzCj4gKi8KPiArICAgIGlmICggc2VxID09IDAgKSAvKiBBdm9pZCAnaW52YWxp
ZCcgdmFsdWUgKi8KPiAgICAgICAgICBzZXEgPSAxOwo+IAo+ICAgICAgcC0+dHNjX3NlcXVlbmNl
ID0gc2VxOwoKTm93IHRoYXQgd2UncmUganVzdCBkZWFsaW5nIHdpdGggMCwgSSB0aGluayB0aGUg
Y29kZSB3b3VsZCBiZSBuZWF0ZXIgYXM6CgpzZXEgPSBwLT50c2Nfc2VxdWVuY2UgKyAxOwpwLT50
c2Nfc2VxdWVuY2UgPSBzZXEgPyBzZXEgOiAxOyAvKiBBdm9pZCAnaW52YWxpZCcgdmFsdWUgMCAq
LwoKICBQYXVsCgoKCj4gLS0KPiAyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
