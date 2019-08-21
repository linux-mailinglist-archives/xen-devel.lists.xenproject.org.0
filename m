Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105C9983EB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2019 21:03:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0VqN-0002au-7p; Wed, 21 Aug 2019 19:00:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BiIg=WR=amazon.de=prvs=129f3311c=wipawel@srs-us1.protection.inumbo.net>)
 id 1i0VqL-0002ah-Hq
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2019 19:00:25 +0000
X-Inumbo-ID: ee9b0f4e-c445-11e9-adc9-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee9b0f4e-c445-11e9-adc9-12813bfff9fa;
 Wed, 21 Aug 2019 19:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1566414024; x=1597950024;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=B2jTxQKmcVlXRI7W695RGdAozKJ4KWESqTNV3smk5eA=;
 b=BxIsoi6cJ7a7Ku82YU7LTTEKhNEj24zMKlQ4sfDq8P1A0l2IWdH5P605
 3xj8KMTCrJm1gfJsqR/ucYiGmqOBU+Lf1bYFIojNLhAlqiU/3X92iOU/8
 4Jv/ePLUdCDr2XUFOn70WW5FZv3xEimcUlJjKbO4xQbdvDJ6bHD9xFhqS E=;
X-IronPort-AV: E=Sophos;i="5.64,412,1559520000"; d="scan'208";a="410898989"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 21 Aug 2019 19:00:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id 011CBA26C1; Wed, 21 Aug 2019 19:00:20 +0000 (UTC)
Received: from EX13D05EUB003.ant.amazon.com (10.43.166.253) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:00:20 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB003.ant.amazon.com (10.43.166.253) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 21 Aug 2019 19:00:19 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 21 Aug 2019 19:00:19 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Thread-Topic: [PATCH 09/14] livepatch: Add per-function applied/reverted state
 tracking marker
Thread-Index: AQHVV/lI+OhiRe5NgkKqw74UV0kjMKcF7HcAgAAI7oA=
Date: Wed, 21 Aug 2019 19:00:19 +0000
Message-ID: <05530A0A-606F-4693-B721-0E6FE134F756@amazon.com>
References: <20190821081931.90887-1-wipawel@amazon.de>
 <20190821081931.90887-10-wipawel@amazon.de>
 <e4458dba-a515-4b4b-b3c7-0f71565f9ee0@oracle.com>
In-Reply-To: <e4458dba-a515-4b4b-b3c7-0f71565f9ee0@oracle.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.55]
Content-ID: <29FD17042C29E24C84C36A7FC6881591@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 09/14] livepatch: Add per-function
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Ross Lagerwall <ross.lagerwall@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>, "Wieczorkiewicz,
 Pawel" <wipawel@amazon.de>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cj4gT24gMjEuIEF1ZyAyMDE5LCBhdCAyMDoyOCwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPiB3cm90ZToKPiAKPiBPbiA4LzIxLzE5IDQ6MTkgQU0sIFBhd2Vs
IFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+PiAgc3RydWN0IGxpdmVwYXRjaF9mdW5jIHsKPj4gICAg
ICBjb25zdCBjaGFyICpuYW1lOyAgICAgICAvKiBOYW1lIG9mIGZ1bmN0aW9uIHRvIGJlIHBhdGNo
ZWQuICovCj4+ICAgICAgdm9pZCAqbmV3X2FkZHI7Cj4+IEBAIC04MzQsNiArODM5LDEwIEBAIHN0
cnVjdCBsaXZlcGF0Y2hfZnVuYyB7Cj4+ICAgICAgdWludDMyX3Qgb2xkX3NpemU7Cj4+ICAgICAg
dWludDhfdCB2ZXJzaW9uOyAgICAgICAgLyogTVVTVCBiZSBMSVZFUEFUQ0hfUEFZTE9BRF9WRVJT
SU9OLiAqLwo+PiAgICAgIHVpbnQ4X3Qgb3BhcXVlWzMxXTsKPj4gKyNpZiBkZWZpbmVkIENPTkZJ
R19YODYKPj4gKyAgICB1aW50OF90IGFwcGxpZWQ7Cj4+ICsgICAgdWludDhfdCBfcGFkWzddOwo+
PiArI2VuZGlmCj4gCj4gUmVwbHlpbmcgaGVyZSBhcyB3ZWxsLiBDb3VsZCB5b3UgdXNlIHBhcnQg
b2YgdGhlICdvcGFxdWVbMzFdJyBzcGFjZSBpbnN0ZWFkIGZvciB0aGlzIGZpZWxkPwoKCk5vLCBh
cyBleHBsYWluZWQgZWFybGllciwgSSBtdXN0IG5vdCBkbyB0aGF0LiBUaGUgb3BhcXVlW10gaXMg
bm90IGEgcGFkZGluZy4KCkJlc3QgUmVnYXJkcywKUGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKQW1h
em9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcg
QmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJi
cmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2VyaWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIg
MTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1JRDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
