Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8398DC05D7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:57:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDplr-0002B8-C0; Fri, 27 Sep 2019 12:54:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wAPT=XW=amazon.com=prvs=166d6d219=hongyax@srs-us1.protection.inumbo.net>)
 id 1iDplp-0002Au-OQ
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:54:49 +0000
X-Inumbo-ID: fca733a5-e125-11e9-9678-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by localhost (Halon) with ESMTPS
 id fca733a5-e125-11e9-9678-12813bfff9fa;
 Fri, 27 Sep 2019 12:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1569588889; x=1601124889;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=M1Yueq1TeABS7nI1Psdu1Y/rD1PwantEW/ddA6PL//I=;
 b=CCUBF1ZbB+P3cFgc240sTxfj7T1gMQ29ikwcA1QcxelsxTiwU2xFRCs2
 uKh3SUY/yZJjhvFGJYXzRUqv7PtDiDN7p4S+i8z7OnhZf/mw0YKj0N3KU
 EOsChewntVOET5O6VdjkcfjwuwevowEA+3Eg3sQZMy7TWcMxo2zu36Ryt Q=;
X-IronPort-AV: E=Sophos;i="5.64,555,1559520000"; d="scan'208";a="424059971"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 27 Sep 2019 12:54:47 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 3F91B240EBB; Fri, 27 Sep 2019 12:54:44 +0000 (UTC)
Received: from EX13D21UWB004.ant.amazon.com (10.43.161.221) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 12:54:43 +0000
Received: from EX13MTAUWB001.ant.amazon.com (10.43.161.207) by
 EX13D21UWB004.ant.amazon.com (10.43.161.221) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 27 Sep 2019 12:54:43 +0000
Received: from u9d785c4ba99158.ant.amazon.com (10.125.106.78) by
 mail-relay.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS) id
 15.0.1367.3 via Frontend Transport; Fri, 27 Sep 2019 12:54:41 +0000
To: Wei Liu <wl@xen.org>
References: <cover.1569489002.git.hongyax@amazon.com>
 <ccabf9b1ce3142ca65e453ec9a5ae1d34d28a992.1569489002.git.hongyax@amazon.com>
 <20190926142657.mc3y7i4ovz6hvua6@debian>
