Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 484C74D506C
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:26:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288543.489324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMYN-00087i-KB; Thu, 10 Mar 2022 17:26:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288543.489324; Thu, 10 Mar 2022 17:26:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMYN-00084i-H8; Thu, 10 Mar 2022 17:26:19 +0000
Received: by outflank-mailman (input) for mailman id 288543;
 Thu, 10 Mar 2022 17:26:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UgV8=TV=amazon.de=prvs=06149a43a=doebel@srs-se1.protection.inumbo.net>)
 id 1nSMYL-00084H-MK
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:26:17 +0000
Received: from smtp-fw-80007.amazon.com (smtp-fw-80007.amazon.com
 [99.78.197.218]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fbc8256-a097-11ec-8eba-a37418f5ba1a;
 Thu, 10 Mar 2022 18:26:16 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-34cb9e7b.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-80007.pdx80.corp.amazon.com with ESMTP;
 10 Mar 2022 17:25:56 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-34cb9e7b.us-west-2.amazon.com (Postfix) with
 ESMTPS id 763E041DA7; Thu, 10 Mar 2022 17:25:54 +0000 (UTC)
Received: from [192.168.12.40] (10.43.164.135) by EX13D03EUC002.ant.amazon.com
 (10.43.164.60) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 10 Mar 2022 17:25:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2fbc8256-a097-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646933177; x=1678469177;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=x6WYQsFkxLGBkdR9D+/rLg8pEwwCQoCKyJJ6C4u2OHo=;
  b=CFlofUq1dKJI7FlUhCsrVWW/Wf87+bY4z4rUIvtWzn6znV8jmc3kW1MZ
   PmI1CDHjEhfDON2J6DbJhHrtTDr3+iHe0CkS5QVnWnWvxEamz5aAfZhjq
   jtthihPLxIRNhgMY0Q0oFa3COFNowRqcKopP/x+h5gNnMzhKW5H4QwnsR
   c=;
X-IronPort-AV: E=Sophos;i="5.90,171,1643673600"; 
   d="scan'208";a="69734144"
Subject: Re: [PATCH 3/3] livepatch: correctly handle altinstruction sections
Message-ID: <e64f2475-e06b-c908-d719-4dec319af099@amazon.de>
Date: Thu, 10 Mar 2022 18:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Ross Lagerwall
	<ross.lagerwall@citrix.com>
References: <20220310150834.98815-1-roger.pau@citrix.com>
 <20220310150834.98815-4-roger.pau@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <20220310150834.98815-4-roger.pau@citrix.com>
X-Originating-IP: [10.43.164.135]
X-ClientProxiedBy: EX13D17EUC004.ant.amazon.com (10.43.164.212) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAxMC4wMy4yMiAxNjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IENBVVRJT046IFRo
aXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmly
bSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4gCj4gVGhl
IGN1cnJlbnQgaGFuZGxpbmcgb2YgYWx0aW5zdHJ1Y3Rpb25zIHNlY3Rpb25zIGJ5IHRoZSBsaXZl
cGF0Y2gKPiB0b29scyBpcyBpbmNvcnJlY3QsIGFzIG9uIFhlbiB0aG9zZSBzZWN0aW9ucyBhcmUg
cGFydCBvZiAuaW5pdCBhbmQKPiB0aHVzIGRpc2NhcmRlZCBhZnRlciBsb2FkLiBDb3JyZWN0bHkg
aGFuZGxlIHRoZW0gYnkganVzdCBpZ25vcmluZywgYXMKPiBpdCdzIGRvbmUgd2l0aCBvdGhlciAu
aW5pdCByZWxhdGVkIHNlY3Rpb25zLgo+IAo+IFdoaWxlIHRoZXJlIGFsc28gYWRkIC5kYXRhLnJv
X2FmdGVyX2luaXQgc2VjdGlvbiBhcyBhIHJlYWQtb25seQo+IHNlY3Rpb24gYW5kIGludHJvZHVj
ZSBzb21lIHN5bnRhY3RpYyBzdWdhciBmb3IgY29tcGFyaW5nIHNlY3Rpb24KPiBuYW1lcy4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiAtLS0KPiBJIGFzc3VtZSB0aGlzIGhhbmRsaW5nIG9mIC5hbHRpbnN0ciogc2VjdGlvbnMgd2Fz
IGluaGVyaXRlZCBmcm9tIExpbnV4Cj4gd2hlcmUgdGhlIHNlY3Rpb25zIGFyZSBub3QgZGlzY2Fy
ZGVkIGFmdGVyIGxvYWQgaW4gb3JkZXIgdG8gYXBwbHkKPiBhbHRlcm5hdGl2ZSBwYXRjaGluZyB0
byB0aGUgbG9hZGVkIG1vZHVsZXMgYWZ0ZXIgYm9vdC4KPiAtLS0KPiAgIGNvbW1vbi5jICAgICAg
ICAgICAgIHwgIDcgKysrKystLQo+ICAgY3JlYXRlLWRpZmYtb2JqZWN0LmMgfCAyNiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb21tb24uYyBiL2NvbW1vbi5jCj4g
aW5kZXggNjhhNzFmNy4uYTE0OGQ4YSAxMDA2NDQKPiAtLS0gYS9jb21tb24uYwo+ICsrKyBiL2Nv
bW1vbi5jCj4gQEAgLTI0OSwxOSArMjQ5LDIyIEBAIGludCBpc190ZXh0X3NlY3Rpb24oc3RydWN0
IHNlY3Rpb24gKnNlYykKPiAgICAgICAgICAgICAgICAgIChzZWMtPnNoLnNoX2ZsYWdzICYgU0hG
X0VYRUNJTlNUUikpOwo+ICAgfQo+IAo+ICsjZGVmaW5lIFNFQ19NQVRDSChuKSAhc3RybmNtcChz
ZWMtPm5hbWUsIG4sIHN0cmxlbihuKSAtIDEpCj4gICBpbnQgaXNfcm9kYXRhX3NlY3Rpb24oc3Ry
dWN0IHNlY3Rpb24gKnNlYykKPiAgIHsKPiAgICAgICAgICByZXR1cm4gc2VjLT5zaC5zaF90eXBl
ID09IFNIVF9QUk9HQklUUyAmJgo+ICAgICAgICAgICAgICAgICAhKHNlYy0+c2guc2hfZmxhZ3Mg
JiAoU0hGX0VYRUNJTlNUUiB8IFNIRl9XUklURSkpICYmCj4gLSAgICAgICAgICAgICAgIXN0cm5j
bXAoc2VjLT5uYW1lLCAiLnJvZGF0YSIsIDcpOwo+ICsgICAgICAgICAgICAgIChTRUNfTUFUQ0go
Ii5yb2RhdGEiKSB8fCBTRUNfTUFUQ0goIi5kYXRhLnJvX2FmdGVyX2luaXQiKSk7Cj4gICB9Cj4g
Cj4gICBpbnQgaXNfaW5pdF9zZWN0aW9uKHN0cnVjdCBzZWN0aW9uICpzZWMpCj4gICB7Cj4gICAg
ICAgICAgcmV0dXJuIHNlYy0+c2guc2hfdHlwZSA9PSBTSFRfUFJPR0JJVFMgJiYKPiAgICAgICAg
ICAgICAgICAgKHNlYy0+c2guc2hfZmxhZ3MgJiBTSEZfQUxMT0MpICYmCj4gLSAgICAgICAgICAg
ICAgIXN0cm5jbXAoc2VjLT5uYW1lLCAiLmluaXQiLCA1KTsKPiArICAgICAgICAgICAgICAoU0VD
X01BVENIKCIuaW5pdCIpIHx8IFNFQ19NQVRDSCgiLnRleHQuc3RhcnR1cCIpIHx8Cj4gKyAgICAg
ICAgICAgICAgIFNFQ19NQVRDSCgiLmFsdGluc3RyIikgfHwgU0VDX01BVENIKCIuY3RvcnMiKSk7
Cj4gICB9Cj4gKyN1bmRlZiBTRUNfTUFUQ0gKPiAKPiAgIGludCBpc19kZWJ1Z19zZWN0aW9uKHN0
cnVjdCBzZWN0aW9uICpzZWMpCj4gICB7Cj4gZGlmZiAtLWdpdCBhL2NyZWF0ZS1kaWZmLW9iamVj
dC5jIGIvY3JlYXRlLWRpZmYtb2JqZWN0LmMKPiBpbmRleCBhNTE2NjcwLi5lYzJhZmI0IDEwMDY0
NAo+IC0tLSBhL2NyZWF0ZS1kaWZmLW9iamVjdC5jCj4gKysrIGIvY3JlYXRlLWRpZmYtb2JqZWN0
LmMKPiBAQCAtOTk1LDE5ICs5OTUsNiBAQCBzdGF0aWMgaW50IGV4X3RhYmxlX2dyb3VwX3NpemUo
c3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsIGludCBvZmZzZXQpCj4gICAgICAgICAgcmV0dXJuIHNp
emU7Cj4gICB9Cj4gCj4gLXN0YXRpYyBpbnQgYWx0aW5zdHJ1Y3Rpb25zX2dyb3VwX3NpemUoc3Ry
dWN0IGtwYXRjaF9lbGYgKmtlbGYsIGludCBvZmZzZXQpCj4gLXsKPiAtICAgICAgIHN0YXRpYyBp
bnQgc2l6ZSA9IDA7Cj4gLSAgICAgICBjaGFyICpzdHI7Cj4gLSAgICAgICBpZiAoIXNpemUpIHsK
PiAtICAgICAgICAgICAgICAgc3RyID0gZ2V0ZW52KCJBTFRfU1RSVUNUX1NJWkUiKTsKPiAtICAg
ICAgICAgICAgICAgc2l6ZSA9IHN0ciA/IGF0b2koc3RyKSA6IDEyOwo+IC0gICAgICAgfQo+IC0K
PiAtICAgICAgIGxvZ19kZWJ1ZygiYWx0aW5zdHJfc2l6ZT0lZFxuIiwgc2l6ZSk7Cj4gLSAgICAg
ICByZXR1cm4gc2l6ZTsKPiAtfQo+IC0KPiAgIHN0YXRpYyBpbnQgbGl2ZXBhdGNoX2hvb2tzX2dy
b3VwX3NpemUoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsIGludCBvZmZzZXQpCj4gICB7Cj4gICAg
ICAgICAgc3RhdGljIGludCBzaXplID0gMDsKPiBAQCAtMTAyMSwxMSArMTAwOCw2IEBAIHN0YXRp
YyBpbnQgbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYs
IGludCBvZmZzZXQpCj4gICAgICAgICAgcmV0dXJuIHNpemU7Cj4gICB9Cj4gCj4gLXN0YXRpYyBp
bnQgdW5kZWZpbmVkX2dyb3VwX3NpemUoc3RydWN0IGtwYXRjaF9lbGYgKmtlbGYsIGludCBvZmZz
ZXQpCj4gLXsKPiAtICAgICAgIHJldHVybiAwOwo+IC19Cj4gLQo+ICAgLyoKPiAgICAqIFRoZSBy
ZWxhIGdyb3VwcyBpbiB0aGUgLmZpeHVwIHNlY3Rpb24gdmFyeSBpbiBzaXplLiAgVGhlIGJlZ2lu
bmluZyBvZiBlYWNoCj4gICAgKiAuZml4dXAgcmVsYSBncm91cCBpcyByZWZlcmVuY2VkIGJ5IHRo
ZSAuZXhfdGFibGUgc2VjdGlvbi4gVG8gZmluZCB0aGUgc2l6ZQo+IEBAIC0xMDk5LDE0ICsxMDgx
LDYgQEAgc3RhdGljIHN0cnVjdCBzcGVjaWFsX3NlY3Rpb24gc3BlY2lhbF9zZWN0aW9uc1tdID0g
ewo+ICAgICAgICAgICAgICAgICAgLm5hbWUgICAgICAgICAgID0gIi5leF90YWJsZSIsCj4gICAg
ICAgICAgICAgICAgICAuZ3JvdXBfc2l6ZSAgICAgPSBleF90YWJsZV9ncm91cF9zaXplLAo+ICAg
ICAgICAgIH0sCj4gLSAgICAgICB7Cj4gLSAgICAgICAgICAgICAgIC5uYW1lICAgICAgICAgICA9
ICIuYWx0aW5zdHJ1Y3Rpb25zIiwKPiAtICAgICAgICAgICAgICAgLmdyb3VwX3NpemUgICAgID0g
YWx0aW5zdHJ1Y3Rpb25zX2dyb3VwX3NpemUsCj4gLSAgICAgICB9LAo+IC0gICAgICAgewo+IC0g
ICAgICAgICAgICAgICAubmFtZSAgICAgICAgICAgPSAiLmFsdGluc3RyX3JlcGxhY2VtZW50IiwK
PiAtICAgICAgICAgICAgICAgLmdyb3VwX3NpemUgICAgID0gdW5kZWZpbmVkX2dyb3VwX3NpemUs
Cj4gLSAgICAgICB9LAo+ICAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgIC5uYW1lICAgICAg
ICAgICA9ICIubGl2ZXBhdGNoLmhvb2tzLmxvYWQiLAo+ICAgICAgICAgICAgICAgICAgLmdyb3Vw
X3NpemUgICAgID0gbGl2ZXBhdGNoX2hvb2tzX2dyb3VwX3NpemUsCj4gLS0KPiAyLjM0LjEKPiAK
CkNvbmZpcm1pbmcsIHRoaXMgc29sdmVzIHRoZSBhbHRzZWN0aW9uIGlzc3VlIEkgcmVwb3J0ZWQg
dmlhIApodHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvYjc0YTY4YjAzOGMzMWRmNGJi
OTRhNWI1ZTg3NDUzZjVhMjQ5Y2ZlMi4xNjQ2NzUzNjU3LmdpdC5kb2ViZWxAYW1hem9uLmRlLwoK
UmV2aWV3ZWQtYnk6IEJqb2VybiBEb2ViZWwgPGRvZWJlbEBhbWF6b24uZGU+CgoKCkFtYXpvbiBE
ZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJICktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxp
bgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlhbiBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNz
CkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkx
NzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCg==


