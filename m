Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E2EC42B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Nov 2019 15:04:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQXTy-0001BD-SS; Fri, 01 Nov 2019 14:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LLmP=YZ=amazon.com=prvs=2019add78=elnikety@srs-us1.protection.inumbo.net>)
 id 1iQXTx-0001B0-BR
 for xen-devel@lists.xenproject.org; Fri, 01 Nov 2019 14:00:53 +0000
X-Inumbo-ID: 03ef593e-fcb0-11e9-93da-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03ef593e-fcb0-11e9-93da-bc764e2007e4;
 Fri, 01 Nov 2019 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1572616852; x=1604152852;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=vQp98xS7lOhrQrLo2Ngol0mBcMNKJxDnE3cdu0PZYKo=;
 b=U0/uQ8XywTdtVcxUGtqvQnaAo59ykSkLjZaB9uBQNizEO554+YMpwOPG
 9tNISNq3nI8d2FNDcTOUfRCjn/BRq0QnyiEjIWl02pMG85ACEV3Qzw6Yn
 to1FVYJFOkG/oZgmYU3472wMUUK+B/sIDk+8ykD3wllPZqwgGspyQKuLc M=;
IronPort-SDR: QJ7kuKErN2qf5+BB6gwmNdXPxzbk157Lf8cnkHWA1HgNR/bqMsgjJrHj/EvaVDaNVH/vlmsMEB
 8U0sPeAcBbAA==
X-IronPort-AV: E=Sophos;i="5.68,255,1569283200"; 
   d="scan'208";a="3039848"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 01 Nov 2019 14:00:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id C5715C0C55; Fri,  1 Nov 2019 14:00:44 +0000 (UTC)
Received: from EX13D03EUA002.ant.amazon.com (10.43.165.166) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 1 Nov 2019 14:00:44 +0000
Received: from a483e73f63b0.ant.amazon.com (10.43.160.73) by
 EX13D03EUA002.ant.amazon.com (10.43.165.166) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 1 Nov 2019 14:00:40 +0000
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
References: <1e714166-ffeb-06a1-9caf-412eb040ac5a@suse.com>
 <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
From: Eslam Elnikety <elnikety@amazon.com>
Message-ID: <6e358e65-2efe-9e4c-01e9-d9e317c6dfbc@amazon.com>
Date: Fri, 1 Nov 2019 15:00:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <005a7254-aae8-ec7c-6e65-9dfe06803208@suse.com>
Content-Language: en-US
X-Originating-IP: [10.43.160.73]
X-ClientProxiedBy: EX13D13UWB002.ant.amazon.com (10.43.161.21) To
 EX13D03EUA002.ant.amazon.com (10.43.165.166)
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/2] x86: explicitly disallow guest access
 to PPIN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB0aGlzIHNlcmllcywgSmFuLgoKT24gMzAuMTAuMTkgMTE6MzksIEphbiBCZXVs
aWNoIHdyb3RlOgo+IFRvIGZ1bGZpbGwgdGhlICJwcm90ZWN0ZWQiIGluIGl0cyBuYW1lLCBkb24n
dCBsZXQgdGhlIHJlYWwgaGFyZHdhcmUKPiB2YWx1ZXMgInNoaW5lIHRocm91Z2giLiBSZXBvcnQg
YSBjb250cm9sIHJlZ2lzdGVyIHZhbHVlIGV4cHJlc3NpbmcgdGhpcy4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gLS0tCj4gVEJEOiBEbyB3ZSB3
YW50IHRvIHBlcm1pdCBEb20wIGFjY2Vzcz8KCkl0IHdvdWxkIGJlIG5pY2UgdG8gZ2l2ZSBhbiBh
ZG1pbmlzdHJhdG9yIGEgd2F5IHRvIGdldCBQUElOIG91dHNpZGUgdGhlIApjb250ZXh0IG9mIGFu
IE1DRSB3aGVuIG5lZWRlZC4KCj4gCj4gLS0tIGEveGVuL2FyY2gveDg2L21zci5jCj4gKysrIGIv
eGVuL2FyY2gveDg2L21zci5jCj4gQEAgLTEzNSw2ICsxMzUsOCBAQCBpbnQgZ3Vlc3RfcmRtc3Io
c3RydWN0IHZjcHUgKnYsIHVpbnQzMl90Cj4gICAgICAgY2FzZSBNU1JfVFNYX0ZPUkNFX0FCT1JU
Ogo+ICAgICAgIGNhc2UgTVNSX0FNRDY0X0xXUF9DRkc6Cj4gICAgICAgY2FzZSBNU1JfQU1ENjRf
TFdQX0NCQUREUjoKPiArICAgIGNhc2UgTVNSX1BQSU46Cj4gKyAgICBjYXNlIE1TUl9BTURfUFBJ
TjoKPiAgICAgICAgICAgLyogTm90IG9mZmVyZWQgdG8gZ3Vlc3RzLiAqLwo+ICAgICAgICAgICBn
b3RvIGdwX2ZhdWx0Owo+ICAgCj4gQEAgLTIzNyw2ICsyMzksMTggQEAgaW50IGd1ZXN0X3JkbXNy
KHN0cnVjdCB2Y3B1ICp2LCB1aW50MzJfdAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBBUlJBWV9TSVpFKG1zcnMtPmRyX21hc2spKV07Cj4gICAgICAgICAgIGJyZWFrOwo+
ICAgCj4gKyAgICBjYXNlIE1TUl9QUElOX0NUTDoKPiArICAgICAgICBpZiAoIGQtPmFyY2guY3B1
aWQtPng4Nl92ZW5kb3IgIT0gWDg2X1ZFTkRPUl9JTlRFTCApCj4gKyAgICAgICAgICAgIGdvdG8g
Z3BfZmF1bHQ7Cj4gKyAgICAgICAgKnZhbCA9IFBQSU5fTE9DS09VVDsKPiArICAgICAgICBicmVh
azsKPiArCj4gKyAgICBjYXNlIE1TUl9BTURfUFBJTl9DVEw6Cj4gKyAgICAgICAgaWYgKCAhY3At
PmV4dGQuYW1kX3BwaW4gKQo+ICsgICAgICAgICAgICBnb3RvIGdwX2ZhdWx0Owo+ICsgICAgICAg
ICp2YWwgPSBQUElOX0xPQ0tPVVQ7Cj4gKyAgICAgICAgYnJlYWs7Cj4gKwoKbml0OiBJdCBpcyBu
b3QgY2xlYXIgdG8gbWUgd2h5IHlvdSB1c2UgImQtPmFyY2guY3B1aWQtPi4uIiAoYW5kIG5vdCAK
ImNwLT4uLiIpIGluIHRoZSBmaXJzdCBpZiBjb25kaXRpb24uCgotLSBFc2xhbQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
