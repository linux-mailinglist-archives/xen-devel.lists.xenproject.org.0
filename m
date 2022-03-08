Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848A4D190F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286860.486535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZmN-0001Q6-6c; Tue, 08 Mar 2022 13:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286860.486535; Tue, 08 Mar 2022 13:21:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZmN-0001OF-2Q; Tue, 08 Mar 2022 13:21:31 +0000
Received: by outflank-mailman (input) for mailman id 286860;
 Tue, 08 Mar 2022 13:21:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRZmL-0001Ff-Mf
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:21:29 +0000
Received: from smtp-fw-9103.amazon.com (smtp-fw-9103.amazon.com
 [207.171.188.200]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a83c478d-9ee2-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:21:28 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-9ec26c6c.us-west-2.amazon.com) ([10.25.36.210])
 by smtp-border-fw-9103.sea19.amazon.com with ESMTP; 08 Mar 2022 13:21:09 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-9ec26c6c.us-west-2.amazon.com (Postfix) with
 ESMTPS id 8941241C97; Tue,  8 Mar 2022 13:21:09 +0000 (UTC)
Received: from [192.168.10.142] (10.43.165.107) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 13:21:07 +0000
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
X-Inumbo-ID: a83c478d-9ee2-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646745688; x=1678281688;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=U8K1pxteJUEIIJcy+OZKLzmxnc/Sh4osDnYwHGQ6aoY=;
  b=l1O14519JOBu+zpbOhicGcJwe/VDcD0bYuFBIlS9Kn/nBfsSHTcfAOER
   NVoMZg+fNVAZmxOYVXUN73ZvEwz4X7poMYOprqdDIbc7lHTH1jnnd2oJ4
   i0emrVvpd4QyOrUt8Nc24BOv4re1NQMUab0DqUbYb27EpYU1D/GZFA9Mg
   E=;
X-IronPort-AV: E=Sophos;i="5.90,164,1643673600"; 
   d="scan'208";a="997599590"
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <fa561059-a98c-9724-1db1-0af1fc124c20@amazon.de>
Date: Tue, 8 Mar 2022 14:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew Cooper
	<Andrew.Cooper3@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Michael
 Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger Pau Monne
	<roger.pau@citrix.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
 <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
 <YidUuuWGAghGY7oM@char.us.oracle.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <YidUuuWGAghGY7oM@char.us.oracle.com>
