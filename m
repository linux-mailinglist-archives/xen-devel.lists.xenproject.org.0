Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FFEC1FF5
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 13:28:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEtpX-0002Mx-06; Mon, 30 Sep 2019 11:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ff+y=XZ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iEtpU-0002Mi-M8
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 11:27:00 +0000
X-Inumbo-ID: 37741f78-e375-11e9-97fb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 37741f78-e375-11e9-97fb-bc764e2007e4;
 Mon, 30 Sep 2019 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569842821;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1+IUhCq00a9gZRD9fqPYA7LJ2hmbmjD31c63cYaWRV0=;
 b=CeRdMICCAmlbPJCb8B/rs1vjtPiHW224c++qfSap/83I49rzxWY15cH6
 CtkWBRG0yIq0ZAeOEngvUIIWY8cxSEPLZRK3VIRhdpqqnynQLTZEoZFky
 nFv7NOOCwcXObC6JQVDNRDUbjqlhSAVHL0TQ7+u9JXe0D3g5W/cAEsNvD 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: vvleuKu1+whoNf/h5dGkCtLWkS2kNX7IZ46n0UUY5QQIdsYIkclkiHZtwedMrMxYjMVrGahnYC
 qbSR9Tz6pkFQcApJJ0oCfZsQJS52Ofx8xioccT2XSZrtMa62fahaI8muiA8qP7Lo9ZOkNODa+b
 vA+Sa9BNQaBGKMfkk8mo74RAhQ3CchbVaTSjNSKirZDcA04qFXDAwwQNwynOtpuOPsQKuDnW2A
 x2kuTkTObarkP9F2xcamekDMzKXYO4is1IJ0mMVf+yKN1KmOQjDH7VV65NWAJ6vUJlVbsyCAfj
 aBM=
X-SBRS: 2.7
X-MesageID: 6315971
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,567,1559534400"; 
   d="scan'208";a="6315971"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <julien.grall@arm.com>, <andrew.cooper3@citrix.com>, <wei.liu2@citrix.com>,
 <George.Dunlap@eu.citrix.com>, <ian.jackson@eu.citrix.com>, "Oleksandr
 Andrushchenko" <andr2000@gmail.com>, <sstabellini@kernel.org>,
 <xen-devel@lists.xenproject.org>, <konrad.wilk@oracle.com>, Jan Beulich
 <jbeulich@suse.com>
References: <20190930085659.708-1-andr2000@gmail.com>
 <9df7bc3c-8019-ee76-983c-c43befc3662a@citrix.com>
 <4c84b6a3-9cb6-3fc4-8283-f52cc280c16e@citrix.com>
 <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <1547ccdf-b696-9054-7148-8a03773a13a8@citrix.com>
Date: Mon, 30 Sep 2019 12:26:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <196f1dc7-f291-d728-1617-dbf46240f966@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Add PV display/sound,
 update keyboard
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
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOS8zMC8xOSAxMTo1MyBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAzMC4wOS4xOSAx
MjozMywgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gOS8zMC8xOSAxMToyOSBBTSwgR2Vvcmdl
IER1bmxhcCB3cm90ZToKPj4+IE9uIDkvMzAvMTkgOTo1NiBBTSwgT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gd3JvdGU6Cj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28KPj4+PiA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+
Cj4+Pj4gLS0tCj4+Pj4gwqAgU1VQUE9SVC5tZCB8IDE1ICsrKysrKysrKysrKysrLQo+Pj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pj4KPj4+
PiBkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKPj4+PiBpbmRleCAzNzU0NzNh
NDU2NDAuLmI1MzZjZjA4MTRmMyAxMDA2NDQKPj4+PiAtLS0gYS9TVVBQT1JULm1kCj4+Pj4gKysr
IGIvU1VQUE9SVC5tZAo+Pj4+IEBAIC0zNzIsNiArMzcyLDEyIEBAIEd1ZXN0LXNpZGUgZHJpdmVy
IGNhcGFibGUgb2Ygc3BlYWtpbmcgdGhlIFhlbgo+Pj4+IFBWIEZyYW1lYnVmZmVyIHByb3RvY29s
Cj4+Pj4gwqAgwqDCoMKgwqDCoCBTdGF0dXMsIExpbnV4ICh4ZW4tZmJmcm9udCk6IFN1cHBvcnRl
ZAo+Pj4+IMKgICsjIyMgUFYgZGlzcGxheSAoZnJvbnRlbmQpCj4+Pj4gKwo+Pj4+ICtHdWVzdC1z
aWRlIGRyaXZlciBjYXBhYmxlIG9mIHNwZWFraW5nIHRoZSBYZW4gUFYgZGlzcGxheSBwcm90b2Nv
bAo+Pj4+ICsKPj4+PiArwqDCoMKgIFN0YXR1cywgTGludXg6IFN1cHBvcnRlZAo+Pj4KPj4+ICJT
dXBwb3J0ZWQiIGhhcyBpbXBsaWNhdGlvbnMgZm9yIHRoZSBzZWN1cml0eSB0ZWFtOiBuYW1lbHks
IGlmIGEKPj4+IHNlY3VyaXR5IGlzc3VlIGlzIGRpc2NvdmVyZWQsIHdlIHdpbGwgaXNzdWUgYW4g
WFNBLsKgIEp1ZXJnZW4sIGFyZSB5b3UKPj4+IHNhdGlzZmllZCB0aGF0IHRoZSBQViBkaXNwbGF5
IC8gc291bmQgZHJpdmVycyBhcmUgb2Ygc3VmZmljaWVudCBxdWFsaXR5Cj4+PiB0aGF0IHdlIGNh
biByZWNvbW1lbmQgcGVvcGxlIHVzZSB0aGVtPwo+Pgo+PiBTb3JyeSwgSSBtZWFudCB0byBhZGQ6
ICJJbiB0aGUgZmFjZSBvZiBhbiBhY3RpdmUgYWR2ZXJzYXJ5Ii4KPiAKPiBZZXMsIEkgdGhpbmsg
InN1cHBvcnRlZCIgaXMgZmluZS4KCkluIHRoYXQgY2FzZToKCkFja2VkLWJ5OiBHZW9yZ2UgRHVu
bGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