From: <hongyax@amazon.com>
Message-ID: <7d68a0dc-d101-1823-5d8b-89e1b4a5f6fb@amazon.com>
Date: Fri, 27 Sep 2019 13:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926142657.mc3y7i4ovz6hvua6@debian>
Content-Language: en-US
Precedence: Bulk
Subject: Re: [Xen-devel] [RFC PATCH 71/84] x86/setup: start tearing down the
 direct map.
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMDkvMjAxOSAxNToyNiwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIFNlcCAyNiwgMjAx
OSBhdCAxMDo0NjozNEFNICswMTAwLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4+IEZyb206
IEhvbmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhv
bmd5YW4gWGlhIDxob25neWF4QGFtYXpvbi5jb20+Cj4+IC0tLQo+PiAgIHhlbi9hcmNoL3g4Ni9z
ZXR1cC5jICAgIHwgNCArKy0tCj4+ICAgeGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMgfCAyICstCj4+
ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5j
Cj4+IGluZGV4IGU5NjRjMDMyZjYuLjNkYzJmYWQ5ODcgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+IEBAIC0xMzY3LDcg
KzEzNjcsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25n
IG1iaV9wKQo+PiAgIAo+PiAgICAgICAgICAgICAgIGlmICggbWFwX2UgPCBlbmQgKQo+PiAgICAg
ICAgICAgICAgIHsKPj4gLSAgICAgICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNpZ25l
ZCBsb25nKV9fdmEobWFwX2UpLCBtYWRkcl90b19tZm4obWFwX2UpLAo+PiArICAgICAgICAgICAg
ICAgIG1hcF9wYWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192YShtYXBfZSksIElOVkFMSURf
TUZOLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBGTl9ET1dOKGVuZCAt
IG1hcF9lKSwgUEFHRV9IWVBFUlZJU09SKTsKPiAKPiBXaHkgZG9uJ3QgeW91IGp1c3QgcmVtb3Zl
IHRoZSBjYWxscyB0byBtYXBfcGFnZXNfdG9feGVuPwo+IAoKTXkgaW50ZW50aW9uIGlzIHRvIHBy
ZS1wb3B1bGF0ZSB0aGUgcmFuZ2Ugc28gdGhhdCB3ZSBkb24ndCBoYXZlIHRvIGRvIHNvIGxhdGVy
IAp3aGVuIHRoZXJlIGFyZSB4ZW5oZWFwIGFsbG9jYXRpb25zLiBCdXQgb2YgY291cnNlIGlmIHRo
ZXJlIGlzIHN1cGVycGFnZSBtZXJnaW5nIApvciBzaGF0dGVyaW5nLCBwYWdlIHRhYmxlcyB3aWxs
IGJlIHJlbW92ZWQgb3IgYWxsb2NhdGVkIGFueXdheS4gSSB3aWxsIHJlbW92ZSAKdGhlIGNhbGxz
IGluIHRoZSBuZXh0IHJldmlzaW9uLgoKPj4gICAgICAgICAgICAgICAgICAgaW5pdF9ib290X3Bh
Z2VzKG1hcF9lLCBlbmQpOwo+PiAgICAgICAgICAgICAgICAgICBtYXBfZSA9IGVuZDsKPj4gQEAg
LTEzODIsNyArMTM4Miw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2ln
bmVkIGxvbmcgbWJpX3ApCj4+ICAgICAgICAgICB9Cj4+ICAgICAgICAgICBpZiAoIHMgPCBtYXBf
cyApCj4+ICAgICAgICAgICB7Cj4+IC0gICAgICAgICAgICBtYXBfcGFnZXNfdG9feGVuKCh1bnNp
Z25lZCBsb25nKV9fdmEocyksIG1hZGRyX3RvX21mbihzKSwKPj4gKyAgICAgICAgICAgIG1hcF9w
YWdlc190b194ZW4oKHVuc2lnbmVkIGxvbmcpX192YShzKSwgSU5WQUxJRF9NRk4sCj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQRk5fRE9XTihtYXBfcyAtIHMpLCBQQUdFX0hZUEVS
VklTT1IpOwo+PiAgICAgICAgICAgICAgIGluaXRfYm9vdF9wYWdlcyhzLCBtYXBfcyk7Cj4+ICAg
ICAgICAgICB9Cj4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYyBiL3hlbi9j
b21tb24vcGFnZV9hbGxvYy5jCj4+IGluZGV4IGEwMGRiNGMwZDkuLmRlZWVhYzA2NWMgMTAwNjQ0
Cj4+IC0tLSBhL3hlbi9jb21tb24vcGFnZV9hbGxvYy5jCj4+ICsrKyBiL3hlbi9jb21tb24vcGFn
ZV9hbGxvYy5jCj4+IEBAIC0yMTU3LDcgKzIxNTcsNyBAQCB2b2lkICphbGxvY194ZW5oZWFwX3Bh
Z2VzKHVuc2lnbmVkIGludCBvcmRlciwgdW5zaWduZWQgaW50IG1lbWZsYWdzKQo+PiAgICAgICBt
YXBfcGFnZXNfdG9feGVuKCh1bnNpZ25lZCBsb25nKXJldCwgcGFnZV90b19tZm4ocGcpLAo+PiAg
ICAgICAgICAgICAgICAgICAgICAgIDFVTCA8PCBvcmRlciwgUEFHRV9IWVBFUlZJU09SKTsKPj4g
ICAKPj4gLSAgICByZXR1cm4gcGFnZV90b192aXJ0KHBnKTsKPj4gKyAgICByZXR1cm4gcmV0Owo+
IAo+IFRoaXMgaHVuayBpcyBhIGZpeCB0byBhIHByZXZpb3VzIHBhdGNoLiBJdCBkb2Vzbid0IGJl
bG93IGhlcmUuCj4gCk5vdGVkLgoKSG9uZ3lhbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
