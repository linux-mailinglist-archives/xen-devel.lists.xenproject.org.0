Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D53EA5D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 20:45:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLBCz-0008Gx-9K; Mon, 29 Apr 2019 18:40:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kVn5=S7=amazon.de=prvs=015f510af=wipawel@srs-us1.protection.inumbo.net>)
 id 1hLBCx-0008Gs-LF
 for xen-devel@lists.xen.org; Mon, 29 Apr 2019 18:40:55 +0000
X-Inumbo-ID: 51a4f6bd-6aae-11e9-843c-bc764e045a96
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 51a4f6bd-6aae-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 18:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1556563254; x=1588099254;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=MvcCDwCP2tH7un6X/s6MGP0IBdGVSCGm9su4SWtO9v4=;
 b=NBZDkMvTvh8cdefxYsSUfYnPw1RYm94UHTMEEbu1ZLGiLW3M2l/rml9o
 15F1dMV+vROkDAU6T/t/tPCeFzVgO5YvEBPzIzMBJ3k/vABcK72Thf/kX
 JOiv4HGOiCpGTH+V60PvZaOyslixo8K5Xj1Qg+0gZ7LzoIM8lLg171BHe E=;
X-IronPort-AV: E=Sophos;i="5.60,410,1549929600"; d="scan'208";a="394457577"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 29 Apr 2019 15:00:03 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (8.14.7/8.14.7) with
 ESMTP id x3TEtHoa021032
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Mon, 29 Apr 2019 14:55:20 GMT
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 14:55:20 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB004.ant.amazon.com (10.43.166.115) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 29 Apr 2019 14:55:19 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 29 Apr 2019 14:55:19 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Thread-Topic: [livepatch-build-tools part3 1/3] create-diff-object: Do not
 create empty .livepatch.funcs section
Thread-Index: AQHU9E8cXxFaJ2FtQUKy7+JZ8NjnQKZMXFsAgAbtIYCAAAUEAA==
Date: Mon, 29 Apr 2019 14:55:19 +0000
Message-ID: <FFFC1A28-9A74-40F0-90D1-FCE1A289A9A6@amazon.com>
References: <20190416122241.28342-1-wipawel@amazon.de>
 <20190425045104.GD11831@char.us.oracle.com>
 <0e9742a5-a6d9-551d-6dec-9d9917a006d7@citrix.com>
