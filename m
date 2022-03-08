Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859E4D190E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:21:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286855.486524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZlm-0000uF-U6; Tue, 08 Mar 2022 13:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286855.486524; Tue, 08 Mar 2022 13:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRZlm-0000sF-Q8; Tue, 08 Mar 2022 13:20:54 +0000
Received: by outflank-mailman (input) for mailman id 286855;
 Tue, 08 Mar 2022 13:20:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JMfM=TT=amazon.de=prvs=0590b4220=doebel@srs-se1.protection.inumbo.net>)
 id 1nRZlk-0000s9-MN
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:20:53 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91ca30a8-9ee2-11ec-8eba-a37418f5ba1a;
 Tue, 08 Mar 2022 14:20:50 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-33001.sea14.amazon.com with ESMTP; 08 Mar 2022 13:20:33 +0000
Received: from EX13D03EUC002.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-pdx-2c-d9fba5dd.us-west-2.amazon.com (Postfix) with
 ESMTPS id F1C7B41617; Tue,  8 Mar 2022 13:20:31 +0000 (UTC)
Received: from [192.168.10.142] (10.43.165.107) by
 EX13D03EUC002.ant.amazon.com (10.43.164.60) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Tue, 8 Mar 2022 13:20:29 +0000
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
X-Inumbo-ID: 91ca30a8-9ee2-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646745651; x=1678281651;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=u0TzM/J6sUbtlm6lScP8iZ+QOEpp0cLSgO7WYa9y4Hs=;
  b=kc18cK4ZZ7Fe3umYn9G/tDjTQpm+WcCB7uj5+K/SfoSvIhLxuFnpDAjC
   R0f883sZJaRTSl7/jp+/nYKChLJdjjQdSEM70IE2B9Jr/4SqzC0PD7iKG
   ZUsAGacwElZY9gZCmu/yB3qiIjhjk7PhVJVRiQB2O4inOXDb3y448+kK0
   g=;
X-IronPort-AV: E=Sophos;i="5.90,164,1643673600"; 
   d="scan'208";a="180538900"
Subject: Re: [PATCH v3 2/2] xen/x86: Livepatch: support patching CET-enhanced
 functions
Message-ID: <47098ee3-e75d-7f61-6550-bb006186e7e1@amazon.de>
Date: Tue, 8 Mar 2022 14:20:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michael Kurth <mku@amazon.de>, Martin Pohlack <mpohlack@amazon.de>, Roger
 Pau Monne <roger.pau@citrix.com>, Konrad Rzeszutek Wilk
	<konrad.wilk@oracle.com>, Ross Lagerwall <ross.lagerwall@citrix.com>
References: <453c6e5decb315109a4fbf0065cc364129dca195.1646735357.git.doebel@amazon.de>
 <b91fc474832dd0ce07d223542316fba74afc35ee.1646735357.git.doebel@amazon.de>
 <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
From: "Doebel, Bjoern" <doebel@amazon.de>
In-Reply-To: <cf0be28d-090c-1881-5831-1d58696a9272@citrix.com>
X-Originating-IP: [10.43.165.107]
X-ClientProxiedBy: EX13D45EUC001.ant.amazon.com (10.43.164.107) To
 EX13D03EUC002.ant.amazon.com (10.43.164.60)
Precedence: Bulk
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