X-Originating-IP: [10.43.165.107]
X-ClientProxiedBy: EX13D05EUC001.ant.amazon.com (10.43.164.118) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAxNDowNiwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4g
Y29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuCj4gCj4gCj4g
Cj4gT24gVHVlLCBNYXIgMDgsIDIwMjIgYXQgMTI6NDQ6NTRQTSArMDAwMCwgQW5kcmV3IENvb3Bl
ciB3cm90ZToKPj4gT24gMDgvMDMvMjAyMiAxMDoyOSwgQmpvZXJuIERvZWJlbCB3cm90ZToKPj4+
IEBAIC0xMDQsMTggKzEyMiwzNCBAQCB2b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX3Jldml2
ZSh2b2lkKQo+Pj4KPj4+ICAgaW50IGFyY2hfbGl2ZXBhdGNoX3ZlcmlmeV9mdW5jKGNvbnN0IHN0
cnVjdCBsaXZlcGF0Y2hfZnVuYyAqZnVuYykKPj4+ICAgewo+Pj4gKyAgICBCVUlMRF9CVUdfT04o
c2l6ZW9mKHN0cnVjdCB4ODZfbGl2ZXBhdGNoX21ldGEpICE9IExJVkVQQVRDSF9PUEFRVUVfU0la
RSk7Cj4+PiArCj4+PiAgICAgICAvKiBJZiBOT1BpbmcuLiAqLwo+Pj4gICAgICAgaWYgKCAhZnVu
Yy0+bmV3X2FkZHIgKQo+Pj4gICAgICAgewo+Pj4gICAgICAgICAgIC8qIE9ubHkgZG8gdXAgdG8g
bWF4aW11bSBhbW91bnQgd2UgY2FuIHB1dCBpbiB0aGUgLT5vcGFxdWUuICovCj4+PiAtICAgICAg
ICBpZiAoIGZ1bmMtPm5ld19zaXplID4gc2l6ZW9mKGZ1bmMtPm9wYXF1ZSkgKQo+Pj4gKyAgICAg
ICAgaWYgKCBmdW5jLT5uZXdfc2l6ZSA+IHNpemVvZl9maWVsZChzdHJ1Y3QgeDg2X2xpdmVwYXRj
aF9tZXRhLAo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
bnN0cnVjdGlvbikgKQo+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4+Pgo+
Pj4gICAgICAgICAgIGlmICggZnVuYy0+b2xkX3NpemUgPCBmdW5jLT5uZXdfc2l6ZSApCj4+PiAg
ICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gICAgICAgfQo+Pj4gLSAgICBlbHNlIGlm
ICggZnVuYy0+b2xkX3NpemUgPCBBUkNIX1BBVENIX0lOU05fU0laRSApCj4+PiAtICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsKPj4+ICsgICAgZWxzZQo+Pj4gKyAgICB7Cj4+PiArICAgICAgICAvKgo+
Pj4gKyAgICAgICAgICogU3BhY2UgbmVlZGVkIG5vdyBkZXBlbmRzIG9uIHdoZXRoZXIgdGhlIHRh
cmdldCBmdW5jdGlvbgo+Pj4gKyAgICAgICAgICogc3RhcnRzIHdpdGggYW4gRU5EQlI2NCBpbnN0
cnVjdGlvbi4KPj4+ICsgICAgICAgICAqLwo+Pj4gKyAgICAgICAgdWludDhfdCBuZWVkZWQ7Cj4+
PiArCj4+PiArICAgICAgICBuZWVkZWQgPSBBUkNIX1BBVENIX0lOU05fU0laRTsKPj4+ICsgICAg
ICAgIGlmICggaXNfZW5kYnI2NChmdW5jLT5vbGRfYWRkcikgKQo+Pj4gKyAgICAgICAgICAgIG5l
ZWRlZCArPSBFTkRCUjY0X0xFTjsKPj4KPj4gVGhpcyB3b24ndCB3b3JrIGZvciBjZl9jbG9iYmVy
IHRhcmdldHMsIEkgZG9uJ3QgdGhpbmsuICBUaGUgRU5EQlIgZ2V0cwo+PiBjb252ZXJ0ZWQgdG8g
Tk9QNCBhbmQgZmFpbHMgdGhpcyBjaGVjaywgYnV0IHRoZSBhbHRjYWxscyBjYWxsaW5nCj4+IG9s
ZF9mdW5jIGhhZCB0aGVpciBkaXNwbGFjZW1lbnRzIGFkanVzdGVkIGJ5ICs0Lgo+Pgo+PiBUaGUg
aXNfZW5kYnI2NCgpIGNoZWNrIHdpbGwgZmFpbCwgYW5kIHRoZSA1LWJ5dGUgam1wIHdpbGwgYmUg
d3JpdHRlbiBhdAo+PiB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uLCBhbmQgY29ycnVwdCB0aGUg
aW5zdHJ1Y3Rpb24gc3RyZWFtIGZvciB0aGUKPj4gYWx0Y2FsbCgpJ2QgY2FsbGVycy4KPj4KPj4g
TGV0IG1lIHdyaXRlIGFuIGluY3JlbWVudGFsIHBhdGNoIHRvIGhlbHAuCj4gCj4gUGxlYXNlIGFk
ZCBBY2tlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
Pgo+IG9uIHRoZSBwYXRjaGVzLgoKVGhhbmtzLCB3aWxsIGRvIQoKQmpvZXJuCgo+IFRoYW5rIHlv
dQo+Pgo+PiB+QW5kcmV3CgoKCkFtYXpvbiBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJI
CktyYXVzZW5zdHIuIDM4CjEwMTE3IEJlcmxpbgpHZXNjaGFlZnRzZnVlaHJ1bmc6IENocmlzdGlh
biBTY2hsYWVnZXIsIEpvbmF0aGFuIFdlaXNzCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENo
YXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAy
ODkgMjM3IDg3OQoKCg==