In-Reply-To: <0e9742a5-a6d9-551d-6dec-9d9917a006d7@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.137]
Content-ID: <35C1B8E32ADE504C86BB50851F227BC5@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [livepatch-build-tools part3 1/3]
 create-diff-object: Do not create empty .livepatch.funcs section
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMjkuIEFwciAyMDE5LCBhdCAxNjozNywgUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+IHdyb3RlOgo+IAo+IE9uIDQvMjUvMTkgNTo1MSBBTSwgS29ucmFkIFJ6
ZXN6dXRlayBXaWxrIHdyb3RlOgo+PiBPbiBUdWUsIEFwciAxNiwgMjAxOSBhdCAxMjoyMjozOVBN
ICswMDAwLCBQYXdlbCBXaWVjem9ya2lld2ljeiB3cm90ZToKPj4+IFdoZW4gdGhlcmUgaXMgbm8g
Y2hhbmdlZCBmdW5jdGlvbiBpbiB0aGUgZ2VuZXJhdGVkIHBheWxvYWQsIGRvIG5vdAo+Pj4gY3Jl
YXRlIGFuIGVtcHR5IC5saXZlcGF0Y2guZnVuY3Mgc2VjdGlvbi4gSHlwZXJ2aXNvciBjb2RlIGNv
bnNpZGVycwo+Pj4gc3VjaCBwYXlsb2FkcyBhcyBicm9rZW4gYW5kIHJlamVjdHMgdG8gbG9hZCB0
aGVtLgo+Pj4gCj4+PiBTdWNoIHBheWxvYWRzIHdpdGhvdXQgYW55IGNoYW5nZWQgZnVuY3Rpb25z
IG1heSBhcHBlYXIgd2hlbiBvbmx5Cj4+PiBob29rcyBhcmUgc3BlY2lmaWVkLgo+PiBSb3NzLCBJ
IGFtIGdvaW5nIHRvIHB1c2ggdGhpcyBpbiBuZXh0IHdlZWsgdW5sZXNzIHlvdSBoYXZlIG90aGVy
IHRob3VnaHRzPwo+IFJldmlld2VkLWJ5OiBSb3NzIExhZ2Vyd2FsbCA8cm9zcy5sYWdlcndhbGxA
Y2l0cml4LmNvbT4KPiAKPiBUaGlzIGNvZGUgY2hhbmdlIGxvb2tzIE9LIHRvIG1lLiBIb3dldmVy
Ogo+IAoKVGhhbmsgeW91IGZvciByZXZpZXdpbmcuCgo+IDEpIEkgdGhpbmsgdGhhdCB0aGUgaHlw
ZXJ2aXNvciBzaG91bGQgdHJlYXQgYW4gZW1wdHkgLmxpdmVwYXRjaC5mdW5jcyBzZWN0aW9uIHRo
ZSBzYW1lIGFzIGl0IHRyZWF0cyBhIG5vbi1wcmVzZW50IC5saXZlcGF0Y2guZnVuY3Mgc2VjdGlv
biAoaS5lLiBpdCBhbGxvd3MgaXQpIHdoaWNoIHdvdWxkIG1ha2UgdGhpcyBjaGFuZ2UgdW5uZWNl
c3NhcnkuCj4gCgpJIGRvIG5vdCBoYXZlIGEgc3Ryb25nIG9waW5pb24gaGVyZSwgYnV0IGl0IGZl
bHQgdW5uZWNlc3NhcnkgKGFuZCBhIGJpdCBjb25mdXNpbmcpIHRvIGdlbmVyYXRlIGFuIGVtcHR5
IHNlY3Rpb24uCkFsc28gSSBkaWQgbm90IHdhbnQgdG8gdG91Y2ggaHlwZXJ2aXNvciBjb2RlIGZv
ciB0aGlzLgoKPiAyKSBVbmxlc3MgSSdtIGJlaW5nIHN0dXBpZCwgSSBkb24ndCBzZWUgaG93IHRo
aXMgY2hhbmdlIHdvdWxkIHdvcmsgYW55d2F5LiBTdXJlbHkgdGhpcyBjb2RlIGF0IHRoZSBzdGFy
dCBvZiBwcmVwYXJlX3BheWxvYWQoKSB3b3VsZCBmYWlsIGlmIHRoZSBzZWN0aW9uIHdlcmUgbWlz
c2luZz8KPiAKPiAgICBzZWMgPSBsaXZlcGF0Y2hfZWxmX3NlY19ieV9uYW1lKGVsZiwgRUxGX0xJ
VkVQQVRDSF9GVU5DKTsKPiAgICBBU1NFUlQoc2VjKTsKPiAgICBpZiAoICFzZWN0aW9uX29rKGVs
Ziwgc2VjLCBzaXplb2YoKnBheWxvYWQtPmZ1bmNzKSkgKQo+ICAgICAgICByZXR1cm4gLUVJTlZB
TDsKPiAKCkluIG15IHNvb24tdG8tYmUtdXBzdHJlYW1lZCBiYWNrbG9nIEkgaGF2ZSB0aGUgZm9s
bG93aW5nIGNvbW1pdDoKbGl2ZXBhdGNoOiBEbyBub3QgZW5mb3JjZSBFTEZfTElWRVBBVENIX0ZV
TkMgc2VjdGlvbiBwcmVzZW5jZQpXaGVyZSBJIGFjdHVhbGx5IG1ha2UgdXNlIG9mIHRoaXMgbmV3
IGZ1bmN0aW9uYWxpdHkuCgpUaGUgbWFpbiBpZGVhIGJlaGluZCB0aGlzIGNoYW5nZSwgd2FzIHRv
IGVuYWJsZSBnZW5lcmF0aW9uIG9mIGhvb2tzLW9ubHkgaG90cGF0Y2ggbW9kdWxlcwooaS5lLiBt
b2R1bGVzIHRoYXQgZG9lcyBub3QgcGF0Y2ggYW55dGhpbmcsIGp1c3QgdHJpZ2dlciBhY3Rpb25z
KS4KCj4gUmVnYXJkcywKPiAtLSAKPiBSb3NzIExhZ2Vyd2FsbAoKCkJlc3QgUmVnYXJkcywKUGF3
ZWwgV2llY3pvcmtpZXdpY3oKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdt
YkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3Rp
YW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0
cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