CgpPbiAwOC4wMy4yMiAxMzo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDQVVUSU9OOiBUaGlz
IGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24uIERvIG5v
dCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2FuIGNvbmZpcm0g
dGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLgo+IAo+IAo+IAo+IE9uIDA4
LzAzLzIwMjIgMTA6MjksIEJqb2VybiBEb2ViZWwgd3JvdGU6Cj4+IEBAIC0xMDQsMTggKzEyMiwz
NCBAQCB2b2lkIG5vaW5saW5lIGFyY2hfbGl2ZXBhdGNoX3Jldml2ZSh2b2lkKQo+Pgo+PiAgIGlu
dCBhcmNoX2xpdmVwYXRjaF92ZXJpZnlfZnVuYyhjb25zdCBzdHJ1Y3QgbGl2ZXBhdGNoX2Z1bmMg
KmZ1bmMpCj4+ICAgewo+PiArICAgIEJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IHg4Nl9saXZl
cGF0Y2hfbWV0YSkgIT0gTElWRVBBVENIX09QQVFVRV9TSVpFKTsKPj4gKwo+PiAgICAgICAvKiBJ
ZiBOT1BpbmcuLiAqLwo+PiAgICAgICBpZiAoICFmdW5jLT5uZXdfYWRkciApCj4+ICAgICAgIHsK
Pj4gICAgICAgICAgIC8qIE9ubHkgZG8gdXAgdG8gbWF4aW11bSBhbW91bnQgd2UgY2FuIHB1dCBp
biB0aGUgLT5vcGFxdWUuICovCj4+IC0gICAgICAgIGlmICggZnVuYy0+bmV3X3NpemUgPiBzaXpl
b2YoZnVuYy0+b3BhcXVlKSApCj4+ICsgICAgICAgIGlmICggZnVuYy0+bmV3X3NpemUgPiBzaXpl
b2ZfZmllbGQoc3RydWN0IHg4Nl9saXZlcGF0Y2hfbWV0YSwKPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBpbnN0cnVjdGlvbikgKQo+PiAgICAgICAgICAgICAg
IHJldHVybiAtRU9QTk9UU1VQUDsKPj4KPj4gICAgICAgICAgIGlmICggZnVuYy0+b2xkX3NpemUg
PCBmdW5jLT5uZXdfc2l6ZSApCj4+ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+ICAg
ICAgIH0KPj4gLSAgICBlbHNlIGlmICggZnVuYy0+b2xkX3NpemUgPCBBUkNIX1BBVENIX0lOU05f
U0laRSApCj4+IC0gICAgICAgIHJldHVybiAtRUlOVkFMOwo+PiArICAgIGVsc2UKPj4gKyAgICB7
Cj4+ICsgICAgICAgIC8qCj4+ICsgICAgICAgICAqIFNwYWNlIG5lZWRlZCBub3cgZGVwZW5kcyBv
biB3aGV0aGVyIHRoZSB0YXJnZXQgZnVuY3Rpb24KPj4gKyAgICAgICAgICogc3RhcnRzIHdpdGgg
YW4gRU5EQlI2NCBpbnN0cnVjdGlvbi4KPj4gKyAgICAgICAgICovCj4+ICsgICAgICAgIHVpbnQ4
X3QgbmVlZGVkOwo+PiArCj4+ICsgICAgICAgIG5lZWRlZCA9IEFSQ0hfUEFUQ0hfSU5TTl9TSVpF
Owo+PiArICAgICAgICBpZiAoIGlzX2VuZGJyNjQoZnVuYy0+b2xkX2FkZHIpICkKPj4gKyAgICAg
ICAgICAgIG5lZWRlZCArPSBFTkRCUjY0X0xFTjsKPiAKPiBUaGlzIHdvbid0IHdvcmsgZm9yIGNm
X2Nsb2JiZXIgdGFyZ2V0cywgSSBkb24ndCB0aGluay4gIFRoZSBFTkRCUiBnZXRzCj4gY29udmVy
dGVkIHRvIE5PUDQgYW5kIGZhaWxzIHRoaXMgY2hlY2ssIGJ1dCB0aGUgYWx0Y2FsbHMgY2FsbGlu
Zwo+IG9sZF9mdW5jIGhhZCB0aGVpciBkaXNwbGFjZW1lbnRzIGFkanVzdGVkIGJ5ICs0Lgo+IAo+
IFRoZSBpc19lbmRicjY0KCkgY2hlY2sgd2lsbCBmYWlsLCBhbmQgdGhlIDUtYnl0ZSBqbXAgd2ls
bCBiZSB3cml0dGVuIGF0Cj4gdGhlIHN0YXJ0IG9mIHRoZSBmdW5jdGlvbiwgYW5kIGNvcnJ1cHQg
dGhlIGluc3RydWN0aW9uIHN0cmVhbSBmb3IgdGhlCj4gYWx0Y2FsbCgpJ2QgY2FsbGVycy4KPiAK
PiBMZXQgbWUgd3JpdGUgYW4gaW5jcmVtZW50YWwgcGF0Y2ggdG8gaGVscC4KClRoYW5rcy4gV2ls
bCB5b3UgYmUgYWRkaW5nIGEKCiAgICBtZW1jbXAoZnVuYy0+b2xkX2FkZHIsIGlkZWFsX25vcHNb
NF0sIDQpCgpvciBpcyB0aGF0IG9uY2UgbW9yZSB0b28gbmFpdmU/CgpCam9lcm4KCj4gfkFuZHJl
dwoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVyIEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAz
OAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBK
b25hdGhhbiBXZWlzcwpFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1
bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgo=


